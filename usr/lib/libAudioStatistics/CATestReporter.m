@interface CATestReporter
- (CATestReporter)initWithNewReporterID;
@end

@implementation CATestReporter

- (CATestReporter)initWithNewReporterID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    v13.receiver = self;
    v13.super_class = (Class)CATestReporter;
    v3 = [(CAReporter *)&v13 initWithNewReporterID];
    v4 = v3;
    if (v3)
    {
      v12.receiver = v3;
      v12.super_class = (Class)CATestReporter;
      [(CAReporter *)&v12 setServiceType:11];
    }
  }
  else
  {
    v5 = *(id *)AA_ClientCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "CAReportingClient.mm";
      __int16 v16 = 1024;
      int v17 = 478;
      _os_log_impl(&dword_19025C000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CATestReporter initWithNewReporterID called", buf, 0x12u);
    }
    v11.receiver = self;
    v11.super_class = (Class)CATestReporter;
    v4 = [(CAReporter *)&v11 initWithNewReporterID];
    if (v4)
    {
      v6 = *(id *)AA_ClientCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(CAReporter *)v4 reporterID];
        *(_DWORD *)buf = 136315650;
        v15 = "CAReportingClient.mm";
        __int16 v16 = 1024;
        int v17 = 482;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        _os_log_impl(&dword_19025C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CATestReporter initWithNewReporterID { careporter_id=%lli }", buf, 0x1Cu);
      }

      v8 = +[CAReportingClient sharedInstance];
      [v8 setServiceType:11 reporterID:-[CAReporter reporterID](v4, "reporterID")];
    }
  }
  v9 = v4;

  return v9;
}

@end