@interface UAUserActivityProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isRemoteActivity;
- (NSString)activityType;
- (NSString)bundleIdentifier;
- (NSString)dynamicActivityType;
- (NSUUID)uuid;
- (NSUserActivity)internalActivity;
- (UABestAppSuggestion)suggestedActivity;
- (UAUserActivityProxy)initWithActivity:(id)a3 bundleId:(id)a4;
- (UAUserActivityProxy)initWithCoder:(id)a3;
- (UAUserActivityProxy)initWithSuggestion:(id)a3;
- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 bundleID:(id)a5;
- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 dynamicActivityType:(id)a5 bundleID:(id)a6;
- (id)activityIfAvailible;
- (id)activitySubTitle;
- (id)activityTitle;
- (id)contentAttributeSet;
- (id)description;
- (unint64_t)hash;
- (void)accessActivity:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)launchActivityWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setInternalActivity:(id)a3;
- (void)setSuggestedActivity:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAUserActivityProxy

- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 dynamicActivityType:(id)a5 bundleID:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UAUserActivityProxy;
  v15 = [(UAUserActivityProxy *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_activityType, a4);
    objc_storeStrong((id *)&v16->_dynamicActivityType, a5);
    objc_storeStrong((id *)&v16->_bundleIdentifier, a6);
  }
  v17 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544131;
    id v21 = v11;
    __int16 v22 = 2113;
    id v23 = v12;
    __int16 v24 = 2113;
    id v25 = v13;
    __int16 v26 = 2114;
    id v27 = v14;
    _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_DEBUG, "UAUserActivityProxy:initWithUUID %{public}@ type:%{private}@/%{private}@ bundleIdentifier:%{public}@", buf, 0x2Au);
  }

  return v16;
}

- (UAUserActivityProxy)initWithUUID:(id)a3 activityType:(id)a4 bundleID:(id)a5
{
  return [(UAUserActivityProxy *)self initWithUUID:a3 activityType:a4 dynamicActivityType:0 bundleID:a5];
}

- (UAUserActivityProxy)initWithActivity:(id)a3 bundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 _uniqueIdentifier];
  v9 = [v6 activityType];
  v10 = [v6 _internalUserActivity];
  id v11 = [v10 dynamicIdentifier];
  id v12 = [(UAUserActivityProxy *)self initWithUUID:v8 activityType:v9 dynamicActivityType:v11 bundleID:v7];

  if (v12)
  {
    [(UAUserActivityProxy *)v12 setInternalActivity:v6];
    uint64_t v13 = [v6 activityType];
    activityType = v12->_activityType;
    v12->_activityType = (NSString *)v13;

    objc_storeStrong((id *)&v12->_bundleIdentifier, a4);
    v12->_isRemoteActivity = 0;
    v15 = [(UAUserActivityProxy *)v12 internalActivity];
    v16 = [v15 _internalUserActivity];
    v17 = [v16 callWillSaveDelegateIfDirtyAndPackageUpData:0 options:0 clearDirty:0];

    id v18 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [v17 _createUserActivityStrings:v18 secondaryString:v19 optionalData:v20];
  }
  return v12;
}

- (UAUserActivityProxy)initWithSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];
  id v6 = [v4 activityType];
  id v7 = [v4 dynamicIdentifier];
  v8 = [v4 bundleIdentifier];
  v9 = [(UAUserActivityProxy *)self initWithUUID:v5 activityType:v6 dynamicActivityType:v7 bundleID:v8];

  if (v9)
  {
    [(UAUserActivityProxy *)v9 setSuggestedActivity:v4];
    uint64_t v10 = [v4 activityType];
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    uint64_t v12 = [v4 bundleIdentifier];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v12;

    v9->_isRemoteActivity = 1;
  }

  return v9;
}

