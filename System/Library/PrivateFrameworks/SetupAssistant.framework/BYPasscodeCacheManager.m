@interface BYPasscodeCacheManager
- (BOOL)isCached;
- (BOOL)storePasscode:(id)a3;
- (BYPasscodeCacheManager)initWithFeatureFlags:(id)a3;
- (BuddyFeatureFlags)featureFlags;
- (CDPLocalSecret)cachedLocalSecret;
- (id)cachedPasscode;
- (int)_passcodeType;
- (unint64_t)_secretTypeCorrespondingToPasscodeType:(int)a3;
- (void)_updateCachedLocalSecret:(id)a3;
- (void)cachePasscode:(id)a3;
- (void)cachePasscode:(id)a3 retrievable:(BOOL)a4;
- (void)persistPasscodeStash;
- (void)setIsCached:(BOOL)a3;
- (void)uncachePasscode;
- (void)updateCoreCDPStateControllerWithPasscode:(id)a3;
@end

@implementation BYPasscodeCacheManager

- (BYPasscodeCacheManager)initWithFeatureFlags:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYPasscodeCacheManager;
  v6 = [(BYPasscodeCacheManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_stashedFd = -1;
    objc_storeStrong((id *)&v6->_featureFlags, a3);
  }

  return v7;
}

- (void)cachePasscode:(id)a3
{
}

- (void)cachePasscode:(id)a3 retrievable:(BOOL)a4
{
  BOOL v4 = a4;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!self->_isCached && [v6 length])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_buddyFinished, @"com.apple.purplebuddy.setupdone", 0, CFNotificationSuspensionBehaviorCoalesce);
    id v9 = objc_alloc_init((Class)getSecureBackupClass());
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    v10 = (id *)getkSecureBackupPassphraseKeySymbolLoc_ptr;
    uint64_t v35 = getkSecureBackupPassphraseKeySymbolLoc_ptr;
    if (!getkSecureBackupPassphraseKeySymbolLoc_ptr)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __getkSecureBackupPassphraseKeySymbolLoc_block_invoke;
      v30 = &unk_1E5D2B9E8;
      v31 = &v32;
      v11 = (void *)CloudServicesLibrary_0();
      v33[3] = (uint64_t)dlsym(v11, "kSecureBackupPassphraseKey");
      getkSecureBackupPassphraseKeySymbolLoc_ptr = *(void *)(v31[1] + 24);
      v10 = (id *)v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (!v10)
    {
      +[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
      __break(1u);
    }
    id v36 = *v10;
    v37[0] = v7;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = v36;
    v14 = [v12 dictionaryWithObjects:v37 forKeys:&v36 count:1];

    id v15 = (id)[v9 cachePassphraseWithInfo:v14];
    [v7 dataUsingEncoding:4];
    uint64_t v16 = MKBKeyBagKeyStashCreateWithMode();
    v17 = _BYLoggingFacility();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[BYPasscodeCacheManager cachePasscode:retrievable:](v16, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1A7DED000, v18, OS_LOG_TYPE_DEFAULT, "Keybag stash created successfully", (uint8_t *)&v27, 2u);
    }

    if (v4) {
      self->_retrievable = [(BYPasscodeCacheManager *)self storePasscode:v7];
    }
    v25 = [(BYPasscodeCacheManager *)self featureFlags];
    int v26 = [v25 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

    if (v26) {
      [(BYPasscodeCacheManager *)self _updateCachedLocalSecret:v7];
    }
    self->_isCached = 1;
  }
}

- (void)uncachePasscode
{
}

- (BOOL)storePasscode:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSTemporaryDirectory();
  id v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];
  id v9 = (const char *)[v8 fileSystemRepresentation];

  int v10 = open_dprotected_np(v9, 1794, 1, 0, 384);
  if (v10 < 0)
  {
    v14 = _BYLoggingFacility();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_15:
      BOOL v24 = 0;
LABEL_47:

      goto LABEL_48;
    }
    uint64_t v21 = __error();
    uint64_t v22 = strerror(*v21);
    *(_DWORD *)buf = 136315138;
    v45 = v22;
    uint64_t v23 = "Failed to open temporary file for caching: %s";
