@interface FTWidgetLingerState
- (FTWidgetLingerState)init;
- (FTWidgetLingerState)initWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 widgetDisplayMode:(unint64_t)a5 appearanceType:(unint64_t)a6;
- (NSNumber)appConfigTreatmentID;
- (NSString)todaySourceIdentifier;
- (unint64_t)appearanceType;
- (unint64_t)widgetDisplayMode;
@end

@implementation FTWidgetLingerState

- (FTWidgetLingerState)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTWidgetLingerState init]";
    __int16 v7 = 2080;
    v8 = "FTWidgetLingerEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 35;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTWidgetLingerState init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (FTWidgetLingerState)initWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 widgetDisplayMode:(unint64_t)a5 appearanceType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E4F04();
  }
  v18.receiver = self;
  v18.super_class = (Class)FTWidgetLingerState;
  id v12 = [(FTWidgetLingerState *)&v18 init];
  if (v12)
  {
    v13 = (NSString *)[v10 copy];
    todaySourceIdentifier = v12->_todaySourceIdentifier;
    v12->_todaySourceIdentifier = v13;

    v15 = (NSNumber *)[v11 copy];
    appConfigTreatmentID = v12->_appConfigTreatmentID;
    v12->_appConfigTreatmentID = v15;

    v12->_widgetDisplayMode = a5;
    v12->_appearanceType = a6;
  }

  return v12;
}

- (NSString)todaySourceIdentifier
{
  return self->_todaySourceIdentifier;
}

- (NSNumber)appConfigTreatmentID
{
  return self->_appConfigTreatmentID;
}

- (unint64_t)widgetDisplayMode
{
  return self->_widgetDisplayMode;
}

- (unint64_t)appearanceType
{
  return self->_appearanceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigTreatmentID, 0);

  objc_storeStrong((id *)&self->_todaySourceIdentifier, 0);
}

@end