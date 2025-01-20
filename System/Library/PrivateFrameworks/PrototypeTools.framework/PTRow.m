@interface PTRow
+ (BOOL)supportsSecureCoding;
+ (id)row;
+ (id)rowWithTitle:(id)a3 valueGetter:(id)a4 valueSetter:(id)a5;
+ (id)rowWithTitle:(id)a3 valueKeyPath:(id)a4;
- (BOOL)isEncodable;
- (BOOL)isEqual:(id)a3;
- (NSPredicate)condition;
- (NSString)imageKeyPath;
- (NSString)staticTitle;
- (NSString)titleKeyPath;
- (NSString)valueKeyPath;
- (PTRow)init;
- (PTRow)initWithCoder:(id)a3;
- (PTRowAction)action;
- (PTSection)section;
- (PTSettings)settings;
- (UIImage)staticImage;
- (id)_defaultAction;
- (id)_validatedValue:(id)a3;
- (id)action:(id)a3;
- (id)childSettingsForKeyPath:(id)a3;
- (id)condition:(id)a3;
- (id)conditionFormat:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)externalCondition;
- (id)image;
- (id)imageKeyPath:(id)a3;
- (id)staticImage:(id)a3;
- (id)staticTitle:(id)a3;
- (id)title;
- (id)titleKeyPath:(id)a3;
- (id)unregisterBlock;
- (id)value;
- (id)valueFormatter;
- (id)valueFormatter:(id)a3;
- (id)valueGetter;
- (id)valueKeyPath:(id)a3;
- (id)valueSetter;
- (id)valueValidatator;
- (id)valueValidator:(id)a3;
- (unint64_t)hash;
- (void)_sendImageChanged;
- (void)_sendRowDidReload;
- (void)_sendTitleChanged;
- (void)_sendValueChanged;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAction:(id)a3;
- (void)setCondition:(id)a3;
- (void)setExternalCondition:(id)a3;
- (void)setImageKeyPath:(id)a3;
- (void)setIsEncodable:(BOOL)a3;
- (void)setSection:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStaticImage:(id)a3;
- (void)setStaticTitle:(id)a3;
- (void)setTitleKeyPath:(id)a3;
- (void)setUnregisterBlock:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueFormatter:(id)a3;
- (void)setValueGetter:(id)a3;
- (void)setValueKeyPath:(id)a3;
- (void)setValueSetter:(id)a3;
- (void)setValueValidatator:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation PTRow

+ (id)row
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (id)rowWithTitle:(id)a3 valueKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 row];
  v9 = [v8 staticTitle:v7];

  v10 = [v9 valueKeyPath:v6];

  return v10;
}

+ (id)rowWithTitle:(id)a3 valueGetter:(id)a4 valueSetter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 row];
  v12 = [v11 staticTitle:v10];

  [v12 setValueGetter:v9];
  [v12 setValueSetter:v8];

  return v12;
}

- (PTRow)init
{
  v6.receiver = self;
  v6.super_class = (Class)PTRow;
  id v2 = [(PTRow *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(PTSettings *)self->_settings removeKeyPathObserver:self];
  unregisterBlock = (void (**)(id, PTRow *))self->_unregisterBlock;
  if (unregisterBlock) {
    unregisterBlock[2](unregisterBlock, self);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTRow;
  [(PTRow *)&v4 dealloc];
}

- (id)valueKeyPath:(id)a3
{
  return self;
}

- (id)staticTitle:(id)a3
{
  return self;
}

- (id)titleKeyPath:(id)a3
{
  return self;
}

- (id)staticImage:(id)a3
{
  return self;
}

- (id)imageKeyPath:(id)a3
{
  return self;
}

- (id)action:(id)a3
{
  return self;
}

- (id)valueValidator:(id)a3
{
  return self;
}

- (id)valueFormatter:(id)a3
{
  return self;
}

- (id)condition:(id)a3
{
  return self;
}

- (id)conditionFormat:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:a3 arguments:&v6];
  [(PTRow *)self setCondition:v4];

  return self;
}

