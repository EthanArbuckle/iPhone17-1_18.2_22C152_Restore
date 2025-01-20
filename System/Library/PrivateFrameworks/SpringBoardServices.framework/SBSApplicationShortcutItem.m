@interface SBSApplicationShortcutItem
+ (id)_staticApplicationShortcutItemsFromInfoPlistEntry:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)userInfoData;
- (NSDictionary)userInfo;
- (NSString)bundleIdentifierToLaunch;
- (NSString)description;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)targetContentIdentifier;
- (NSString)type;
- (SBSApplicationShortcutIcon)icon;
- (SBSApplicationShortcutItem)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)activationMode;
- (unint64_t)hash;
- (void)_localizeWithHandler:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setActivationMode:(unint64_t)a3;
- (void)setBundleIdentifierToLaunch:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoData:(id)a3;
@end

@implementation SBSApplicationShortcutItem

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"userInfo is not an NSDictionary" userInfo:0];
      objc_exception_throw(v10);
    }
    userInfoData = self->_userInfoData;
    self->_userInfoData = 0;

    id v15 = 0;
    v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v15];
    id v7 = v15;
    v8 = self->_userInfoData;
    self->_userInfoData = v6;

    if (!self->_userInfoData)
    {
      v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3C8];
      v13 = [NSString stringWithFormat:@"unable to serialize userInfo: %@", v7];
      id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

      objc_exception_throw(v14);
    }
  }
  else
  {
    v9 = self->_userInfoData;
    self->_userInfoData = 0;
  }
}

