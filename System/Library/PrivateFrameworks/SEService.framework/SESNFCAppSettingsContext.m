@interface SESNFCAppSettingsContext
+ (id)contextWithBundleId:(id)a3 onChange:(id)a4;
- (BOOL)existsDefaultAppCandidatesForService:(unint64_t)a3;
- (BOOL)isApplicationInstalledOrPlaceholder:(id)a3;
- (BOOL)isContactlessTCCServiceEligible;
- (BOOL)isDefaultApp;
- (BOOL)isDefaultAppEligibleForService:(unint64_t)a3;
- (BOOL)isDefaultAppTheOnlyCandidate;
- (BOOL)isDoubleClickEnabled;
- (BOOL)isExpressModeEnabled;
- (BOOL)isPassbookDefault;
- (BOOL)isSecureElementTCCServiceEligible;
- (BOOL)shouldShowDefaultNFCAppPicker;
- (BOOL)shouldShowDoubleButtonPressToggle;
- (NSArray)defaultAppCandidates;
- (NSString)bundleId;
- (NSUserDefaults)ud;
- (SESNFCAppSettingsContext)initWithBundleId:(id)a3 onChange:(id)a4;
- (id)alertMessageForDefaultAppChangeTo:(id)a3;
- (id)getDefaultNFCApplication;
- (id)localizedAppNameForBundleId:(id)a3;
- (unint64_t)doubleClickToggleVisibilityType;
- (unint64_t)topLevelEntryType;
- (unint64_t)topLevelSettingsEntryType;
- (void)appBasedKeyPathChangeHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)centralizedKeyPathChangeHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateInternal;
- (void)observeDefaults;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readDefaultValues;
- (void)reconcileWithRecord:(id)a3;
- (void)setDefaultNFCApplication:(id)a3;
- (void)setDoubleClickEnabled:(BOOL)a3;
@end

@implementation SESNFCAppSettingsContext

+ (id)contextWithBundleId:(id)a3 onChange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[SESNFCAppSettingsContext alloc] initWithBundleId:v6 onChange:v5];

  return v7;
}

- (SESNFCAppSettingsContext)initWithBundleId:(id)a3 onChange:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced.contactlessCredential.settings"];
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SESNFCAppSettingsContext;
    v10 = [(SESNFCAppSettingsContext *)&v19 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_bundleId, a3);
      v12 = _Block_copy(v8);
      id onChange = v11->_onChange;
      v11->_id onChange = v12;

      objc_storeStrong((id *)&v11->_ud, v9);
      v11->_lock._os_unfair_lock_opaque = 0;
      v11->_supportsTouchID = MGGetBoolAnswer();
      v11->_invalidated = 0;
      [(SESNFCAppSettingsContext *)v11 readDefaultValues];
      [(SESNFCAppSettingsContext *)v11 observeDefaults];
      v14 = SESDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        bundleId = v11->_bundleId;
        *(_DWORD *)buf = 138412290;
        v21 = bundleId;
        _os_log_impl(&dword_2146ED000, v14, OS_LOG_TYPE_DEBUG, "Successfully initialized app settings context for bundle ID %@", buf, 0xCu);
      }
    }
    self = v11;
    v16 = self;
  }
  else
  {
    v17 = SESDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_ERROR, "contextWithBundleId:onChange: unable to initialize ud", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)readDefaultValues
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(NSUserDefaults *)self->_ud stringForKey:@"defaultAppIdentifier"];
  currentDefaultBundleId = self->_currentDefaultBundleId;
  self->_currentDefaultBundleId = v3;

  id v5 = [(NSUserDefaults *)self->_ud arrayForKey:@"defaultAppCandidates"];
  Transform();
  id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  defaultAppCandidates = self->_defaultAppCandidates;
  self->_defaultAppCandidates = v6;

  self->_shouldShowSECDefaultPane = [(NSUserDefaults *)self->_ud BOOLForKey:@"shouldShowSECPane"];
  self->_shouldShowHCETCCPane = [(NSUserDefaults *)self->_ud BOOLForKey:@"shouldShowContactlessPane"];
  self->_shouldShowSECTCCPane = [(NSUserDefaults *)self->_ud BOOLForKey:@"shouldShowSecureElementTcc"];
  self->_shouldShowHCETCCPane = [(NSUserDefaults *)self->_ud BOOLForKey:@"shouldShowContactlessTcc"];
  self->_isDomainAluminumEligible = [(NSUserDefaults *)self->_ud BOOLForKey:@"aluminumEligibility"];
  self->_isDomainChromiumEligible = [(NSUserDefaults *)self->_ud BOOLForKey:@"chromiumEligibility"];
  self->_topLevelSettingsEntryType = [(SESNFCAppSettingsContext *)self topLevelEntryType];
  if (self->_bundleId)
  {
    id v8 = objc_alloc(MEMORY[0x263F01878]);
    bundleId = self->_bundleId;
    id v15 = 0;
    v10 = (void *)[v8 initWithBundleIdentifier:bundleId allowPlaceholder:0 error:&v15];
    id v11 = v15;
    v12 = v11;
    if (!v10 || v11)
    {
      v13 = SESDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = self->_bundleId;
        *(_DWORD *)buf = 138412546;
        v17 = v14;
        __int16 v18 = 2112;
        objc_super v19 = v12;
        _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_ERROR, "Bundle ID %@ does not correspond to a record or error encountered %@", buf, 0x16u);
      }

      self->_doubleClickToggleVisibilityType = 2;
      *(_WORD *)&self->_shouldShowDefaultNFCAppPicker = 0;
      self->_isContactlessTCCServiceEligible = 0;
    }
    else
    {
      [(SESNFCAppSettingsContext *)self reconcileWithRecord:v10];
    }
  }
  else
  {
    [(SESNFCAppSettingsContext *)self reconcileWithRecord:0];
  }
}