- (id)title
{
  staticTitle = self->_staticTitle;
  if (staticTitle || !self->_titleKeyPath)
  {
    uint64_t v3 = staticTitle;
  }
  else
  {
    -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)image
{
  staticImage = self->_staticImage;
  if (staticImage || !self->_imageKeyPath)
  {
    uint64_t v3 = staticImage;
  }
  else
  {
    -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
    uint64_t v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (PTRowAction)action
{
  action = self->_action;
  if (action)
  {
    uint64_t v3 = action;
  }
  else
  {
    uint64_t v3 = [(PTRow *)self _defaultAction];
  }
  return v3;
}

- (id)childSettingsForKeyPath:(id)a3
{
  settings = self->_settings;
  if (a3)
  {
    -[PTSettings valueForKeyPath:](settings, "valueForKeyPath:");
    objc_super v4 = (PTSettings *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v4 = settings;
  }
  return v4;
}

- (id)value
{
  if (self->_valueKeyPath)
  {
    uint64_t v3 = -[PTSettings valueForKeyPath:](self->_settings, "valueForKeyPath:");
LABEL_5:
    v5 = (void *)v3;
    goto LABEL_6;
  }
  valueGetter = (void (**)(id, SEL))self->_valueGetter;
  if (valueGetter)
  {
    uint64_t v3 = valueGetter[2](valueGetter, a2);
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:
  valueFormatter = (void (**)(id, void *, PTSettings *))self->_valueFormatter;
  if (valueFormatter)
  {
    valueFormatter[2](valueFormatter, v5, self->_settings);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  valueValidatator = (void (**)(void))self->_valueValidatator;
  id v8 = v4;
  if (valueValidatator) {
    valueValidatator[2]();
  }
  else {
  uint64_t v6 = [(PTRow *)self _validatedValue:v4];
  }
  if (self->_valueKeyPath)
  {
    -[PTSettings setValue:forKeyPath:](self->_settings, "setValue:forKeyPath:", v6);
  }
  else
  {
    valueSetter = (void (**)(id, void *))self->_valueSetter;
    if (valueSetter) {
      valueSetter[2](valueSetter, v6);
    }
  }
  if (([v6 isEqual:v8] & 1) == 0) {
    [(PTRow *)self _sendValueChanged];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)setSettings:(id)a3
{
  v5 = (PTSettings *)a3;
  settings = self->_settings;
  if (settings != v5)
  {
    id v7 = v5;
    [(PTSettings *)settings removeKeyPathObserver:self];
    objc_storeStrong((id *)&self->_settings, a3);
    settings = (PTSettings *)[(PTSettings *)self->_settings addKeyPathObserver:self];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](settings, v5);
}

- (id)_defaultAction
{
  return 0;
}

- (id)_validatedValue:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_settings == a3)
  {
    id v8 = v6;
    if ([v6 isEqualToString:self->_valueKeyPath])
    {
      id v6 = (id)[(PTRow *)self _sendValueChanged];
    }
    else if ([v8 isEqualToString:self->_titleKeyPath])
    {
      id v6 = (id)[(PTRow *)self _sendTitleChanged];
    }
    else
    {
      id v6 = (id)[v8 isEqualToString:self->_imageKeyPath];
      id v7 = v8;
      if (!v6) {
        goto LABEL_9;
      }
      id v6 = (id)[(PTRow *)self _sendImageChanged];
    }
    id v7 = v8;
  }
LABEL_9:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_sendValueChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 rowDidChangeValue:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendTitleChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 rowDidChangeTitle:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendImageChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 rowDidChangeImage:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendRowDidReload
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 rowDidReload:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PTRow *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if ([(PTRow *)v4 isMemberOfClass:objc_opt_class()] {
         && BSEqualStrings()
  }
         && BSEqualStrings()
         && BSEqualStrings()
         && BSEqualStrings()
         && BSEqualObjects())
  {
    char v5 = BSEqualObjects();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_valueKeyPath];
  id v5 = (id)[v3 appendString:self->_staticTitle];
  id v6 = (id)[v3 appendString:self->_titleKeyPath];
  id v7 = (id)[v3 appendString:self->_imageKeyPath];
  id v8 = (id)[v3 appendObject:self->_condition];
  id v9 = (id)[v3 appendObject:self->_action];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setValueKeyPath:self->_valueKeyPath];
  [v4 setStaticTitle:self->_staticTitle];
  [v4 setStaticImage:self->_staticImage];
  [v4 setTitleKeyPath:self->_titleKeyPath];
  [v4 setImageKeyPath:self->_imageKeyPath];
  [v4 setCondition:self->_condition];
  [v4 setAction:self->_action];
  [v4 setValueValidatator:self->_valueValidatator];
  [v4 setValueFormatter:self->_valueFormatter];
  [v4 setValueGetter:self->_valueGetter];
  [v4 setValueSetter:self->_valueSetter];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_valueKeyPath forKey:@"valueKeyPath"];
  [v10 encodeObject:self->_staticTitle forKey:@"staticTitle"];
  [v10 encodeObject:self->_titleKeyPath forKey:@"titleKeyPath"];
  [v10 encodeObject:self->_imageKeyPath forKey:@"imageKeyPath"];
  id v4 = [(NSPredicate *)self->_condition predicateFormat];
  char v5 = [v4 containsString:@"BLOCKPREDICATE"];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = [NSString stringWithFormat:@"*** The NSPredicate provided for -[PTRow condition] is a block based predicate, which cannot be encoded. ***"];
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  if (os_variant_allows_internal_security_policies()) {
    [v10 encodeObject:self->_condition forKey:@"condition"];
  }
  [v10 encodeObject:self->_action forKey:@"action"];
}

- (PTRow)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = (PTRow *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueKeyPath"];
    valueKeyPath = v5->_valueKeyPath;
    v5->_valueKeyPath = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticTitle"];
    staticTitle = v5->_staticTitle;
    v5->_staticTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKeyPath"];
    titleKeyPath = v5->_titleKeyPath;
    v5->_titleKeyPath = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageKeyPath"];
    imageKeyPath = v5->_imageKeyPath;
    v5->_imageKeyPath = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (PTRowAction *)v14;

    if (os_variant_allows_internal_security_policies())
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"condition"];
      condition = v5->_condition;
      v5->_condition = (NSPredicate *)v16;

      int v18 = PTValidatePredicate(v5->_condition);
      v19 = v5->_condition;
      if (v18)
      {
        [(NSPredicate *)v19 allowEvaluation];
      }
      else
      {
        v5->_condition = 0;
      }
    }
  }

  return v5;
}

