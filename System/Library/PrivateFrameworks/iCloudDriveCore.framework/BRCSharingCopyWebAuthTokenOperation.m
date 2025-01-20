@interface BRCSharingCopyWebAuthTokenOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSharingCopyWebAuthTokenOperation)initWithSyncContext:(id)a3 ckContainerID:(id)a4 sessionContext:(id)a5;
- (NSString)ckContainerID;
- (id)createActivity;
- (void)main;
- (void)setCkContainerID:(id)a3;
@end

@implementation BRCSharingCopyWebAuthTokenOperation

- (BRCSharingCopyWebAuthTokenOperation)initWithSyncContext:(id)a3 ckContainerID:(id)a4 sessionContext:(id)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCSharingCopyWebAuthTokenOperation;
  v10 = [(_BRCOperation *)&v14 initWithName:@"sharing/copy-web-auth-token" syncContext:a3 sessionContext:a5];
  v11 = v10;
  if (v10)
  {
    [(_BRCOperation *)v10 setNonDiscretionary:1];
    objc_storeStrong((id *)&v11->_ckContainerID, a4);
    v12 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v11 setGroup:v12];
  }
  return v11;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/copy-web-auth-token", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  id v3 = objc_alloc_init(MEMORY[0x263EFD708]);
  v4 = objc_opt_new();
  [v3 setConfiguration:v4];

  v5 = [MEMORY[0x263EFD610] containerWithIdentifier:self->_ckContainerID];
  v6 = [v3 configuration];
  [v6 setContainer:v5];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__BRCSharingCopyWebAuthTokenOperation_main__block_invoke;
  v7[3] = &unk_265084440;
  v7[4] = self;
  [v3 setFetchWebAuthTokenCompletionBlock:v7];
  [(_BRCOperation *)self addSubOperation:v3];
}

void __43__BRCSharingCopyWebAuthTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 520);
      int v10 = 138412802;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] failed fetching webauth token for %@: %@%@", (uint8_t *)&v10, 0x20u);
    }
  }
  [*(id *)(a1 + 32) completedWithResult:v5 error:v6];
}

- (NSString)ckContainerID
{
  return self->_ckContainerID;
}

- (void)setCkContainerID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end