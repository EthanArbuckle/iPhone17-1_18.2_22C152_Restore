@interface PSUICellularDiagnosticsSpecifier
- (BOOL)cellularIssueDetected;
- (BOOL)cellularIssueFound;
- (BOOL)needToShowHelpLink;
- (PSUICellularDiagnosticsSpecifier)init;
- (PSUICellularDiagnosticsSpecifier)initWithRadioCache:(id)a3;
- (PSUICoreTelephonyRadioCache)radioCache;
- (id)getDiagnosticsStatusRecommendation;
- (id)getDiagnosticsStatusText;
- (id)getLogger;
- (int)cellularStatus;
- (int64_t)cellularDiagCode;
- (int64_t)getDiagnosticsDetailsCode;
- (void)getCellularDiagnosticsStatus;
- (void)setRadioCache:(id)a3;
@end

@implementation PSUICellularDiagnosticsSpecifier

- (PSUICellularDiagnosticsSpecifier)init
{
  v3 = +[PSUICoreTelephonyRadioCache sharedInstance];
  v4 = [(PSUICellularDiagnosticsSpecifier *)self initWithRadioCache:v3];

  return v4;
}

- (PSUICellularDiagnosticsSpecifier)initWithRadioCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(PSUICellularDiagnosticsSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSUICellularDiagnosticsSpecifier initWithRadioCache:]";
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"CELLULAR_DIAGNOSTICS_STATUS" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v9 = objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDiagnosticsSpecifier;
  v10 = [(PSUICellularDiagnosticsSpecifier *)&v12 initWithName:v8 target:self set:0 get:sel_getCellularDiagnosticsRunResult_ detail:v9 cell:2 edit:0];

  if (v10)
  {
    [(PSUICellularDiagnosticsSpecifier *)v10 setIdentifier:@"CELLULAR_DIAGNOSTICS_ID"];
    objc_storeStrong((id *)&v10->_radioCache, a3);
    v10->_cellularIssueDetected = 0;
    v10->_cellularDiagCode = -255;
    [(PSUICellularDiagnosticsSpecifier *)v10 getCellularDiagnosticsStatus];
  }

  return v10;
}

- (BOOL)cellularIssueFound
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(PSUICellularDiagnosticsSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL cellularIssueDetected = self->_cellularIssueDetected;
    int v6 = 136315394;
    v7 = "-[PSUICellularDiagnosticsSpecifier cellularIssueFound]";
    __int16 v8 = 1024;
    BOOL v9 = cellularIssueDetected;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
  }

  return self->_cellularIssueDetected;
}

- (void)getCellularDiagnosticsStatus
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  self->_int cellularStatus = [(PSUICoreTelephonyRadioCache *)self->_radioCache checkCellularHealthStatus];
  self->_cellularDiagCode = [(PSUICoreTelephonyRadioCache *)self->_radioCache getCellularHealthDiagnosticsCode];
  self->_BOOL cellularIssueDetected = self->_cellularStatus == 1;
  v3 = [(PSUICellularDiagnosticsSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int cellularStatus = self->_cellularStatus;
    int v5 = 136315394;
    int v6 = "-[PSUICellularDiagnosticsSpecifier getCellularDiagnosticsStatus]";
    __int16 v7 = 1024;
    int v8 = cellularStatus;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }
}

- (BOOL)needToShowHelpLink
{
  return self->_cellularStatus == 1;
}

- (id)getDiagnosticsStatusText
{
  [(PSUICellularDiagnosticsSpecifier *)self getCellularDiagnosticsStatus];
  if (self->_cellularStatus == 1)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    int v5 = @"CELLULAR_DIAGNOSTICS_ISSUE";
  }
  else
  {
    self->_BOOL cellularIssueDetected = 0;
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    int v5 = @"CELLULAR_DIAGNOSTICS_HEALTHY";
  }
  int v6 = [v3 localizedStringForKey:v5 value:&stru_26D410CA0 table:@"Cellular"];

  return v6;
}

- (id)getDiagnosticsStatusRecommendation
{
  int cellularStatus = self->_cellularStatus;
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = v3;
  if (cellularStatus == 1) {
    int v5 = @"CELLULAR_DIAGNOSTICS_RECOMMEND_ISSUE";
  }
  else {
    int v5 = @"CELLULAR_DIAGNOSTICS_RECOMMEND_HEALTHY";
  }
  int v6 = [v3 localizedStringForKey:v5 value:&stru_26D410CA0 table:@"Cellular"];

  return v6;
}

- (int64_t)getDiagnosticsDetailsCode
{
  return self->_cellularDiagCode;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDiagnostics"];
}

- (BOOL)cellularIssueDetected
{
  return self->_cellularIssueDetected;
}

- (int)cellularStatus
{
  return self->_cellularStatus;
}

- (int64_t)cellularDiagCode
{
  return self->_cellularDiagCode;
}

- (PSUICoreTelephonyRadioCache)radioCache
{
  return self->_radioCache;
}

- (void)setRadioCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end