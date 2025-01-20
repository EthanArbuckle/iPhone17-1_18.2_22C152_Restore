@interface MKPlaceholderMigrator
- (MKPlaceholderMigrator)init;
- (void)didSearchForPlaceholder:(id)a3 apps:(id)a4 error:(id)a5;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
- (void)install:(id)a3 apps:(id)a4 error:(id)a5;
- (void)remove;
@end

@implementation MKPlaceholderMigrator

- (MKPlaceholderMigrator)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKPlaceholderMigrator;
  v2 = [(MKMigrator *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(MKMigrator *)v2 setType:15];
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    identifiers = v3->_identifiers;
    v3->_identifiers = v4;

    v6 = objc_alloc_init(MKAppSearchRequest);
    request = v3->_request;
    v3->_request = v6;
  }
  return v3;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKPlaceholderMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "%@ will import placeholders.", buf, 0xCu);
  }

  v6 = [[MKPlaceholder alloc] initWithJSONData:v4];
  id v7 = v6;
  if (v6)
  {
    if ([(MKPlaceholder *)v6 enabled])
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_super v9 = [(MKPlaceholder *)v7 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl(&dword_22BFAC000, v8, OS_LOG_TYPE_INFO, "the placeholder was already installed. placeholder=%@", buf, 0xCu);
      }
    }
    else
    {
      v8 = [(MKPlaceholder *)v7 bundleIdentifier];
      v10 = +[MKLog log];
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v11)
        {
          *(_DWORD *)buf = 138412290;
          v19 = (MKPlaceholderMigrator *)v8;
          _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "will search an application. id=%@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        request = self->_request;
        v17 = v8;
        v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __32__MKPlaceholderMigrator_import___block_invoke;
        v14[3] = &unk_264905CE0;
        objc_copyWeak(&v16, (id *)buf);
        v15 = v7;
        [(MKAppSearchRequest *)request search:v13 androidIDs:0 completion:v14];

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "will skip a placeholder because did receive an invalid bundle identifier. id=nil", buf, 2u);
        }
      }
    }
  }
  else
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BFAC000, v8, OS_LOG_TYPE_INFO, "will skip a placeholder because did receive an invalid placeholder. placeholder=nil", buf, 2u);
    }
  }
}

void __32__MKPlaceholderMigrator_import___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained didSearchForPlaceholder:*(void *)(a1 + 32) apps:v7 error:v6];
}

- (void)didSearchForPlaceholder:(id)a3 apps:(id)a4 error:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  uint64_t v11 = objc_sync_enter(v10);
  v12 = (void *)MEMORY[0x230F5C060](v11);
  [(MKPlaceholderMigrator *)v10 install:v13 apps:v8 error:v9];
  objc_sync_exit(v10);
}

- (void)install:(id)a3 apps:(id)a4 error:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v8 bundleIdentifier];
      id v13 = [v10 description];
      *(_DWORD *)buf = 138412546;
      v38 = v12;
      __int16 v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "did receive an error but will install a placeholder using existing metadata. id=%@, error=%@", buf, 0x16u);
LABEL_4:

LABEL_13:
    }
LABEL_14:

    v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v8 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v38 = v18;
      _os_log_impl(&dword_22BFAC000, v17, OS_LOG_TYPE_INFO, "did not receive an icon due to an network error but will install a placeholder using existing metadata. id=%@", buf, 0xCu);
    }
    [v8 install];
    goto LABEL_17;
  }
  if (![v9 count])
  {
    uint64_t v11 = +[MKLog log];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    v12 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    v14 = "did not receive any matching app but will install a placeholder using existing metadata. id=%@";
LABEL_11:
    v15 = v11;
    uint32_t v16 = 12;
LABEL_12:
    _os_log_impl(&dword_22BFAC000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    goto LABEL_13;
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    uint64_t v11 = +[MKLog log];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    v12 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v38 = v12;
    v14 = "did receive too many matching apps but will install a placeholder using existing metadata. id=%@";
    goto LABEL_11;
  }
  uint64_t v11 = [v9 objectAtIndexedSubscript:0];
  uint64_t v21 = [v11 iconURL];
  if (!v21)
  {
    v12 = +[MKLog log];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v14 = "did not receive an icon url from the app store api or a new icon type might be added to ios.";
    v15 = v12;
    uint32_t v16 = 2;
    goto LABEL_12;
  }
  v12 = v21;
  v22 = (void *)MEMORY[0x263EFF8F8];
  v23 = [NSURL URLWithString:v21];
  uint64_t v24 = [v22 dataWithContentsOfURL:v23];

  if (!v24)
  {
    v32 = [v8 icon];

    if (v32)
    {
      id v13 = +[MKLog log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v33 = [v8 bundleIdentifier];
        *(_DWORD *)buf = 138412290;
        v38 = v33;
        _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "did not receive an icon data due to an network error but will install a placeholder using existing metadata. id=%@", buf, 0xCu);
      }
      goto LABEL_4;
    }
  }
  v35 = (void *)v24;
  v36 = v12;
  v25 = +[MKLog log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v38 = v26;
    _os_log_impl(&dword_22BFAC000, v25, OS_LOG_TYPE_INFO, "will install a placeholder using the latest metadata from the app store. id=%@", buf, 0xCu);
  }
  v27 = [MKPlaceholder alloc];
  v34 = [v11 bundleIdentifier];
  v28 = [v11 appStoreIdentifier];
  v29 = [v11 name];
  v30 = [v11 developer];
  v31 = [(MKPlaceholder *)v27 initWithBundleIdentifier:v34 appStoreIdentifier:v28 bundleName:v29 developer:v30 icon:v35];

  [(MKPlaceholder *)v31 install];
LABEL_17:
  identifiers = self->_identifiers;
  uint64_t v20 = [v8 bundleIdentifier];
  [(NSMutableArray *)identifiers addObject:v20];
}

- (void)remove
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_identifiers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = [MKPlaceholder alloc];
        id v9 = -[MKPlaceholder initWithBundleIdentifier:](v8, "initWithBundleIdentifier:", v7, (void)v10);
        [(MKPlaceholder *)v9 uninstall];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end