@interface TVRXDeviceQuery
- (BOOL)isRunning;
- (NSMutableDictionary)deviceMap;
- (NSSet)devices;
- (TVRCMatchPointDeviceQuery)matchPointQuery;
- (TVRCRapportDeviceQuery)rapportDeviceQuery;
- (TVRXDeviceQuery)init;
- (TVRXDeviceQueryDelegate)delegate;
- (_TVRCRMSDeviceQuery)rmsDeviceQuery;
- (id)_findDeviceForIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (void)_notifyDelegateDidUpdateDevices;
- (void)_startSearch;
- (void)_stopSearch;
- (void)addedDevice:(id)a3;
- (void)removedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceMap:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setMatchPointQuery:(id)a3;
- (void)setRapportDeviceQuery:(id)a3;
- (void)setRmsDeviceQuery:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation TVRXDeviceQuery

- (TVRXDeviceQuery)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRXDeviceQuery;
  v2 = [(TVRXDeviceQuery *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceMap = v2->_deviceMap;
    v2->_deviceMap = v3;
  }
  return v2;
}

- (NSSet)devices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSMutableDictionary *)self->_deviceMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v9 = (void *)[v3 copy];

  return (NSSet *)v9;
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_isRunning)
  {
    [(TVRXDeviceQuery *)self _notifyDelegateDidUpdateDevices];
  }
  else
  {
    id v3 = _TVRCGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = self;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> starting.", (uint8_t *)&v4, 0xCu);
    }

    self->_isRunning = 1;
    [(NSMutableDictionary *)self->_deviceMap removeAllObjects];
    [(TVRXDeviceQuery *)self _startSearch];
  }
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_isRunning)
  {
    id v3 = _TVRCGeneralLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = self;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> stopping.", (uint8_t *)&v4, 0xCu);
    }

    self->_isRunning = 0;
    [(TVRXDeviceQuery *)self _stopSearch];
    [(NSMutableDictionary *)self->_deviceMap removeAllObjects];
  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)_startSearch
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = _TVRCGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    long long v12 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> has Rapport enabled.", (uint8_t *)&v11, 0xCu);
  }

  int v4 = objc_alloc_init(TVRCRapportDeviceQuery);
  rapportDeviceQuery = self->_rapportDeviceQuery;
  self->_rapportDeviceQuery = v4;

  [(TVRCRapportDeviceQuery *)self->_rapportDeviceQuery setDelegate:self];
  [(TVRCRapportDeviceQuery *)self->_rapportDeviceQuery start];
  if (!+[TVRCFeatures legacyDevicesDisabled])
  {
    uint64_t v6 = _TVRCGeneralLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      long long v12 = self;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> has Legacy devices enabled.", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v7 = objc_alloc_init(_TVRCRMSDeviceQuery);
    rmsDeviceQuery = self->_rmsDeviceQuery;
    self->_rmsDeviceQuery = v7;

    [(_TVRCRMSDeviceQuery *)self->_rmsDeviceQuery setDelegate:self];
    [(_TVRCRMSDeviceQuery *)self->_rmsDeviceQuery start];
  }
  v9 = objc_alloc_init(TVRCMatchPointDeviceQuery);
  matchPointQuery = self->_matchPointQuery;
  self->_matchPointQuery = v9;

  [(TVRCMatchPointDeviceQuery *)self->_matchPointQuery setDelegate:self];
  [(TVRCMatchPointDeviceQuery *)self->_matchPointQuery start];
}

- (void)_stopSearch
{
  [(TVRCMatchPointDeviceQuery *)self->_matchPointQuery setDelegate:0];
  [(TVRCMatchPointDeviceQuery *)self->_matchPointQuery stop];
  matchPointQuery = self->_matchPointQuery;
  self->_matchPointQuery = 0;

  [(TVRCRapportDeviceQuery *)self->_rapportDeviceQuery stop];
  [(TVRCRapportDeviceQuery *)self->_rapportDeviceQuery setDelegate:0];
  rapportDeviceQuery = self->_rapportDeviceQuery;
  self->_rapportDeviceQuery = 0;

  [(_TVRCRMSDeviceQuery *)self->_rmsDeviceQuery stop];
  [(_TVRCRMSDeviceQuery *)self->_rmsDeviceQuery setDelegate:0];
  rmsDeviceQuery = self->_rmsDeviceQuery;
  self->_rmsDeviceQuery = 0;
}

- (id)_findDeviceForIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_deviceMap objectForKey:v6];
  if (!v7)
  {
    if (v6)
    {
      if (v4)
      {
        id v7 = [[TVRXDevice alloc] _init];
        [(NSMutableDictionary *)self->_deviceMap setObject:v7 forKey:v6];
        goto LABEL_9;
      }
    }
    else
    {
      v8 = _TVRCGeneralLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TVRXDeviceQuery _findDeviceForIdentifier:createIfNeeded:](v8);
      }
    }
    id v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)_notifyDelegateDidUpdateDevices
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 deviceQueryDidUpdateDevices:self];
  }
}

- (void)addedDevice:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Found new device %{public}@.", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [v4 identifier];
  id v7 = [(TVRXDeviceQuery *)self _findDeviceForIdentifier:v6 createIfNeeded:1];

  [v7 addDeviceImpl:v4];
  [(TVRXDeviceQuery *)self _notifyDelegateDidUpdateDevices];
}

- (void)removedDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Removed device %{public}@.", (uint8_t *)&v12, 0x16u);
  }

  id v6 = [v4 identifier];
  id v7 = [(TVRXDeviceQuery *)self _findDeviceForIdentifier:v6 createIfNeeded:0];

  int v8 = _TVRCGeneralLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v12 = 134217984;
      uint64_t v13 = self;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Device existed for removed television.", (uint8_t *)&v12, 0xCu);
    }

    [v7 removeDeviceImpl:v4];
    if ([v7 isEmpty])
    {
      deviceMap = self->_deviceMap;
      id v11 = [v4 identifier];
      [(NSMutableDictionary *)deviceMap removeObjectForKey:v11];
    }
    [(TVRXDeviceQuery *)self _notifyDelegateDidUpdateDevices];
  }
  else
  {
    if (v9)
    {
      int v12 = 134218242;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "<TVRXDeviceQuery %p> Failed to remove device %@ because it doesn't exist.", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (TVRXDeviceQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRXDeviceQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (NSMutableDictionary)deviceMap
{
  return self->_deviceMap;
}

- (void)setDeviceMap:(id)a3
{
}

- (TVRCRapportDeviceQuery)rapportDeviceQuery
{
  return self->_rapportDeviceQuery;
}

- (void)setRapportDeviceQuery:(id)a3
{
}

- (_TVRCRMSDeviceQuery)rmsDeviceQuery
{
  return self->_rmsDeviceQuery;
}

- (void)setRmsDeviceQuery:(id)a3
{
}

- (TVRCMatchPointDeviceQuery)matchPointQuery
{
  return self->_matchPointQuery;
}

- (void)setMatchPointQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchPointQuery, 0);
  objc_storeStrong((id *)&self->_rmsDeviceQuery, 0);
  objc_storeStrong((id *)&self->_rapportDeviceQuery, 0);
  objc_storeStrong((id *)&self->_deviceMap, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_findDeviceForIdentifier:(os_log_t)log createIfNeeded:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2266D3000, log, OS_LOG_TYPE_ERROR, "Device with nil identifier", v1, 2u);
}

@end