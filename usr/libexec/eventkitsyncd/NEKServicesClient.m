@interface NEKServicesClient
+ (id)log;
- (NEKEnvironment)environment;
- (NEKServicesClient)initWithConnection:(id)a3 andEnvironment:(id)a4;
- (id)_syncReport;
- (void)dumpDiagnosticsWithCompletion:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation NEKServicesClient

+ (id)log
{
  if (qword_1000C6BC0 != -1) {
    dispatch_once(&qword_1000C6BC0, &stru_1000A9308);
  }
  v2 = (void *)qword_1000C6BC8;

  return v2;
}

- (NEKServicesClient)initWithConnection:(id)a3 andEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NEKServicesClient;
  v9 = [(NEKServicesClient *)&v15 init];
  if (v9)
  {
    v10 = +[NEKServicesClient log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "initializing", v14, 2u);
    }

    v11 = (EKSSLogger *)[objc_alloc((Class)EKSSLogger) initWithString:@"NEKServicesClient logger initialized"];
    logger = v9->_logger;
    v9->_logger = v11;

    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_environment, a4);
  }

  return v9;
}

- (void)dumpDiagnosticsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, EKSSLogger *))a3;
  v5 = +[NSMutableDictionary dictionary];
  [(EKSSLogger *)self->_logger timestampLogForString:@"Gathering tinyStore dictionaryRepresentation"];
  v6 = [(NEKEnvironment *)self->_environment tinyStore];
  id v7 = [v6 asDictionary];

  id v8 = [(NEKServicesClient *)self _syncReport];
  v9 = [v8 objectForKeyedSubscript:@"Duplicates"];
  [v7 setObject:v9 forKeyedSubscript:@"Duplicates"];

  v10 = [v8 objectForKeyedSubscript:@"Drift"];
  [v7 setObject:v10 forKeyedSubscript:@"Drift"];

  v11 = +[NEKServicesClient log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10006DDBC((uint64_t)v7, v11);
  }

  [(EKSSLogger *)self->_logger timestampLogForString:@"Encoding diagnosticDictionary to JSON"];
  id v24 = 0;
  v12 = +[NSJSONSerialization dataWithJSONObject:v7 options:11 error:&v24];
  id v13 = v24;
  logger = self->_logger;
  objc_super v15 = +[NSString stringWithFormat:@"Encoding complete with error: %@", v13];
  [(EKSSLogger *)logger timestampLogForString:v15];

  v16 = EKSSDiagnosticsDirectory();
  v17 = [v16 URLByAppendingPathComponent:@"Companion-DiagnosticData.txt"];

  v18 = self->_logger;
  v19 = +[NSString stringWithFormat:@"Writing diagnostics to URL: %@", v17];
  [(EKSSLogger *)v18 timestampLogForString:v19];

  id v23 = v13;
  [v12 writeToURL:v17 options:0x10000000 error:&v23];
  id v20 = v23;

  v21 = self->_logger;
  v22 = +[NSString stringWithFormat:@"Writing diagnostics complete with error: %@", v20];
  [(EKSSLogger *)v21 timestampLogForString:v22];

  v4[2](v4, v17, self->_logger);
}

- (id)_syncReport
{
  [(EKSSLogger *)self->_logger timestampLogForString:@"Diagnostics opening syncReport"];
  v3 = +[NEKAnalyticsReporter syncReportFilePath];
  v4 = +[NSData dataWithContentsOfFile:v3];
  id v10 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v10];
  id v6 = v10;
  logger = self->_logger;
  id v8 = +[NSString stringWithFormat:@"Diagnostics opened syncReport with error: %@", v6];
  [(EKSSLogger *)logger timestampLogForString:v8];

  return v5;
}

- (NEKEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end