SESDefaultNFCApplication *__45__SESNFCAppSettingsContext_readDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [SESDefaultNFCApplication alloc];
  v4 = [v2 objectForKeyedSubscript:@"bundleId"];
  id v5 = [v2 objectForKeyedSubscript:@"displayName"];
  id v6 = [v2 objectForKeyedSubscript:@"domain"];

  id v7 = [(SESDefaultNFCApplication *)v3 initWithBundleId:v4 displayName:v5 rawDomain:v6];
  return v7;
}

- (void)observeDefaults
{
  v3 = [(SESNFCAppSettingsContext *)self ud];
  [v3 addObserver:self forKeyPath:@"shouldShowSECPane" options:1 context:defaultSECContext];

  v4 = [(SESNFCAppSettingsContext *)self ud];
  [v4 addObserver:self forKeyPath:@"shouldShowContactlessPane" options:1 context:defaultHCEContext];

  id v5 = [(SESNFCAppSettingsContext *)self ud];
  [v5 addObserver:self forKeyPath:@"shouldShowContactlessTcc" options:1 context:tccHCEContext];

  id v6 = [(SESNFCAppSettingsContext *)self ud];
  [v6 addObserver:self forKeyPath:@"shouldShowSecureElementTcc" options:1 context:tccSECContext];

  id v7 = [(SESNFCAppSettingsContext *)self ud];
  [v7 addObserver:self forKeyPath:@"defaultAppCandidates" options:1 context:defaultAppCandidatesChangedContext];

  id v8 = [(SESNFCAppSettingsContext *)self ud];
  [v8 addObserver:self forKeyPath:@"defaultAppIdentifier" options:1 context:defaultAppChangedContext];

  v9 = [(SESNFCAppSettingsContext *)self ud];
  [v9 addObserver:self forKeyPath:@"aluminumEligibility" options:1 context:defaultAluminumEligbilityChangedContext];

  id v10 = [(SESNFCAppSettingsContext *)self ud];
  [v10 addObserver:self forKeyPath:@"chromiumEligibility" options:1 context:defaultChromiumEligibilityChangedContext];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_bundleId) {
    [(SESNFCAppSettingsContext *)self appBasedKeyPathChangeHandler:a3 ofObject:a4 change:a5 context:a6];
  }
  else {
    [(SESNFCAppSettingsContext *)self centralizedKeyPathChangeHandler:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (void)appBasedKeyPathChangeHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v14 = objc_alloc(MEMORY[0x263F01878]);
  bundleId = self->_bundleId;
  id v33 = 0;
  v16 = (void *)[v14 initWithBundleIdentifier:bundleId allowPlaceholder:0 error:&v33];
  v17 = (NSString *)v33;
  __int16 v18 = v17;
  if (v16) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (!v19)
  {
    uint64_t v20 = SESDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_bundleId;
      *(_DWORD *)buf = 138412546;
      v35 = v21;
      __int16 v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_2146ED000, v20, OS_LOG_TYPE_ERROR, "Bundle ID %@ does not correspond to a record or error encountered %@", buf, 0x16u);
    }

    self->_doubleClickToggleVisibilityType = 2;
    *(_WORD *)&self->_shouldShowDefaultNFCAppPicker = 0;
    self->_isContactlessTCCServiceEligible = 0;
    goto LABEL_69;
  }
  if ((void *)defaultSECContext == a6)
  {
    v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_shouldShowSECDefaultPane = [v23 BOOLValue];
        goto LABEL_66;
      }
    }
    v24 = SESDefaultLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_2146ED000, v24, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowSECDefaultPane = 0;
  }
  else if ((void *)defaultHCEContext == a6)
  {
    v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_shouldShowHCEDefaultPane = [v23 BOOLValue];
        goto LABEL_66;
      }
    }
    v25 = SESDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_2146ED000, v25, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowHCEDefaultPane = 0;
  }
  else
  {
    if ((void *)tccSECContext != a6)
    {
      if ((void *)tccHCEContext == a6)
      {
        v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v27 = SESDefaultLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v10;
            _os_log_impl(&dword_2146ED000, v27, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
          }
          goto LABEL_72;
        }
        self->_shouldShowHCETCCPane = [v23 BOOLValue];
      }
      else
      {
        if ((void *)defaultAppChangedContext == a6)
        {
          v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_storeStrong((id *)&self->_currentDefaultBundleId, v23);
              v28 = SESDefaultLogObject();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v35 = (NSString *)v23;
                _os_log_impl(&dword_2146ED000, v28, OS_LOG_TYPE_DEBUG, "Changed default app %@", buf, 0xCu);
              }

              goto LABEL_66;
            }
          }
          v27 = SESDefaultLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v10;
            _os_log_impl(&dword_2146ED000, v27, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
          }
          goto LABEL_72;
        }
        if ((void *)defaultAppCandidatesChangedContext == a6)
        {
          v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v27 = SESDefaultLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v10;
              _os_log_impl(&dword_2146ED000, v27, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
            goto LABEL_72;
          }
          Transform();
          v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
          defaultAppCandidates = self->_defaultAppCandidates;
          self->_defaultAppCandidates = v29;
        }
        else
        {
          if ((void *)defaultAluminumEligbilityChangedContext != a6)
          {
            if ((void *)defaultChromiumEligibilityChangedContext != a6)
            {
              uint64_t v22 = SESDefaultLogObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v10;
                _os_log_impl(&dword_2146ED000, v22, OS_LOG_TYPE_DEBUG, "Change observed for irrelevant key %@, do not reconcile", buf, 0xCu);
              }

              goto LABEL_69;
            }
            v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                self->_isDomainChromiumEligible = [v23 BOOLValue];
                goto LABEL_66;
              }
            }
            v27 = SESDefaultLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v10;
              _os_log_impl(&dword_2146ED000, v27, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
LABEL_72:

            goto LABEL_69;
          }
          v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v27 = SESDefaultLogObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v10;
              _os_log_impl(&dword_2146ED000, v27, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
            }
            goto LABEL_72;
          }
          self->_isDomainAluminumEligible = [v23 BOOLValue];
        }
      }
