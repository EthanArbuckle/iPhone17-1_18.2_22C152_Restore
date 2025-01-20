@interface SidecarCoreProxy
+ (SidecarCoreProxy)defaultProxy;
- (SidecarServicePresenterDelegate)presenterDelegate;
- (SidecarSessionDelegate)delegate;
- (void)relayPresenterServiceExtensionReady:(id)a3;
- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4;
- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6;
- (void)relaySession:(int64_t)a3 closedWithError:(id)a4;
- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5;
- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(unint64_t)a5;
- (void)relayTerminateService;
- (void)setDelegate:(id)a3;
- (void)setPresenterDelegate:(id)a3;
@end

@implementation SidecarCoreProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterDelegate, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setPresenterDelegate:(id)a3
{
}

- (SidecarServicePresenterDelegate)presenterDelegate
{
  return self->_presenterDelegate;
}

- (void)setDelegate:(id)a3
{
}

- (SidecarSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)relayTerminateService
{
  [(SidecarServicePresenterDelegate *)self->_presenterDelegate sidecarServicePresenterTerminate];
  delegate = self->_delegate;

  [(SidecarSessionDelegate *)delegate sidecarServiceTerminate];
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
}

- (void)relaySession:(int64_t)a3 stream:(id)a4 status:(unint64_t)a5
{
  BOOL v7 = self->_delegate != 0;
  id v8 = a4;
  SidecarSessionWithHandle(a3, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  v10 = SidecarSessionGetStreams(v12, 0);
  v11 = [v10 objectForKeyedSubscript:v9];

  [v11 setStatus:a5];
}

- (void)relaySession:(int64_t)a3 receivedOPACKData:(id)a4 dataLink:(int64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v20 = 0;
  id v8 = SidecarOPACKDecode(a4, &v20);
  id v9 = v20;
  if (v9)
  {
    v10 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    v11 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v9 domain];
      uint64_t v13 = [v9 code];
      v14 = [v9 localizedDescription];
      *(_DWORD *)buf = 138543875;
      int64_t v22 = (int64_t)v12;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      __int16 v25 = 2113;
      v26 = v14;
      _os_log_impl(&dword_22D954000, v11, OS_LOG_TYPE_ERROR, "proxy: %{public}@ (%ld) %{private}@", buf, 0x20u);
    }
  }
  else
  {
    v15 = SidecarSessionWithHandle(a3, self->_delegate != 0);
    v11 = v15;
    if (v15)
    {
      v15[6].isa = (Class)a5;
      uint64_t v16 = 3;
      if (a5 == 4) {
        uint64_t v16 = 1;
      }
      uint64_t v17 = 2;
      if ((a5 & 0xFFFFFFFE) != 8) {
        uint64_t v17 = v16;
      }
      v15[4].isa = (Class)v17;
      v18 = [v15 delegate];
      [v18 sidecarSession:v11 receivedMessage:v8];
    }
    else
    {
      v19 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v18 = v19;
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v22 = a3;
        _os_log_impl(&dword_22D954000, v18, OS_LOG_TYPE_ERROR, "unknown session %lX received OPACK", buf, 0xCu);
      }
    }
  }
}

- (void)relaySession:(id)a3 openedByDevice:(id)a4 dataLink:(int64_t)a5 service:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  [v10 getUUIDBytes:buf];
  uint64_t v13 = bswap32(*(unsigned int *)buf);
  v14 = SidecarSessionGetFromRemoteMapTable(v13);

  if (v14)
  {
    v15 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    uint64_t v16 = v15;
    if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_22D954000, v16, OS_LOG_TYPE_ERROR, "session %lX already open", buf, 0xCu);
    }
  }
  else
  {
    id v27 = 0;
    uint64_t v17 = [[SidecarSession alloc] initWithRemote:v10 device:v11 dataLink:a5 service:v12 error:&v27];
    v18 = v27;
    uint64_t v16 = v18;
    if (v17)
    {
      v19 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
      id v20 = v19;
      if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        __int16 v29 = 2114;
        id v30 = v12;
        __int16 v31 = 2048;
        int64_t v32 = a5;
        _os_log_impl(&dword_22D954000, v20, OS_LOG_TYPE_INFO, "session %lX opened by device %{public}@ (%{public}@) [%ld]", buf, 0x2Au);
      }

      [(SidecarSessionDelegate *)self->_delegate sidecarSessionStarted:v17];
    }
    else
    {
      v21 = v18;
      if (v21)
      {
        int64_t v22 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
        __int16 v23 = v22;
        if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = [v21 domain];
          uint64_t v25 = [v21 code];
          v26 = [v21 localizedDescription];
          *(_DWORD *)buf = 138543875;
          *(void *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v25;
          __int16 v29 = 2113;
          id v30 = v26;
          _os_log_impl(&dword_22D954000, v23, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);
        }
      }
    }
  }
}

- (void)relaySession:(int64_t)a3 closedWithError:(id)a4
{
  id v6 = a4;
  BOOL v7 = self->_delegate;
  uint64_t v8 = SidecarSessionWithHandle(a3, v7 != 0);
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [(SidecarSessionDelegate *)self->_delegate sidecarSession:v8 closedWithError:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __SidecarSessionRemoveFromRemoteMapTable_block_invoke;
    v11[3] = &__block_descriptor_40_e25_v16__0__SidecarMapTable_8l;
    v11[4] = a3;
    SidecarSessionWithMapTable((void (*)(void))SidecarMapTableCreateStrong, &__SidecarSessionRemoteMapTable, v11);
  }
  [v9 _closeWithError:v6];
}

+ (SidecarCoreProxy)defaultProxy
{
  if (defaultProxy_once_744 != -1) {
    dispatch_once(&defaultProxy_once_744, &__block_literal_global_745);
  }
  v2 = (void *)defaultProxy_proxy_746;

  return (SidecarCoreProxy *)v2;
}

uint64_t __32__SidecarCoreProxy_defaultProxy__block_invoke()
{
  defaultProxy_proxy_746 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

@end