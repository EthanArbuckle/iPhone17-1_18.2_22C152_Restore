@interface PSSpecifier
+ (PSSpecifier)specifierWithSpecifier:(id)a3;
+ (id)deleteButtonSpecifierWithName:(id)a3 target:(id)a4 action:(SEL)a5;
+ (id)emptyGroupSpecifier;
+ (id)groupSpecifierWithID:(id)a3;
+ (id)groupSpecifierWithID:(id)a3 name:(id)a4;
+ (id)groupSpecifierWithName:(id)a3;
+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
+ (int64_t)autoCapsTypeForString:(id)a3;
+ (int64_t)autoCorrectionTypeForNumber:(id)a3;
+ (int64_t)keyboardTypeForString:(id)a3;
- (BOOL)hasValidGetter;
- (BOOL)hasValidSetter;
- (BOOL)isEqualToSpecifier:(id)a3;
- (BOOL)showContentString;
- (Class)detailControllerClass;
- (Class)editPaneClass;
- (NSArray)values;
- (NSDictionary)shortTitleDictionary;
- (NSDictionary)titleDictionary;
- (NSString)identifier;
- (NSString)name;
- (PSSpecifier)init;
- (PSSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9;
- (SEL)buttonAction;
- (SEL)confirmationAction;
- (SEL)confirmationAlternateAction;
- (SEL)confirmationCancelAction;
- (SEL)controllerLoadAction;
- (SEL)legacyAction;
- (SEL)legacyCancel;
- (id)description;
- (id)performGetter;
- (id)properties;
- (id)propertyForKey:(id)a3;
- (id)target;
- (id)userInfo;
- (id)weakUserInfo;
- (int64_t)cellType;
- (int64_t)titleCompare:(id)a3;
- (void)_addLinkSpec:(id)a3;
- (void)addFooterHyperlinkWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5;
- (void)addFooterHyperlinkWithRange:(_NSRange)a3 url:(id)a4;
- (void)identifier;
- (void)loadValuesAndTitlesFromDataSource;
- (void)performButtonAction;
- (void)performConfirmationAction;
- (void)performConfirmationAlternateAction;
- (void)performConfirmationCancelAction;
- (void)performControllerLoadAction;
- (void)performLegacyAction;
- (void)performSetterWithValue:(id)a3;
- (void)removePropertyForKey:(id)a3;
- (void)setButtonAction:(SEL)a3;
- (void)setCellType:(int64_t)a3;
- (void)setConfirmationAction:(SEL)a3;
- (void)setConfirmationAlternateAction:(SEL)a3;
- (void)setConfirmationCancelAction:(SEL)a3;
- (void)setControllerLoadAction:(SEL)a3;
- (void)setDetailControllerClass:(Class)a3;
- (void)setEditPaneClass:(Class)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyboardType:(int64_t)a3 autoCaps:(int64_t)a4 autoCorrection:(int64_t)a5;
- (void)setLegacyAction:(SEL)a3;
- (void)setLegacyCancel:(SEL)a3;
- (void)setName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setShortTitleDictionary:(id)a3;
- (void)setShowContentString:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setTitleDictionary:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setValues:(id)a3;
- (void)setValues:(id)a3 titles:(id)a4;
- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5;
- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5 usingLocalizedTitleSorting:(BOOL)a6;
- (void)setWeakUserInfo:(id)a3;
- (void)setupIconImageWithBundle:(id)a3;
- (void)setupIconImageWithPath:(id)a3;
@end

@implementation PSSpecifier

- (int64_t)cellType
{
  return self->cellType;
}

- (id)propertyForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_properties objectForKey:a3];
}

- (SEL)legacyAction
{
  return self->action;
}

+ (id)preferenceSpecifierNamed:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(PSSpecifier);
  [(PSSpecifier *)v16 setName:v15];

  objc_storeWeak(&v16->target, v14);
  v16->getter = a6;
  v16->setter = a5;
  v16->detailControllerClass = a7;
  v16->cellType = a8;
  v16->editPaneClass = a9;
  return v16;
}

