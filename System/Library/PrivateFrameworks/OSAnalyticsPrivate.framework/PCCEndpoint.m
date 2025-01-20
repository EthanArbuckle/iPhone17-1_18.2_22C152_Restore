@interface PCCEndpoint
- (BOOL)isDeviceNearby:(id)a3;
- (NSArray)deviceIds;
- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)send:(id)a3 message:(id)a4 error:(id *)a5;
- (id)synchronize:(id)a3 withOptions:(id)a4;
- (unsigned)fileTimeout;
- (void)runWithDelegate:(id)a3;
- (void)setFileTimeout:(unsigned int)a3;
@end

@implementation PCCEndpoint

- (void)runWithDelegate:(id)a3
{
}

- (BOOL)isDeviceNearby:(id)a3
{
  return 0;
}

- (id)synchronize:(id)a3 withOptions:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"method not supported";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"ProxyEndpointErrorDomain" code:1 userInfo:v5];

  return v6;
}

- (id)send:(id)a3 message:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ERROR: PCCEndpoint::sendMessage: doesn't do anything", v12, 2u);
  }
  if (a5)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"method not supported";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a5 = [v9 errorWithDomain:@"ProxyEndpointErrorDomain" code:1 userInfo:v10];
  }
  return 0;
}

- (id)send:(id)a3 file:(id)a4 metadata:(id)a5 error:(id *)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DBFFE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ERROR: PCCEndpoint::sendFile:metadata doesn't do anything", v15, 2u);
  }
  if (a6)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"method not supported";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a6 = [v12 errorWithDomain:@"ProxyEndpointErrorDomain" code:1 userInfo:v13];
  }
  return 0;
}

- (unsigned)fileTimeout
{
  return self->_fileTimeout;
}

- (void)setFileTimeout:(unsigned int)a3
{
  self->_fileTimeout = a3;
}

- (NSArray)deviceIds
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIds, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end