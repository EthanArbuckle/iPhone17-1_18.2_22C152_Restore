@interface FRTimeAndCountAwareLimitedPersonalizationDataGenerator
- (FCCoreConfigurationManager)configurationManager;
- (FCPersonalizationDataGeneratorType)generator;
- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)init;
- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)initWithGenerator:(id)a3 configurationManager:(id)a4;
- (void)generateDerivedDataWithMaxAggregateCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
@end

@implementation FRTimeAndCountAwareLimitedPersonalizationDataGenerator

- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)initWithGenerator:(id)a3 configurationManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007A018();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079F38();
  }
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRTimeAndCountAwareLimitedPersonalizationDataGenerator;
  v9 = [(FRTimeAndCountAwareLimitedPersonalizationDataGenerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_generator, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
  }

  return v10;
}

- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator init]";
    __int16 v7 = 2080;
    id v8 = "FRLimitedPersonalizationDataGenerator.m";
    __int16 v9 = 1024;
    int v10 = 23;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)generateDerivedDataWithMaxAggregateCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = FCDispatchQueueForQualityOfService();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062290;
  block[3] = &unk_1000C9F68;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a3;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (FCPersonalizationDataGeneratorType)generator
{
  return self->_generator;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_storeStrong((id *)&self->_generator, 0);
}

@end