- (void)setName:(id)a3
{
}

- (PSSpecifier)init
{
  gScale = (int)ScreenScale();
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifier;
  v3 = [(PSSpecifier *)&v7 init];
  if (v3)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v3->_properties;
    v3->_properties = v4;
  }
  return v3;
}

- (void)setupIconImageWithBundle:(id)a3
{
  id v23 = a3;
  v4 = [v23 resourcePath];
  [(PSSpecifier *)self setupIconImageWithPath:v4];

  v5 = [(NSMutableDictionary *)self->_properties objectForKey:@"iconImage"];

  v6 = v23;
  if (!v5)
  {
    objc_super v7 = [(NSMutableDictionary *)self->_properties objectForKey:@"icon"];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F42A80];
      v9 = [MEMORY[0x1E4F42D90] mainScreen];
      v10 = [v9 traitCollection];
      v11 = [v8 imageNamed:v7 inBundle:v23 compatibleWithTraitCollection:v10];

      if (v11) {
        goto LABEL_9;
      }
    }
    uint64_t v12 = [(NSMutableDictionary *)self->_properties objectForKey:@"icon2"];
    if (v12)
    {
      v13 = (void *)v12;
      id v14 = (void *)MEMORY[0x1E4F42A80];
      id v15 = [MEMORY[0x1E4F42D90] mainScreen];
      v16 = [v15 traitCollection];
      v11 = [v14 imageNamed:v13 inBundle:v23 compatibleWithTraitCollection:v16];

      if (v11) {
        goto LABEL_9;
      }
    }
    uint64_t v17 = [(NSMutableDictionary *)self->_properties objectForKey:@"tintedIcon"];
    if (v17)
    {
      v11 = (void *)v17;
      v18 = (void *)MEMORY[0x1E4F42A80];
      v19 = [MEMORY[0x1E4F42D90] mainScreen];
      v20 = [v19 traitCollection];
      v21 = [v18 imageNamed:v11 inBundle:v23 compatibleWithTraitCollection:v20];

      if (!v21)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v22 = SFTintedImageFromMask();

      v11 = (void *)v22;
      if (v22)
      {
LABEL_9:
        [(NSMutableDictionary *)self->_properties setObject:v11 forKey:@"iconImage"];
        goto LABEL_10;
      }
    }
LABEL_11:

    v6 = v23;
  }
}

- (void)setupIconImageWithPath:(id)a3
{
  id v7 = a3;
  v4 = [(NSMutableDictionary *)self->_properties objectForKey:@"icon"];
  v5 = _copyIconForPathFromSpecifier(v4, v7);

  if (v5
    || ([(NSMutableDictionary *)self->_properties objectForKey:@"icon2"],
        v6 = objc_claimAutoreleasedReturnValue(),
        _copyIconForPathFromSpecifier(v6, v7),
        v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    [(NSMutableDictionary *)self->_properties setObject:v5 forKey:@"iconImage"];
  }
}

- (void)setProperties:(id)a3
{
  self->_properties = (NSMutableDictionary *)[a3 mutableCopy];
  MEMORY[0x1F41817F8]();
}

- (void)setLegacyCancel:(SEL)a3
{
  self->cancel = a3;
}

- (void)setLegacyAction:(SEL)a3
{
  self->action = a3;
}

- (void)setControllerLoadAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_controllerLoadAction = v3;
}

- (void)setConfirmationCancelAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_confirmationCancelAction = v3;
}

- (void)setConfirmationAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_confirmationAction = v3;
}

- (void)setButtonAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_buttonAction = v3;
}

+ (int64_t)keyboardTypeForString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"numbers"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"phone"])
    {
      int64_t v5 = 5;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int64_t)autoCorrectionTypeForNumber:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 BOOLValue]) {
    return 2;
  }
  return 1;
}

