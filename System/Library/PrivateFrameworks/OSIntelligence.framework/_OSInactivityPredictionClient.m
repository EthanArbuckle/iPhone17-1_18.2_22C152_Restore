@interface _OSInactivityPredictionClient
- (BOOL)hasEnoughInactivityHistory;
- (BOOL)overrideRecommendedWaitTimeTo:(double)a3;
- (BOOL)restoreInactivityModel;
- (BOOL)restoreRecommendedWaitTime;
- (NSXPCConnection)connection;
- (_OSInactivityPredictionClient)init;
- (double)recommendedWaitTime;
- (id)backedUpData;
- (id)deviceUsageDiagnosis;
- (id)fixModelOutput:(id)a3;
- (id)inactivityHistoryDiagnosis;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)longInactivityPredictionResultWithError:(id *)a3;
- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4;
- (id)modelDescription;
- (id)modelMetadata;
- (id)unfixModelOutput;
- (id)validConnection;
- (os_unfair_lock_s)lock;
- (void)backedUpDataWithHandler:(id)a3;
- (void)dealloc;
- (void)deviceUsageDiagnosisWithHandler:(id)a3;
- (void)fixModelOutput:(id)a3 withHandler:(id)a4;
- (void)handleInterruption;
- (void)hasEnoughInactivityHistoryWithHandler:(id)a3;
- (void)inactivityHistoryDiagnosisWithHandler:(id)a3;
- (void)initConnection;
- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6;
- (void)longInactivityPredictionResultWithHandler:(id)a3;
- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4;
- (void)modelDescriptionWithHandler:(id)a3;
- (void)modelMetadataWithHandler:(id)a3;
- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4;
- (void)recommendedWaitTimeWithHandler:(id)a3;
- (void)restoreInactivityModelWithHandler:(id)a3;
- (void)restoreRecommendedWaitTimeWithHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)unfixModelOutputWithHandler:(id)a3;
@end

@implementation _OSInactivityPredictionClient

- (_OSInactivityPredictionClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)_OSInactivityPredictionClient;
  v2 = [(_OSInactivityPredictionClient *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.predictionclient");
    v4 = (void *)gInactivityPredictionClientLog;
    gInactivityPredictionClientLog = (uint64_t)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    [(_OSInactivityPredictionClient *)v2 initConnection];
  }
  return v2;
}

- (void)initConnection
{
  v17[6] = *MEMORY[0x1E4F143B8];
  os_log_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.OSIntelligence" options:4096];
  connection = self->_connection;
  self->_connection = v3;

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F24CB318];
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:6];
  v8 = [v6 setWithArray:v7];
  [v5 setClasses:v8 forSelector:sel_backedUpDataWithHandler_ argumentIndex:0 ofReply:1];

  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47___OSInactivityPredictionClient_initConnection__block_invoke;
  v14[3] = &unk_1E65AAC20;
  objc_copyWeak(&v15, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v14];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __47___OSInactivityPredictionClient_initConnection__block_invoke_85;
  v12 = &unk_1E65AAC20;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:&v9];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)handleInterruption
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CA50C000, log, OS_LOG_TYPE_ERROR, "Connection to inactivity predictor interrupted", v1, 2u);
}

- (id)validConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    [(_OSInactivityPredictionClient *)self initConnection];
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
  v4.super_class = (Class)_OSInactivityPredictionClient;
  [(_OSInactivityPredictionClient *)&v4 dealloc];
}

