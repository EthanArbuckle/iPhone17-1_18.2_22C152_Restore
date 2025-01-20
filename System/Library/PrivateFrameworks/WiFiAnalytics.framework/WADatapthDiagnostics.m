@interface WADatapthDiagnostics
- (PBCodable)awdReport;
- (WADatapthDiagnostics)initWithWADatapthDiagnosticsReport:(const void *)a3 length:(unint64_t)a4;
- (int)action;
- (unsigned)awdMetricID;
- (void)setAwdMetricID:(unsigned int)a3;
- (void)setAwdReport:(id)a3;
@end

@implementation WADatapthDiagnostics

- (WADatapthDiagnostics)initWithWADatapthDiagnosticsReport:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)WADatapthDiagnostics;
  v6 = [(WADatapthDiagnostics *)&v19 init];
  v7 = (void *)MEMORY[0x223C0F2E0]();
  v8 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
  if (!v8)
  {
    v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
      __int16 v22 = 1024;
      int v23 = 50;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultData failed", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v6->_action = 2;
  id v18 = 0;
  uint64_t v9 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v18];
  v10 = v18;
  awdReport = v6->_awdReport;
  v6->_awdReport = (PBCodable *)v9;

  if (v6->_awdReport) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
      __int16 v22 = 1024;
      int v23 = 56;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessage: %@", buf, 0x1Cu);
    }

LABEL_16:
    v14 = 0;
    goto LABEL_10;
  }

  v13 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
    __int16 v22 = 1024;
    int v23 = 58;
    _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_INFO, "%{public}s::%d:Success", buf, 0x12u);
  }

  v14 = v6;
LABEL_10:

  return v14;
}

- (unsigned)awdMetricID
{
  if (self->_awdMetricID) {
    return self->_awdMetricID;
  }
  else {
    return 589928;
  }
}

- (PBCodable)awdReport
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  awdReport = self->_awdReport;
  if (!awdReport)
  {
    v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      v13 = "-[WADatapthDiagnostics awdReport]";
      __int16 v14 = 1024;
      int v15 = 75;
      v11 = "%{public}s::%d:_awdReport missing";
LABEL_13:
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    }
LABEL_14:

    v8 = 0;
    goto LABEL_6;
  }
  v4 = [(PBCodable *)awdReport stallNotifications];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      v13 = "-[WADatapthDiagnostics awdReport]";
      __int16 v14 = 1024;
      int v15 = 78;
      v11 = "%{public}s::%d:_awdReport 0 stallNotifications";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  [(WADatapthDiagnostics *)self setAwdMetricID:589928];
  v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_awdReport;
    int v12 = 136446722;
    v13 = "-[WADatapthDiagnostics awdReport]";
    __int16 v14 = 1024;
    int v15 = 85;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Generated wifi datapath diagnostics report: %{public}@", (uint8_t *)&v12, 0x1Cu);
  }

  v8 = self->_awdReport;
LABEL_6:
  return v8;
}

- (void)setAwdReport:(id)a3
{
}

- (void)setAwdMetricID:(unsigned int)a3
{
  self->_awdMetricID = a3;
}

- (int)action
{
  return self->_action;
}

- (void).cxx_destruct
{
}

@end