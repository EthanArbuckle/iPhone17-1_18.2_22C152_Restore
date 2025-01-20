@interface ADAMServerDelegate
- (ADAMServerDelegate)initWithConnection:(id)a3 andErrorCode:(int64_t)a4;
- (BOOL)datatypeSupportsONOFF:(unsigned int)a3;
- (BOOL)isActive:(unsigned int)a3;
- (BOOL)verifyInvariantsWithReply:(id)a3;
- (id)DatatypeTo4CC:(unsigned int)a3;
- (id)describeErrorCode:(int64_t)a3;
- (id)errorWithCode:(int64_t)a3 andReason:(id)a4;
- (id)getClientName;
- (void)configureAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 configuration:(id)a5 withReply:(id)a6;
- (void)deactivateAll;
- (void)getCurrentConfigurationForAudioSampleType:(unsigned int)a3 withReply:(id)a4;
- (void)isMeasurementOnForAudioSampleType:(unsigned int)a3 withReply:(id)a4;
- (void)registerDelegate:(unsigned int)a3;
- (void)sendAudioSample:(id)a3;
- (void)sendAudioSample:(id)a3 withType:(unsigned int)a4 metadata:(id)a5;
- (void)setupConnection:(id)a3;
- (void)startListeningToAudioSampleWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5;
- (void)startMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withConfiguration:(id)a5 andReply:(id)a6;
- (void)stopListeningToAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5;
- (void)stopMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 andReply:(id)a5;
- (void)unregisterDelegate;
@end

@implementation ADAMServerDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configs, 0);
  objc_storeStrong((id *)&self->_dataTypeStatus, 0);
  objc_storeStrong((id *)&self->_clientName, 0);

  objc_destroyWeak((id *)&self->_connection);
}

- (id)describeErrorCode:(int64_t)a3
{
  if (a3 <= 560295539)
  {
    if (!a3) {
      return @"No Error";
    }
    if (a3 == 560164457) {
      return @"Invalid connection";
    }
  }
  else
  {
    switch(a3)
    {
      case 560295540:
        return @"Missing Entitlements";
      case 560950886:
        return @"data type does not support on/off";
      case 1969974894:
        return @"Unknown Client";
    }
  }
  return @"Unknown Error";
}

- (BOOL)verifyInvariantsWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  int64_t error_code = self->_error_code;
  if (error_code)
  {
    v6 = [(ADAMServerDelegate *)self describeErrorCode:self->_error_code];
    v7 = [(ADAMServerDelegate *)self errorWithCode:error_code andReason:v6];
    v4[2](v4, v7);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

    if (WeakRetained)
    {
      BOOL v8 = 1;
      goto LABEL_6;
    }
    v6 = [(ADAMServerDelegate *)self describeErrorCode:560164457];
    v7 = [(ADAMServerDelegate *)self errorWithCode:560164457 andReason:v6];
    v4[2](v4, v7);
  }

  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (id)errorWithCode:(int64_t)a3 andReason:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v8 = [v6 errorWithDomain:@"AudioDataAnalysisManager(ADAM)" code:a3 userInfo:v7];

  return v8;
}

- (id)DatatypeTo4CC:(unsigned int)a3
{
  v5[4] = 0;
  v5[2] = BYTE1(a3);
  v5[3] = a3;
  v5[1] = BYTE2(a3);
  v5[0] = HIBYTE(a3);
  v3 = [NSString stringWithUTF8String:v5];

  return v3;
}

- (BOOL)datatypeSupportsONOFF:(unsigned int)a3
{
  return a3 == 1702260324;
}

