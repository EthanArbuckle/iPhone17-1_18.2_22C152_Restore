@interface ADAMSensorKitWriterFactory
+ (BOOL)IsMonitoringSiri;
+ (BOOL)IsMonitoringTelephony;
+ (id)GetSensorKitWriterWithIdentifier:(id)a3;
@end

@implementation ADAMSensorKitWriterFactory

+ (BOOL)IsMonitoringTelephony
{
  if (!objc_opt_class()) {
    return 0;
  }
  v2 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F17710]];
  v3 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F17708]];
  v4 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F17700]];
  if ([v2 isMonitoring] & 1) != 0 || (objc_msgSend(v3, "isMonitoring")) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isMonitoring];
  }

  return v5;
}

+ (BOOL)IsMonitoringSiri
{
  if (!objc_opt_class()) {
    return 0;
  }
  v2 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F176F8]];
  v3 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F176F0]];
  v4 = +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:*MEMORY[0x263F176E8]];
  if ([v2 isMonitoring] & 1) != 0 || (objc_msgSend(v3, "isMonitoring")) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isMonitoring];
  }

  return v5;
}

+ (id)GetSensorKitWriterWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!objc_opt_class()) {
    goto LABEL_12;
  }
  if (+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::once != -1) {
    dispatch_once(&+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::once, &__block_literal_global_404);
  }
  if (!+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict)
  {
LABEL_12:
    v4 = 0;
    goto LABEL_18;
  }
  v4 = [(id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict objectForKey:v3];

  if (!v4) {
    goto LABEL_18;
  }
  char v5 = [(id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict objectForKey:v3];
  v6 = [MEMORY[0x263EFF9D0] null];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = (void *)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict;
    v9 = (void *)[objc_alloc(MEMORY[0x263F176C0]) initWithIdentifier:v3];
    [v8 setObject:v9 forKey:v3];

    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v10 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      id v10 = (id)MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    v12 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict objectForKey:v3];
      int v15 = 136315906;
      v16 = "ADAMSensorKitWriterFactory.mm";
      __int16 v17 = 1024;
      int v18 = 60;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_2227C1000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created SRSensorWriter: [%@] for identifier: [%@]", (uint8_t *)&v15, 0x26u);
    }
  }
LABEL_17:
  v4 = [(id)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict objectForKey:v3];
LABEL_18:

  return v4;
}

void __63__ADAMSensorKitWriterFactory_GetSensorKitWriterWithIdentifier___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF9A0];
  v8 = [MEMORY[0x263EFF9D0] null];
  v1 = [MEMORY[0x263EFF9D0] null];
  v2 = [MEMORY[0x263EFF9D0] null];
  id v3 = [MEMORY[0x263EFF9D0] null];
  v4 = [MEMORY[0x263EFF9D0] null];
  char v5 = [MEMORY[0x263EFF9D0] null];
  uint64_t v6 = [v0 dictionaryWithObjectsAndKeys:v8, *MEMORY[0x263F17710], v1, *MEMORY[0x263F17708], v2, *MEMORY[0x263F17700], v3, *MEMORY[0x263F176F8], v4, *MEMORY[0x263F176F0], v5, *MEMORY[0x263F176E8], 0];
  int v7 = (void *)+[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict;
  +[ADAMSensorKitWriterFactory GetSensorKitWriterWithIdentifier:]::dict = v6;
}

@end