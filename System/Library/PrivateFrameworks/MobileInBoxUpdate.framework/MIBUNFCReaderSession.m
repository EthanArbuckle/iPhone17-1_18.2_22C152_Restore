@interface MIBUNFCReaderSession
- (BOOL)suppressLogging;
- (MIBUNFCReaderSession)init;
- (NFReaderSession)readerSession;
- (NFSession)nfSession;
- (NSArray)tags;
- (OS_dispatch_semaphore)connectSem;
- (id)sendCommand:(id)a3 withError:(id *)a4;
- (void)disconnectTag:(id *)a3;
- (void)end;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)setConnectSem:(id)a3;
- (void)setNfSession:(id)a3;
- (void)setReaderSession:(id)a3;
- (void)setSuppressLogging:(BOOL)a3;
- (void)setTags:(id)a3;
- (void)start:(id *)a3;
@end

@implementation MIBUNFCReaderSession

- (MIBUNFCReaderSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)MIBUNFCReaderSession;
  v2 = [(MIBUNFCReaderSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUNFCReaderSession *)v2 setNfSession:0];
    [(MIBUNFCReaderSession *)v3 setReaderSession:0];
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    [(MIBUNFCReaderSession *)v3 setConnectSem:v4];
  }
  return v3;
}

- (void)start:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(MIBUNFCReaderSession *)self nfSession];

  if (v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_12);
    }
    objc_super v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v7 = NSString;
      v8 = v6;
      v9 = [v7 stringWithFormat:@"NFSession already in progress"];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30__MIBUNFCReaderSession_start___block_invoke_16;
    v15[3] = &unk_264B96B70;
    v15[4] = self;
    v15[5] = buf;
    v10 = (void *)MEMORY[0x230FC4670](v15);
    v11 = [MEMORY[0x263F58118] sharedHardwareManagerWithNoUI];
    v12 = [v11 startReaderSession:v10];
    [(MIBUNFCReaderSession *)self setNfSession:v12];

    v13 = [(MIBUNFCReaderSession *)self connectSem];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

    v14 = *(void **)(*(void *)&buf[8] + 40);
    if (v14) {
      *a3 = v14;
    }

    _Block_object_dispose(buf, 8);
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_18_0);
    }
    v23 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      __30__MIBUNFCReaderSession_start___block_invoke_16_cold_2(a1, v23);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_24_1);
    }
    uint64_t v7 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = NSString;
      v10 = v7;
      v11 = [v9 stringWithFormat:@"Session started"];
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v8;
      __int16 v27 = 2114;
      v28 = v11;
      _os_log_impl(&dword_2309BC000, v10, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
    v12 = (uint64_t *)(a1 + 32);
    [v5 setDelegate:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setReaderSession:v5];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = a1 + 40;
    uint64_t v15 = *(void *)(v14 + 8);
    id obj = *(id *)(v15 + 40);
    char v16 = [v5 startPollingWithError:&obj];
    objc_storeStrong((id *)(v15 + 40), obj);
    if (v16)
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_36_1);
      }
      v17 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *v12;
        id v19 = NSString;
        uint64_t v20 = v17;
        v21 = [v19 stringWithFormat:@"Reader is polling for tags"];
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v18;
        __int16 v27 = 2114;
        v28 = v21;
        _os_log_impl(&dword_2309BC000, v20, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_30_0);
      }
      v22 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        __30__MIBUNFCReaderSession_start___block_invoke_16_cold_1(v12, v13, v22);
      }
    }
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_22()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_28()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __30__MIBUNFCReaderSession_start___block_invoke_34()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)disconnectTag:(id *)a3
{
  uint64_t v5 = [(MIBUNFCReaderSession *)self readerSession];
  id v9 = 0;
  char v6 = [v5 disconnectTagWithError:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_43_0);
    }
    uint64_t v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    {
      [(MIBUNFCReaderSession *)(uint64_t)self disconnectTag:(uint64_t)v7];
      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  if (v7) {
LABEL_6:
  }
    *a3 = v7;
LABEL_7:
}

void __38__MIBUNFCReaderSession_disconnectTag___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)end
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_48_1);
  }
  uint64_t v3 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSString;
    uint64_t v5 = v3;
    uint64_t v6 = [v4 stringWithFormat:@"Ending session"];
    int v8 = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_2309BC000, v5, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [(MIBUNFCReaderSession *)self nfSession];
  [v7 endSession];
}

void __27__MIBUNFCReaderSession_end__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (id)sendCommand:(id)a3 withError:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 serializedPayload];
  uint64_t v12 = (void *)v7;
  if (!v6)
  {
    v36 = 0;
    safeAssignError(&v36, 0x80000000, 0, @"nil command to send", v8, v9, v10, v11, v32);
    v25 = v36;
LABEL_16:
    id v22 = v25;
    v23 = 0;
    v21 = 0;
    goto LABEL_9;
  }
  if (!v7)
  {
    v35 = 0;
    safeAssignError(&v35, 0x80000000, 0, @"nil payload to send", v8, v9, v10, v11, v32);
    v25 = v35;
    goto LABEL_16;
  }
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_59);
  }
  uint64_t v13 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSString;
    uint64_t v15 = v13;
    uint64_t v16 = [v6 code];
    v17 = [v6 apdu];
    uint64_t v18 = [v14 stringWithFormat:@"Sending command %ld with apdu %@", v16, v17];
    *(_DWORD *)buf = 138543618;
    v38 = self;
    __int16 v39 = 2114;
    v40 = v18;
    _os_log_impl(&dword_2309BC000, v15, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
  }
  id v19 = [(MIBUNFCReaderSession *)self readerSession];
  uint64_t v20 = [v6 apdu];
  id v34 = 0;
  v21 = [v19 transceive:v20 error:&v34];
  id v22 = v34;

  v23 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "getResponseClass")), "initWithResponsePayload:", v21);
  if (!v23)
  {
    id v33 = v22;
    uint64_t v26 = [v6 code];
    safeAssignError(&v33, 2147483650, 0, @"Failed to deserialize NFC response for command: %ld", v27, v28, v29, v30, v26);
    id v31 = v33;

    id v22 = v31;
  }
