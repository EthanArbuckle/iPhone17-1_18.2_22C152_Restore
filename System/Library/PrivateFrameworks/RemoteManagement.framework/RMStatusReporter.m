@interface RMStatusReporter
+ (id)newStatusReporterWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4;
- (BOOL)onlyIfNeeded;
- (RMStatusEngine)statusEngine;
- (RMStatusReporter)initWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4;
- (RMStatusSubscriptionQueryResult)statusQueryResult;
- (id)statusReportReturningError:(id *)a3;
- (void)acknowledgeStatusSent;
- (void)setOnlyIfNeeded:(BOOL)a3;
- (void)setStatusEngine:(id)a3;
- (void)setStatusQueryResult:(id)a3;
@end

@implementation RMStatusReporter

+ (id)newStatusReporterWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[RMStatusReporter alloc] initWithStatusEngine:v5 onlyIfNeeded:v4];

  return v6;
}

- (RMStatusReporter)initWithStatusEngine:(id)a3 onlyIfNeeded:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMStatusReporter;
  v8 = [(RMStatusReporter *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_statusEngine, a3);
    v9->_onlyIfNeeded = a4;
    statusQueryResult = v9->_statusQueryResult;
    v9->_statusQueryResult = 0;
  }
  return v9;
}

- (id)statusReportReturningError:(id *)a3
{
  unsigned __int8 v5 = [(RMStatusReporter *)self onlyIfNeeded];
  v6 = [(RMStatusReporter *)self statusEngine];
  id v7 = v6;
  if (v5) {
    [v6 queryForUnacknowledgedStatusSubscriptions];
  }
  else {
  uint64_t v8 = [v6 queryForStatusSubscriptions];
  }
  [(RMStatusReporter *)self setStatusQueryResult:v8];

  v9 = [(RMStatusReporter *)self statusQueryResult];
  LOBYTE(v8) = [v9 hasStatusToReport];

  if (v8)
  {
    v10 = [(RMStatusReporter *)self statusQueryResult];
    v11 = objc_msgSend(v10, "protocolStatusReportWithFullReport:", -[RMStatusReporter onlyIfNeeded](self, "onlyIfNeeded") ^ 1);

    id v17 = 0;
    objc_super v12 = [v11 serializeAsDataWithType:1 error:&v17];
    v13 = v17;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v15 = +[RMLog statusReporter];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100068138((uint64_t)v13, v15);
      }

      if (a3 && v13) {
        *a3 = v13;
      }
    }
  }
  else
  {
    v13 = +[RMLog statusReporter];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000681B0(v13);
    }
    objc_super v12 = 0;
  }

  return v12;
}

- (void)acknowledgeStatusSent
{
  v3 = [(RMStatusReporter *)self statusQueryResult];
  unsigned int v4 = [v3 hasStatusToReport];

  if (v4)
  {
    id v6 = [(RMStatusReporter *)self statusEngine];
    unsigned __int8 v5 = [(RMStatusReporter *)self statusQueryResult];
    [v6 acknowledgeStatusSubscriptions:v5];
  }
}

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (BOOL)onlyIfNeeded
{
  return self->_onlyIfNeeded;
}

- (void)setOnlyIfNeeded:(BOOL)a3
{
  self->_onlyIfNeeded = a3;
}

- (RMStatusSubscriptionQueryResult)statusQueryResult
{
  return self->_statusQueryResult;
}

- (void)setStatusQueryResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusQueryResult, 0);

  objc_storeStrong((id *)&self->_statusEngine, 0);
}

@end