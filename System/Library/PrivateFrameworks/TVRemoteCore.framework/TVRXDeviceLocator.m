@interface TVRXDeviceLocator
- (NSMutableDictionary)searches;
- (TVRXDeviceLocator)init;
- (TVRXDeviceQuery)query;
- (void)_timerExpired:(id)a3;
- (void)cancelSearchForDeviceWithIdentifier:(id)a3;
- (void)deviceQueryDidUpdateDevices:(id)a3;
- (void)findDeviceWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)setQuery:(id)a3;
- (void)setSearches:(id)a3;
@end

@implementation TVRXDeviceLocator

- (TVRXDeviceLocator)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVRXDeviceLocator;
  v2 = [(TVRXDeviceLocator *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(TVRXDeviceQuery);
    query = v2->_query;
    v2->_query = v3;

    [(TVRXDeviceQuery *)v2->_query setDelegate:v2];
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    searches = v2->_searches;
    v2->_searches = v5;
  }
  return v2;
}

- (void)findDeviceWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v12 = objc_alloc_init(_TVRXSearchReference);
  [(_TVRXSearchReference *)v12 setIdentifier:v9];
  v10 = (void *)MEMORY[0x22A6592D0](v8);

  [(_TVRXSearchReference *)v12 setCompletionBlock:v10];
  v11 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__timerExpired_ selector:v12 userInfo:0 repeats:a4];
  [(_TVRXSearchReference *)v12 setExpirationTimer:v11];
  [(NSMutableDictionary *)self->_searches setObject:v12 forKey:v9];

  [(TVRXDeviceQuery *)self->_query start];
}

- (void)cancelSearchForDeviceWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Device Locator: Cancelling search with identifier %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(NSMutableDictionary *)self->_searches allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 identifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;

          if (v14)
          {
            [(NSMutableDictionary *)self->_searches removeObjectForKey:v4];
            if (![(NSMutableDictionary *)self->_searches count]) {
              [(TVRXDeviceQuery *)self->_query stop];
            }
          }
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_15:
}

- (void)_timerExpired:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  v5 = _TVRCGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 identifier];
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Device Locator: Timer expired while looking for search with identifier %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = [v4 completionBlock];
  uint64_t v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  searches = self->_searches;
  v10 = [v4 identifier];
  [(NSMutableDictionary *)searches removeObjectForKey:v10];

  if (![(NSMutableDictionary *)self->_searches count]) {
    [(TVRXDeviceQuery *)self->_query stop];
  }
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [a3 devices];
  uint64_t v25 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v25)
  {
    uint64_t v5 = *(void *)v31;
    uint64_t v23 = *(void *)v31;
    v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "identifier", v23, v24);
        uint64_t v9 = [v7 alternateIdentifiers];
        v10 = [v9 allValues];

        id v11 = [(NSMutableDictionary *)self->_searches objectForKey:v8];
        if (v11)
        {
LABEL_17:
          long long v18 = _TVRCGeneralLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = [v11 identifier];
            *(_DWORD *)buf = 138412290;
            v35 = v19;
            _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Device Locator: Found device in query with identifier %@", buf, 0xCu);
          }
          v20 = [v11 expirationTimer];
          [v20 invalidate];

          uint64_t v21 = [v11 completionBlock];
          uint64_t v22 = (void *)v21;
          if (v21) {
            (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v7);
          }
          [(NSMutableDictionary *)self->_searches removeObjectForKey:v8];
          if (![(NSMutableDictionary *)self->_searches count]) {
            [(TVRXDeviceQuery *)self->_query stop];
          }
        }
        else
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v27;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [(NSMutableDictionary *)self->_searches objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * j)];
                if (v16)
                {
                  long long v17 = (void *)v16;

                  id v11 = v17;
                  uint64_t v5 = v23;
                  id v4 = v24;
                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v36 count:16];
              if (v13) {
                continue;
              }
              break;
            }
            uint64_t v5 = v23;
            id v4 = v24;
          }
        }
      }
      uint64_t v25 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v25);
  }
}

- (TVRXDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSMutableDictionary)searches
{
  return self->_searches;
}

- (void)setSearches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searches, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end