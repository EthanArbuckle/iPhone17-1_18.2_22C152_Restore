@interface SWLogger
- (NSMutableDictionary)values;
- (SWLogger)init;
- (id)constructLogWithMessage:(id)a3;
- (void)bindValue:(id)a3 forKey:(id)a4;
- (void)log:(id)a3;
- (void)logError:(id)a3;
- (void)logSensitive:(id)a3;
@end

@implementation SWLogger

- (SWLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)SWLogger;
  v2 = [(SWLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)bindValue:(id)a3 forKey:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SWLogger *)self values];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)log:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(SWLogger *)self constructLogWithMessage:a3];
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_224D22000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)logError:(id)a3
{
  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_ERROR)) {
    [(SWLogger *)v5 logError:(uint64_t)a3];
  }
}

- (void)logSensitive:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = (void *)SWDefaultLog;
  if (os_log_type_enabled((os_log_t)SWDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(SWLogger *)self constructLogWithMessage:a3];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_224D22000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)constructLogWithMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v14 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"["];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(SWLogger *)self values];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(SWLogger *)self values];
        v12 = [v11 objectForKey:v10];
        [v4 appendFormat:@"%@=%@", v10, v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"] "];
  [v4 appendString:v14];

  return v4;
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void).cxx_destruct
{
}

- (void)logError:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = a1;
  uint64_t v6 = [a2 constructLogWithMessage:a3];
  int v7 = 138543362;
  uint64_t v8 = v6;
  _os_log_error_impl(&dword_224D22000, v5, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
}

@end