LABEL_9:
  if (a4) {
    *a4 = v22;
  }

  return v23;
}

void __46__MIBUNFCReaderSession_sendCommand_withError___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 count])
  {
    [(MIBUNFCReaderSession *)self setTags:v5];
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_67_1);
    }
    uint64_t v6 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSString;
      uint64_t v8 = v6;
      uint64_t v9 = [(MIBUNFCReaderSession *)self tags];
      uint64_t v10 = [v9 objectAtIndex:0];
      uint64_t v11 = [v7 stringWithFormat:@"Trying to connect to tag: %@", v10];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      id v31 = v11;
      _os_log_impl(&dword_2309BC000, v8, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v12 = [(MIBUNFCReaderSession *)self readerSession];
    uint64_t v13 = [(MIBUNFCReaderSession *)self tags];
    uint64_t v14 = [v13 objectAtIndex:0];
    id v27 = 0;
    char v15 = [v12 connectTag:v14 error:&v27];
    id v16 = v27;

    if (v15)
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_79_0);
      }
      v17 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = NSString;
        id v19 = v17;
        uint64_t v20 = [v18 stringWithFormat:@"Connected to tag successfully"];
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = self;
        __int16 v30 = 2114;
        id v31 = v20;
        _os_log_impl(&dword_2309BC000, v19, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_73_1);
      }
      v25 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUNFCReaderSession readerSession:didDetectTags:]((uint64_t)self, v25, (uint64_t)v16);
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_85);
    }
    v21 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = NSString;
      v23 = v21;
      v24 = [v22 stringWithFormat:@"No tags available to connect to"];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      id v31 = v24;
      _os_log_impl(&dword_2309BC000, v23, OS_LOG_TYPE_DEFAULT, "Device %{public}@: %{public}@", buf, 0x16u);
    }
    id v16 = 0;
  }
  uint64_t v26 = [(MIBUNFCReaderSession *)self connectSem];
  dispatch_semaphore_signal(v26);
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_71()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_77()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __52__MIBUNFCReaderSession_readerSession_didDetectTags___block_invoke_83()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)suppressLogging
{
  return self->_suppressLogging;
}

- (void)setSuppressLogging:(BOOL)a3
{
  self->_suppressLogging = a3;
}

- (NFSession)nfSession
{
  return self->_nfSession;
}

- (void)setNfSession:(id)a3
{
}

- (NFReaderSession)readerSession
{
  return self->_readerSession;
}

- (void)setReaderSession:(id)a3
{
}

- (NSArray)tags
{
  return self->_tags;
}

- (void)setTags:(id)a3
{
}

- (OS_dispatch_semaphore)connectSem
{
  return self->_connectSem;
}

- (void)setConnectSem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectSem, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_readerSession, 0);

  objc_storeStrong((id *)&self->_nfSession, 0);
}

void __30__MIBUNFCReaderSession_start___block_invoke_16_cold_1(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = NSString;
  uint64_t v5 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  uint64_t v6 = a3;
  uint64_t v7 = [v4 stringWithFormat:@"Failed to start polling : %@", v5];
  *(_DWORD *)buf = 138543618;
  uint64_t v9 = v3;
  OUTLINED_FUNCTION_1_4();
  _os_log_error_impl(&dword_2309BC000, v6, OS_LOG_TYPE_ERROR, "Device Error %{public}@: %{public}@", buf, 0x16u);
}

void __30__MIBUNFCReaderSession_start___block_invoke_16_cold_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = NSString;
  uint64_t v4 = a2;
  uint64_t v5 = [v3 stringWithFormat:@"Failed to start NFReader session"];
  int v6 = 138543618;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_2309BC000, v4, OS_LOG_TYPE_ERROR, "Device Error %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)disconnectTag:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = NSString;
  id v5 = a2;
  uint64_t v13 = a3;
  int v6 = [v4 stringWithFormat:@"Failed to disconnect : %@"];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_2(&dword_2309BC000, v7, v8, "Device Error %{public}@: %{public}@", v9, v10, v11, v12, v13, v14, 2u);
}

- (void)readerSession:(uint64_t)a3 didDetectTags:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = NSString;
  id v5 = a2;
  uint64_t v13 = a3;
  int v6 = [v4 stringWithFormat:@"Error encountered when connecting to tag: %@"];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_2(&dword_2309BC000, v7, v8, "Device Error %{public}@: %{public}@", v9, v10, v11, v12, v13, v14, 2u);
}

@end