LABEL_66:

      [(SESNFCAppSettingsContext *)self reconcileWithRecord:v16];
      v31 = SESDefaultLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v32 = self->_bundleId;
        *(_DWORD *)buf = 138412546;
        v35 = v10;
        __int16 v36 = 2112;
        v37 = v32;
        _os_log_impl(&dword_2146ED000, v31, OS_LOG_TYPE_DEBUG, "Key %@ changed, firing on visibility change for bundle Id %@", buf, 0x16u);
      }

      (*((void (**)(void))self->_onChange + 2))();
      goto LABEL_69;
    }
    v23 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_shouldShowSECTCCPane = [v23 BOOLValue];
        goto LABEL_66;
      }
    }
    v26 = SESDefaultLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_2146ED000, v26, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", buf, 0xCu);
    }

    self->_shouldShowSECTCCPane = 0;
  }
LABEL_69:

  os_unfair_lock_unlock(p_lock);
}

SESDefaultNFCApplication *__81__SESNFCAppSettingsContext_appBasedKeyPathChangeHandler_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Non-dictionary candidate found", (uint8_t *)v10, 2u);
    }

    id v7 = 0;
  }
  else
  {
    v3 = [SESDefaultNFCApplication alloc];
    v4 = [v2 objectForKeyedSubscript:@"bundleId"];
    id v5 = [v2 objectForKeyedSubscript:@"displayName"];
    id v6 = [v2 objectForKeyedSubscript:@"domain"];
    id v7 = [(SESDefaultNFCApplication *)v3 initWithBundleId:v4 displayName:v5 rawDomain:v6];
  }
  return v7;
}

- (void)centralizedKeyPathChangeHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((void *)defaultSECContext == a6)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v15 = SESDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2146ED000, v15, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
      }

      self->_shouldShowSECDefaultPane = 0;
      goto LABEL_55;
    }
    self->_shouldShowSECDefaultPane = [v14 BOOLValue];
    goto LABEL_48;
  }
  if ((void *)defaultHCEContext == a6)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v16 = SESDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2146ED000, v16, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
      }

      self->_shouldShowHCEDefaultPane = 0;
      goto LABEL_55;
    }
    self->_shouldShowHCEDefaultPane = [v14 BOOLValue];
    goto LABEL_48;
  }
  if ((void *)defaultAppChangedContext == a6)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v17 = SESDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v24 = 138412290;
          v25 = v10;
          _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v20 = SESDefaultLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_2146ED000, v20, OS_LOG_TYPE_DEBUG, "Setting none as default app in Context", (uint8_t *)&v24, 2u);
      }
    }
    objc_storeStrong((id *)&self->_currentDefaultBundleId, v14);
    v21 = SESDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138412290;
      v25 = v14;
      _os_log_impl(&dword_2146ED000, v21, OS_LOG_TYPE_DEBUG, "Changed default app %@", (uint8_t *)&v24, 0xCu);
    }

    goto LABEL_49;
  }
  if ((void *)defaultAppCandidatesChangedContext == a6)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v17 = SESDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_54;
    }
    Transform();
    __int16 v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    defaultAppCandidates = self->_defaultAppCandidates;
    self->_defaultAppCandidates = v18;
  }
  else
  {
    if ((void *)defaultAluminumEligbilityChangedContext != a6)
    {
      if ((void *)defaultChromiumEligibilityChangedContext != a6)
      {
        id v14 = SESDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v24 = 138412290;
          v25 = v10;
          _os_log_impl(&dword_2146ED000, v14, OS_LOG_TYPE_DEBUG, "Change observed for irrelevant key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
        }
        goto LABEL_55;
      }
      id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self->_isDomainChromiumEligible = [v14 BOOLValue];
          goto LABEL_48;
        }
      }
      v17 = SESDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
      }
LABEL_54:

LABEL_55:
      goto LABEL_56;
    }
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v17 = SESDefaultLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_ERROR, "Unexpected data type for key %@, do not reconcile", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_54;
    }
    self->_isDomainAluminumEligible = [v14 BOOLValue];
  }
LABEL_48:

LABEL_49:
  [(SESNFCAppSettingsContext *)self reconcileWithRecord:0];
  uint64_t v22 = SESDefaultLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    int v24 = 138412546;
    v25 = v10;
    __int16 v26 = 2112;
    v27 = bundleId;
    _os_log_impl(&dword_2146ED000, v22, OS_LOG_TYPE_DEBUG, "Key %@ changed, firing on visibility change for bundle Id %@", (uint8_t *)&v24, 0x16u);
  }

  (*((void (**)(void))self->_onChange + 2))();
LABEL_56:
  os_unfair_lock_unlock(p_lock);
}

SESDefaultNFCApplication *__84__SESNFCAppSettingsContext_centralizedKeyPathChangeHandler_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "Non-dictionary candidate found", (uint8_t *)v10, 2u);
    }

    id v7 = 0;
  }
  else
  {
    v3 = [SESDefaultNFCApplication alloc];
    v4 = [v2 objectForKeyedSubscript:@"bundleId"];
    id v5 = [v2 objectForKeyedSubscript:@"displayName"];
    id v6 = [v2 objectForKeyedSubscript:@"domain"];
    id v7 = [(SESDefaultNFCApplication *)v3 initWithBundleId:v4 displayName:v5 rawDomain:v6];
  }
  return v7;
}