- (void)accessActivity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = [(UAUserActivityProxy *)self isRemoteActivity];
    id v7 = @"Activity";
    if (v6) {
      id v7 = @"Suggesion";
    }
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "[PROXY] Accessing activity proxy: %@", buf, 0xCu);
  }

  v8 = [(UAUserActivityProxy *)self internalActivity];

  if (v8)
  {
    v9 = [(UAUserActivityProxy *)self internalActivity];
    v4[2](v4, v9, 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    uint64_t v10 = [(UAUserActivityProxy *)self suggestedActivity];
    id v11 = [v10 uniqueIdentifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __38__UAUserActivityProxy_accessActivity___block_invoke;
    v12[3] = &unk_1E6082FF0;
    objc_copyWeak(&v14, (id *)buf);
    uint64_t v13 = v4;
    +[UAUserActivity fetchUserActivityWithUUID:v11 completionHandler:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __38__UAUserActivityProxy_accessActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "[PROXY] Finished fetching activity", v12, 2u);
  }

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) initWithInternalUserActivity:v5];
    [WeakRetained setInternalActivity:v9];

    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = [WeakRetained internalActivity];
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)launchActivityWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, UABestAppSuggestionManager *))a4;
  v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if ([(UAUserActivityProxy *)self isRemoteActivity]) {
      v9 = @"Suggesion";
    }
    else {
      v9 = @"Activity";
    }
    uint64_t v10 = [(UAUserActivityProxy *)self activityType];
    id v11 = [(UAUserActivityProxy *)self bundleIdentifier];
    *(_DWORD *)buf = 138412803;
    v34 = v9;
    __int16 v35 = 2113;
    v36 = v10;
    __int16 v37 = 2113;
    v38 = v11;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "[PROXY] Launching activity proxy: %@, at: %{private}@, id: %{private}@", buf, 0x20u);
  }
  id v12 = objc_alloc(MEMORY[0x1E4F223C8]);
  uint64_t v13 = [(UAUserActivityProxy *)self bundleIdentifier];
  id v30 = 0;
  id v14 = (void *)[v12 initWithBundleIdentifier:v13 allowPlaceholder:0 error:&v30];
  v15 = (__CFString *)v30;

  if (v15 || !v14)
  {
    if (v15)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v32 = v15;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    }
    else
    {
      id v21 = 0;
    }
    __int16 v22 = (UABestAppSuggestionManager *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"UAContinuityErrorDomain" code:-134 userInfo:v21];
    id v23 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v15;
      _os_log_impl(&dword_1B3DF6000, v23, OS_LOG_TYPE_ERROR, "[PROXY] Application lookup failed: %@", buf, 0xCu);
    }

    v7[2](v7, 0, v22);
  }
  else
  {
    v16 = [v6 objectForKey:@"com.apple.coreservices.useractivity.interactiontype"];

    if (v16)
    {
      uint64_t v17 = (void *)[v6 mutableCopy];
      id v18 = [v17 objectForKeyedSubscript:@"com.apple.coreservices.useractivity.interactiontype"];
      uint64_t v19 = [v18 unsignedIntegerValue];

      [v17 removeObjectForKey:@"com.apple.coreservices.useractivity.interactiontype"];
      uint64_t v20 = [v17 copy];

      id v6 = (id)v20;
    }
    else
    {
      uint64_t v19 = 805306368;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F224A0]);
    [v21 setFrontBoardOptions:v6];
    __int16 v24 = [(UAUserActivityProxy *)self internalActivity];

    __int16 v22 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    if (v24)
    {
      id v25 = [(UAUserActivityProxy *)self internalActivity];
      [(UABestAppSuggestionManager *)v22 openUserActivity:v25 usingApplicationRecord:v14 configuration:v21 completionHandler:v7];
    }
    else
    {
      __int16 v26 = [(UAUserActivityProxy *)self suggestedActivity];
      id v27 = [v26 uniqueIdentifier];
      [(UAUserActivityProxy *)self activityType];
      uint64_t v28 = v29 = v19;
      [(UABestAppSuggestionManager *)v22 openUserActivityWithUUID:v27 activityType:v28 usingApplicationRecord:v14 configuration:v21 completionHandler:v7];

      __int16 v22 = objc_alloc_init(UABestAppSuggestionManager);
      id v25 = [(UAUserActivityProxy *)self suggestedActivity];
      [(UABestAppSuggestionManager *)v22 bestAppSuggestionWasLaunched:v25 withInteractionType:v29];
    }
  }
}