- (double)recommendedWaitTime
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_89;
  v6[3] = &unk_1E65AAD50;
  v6[4] = &v7;
  [v3 recommendedWaitTimeWithHandler:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)modelDescription
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_92];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___OSInactivityPredictionClient_modelDescription__block_invoke_93;
  v6[3] = &unk_1E65AACC0;
  v6[4] = &v7;
  [v3 modelDescriptionWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)modelMetadata
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_96];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46___OSInactivityPredictionClient_modelMetadata__block_invoke_97;
  v6[3] = &unk_1E65AAD78;
  v6[4] = &v7;
  [v3 modelMetadataWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)hasEnoughInactivityHistory
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_100];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_101;
  v5[3] = &unk_1E65AADA0;
  v5[4] = &v6;
  [v3 hasEnoughInactivityHistoryWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)inactivityHistoryDiagnosis
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_104];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_105;
  v6[3] = &unk_1E65AACC0;
  v6[4] = &v7;
  [v3 inactivityHistoryDiagnosisWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)deviceUsageDiagnosis
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_107];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_108;
  v6[3] = &unk_1E65AACC0;
  v6[4] = &v7;
  [v3 deviceUsageDiagnosisWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)longInactivityPredictionResultWithError:(id *)a3
{
  return [(_OSInactivityPredictionClient *)self longInactivityPredictionResultWithOptions:0 withError:a3];
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  uint64_t v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v11[4] = a3;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_110;
  v10[3] = &unk_1E65AADE8;
  v10[4] = &v18;
  v10[5] = &v12;
  [v7 longInactivityPredictionResultWithOptions:a3 withHandler:v10];

  if (a4) {
    *a4 = (id) v13[5];
  }
  id v8 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  v11 = [(_OSInactivityPredictionClient *)self validConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke;
  v17[3] = &unk_1E65AAE10;
  int64_t v19 = a5;
  id v12 = v10;
  id v18 = v12;
  double v20 = a4;
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_112;
  v16[3] = &unk_1E65AADE8;
  v16[4] = &v27;
  v16[5] = &v21;
  [v13 longInactivityPredictionResultAtDate:v12 withTimeSinceInactive:a5 withOptions:v16 withHandler:a4];

  if (a6) {
    *a6 = (id) v22[5];
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)fixModelOutput:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  v5 = [(_OSInactivityPredictionClient *)self validConnection];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_114];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___OSInactivityPredictionClient_fixModelOutput___block_invoke_115;
  v9[3] = &unk_1E65AACC0;
  v9[4] = &v10;
  [v6 fixModelOutput:v4 withHandler:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)unfixModelOutput
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_117];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke_118;
  v6[3] = &unk_1E65AACC0;
  v6[4] = &v7;
  [v3 unfixModelOutputWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)overrideRecommendedWaitTimeTo:(double)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_120];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_121;
  v7[3] = &unk_1E65AADA0;
  v7[4] = &v8;
  [v5 overrideRecommendedWaitTimeTo:v7 withHandler:a3];

  LOBYTE(v4) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v4;
}

- (BOOL)restoreRecommendedWaitTime
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_123];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_124;
  v5[3] = &unk_1E65AADA0;
  v5[4] = &v6;
  [v3 restoreRecommendedWaitTimeWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)restoreInactivityModel
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_126];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_127;
  v5[3] = &unk_1E65AADA0;
  v5[4] = &v6;
  [v3 restoreInactivityModelWithHandler:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)backedUpData
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  char v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v2 = [(_OSInactivityPredictionClient *)self validConnection];
  os_log_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_129];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___OSInactivityPredictionClient_backedUpData__block_invoke_130;
  v6[3] = &unk_1E65AAE38;
  v6[4] = &v7;
  [v3 backedUpDataWithHandler:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)recommendedWaitTimeWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_133];
  [v5 recommendedWaitTimeWithHandler:v4];
}

- (void)modelDescriptionWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_135];
  [v5 modelDescriptionWithHandler:v4];
}

- (void)modelMetadataWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_137];
  [v5 modelMetadataWithHandler:v4];
}

- (void)inactivityHistoryDiagnosisWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_139];
  [v5 inactivityHistoryDiagnosisWithHandler:v4];
}

- (void)hasEnoughInactivityHistoryWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_141];
  [v5 hasEnoughInactivityHistoryWithHandler:v4];
}

- (void)deviceUsageDiagnosisWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_143];
  [v5 deviceUsageDiagnosisWithHandler:v4];
}

- (void)longInactivityPredictionResultWithHandler:(id)a3
{
}

- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_OSInactivityPredictionClient *)self validConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a3;
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v9];
  [v8 longInactivityPredictionResultWithOptions:a3 withHandler:v6];
}

- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_OSInactivityPredictionClient *)self validConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke;
  v15[3] = &unk_1E65AAE10;
  id v16 = v10;
  int64_t v17 = a5;
  double v18 = a4;
  id v13 = v10;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v15];
  [v14 longInactivityPredictionResultAtDate:v13 withTimeSinceInactive:a5 withOptions:v11 withHandler:a4];
}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(_OSInactivityPredictionClient *)self validConnection];
  uint64_t v8 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_145];
  [v8 fixModelOutput:v7 withHandler:v6];
}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  [v5 unfixModelOutputWithHandler:v4];
}

- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v8 = [(_OSInactivityPredictionClient *)self validConnection];
  id v7 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_149];
  [v7 overrideRecommendedWaitTimeTo:v6 withHandler:a3];
}

- (void)restoreRecommendedWaitTimeWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_151];
  [v5 restoreRecommendedWaitTimeWithHandler:v4];
}

- (void)restoreInactivityModelWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_153];
  [v5 restoreInactivityModelWithHandler:v4];
}

- (void)backedUpDataWithHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(_OSInactivityPredictionClient *)self validConnection];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_155];
  [v5 backedUpDataWithHandler:v4];
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
}

@end