- (void)reconcileWithRecord:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  BOOL v5 = [(SESNFCAppSettingsContext *)self isDefaultAppEligibleForService:1];
  BOOL v6 = [(SESNFCAppSettingsContext *)self isDefaultAppEligibleForService:0];
  bundleId = self->_bundleId;
  if (v4 | (unint64_t)bundleId
    && ![(NSString *)bundleId isEqualToString:@"com.apple.Passbook"])
  {
    int64_t v10 = +[TCCContext checkTCCAccessWithoutLoadingTo:0 for:self->_bundleId];
    id v11 = [(id)v4 entitlements];
    char v12 = objc_msgSend(v11, "ses_isEntitled:", @"com.apple.developer.nfc.hce");
    if (v10 == 2) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12;
    }
    self->_isContactlessTCCServiceEligible = v13;

    int64_t v14 = +[TCCContext checkTCCAccessWithoutLoadingTo:1 for:self->_bundleId];
    id v15 = [(id)v4 entitlements];
    char v16 = objc_msgSend(v15, "ses_isEntitled:", @"com.apple.developer.secure-element-credential");
    if (v14 == 2) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v16;
    }
    self->_isSecureElementTCCServiceEligible = v17;

    __int16 v18 = [(id)v4 entitlements];
    if (objc_msgSend(v18, "ses_isEntitled:", @"com.apple.developer.nfc.hce"))
    {
      BOOL v19 = [(id)v4 entitlements];
      int v20 = objc_msgSend(v19, "ses_isEntitled:", @"com.apple.developer.nfc.hce.default-contactless-app");
      if (v10) {
        int v21 = 0;
      }
      else {
        int v21 = v20;
      }
      int v22 = v21 & v5;
    }
    else
    {
      int v22 = 0;
    }

    v23 = [(id)v4 entitlements];
    if (objc_msgSend(v23, "ses_isEntitled:", @"com.apple.developer.secure-element-credential"))
    {
      int v24 = [(id)v4 entitlements];
      int v25 = objc_msgSend(v24, "ses_isEntitled:", @"com.apple.developer.secure-element-credential.default-contactless-app");
      if (v14) {
        int v26 = 0;
      }
      else {
        int v26 = v25;
      }
      int v27 = v26 & v6;
    }
    else
    {
      int v27 = 0;
    }

    uint64_t v28 = SESDefaultLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = self->_bundleId;
      int v30 = 138412802;
      v31 = v29;
      __int16 v32 = 1024;
      int v33 = v22;
      __int16 v34 = 1024;
      int v35 = v27;
      _os_log_impl(&dword_2146ED000, v28, OS_LOG_TYPE_DEBUG, "Bundle ID %@: isEligibleForDefaultHCE %d, isEligibleForDefaultSEC %d", (uint8_t *)&v30, 0x18u);
    }

    self->_shouldShowDefaultNFCAppPicker = v22 | v27;
    if ([(SESNFCAppSettingsContext *)self shouldShowDoubleButtonPressToggle]) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = 2;
    }
    uint64_t v9 = 56;
  }
  else
  {
    self->_shouldShowDefaultNFCAppPicker = v5 || v6;
    self->_doubleClickToggleVisibilityType = [(SESNFCAppSettingsContext *)self shouldShowDoubleButtonPressToggle] ^ 1;
    *(_WORD *)&self->_isSecureElementTCCServiceEligible = 0;
    unint64_t v8 = [(SESNFCAppSettingsContext *)self topLevelEntryType];
    uint64_t v9 = 72;
  }
  *(Class *)((char *)&self->super.isa + v9) = (Class)v8;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    int v5 = 138412290;
    BOOL v6 = bundleId;
    _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_DEBUG, "Invalidating app settings context for bundle ID %@", (uint8_t *)&v5, 0xCu);
  }

  [(SESNFCAppSettingsContext *)self invalidateInternal];
}

- (void)invalidateInternal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    id onChange = self->_onChange;
    self->_id onChange = 0;

    int v5 = [(SESNFCAppSettingsContext *)self ud];
    [v5 removeObserver:self forKeyPath:@"shouldShowSECPane"];

    BOOL v6 = [(SESNFCAppSettingsContext *)self ud];
    [v6 removeObserver:self forKeyPath:@"shouldShowContactlessPane"];

    uint64_t v7 = [(SESNFCAppSettingsContext *)self ud];
    [v7 removeObserver:self forKeyPath:@"shouldShowContactlessTcc"];

    unint64_t v8 = [(SESNFCAppSettingsContext *)self ud];
    [v8 removeObserver:self forKeyPath:@"shouldShowSecureElementTcc"];

    uint64_t v9 = [(SESNFCAppSettingsContext *)self ud];
    [v9 removeObserver:self forKeyPath:@"defaultAppCandidates"];

    int64_t v10 = [(SESNFCAppSettingsContext *)self ud];
    [v10 removeObserver:self forKeyPath:@"defaultAppIdentifier"];

    id v11 = [(SESNFCAppSettingsContext *)self ud];
    [v11 removeObserver:self forKeyPath:@"aluminumEligibility"];

    char v12 = [(SESNFCAppSettingsContext *)self ud];
    [v12 removeObserver:self forKeyPath:@"chromiumEligibility"];

    self->_invalidated = 1;
    BOOL v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int64_t v14 = 0;
      _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_DEBUG, "Successfully invalidated internally due to manual invalidation or dealloc", v14, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = bundleId;
    _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_DEBUG, "Deallocating app settings context for bundle ID %@", buf, 0xCu);
  }

  [(SESNFCAppSettingsContext *)self invalidateInternal];
  v5.receiver = self;
  v5.super_class = (Class)SESNFCAppSettingsContext;
  [(SESNFCAppSettingsContext *)&v5 dealloc];
}