- (BOOL)isEncodable
{
  if (self->_action)
  {
    id v3 = objc_opt_class();
    int IsWhitelistedForRemoteEditing = PTRowActionClassIsWhitelistedForRemoteEditing(v3);
    if (IsWhitelistedForRemoteEditing)
    {
      action = self->_action;
      LOBYTE(IsWhitelistedForRemoteEditing) = [(PTRowAction *)action isEncodable];
    }
  }
  else
  {
    LOBYTE(IsWhitelistedForRemoteEditing) = 1;
  }
  return IsWhitelistedForRemoteEditing;
}

- (NSString)valueKeyPath
{
  return self->_valueKeyPath;
}

- (void)setValueKeyPath:(id)a3
{
}

- (NSString)staticTitle
{
  return self->_staticTitle;
}

- (void)setStaticTitle:(id)a3
{
}

- (NSString)titleKeyPath
{
  return self->_titleKeyPath;
}

- (void)setTitleKeyPath:(id)a3
{
}

- (UIImage)staticImage
{
  return self->_staticImage;
}

- (void)setStaticImage:(id)a3
{
}

- (NSString)imageKeyPath
{
  return self->_imageKeyPath;
}

- (void)setImageKeyPath:(id)a3
{
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (void)setAction:(id)a3
{
}

- (id)valueValidatator
{
  return self->_valueValidatator;
}

- (void)setValueValidatator:(id)a3
{
}

- (id)valueFormatter
{
  return self->_valueFormatter;
}

- (void)setValueFormatter:(id)a3
{
}

- (id)valueGetter
{
  return self->_valueGetter;
}

- (void)setValueGetter:(id)a3
{
}

- (id)valueSetter
{
  return self->_valueSetter;
}

- (void)setValueSetter:(id)a3
{
}

- (id)externalCondition
{
  return self->_externalCondition;
}

- (void)setExternalCondition:(id)a3
{
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
}

- (PTSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  return (PTSection *)WeakRetained;
}

- (void)setSection:(id)a3
{
}

- (void)setIsEncodable:(BOOL)a3
{
  self->_isEncodable = a3;
}

- (PTSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_externalCondition, 0);
  objc_storeStrong(&self->_valueSetter, 0);
  objc_storeStrong(&self->_valueGetter, 0);
  objc_storeStrong(&self->_valueFormatter, 0);
  objc_storeStrong(&self->_valueValidatator, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_imageKeyPath, 0);
  objc_storeStrong((id *)&self->_staticImage, 0);
  objc_storeStrong((id *)&self->_titleKeyPath, 0);
  objc_storeStrong((id *)&self->_staticTitle, 0);
  objc_storeStrong((id *)&self->_valueKeyPath, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end