@interface INIntentDescriptor(Shortcuts)
- (id)_displayableAppDescriptor;
- (id)serializedRepresentation;
- (uint64_t)hashForSmartPromptPurposes;
- (uint64_t)initWithSerializedRepresentation:()Shortcuts;
- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts;
@end

@implementation INIntentDescriptor(Shortcuts)

- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16.receiver = a1;
      v16.super_class = (Class)&off_1F0CCB718;
      unsigned int v5 = objc_msgSendSuper2(&v16, sel_isEqualForSmartPromptPurposes_, v4);
      id v6 = v4;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7 = v6;
        }
        else {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      id v9 = v7;

      if (v5)
      {
        v10 = [a1 displayableBundleIdentifier];
        v11 = [v9 displayableBundleIdentifier];
        id v12 = v10;
        id v13 = v11;
        v14 = v13;
        if (v12 == v13)
        {
          uint64_t v8 = 1;
        }
        else
        {
          uint64_t v8 = 0;
          if (v12 && v13) {
            uint64_t v8 = [v12 isEqualToString:v13];
          }
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (uint64_t)hashForSmartPromptPurposes
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F0CCB718;
  unint64_t v2 = (unint64_t)objc_msgSendSuper2(&v6, sel_hashForSmartPromptPurposes);
  v3 = [a1 displayableBundleIdentifier];
  uint64_t v4 = [v3 hash] ^ v2;

  return v4;
}

- (uint64_t)initWithSerializedRepresentation:()Shortcuts
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:@"Name"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = v5;
    }
    else {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v4 objectForKey:@"BundleIdentifier"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  v11 = [v4 objectForKey:@"ExtensionBundleIdentifier"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  v14 = [v4 objectForKey:@"TeamIdentifier"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [v4 objectForKey:@"IntentClassName"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = [a1 initWithIntentClassName:v19 localizedName:v7 bundleIdentifier:v10 displayableBundleIdentifier:0 extensionBundleIdentifier:v13 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:v16 preferredCallProvider:0 supportedIntents:0 bundleURL:0 documentTypes:0];
  return v20;
}

- (id)serializedRepresentation
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F0CCB718;
  unint64_t v2 = objc_msgSendSuper2(&v6, sel_serializedRepresentation);
  v3 = (void *)[v2 mutableCopy];

  id v4 = [a1 intentClassName];
  [v3 setValue:v4 forKey:@"IntentClassName"];

  return v3;
}

- (id)_displayableAppDescriptor
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 bundleIdentifier];
  v3 = [a1 displayableBundleIdentifier];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    unsigned int v5 = [a1 appDescriptor];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v7 = [a1 displayableBundleIdentifier];
    id v13 = 0;
    uint64_t v8 = (void *)[v6 initWithBundleIdentifier:v7 allowPlaceholder:0 error:&v13];
    id v9 = v13;

    if (v8)
    {
      os_log_t v10 = (os_log_t)[objc_alloc(MEMORY[0x1E4F302A8]) initWithApplicationRecord:v8];
      v11 = [a1 extensionBundleIdentifier];
      unsigned int v5 = [v10 descriptorWithExtensionBundleIdentifier:v11];
    }
    else
    {
      os_log_t v10 = os_log_create("com.apple.siri", "Intents");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_error_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_ERROR, "Unable to get an app record for the displayable app, returning the launchable app instead. (%@)", buf, 0xCu);
      }
      unsigned int v5 = [a1 appDescriptor];
    }
  }
  return v5;
}

@end