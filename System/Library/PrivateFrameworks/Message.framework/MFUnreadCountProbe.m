@interface MFUnreadCountProbe
+ (BOOL)addProbeWithConnection:(id)a3;
@end

@implementation MFUnreadCountProbe

+ (BOOL)addProbeWithConnection:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v5 = MFLogGeneral();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = (sqlite3 *)[v4 sqlDB];
    sqlite3_create_function(v7, "probe_message_update", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageUpdate, 0, 0);
    sqlite3_create_function(v7, "probe_message_add", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageAdd, 0, 0);
    sqlite3_create_function(v7, "probe_message_delete", -1, 1, a1, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))probeMessageDelete, 0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__MFUnreadCountProbe_addProbeWithConnection___block_invoke;
    v10[3] = &unk_1E5D3CDD8;
    v10[4] = &v11;
    v10[5] = v7;
    [v4 performWithOptions:3 transactionError:0 block:v10];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

BOOL __45__MFUnreadCountProbe_addProbeWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  while (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v3 = sqlite3_exec(*(sqlite3 **)(a1 + 40), off_1E5D40A08[v2], 0, 0, 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3 == 0;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      id v4 = MFLogGeneral();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = sqlite3_errmsg(*(sqlite3 **)(a1 + 40));
        *(_DWORD *)buf = 67109378;
        int v8 = v3;
        __int16 v9 = 2080;
        v10 = v5;
        _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "#Warning Error %d: %s", buf, 0x12u);
      }
    }
    if (++v2 == 3) {
      return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
    }
  }
  return 0;
}

@end