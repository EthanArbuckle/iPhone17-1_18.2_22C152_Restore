@interface NPHVMSyncSessionManager
- (BOOL)sessionInvalidated;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NPHVMSessionDelegate)vmSessionDelegate;
- (NPHVMSyncSessionManager)init;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
- (id)vmSessionProgressCallback;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)cancel;
- (void)enqueueVoicemailChanges:(id)a3 changeType:(int64_t)a4;
- (void)setSessionInvalidated:(BOOL)a3;
- (void)setVmSessionDelegate:(id)a3;
- (void)setVmSessionProgressCallback:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation NPHVMSyncSessionManager

- (NPHVMSyncSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPHVMSyncSessionManager;
  v2 = [(NPHVMSyncSessionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deltaSyncChanges = v2->_deltaSyncChanges;
    v2->_deltaSyncChanges = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    deltaSyncChangeTypes = v2->_deltaSyncChangeTypes;
    v2->_deltaSyncChangeTypes = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)enqueueVoicemailChanges:(id)a3 changeType:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v6 = (char *)a3;
  v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[NPHVMSyncSessionManager enqueueVoicemailChanges:changeType:]";
    _os_log_impl(&dword_234652000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  objc_super v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "voicemails: %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    v13 = (const char *)a4;
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "changeType: %ld", (uint8_t *)&v12, 0xCu);
  }

  if ([v6 count])
  {
    [(NSMutableArray *)self->_deltaSyncChanges addObject:v6];
    deltaSyncChangeTypes = self->_deltaSyncChangeTypes;
    v11 = [NSNumber numberWithInteger:a4];
    [(NSMutableArray *)deltaSyncChangeTypes addObject:v11];
  }
}

- (void)cancel
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[NPHVMSyncSessionManager cancel]";
    _os_log_impl(&dword_234652000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  self->_cancel = 1;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (unsigned int (**)(id, void *))a4;
  v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[NPHVMSyncSessionManager syncSession:enqueueChanges:error:]";
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 isResetSync];
    *(_DWORD *)buf = 67109120;
    LODWORD(v35) = v12;
    _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "isResetSync = %d", buf, 8u);
  }

  if (self->_sessionInvalidated)
  {
    v13 = nph_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[NPHVMSyncSessionManager syncSession:enqueueChanges:error:]";
      uint64_t v14 = "%s Invalidated";
LABEL_11:
      _os_log_impl(&dword_234652000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (self->_cancel)
  {
    v13 = nph_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[NPHVMSyncSessionManager syncSession:enqueueChanges:error:]";
      uint64_t v14 = "%s Cancelled!";
      goto LABEL_11;
    }
LABEL_12:
    unsigned int v15 = 3;
    goto LABEL_13;
  }
  while (1)
  {
    if (![(NSMutableArray *)self->_deltaSyncChanges count])
    {
      v17 = 0;
LABEL_19:
      v13 = 0;
LABEL_20:
      unsigned int v15 = 2;
      goto LABEL_21;
    }
    v17 = [(NSMutableArray *)self->_deltaSyncChanges objectAtIndexedSubscript:0];
    v18 = [(NSMutableArray *)self->_deltaSyncChangeTypes objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 integerValue];

    if (!v17) {
      goto LABEL_19;
    }
    if ([v17 count] > self->_deltaSyncCurrentIdx) {
      break;
    }
    [(NSMutableArray *)self->_deltaSyncChanges removeObjectAtIndex:0];
    [(NSMutableArray *)self->_deltaSyncChangeTypes removeObjectAtIndex:0];
    self->_double deltaSyncCurrentIdx = 0;
  }
  v20 = objc_msgSend(v17, "objectAtIndexedSubscript:");
  v13 = v20;
  if (!v20) {
    goto LABEL_20;
  }
  if ((unint64_t)(v19 - 1) <= 1) {
    [v20 loadVoicemailBodyIfNeeded];
  }
  v33 = [v13 dataPath];
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"/var/mobile/Library/Voicemail/%lld.amr", -[NSObject voicemailNumber](v13, "voicemailNumber"));
  [v13 setDataPath:v21];

  v22 = [v13 data];
  v23 = [v8 serializer];
  v24 = [v23 changeFromData:v22 ofType:v19];

  v25 = nph_general_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v24;
    _os_log_impl(&dword_234652000, v25, OS_LOG_TYPE_DEFAULT, "change: %@", buf, 0xCu);
  }

  v26 = nph_general_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (const char *)v19;
    _os_log_impl(&dword_234652000, v26, OS_LOG_TYPE_DEFAULT, "change type: %ld", buf, 0xCu);
  }

  v27 = nph_general_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v35 = v28;
    v29 = v28;
    _os_log_impl(&dword_234652000, v27, OS_LOG_TYPE_DEFAULT, "change class: %@", buf, 0xCu);
  }
  [v13 clearVoicemailBody];
  [v13 setDataPath:v33];
  if (v9[2](v9, v24))
  {
    if (self->_vmSessionProgressCallback)
    {
      double deltaSyncCurrentIdx = (double)self->_deltaSyncCurrentIdx;
      double v31 = deltaSyncCurrentIdx / (double)(unint64_t)[v17 count];
      v32 = nph_general_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[NPHVMSyncSessionManager syncSession:enqueueChanges:error:]";
        __int16 v36 = 2048;
        double v37 = v31;
        _os_log_impl(&dword_234652000, v32, OS_LOG_TYPE_DEFAULT, "%s - reporting progress:%f", buf, 0x16u);
      }

      (*((void (**)(double))self->_vmSessionProgressCallback + 2))(v31);
    }
    ++self->_deltaSyncCurrentIdx;
    unsigned int v15 = 1;
  }
  else
  {
    if (a5) {
      *a5 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.nanophone" code:301 userInfo:0];
    }
    unsigned int v15 = 5;
  }

