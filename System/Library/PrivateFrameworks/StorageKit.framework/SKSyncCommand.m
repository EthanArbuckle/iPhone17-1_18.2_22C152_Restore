@interface SKSyncCommand
- (BOOL)returnWithError:(id *)a3;
- (NSError)error;
- (void)onCallbackWithError:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SKSyncCommand

- (void)onCallbackWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SKSyncCommand *)self setError:v4];
  if (v4)
  {
    v5 = SKGetOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SKSyncCommand onCallbackWithError:]";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_23F40C000, v5, OS_LOG_TYPE_ERROR, "%s: Error details: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)returnWithError:(id *)a3
{
  v5 = [(SKSyncCommand *)self error];

  if (a3 && v5)
  {
    *a3 = [(SKSyncCommand *)self error];
  }
  int v6 = [(SKSyncCommand *)self error];
  BOOL v7 = v6 == 0;

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end