+ (int64_t)autoCapsTypeForString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"sentences"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"words"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"all"])
    {
      int64_t v5 = 3;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)values
{
  return self->_values;
}

- (void)loadValuesAndTitlesFromDataSource
{
  if (!self->_values)
  {
    id v3 = [(PSSpecifier *)self propertyForKey:@"valuesDataSource"];
    if (v3)
    {
      id v14 = v3;
      NSSelectorFromString(v3);
      id WeakRetained = objc_loadWeakRetained(&self->target);
      int64_t v5 = SFPerformSelector();

      v6 = [(PSSpecifier *)self propertyForKey:@"titlesDataSource"];
      id v7 = v6;
      if (v6)
      {
        NSSelectorFromString(v6);
        id v8 = objc_loadWeakRetained(&self->target);
        v9 = SFPerformSelector();
      }
      else
      {
        v9 = 0;
      }
      v10 = [(PSSpecifier *)self propertyForKey:@"shortTitlesDataSource"];
      v11 = v10;
      if (v10)
      {
        NSSelectorFromString(v10);
        id v12 = objc_loadWeakRetained(&self->target);
        v13 = SFPerformSelector();
      }
      else
      {
        v13 = 0;
      }
      [(PSSpecifier *)self setValues:v5 titles:v9 shortTitles:v13];

      id v3 = v14;
    }
  }
}

- (SEL)controllerLoadAction
{
  if (self->_controllerLoadAction) {
    return self->_controllerLoadAction;
  }
  else {
    return 0;
  }
}

- (NSString)identifier
{
  id v3 = [(PSSpecifier *)self propertyForKey:@"id"];
  if (v3
    || ([(PSSpecifier *)self propertyForKey:@"label"],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(PSSpecifier *)self propertyForKey:@"key"],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(PSSpecifier *)self name], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = _PSLoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(PSSpecifier *)(uint64_t)v3 identifier];
      }
    }
  }
  return (NSString *)v3;
}

+ (id)groupSpecifierWithName:(id)a3
{
  return +[PSSpecifier preferenceSpecifierNamed:a3 target:0 set:0 get:0 detail:0 cell:0 edit:0];
}

+ (id)emptyGroupSpecifier
{
  return (id)[a1 groupSpecifierWithName:0];
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  if (a3) {
    [(NSMutableDictionary *)self->_properties setObject:a3 forKey:a4];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakUserInfo);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_shortTitleDict, 0);
  objc_storeStrong((id *)&self->_titleDict, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak(&self->target);
}

- (void)removePropertyForKey:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)showContentString
{
  return self->_showContentString;
}

+ (id)deleteButtonSpecifierWithName:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7 = a3;
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:a4 set:0 get:0 detail:0 cell:13 edit:0];
  [v8 setProperty:v7 forKey:@"id"];

  [v8 setProperty:objc_opt_class() forKey:@"cellClass"];
  [v8 setButtonAction:a5];
  return v8;
}

- (PSSpecifier)initWithName:(id)a3 target:(id)a4 set:(SEL)a5 get:(SEL)a6 detail:(Class)a7 cell:(int64_t)a8 edit:(Class)a9
{
  id v15 = a3;
  id v16 = a4;
  gScale = (int)ScreenScale();
  v21.receiver = self;
  v21.super_class = (Class)PSSpecifier;
  uint64_t v17 = [(PSSpecifier *)&v21 init];
  if (v17)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v17->_properties;
    v17->_properties = v18;

    [(PSSpecifier *)v17 setName:v15];
    objc_storeWeak(&v17->target, v16);
    v17->getter = a6;
    v17->setter = a5;
    v17->detailControllerClass = a7;
    v17->cellType = a8;
    v17->editPaneClass = a9;
  }

  return v17;
}

+ (id)groupSpecifierWithID:(id)a3
{
  return (id)[a1 groupSpecifierWithID:a3 name:0];
}

