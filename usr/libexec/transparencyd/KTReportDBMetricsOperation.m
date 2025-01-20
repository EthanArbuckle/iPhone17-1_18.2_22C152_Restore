@interface KTReportDBMetricsOperation
- (KTOperationDependencies)deps;
- (KTReportDBMetricsOperation)initWithDependencies:(id)a3;
- (void)groupStart;
- (void)logSharedMetrics;
- (void)setDeps:(id)a3;
@end

@implementation KTReportDBMetricsOperation

- (KTReportDBMetricsOperation)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTReportDBMetricsOperation;
  v6 = [(KTGroupOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deps, a3);
  }

  return v7;
}

- (void)groupStart
{
  if (qword_1003267D0 != -1) {
    dispatch_once(&qword_1003267D0, &stru_1002BB368);
  }
  v3 = qword_1003267D8;
  if (os_log_type_enabled((os_log_t)qword_1003267D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: start", buf, 2u);
  }
  [(KTReportDBMetricsOperation *)self logSharedMetrics];
  v4 = [(KTReportDBMetricsOperation *)self deps];
  id v5 = [v4 dataStore];
  [v5 logMetricsForApplication:kKTApplicationIdentifierIDS error:0];

  v6 = [(KTReportDBMetricsOperation *)self deps];
  v7 = [v6 dataStore];
  [v7 logMetricsForApplication:kKTApplicationIdentifierIDSFaceTime error:0];

  v8 = [(KTReportDBMetricsOperation *)self deps];
  objc_super v9 = [v8 dataStore];
  [v9 logMetricsForApplication:kKTApplicationIdentifierIDSMultiplex error:0];

  if (qword_1003267D0 != -1) {
    dispatch_once(&qword_1003267D0, &stru_1002BB388);
  }
  v10 = qword_1003267D8;
  if (os_log_type_enabled((os_log_t)qword_1003267D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: end", v11, 2u);
  }
}

- (void)logSharedMetrics
{
  id v13 = 0;
  int64_t v3 = +[TransparencyFileSupport directorySizeInKB:&v13];
  id v4 = v13;
  if (v3 < 0)
  {
    if (qword_1003267D0 != -1) {
      dispatch_once(&qword_1003267D0, &stru_1002BB3A8);
    }
    id v5 = qword_1003267D8;
    if (os_log_type_enabled((os_log_t)qword_1003267D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to get support directory size: %@", buf, 0xCu);
    }
  }
  v6 = [(KTReportDBMetricsOperation *)self deps];
  v7 = [v6 logger];
  v8 = +[NSNumber numberWithInteger:v3];
  [v7 logMetric:v8 withName:@"ktTotalStorageSize"];

  objc_super v9 = [(KTReportDBMetricsOperation *)self deps];
  v10 = [v9 dataStore];
  id v12 = v4;
  [v10 logSTHMetricsForApplication:kKTApplicationIdentifierTLT error:&v12];
  id v11 = v12;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end