@interface PLCoreAgent
- (PLCoreAgent)init;
- (void)startAgents;
@end

@implementation PLCoreAgent

- (PLCoreAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCoreAgent;
  return [(PLCoreOperator *)&v3 init];
}

- (void)startAgents
{
  objc_super v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Agents", buf, 2u);
  }

  uint64_t v4 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)PLCoreAgent;
  [(PLCoreOperator *)&v5 startOperatorsOfSuperClassType:v4];
}

@end