+ (id)groupSpecifierWithID:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = [a1 groupSpecifierWithName:a4];
  [v7 setIdentifier:v6];

  return v7;
}

+ (PSSpecifier)specifierWithSpecifier:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    v4 = objc_opt_new();
    int64_t v5 = [v3 name];
    [v4 setName:v5];

    id v6 = [v3 target];
    [v4 setTarget:v6];

    v4[3] = v3[3];
    objc_msgSend(v4, "setDetailControllerClass:", objc_msgSend(v3, "detailControllerClass"));
    objc_msgSend(v4, "setCellType:", objc_msgSend(v3, "cellType"));
    objc_msgSend(v4, "setEditPaneClass:", objc_msgSend(v3, "editPaneClass"));
    objc_msgSend(v4, "setLegacyAction:", objc_msgSend(v3, "legacyAction"));
    objc_msgSend(v4, "setLegacyCancel:", objc_msgSend(v3, "legacyCancel"));
    v4[9] = v3[9];
    v4[10] = v3[10];
    v4[11] = v3[11];
    v4[12] = v3[12];
    objc_msgSend(v4, "setConfirmationAction:", objc_msgSend(v3, "confirmationAction"));
    objc_msgSend(v4, "setConfirmationAlternateAction:", objc_msgSend(v3, "confirmationAlternateAction"));
    objc_msgSend(v4, "setConfirmationCancelAction:", objc_msgSend(v3, "confirmationCancelAction"));
    objc_msgSend(v4, "setShowContentString:", objc_msgSend(v3, "showContentString"));
    id v7 = [v3 titleDictionary];
    [v4 setTitleDictionary:v7];

    id v8 = [v3 shortTitleDictionary];
    [v4 setShortTitleDictionary:v8];

    v9 = [v3 values];
    [v4 setValues:v9];

    v10 = [v3 userInfo];
    [v4 setUserInfo:v10];

    v11 = [v3 properties];

    [v4 setProperties:v11];
  }
  else
  {
    v4 = 0;
  }
  return (PSSpecifier *)v4;
}

- (id)properties
{
  return self->_properties;
}

- (BOOL)hasValidSetter
{
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  if (WeakRetained && self->setter)
  {
    id v5 = objc_loadWeakRetained(p_target);
    char v6 = objc_opt_respondsToSelector();
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)performSetterWithValue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PSSpecifier *)self hasValidSetter])
  {
    id WeakRetained = objc_loadWeakRetained(&self->target);
    id v6 = (id)SFPerformSelector2();
  }
  else
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained(&self->target);
      Name = sel_getName(self->setter);
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      v13 = Name;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no setter, or does not respond to setter %s", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)hasValidGetter
{
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  if (WeakRetained && self->getter)
  {
    id v5 = objc_loadWeakRetained(p_target);
    char v6 = objc_opt_respondsToSelector();
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (id)performGetter
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(PSSpecifier *)self hasValidGetter])
  {
    id WeakRetained = objc_loadWeakRetained(&self->target);
    id v4 = SFPerformSelector();
  }
  else
  {
    id v5 = _PSLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained(&self->target);
      Name = sel_getName(self->getter);
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2080;
      __int16 v12 = Name;
      _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no getter, or does not respond to getter %s", (uint8_t *)&v9, 0x16u);
    }
    id v4 = 0;
  }
  return v4;
}

- (void)performLegacyAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->action)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v8 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  int v9 = _PSLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_loadWeakRetained(p_target);
    Name = sel_getName(self->action);
    *(_DWORD *)buf = 138412546;
    id v14 = v10;
    __int16 v15 = 2080;
    id v16 = Name;
    _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no action, or does not respond to action %s", buf, 0x16u);
  }
}

- (SEL)legacyCancel
{
  return self->cancel;
}