- (id)getDefaultNFCApplication
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_DEBUG, "Getting default app", buf, 2u);
  }

  if (self->_currentDefaultBundleId)
  {
    defaultAppCandidates = self->_defaultAppCandidates;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__SESNFCAppSettingsContext_getDefaultNFCApplication__block_invoke;
    v10[3] = &unk_2642197D8;
    v10[4] = self;
    objc_super v5 = [(NSArray *)defaultAppCandidates find:v10];
    BOOL v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 bundleId];
      *(_DWORD *)buf = 138412290;
      char v12 = v7;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_INFO, "Default app queried with bundle Id %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "No default app found in user defaults", buf, 2u);
    }

    objc_super v5 = 0;
  }
  return v5;
}

uint64_t __52__SESNFCAppSettingsContext_getDefaultNFCApplication__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(*(void *)(a1 + 32) + 24)];

  return v4;
}

- (void)setDefaultNFCApplication:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  defaultAppCandidates = self->_defaultAppCandidates;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__SESNFCAppSettingsContext_setDefaultNFCApplication___block_invoke;
  v17[3] = &unk_2642197D8;
  id v7 = v5;
  id v18 = v7;
  uint64_t v8 = [(NSArray *)defaultAppCandidates find:v17];
  if (v8)
  {
    [(NSUserDefaults *)self->_ud setValue:v7 forKey:@"defaultAppIdentifier"];
    ud = self->_ud;
    int64_t v10 = [v8 domain];
    [(NSUserDefaults *)ud setValue:v10 forKey:@"domain"];

    id v11 = self->_ud;
    char v12 = [v8 localizedDisplayName];
    [(NSUserDefaults *)v11 setValue:v12 forKey:@"defaultAppLocalizedName"];

    [(NSUserDefaults *)self->_ud setBool:1 forKey:@"defaultAppCommitted"];
    CFPreferencesAppSynchronize(@"com.apple.seserviced.contactlessCredential.settings");
    objc_storeStrong((id *)&self->_currentDefaultBundleId, a3);
    uint64_t v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      int64_t v14 = "Successfully set %@ as default app";
      id v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_2146ED000, v15, v16, v14, buf, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = SESDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      int64_t v14 = "Bundle Id %@ is not a valid candidate";
      id v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_6;
    }
  }
}

uint64_t __53__SESNFCAppSettingsContext_setDefaultNFCApplication___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isDoubleClickEnabled
{
  return [(NSUserDefaults *)self->_ud BOOLForKey:@"doubleClickEnabled"];
}

- (void)setDoubleClickEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(NSUserDefaults *)self->_ud setBool:a3 forKey:@"doubleClickEnabled"];
  id v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    v7[0] = 67109378;
    v7[1] = v3;
    __int16 v8 = 2112;
    uint64_t v9 = bundleId;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_DEBUG, "Successfully set double click enabled %d from bundle Id %@", (uint8_t *)v7, 0x12u);
  }
}