LABEL_14:
    _os_log_impl(&dword_1A7DED000, v14, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    goto LABEL_15;
  }
  int v11 = v10;
  if ((unlink(v9) & 0x80000000) == 0)
  {
    v48 = @"passcode";
    v49[0] = v4;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    id v43 = 0;
    id v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v12 format:200 options:0 error:&v43];
    v14 = v43;
    if (v13)
    {
      if (ftruncate(v11, [v13 length]) < 0)
      {
        v31 = _BYLoggingFacility();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = __error();
          v33 = strerror(*v32);
          *(_DWORD *)buf = 136315138;
          v45 = v33;
          _os_log_impl(&dword_1A7DED000, v31, OS_LOG_TYPE_DEFAULT, "Unable to truncate cache file: %s", buf, 0xCu);
        }

        if ((close(v11) & 0x80000000) == 0) {
          goto LABEL_45;
        }
        uint64_t v20 = _BYLoggingFacility();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
      }
      else
      {
        id v15 = v13;
        ssize_t v16 = pwrite(v11, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0);
        if (v16 < 0)
        {
          id v36 = _BYLoggingFacility();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = __error();
            v38 = strerror(*v37);
            *(_DWORD *)buf = 136315138;
            v45 = v38;
            _os_log_impl(&dword_1A7DED000, v36, OS_LOG_TYPE_DEFAULT, "Unable to write cache file: %s", buf, 0xCu);
          }

          if ((close(v11) & 0x80000000) == 0) {
            goto LABEL_45;
          }
          uint64_t v20 = _BYLoggingFacility();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_44;
          }
        }
        else
        {
          ssize_t v17 = v16;
          if (v16 >= [v15 length])
          {
            self->_stashedFd = v11;
            BOOL v24 = 1;
LABEL_46:

            goto LABEL_47;
          }
          v18 = _BYLoggingFacility();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v15 length];
            *(_DWORD *)buf = 134218240;
            v45 = (char *)v17;
            __int16 v46 = 2048;
            uint64_t v47 = v19;
            _os_log_impl(&dword_1A7DED000, v18, OS_LOG_TYPE_DEFAULT, "Incomplete data written to cache file: read %ld, expected %lu", buf, 0x16u);
          }

          if ((close(v11) & 0x80000000) == 0)
          {
LABEL_45:
            BOOL v24 = 0;
            goto LABEL_46;
          }
          uint64_t v20 = _BYLoggingFacility();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
LABEL_44:

            goto LABEL_45;
          }
        }
      }
    }
    else
    {
      uint64_t v28 = _BYLoggingFacility();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (_BYIsInternalInstall())
        {
          int v29 = 0;
          v30 = (char *)v14;
        }
        else if (v14)
        {
          v39 = NSString;
          id v8 = [v14 domain];
          v30 = [v39 stringWithFormat:@"<Error domain: %@, code %ld>", v8, -[NSObject code](v14, "code")];
          int v29 = 1;
        }
        else
        {
          int v29 = 0;
          v30 = 0;
        }
        *(_DWORD *)buf = 138543362;
        v45 = v30;
        _os_log_impl(&dword_1A7DED000, v28, OS_LOG_TYPE_DEFAULT, "Unable to serialize cache data: %{public}@", buf, 0xCu);
        if (v29)
        {
        }
      }

      if ((close(v11) & 0x80000000) == 0) {
        goto LABEL_45;
      }
      uint64_t v20 = _BYLoggingFacility();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
    }
    v40 = __error();
    v41 = strerror(*v40);
    *(_DWORD *)buf = 136315138;
    v45 = v41;
    _os_log_impl(&dword_1A7DED000, v20, OS_LOG_TYPE_DEFAULT, "Failed closing temporary file: %s", buf, 0xCu);
    goto LABEL_44;
  }
  v25 = _BYLoggingFacility();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = __error();
    uint64_t v27 = strerror(*v26);
    *(_DWORD *)buf = 136315138;
    v45 = v27;
    _os_log_impl(&dword_1A7DED000, v25, OS_LOG_TYPE_DEFAULT, "Failed to unlink temporary file for caching: %s", buf, 0xCu);
  }

  if (close(v11) < 0)
  {
    v14 = _BYLoggingFacility();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v34 = __error();
    uint64_t v35 = strerror(*v34);
    *(_DWORD *)buf = 136315138;
    v45 = v35;
    uint64_t v23 = "Failed closing temporary file: %s";
    goto LABEL_14;
  }
  BOOL v24 = 0;