- (void)performControllerLoadAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->_controllerLoadAction)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v11 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(p_target);
    if (self->_controllerLoadAction) {
      controllerLoadAction = self->_controllerLoadAction;
    }
    else {
      controllerLoadAction = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2080;
    Name = sel_getName(controllerLoadAction);
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no controllerLoadAction, or does not respond to controllerLoadAction %s", buf, 0x16u);
  }
}

- (void)performButtonAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->_buttonAction)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v11 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(p_target);
    if (self->_buttonAction) {
      buttonAction = self->_buttonAction;
    }
    else {
      buttonAction = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2080;
    Name = sel_getName(buttonAction);
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no buttonAction, or does not respond to buttonAction %s", buf, 0x16u);
  }
}

- (void)performConfirmationAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->_confirmationAction)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v11 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(p_target);
    if (self->_confirmationAction) {
      confirmationAction = self->_confirmationAction;
    }
    else {
      confirmationAction = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2080;
    Name = sel_getName(confirmationAction);
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationAction, or does not respond to confirmationAction %s", buf, 0x16u);
  }
}

- (void)performConfirmationAlternateAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->_confirmationAlternateAction)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v11 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(p_target);
    if (self->_confirmationAlternateAction) {
      confirmationAlternateAction = self->_confirmationAlternateAction;
    }
    else {
      confirmationAlternateAction = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2080;
    Name = sel_getName(confirmationAlternateAction);
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationAltAction, or does not respond to confirmationAlternateAction %s", buf, 0x16u);
  }
}

- (void)performConfirmationCancelAction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_target = &self->target;
  id WeakRetained = objc_loadWeakRetained(&self->target);
  id v5 = WeakRetained;
  if (WeakRetained && self->_confirmationCancelAction)
  {
    id v6 = objc_loadWeakRetained(p_target);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = objc_loadWeakRetained(p_target);
      id v11 = (id)SFPerformSelector();

      return;
    }
  }
  else
  {
  }
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(p_target);
    if (self->_confirmationCancelAction) {
      confirmationCancelAction = self->_confirmationCancelAction;
    }
    else {
      confirmationCancelAction = 0;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2080;
    Name = sel_getName(confirmationCancelAction);
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "target %@ is nil, has no confirmationCancelAction, or does not respond to confirmationCancelAction %s", buf, 0x16u);
  }
}

- (void)setValues:(id)a3 titles:(id)a4
{
}

- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14 && v8)
  {
    -[PSSpecifier setValues:](self, "setValues:");
    char v10 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v8 forKeys:v14];
    [(PSSpecifier *)self setTitleDictionary:v10];
    if (v9)
    {
      shortTitleDict = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v9 forKeys:v14];
      [(PSSpecifier *)self setShortTitleDictionary:shortTitleDict];
    }
    else
    {
      shortTitleDict = self->_shortTitleDict;
      self->_shortTitleDict = 0;
    }
  }
  else
  {
    values = self->_values;
    self->_values = 0;

    titleDict = self->_titleDict;
    self->_titleDict = 0;

    char v10 = self->_shortTitleDict;
    self->_shortTitleDict = 0;
  }
}

- (void)setValues:(id)a3 titles:(id)a4 shortTitles:(id)a5 usingLocalizedTitleSorting:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  [(PSSpecifier *)self setValues:v10 titles:v11 shortTitles:a5];
  if (v6)
  {
    v25 = self;
    id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke;
    v30[3] = &unk_1E5C5FE40;
    id v13 = v12;
    id v31 = v13;
    id v14 = v10;
    id v32 = v14;
    [v11 enumerateObjectsUsingBlock:v30];
    [v13 sortUsingComparator:&__block_literal_global_25];
    __int16 v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v23 = [v22 objectAtIndexedSubscript:0];
          [v15 addObject:v23];

          v24 = [v22 objectAtIndexedSubscript:1];
          [v16 addObject:v24];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v19);
    }

    [(PSSpecifier *)v25 setValues:v16];
  }
}

void __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  char v7 = [v5 objectAtIndex:a3];
  v9[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v4 addObject:v8];
}

