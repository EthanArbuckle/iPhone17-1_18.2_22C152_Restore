@interface NTKCompanionSyncedComplication
- (CLKComplicationDescriptor)descriptor;
- (NSString)appBundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)localizedName;
- (NTKCompanionSyncedComplication)initWithRemoteApplication:(id)a3 descriptor:(id)a4;
@end

@implementation NTKCompanionSyncedComplication

- (NTKCompanionSyncedComplication)initWithRemoteApplication:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKCompanionSyncedComplication;
  v8 = [(NTKCompanionSyncedComplication *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_descriptor, a4);
    v10 = [v6 watchKitAppExtensionBundleID];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v6 bundleIdentifier];
    }
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = v12;

    uint64_t v14 = [v6 bundleIdentifier];
    appBundleIdentifier = v9->_appBundleIdentifier;
    v9->_appBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v6 companionAppBundleID];
    companionBundleIdentifier = v9->_companionBundleIdentifier;
    v9->_companionBundleIdentifier = (NSString *)v16;

    uint64_t v18 = [v6 applicationName];
    fallbackName = v9->_fallbackName;
    v9->_fallbackName = (NSString *)v18;
  }
  return v9;
}

- (NSString)localizedName
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_localizedName = (id *)&self->_localizedName;
  localizedName = self->_localizedName;
  if (localizedName) {
    goto LABEL_11;
  }
  v5 = (void *)MEMORY[0x1C1875BE0](0, a2);
  id v6 = objc_alloc(MEMORY[0x1E4F223C8]);
  companionBundleIdentifier = self->_companionBundleIdentifier;
  id v16 = 0;
  v8 = (void *)[v6 initWithBundleIdentifier:companionBundleIdentifier allowPlaceholder:1 error:&v16];
  id v9 = v16;
  if (!v8)
  {
    v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_companionBundleIdentifier;
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      v20 = self;
      __int16 v21 = 2114;
      id v22 = v9;
      _os_log_error_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_ERROR, "Manager could not find record with bundle ID %@ for complication %@ - %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  uint64_t v10 = [v8 localizedName];
  id v11 = *p_localizedName;
  id *p_localizedName = (id)v10;

  if (![*p_localizedName length])
  {
    uint64_t v12 = [v8 localizedShortName];
    v13 = *p_localizedName;
    id *p_localizedName = (id)v12;
LABEL_7:
  }
  if (![*p_localizedName length]) {
    objc_storeStrong(p_localizedName, self->_fallbackName);
  }

  localizedName = (NSString *)*p_localizedName;
LABEL_11:

  return localizedName;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_fallbackName, 0);

  objc_storeStrong((id *)&self->_companionBundleIdentifier, 0);
}

@end