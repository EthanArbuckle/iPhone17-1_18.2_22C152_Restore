@interface UIApplicationShortcutItem
+ (unint64_t)_sbsActivationModeFromUIActivationMode:(unint64_t)a3;
+ (unint64_t)_uiActivationModeFromSBSActivationMode:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)userInfoData;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)type;
- (SBSApplicationShortcutItem)sbsShortcutItem;
- (UIApplicationShortcutIcon)icon;
- (UIApplicationShortcutItem)init;
- (UIApplicationShortcutItem)initWithSBSApplicationShortcutItem:(id)a3;
- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle;
- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle localizedSubtitle:(NSString *)localizedSubtitle icon:(UIApplicationShortcutIcon *)icon userInfo:(NSDictionary *)userInfo;
- (UIApplicationShortcutItem)initWithXPCDictionary:(id)a3;
- (id)_initWithType:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 icon:(id)a6 userInfoData:(id)a7 activationMode:(unint64_t)a8 targetContentIdentifier:(id)a9;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)targetContentIdentifier;
- (unint64_t)activationMode;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setUserInfoData:(id)a3;
@end

@implementation UIApplicationShortcutItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoData, 0);
  objc_storeStrong(&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (UIApplicationShortcutItem)initWithSBSApplicationShortcutItem:(id)a3
{
  id v4 = a3;
  v5 = [UIApplicationShortcutIcon alloc];
  v6 = [v4 icon];
  v7 = [(UIApplicationShortcutIcon *)v5 initWithSBSApplicationShortcutIcon:v6];

  uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_uiActivationModeFromSBSActivationMode:", objc_msgSend(v4, "activationMode"));
  v9 = [v4 type];
  v10 = [v4 localizedTitle];
  v11 = [v4 localizedSubtitle];
  v12 = [v4 userInfoData];
  v13 = [v4 targetContentIdentifier];

  v14 = [(UIApplicationShortcutItem *)self _initWithType:v9 localizedTitle:v10 localizedSubtitle:v11 icon:v7 userInfoData:v12 activationMode:v8 targetContentIdentifier:v13];
  return v14;
}

- (id)_initWithType:(id)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 icon:(id)a6 userInfoData:(id)a7 activationMode:(unint64_t)a8 targetContentIdentifier:(id)a9
{
  id v16 = a7;
  id v17 = a9;
  v18 = [(UIApplicationShortcutItem *)self initWithType:a3 localizedTitle:a4 localizedSubtitle:a5 icon:a6 userInfo:0];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userInfoData, a7);
    v19->_activationMode = a8;
    objc_storeStrong(&v19->_targetContentIdentifier, a9);
  }

  return v19;
}

+ (unint64_t)_uiActivationModeFromSBSActivationMode:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIApplicationShortcutItem *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(UIApplicationShortcutItem *)v5 type];
      if (v6 == self->_type)
      {
        int v8 = 1;
      }
      else
      {
        v7 = [(UIApplicationShortcutItem *)v5 type];
        int v8 = [v7 isEqualToString:self->_type];
      }
      v10 = [(UIApplicationShortcutItem *)v5 localizedTitle];
      if (v10 != self->_localizedTitle)
      {
        v11 = [(UIApplicationShortcutItem *)v5 localizedTitle];
        v8 &= [v11 isEqualToString:self->_localizedTitle];
      }
      v12 = [(UIApplicationShortcutItem *)v5 localizedSubtitle];
      if (v12 != self->_localizedSubtitle)
      {
        v13 = [(UIApplicationShortcutItem *)v5 localizedSubtitle];
        v8 &= [v13 isEqualToString:self->_localizedSubtitle];
      }
      v14 = [(UIApplicationShortcutItem *)v5 icon];
      if (v14 != self->_icon)
      {
        v15 = [(UIApplicationShortcutItem *)v5 icon];
        v8 &= [v15 isEqual:self->_icon];
      }
      id v16 = [(UIApplicationShortcutItem *)v5 userInfoData];
      if (v16 != self->_userInfoData)
      {
        id v17 = [(UIApplicationShortcutItem *)v5 userInfoData];
        v8 &= [v17 isEqual:self->_userInfoData];
      }
      if ([(UIApplicationShortcutItem *)v5 activationMode] == self->_activationMode) {
        BOOL v9 = v8;
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (SBSApplicationShortcutItem)sbsShortcutItem
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v3 = (void *)getSBSApplicationShortcutItemClass_softClass;
  uint64_t v18 = getSBSApplicationShortcutItemClass_softClass;
  if (!getSBSApplicationShortcutItemClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSBSApplicationShortcutItemClass_block_invoke;
    v14[3] = &unk_1E52D9900;
    v14[4] = &v15;
    __getSBSApplicationShortcutItemClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v15, 8);
  id v5 = objc_alloc_init(v4);
  v6 = [(UIApplicationShortcutItem *)self type];
  [v5 setType:v6];

  v7 = [(UIApplicationShortcutItem *)self localizedTitle];
  [v5 setLocalizedTitle:v7];

  int v8 = [(UIApplicationShortcutItem *)self localizedSubtitle];
  [v5 setLocalizedSubtitle:v8];

  BOOL v9 = [(UIApplicationShortcutItem *)self icon];
  v10 = [v9 sbsShortcutIcon];
  [v5 setIcon:v10];

  v11 = [(UIApplicationShortcutItem *)self userInfo];
  [v5 setUserInfo:v11];

  objc_msgSend(v5, "setActivationMode:", objc_msgSend((id)objc_opt_class(), "_sbsActivationModeFromUIActivationMode:", -[UIApplicationShortcutItem activationMode](self, "activationMode")));
  v12 = [(UIApplicationShortcutItem *)self targetContentIdentifier];
  [v5 setTargetContentIdentifier:v12];

  return (SBSApplicationShortcutItem *)v5;
}

- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle localizedSubtitle:(NSString *)localizedSubtitle icon:(UIApplicationShortcutIcon *)icon userInfo:(NSDictionary *)userInfo
{
  v12 = type;
  v13 = localizedTitle;
  v14 = localizedSubtitle;
  uint64_t v15 = icon;
  id v16 = userInfo;
  v25.receiver = self;
  v25.super_class = (Class)UIApplicationShortcutItem;
  uint64_t v17 = [(UIApplicationShortcutItem *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [(NSString *)v12 copy];
    v19 = v17->_type;
    v17->_type = (NSString *)v18;

    uint64_t v20 = [(NSString *)v13 copy];
    v21 = v17->_localizedTitle;
    v17->_localizedTitle = (NSString *)v20;

    uint64_t v22 = [(NSString *)v14 copy];
    v23 = v17->_localizedSubtitle;
    v17->_localizedSubtitle = (NSString *)v22;

    objc_storeStrong((id *)&v17->_icon, icon);
    [(UIApplicationShortcutItem *)v17 setUserInfo:v16];
  }

  return v17;
}

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
    int v8 = self->_userInfoData;
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
    BOOL v9 = self->_userInfoData;
    self->_userInfoData = 0;
  }
}

- (NSString)type
{
  return self->_type;
}

- (UIApplicationShortcutIcon)icon
{
  return self->_icon;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (unint64_t)activationMode
{
  return self->_activationMode;
}

- (NSDictionary)userInfo
{
  userInfoData = self->_userInfoData;
  if (userInfoData)
  {
    v3 = [MEMORY[0x1E4F28F98] propertyListWithData:userInfoData options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  v3 = 0;
LABEL_5:
  return (NSDictionary *)v3;
}

- (id)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

+ (unint64_t)_sbsActivationModeFromUIActivationMode:(unint64_t)a3
{
  return a3 == 1;
}

- (NSData)userInfoData
{
  return self->_userInfoData;
}

- (UIApplicationShortcutItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = [NSString stringWithUTF8String:"-[UIApplicationShortcutItem init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (UIApplicationShortcutItem)initWithType:(NSString *)type localizedTitle:(NSString *)localizedTitle
{
  return [(UIApplicationShortcutItem *)self initWithType:type localizedTitle:localizedTitle localizedSubtitle:0 icon:0 userInfo:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(UIApplicationShortcutItem *)[UIMutableApplicationShortcutItem alloc] _initWithType:self->_type localizedTitle:self->_localizedTitle localizedSubtitle:self->_localizedSubtitle icon:self->_icon userInfoData:self->_userInfoData activationMode:self->_activationMode targetContentIdentifier:self->_targetContentIdentifier];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  return [(NSString *)self->_localizedTitle hash] ^ v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; type: %@, title: %@>",
                       objc_opt_class(),
                       self,
                       self->_type,
                       self->_localizedTitle);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeDataToXPCDictionaryWithKey();
  xpc_dictionary_set_uint64(xdict, "activationMode", self->_activationMode);
  BSSerializeStringToXPCDictionaryWithKey();
}

- (UIApplicationShortcutItem)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = BSDeserializeStringFromXPCDictionaryWithKey();
  v6 = BSDeserializeStringFromXPCDictionaryWithKey();
  id v7 = BSDeserializeStringFromXPCDictionaryWithKey();
  int v8 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  v13 = BSDeserializeDataFromXPCDictionaryWithKey();
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "activationMode");
  id v15 = BSDeserializeStringFromXPCDictionaryWithKey();
  id v16 = [(UIApplicationShortcutItem *)self _initWithType:v5 localizedTitle:v6 localizedSubtitle:v7 icon:v12 userInfoData:v13 activationMode:uint64 targetContentIdentifier:v15];

  uint64_t v17 = (UIApplicationShortcutItem *)v16;
  return v17;
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

- (void)setUserInfoData:(id)a3
{
}

@end