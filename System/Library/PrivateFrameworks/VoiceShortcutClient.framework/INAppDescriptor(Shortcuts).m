@interface INAppDescriptor(Shortcuts)
- (BOOL)isProbablySecondParty;
- selfIfNotShortcutsApp;
- (id)serializedRepresentation;
- (uint64_t)hashForSmartPromptPurposes;
- (uint64_t)initWithBundleRecord:()Shortcuts;
- (uint64_t)initWithSerializedRepresentation:()Shortcuts;
- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts;
- (uint64_t)isShortcutsApp;
- (uint64_t)isThirdParty;
@end

@implementation INAppDescriptor(Shortcuts)

- (id)serializedRepresentation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [a1 localizedName];
  [v2 setValue:v3 forKey:@"Name"];

  v4 = [a1 bundleIdentifier];
  [v2 setValue:v4 forKey:@"BundleIdentifier"];

  v5 = [a1 extensionBundleIdentifier];
  [v2 setValue:v5 forKey:@"ExtensionBundleIdentifier"];

  v6 = [a1 teamIdentifier];
  [v2 setValue:v6 forKey:@"TeamIdentifier"];

  return v2;
}

- selfIfNotShortcutsApp
{
  void *v2;
  uint64_t vars8;

  if ([a1 isShortcutsApp]) {
    id v2 = 0;
  }
  else {
    id v2 = a1;
  }
  return v2;
}

- (uint64_t)isShortcutsApp
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.shortcuts"];

  return v2;
}

- (BOOL)isProbablySecondParty
{
  v1 = [a1 applicationRecord];
  uint64_t v2 = v1;
  BOOL v3 = v1 && [v1 developerType] == -1;

  return v3;
}

- (uint64_t)isThirdParty
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.siri.TeaMinus", @"com.iosframeworksqa.Receptor", 0);
  BOOL v3 = [a1 applicationRecord];
  v4 = [v3 bundleIdentifier];
  char v5 = [v2 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    v7 = [a1 extensionBundleIdentifier];
    char v8 = [v7 isEqualToString:@"com.apple.PBBridgeSupport.BridgeIntents"];

    if (v8)
    {
      uint64_t v6 = 0;
      goto LABEL_12;
    }
    v9 = [a1 applicationRecord];
    v10 = v9;
    if (v9)
    {
      if ([v9 developerType] == 3)
      {
        uint64_t v6 = 1;
LABEL_11:

        goto LABEL_12;
      }
      if ([v10 developerType] == 1)
      {
        uint64_t v6 = 0;
        goto LABEL_11;
      }
    }
    v11 = [a1 bundleIdentifier];
    v12 = [v11 lowercaseString];
    int v13 = [v12 hasPrefix:@"com.apple."];

    v14 = [a1 extensionBundleIdentifier];
    v15 = [v14 lowercaseString];
    LODWORD(v12) = [v15 hasPrefix:@"com.apple."];

    uint64_t v6 = (v13 | v12) ^ 1;
    goto LABEL_11;
  }
  uint64_t v6 = 1;
LABEL_12:

  return v6;
}

- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts
{
  id v4 = a3;
  if (a1 == v4)
  {
    uint64_t v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v6 = v5;
        }
        else {
          uint64_t v6 = 0;
        }
      }
      else
      {
        uint64_t v6 = 0;
      }
      id v8 = v6;

      v9 = [a1 bundleIdentifier];
      if ([&unk_1F0CB1CD0 containsObject:v9])
      {
        v10 = [v8 bundleIdentifier];
        int v11 = [&unk_1F0CB1CD0 containsObject:v10];
      }
      else
      {
        int v11 = 0;
      }

      v12 = [a1 bundleIdentifier];
      int v13 = [v8 bundleIdentifier];
      id v14 = v12;
      id v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {
        int v11 = 1;
      }
      else if (v14 && v15)
      {
        v11 |= [v14 isEqualToString:v15];
      }

      v17 = [a1 teamIdentifier];
      uint64_t v18 = [v8 teamIdentifier];
      v19 = (void *)v18;
      if (v17)
      {
        if (v18) {
          goto LABEL_20;
        }
      }
      else
      {
        v23 = [a1 applicationRecord];
        v17 = [v23 teamIdentifier];

        if (v19)
        {
LABEL_20:
          if (v11)
          {
LABEL_21:
            id v20 = v17;
            id v21 = v19;
            v22 = v21;
            if (v20 == v21)
            {
              uint64_t v7 = 1;
            }
            else
            {
              uint64_t v7 = 0;
              if (v20 && v21) {
                uint64_t v7 = [v20 isEqualToString:v21];
              }
            }

            goto LABEL_30;
          }
LABEL_27:
          uint64_t v7 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      v24 = [v8 applicationRecord];
      v19 = [v24 teamIdentifier];

      if (v11) {
        goto LABEL_21;
      }
      goto LABEL_27;
    }
    uint64_t v7 = 0;
  }
LABEL_31:

  return v7;
}

- (uint64_t)hashForSmartPromptPurposes
{
  uint64_t v2 = [a1 localizedName];
  uint64_t v3 = [v2 hash];
  id v4 = [a1 bundleIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [a1 teamIdentifier];
  uint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (uint64_t)initWithSerializedRepresentation:()Shortcuts
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"Name"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [v4 objectForKey:@"BundleIdentifier"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  int v11 = [v4 objectForKey:@"ExtensionBundleIdentifier"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  id v14 = [v4 objectForKey:@"TeamIdentifier"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  id v16 = v15;

  uint64_t v17 = [a1 initWithLocalizedName:v7 bundleIdentifier:v10 extensionBundleIdentifier:v13 counterpartIdentifiers:0 teamIdentifier:v16 supportedIntents:0 bundleURL:0 documentTypes:0];
  return v17;
}

- (uint64_t)initWithBundleRecord:()Shortcuts
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v13 = v6;

    id v14 = objc_msgSend(v13, "if_extensionAttributesDictionary");
    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    id v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F300B8]];
    uint64_t v17 = [v15 setWithArray:v16];

    id v18 = objc_alloc(MEMORY[0x1E4F302A8]);
    v19 = [v13 localizedName];
    id v20 = [v13 bundleIdentifier];
    id v21 = [v13 teamIdentifier];
    v22 = [v13 URL];

    uint64_t v7 = [v18 initWithLocalizedName:v19 bundleIdentifier:0 extensionBundleIdentifier:v20 counterpartIdentifiers:0 teamIdentifier:v21 supportedIntents:v17 bundleURL:v22 documentTypes:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a1 = (id)[a1 initWithApplicationRecord:v4];
      uint64_t v7 = (uint64_t)a1;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F302A8]);
      v9 = [v4 localizedName];
      id v10 = [v4 bundleIdentifier];
      int v11 = [v4 teamIdentifier];
      v12 = [v4 URL];
      uint64_t v7 = [v8 initWithLocalizedName:v9 bundleIdentifier:v10 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:v11 supportedIntents:0 bundleURL:v12 documentTypes:0];
    }
  }

  return v7;
}

@end