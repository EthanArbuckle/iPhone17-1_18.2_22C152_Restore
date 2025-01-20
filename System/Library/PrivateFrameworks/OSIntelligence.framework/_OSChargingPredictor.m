@interface _OSChargingPredictor
+ (id)predictor;
- (BOOL)isDeepDischargeExpected;
- (BOOL)longChargeExpected;
- (BOOL)longChargeExpectedWithConfidence:(double)a3;
- (NSXPCConnection)connection;
- (OS_os_log)log;
- (_OSChargingPredictor)init;
- (double)predictedChargeDuration;
- (double)timeUntilNextExpectedPlugin;
- (double)timeUntilNextExpectedPluginWithConfidence:(double)a3;
- (id)chargePredictionOutputOfScheme:(unint64_t)a3 withError:(id *)a4;
- (id)fixModelOutput:(id)a3;
- (id)unfixModelOutput;
- (id)validConnection;
- (int)expectedMinimumDischarge;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)fixModelOutput:(id)a3 withHandler:(id)a4;
- (void)handleInterruption;
- (void)initConnection;
- (void)setConnection:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)unfixModelOutputWithHandler:(id)a3;
@end

@implementation _OSChargingPredictor

- (_OSChargingPredictor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSChargingPredictor;
  v2 = [(_OSChargingPredictor *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "charging");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    [(_OSChargingPredictor *)v2 initConnection];
  }
  return v2;
}

- (void)initConnection
{
  os_log_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.OSIntelligence.charging" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F24CC118];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38___OSChargingPredictor_initConnection__block_invoke;
  v8[3] = &unk_1E65AAC20;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38___OSChargingPredictor_initConnection__block_invoke_55;
  v6[3] = &unk_1E65AAC20;
  objc_copyWeak(&v7, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v6];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleInterruption
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)validConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    [(_OSChargingPredictor *)self initConnection];
    connection = self->_connection;
  }
  v5 = connection;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)_OSChargingPredictor;
  [(_OSChargingPredictor *)&v4 dealloc];
}

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (BOOL)longChargeExpected
{
  return [(_OSChargingPredictor *)self longChargeExpectedWithConfidence:0.75];
}

- (BOOL)longChargeExpectedWithConfidence:(double)a3
{
  objc_super v4 = [(_OSChargingPredictor *)self chargePredictionOutputOfScheme:1 withError:0];
  v5 = v4;
  if (v4 && ([v4 confidence], v6 > a3))
  {
    [v5 chargingDuration];
    BOOL v8 = v7 > 1800.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)predictedChargeDuration
{
  id v2 = [(_OSChargingPredictor *)self chargePredictionOutputOfScheme:1 withError:0];
  os_log_t v3 = v2;
  double v4 = 0.0;
  if (v2 && [v2 meetsSystemConfidenceThreshold])
  {
    [v3 chargingDuration];
    double v4 = v5;
  }

  return v4;
}

- (id)chargePredictionOutputOfScheme:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  BOOL v8 = [(_OSChargingPredictor *)self validConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke;
  v13[3] = &unk_1E65AAC48;
  v13[5] = &v14;
  v13[6] = a2;
  v13[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59;
  v12[3] = &unk_1E65AAC70;
  v12[4] = self;
  v12[5] = &v20;
  v12[6] = &v14;
  v12[7] = a2;
  [v9 chargeDurationPredictionOfScheme:a3 withHandler:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  id v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);

  return v10;
}

- (double)timeUntilNextExpectedPlugin
{
  [(_OSChargingPredictor *)self timeUntilNextExpectedPluginWithConfidence:0.75];
  return result;
}

- (double)timeUntilNextExpectedPluginWithConfidence:(double)a3
{
  return 0.0;
}

- (BOOL)isDeepDischargeExpected
{
  return 0;
}

- (int)expectedMinimumDischarge
{
  return 20;
}

- (id)fixModelOutput:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  double v5 = [(_OSChargingPredictor *)self validConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39___OSChargingPredictor_fixModelOutput___block_invoke;
  v10[3] = &unk_1E65AAC98;
  v10[4] = self;
  double v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39___OSChargingPredictor_fixModelOutput___block_invoke_61;
  v9[3] = &unk_1E65AACC0;
  v9[4] = &v11;
  [v6 fixModelOutput:v4 withHandler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(_OSChargingPredictor *)self validConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke;
  v10[3] = &unk_1E65AAC98;
  v10[4] = self;
  id v9 = [v8 remoteObjectProxyWithErrorHandler:v10];
  [v9 fixModelOutput:v7 withHandler:v6];
}

- (id)unfixModelOutput
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  os_log_t v3 = [(_OSChargingPredictor *)self validConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40___OSChargingPredictor_unfixModelOutput__block_invoke;
  v8[3] = &unk_1E65AAC98;
  void v8[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40___OSChargingPredictor_unfixModelOutput__block_invoke_63;
  v7[3] = &unk_1E65AACC0;
  v7[4] = &v9;
  [v4 unfixModelOutputWithHandler:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_OSChargingPredictor *)self validConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke;
  v7[3] = &unk_1E65AAC98;
  v7[4] = self;
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v7];
  [v6 unfixModelOutputWithHandler:v4];
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end