uint64_t __71__PSSpecifier_setValues_titles_shortTitles_usingLocalizedTitleSorting___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndexedSubscript:0];
  id v6 = [v4 objectAtIndexedSubscript:0];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)description
{
  name = (__CFString *)self->_name;
  if (!name) {
    name = &stru_1EFB51FD0;
  }
  id v4 = name;
  id v5 = [(PSSpecifier *)self identifier];
  if ([v5 length])
  {
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    id v8 = [(PSSpecifier *)self identifier];
    id v9 = [(PSSpecifier *)self target];
    uint64_t v10 = objc_opt_class();
    id v11 = [(PSSpecifier *)self target];
    id v12 = [v6 stringWithFormat:@"<%@ %p: ID %@, Name '%@' target <%@: %p>>", v7, self, v8, v4, v10, v11];
  }
  else
  {
    id v12 = v4;
  }
  if (self->cellType)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"G: %@ %p", v12, self];
  }
  id v14 = v13;

  return v14;
}

- (NSDictionary)shortTitleDictionary
{
  shortTitleDict = self->_shortTitleDict;
  if (!shortTitleDict) {
    shortTitleDict = self->_titleDict;
  }
  id v3 = shortTitleDict;
  return v3;
}

- (void)setKeyboardType:(int64_t)a3 autoCaps:(int64_t)a4 autoCorrection:(int64_t)a5
{
  self->keyboardType = a3;
  self->autoCapsType = a4;
  self->autoCorrectionType = a5;
  self->textFieldType = 0;
}

