@interface _OSBatteryPredictor
+ (id)predictor;
- (BOOL)lowSOCPredicted;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (_OSBatteryPredictor)init;
- (id)lowSOCPredictionOutput;
- (id)lowSOCPredictionWithError:(id *)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation _OSBatteryPredictor

- (_OSBatteryPredictor)init
{
  v14.receiver = self;
  v14.super_class = (Class)_OSBatteryPredictor;
  v2 = [(_OSBatteryPredictor *)&v14 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "battery");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.OSIntelligence.battery" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;

    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F24CC178];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v7];

    objc_initWeak(&location, v2);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __27___OSBatteryPredictor_init__block_invoke;
    v11[3] = &unk_1E65AAC20;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27___OSBatteryPredictor_init__block_invoke_49;
    v9[3] = &unk_1E65AAC20;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v9];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)_OSBatteryPredictor;
  [(_OSBatteryPredictor *)&v4 dealloc];
}

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)lowSOCPredicted
{
  id v2 = [(_OSBatteryPredictor *)self lowSOCPredictionWithError:0];
  os_log_t v3 = v2;
  BOOL v7 = 0;
  if (v2)
  {
    [v2 confidence];
    double v5 = v4;
    [v3 confidenceThreshold];
    if (v5 > v6) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)lowSOCPredictionOutput
{
  return [(_OSBatteryPredictor *)self lowSOCPredictionWithError:0];
}

- (id)lowSOCPredictionWithError:(id *)a3
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CA50C000, log, OS_LOG_TYPE_INFO, "Requesting for low SOC prediction", v15, 2u);
  }
  double v5 = objc_alloc_init(_OSBatteryLowSOCPredictorOutput);
  [(_OSBatteryLowSOCPredictorOutput *)v5 setConfidence:0.0];
  [(_OSBatteryLowSOCPredictorOutput *)v5 setLowSOCPredicted:0];
  [(_OSBatteryLowSOCPredictorOutput *)v5 setConfidence:0.0];
  [(_OSBatteryLowSOCPredictorOutput *)v5 setConfidenceThreshold:0.0];
  [(_OSBatteryLowSOCPredictorOutput *)v5 setModelName:@"NoOpModel"];
  [(_OSBatteryLowSOCPredictorOutput *)v5 setModelVersion:@"0.0"];
  double v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_OSBatteryPredictor lowSOCPredictionWithError:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return v5;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)lowSOCPredictionWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end