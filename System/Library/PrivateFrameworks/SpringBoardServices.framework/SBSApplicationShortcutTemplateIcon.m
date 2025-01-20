@interface SBSApplicationShortcutTemplateIcon
- (BOOL)isEqual:(id)a3;
- (NSString)templateImageName;
- (SBSApplicationShortcutTemplateIcon)initWithTemplateImageName:(id)a3;
- (SBSApplicationShortcutTemplateIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutTemplateIcon

- (SBSApplicationShortcutTemplateIcon)initWithXPCDictionary:(id)a3
{
  if (a3)
  {
    v4 = BSDeserializeStringFromXPCDictionaryWithKey();
    self = [(SBSApplicationShortcutTemplateIcon *)self initWithTemplateImageName:v4];

    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBSApplicationShortcutTemplateIcon)initWithTemplateImageName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutTemplateIcon;
  v5 = [(SBSApplicationShortcutIcon *)&v9 _initForSubclass];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    templateImageName = v5->_templateImageName;
    v5->_templateImageName = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutTemplateIcon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    uint64_t v6 = [(SBSApplicationShortcutTemplateIcon *)self templateImageName];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__SBSApplicationShortcutTemplateIcon_isEqual___block_invoke;
    v10[3] = &unk_1E566CB30;
    v11 = v4;
    id v7 = (id)[v5 appendObject:v6 counterpart:v10];

    char v8 = [v5 isEqual];
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SBSApplicationShortcutTemplateIcon *)self templateImageName];
    BSSerializeStringToXPCDictionaryWithKey();
  }
}

- (NSString)templateImageName
{
  return self->_templateImageName;
}

- (void).cxx_destruct
{
}

uint64_t __46__SBSApplicationShortcutTemplateIcon_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) templateImageName];
}

- (id)_initForSubclass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithTemplateImageName:].", "-[SBSApplicationShortcutTemplateIcon _initForSubclass]", v6 format];

  return [(SBSApplicationShortcutTemplateIcon *)self initWithTemplateImageName:0];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  uint64_t v4 = [(SBSApplicationShortcutTemplateIcon *)self templateImageName];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

@end