- (SBSApplicationShortcutItem)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)SBSApplicationShortcutItem;
    v5 = [(SBSApplicationShortcutItem *)&v30 init];
    if (v5)
    {
      [@"type" UTF8String];
      v6 = BSDeserializeStringFromXPCDictionaryWithKey();
      uint64_t v7 = [v6 copy];
      type = v5->_type;
      v5->_type = (NSString *)v7;

      [@"title" UTF8String];
      v9 = BSDeserializeStringFromXPCDictionaryWithKey();
      uint64_t v10 = [v9 copy];
      localizedTitle = v5->_localizedTitle;
      v5->_localizedTitle = (NSString *)v10;

      [@"subtitle" UTF8String];
      uint64_t v12 = BSDeserializeStringFromXPCDictionaryWithKey();
      uint64_t v13 = [v12 copy];
      localizedSubtitle = v5->_localizedSubtitle;
      v5->_localizedSubtitle = (NSString *)v13;

      [@"icon" UTF8String];
      uint64_t v15 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      icon = v5->_icon;
      v5->_icon = (SBSApplicationShortcutIcon *)v15;

      v5->_activationMode = xpc_dictionary_get_int64(v4, (const char *)[@"activationMode" UTF8String]);
      [@"targetContentIdentifier" UTF8String];
      uint64_t v17 = BSDeserializeStringFromXPCDictionaryWithKey();
      targetContentIdentifier = v5->_targetContentIdentifier;
      v5->_targetContentIdentifier = (NSString *)v17;

      uint64_t v19 = xpc_dictionary_get_value(v4, (const char *)[@"userInfoData" UTF8String]);
      v20 = (void *)v19;
      if (v19 && MEMORY[0x192FC1100](v19) == MEMORY[0x1E4F14580])
      {
        v21 = (void *)MEMORY[0x1E4F1C9B8];
        bytes_ptr = xpc_data_get_bytes_ptr(v20);
        uint64_t v23 = [v21 dataWithBytes:bytes_ptr length:xpc_data_get_length(v20)];
        userInfoData = v5->_userInfoData;
        v5->_userInfoData = (NSData *)v23;
      }
      [@"bundleIdentifierToLaunch" UTF8String];
      v25 = BSDeserializeStringFromXPCDictionaryWithKey();
      uint64_t v26 = [v25 copy];
      bundleIdentifierToLaunch = v5->_bundleIdentifierToLaunch;
      v5->_bundleIdentifierToLaunch = (NSString *)v26;
    }
    self = v5;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (xdict)
  {
    [@"type" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
    [@"title" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
    [@"subtitle" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
    [@"icon" UTF8String];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    [@"targetContentIdentifier" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
    if ([(NSData *)self->_userInfoData length]) {
      xpc_dictionary_set_data(xdict, (const char *)[@"userInfoData" UTF8String], -[NSData bytes](self->_userInfoData, "bytes"), -[NSData length](self->_userInfoData, "length"));
    }
    xpc_dictionary_set_int64(xdict, (const char *)[@"activationMode" UTF8String], self->_activationMode);
    [@"bundleIdentifierToLaunch" UTF8String];
    BSSerializeStringToXPCDictionaryWithKey();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setType:self->_type];
  [v4 setLocalizedTitle:self->_localizedTitle];
  [v4 setLocalizedSubtitle:self->_localizedSubtitle];
  [v4 setIcon:self->_icon];
  [v4 setUserInfoData:self->_userInfoData];
  [v4 setActivationMode:self->_activationMode];
  [v4 setBundleIdentifierToLaunch:self->_bundleIdentifierToLaunch];
  [v4 setTargetContentIdentifier:self->_targetContentIdentifier];
  return v4;
}

- (void)setType:(id)a3
{
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (void)setActivationMode:(unint64_t)a3
{
  self->_activationMode = a3;
}

- (void)setUserInfoData:(id)a3
{
}

- (void)setBundleIdentifierToLaunch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierToLaunch, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SBSApplicationShortcutItem *)v5 type];
      if (v6 == self->_type)
      {
        int v8 = 1;
      }
      else
      {
        uint64_t v7 = [(SBSApplicationShortcutItem *)v5 type];
        int v8 = [v7 isEqualToString:self->_type];
      }
      v9 = [(SBSApplicationShortcutItem *)v5 localizedTitle];
      if (v9 != self->_localizedTitle)
      {
        uint64_t v10 = [(SBSApplicationShortcutItem *)v5 localizedTitle];
        v8 &= [v10 isEqualToString:self->_localizedTitle];
      }
      v11 = [(SBSApplicationShortcutItem *)v5 localizedSubtitle];
      if (v11 != self->_localizedSubtitle)
      {
        uint64_t v12 = [(SBSApplicationShortcutItem *)v5 localizedSubtitle];
        v8 &= [v12 isEqualToString:self->_localizedSubtitle];
      }
      uint64_t v13 = [(SBSApplicationShortcutItem *)v5 icon];
      if (v13 != self->_icon)
      {
        id v14 = [(SBSApplicationShortcutItem *)v5 icon];
        v8 &= [v14 isEqual:self->_icon];
      }
      uint64_t v15 = [(SBSApplicationShortcutItem *)v5 userInfoData];
      if (v15 != self->_userInfoData)
      {
        v16 = [(SBSApplicationShortcutItem *)v5 userInfoData];
        v8 &= [v16 isEqual:self->_userInfoData];
      }
      if ([(SBSApplicationShortcutItem *)v5 activationMode] != self->_activationMode) {
        int v8 = 0;
      }
      uint64_t v17 = [(SBSApplicationShortcutItem *)v5 bundleIdentifierToLaunch];
      if (v17 != self->_bundleIdentifierToLaunch)
      {
        v18 = [(SBSApplicationShortcutItem *)v5 bundleIdentifierToLaunch];
        v8 &= [v18 isEqualToString:self->_bundleIdentifierToLaunch];
      }
      uint64_t v19 = [(SBSApplicationShortcutItem *)v5 targetContentIdentifier];
      if (v19 != self->_targetContentIdentifier)
      {
        v20 = [(SBSApplicationShortcutItem *)v5 targetContentIdentifier];
        v8 &= [v20 isEqualToString:self->_targetContentIdentifier];
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (SBSApplicationShortcutIcon)icon
{
  return self->_icon;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)bundleIdentifierToLaunch
{
  return self->_bundleIdentifierToLaunch;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NSString *)self->_localizedTitle hash] ^ v3;
}

- (NSString)description
{
  NSUInteger v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_type withName:@"type"];
  [v3 appendString:self->_localizedTitle withName:@"localizedTitle"];
  [v3 appendString:self->_localizedSubtitle withName:@"localizedSubtitle"];
  [v3 appendString:self->_targetContentIdentifier withName:@"targetContentIdentifier"];
  id v4 = (id)[v3 appendObject:self->_icon withName:@"icon"];
  [v3 appendString:self->_bundleIdentifierToLaunch withName:@"bundleIdentifierToLaunch"];
  id v5 = (id)[v3 appendInt:LODWORD(self->_activationMode) withName:@"activationMode"];
  v6 = [(SBSApplicationShortcutItem *)self userInfoData];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__SBSApplicationShortcutItem_description__block_invoke;
  v11[3] = &unk_1E566B990;
  id v12 = v6;
  id v7 = v6;
  int v8 = __41__SBSApplicationShortcutItem_description__block_invoke((uint64_t)v11);
  [v3 appendDictionarySection:v8 withName:@"userInfoData" skipIfEmpty:1];

  v9 = [v3 build];

  return (NSString *)v9;
}

