@interface TVRUICoreDeviceQuery
- (BOOL)hasStarted;
- (NSMutableDictionary)deviceList;
- (TVRCDeviceQuery)query;
- (TVRUIDeviceSearchDelegate)delegate;
- (void)deviceQueryDidUpdateDevices:(id)a3;
- (void)didUpdateSuggestedDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setQuery:(id)a3;
- (void)startQuery:(id)a3 completionHandler:(id)a4;
- (void)stop;
@end

@implementation TVRUICoreDeviceQuery

- (void)startQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TVRUICoreDeviceQuery *)self setDelegate:v6];
  id v8 = objc_alloc_init(MEMORY[0x263F7C9A0]);
  [(TVRUICoreDeviceQuery *)self setQuery:v8];

  v9 = [(TVRUICoreDeviceQuery *)self query];
  [v9 setDelegate:self];

  v10 = [MEMORY[0x263EFF9A0] dictionary];
  [(TVRUICoreDeviceQuery *)self setDeviceList:v10];

  v11 = _TVRUIDeviceQueryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227326000, v11, OS_LOG_TYPE_DEFAULT, "UI requesting device query to start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v12 = [(TVRUICoreDeviceQuery *)self query];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke;
  v14[3] = &unk_264800998;
  objc_copyWeak(&v16, buf);
  id v13 = v7;
  id v15 = v13;
  [v12 startWithCompletionHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

void __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke_2;
    v5[3] = &unk_264800970;
    id v6 = *(id *)(a1 + 32);
    char v7 = a2;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)hasStarted
{
  v2 = [(TVRUICoreDeviceQuery *)self query];

  return v2 != 0;
}

- (void)stop
{
  v3 = [(TVRUICoreDeviceQuery *)self query];

  if (v3)
  {
    v4 = _TVRUIDeviceQueryLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "UI requesting device query to stop", v6, 2u);
    }

    v5 = [(TVRUICoreDeviceQuery *)self query];
    [v5 stop];

    [(TVRUICoreDeviceQuery *)self setQuery:0];
  }
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRUIDeviceQueryLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 devices];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = [v6 count];
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Device query did update. Num devices %ld ", buf, 0xCu);
  }
  char v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = _TVRUIDeviceQueryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(TVRUICoreDeviceQuery *)self deviceList];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = (uint64_t)v9;
    _os_log_impl(&dword_227326000, v8, OS_LOG_TYPE_DEFAULT, "Old device list: %{public}@", buf, 0xCu);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v28 = v4;
  v10 = [v4 devices];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v16 = [(TVRUICoreDeviceQuery *)self deviceList];
        v17 = [v15 identifier];
        id v18 = [v16 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v18 = [[TVRUICoreDevice alloc] _initWithCoreDevice:v15];
          v19 = _TVRUIDeviceQueryLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = (uint64_t)v18;
            __int16 v35 = 2114;
            v36 = v15;
            _os_log_impl(&dword_227326000, v19, OS_LOG_TYPE_DEFAULT, "Adding new uidevice: %{public}@ for core device: %{public}@", buf, 0x16u);
          }
        }
        v20 = [v15 identifier];
        [v7 setObject:v18 forKeyedSubscript:v20];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v12);
  }

  v21 = [(TVRUICoreDeviceQuery *)self deviceList];
  [v21 removeAllObjects];

  [(TVRUICoreDeviceQuery *)self setDeviceList:v7];
  v22 = _TVRUIDeviceQueryLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(TVRUICoreDeviceQuery *)self deviceList];
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = (uint64_t)v23;
    _os_log_impl(&dword_227326000, v22, OS_LOG_TYPE_DEFAULT, "New device list: %{public}@", buf, 0xCu);
  }
  v24 = [(TVRUICoreDeviceQuery *)self delegate];

  if (v24)
  {
    v25 = [(TVRUICoreDeviceQuery *)self delegate];
    v26 = [(TVRUICoreDeviceQuery *)self deviceList];
    v27 = [v26 allValues];
    [v25 deviceListUpdated:v27];
  }
}

- (void)didUpdateSuggestedDevices:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[TVRUIFeatures corianderEnabled])
  {
    v5 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
          uint64_t v12 = [(TVRUICoreDeviceQuery *)self deviceList];
          uint64_t v13 = [v11 identifier];
          v14 = [v12 objectForKeyedSubscript:v13];

          id v15 = _TVRUIDeviceQueryLog();
          id v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v14;
              __int16 v27 = 2112;
              v28 = v11;
              _os_log_impl(&dword_227326000, v16, OS_LOG_TYPE_DEFAULT, "Found coreUIDevice:%@ for device:%@", buf, 0x16u);
            }

            [v5 addObject:v14];
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v11;
              _os_log_error_impl(&dword_227326000, v16, OS_LOG_TYPE_ERROR, "Cannot find coredevice for device:%@", buf, 0xCu);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v8);
    }

    v17 = [(TVRUICoreDeviceQuery *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [(TVRUICoreDeviceQuery *)self delegate];
      [v19 suggestedDevices:v5];
    }
    id v4 = v20;
  }
}

- (TVRUIDeviceSearchDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRUIDeviceSearchDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSMutableDictionary)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end