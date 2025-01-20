@interface MKPlaceholder
- (BOOL)enabled;
- (MKPlaceholder)initWithBundleIdentifier:(id)a3;
- (MKPlaceholder)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 bundleName:(id)a5 developer:(id)a6 icon:(id)a7;
- (MKPlaceholder)initWithJSONData:(id)a3;
- (MKPlaceholder)initWithTestBundleIdentifier;
- (NSData)icon;
- (NSString)appStoreIdentifier;
- (NSString)bundleIdentifier;
- (NSString)container;
- (NSString)developer;
- (NSString)name;
- (void)install;
- (void)setAppStoreIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDeveloper:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)uninstall;
@end

@implementation MKPlaceholder

- (MKPlaceholder)initWithJSONData:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MKPlaceholder;
  v5 = [(MKPlaceholder *)&v34 init];
  if (v5 && [v4 length])
  {
    id v33 = 0;
    v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v33];
    id v7 = v33;
    if (v7)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKPlaceholder initWithJSONData:](v7, v8);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = objc_msgSend(v6, "mk_stringForKey:", @"id");
        uint64_t v10 = objc_msgSend(v6, "mk_stringForKey:", @"name");
        uint64_t v11 = objc_msgSend(v6, "mk_stringForKey:", @"icon");
        uint64_t v12 = objc_msgSend(v6, "mk_stringForKey:", @"developer");
        v32 = (void *)v10;
        if (v10) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = (uint64_t)v8;
        }
        [(MKPlaceholder *)v5 setName:v13];
        v31 = (void *)v11;
        if (v11)
        {
          v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
          [(MKPlaceholder *)v5 setIcon:v14];
        }
        else
        {
          [(MKPlaceholder *)v5 setIcon:0];
        }
        v30 = (void *)v12;
        [(MKPlaceholder *)v5 setDeveloper:v12];
        v16 = objc_alloc_init(MKHex);
        v17 = [MKCrypto alloc];
        v18 = [(MKHex *)v16 hexToData:@"331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"];
        v19 = [(MKCrypto *)v17 initWithKey:v18];

        v20 = [(MKHex *)v16 hexToData:@"94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"];
        uint64_t v21 = [(MKCrypto *)v19 decryptData:v20];

        v29 = (void *)v21;
        v22 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
        if ([v8 isEqualToString:v22])
        {
          v23 = [(MKHex *)v16 hexToData:@"D1FCC9136BB7D621E20BDF8E1EFB7607F11DD455D9929C6F56"];
          v28 = [(MKCrypto *)v19 decryptData:v23];

          v27 = (void *)[[NSString alloc] initWithData:v28 encoding:4];
          [(MKPlaceholder *)v5 setAppStoreIdentifier:v27];
          v24 = [(MKHex *)v16 hexToData:@"BFADCCA6F10B49705F5D5A33E55AE0F8E20F55C483DC03BE802D90AC5A"];
          v25 = [(MKCrypto *)v19 decryptData:v24];

          v26 = (void *)[[NSString alloc] initWithData:v25 encoding:4];
          [(MKPlaceholder *)v5 setDeveloper:v26];
        }
        v5 = [(MKPlaceholder *)v5 initWithBundleIdentifier:v8];

        v9 = v5;
        goto LABEL_16;
      }
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKPlaceholder initWithJSONData:](v8);
      }
    }
    v9 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (MKPlaceholder)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceholder;
  v5 = [(MKPlaceholder *)&v13 init];
  if (!v5)
  {
LABEL_8:
    uint64_t v11 = v5;
    goto LABEL_9;
  }
  if ([v4 length])
  {
    [(MKPlaceholder *)v5 setBundleIdentifier:v4];
    v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5->_bundleIdentifier allowPlaceholder:1 error:0];
    id v7 = [v6 dataContainerURL];
    v8 = [v7 path];
    v9 = [v8 stringByAppendingPathComponent:@"Library"];
    [(MKPlaceholder *)v5 setContainer:v9];

    if (v6)
    {
      uint64_t v10 = [v6 dataContainerURL];
      [(MKPlaceholder *)v5 setEnabled:v10 != 0];
    }
    else
    {
      [(MKPlaceholder *)v5 setEnabled:0];
    }

    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

- (MKPlaceholder)initWithBundleIdentifier:(id)a3 appStoreIdentifier:(id)a4 bundleName:(id)a5 developer:(id)a6 icon:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(MKPlaceholder *)self initWithBundleIdentifier:a3];
  v17 = v16;
  if (v16)
  {
    [(MKPlaceholder *)v16 setAppStoreIdentifier:v12];
    [(MKPlaceholder *)v17 setName:v13];
    [(MKPlaceholder *)v17 setDeveloper:v14];
    [(MKPlaceholder *)v17 setIcon:v15];
  }

  return v17;
}

