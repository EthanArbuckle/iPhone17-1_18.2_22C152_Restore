@interface TPSEventsProvider
- (TPSEventsProviderDelegate)delegate;
- (void)deregisterAllEventsForCallback;
- (void)deregisterEventsForCallback:(id)a3;
- (void)queryEvents:(id)a3;
- (void)registerEventsForCallback:(id)a3;
- (void)registerEventsForWakingCallback:(id)a3 clientIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation TPSEventsProvider

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (TPSEventsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSEventsProviderDelegate *)WeakRetained;
}

- (void)queryEvents:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "queryEvents not supported for %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)registerEventsForCallback:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "registerEventsForCallback not supported for %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)registerEventsForWakingCallback:(id)a3 clientIdentifier:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = +[TPSLogger default];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19C8DC000, v4, OS_LOG_TYPE_DEFAULT, "registerEventsForWakingCallback not supported for %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)deregisterEventsForCallback:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = +[TPSLogger default];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl(&dword_19C8DC000, v3, OS_LOG_TYPE_DEFAULT, "deregisterEventsForCallback not supported for %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)deregisterAllEventsForCallback
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = +[TPSLogger default];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_19C8DC000, v2, OS_LOG_TYPE_DEFAULT, "deregisterEventsForCallback not supported for %@", (uint8_t *)&v5, 0xCu);
  }
}

@end