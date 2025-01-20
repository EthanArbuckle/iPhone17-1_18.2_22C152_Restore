@interface SBSApplicationShortcutSystemPrivateIcon
- (BOOL)isEqual:(id)a3;
- (NSString)systemImageName;
- (SBSApplicationShortcutSystemPrivateIcon)initWithSystemImageName:(id)a3;
- (SBSApplicationShortcutSystemPrivateIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutSystemPrivateIcon

- (SBSApplicationShortcutSystemPrivateIcon)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    v4 = BSDeserializeStringFromXPCDictionaryWithKey();
    if (v4)
    {
      self = [(SBSApplicationShortcutSystemPrivateIcon *)self initWithSystemImageName:v4];
      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBSApplicationShortcutSystemPrivateIcon)initWithSystemImageName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutSystemPrivateIcon;
  v5 = [(SBSApplicationShortcutIcon *)&v9 _initForSubclass];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutSystemPrivateIcon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    uint64_t v6 = [(SBSApplicationShortcutSystemPrivateIcon *)self systemImageName];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SBSApplicationShortcutSystemPrivateIcon_isEqual___block_invoke;
    v10[3] = &unk_1E566CB30;
    v11 = v4;
    id v7 = (id)[v5 appendObject:v6 counterpart:v10];

    char v8 = [v5 isEqual];
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = [(SBSApplicationShortcutSystemPrivateIcon *)self systemImageName];
    if (v5) {
      BSSerializeStringToXPCDictionaryWithKey();
    }

    id v4 = v6;
  }
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
}

- (id)_initForSubclass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithSystemImageName:].", "-[SBSApplicationShortcutSystemPrivateIcon _initForSubclass]", v6 format];

  return [(SBSApplicationShortcutSystemPrivateIcon *)self initWithSystemImageName:&stru_1EDF30888];
}

uint64_t __51__SBSApplicationShortcutSystemPrivateIcon_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemImageName];
}

- (unint64_t)hash
{
  v2 = [(SBSApplicationShortcutSystemPrivateIcon *)self systemImageName];
  unint64_t v3 = [v2 hash];

  return v3;
}

@end