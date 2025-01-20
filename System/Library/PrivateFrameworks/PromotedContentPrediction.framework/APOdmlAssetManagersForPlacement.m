@interface APOdmlAssetManagersForPlacement
- (APOdmlAssetManager)counterfactualAssetManager;
- (APOdmlAssetManager)runtimeAssetManager;
- (APOdmlAssetManagersForPlacement)initWithPlacementType:(unint64_t)a3 trialClient:(id)a4;
- (id)assetManagerForType:(unint64_t)a3;
@end

@implementation APOdmlAssetManagersForPlacement

- (id)assetManagerForType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v4 = objc_msgSend_counterfactualAssetManager(self, a2, 1);
  }
  else if (a3)
  {
    v5 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      unint64_t v11 = a3;
      id v6 = v9;
      _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_ERROR, "[%@] The following asset manager type is not supported: %lu", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    v4 = objc_msgSend_runtimeAssetManager(self, a2, 0);
  }

  return v4;
}

- (APOdmlAssetManager)runtimeAssetManager
{
  return self->_runtimeAssetManager;
}

- (APOdmlAssetManagersForPlacement)initWithPlacementType:(unint64_t)a3 trialClient:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)APOdmlAssetManagersForPlacement;
  v7 = [(APOdmlAssetManagersForPlacement *)&v27 init];
  if (v7)
  {
    if (a3 == 1)
    {
      v16 = [APOdmlAssetManager alloc];
      uint64_t v18 = objc_msgSend_initWithNamespace_andClient_(v16, v17, @"SLP_ADS_RUNTIME", v6);
      runtimeAssetManager = v7->_runtimeAssetManager;
      v7->_runtimeAssetManager = (APOdmlAssetManager *)v18;

      v20 = [APOdmlAssetManager alloc];
      uint64_t v22 = objc_msgSend_initWithNamespace_andClient_(v20, v21, @"SLP_ADS_COUNTERFACTUAL", v6);
      counterfactualAssetManager = v7->_counterfactualAssetManager;
      v7->_counterfactualAssetManager = (APOdmlAssetManager *)v22;
    }
    else if (!a3)
    {
      int v8 = [APOdmlAssetManager alloc];
      uint64_t v10 = objc_msgSend_initWithNamespace_andClient_(v8, v9, @"AD_PLATFORMS_ODML", v6);
      unint64_t v11 = v7->_runtimeAssetManager;
      v7->_runtimeAssetManager = (APOdmlAssetManager *)v10;

      uint64_t v12 = [APOdmlAssetManager alloc];
      uint64_t v14 = objc_msgSend_initWithNamespace_andClient_(v12, v13, @"SEARCH_ADS_COUNTERFACTUAL", v6);
      p_super = &v7->_counterfactualAssetManager->super;
      v7->_counterfactualAssetManager = (APOdmlAssetManager *)v14;
LABEL_8:

      goto LABEL_9;
    }
    p_super = OdmlLogForCategory(0);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v29 = v24;
      __int16 v30 = 2048;
      unint64_t v31 = a3;
      id v25 = v24;
      _os_log_impl(&dword_1BBC44000, p_super, OS_LOG_TYPE_ERROR, "[%@] The following placement type is not supported: %lu", buf, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (APOdmlAssetManager)counterfactualAssetManager
{
  return self->_counterfactualAssetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterfactualAssetManager, 0);

  objc_storeStrong((id *)&self->_runtimeAssetManager, 0);
}

@end