- (unint64_t)hash
{
  v2 = [(UAUserActivityProxy *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)activityIfAvailible
{
  unint64_t v3 = [(UAUserActivityProxy *)self internalActivity];

  if (v3)
  {
    id v4 = [(UAUserActivityProxy *)self internalActivity];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)activityTitle
{
  unint64_t v3 = [(UAUserActivityProxy *)self internalActivity];

  if (v3)
  {
    id v4 = [(UAUserActivityProxy *)self internalActivity];
    id v5 = [v4 title];
  }
  else
  {
    id v5 = &stru_1F0CB4508;
  }

  return v5;
}

- (id)activitySubTitle
{
  unint64_t v3 = [(UAUserActivityProxy *)self internalActivity];

  if (v3)
  {
    id v4 = [(UAUserActivityProxy *)self internalActivity];
    id v5 = [v4 _internalUserActivity];
    id v6 = [v5 contentAttributeSet];
    id v7 = [v6 contentDescription];
  }
  else
  {
    id v7 = &stru_1F0CB4508;
  }

  return v7;
}

- (id)contentAttributeSet
{
  unint64_t v3 = [(UAUserActivityProxy *)self internalActivity];

  if (v3)
  {
    id v4 = [(UAUserActivityProxy *)self internalActivity];
    id v5 = [v4 contentAttributeSet];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(UAUserActivityProxy *)self uuid];
  id v5 = [(UAUserActivityProxy *)self activityType];
  id v6 = [(UAUserActivityProxy *)self dynamicActivityType];
  id v7 = [(UAUserActivityProxy *)self bundleIdentifier];
  v8 = [v3 stringWithFormat:@"UAUserActivityProxy(%@ %@/%@ %@)", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(UAUserActivityProxy *)self uuid];
  [v11 encodeObject:v4 forKey:@"uuid"];

  id v5 = [(UAUserActivityProxy *)self activityType];
  [v11 encodeObject:v5 forKey:@"ProxiedActivityType"];

  id v6 = [(UAUserActivityProxy *)self bundleIdentifier];
  [v11 encodeObject:v6 forKey:@"ProxiedBundleID"];

  objc_msgSend(v11, "encodeBool:forKey:", -[UAUserActivityProxy isRemoteActivity](self, "isRemoteActivity"), @"ProxiedActivityIsRemote");
  if ([(UAUserActivityProxy *)self isRemoteActivity])
  {
    id v7 = [(UAUserActivityProxy *)self suggestedActivity];
    v8 = @"ProxiedSuggestion";
  }
  else
  {
    v9 = [(UAUserActivityProxy *)self internalActivity];
    uint64_t v10 = [v9 _internalUserActivity];
    id v7 = [v10 callWillSaveDelegateIfDirtyAndPackageUpData:0 options:0 clearDirty:0];

    v8 = @"ProxiedActivityInfo";
  }
  [v11 encodeObject:v7 forKey:v8];
}

- (UAUserActivityProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UAUserActivityProxy;
  id v5 = [(UAUserActivityProxy *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxiedActivityType"];
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxiedBundleID"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    v5->_isRemoteActivity = [v4 decodeBoolForKey:@"ProxiedActivityIsRemote"];
    if ([(UAUserActivityProxy *)v5 isRemoteActivity])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxiedSuggestion"];
      suggestedActivity = v5->_suggestedActivity;
      v5->_suggestedActivity = (UABestAppSuggestion *)v12;
    }
    else
    {
      suggestedActivity = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProxiedActivityInfo"];
      id v14 = [UAUserActivity alloc];
      v15 = +[UAUserActivityManager defaultManager];
      v16 = [(UAUserActivity *)v14 initWithManager:v15 userActivityInfo:suggestedActivity];

      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F29230]) initWithInternalUserActivity:v16];
      internalActivity = v5->_internalActivity;
      v5->_internalActivity = (NSUserActivity *)v17;

      id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [suggestedActivity _createUserActivityStrings:v19 secondaryString:v20 optionalData:v21];
    }
  }

  return v5;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)dynamicActivityType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUuid:(id)a3
{
}

- (BOOL)isRemoteActivity
{
  return self->_isRemoteActivity;
}

- (NSUserActivity)internalActivity
{
  return (NSUserActivity *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInternalActivity:(id)a3
{
}

- (UABestAppSuggestion)suggestedActivity
{
  return (UABestAppSuggestion *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSuggestedActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActivity, 0);
  objc_storeStrong((id *)&self->_internalActivity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicActivityType, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end