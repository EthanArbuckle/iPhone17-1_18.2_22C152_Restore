@interface POSessionDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation POSessionDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v6 = (void (**)(id, void, void *))a5;
  v7 = [a4 protectionSpace];
  uint64_t v8 = [v7 serverTrust];

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    v9 = PO_LOG_POLoginConfiguration();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POSessionDelegate URLSession:didReceiveChallenge:completionHandler:](v9);
    }

    v10 = (void *)[objc_alloc(MEMORY[0x263F08BB8]) initWithTrust:v8];
    v6[2](v6, 0, v10);
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (void)URLSession:(os_log_t)log didReceiveChallenge:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "Platform SSO test mode enabled", v1, 2u);
}

@end