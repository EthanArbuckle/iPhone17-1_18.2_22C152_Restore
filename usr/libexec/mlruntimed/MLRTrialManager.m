@interface MLRTrialManager
- (MLRTrialManager)init;
- (MLRTrialManager)initWithProvider:(id)a3;
- (NSMutableDictionary)shadowExperimentTasks;
- (id)shadowExperimentTasksForPluginID:(id)a3;
@end

@implementation MLRTrialManager

- (MLRTrialManager)init
{
  v3 = +[TRIEvaluationStatus freshProvider];
  v4 = [(MLRTrialManager *)self initWithProvider:v3];

  return v4;
}

- (MLRTrialManager)initWithProvider:(id)a3
{
  id v4 = a3;
  if (objc_opt_class())
  {
    v23.receiver = self;
    v23.super_class = (Class)MLRTrialManager;
    v5 = [(MLRTrialManager *)&v23 init];
    if (v5)
    {
      v6 = +[NSMutableDictionary dictionary];
      if (!v4)
      {
        v7 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100004E04(v7);
        }
      }
      id v22 = 0;
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      v19 = sub_100004B08;
      v20 = &unk_100018640;
      v8 = v6;
      v21 = v8;
      unsigned __int8 v9 = [v4 enumerateActiveEvaluationsForMLRuntimeWithError:&v22 block:&v17];
      id v10 = v22;
      if ((v9 & 1) == 0)
      {
        v11 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100004D8C((uint64_t)v10, v11);
        }
      }
      shadowExperimentTasks = v5->_shadowExperimentTasks;
      v5->_shadowExperimentTasks = v8;
      v13 = v8;
    }
    self = v5;
    v14 = self;
  }
  else
  {
    v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100004D48(v15);
    }

    v14 = 0;
  }

  return v14;
}

- (id)shadowExperimentTasksForPluginID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Nil pluginID" userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = v4;
  v6 = [(NSMutableDictionary *)self->_shadowExperimentTasks objectForKeyedSubscript:v4];

  return v6;
}

- (NSMutableDictionary)shadowExperimentTasks
{
  return self->_shadowExperimentTasks;
}

- (void).cxx_destruct
{
}

@end