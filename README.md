# 托育收费与家庭负担分析

tariffs 处理收费、日期、舍入和补助叠加；households 保存家庭及收入分类；analysis 生成家庭月结果与方案比较；publication 负责版本、查询、公开抑制和交付包。

金额使用整数分，年家庭收入不等于人均收入。押金、净经营费用和现金支出分列。权重与观测单位需在汇总中保留，收入缺失不是零收入。演练家庭均为合成记录，内部明细与公开摘要的披露范围不同。

## 运行

Python 3.11，使用标准库及内置 SQLite，无第三方依赖。无需安装第三方包。 在项目根目录执行，命令不访问公网。演示在临时目录内创建数据，结束后自行清理，不需要预置凭据或另启服务。

```sh
python3 nursery_report.py demo --fixture fixtures/county.json
```

## 开发检查

测试覆盖当前产品的核心计算、边界输入、事务或版本恢复及异常路径。编译或语法检查可单独运行。

```sh
python3 -m unittest discover -s tests -v
python3 -m compileall -q tariffs households analysis publication nursery_report.py
```

## 容器复现

先在有网络的准备阶段取得运行镜像。之后可在断网容器中复制项目到临时工作区运行，避免向源目录写入缓存。

```sh
docker build -t local/analysis-product .
docker run --rm --network none local/analysis-product
```

具体接口参数可通过主入口的帮助命令查看。数据库、归档和导出文件应存入调用者指定的工作目录，不提交到源码仓库。