- (void)unregisterDelegate
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  val = self;
  v4 = self->_dataTypeStatus;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  lock = p_lock;
  v6 = 0;
  v7 = 0;
  if (v5)
  {
    BOOL v8 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v4);
        }
        int v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) unsignedIntegerValue:lock val:val v30];
        int v12 = v11;
        if (v7 >= v8)
        {
          uint64_t v13 = (v7 - v6) >> 2;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62) {
            std::vector<ADAMAudioDataAnalysisType>::__throw_length_error[abi:ne180100]();
          }
          if ((v8 - v6) >> 1 > v14) {
            unint64_t v14 = (v8 - v6) >> 1;
          }
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15)
          {
            if (v15 >> 62) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v16 = (char *)operator new(4 * v15);
          }
          else
          {
            v16 = 0;
          }
          v17 = &v16[4 * v13];
          *(_DWORD *)v17 = v12;
          v18 = v17 + 4;
          while (v7 != v6)
          {
            int v19 = *((_DWORD *)v7 - 1);
            v7 -= 4;
            *((_DWORD *)v17 - 1) = v19;
            v17 -= 4;
          }
          BOOL v8 = &v16[4 * v15];
          if (v6) {
            operator delete(v6);
          }
          v6 = v17;
          v7 = v18;
        }
        else
        {
          *(_DWORD *)v7 = v11;
          v7 += 4;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
  if (v6 != v7)
  {
    v21 = v6;
    do
    {
      uint64_t v22 = *(unsigned int *)v21;
      ADAM::AudioDataAnalysisManager::instance(v20);
      objc_initWeak(&location, val);
      v23 = (std::mutex *)(qword_26AB1A888 + 24);
      std::mutex::lock((std::mutex *)(qword_26AB1A888 + 24));
      v24 = *(void **)(qword_26AB1A888 + 16);
      v25 = [NSNumber numberWithUnsignedInteger:v22];
      v26 = [v24 objectForKey:v25];
      id v27 = objc_loadWeakRetained(&location);
      [v26 removeObject:v27];

      std::mutex::unlock(v23);
      objc_destroyWeak(&location);
      v21 += 4;
    }
    while (v21 != v7);
  }
  if (v6) {
    operator delete(v6);
  }
}

- (void)registerDelegate:(unsigned int)a3
{
  inited = (ADAM::AudioDataAnalysisManager *)objc_initWeak(&v15, self);
  ADAM::AudioDataAnalysisManager::instance(inited);
  id v5 = objc_loadWeakRetained(&v15);
  objc_initWeak(&location, v5);
  uint64_t v6 = a3;
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  BOOL v8 = (std::mutex *)(qword_26AB1A888 + 24);
  std::mutex::lock((std::mutex *)(qword_26AB1A888 + 24));
  uint64_t v9 = [*(id *)(qword_26AB1A888 + 16) objectForKey:v7];

  if (v9)
  {
    uint64_t v10 = [*(id *)(qword_26AB1A888 + 16) objectForKey:v7];
    int v11 = objc_loadWeakRetained(&location);
    [v10 addObject:v11];
  }
  else
  {
    int v12 = (void *)MEMORY[0x263EFF980];
    id v13 = objc_loadWeakRetained(&location);
    uint64_t v10 = [v12 arrayWithObject:v13];

    unint64_t v14 = *(void **)(qword_26AB1A888 + 16);
    int v11 = [NSNumber numberWithUnsignedInteger:v6];
    [v14 setObject:v10 forKey:v11];
  }

  std::mutex::unlock(v8);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v15);
}

- (void)deactivateAll
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_dataTypeStatus;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        uint64_t v9 = [NSNumber numberWithBool:0];
        [(NSMutableDictionary *)self->_dataTypeStatus setObject:v9 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)getClientName
{
  return self->_clientName;
}

- (BOOL)isActive:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataTypeStatus = self->_dataTypeStatus;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [(NSMutableDictionary *)dataTypeStatus objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if (v8) {
    char v9 = [v8 BOOLValue];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)isMeasurementOnForAudioSampleType:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v8 = (void (**)(id, void))a4;
  uint64_t v6 = (ADAM::AudioDataAnalysisManager *)[(ADAMServerDelegate *)self isActive:v4];
  uint64_t v7 = v6;
  if ((v6 & 1) == 0) {
    ADAM::AudioDataAnalysisManager::instance(v6);
  }
  ((void (**)(id, ADAM::AudioDataAnalysisManager *))v8)[2](v8, v7);
}

- (void)getCurrentConfigurationForAudioSampleType:(unsigned int)a3 withReply:(id)a4
{
  uint64_t v4 = (ADAM::AudioDataAnalysisManager *)a4;
  ADAM::AudioDataAnalysisManager::instance(v4);
  (*((void (**)(ADAM::AudioDataAnalysisManager *, void))v4 + 2))(v4, 0);
}