- (int64_t)titleCompare:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSpecifier *)self name];
  id v6 = [v4 name];

  int64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)isEqualToSpecifier:(id)a3
{
  id v4 = a3;
  if ([(PSSpecifier *)self isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    if (v6 == objc_opt_class())
    {
      if (self->_name) {
        name = (__CFString *)self->_name;
      }
      else {
        name = &stru_1EFB51FD0;
      }
      id v8 = [v4 name];
      if ([(__CFString *)name isEqualToString:v8])
      {
        uint64_t v9 = [(PSSpecifier *)self identifier];
        uint64_t v10 = (void *)v9;
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        else {
          id v11 = &stru_1EFB51FD0;
        }
        id v12 = [v4 identifier];
        if ([(__CFString *)v11 isEqualToString:v12]
          && self->getter == (SEL)*((void *)v4 + 2)
          && self->setter == (SEL)*((void *)v4 + 3)
          && (id v13 = [(PSSpecifier *)self legacyAction],
              v13 == (const char *)[v4 legacyAction])
          && (id v14 = [(PSSpecifier *)self legacyCancel],
              v14 == (const char *)[v4 legacyCancel])
          && self->detailControllerClass == (Class)*((void *)v4 + 6)
          && self->cellType == *((void *)v4 + 7)
          && self->editPaneClass == (Class)*((void *)v4 + 8)
          && (!self->_confirmationAction ? (SEL confirmationAction = 0) : (SEL confirmationAction = self->_confirmationAction),
              confirmationAction == (SEL)[v4 confirmationAction]
           && (!self->_confirmationAlternateAction
             ? (SEL confirmationAlternateAction = 0)
             : (SEL confirmationAlternateAction = self->_confirmationAlternateAction),
               confirmationAlternateAction == (SEL)[v4 confirmationAlternateAction]
            && (!self->_confirmationCancelAction
              ? (SEL confirmationCancelAction = 0)
              : (SEL confirmationCancelAction = self->_confirmationCancelAction),
                confirmationCancelAction == (SEL)[v4 confirmationCancelAction]
             && (!self->_controllerLoadAction
               ? (SEL controllerLoadAction = 0)
               : (SEL controllerLoadAction = self->_controllerLoadAction),
                 controllerLoadAction == (SEL)[v4 controllerLoadAction])))))
        {
          properties = self->_properties;
          objc_super v21 = [v4 properties];
          if ([(NSMutableDictionary *)properties isEqualToDictionary:v21])
          {
            values = self->_values;
            id v23 = [v4 values];
            if ([(NSArray *)values isEqualToArray:v23])
            {
              titleDict = self->_titleDict;
              v25 = [v4 titleDictionary];
              if ([(NSDictionary *)titleDict isEqualToDictionary:v25])
              {
                shortTitleDict = self->_shortTitleDict;
                long long v27 = [v4 shortTitleDictionary];
                if ([(NSDictionary *)shortTitleDict isEqualToDictionary:v27])
                {
                  id userInfo = self->_userInfo;
                  long long v29 = [v4 userInfo];
                  char v5 = [userInfo isEqual:v29];
                }
                else
                {
                  char v5 = 0;
                }
              }
              else
              {
                char v5 = 0;
              }
            }
            else
            {
              char v5 = 0;
            }
          }
          else
          {
            char v5 = 0;
          }
        }
        else
        {
          char v5 = 0;
        }
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (Class)detailControllerClass
{
  return self->detailControllerClass;
}

- (void)setDetailControllerClass:(Class)a3
{
  self->detailControllerClass = a3;
}

- (void)setCellType:(int64_t)a3
{
  self->cellType = a3;
}

- (Class)editPaneClass
{
  return self->editPaneClass;
}

- (void)setEditPaneClass:(Class)a3
{
  self->editPaneClass = a3;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)titleDictionary
{
  return self->_titleDict;
}

- (void)setTitleDictionary:(id)a3
{
}

- (void)setShortTitleDictionary:(id)a3
{
}

- (void)setValues:(id)a3
{
}

- (SEL)confirmationAction
{
  if (self->_confirmationAction) {
    return self->_confirmationAction;
  }
  else {
    return 0;
  }
}

- (SEL)confirmationAlternateAction
{
  if (self->_confirmationAlternateAction) {
    return self->_confirmationAlternateAction;
  }
  else {
    return 0;
  }
}

- (void)setConfirmationAlternateAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_SEL confirmationAlternateAction = v3;
}

- (SEL)confirmationCancelAction
{
  if (self->_confirmationCancelAction) {
    return self->_confirmationCancelAction;
  }
  else {
    return 0;
  }
}

- (SEL)buttonAction
{
  if (self->_buttonAction) {
    return self->_buttonAction;
  }
  else {
    return 0;
  }
}

- (id)weakUserInfo
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakUserInfo);
  return WeakRetained;
}

- (void)setWeakUserInfo:(id)a3
{
}

- (void)setShowContentString:(BOOL)a3
{
  self->_showContentString = a3;
}

- (void)addFooterHyperlinkWithRange:(_NSRange)a3 url:(id)a4
{
  +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:url:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:url:", a3.location, a3.length, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PSSpecifier *)self _addLinkSpec:v5];
}

- (void)addFooterHyperlinkWithRange:(_NSRange)a3 target:(id)a4 action:(SEL)a5
{
  +[PSFooterMultiHyperlinkViewLinkSpec specWithRange:target:action:](PSFooterMultiHyperlinkViewLinkSpec, "specWithRange:target:action:", a3.location, a3.length, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PSSpecifier *)self _addLinkSpec:v6];
}

- (void)_addLinkSpec:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PSSpecifier *)self propertyForKey:@"footerHyperlinkLinkSpecs"];
  if (v5)
  {
    id v6 = v5;
    int64_t v7 = [v5 arrayByAddingObject:v4];
  }
  else
  {
    v8[0] = v4;
    int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  [(PSSpecifier *)self setProperty:v7 forKey:@"footerHyperlinkLinkSpecs"];
}

- (void)identifier
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 target];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1A6597000, a3, OS_LOG_TYPE_ERROR, "ERROR: specifier has non-string identifier: %@, target: %@", (uint8_t *)&v6, 0x16u);
}

@end