id __41__SBSApplicationShortcutItem_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = [MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:0];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v2;
}

- (NSDictionary)userInfo
{
  userInfoData = self->_userInfoData;
  if (userInfoData)
  {
    NSUInteger v3 = [MEMORY[0x1E4F28F98] propertyListWithData:userInfoData options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  NSUInteger v3 = 0;
LABEL_5:
  return (NSDictionary *)v3;
}

+ (id)_staticApplicationShortcutItemsFromInfoPlistEntry:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v23 = 0;
    goto LABEL_34;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v3;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v5)
  {
    v29 = 0;
    goto LABEL_33;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v34;
  id v27 = v4;
  v29 = 0;
  uint64_t v30 = *(void *)v34;
  do
  {
    uint64_t v8 = 0;
    uint64_t v28 = v6;
    do
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemType"];
        v11 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemTitle"];
        v32 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemSubtitle"];
        v31 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemIconType"];
        id v12 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemIconFile"];
        uint64_t v13 = [v9 bs_safeDictionaryForKey:@"UIApplicationShortcutItemUserInfo"];
        id v14 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemActivationMode"];
        uint64_t v15 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemTargetContentIdentifier"];
        v16 = [v9 bs_safeStringForKey:@"UIApplicationShortcutItemIconSymbolName"];
        if (v10 && v11)
        {
          uint64_t v17 = objc_alloc_init(SBSApplicationShortcutItem);
          [(SBSApplicationShortcutItem *)v17 setType:v10];
          [(SBSApplicationShortcutItem *)v17 setLocalizedTitle:v11];
          [(SBSApplicationShortcutItem *)v17 setLocalizedSubtitle:v32];
          if (v16)
          {
            v18 = [[SBSApplicationShortcutSystemIcon alloc] initWithSystemImageName:v16];
            goto LABEL_14;
          }
          if (v12)
          {
            v18 = [[SBSApplicationShortcutTemplateIcon alloc] initWithTemplateImageName:v12];
            goto LABEL_14;
          }
          if (v31)
          {
            uint64_t v21 = SBSApplicationShortcutSystemIconTypeForString(v31);
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v18 = [[SBSApplicationShortcutSystemIcon alloc] initWithType:v21];
LABEL_14:
              uint64_t v19 = v18;
              [(SBSApplicationShortcutItem *)v17 setIcon:v18];
            }
          }
          [(SBSApplicationShortcutItem *)v17 setUserInfo:v13];
          uint64_t v20 = SBSApplicationShortcutItemActivationModeForString(v14);
          if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
            [(SBSApplicationShortcutItem *)v17 setActivationMode:v20];
          }
          id v4 = v27;
          if (v15) {
            [(SBSApplicationShortcutItem *)v17 setTargetContentIdentifier:v15];
          }
          if (v29)
          {
            [v29 addObject:v17];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA48] arrayWithObject:v17];
          }

          uint64_t v6 = v28;
        }

        uint64_t v7 = v30;
      }
      ++v8;
    }
    while (v6 != v8);
    uint64_t v22 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v6 = v22;
  }
  while (v22);
LABEL_33:

  id v3 = v26;
  uint64_t v23 = v29;
LABEL_34:
  v24 = (void *)[v23 copy];

  return v24;
}

- (void)_localizeWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, id))a3;
    id v8 = [(SBSApplicationShortcutItem *)self localizedTitle];
    uint64_t v5 = [(SBSApplicationShortcutItem *)self localizedSubtitle];
    uint64_t v6 = v4[2](v4, v8);
    uint64_t v7 = v4[2](v4, v5);

    if (v6 && ([v6 isEqualToString:v8] & 1) == 0) {
      [(SBSApplicationShortcutItem *)self setLocalizedTitle:v6];
    }
    if (v7 && ([v7 isEqualToString:v5] & 1) == 0) {
      [(SBSApplicationShortcutItem *)self setLocalizedSubtitle:v7];
    }
  }
}

@end