- (void)sendAudioSample:(id)a3
{
  id v4 = a3;
  if (-[ADAMServerDelegate isActive:](self, "isActive:", [v4 type]))
  {
    if ([v4 type] == 1751213428)
    {
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      uint64_t v6 = [NSNumber numberWithUnsignedInteger:1751213428];
      id WeakRetained = [(NSMutableDictionary *)configs objectForKey:v6];

      uint64_t v8 = [NSNumber numberWithUnsignedInteger:1751215219];
      char v9 = [WeakRetained objectForKey:v8];

      os_unfair_lock_unlock(&self->_lock);
      if (v9 && [v9 BOOLValue])
      {
        long long v10 = [v4 metadata];
        long long v11 = [v10 objectForKey:@"_ADAFMetadataKeyIsLoud"];

        if (v11 && ([v11 BOOLValue] & 1) == 0)
        {

          goto LABEL_10;
        }
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__ADAMServerDelegate_sendAudioSample___block_invoke;
    v12[3] = &unk_264628D08;
    v12[4] = self;
    char v9 = [WeakRetained remoteObjectProxyWithErrorHandler:v12];
    [v9 receiveAudioSample:v4];
LABEL_10:
  }
}

void __38__ADAMServerDelegate_sendAudioSample___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136315906;
    uint64_t v8 = "ADAMServerDelegate.mm";
    __int16 v9 = 1024;
    int v10 = 226;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_2227C1000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d connection to %@ failed: %@", (uint8_t *)&v7, 0x26u);
  }

LABEL_10:
}

- (void)sendAudioSample:(id)a3 withType:(unsigned int)a4 metadata:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ([(ADAMServerDelegate *)self isActive:v6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__ADAMServerDelegate_sendAudioSample_withType_metadata___block_invoke;
    v12[3] = &unk_264628D08;
    v12[4] = self;
    __int16 v11 = [WeakRetained remoteObjectProxyWithErrorHandler:v12];
    [v11 receiveAudioSample:v8 type:v6 metadata:v9];
  }
}

void __56__ADAMServerDelegate_sendAudioSample_withType_metadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    id v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136315906;
    id v8 = "ADAMServerDelegate.mm";
    __int16 v9 = 1024;
    int v10 = 199;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_2227C1000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d connection to %@ failed: %@", (uint8_t *)&v7, 0x26u);
  }

LABEL_10:
}

- (void)setupConnection:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_connection, v4);

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__ADAMServerDelegate_setupConnection___block_invoke;
  v9[3] = &unk_264628CE0;
  v9[4] = self;
  objc_copyWeak(&v10, &location);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setInvalidationHandler:v9];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__ADAMServerDelegate_setupConnection___block_invoke_6;
  v7[3] = &unk_264628CE0;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  id v6 = objc_loadWeakRetained((id *)&self->_connection);
  [v6 setInterruptionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__ADAMServerDelegate_setupConnection___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v2 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    v2 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    int v8 = 136315650;
    __int16 v9 = "ADAMServerDelegate.mm";
    __int16 v10 = 1024;
    int v11 = 183;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2227C1000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d client connection invalidated: %@", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deactivateAll];

  id v7 = objc_loadWeakRetained(v5);
  [v7 unregisterDelegate];
}

void __38__ADAMServerDelegate_setupConnection___block_invoke_6(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (ADAM::ADAMLogScope(void)::once != -1) {
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
  }
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v2 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    v2 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    int v8 = 136315650;
    __int16 v9 = "ADAMServerDelegate.mm";
    __int16 v10 = 1024;
    int v11 = 189;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_2227C1000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d client connection interrupted: %@", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deactivateAll];

  id v7 = objc_loadWeakRetained(v5);
  [v7 unregisterDelegate];
}

