@interface PDCLSBackedApplicationEnvironment
- (NSEnumerator)allApplications;
- (PDCLSBackedApplicationEnvironment)init;
- (id)applicationIdentityForIdentityString:(id)a3;
- (id)applicationRecordForBundleIdentifier:(id)a3;
- (id)monitorAppEventsWithDelegate:(id)a3 onQueue:(id)a4;
@end

@implementation PDCLSBackedApplicationEnvironment

- (PDCLSBackedApplicationEnvironment)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDCLSBackedApplicationEnvironment;
  v2 = [(PDCLSBackedApplicationEnvironment *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F01880] defaultWorkspace];
    workspace = v2->_workspace;
    v2->_workspace = (LSApplicationWorkspace *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)applicationRecordForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(PDCLSBackedApplicationEnvironment *)(uint64_t)v3 applicationRecordForBundleIdentifier:v6];
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)applicationIdentityForIdentityString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F01860];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithIdentityString:v4];

  return v5;
}

- (id)monitorAppEventsWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PDCApplicationEnvironmentMonitoringHandle alloc] initWithWorkspace:self->_workspace delegate:v7 queue:v6];

  [(LSApplicationWorkspace *)self->_workspace addObserver:v8];

  return v8;
}

- (NSEnumerator)allApplications
{
  return (NSEnumerator *)[MEMORY[0x263F01878] enumeratorWithOptions:0];
}

- (void).cxx_destruct
{
}

- (void)applicationRecordForBundleIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A653000, log, OS_LOG_TYPE_ERROR, "Failed to look up record for app %@, error %@", (uint8_t *)&v3, 0x16u);
}

@end