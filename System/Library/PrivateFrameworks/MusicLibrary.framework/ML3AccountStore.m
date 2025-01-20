@interface ML3AccountStore
+ (ML3AccountStore)defaultStore;
- (ACAccount)activeAccount;
- (NSString)accountDSID;
- (id)_accountsWithAccountTypeIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)_init;
- (id)altDSIDForAccountWithDSID:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation ML3AccountStore

- (id)_accountsWithAccountTypeIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F179C8];
  id v9 = a3;
  v10 = [v8 defaultStore];
  v11 = [v10 accountTypeWithAccountTypeIdentifier:v9 error:a5];

  if (*a5)
  {
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a5;
      int v19 = 138543618;
      v20 = self;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve itunes account type. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }
LABEL_8:
    v17 = MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  v14 = [v10 accountsWithAccountType:v11 options:a4 error:a5];
  v12 = v14;
  if (*a5)
  {
    v15 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *a5;
      int v19 = 138543618;
      v20 = self;
      __int16 v21 = 2114;
      id v22 = v16;
      _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve accounts for itunes account type. err=%{public}@", (uint8_t *)&v19, 0x16u);
    }

    goto LABEL_8;
  }
  v12 = v14;
  v17 = v12;
LABEL_9:

  return v17;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ML3AccountStore;
  return [(ML3AccountStore *)&v3 init];
}

- (NSString)accountDSID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(ML3AccountStore *)self activeAccount];
  objc_super v3 = [v2 accountPropertyForKey:@"dsid"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 stringValue];
LABEL_8:
      v6 = v4;
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      goto LABEL_8;
    }
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543874;
      v10 = @"dsid";
      __int16 v11 = 2114;
      v12 = v3;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      id v7 = v14;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "accountPropertyForKey %{public}@ is %{public}@. It should be an NSString or NSNumber instead of %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      v10 = @"dsid";
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "accountPropertyForKey %{public}@ is nil. Proceeding without dsid", (uint8_t *)&v9, 0xCu);
    }
  }

  v6 = 0;
LABEL_12:

  return (NSString *)v6;
}

- (id)altDSIDForAccountWithDSID:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  int v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v8 = -[ML3AccountStore _accountsWithAccountTypeIdentifier:options:error:](self, "_accountsWithAccountTypeIdentifier:options:error:", *MEMORY[0x1E4F17890], a4);
  int v9 = v8;
  if (*a5)
  {
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *a5;
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v11;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve active itunes account type. err=%{public}@", buf, 0x16u);
    }

    id v12 = 0;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__ML3AccountStore_altDSIDForAccountWithDSID_options_error___block_invoke;
    v14[3] = &unk_1E5FAF370;
    v14[4] = &v15;
    v14[5] = a3;
    [v8 enumerateObjectsUsingBlock:v14];
    id v12 = (id)v16[5];
  }

  _Block_object_dispose(&v15, 8);

  return v12;
}

void __59__ML3AccountStore_altDSIDForAccountWithDSID_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v8 = a2;
  v6 = [v8 accountPropertyForKey:@"dsid"];
  if ([v6 longLongValue] == *(void *)(a1 + 40))
  {
    id v7 = [v8 accountPropertyForKey:@"altDSID"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
      }
    }
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (ACAccount)activeAccount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F17890];
  id v10 = 0;
  id v4 = [(ML3AccountStore *)self _accountsWithAccountTypeIdentifier:v3 options:0 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to retrieve active itunes account type. err=%{public}@", buf, 0x16u);
    }

    id v7 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v12 = __Block_byref_object_copy_;
    __int16 v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__ML3AccountStore_activeAccount__block_invoke;
    v9[3] = &unk_1E5FAF348;
    v9[4] = buf;
    [v4 enumerateObjectsUsingBlock:v9];
    id v7 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }

  return (ACAccount *)v7;
}

void __32__ML3AccountStore_activeAccount__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isActive]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  *a4 = [v7 isActive];
}

+ (ML3AccountStore)defaultStore
{
  if (defaultStore_onceToken[0] != -1) {
    dispatch_once(defaultStore_onceToken, &__block_literal_global);
  }
  v2 = (void *)defaultStore___defaultStore;

  return (ML3AccountStore *)v2;
}

uint64_t __31__ML3AccountStore_defaultStore__block_invoke()
{
  defaultStore___defaultStore = [[ML3AccountStore alloc] _init];

  return MEMORY[0x1F41817F8]();
}

@end