- (MKPlaceholder)initWithTestBundleIdentifier
{
  if (+[MKInternal isInternal])
  {
    v3 = objc_alloc_init(MKHex);
    id v4 = [MKCrypto alloc];
    v5 = [(MKHex *)v3 hexToData:@"331BB104B13265802FC130A8AC28927CFF1CC3F0D502D0B0DE25A8D6F87D3528"];
    v6 = [(MKCrypto *)v4 initWithKey:v5];

    id v7 = [(MKHex *)v3 hexToData:@"94FBBFDC34ECDA1EBEF8B963954CCE8370B1841A7E12A080793994F1184A8F213A0430023E"];
    v8 = [(MKCrypto *)v6 decryptData:v7];

    v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    self = [(MKPlaceholder *)self initWithBundleIdentifier:v9];

    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)install
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (self->_enabled)
  {
    v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v36 = (MKPlaceholder *)bundleIdentifier;
      _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "The placeholder is already installed. id=%@", buf, 0xCu);
    }
  }
  else
  {
    if ([(NSString *)self->_bundleIdentifier length]
      && [(NSString *)self->_appStoreIdentifier length]
      && [(NSString *)self->_name length]
      && [(NSString *)self->_developer length])
    {
      v5 = (void *)[objc_alloc(MEMORY[0x263F4BE88]) initWithBundleIdentifier:self->_bundleIdentifier];
      id v34 = 0;
      v6 = [MEMORY[0x263F4BEC8] coordinatorForAppWithIdentity:v5 withClientID:24 createIfNotExisting:1 created:0 error:&v34];
      id v7 = v34;
      if (v7)
      {
        v3 = v7;
        v8 = 0;
        int v9 = 0;
      }
      else
      {
        v8 = (void *)[objc_alloc(MEMORY[0x263F4BEB0]) initWithName:@"User data" client:24 diskSpaceNeeded:0];
        id v33 = 0;
        int v9 = [v6 setUserDataPromise:v8 error:&v33];
        id v13 = v33;
        v3 = v13;
        if (v9 && !v13)
        {
          id v14 = objc_alloc(MEMORY[0x263F4BEA0]);
          name = self->_name;
          v16 = self->_bundleIdentifier;
          id v32 = 0;
          v17 = (void *)[v14 initAppPlaceholderWithBundleName:name bundleID:v16 installType:8 client:24 error:&v32];
          v18 = v32;
          if (v18)
          {
            v3 = v18;
            int v9 = 1;
          }
          else
          {
            id v31 = 0;
            int v9 = [v6 setPlaceholderPromise:v17 error:&v31];
            uint64_t v21 = v31;
            v3 = v21;
            if (v9)
            {
              if (!v21)
              {
                if (![(NSData *)self->_icon length]
                  || (v22 = (void *)[objc_alloc(MEMORY[0x263F4BEA8]) initWithName:@"Placeholder Icon" client:24 data:self->_icon], v30 = 0, int v9 = objc_msgSend(v17, "setIconPromise:error:", v22, &v30), v3 = v30, v22, v9)&& !v3)
                {
                  id v23 = objc_alloc_init(MEMORY[0x263F08A30]);
                  [v23 setNumberStyle:1];
                  v24 = [v23 numberFromString:self->_appStoreIdentifier];
                  id v25 = objc_alloc_init(MEMORY[0x263F4BEE0]);
                  [v25 setItemID:v24];
                  [v25 setItemName:self->_name];
                  [v25 setArtistName:self->_developer];
                  [v25 setSoftwareVersionBundleID:self->_bundleIdentifier];
                  id v29 = 0;
                  int v9 = [v17 setMetadata:v25 error:&v29];
                  v26 = v29;
                  v3 = v26;
                  if (v9 && !v26)
                  {
                    id v28 = 0;
                    int v9 = [v17 setConfigurationCompleteWithError:&v28];
                    v27 = v28;
                    if ((v9 & (v27 == 0)) != 0) {
                      v3 = 0;
                    }
                    else {
                      v3 = v27;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v8 = 0;
      int v9 = 0;
      v3 = 0;
    }
    [v8 setComplete:1];
    uint64_t v10 = +[MKLog log];
    uint64_t v11 = v10;
    if (!v9 || v3)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_bundleIdentifier;
        v20 = [v3 description];
        *(_DWORD *)buf = 138413058;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v19;
        __int16 v39 = 1024;
        int v40 = v9;
        __int16 v41 = 2112;
        v42 = v20;
        _os_log_error_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_ERROR, "%@ could not install a placeholder. id=%@, success=%d, error=%@", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      v36 = (MKPlaceholder *)v12;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "will install a placeholder. id=%@", buf, 0xCu);
    }
  }
}

- (void)uninstall
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_enabled)
  {
    v3 = objc_alloc_init(MEMORY[0x263F4BED8]);
    [v3 setRequestUserConfirmation:0];
    [v3 setWaitForDeletion:0];
    [v3 setShowArchiveOption:0];
    [v3 setShowDemotionOption:0];
    [v3 setSystemAppNotAllowed:0];
    id v4 = +[MKLog log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      int v8 = 138412290;
      int v9 = bundleIdentifier;
      _os_log_impl(&dword_22BFAC000, v4, OS_LOG_TYPE_INFO, "will uninstall an app. id=%@", (uint8_t *)&v8, 0xCu);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x263F4BE88]) initWithBundleIdentifier:self->_bundleIdentifier];
    [MEMORY[0x263F4BE78] uninstallAppWithIdentity:v6 options:v3 completion:&__block_literal_global_2];
  }
  else
  {
    v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_bundleIdentifier;
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "the placeholder was already uninstalled. id=%@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __26__MKPlaceholder_uninstall__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218242;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "did uninstall an app. disposition=%ld, error=%@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)appStoreIdentifier
{
  return self->_appStoreIdentifier;
}

- (void)setAppStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)developer
{
  return self->_developer;
}

- (void)setDeveloper:(id)a3
{
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSData)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_developer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_appStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithJSONData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "could not initialize placeholder because an unexpected format was received.", v1, 2u);
}

- (void)initWithJSONData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not initialize placeholder because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v4, 0xCu);
}

@end