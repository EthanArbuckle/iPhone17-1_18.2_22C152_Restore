@interface INUserActivityDescriptor(Shortcuts)
- (id)serializedRepresentation;
- (uint64_t)hashForSmartPromptPurposes;
- (uint64_t)initWithSerializedRepresentation:()Shortcuts;
- (uint64_t)isEqualForSmartPromptPurposes:()Shortcuts;
@end

@implementation INUserActivityDescriptor(Shortcuts)

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
      v16.super_class = (Class)&off_1F0CCB8D8;
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
        v10 = [a1 userActivityType];
        v11 = [v9 userActivityType];
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
  v6.super_class = (Class)&off_1F0CCB8D8;
  unint64_t v2 = (unint64_t)objc_msgSendSuper2(&v6, sel_hashForSmartPromptPurposes);
  v3 = [a1 userActivityType];
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

  v17 = [v4 objectForKey:@"UserActivityType"];
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

  uint64_t v20 = [a1 initWithUserActivityType:v19 localizedName:v7 bundleIdentifier:v10 extensionBundleIdentifier:v13 counterpartIdentifiers:0 teamIdentifier:v16 supportedIntents:0 bundleURL:0];
  return v20;
}

- (id)serializedRepresentation
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F0CCB8D8;
  unint64_t v2 = objc_msgSendSuper2(&v6, sel_serializedRepresentation);
  v3 = (void *)[v2 mutableCopy];

  id v4 = [a1 userActivityType];
  [v3 setValue:v4 forKey:@"UserActivityType"];

  return v3;
}

@end