@interface WPRanging
- (WPRanging)initWithDelegate:(id)a3 queue:(id)a4;
- (WPRangingDelegate)delegate;
- (id)clientAsString;
- (void)enableRanging:(BOOL)a3;
- (void)enableRanging:(BOOL)a3 reply:(id)a4;
- (void)invalidate;
- (void)isRangingEnabledReply:(id)a3;
- (void)rangingEnabled:(BOOL)a3 withError:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stateDidChange:(int64_t)a3;
@end

@implementation WPRanging

- (WPRanging)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[WPClient supportsRanging])
  {
    v13.receiver = self;
    v13.super_class = (Class)WPRanging;
    v8 = [(WPClient *)&v13 initWithQueue:v7 machName:0];
    v9 = v8;
    if (v8) {
      objc_storeWeak((id *)&v8->_delegate, v6);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_2);
    }
    v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
      -[WPRanging initWithDelegate:queue:](v11);
    }
    v10 = 0;
  }

  return v10;
}

- (id)clientAsString
{
  return @"WPRanging";
}

- (void)invalidate
{
  [(WPRanging *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)WPRanging;
  [(WPClient *)&v3 invalidate];
}

- (void)enableRanging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_119);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "Ranging enableRanging:%d", buf, 8u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__WPRanging_enableRanging___block_invoke_120;
  v7[3] = &unk_26420E6F8;
  v7[4] = self;
  BOOL v8 = v3;
  v6.receiver = self;
  v6.super_class = (Class)WPRanging;
  [(WPClient *)&v6 enableRanging:v3 reply:v7];
}

uint64_t __27__WPRanging_enableRanging___block_invoke_120(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rangingEnabled:*(unsigned __int8 *)(a1 + 40) withError:a2];
}

- (void)enableRanging:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_125);
  }
  id v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v4;
    _os_log_impl(&dword_2144AA000, v7, OS_LOG_TYPE_DEFAULT, "WPRanging enable ranging:%d with reply", buf, 8u);
  }
  v8.receiver = self;
  v8.super_class = (Class)WPRanging;
  [(WPClient *)&v8 enableRanging:v4 reply:v6];
}

- (void)isRangingEnabledReply:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_127);
  }
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2144AA000, v5, OS_LOG_TYPE_DEFAULT, "WPRanging is ranging enabled?", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)WPRanging;
  [(WPClient *)&v6 isRangingEnabledReply:v4];
}

- (void)stateDidChange:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WPRanging;
  [(WPClient *)&v7 stateDidChange:a3];
  id v4 = [(WPRanging *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(WPRanging *)self delegate];
    [v6 rangingDidUpdateState:self];
  }
}

- (void)rangingEnabled:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  objc_super v6 = [(WPRanging *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    objc_super v8 = [(WPRanging *)self delegate];
    [v8 ranging:self enabled:v4 withError:v9];
  }
}

- (WPRangingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WPRangingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDelegate:(os_log_t)log queue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Ranging is not supported on this platform", v1, 2u);
}

@end