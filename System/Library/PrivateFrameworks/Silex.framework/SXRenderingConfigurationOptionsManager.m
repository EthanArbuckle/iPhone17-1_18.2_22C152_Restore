@interface SXRenderingConfigurationOptionsManager
- (BOOL)validateConfigurationOption:(id)a3;
- (BOOL)validateConfigurationOption:(id)a3 documentSpecVersion:(id)a4 clientSpecVersion:(id)a5;
- (SXDocumentProviding)documentProvider;
- (SXHintsConfigurationOption)hints;
- (SXRenderingConfigurationOptionsManager)initWithDocumentProvider:(id)a3 configurationProvider:(id)a4;
- (SXRenderingConfigurationProvider)configurationProvider;
- (os_unfair_lock_s)lock;
@end

@implementation SXRenderingConfigurationOptionsManager

- (SXRenderingConfigurationOptionsManager)initWithDocumentProvider:(id)a3 configurationProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXRenderingConfigurationOptionsManager;
  v9 = [(SXRenderingConfigurationOptionsManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_configurationProvider, a4);
  }

  return v10;
}

- (SXHintsConfigurationOption)hints
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_hints;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    v5 = [(SXRenderingConfigurationProvider *)self->_configurationProvider configuration];
    v4 = [v5 hints];

    if ([(SXRenderingConfigurationOptionsManager *)self validateConfigurationOption:v4])
    {
      if (v4)
      {
LABEL_7:
        os_unfair_lock_lock_with_options();
        objc_storeStrong((id *)&self->_hints, v4);
        os_unfair_lock_unlock(p_lock);
        goto LABEL_8;
      }
    }
    else
    {
    }
    v4 = objc_alloc_init(SXDefaultHintsConfigurationOption);
    goto LABEL_7;
  }
LABEL_8:
  v6 = v4;

  return v6;
}

- (BOOL)validateConfigurationOption:(id)a3
{
  v3 = self;
  documentProvider = self->_documentProvider;
  id v5 = a3;
  v6 = [(SXDocumentProviding *)documentProvider document];
  id v7 = [v6 specVersion];
  LOBYTE(v3) = [(SXRenderingConfigurationOptionsManager *)v3 validateConfigurationOption:v5 documentSpecVersion:v7 clientSpecVersion:@"1.28"];

  return (char)v3;
}

- (BOOL)validateConfigurationOption:(id)a3 documentSpecVersion:(id)a4 clientSpecVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v7 minDocumentSpecVersion];
    if (v10)
    {
      v11 = (void *)v10;
      objc_super v12 = [v7 minDocumentSpecVersion];
      uint64_t v13 = SXSpecVersionCompare(v8, v12);

      if (v13 == -1) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = [v7 maxDocumentSpecVersion];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [v7 maxDocumentSpecVersion];
      uint64_t v17 = SXSpecVersionCompare(v8, v16);

      if (v17 == 1) {
        goto LABEL_11;
      }
    }
  }
  if (!v9)
  {
LABEL_12:
    BOOL v25 = 1;
    goto LABEL_13;
  }
  uint64_t v18 = [v7 minClientSpecVersion];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v7 minClientSpecVersion];
    uint64_t v21 = SXSpecVersionCompare(v8, v20);

    if (v21 == -1)
    {
LABEL_11:
      BOOL v25 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v22 = [v7 maxClientSpecVersion];
  if (!v22) {
    goto LABEL_12;
  }
  v23 = (void *)v22;
  v24 = [v7 maxClientSpecVersion];
  BOOL v25 = SXSpecVersionCompare(v9, v24) != 1;

LABEL_13:
  return v25;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXRenderingConfigurationProvider)configurationProvider
{
  return self->_configurationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_hints, 0);
}

@end