- (id)alertMessageForDefaultAppChangeTo:(id)a3
{
  id v4 = a3;
  currentDefaultBundleId = self->_currentDefaultBundleId;
  if (currentDefaultBundleId && ![(NSString *)currentDefaultBundleId isEqualToString:v4])
  {
    BOOL v6 = objc_opt_new();
    if (self->_supportsTouchID) {
      +[SESSettingsLocalizedStringFactory touchIDAlertMessagePrefix];
    }
    else {
    __int16 v8 = +[SESSettingsLocalizedStringFactory nonTouchIDAlertMessagePrefix];
    }
    [v6 appendString:v8];

    if ([(NSString *)self->_currentDefaultBundleId isEqualToString:@"com.apple.Passbook"])
    {
      uint64_t v9 = +[SESSettingsLocalizedStringFactory passbookDefaultAlertMessage];
      [v6 appendString:v9];
    }
    else
    {
      uint64_t v9 = +[SESSettingsLocalizedStringFactory thirdPartyDefaultAlertMessage];
      uint64_t v10 = [(SESNFCAppSettingsContext *)self localizedAppNameForBundleId:self->_currentDefaultBundleId];
      id v11 = objc_msgSend(NSString, "stringWithFormat:", v9, v10, v10);
      [v6 appendString:v11];
    }
    if ([(SESNFCAppSettingsContext *)self isExpressModeEnabled])
    {
      char v12 = +[SESSettingsLocalizedStringFactory expressModeDefaultAlertMessagePostfix];
      [v6 appendString:v12];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isExpressModeEnabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int out_token = 0;
  uint32_t v2 = notify_register_check("com.apple.stockholm.express.state", &out_token);
  if (v2)
  {
    uint32_t v3 = v2;
    id v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v3;
      id v5 = "notify_register_check failed with status %d";
LABEL_7:
      _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_ERROR, v5, buf, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  uint32_t state = notify_get_state(out_token, &v13);
  id v7 = SESDefaultLogObject();
  id v4 = v7;
  if (state)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = state;
      id v5 = "notify_get_state failed with status %d";
      goto LABEL_7;
    }
LABEL_8:

    LOBYTE(v8) = 0;
    return v8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v13;
    _os_log_impl(&dword_2146ED000, v4, OS_LOG_TYPE_DEBUG, "Raw Express State 0x%llx", buf, 0xCu);
  }

  uint32_t v9 = notify_cancel(out_token);
  if (v9)
  {
    uint32_t v10 = v9;
    id v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = v10;
      _os_log_impl(&dword_2146ED000, v11, OS_LOG_TYPE_ERROR, "notify_cancel failed with status %d", buf, 8u);
    }
  }
  return (v13 >> 1) & 1;
}

- (id)localizedAppNameForBundleId:(id)a3
{
  id v4 = a3;
  defaultAppCandidates = self->_defaultAppCandidates;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__SESNFCAppSettingsContext_localizedAppNameForBundleId___block_invoke;
  v10[3] = &unk_2642197D8;
  id v11 = v4;
  id v6 = v4;
  id v7 = [(NSArray *)defaultAppCandidates find:v10];
  BOOL v8 = [v7 localizedDisplayName];

  return v8;
}

uint64_t __56__SESNFCAppSettingsContext_localizedAppNameForBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint32_t v3 = [a2 bundleId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)isDefaultAppEligibleForService:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v6 = domain_answer;
    id v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v23 = v6;
      BOOL v8 = "Default Contactless App Configurable returned error code %d";
      uint32_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
LABEL_7:
      _os_log_impl(&dword_2146ED000, v9, v10, v8, buf, 8u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  int v11 = os_eligibility_get_domain_answer();
  if (v11)
  {
    int v12 = v11;
    id v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v23 = v12;
      BOOL v8 = "Default Contactless App Usable returned error code %d";
      uint32_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  BOOL v14 = [(SESNFCAppSettingsContext *)self existsDefaultAppCandidatesForService:a3];
  id v15 = SESDefaultLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    bundleId = self->_bundleId;
    *(_DWORD *)buf = 138412546;
    *(void *)v23 = bundleId;
    *(_WORD *)&v23[8] = 1024;
    *(_DWORD *)int v24 = v14;
    _os_log_impl(&dword_2146ED000, v15, OS_LOG_TYPE_DEBUG, "Bundle ID %@: exists valid candidates %d", buf, 0x12u);
  }

  uint64_t v17 = self->_bundleId;
  if (v17)
  {
    if ([(NSString *)v17 isEqualToString:@"com.apple.Passbook"])
    {
      BOOL v19 = SESDefaultLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)v23 = a3;
        *(_WORD *)&v23[8] = 1024;
        *(_DWORD *)int v24 = 0;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = 0;
        _os_log_impl(&dword_2146ED000, v19, OS_LOG_TYPE_DEBUG, "Passbook - Service %lu: full pane: %d, limited pane %d", buf, 0x18u);
      }
    }
    else
    {
      id v20 = SESDefaultLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = self->_bundleId;
        *(_DWORD *)buf = 138413058;
        *(void *)v23 = v21;
        *(_WORD *)&v23[8] = 2048;
        *(void *)int v24 = a3;
        *(_WORD *)&v24[8] = 1024;
        int v25 = 0;
        __int16 v26 = 1024;
        int v27 = 0;
        _os_log_impl(&dword_2146ED000, v20, OS_LOG_TYPE_DEBUG, "Bundle Id %@ - Service %lu: full pane: %d, limited pane %d", buf, 0x22u);
      }
    }
    return 0;
  }
  else
  {
    id v18 = SESDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v23 = 0;
      *(_WORD *)&v23[4] = 1024;
      *(_DWORD *)&v23[6] = 0;
      _os_log_impl(&dword_2146ED000, v18, OS_LOG_TYPE_DEBUG, "Centralized - full pane: %d, limited pane: %d", buf, 0xEu);
    }

    return 0;
  }
}