LABEL_21:
LABEL_13:

  return v15;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[NPHVMSyncSessionManager syncSession:didEndWithError:]";
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  self->_double deltaSyncCurrentIdx = 0;
  [(NSMutableArray *)self->_deltaSyncChanges removeAllObjects];
  [(NSMutableArray *)self->_deltaSyncChangeTypes removeAllObjects];
  [(NPHVMSessionDelegate *)self->_vmSessionDelegate syncSession:v7 didEndWithError:v6];
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = nph_general_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    v13 = "-[NPHVMSyncSessionManager syncSession:applyChanges:completion:]";
    _os_log_impl(&dword_234652000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  [(NPHVMSessionDelegate *)self->_vmSessionDelegate syncSession:v10 applyChanges:v9 completion:v8];
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[NPHVMSyncSessionManager syncSession:resetDataStoreWithError:]";
    _os_log_impl(&dword_234652000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  char v8 = [(NPHVMSessionDelegate *)self->_vmSessionDelegate syncSession:v6 resetDataStoreWithError:a4];
  return v8;
}

- (id)dataFromChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[NPHVMSyncSessionManager dataFromChange:]";
    __int16 v12 = 2112;
    id v13 = (id)objc_opt_class();
    id v5 = v13;
    _os_log_impl(&dword_234652000, v4, OS_LOG_TYPE_DEFAULT, "%s change:%@", (uint8_t *)&v10, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v3 wrappedObject];
    id v7 = [v6 data];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 data];
    }
    else
    {
      char v8 = nph_general_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        uint64_t v11 = "-[NPHVMSyncSessionManager dataFromChange:]";
        __int16 v12 = 2112;
        id v13 = v3;
        _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "%s unexpected change type:%@", (uint8_t *)&v10, 0x16u);
      }

      id v7 = 0;
    }
  }

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[NPHVMSyncSessionManager changeFromData:ofType:]";
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s type:%ld", (uint8_t *)&v14, 0x16u);
  }

  id v7 = [[NanoPhoneVoicemailMeta alloc] initWithData:v5];
  char v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    unsigned int v15 = "-[NPHVMSyncSessionManager changeFromData:ofType:]";
    __int16 v16 = 2112;
    int64_t v17 = (int64_t)v7;
    _os_log_impl(&dword_234652000, v8, OS_LOG_TYPE_DEFAULT, "%s vmMeta:%@", (uint8_t *)&v14, 0x16u);
  }

  id v9 = [[NPHSYObjectWrapper alloc] initWithSYObject:v7 type:a4];
  int v10 = nph_general_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    int v14 = 136315394;
    unsigned int v15 = "-[NPHVMSyncSessionManager changeFromData:ofType:]";
    __int16 v16 = 2112;
    int64_t v17 = (int64_t)v11;
    id v12 = v11;
    _os_log_impl(&dword_234652000, v10, OS_LOG_TYPE_DEFAULT, "%s returning:%@", (uint8_t *)&v14, 0x16u);
  }
  return v9;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[NPHVMSyncSessionManager encodeSYChangeForBackwardCompatibility:protocolVersion:]";
    __int16 v17 = 2112;
    id v18 = (id)objc_opt_class();
    id v7 = v18;
    _os_log_impl(&dword_234652000, v6, OS_LOG_TYPE_DEFAULT, "%s change:%@", buf, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v5 wrappedObject];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;
  if (a4 > 1)
  {
    int v10 = [v8 data];
  }
  else
  {
    id v14 = 0;
    int v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
    id v11 = v14;
    if (v11)
    {
      id v12 = nph_general_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NPHVMSyncSessionManager encodeSYChangeForBackwardCompatibility:protocolVersion:]();
      }
    }
  }

  return v10;
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = nph_general_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[NPHVMSyncSessionManager decodeChangeData:fromProtocolVersion:ofType:]";
    __int16 v24 = 2048;
    int64_t v25 = a4;
    __int16 v26 = 2048;
    int64_t v27 = a5;
    _os_log_impl(&dword_234652000, v9, OS_LOG_TYPE_DEFAULT, "%s ProtocolVersion:%ld type:%ld", buf, 0x20u);
  }

  if (a4 > 1)
  {
    __int16 v16 = [(NPHVMSyncSessionManager *)self changeFromData:v8 ofType:a5];
  }
  else
  {
    int v10 = (void *)MEMORY[0x263F08928];
    id v11 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    id v21 = 0;
    id v12 = [v10 unarchivedObjectOfClasses:v11 fromData:v8 error:&v21];
    id v13 = v21;

    if (v13)
    {
      id v14 = nph_general_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NPHVMSyncSessionManager decodeChangeData:fromProtocolVersion:ofType:]();
      }
    }
    unsigned int v15 = nph_general_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[NPHVMSyncSessionManager decodeChangeData:fromProtocolVersion:ofType:]";
      __int16 v24 = 2112;
      int64_t v25 = (int64_t)v12;
      _os_log_impl(&dword_234652000, v15, OS_LOG_TYPE_DEFAULT, "%s vmMeta:%@", buf, 0x16u);
    }

    __int16 v16 = [[NPHSYObjectWrapper alloc] initWithSYObject:v12 type:a5];
  }
  __int16 v17 = nph_general_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = objc_opt_class();
    *(_DWORD *)buf = 136315394;
    v23 = "-[NPHVMSyncSessionManager decodeChangeData:fromProtocolVersion:ofType:]";
    __int16 v24 = 2112;
    int64_t v25 = (int64_t)v18;
    id v19 = v18;
    _os_log_impl(&dword_234652000, v17, OS_LOG_TYPE_DEFAULT, "%s returning:%@", buf, 0x16u);
  }
  return v16;
}

- (NPHVMSessionDelegate)vmSessionDelegate
{
  return self->_vmSessionDelegate;
}

- (void)setVmSessionDelegate:(id)a3
{
  self->_vmSessionDelegate = (NPHVMSessionDelegate *)a3;
}

- (id)vmSessionProgressCallback
{
  return self->_vmSessionProgressCallback;
}

- (void)setVmSessionProgressCallback:(id)a3
{
}

- (BOOL)sessionInvalidated
{
  return self->_sessionInvalidated;
}

- (void)setSessionInvalidated:(BOOL)a3
{
  self->_sessionInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_vmSessionProgressCallback, 0);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong((id *)&self->_deltaSyncChangeTypes, 0);
  objc_storeStrong((id *)&self->_deltaSyncChanges, 0);
}

- (void)encodeSYChangeForBackwardCompatibility:protocolVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_234652000, v0, OS_LOG_TYPE_ERROR, "%s - Error archiving vmMeta: %@", (uint8_t *)v1, 0x16u);
}

- (void)decodeChangeData:fromProtocolVersion:ofType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_234652000, v0, OS_LOG_TYPE_ERROR, "%s - Error unarchiving NanoPhoneVoicemailMeta object: %@", (uint8_t *)v1, 0x16u);
}

@end