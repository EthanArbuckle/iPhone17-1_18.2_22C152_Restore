@interface MKGETStatusRouter
- (int64_t)preferredChannel;
- (int64_t)state;
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
- (void)setPreferredChannel:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation MKGETStatusRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v28 = a5;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v27 = self;
  v7 = [NSNumber numberWithInteger:self->_state];
  [v6 setObject:v7 forKey:@"state"];

  v8 = objc_alloc_init(MKDevice);
  v9 = [(MKDevice *)v8 systemName];
  [v6 setObject:v9 forKey:@"system_name"];

  v10 = [(MKDevice *)v8 systemVersion];
  [v6 setObject:v10 forKey:@"system_version"];

  v11 = [(MKDevice *)v8 deviceName];
  [v6 setObject:v11 forKey:@"device_name"];

  v12 = [(MKDevice *)v8 deviceFamily];
  [v6 setObject:v12 forKey:@"device_family"];

  v13 = [(MKDevice *)v8 deviceModel];
  [v6 setObject:v13 forKey:@"device_model"];

  v14 = objc_alloc_init(MKWiFiDevice);
  v15 = [(MKWiFiDevice *)v14 currentNetwork];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v16 = [v15 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v22 = [v15 objectForKeyedSubscript:v21];
        [v6 setObject:v22 forKey:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  v23 = [NSNumber numberWithInteger:v27->_preferredChannel];
  [v6 setObject:v23 forKey:@"ap1"];

  id v29 = 0;
  v24 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v29];
  id v25 = v29;
  if (v25)
  {
    v26 = +[MKLog log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MKGETStatusRouter server:didReceiveRequest:response:]((uint64_t)v25, v26);
    }
  }
  [v28 setBody:v24];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(int64_t)a3
{
  self->_preferredChannel = a3;
}

- (void)server:(uint64_t)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "error=%@", (uint8_t *)&v2, 0xCu);
}

@end