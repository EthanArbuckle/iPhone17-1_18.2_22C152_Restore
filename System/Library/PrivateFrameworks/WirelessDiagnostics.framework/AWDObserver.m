@interface AWDObserver
- (AWDObserver)init;
- (void)setConfiguration:(id)a3 callback:(id)a4;
- (void)setDelegate:(id)a3 queue:(dispatch_queue_s *)a4;
@end

@implementation AWDObserver

- (AWDObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)AWDObserver;
  return [(AWDObserver *)&v3 init];
}

- (void)setDelegate:(id)a3 queue:(dispatch_queue_s *)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v4, 2u);
  }
}

- (void)setConfiguration:(id)a3 callback:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D3E18000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "WirelessDiagnostics is deprecated and has been removed. Please migrate to Core Analytics.", v9, 2u);
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = @"Wireless Diagnostics is deprecated and has been removed. Please migrate to Core Analytics.";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.awd" code:-1 userInfo:v7];
  v6[2](v6, 0, v8);
}

@end