- (BOOL)isDefaultAppTheOnlyCandidate
{
  if ([(NSArray *)self->_defaultAppCandidates count] != 1) {
    return 0;
  }
  uint32_t v3 = [(NSArray *)self->_defaultAppCandidates objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 bundleId];
  char v5 = [v4 isEqualToString:self->_currentDefaultBundleId];

  return v5;
}

- (BOOL)existsDefaultAppCandidatesForService:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint32_t v3 = &unk_26C56DD40;
    goto LABEL_5;
  }
  if (!a3)
  {
    uint32_t v3 = &unk_26C56DD58;
LABEL_5:
    defaultAppCandidates = self->_defaultAppCandidates;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__SESNFCAppSettingsContext_existsDefaultAppCandidatesForService___block_invoke;
    v8[3] = &unk_2642197D8;
    uint32_t v9 = v3;
    char v5 = [(NSArray *)defaultAppCandidates contains:v8];
    int v6 = v9;
    goto LABEL_9;
  }
  int v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_ERROR, "Service does not exist", buf, 2u);
  }
  char v5 = 0;
LABEL_9:

  return v5;
}

uint64_t __65__SESNFCAppSettingsContext_existsDefaultAppCandidatesForService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToNumber:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    int v6 = [v3 bundleId];
    uint64_t v5 = [v6 isEqualToString:@"com.apple.Passbook"];
  }
  return v5;
}

- (BOOL)isDefaultApp
{
  return [(NSString *)self->_bundleId isEqualToString:self->_currentDefaultBundleId];
}

- (BOOL)isPassbookDefault
{
  return [(NSString *)self->_currentDefaultBundleId isEqualToString:@"com.apple.Passbook"];
}

- (BOOL)shouldShowDoubleButtonPressToggle
{
  if ([(NSString *)self->_bundleId isEqualToString:@"com.apple.Passbook"])
  {
    return [(SESNFCAppSettingsContext *)self isPassbookDefault];
  }
  else if (self->_shouldShowDefaultNFCAppPicker)
  {
    currentDefaultBundleId = self->_currentDefaultBundleId;
    bundleId = self->_bundleId;
    return [(NSString *)currentDefaultBundleId isEqualToString:bundleId];
  }
  else
  {
    return 0;
  }
}

- (BOOL)isApplicationInstalledOrPlaceholder:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    int v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_ERROR, "Error %@ encountered when checking if %@ is installed", buf, 0x16u);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = v4 != 0;
  }

  return v7;
}

- (unint64_t)topLevelEntryType
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_bundleId || ![(NSArray *)self->_defaultAppCandidates count])
  {
    uint32_t v2 = SESDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_DEBUG, "No default app candidates exists", (uint8_t *)v7, 2u);
    }

    return 2;
  }
  else
  {
    unsigned int v5 = [(NSArray *)self->_defaultAppCandidates contains:&__block_literal_global_554];
    int v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_DEBUG, "External Candidate exists %d", (uint8_t *)v7, 8u);
    }

    return v5;
  }
}

uint64_t __45__SESNFCAppSettingsContext_topLevelEntryType__block_invoke(uint64_t a1, void *a2)
{
  uint32_t v2 = [a2 bundleId];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.Passbook"] ^ 1;

  return v3;
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)shouldShowDefaultNFCAppPicker
{
  return self->_shouldShowDefaultNFCAppPicker;
}

- (BOOL)isSecureElementTCCServiceEligible
{
  return self->_isSecureElementTCCServiceEligible;
}

- (BOOL)isContactlessTCCServiceEligible
{
  return self->_isContactlessTCCServiceEligible;
}

- (unint64_t)doubleClickToggleVisibilityType
{
  return self->_doubleClickToggleVisibilityType;
}

- (NSArray)defaultAppCandidates
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)topLevelSettingsEntryType
{
  return self->_topLevelSettingsEntryType;
}

- (NSUserDefaults)ud
{
  return self->_ud;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ud, 0);
  objc_storeStrong((id *)&self->_defaultAppCandidates, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_currentDefaultBundleId, 0);
  objc_storeStrong(&self->_onChange, 0);
}

@end