- (void)configureAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 configuration:(id)a5 withReply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  objc_initWeak(&v32, a3);
  id v10 = a5;
  int v11 = (void (**)(id, void))a6;
  if ([(ADAMServerDelegate *)self verifyInvariantsWithReply:v11])
  {
    if (!self->_clientName)
    {
      __int16 v12 = (NSString *)objc_loadWeakRetained(&v32);
      clientName = self->_clientName;
      self->_clientName = v12;
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      uint64_t v14 = (ADAM::AudioDataAnalysisManager *)*(id *)ADAM::ADAMLogScope(void)::scope;
      uint64_t v15 = v14;
      if (!v14) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v15 = (ADAM::AudioDataAnalysisManager *)MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = self->_clientName;
      int v19 = +[ADAFUtil stringFromDataType:v8];
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = "ADAMServerDelegate.mm";
      __int16 v37 = 1024;
      int v38 = 163;
      __int16 v39 = 2112;
      v40 = v18;
      __int16 v41 = 2112;
      v42 = v19;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d [configure] audio sample for client: %@ with data type: %@", buf, 0x26u);
    }
LABEL_13:
    if (v10)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      uint64_t v22 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v10 copyItems:1];
      v23 = [NSNumber numberWithUnsignedInteger:v8];
      [(NSMutableDictionary *)configs setObject:v22 forKey:v23];

      os_unfair_lock_unlock(p_lock);
    }
    ADAM::AudioDataAnalysisManager::instance(v14);
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v24 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v24)
      {
LABEL_40:
        v11[2](v11, 0);
        goto LABEL_41;
      }
    }
    else
    {
      id v24 = (id)MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "____");
      if (v34 >= 0) {
        id v27 = __p;
      }
      else {
        id v27 = (void **)__p[0];
      }
      *((unsigned char *)v27 + 3) = v8;
      if (v34 >= 0) {
        v28 = __p;
      }
      else {
        v28 = (void **)__p[0];
      }
      *((unsigned char *)v28 + 2) = BYTE1(v8);
      if (v34 >= 0) {
        v29 = __p;
      }
      else {
        v29 = (void **)__p[0];
      }
      *((unsigned char *)v29 + 1) = BYTE2(v8);
      if (v34 >= 0) {
        long long v30 = __p;
      }
      else {
        long long v30 = (void **)__p[0];
      }
      *(unsigned char *)long long v30 = BYTE3(v8);
      if (v34 >= 0) {
        long long v31 = __p;
      }
      else {
        long long v31 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = "AudioDataAnalysisManager.cpp";
      __int16 v37 = 1024;
      int v38 = 468;
      __int16 v39 = 2080;
      v40 = v31;
      _os_log_impl(&dword_2227C1000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d type %s does not support configuring inside ADAM", buf, 0x1Cu);
      if (v34 < 0) {
        operator delete(__p[0]);
      }
    }

    goto LABEL_40;
  }
LABEL_41:

  objc_destroyWeak(&v32);
}

- (void)stopMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 andReply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void))a5;
  if ([(ADAMServerDelegate *)self verifyInvariantsWithReply:v7])
  {
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v8 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      id v8 = (id)MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    id v10 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      clientName = self->_clientName;
      __int16 v12 = +[ADAFUtil stringFromDataType:v5];
      int v22 = 136315906;
      v23 = "ADAMServerDelegate.mm";
      __int16 v24 = 1024;
      int v25 = 140;
      __int16 v26 = 2112;
      id v27 = clientName;
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2227C1000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d [stop] measuring audio sample for client: %@ with data type: %@", (uint8_t *)&v22, 0x26u);
    }
LABEL_11:
    uint64_t v13 = (ADAM::AudioDataAnalysisManager *)[(ADAMServerDelegate *)self datatypeSupportsONOFF:v5];
    if (v13)
    {
      ADAM::AudioDataAnalysisManager::instance(v13);
      if (ADAM::ADAMLogScope(void)::once != -1) {
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
      }
      if (ADAM::ADAMLogScope(void)::scope)
      {
        uint64_t v14 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v14)
        {
LABEL_31:
          v7[2](v7, 0);
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v14 = MEMORY[0x263EF8438];
        id v21 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136315650;
        v23 = "AudioDataAnalysisManager.cpp";
        __int16 v24 = 1024;
        int v25 = 440;
        __int16 v26 = 1024;
        LODWORD(v27) = v5;
        _os_log_impl(&dword_2227C1000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d EAE type %u does not support disabling", (uint8_t *)&v22, 0x18u);
      }

      goto LABEL_31;
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
      {
LABEL_26:
        int v19 = [(ADAMServerDelegate *)self describeErrorCode:560950886];
        v20 = [(ADAMServerDelegate *)self errorWithCode:560950886 andReason:v19];
        ((void (**)(id, void *))v7)[2](v7, v20);

        goto LABEL_32;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x263EF8438];
      id v16 = MEMORY[0x263EF8438];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = +[ADAFUtil stringFromDataType:v5];
      int v22 = 136315650;
      v23 = "ADAMServerDelegate.mm";
      __int16 v24 = 1024;
      int v25 = 143;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl(&dword_2227C1000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d datatype %@ cannot be turned OFF", (uint8_t *)&v22, 0x1Cu);
    }
    goto LABEL_26;
  }
LABEL_32:
}

