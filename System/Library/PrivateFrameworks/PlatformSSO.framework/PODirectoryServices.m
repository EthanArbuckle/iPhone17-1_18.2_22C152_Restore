@interface PODirectoryServices
- (id)shortNameForUserName:(id)a3;
- (id)uniqueIdentifierForUserName:(id)a3;
@end

@implementation PODirectoryServices

- (id)uniqueIdentifierForUserName:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F841B0], "sharedManager", a3);
  v4 = [v3 currentUser];

  if (PO_LOG_PODirectoryServices_once != -1) {
    dispatch_once(&PO_LOG_PODirectoryServices_once, &__block_literal_global);
  }
  v5 = (void *)PO_LOG_PODirectoryServices_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_PODirectoryServices_log, OS_LOG_TYPE_DEBUG)) {
    -[PODirectoryServices uniqueIdentifierForUserName:](v5, v4);
  }
  v6 = [v4 alternateDSID];

  return v6;
}

- (id)shortNameForUserName:(id)a3
{
  return 0;
}

- (void)uniqueIdentifierForUserName:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 alternateDSID];
  int v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEBUG, "Current altDSID: %{private}@", (uint8_t *)&v5, 0xCu);
}

@end