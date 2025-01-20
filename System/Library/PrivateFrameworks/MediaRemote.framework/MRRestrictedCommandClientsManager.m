@interface MRRestrictedCommandClientsManager
+ (id)sharedManager;
- (NSArray)lastAcceptedTokens;
- (id)_restrictCommandClientsTo:(id)a3;
- (id)restrictCommandClientsTo:(id)a3;
- (void)republishStateIfNeeded;
- (void)setLastAcceptedTokens:(id)a3;
@end

@implementation MRRestrictedCommandClientsManager

+ (id)sharedManager
{
  if (sharedManager___once_2 != -1) {
    dispatch_once(&sharedManager___once_2, &__block_literal_global_81);
  }
  v2 = (void *)sharedManager___sharedManager_0;

  return v2;
}

uint64_t __50__MRRestrictedCommandClientsManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager_0 = objc_alloc_init(MRRestrictedCommandClientsManager);

  return MEMORY[0x1F41817F8]();
}

- (id)restrictCommandClientsTo:(id)a3
{
  id v4 = a3;
  v5 = [(MRRestrictedCommandClientsManager *)self _restrictCommandClientsTo:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MRRestrictedCommandClientsManager_restrictCommandClientsTo___block_invoke;
  v9[3] = &unk_1E57D74B8;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(v4, "msv_filter:", v9);

  [(MRRestrictedCommandClientsManager *)self setLastAcceptedTokens:v7];

  return v7;
}

uint64_t __62__MRRestrictedCommandClientsManager_restrictCommandClientsTo___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 realToken];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:32];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

- (void)republishStateIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 lastAcceptedTokens];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "[RestrictedCommandClients Mode] Republish Error: \n Tried to restrict to %@ but %@ was accepted.", (uint8_t *)&v6, 0x16u);
}

- (id)_restrictCommandClientsTo:(id)a3
{
  v3 = MRCreateDataFromArray(a3, &__block_literal_global_8_4);
  uint64_t v4 = MRGetSharedService();
  v5 = MRCreateXPCMessage(0x40000000000000DuLL);
  MRAddDataToXPCMessage(v5, v3, "MRXPC_RESTRICT_COMMANDS_ARRAY_DATA_KEY");
  int v6 = [v4 connection];
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  __int16 v8 = (UInt8 *)MRCreateDataFromXPCMessage(v7, "MRXPC_RESTRICT_COMMANDS_ARRAY_DATA_KEY");
  uint64_t v9 = MRCreateArrayFromData(v8, &__block_literal_global_12_1);

  return v9;
}

id __63__MRRestrictedCommandClientsManager__restrictCommandClientsTo___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 realToken];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:32];

  return v2;
}

id __63__MRRestrictedCommandClientsManager__restrictCommandClientsTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (NSArray)lastAcceptedTokens
{
  return self->_lastAcceptedTokens;
}

- (void)setLastAcceptedTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end