- (void)startMeasuringAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withConfiguration:(id)a5 andReply:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a3);
  id v10 = a5;
  int v11 = (void (**)(id, void))a6;
  if ([(ADAMServerDelegate *)self verifyInvariantsWithReply:v11])
  {
    if (!self->_clientName)
    {
      __int16 v12 = (NSString *)objc_loadWeakRetained(&location);
      clientName = self->_clientName;
      self->_clientName = v12;
    }
    if (v10)
    {
      os_unfair_lock_lock(&self->_lock);
      configs = self->_configs;
      id v15 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v10 copyItems:1];
      id v16 = [NSNumber numberWithUnsignedInteger:v8];
      [(NSMutableDictionary *)configs setObject:v15 forKey:v16];

      os_unfair_lock_unlock(&self->_lock);
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v17 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v17) {
        goto LABEL_15;
      }
    }
    else
    {
      id v17 = (id)MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    int v19 = v17;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = self->_clientName;
      id v21 = +[ADAFUtil stringFromDataType:v8];
      *(_DWORD *)buf = 136315906;
      long long v33 = "ADAMServerDelegate.mm";
      __int16 v34 = 1024;
      int v35 = 122;
      __int16 v36 = 2112;
      __int16 v37 = v20;
      __int16 v38 = 2112;
      __int16 v39 = v21;
      _os_log_impl(&dword_2227C1000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d [start] measuring audio sample for client: %@ with data type: %@", buf, 0x26u);
    }
LABEL_15:
    int v22 = (ADAM::AudioDataAnalysisManager *)[(ADAMServerDelegate *)self datatypeSupportsONOFF:v8];
    if (v22)
    {
      ADAM::AudioDataAnalysisManager::instance(v22);
      if (ADAM::ADAMLogScope(void)::once != -1) {
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
      }
      if (ADAM::ADAMLogScope(void)::scope)
      {
        v23 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v23)
        {
LABEL_35:
          v11[2](v11, 0);
          goto LABEL_36;
        }
      }
      else
      {
        v23 = MEMORY[0x263EF8438];
        id v30 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v33 = "AudioDataAnalysisManager.cpp";
        __int16 v34 = 1024;
        int v35 = 411;
        __int16 v36 = 1024;
        LODWORD(v37) = v8;
        _os_log_impl(&dword_2227C1000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d EAE type %u does not support enabling", buf, 0x18u);
      }

      goto LABEL_35;
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v24 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v24)
      {
LABEL_30:
        __int16 v28 = [(ADAMServerDelegate *)self describeErrorCode:560950886];
        v29 = [(ADAMServerDelegate *)self errorWithCode:560950886 andReason:v28];
        ((void (**)(id, void *))v11)[2](v11, v29);

        goto LABEL_36;
      }
    }
    else
    {
      id v24 = (id)MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    __int16 v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = +[ADAFUtil stringFromDataType:v8];
      *(_DWORD *)buf = 136315650;
      long long v33 = "ADAMServerDelegate.mm";
      __int16 v34 = 1024;
      int v35 = 125;
      __int16 v36 = 2112;
      __int16 v37 = v27;
      _os_log_impl(&dword_2227C1000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d datatype %@ cannot be turned ON", buf, 0x1Cu);
    }
    goto LABEL_30;
  }
LABEL_36:

  objc_destroyWeak(&location);
}

- (void)stopListeningToAudioSampleTypeWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = (void (**)(id, void))a5;
  if ([(ADAMServerDelegate *)self verifyInvariantsWithReply:v7])
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    os_unfair_lock_lock(&self->_lock);
    id v9 = [(NSMutableDictionary *)self->_dataTypeStatus objectForKey:v8];
    if (v9)
    {
      id v10 = [NSNumber numberWithBool:0];
      [(NSMutableDictionary *)self->_dataTypeStatus setObject:v10 forKeyedSubscript:v8];
    }
    os_unfair_lock_unlock(&self->_lock);
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11)
      {
LABEL_18:
        v7[2](v7, 0);

        goto LABEL_19;
      }
    }
    else
    {
      id v11 = (id)MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    uint64_t v13 = v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      clientName = self->_clientName;
      id v15 = +[ADAFUtil stringFromDataType:v5];
      if (v9)
      {
        id v16 = [v9 stringValue];
      }
      else
      {
        id v16 = @"nil";
      }
      int v17 = 136316162;
      id v18 = "ADAMServerDelegate.mm";
      __int16 v19 = 1024;
      int v20 = 104;
      __int16 v21 = 2112;
      int v22 = clientName;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      __int16 v26 = v16;
      _os_log_impl(&dword_2227C1000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d [stop] recording for client: %@ with dataType: %@, previous status: %@", (uint8_t *)&v17, 0x30u);
      if (v9) {
    }
      }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)startListeningToAudioSampleWithIdentifier:(id)a3 type:(unsigned int)a4 withReply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a3);
  uint64_t v8 = (void (**)(id, void))a5;
  if ([(ADAMServerDelegate *)self verifyInvariantsWithReply:v8])
  {
    if (!self->_clientName)
    {
      id v9 = (NSString *)objc_loadWeakRetained(&location);
      clientName = self->_clientName;
      self->_clientName = v9;
    }
    id v11 = [NSNumber numberWithUnsignedInteger:v6];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v13 = [(NSMutableDictionary *)self->_dataTypeStatus objectForKey:v11];
    uint64_t v14 = v13;
    if (!v13 || ([v13 BOOLValue] & 1) == 0)
    {
      dataTypeStatus = self->_dataTypeStatus;
      int v17 = [NSNumber numberWithBool:1];
      [(NSMutableDictionary *)dataTypeStatus setObject:v17 forKey:v11];

      os_unfair_lock_unlock(&self->_lock);
      if (!v14) {
        [(ADAMServerDelegate *)self registerDelegate:v6];
      }
LABEL_18:
      if (ADAM::ADAMLogScope(void)::once != -1) {
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
      }
      if (ADAM::ADAMLogScope(void)::scope)
      {
        id v22 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v22)
        {
LABEL_27:
          v8[2](v8, 0);

          goto LABEL_28;
        }
      }
      else
      {
        id v22 = (id)MEMORY[0x263EF8438];
        id v23 = MEMORY[0x263EF8438];
      }
      id v24 = v22;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = objc_loadWeakRetained(&location);
        __int16 v26 = +[ADAFUtil stringFromDataType:v6];
        *(_DWORD *)buf = 136315906;
        v29 = "ADAMServerDelegate.mm";
        __int16 v30 = 1024;
        int v31 = 85;
        __int16 v32 = 2112;
        id v33 = v25;
        __int16 v34 = 2112;
        int v35 = v26;
        _os_log_impl(&dword_2227C1000, v24, OS_LOG_TYPE_INFO, "%25s:%-5d [start] recording for a new client: %@ with type: %@", buf, 0x26u);
      }
      goto LABEL_27;
    }
    if (ADAM::ADAMLogScope(void)::once != -1) {
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_81);
    }
    if (ADAM::ADAMLogScope(void)::scope)
    {
      id v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
      {
LABEL_17:
        os_unfair_lock_unlock(p_lock);
        goto LABEL_18;
      }
    }
    else
    {
      id v15 = (id)MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    __int16 v19 = v15;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = objc_loadWeakRetained(&location);
      __int16 v21 = +[ADAFUtil stringFromDataType:v6];
      *(_DWORD *)buf = 136315906;
      v29 = "ADAMServerDelegate.mm";
      __int16 v30 = 1024;
      int v31 = 75;
      __int16 v32 = 2112;
      id v33 = v20;
      __int16 v34 = 2112;
      int v35 = v21;
      _os_log_impl(&dword_2227C1000, v19, OS_LOG_TYPE_INFO, "%25s:%-5d client %@ is already listening to type: %@", buf, 0x26u);
    }
    goto LABEL_17;
  }
LABEL_28:

  objc_destroyWeak(&location);
}

- (ADAMServerDelegate)initWithConnection:(id)a3 andErrorCode:(int64_t)a4
{
  objc_initWeak(&location, a3);
  v16.receiver = self;
  v16.super_class = (Class)ADAMServerDelegate;
  uint64_t v6 = [(ADAMServerDelegate *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    clientName = v6->_clientName;
    v6->_clientName = 0;

    if (a4)
    {
      objc_storeWeak((id *)&v7->_connection, 0);
      dataTypeStatus = v7->_dataTypeStatus;
      v7->_dataTypeStatus = 0;

      configs = v7->_configs;
      v7->_configs = 0;
    }
    else
    {
      id v11 = objc_loadWeakRetained(&location);
      [(ADAMServerDelegate *)v7 setupConnection:v11];

      id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v13 = v7->_dataTypeStatus;
      v7->_dataTypeStatus = v12;

      uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      configs = v7->_configs;
      v7->_configs = v14;
    }

    v7->_int64_t error_code = a4;
    v7->_lock._os_unfair_lock_opaque = 0;
  }
  objc_destroyWeak(&location);
  return v7;
}

@end