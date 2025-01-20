@interface INAppIntentDescriptor(Shortcuts)
- (id)serializedRepresentation;
- (uint64_t)hashForSmartPromptPurposes;
- (uint64_t)initWithFullyQualifiedActionIdentifier:()Shortcuts;
- (uint64_t)initWithSerializedRepresentation:()Shortcuts;
- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts;
@end

@implementation INAppIntentDescriptor(Shortcuts)

- (id)serializedRepresentation
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F0CCBB78;
  v2 = objc_msgSendSuper2(&v6, sel_serializedRepresentation);
  v3 = (void *)[v2 mutableCopy];

  v4 = [a1 intentIdentifier];
  [v3 setValue:v4 forKey:@"AppIntentIdentifier"];

  return v3;
}

- (uint64_t)initWithFullyQualifiedActionIdentifier:()Shortcuts
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F223F8];
  objc_super v6 = [v4 bundleIdentifier];
  v7 = [v5 bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

  id v8 = v7;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [v8 containingBundleRecord];
    char v10 = 0;
    v11 = v8;
    if (!v9)
    {
LABEL_9:

      uint64_t v12 = 0;
      id v9 = 0;
      if (v10) {
        goto LABEL_10;
      }
LABEL_8:
      uint64_t v13 = [v11 bundleIdentifier];
      goto LABEL_11;
    }
  }
  else
  {

    id v9 = v8;
    v11 = 0;
    char v10 = 1;
    if (!v9) {
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v12 = [v9 bundleIdentifier];
  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_10:
  uint64_t v13 = 0;
LABEL_11:
  if (!(v12 | v13))
  {
    uint64_t v12 = [v4 bundleIdentifier];
  }
  v14 = [v4 actionIdentifier];
  v15 = [v9 localizedName];
  v16 = [v9 teamIdentifier];
  uint64_t v17 = [a1 initWithIntentIdentifier:v14 localizedName:v15 bundleIdentifier:v12 extensionBundleIdentifier:v13 counterpartIdentifiers:0 teamIdentifier:v16 supportedIntents:0 supportedEntities:0 bundleURL:0 documentTypes:0];

  return v17;
}

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
      v16.super_class = (Class)&off_1F0CCBB78;
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
        char v10 = [a1 intentIdentifier];
        v11 = [v9 intentIdentifier];
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
  v6.super_class = (Class)&off_1F0CCBB78;
  unint64_t v2 = (unint64_t)objc_msgSendSuper2(&v6, sel_hashForSmartPromptPurposes);
  v3 = [a1 intentIdentifier];
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

  uint64_t v17 = [v4 objectForKey:@"AppIntentIdentifier"];
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

  uint64_t v20 = [a1 initWithIntentIdentifier:v19 localizedName:v7 bundleIdentifier:v10 extensionBundleIdentifier:v13 counterpartIdentifiers:0 teamIdentifier:v16 supportedIntents:0 supportedEntities:0 bundleURL:0 documentTypes:0];
  return v20;
}

@end