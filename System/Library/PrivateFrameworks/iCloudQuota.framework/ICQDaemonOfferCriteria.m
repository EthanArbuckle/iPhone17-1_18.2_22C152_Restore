@interface ICQDaemonOfferCriteria
- (BOOL)isSatisfiedByConditions:(id)a3;
- (ICQDaemonOfferCriteria)initWithServerDictionary:(id)a3;
- (NSDictionary)serverDictionary;
@end

@implementation ICQDaemonOfferCriteria

- (BOOL)isSatisfiedByConditions:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  objc_opt_class();
  objc_opt_isKindOfClass();
  serverDict = self->_serverDict;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ICQDaemonOfferCriteria_isSatisfiedByConditions___block_invoke;
  v8[3] = &unk_1E6A53700;
  v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(NSDictionary *)serverDict enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(serverDict) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serverDict;
}

void __50__ICQDaemonOfferCriteria_isSatisfiedByConditions___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v9 + 24))
  {
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  id v10 = *(id *)(a1 + 32);
  if ([v7 isEqualToString:@"deviceStorageAlmostFull"])
  {
    int v11 = [v10 isDeviceStorageAlmostFull];
    goto LABEL_7;
  }
  if (![v7 isEqualToString:@"iCPLEnabled"])
  {
    if ([v7 isEqualToString:@"optimizeEnabled"])
    {
      if (_ICQDoesCriterionValueEqualBOOL(v8, [v10 isPhotosOptimizeEnabled])) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    if (([v7 isEqualToString:@"minPhotoLibraryInBytes"] & 1) == 0
      && ![v7 isEqualToString:@"maxPhotoLibraryInBytes"])
    {
      if ([v7 isEqualToString:@"backupRestoreComplete"])
      {
        LOBYTE(v12) = _ICQDoesCriterionValueEqualBOOL(v8, [v10 isBackupRestoreComplete]);
        goto LABEL_18;
      }
      v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        id v25 = v7;
        uint64_t v13 = "unexpected criterion key %@";
        char v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v24 = 138412546;
      id v25 = v7;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v8;
      uint64_t v13 = "criterion: %@: %@ not convertible to long long";
      goto LABEL_15;
    }
    v16 = [v10 photosLibrarySize];
    char v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0)
    {
      v12 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LOWORD(v24) = 0;
      uint64_t v13 = "criterion: photos library size unknown";
      char v14 = v12;
      uint32_t v15 = 2;
      goto LABEL_16;
    }
    uint64_t v18 = [v8 longLongValue];
    v19 = [v10 photosLibrarySize];
    uint64_t v20 = [v19 longLongValue];

    LODWORD(v19) = [v7 isEqualToString:@"minPhotoLibraryInBytes"];
    v21 = _ICQGetLogSystem();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      LOBYTE(v12) = v20 >= v18;
      if (v22)
      {
        v23 = @"<";
        int v24 = 138544130;
        id v25 = v7;
        if (v20 >= v18) {
          v23 = @">=";
        }
LABEL_42:
        __int16 v26 = 2048;
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = v18;
        _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "criterion: %{public}@: %lld %{public}@ %lld", (uint8_t *)&v24, 0x2Au);
      }
    }
    else
    {
      LODWORD(v12) = v20 <= v18;
      if (v22)
      {
        v23 = @">";
        int v24 = 138544130;
        id v25 = v7;
        if (v20 <= v18) {
          v23 = @"<=";
        }
        goto LABEL_42;
      }
    }

    goto LABEL_18;
  }
  int v11 = [v10 isPhotosCloudEnabled];
LABEL_7:
  if (_ICQDoesCriterionValueEqualBOOL(v8, v11))
  {
LABEL_8:
    v12 = _ICQGetLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543618;
      id v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = (uint64_t)v8;
      _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "criterion: %{public}@ matches %{public}@", (uint8_t *)&v24, 0x16u);
    }

    LOBYTE(v12) = 1;
    goto LABEL_18;
  }
LABEL_13:
  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v7;
    __int16 v26 = 2114;
    uint64_t v27 = (uint64_t)v8;
    uint64_t v13 = "criterion: %{public}@ doesn't match %{public}@";
LABEL_15:
    char v14 = v12;
    uint32_t v15 = 22;
LABEL_16:
    _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, v15);
  }
LABEL_17:

  LOBYTE(v12) = 0;
LABEL_18:

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_19:
  *(unsigned char *)(v9 + 24) = (_BYTE)v12;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

- (ICQDaemonOfferCriteria)initWithServerDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQDaemonOfferCriteria;
  v5 = [(ICQDaemonOfferCriteria *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      id v7 = _ICQGetLogSystem();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (!v4)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "criteria: missing, substituting empty criteria (always succeeds)", buf, 2u);
        }

        serverDict = v5->_serverDict;
        v5->_serverDict = (NSDictionary *)MEMORY[0x1E4F1CC08];
        goto LABEL_9;
      }
      if (v8)
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138412290;
        char v17 = v10;
        _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "criteria: expected NSDictionary, got %@", buf, 0xCu);
      }
      char v14 = @"fail";
      uint32_t v15 = &stru_1F2DCE430;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    }
    serverDict = v5->_serverDict;
    v5->_serverDict = (NSDictionary *)v6;
LABEL_9:
  }
  return v5;
}

- (NSDictionary)serverDictionary
{
  return self->_serverDict;
}

- (void).cxx_destruct
{
}

@end