LABEL_48:

  return v24;
}

- (id)cachedPasscode
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = [(BYPasscodeCacheManager *)self featureFlags];
  if ([v4 isUseCDPContextSecretInsteadOfSBDSecretEnabled])
  {
    id v5 = [(BYPasscodeCacheManager *)self cachedLocalSecret];
    id v6 = [v5 validatedSecret];

    if (v6)
    {
      v7 = _BYLoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        buf.st_dev = 136315138;
        *(void *)&buf.st_mode = "-[BYPasscodeCacheManager cachedPasscode]";
        _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "%s: Returning property value.", (uint8_t *)&buf, 0xCu);
      }

      id v8 = [(BYPasscodeCacheManager *)self cachedLocalSecret];
      id v9 = [v8 validatedSecret];
      goto LABEL_36;
    }
  }
  else
  {
  }
  int stashedFd = self->_stashedFd;
  if (stashedFd < 0)
  {
    id v9 = 0;
    goto LABEL_37;
  }
  memset(&buf, 0, sizeof(buf));
  if (fstat(stashedFd, &buf) < 0)
  {
    id v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = self->_stashedFd;
      uint64_t v22 = __error();
      uint64_t v23 = strerror(*v22);
      *(_DWORD *)v33 = 67109378;
      *(_DWORD *)uint64_t v34 = v21;
      *(_WORD *)&v34[4] = 2080;
      *(void *)&v34[6] = v23;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Failed to stat file (%d): %s", v33, 0x12u);
    }
    id v9 = 0;
    goto LABEL_36;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA58]);
  v12 = (void *)[v11 initWithLength:buf.st_size];
  int v13 = self->_stashedFd;
  id v8 = v12;
  v14 = (void *)[v8 mutableBytes];
  ssize_t v15 = pread(v13, v14, buf.st_size, 0);
  if (v15 < 0)
  {
    ssize_t v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = __error();
      v25 = strerror(*v24);
      *(_DWORD *)v33 = 136315138;
      *(void *)uint64_t v34 = v25;
      v18 = "Unable to read secure file: %s";
      uint64_t v19 = v17;
      uint32_t v20 = 12;
      goto LABEL_19;
    }
  }
  else
  {
    ssize_t v16 = v15;
    if (v15 >= buf.st_size)
    {
      id v32 = 0;
      int v26 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v32];
      ssize_t v17 = v32;
      if (v26)
      {
        id v9 = [v26 objectForKeyedSubscript:@"passcode"];
      }
      else
      {
        if ([v8 length])
        {
          uint64_t v27 = _BYLoggingFacility();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            if (_BYIsInternalInstall())
            {
              int v28 = 0;
              int v29 = v17;
            }
            else if (v17)
            {
              v30 = NSString;
              v2 = [v17 domain];
              int v29 = [v30 stringWithFormat:@"<Error domain: %@, code %ld>", v2, -[NSObject code](v17, "code")];
              int v28 = 1;
            }
            else
            {
              int v28 = 0;
              int v29 = 0;
            }
            *(_DWORD *)v33 = 138543362;
            *(void *)uint64_t v34 = v29;
            _os_log_impl(&dword_1A7DED000, v27, OS_LOG_TYPE_DEFAULT, "Unable to decode secure file: %{public}@", v33, 0xCu);
            if (v28)
            {
            }
          }
        }
        id v9 = 0;
      }

      goto LABEL_35;
    }
    ssize_t v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 134218240;
      *(void *)uint64_t v34 = v16;
      *(_WORD *)&v34[8] = 2048;
      *(void *)&v34[10] = buf.st_size;
      v18 = "Unable to read secure file; read %ld, expected %lld";
      uint64_t v19 = v17;
      uint32_t v20 = 22;
LABEL_19:
      _os_log_impl(&dword_1A7DED000, v19, OS_LOG_TYPE_DEFAULT, v18, v33, v20);
    }
  }
  id v9 = 0;
LABEL_35:

LABEL_36:
LABEL_37:
  return v9;
}

- (void)persistPasscodeStash
{
}

- (void)_updateCachedLocalSecret:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(BYPasscodeCacheManager *)self _secretTypeCorrespondingToPasscodeType:[(BYPasscodeCacheManager *)self _passcodeType]];
  id v6 = _BYLoggingFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      int v10 = 136315138;
      id v11 = "-[BYPasscodeCacheManager _updateCachedLocalSecret:]";
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%s: Caching secret", (uint8_t *)&v10, 0xCu);
    }

    id v8 = (CDPLocalSecret *)[objc_alloc(MEMORY[0x1E4F5B2E8]) initWithValidatedSecret:v4 secretType:v5];
    cachedLocalSecret = self->_cachedLocalSecret;
    self->_cachedLocalSecret = v8;
  }
  else
  {
    if (v7)
    {
      int v10 = 136315138;
      id v11 = "-[BYPasscodeCacheManager _updateCachedLocalSecret:]";
      _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "%s: Removing saved CDP local secret", (uint8_t *)&v10, 0xCu);
    }

    cachedLocalSecret = self->_cachedLocalSecret;
    self->_cachedLocalSecret = 0;
  }
}

- (int)_passcodeType
{
  int v4 = 0;
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  [v2 unlockScreenTypeWithOutSimplePasscodeType:&v4];

  return v4;
}

- (unint64_t)_secretTypeCorrespondingToPasscodeType:(int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = _BYLoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a3 == -1)
  {
    if (v5)
    {
      int v8 = 136315138;
      id v9 = "-[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:]";
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "%s: Saving complex device secret type", (uint8_t *)&v8, 0xCu);
    }
    unint64_t v6 = 3;
  }
  else
  {
    if (v5)
    {
      int v8 = 136315138;
      id v9 = "-[BYPasscodeCacheManager _secretTypeCorrespondingToPasscodeType:]";
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "%s: Saving simple device secret type", (uint8_t *)&v8, 0xCu);
    }
    unint64_t v6 = 2;
  }

  return v6;
}

- (void)updateCoreCDPStateControllerWithPasscode:(id)a3
{
  id v4 = a3;
  BOOL v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Updating CDP StateController", (uint8_t *)&v15, 2u);
  }

  unint64_t v6 = [(BYPasscodeCacheManager *)self featureFlags];
  int v7 = [v6 isUseCDPContextSecretInsteadOfSBDSecretEnabled];

  if (v7)
  {
    unint64_t v8 = [(BYPasscodeCacheManager *)self _secretTypeCorrespondingToPasscodeType:[(BYPasscodeCacheManager *)self _passcodeType]];
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2050000000;
    id v9 = (void *)getCDPContextClass_softClass_0;
    uint64_t v23 = getCDPContextClass_softClass_0;
    if (!getCDPContextClass_softClass_0)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      ssize_t v17 = __getCDPContextClass_block_invoke_0;
      v18 = &unk_1E5D2B9E8;
      uint64_t v19 = &v20;
      __getCDPContextClass_block_invoke_0((uint64_t)&v15);
      id v9 = (void *)v21[3];
    }
    uint64_t v10 = v9;
    _Block_object_dispose(&v20, 8);
    id v11 = objc_alloc_init(v10);
    [v11 setType:6];
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v12 = (void *)getCDPStateControllerClass_softClass_0;
    uint64_t v23 = getCDPStateControllerClass_softClass_0;
    if (!getCDPStateControllerClass_softClass_0)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      ssize_t v17 = __getCDPStateControllerClass_block_invoke_0;
      v18 = &unk_1E5D2B9E8;
      uint64_t v19 = &v20;
      __getCDPStateControllerClass_block_invoke_0((uint64_t)&v15);
      uint64_t v12 = (void *)v21[3];
    }
    int v13 = v12;
    _Block_object_dispose(&v20, 8);
    v14 = (void *)[[v13 alloc] initWithContext:v11];
    [v14 localSecretChangedTo:v4 secretType:v8 completion:&__block_literal_global_26];
  }
}

void __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _BYLoggingFacility();
  unint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke_cold_1(v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Updated local secret: %d", (uint8_t *)v7, 8u);
  }
}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
}

- (void)cachePasscode:(uint64_t)a3 retrievable:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__BYPasscodeCacheManager_updateCoreCDPStateControllerWithPasscode___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = _BYIsInternalInstall();
  if ((v5 & 1) == 0)
  {
    unint64_t v6 = NSString;
    v2 = [a1 domain];
    a1 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(a1, "code")];
  }
  *(_DWORD *)stat buf = 138412290;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_ERROR, "Failed to update local secret: %@", buf, 0xCu);
  if (!v5)
  {
  }
}

@end