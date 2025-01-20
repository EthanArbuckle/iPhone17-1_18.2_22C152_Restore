@interface SBSApplicationShortcutSystemIcon
- (BOOL)isEqual:(id)a3;
- (NSString)systemImageName;
- (SBSApplicationShortcutSystemIcon)initWithSystemImageName:(id)a3;
- (SBSApplicationShortcutSystemIcon)initWithType:(int64_t)a3;
- (SBSApplicationShortcutSystemIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutSystemIcon

- (SBSApplicationShortcutSystemIcon)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = BSDeserializeStringFromXPCDictionaryWithKey();
    if (v5) {
      v6 = [(SBSApplicationShortcutSystemIcon *)self initWithSystemImageName:v5];
    }
    else {
      v6 = [(SBSApplicationShortcutSystemIcon *)self initWithType:xpc_dictionary_get_int64(v4, "systemIconType")];
    }
    self = v6;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBSApplicationShortcutSystemIcon)initWithSystemImageName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutSystemIcon;
  v5 = [(SBSApplicationShortcutIcon *)&v9 _initForSubclass];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v6;
  }
  return v5;
}

uint64_t __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemImageName];
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSApplicationShortcutSystemIcon *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:-[SBSApplicationShortcutSystemIcon type](self, "type")];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke;
    v18[3] = &unk_1E566CE78;
    v7 = v4;
    v19 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v18];

    objc_super v9 = [(SBSApplicationShortcutSystemIcon *)self systemImageName];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke_2;
    v16 = &unk_1E566CB30;
    v17 = v7;
    id v10 = (id)[v5 appendObject:v9 counterpart:&v13];

    char v11 = [v5 isEqual:v13 v14:v15 v16:v16];
  }

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    xpc_object_t xdict = v4;
    v5 = [(SBSApplicationShortcutSystemIcon *)self systemImageName];
    if (v5) {
      BSSerializeStringToXPCDictionaryWithKey();
    }
    else {
      xpc_dictionary_set_int64(xdict, "systemIconType", [(SBSApplicationShortcutSystemIcon *)self type]);
    }

    id v4 = xdict;
  }
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

uint64_t __44__SBSApplicationShortcutSystemIcon_isEqual___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v2 = [*(id *)(a1 + 32) type];
  return [v1 numberWithInteger:v2];
}

- (int64_t)type
{
  return self->_type;
}

- (SBSApplicationShortcutSystemIcon)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSApplicationShortcutSystemIcon;
  result = [(SBSApplicationShortcutIcon *)&v5 _initForSubclass];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)_initForSubclass
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%s is not a valid initializer. You must call -[%@ initWithType:].", "-[SBSApplicationShortcutSystemIcon _initForSubclass]", v6 format];

  return [(SBSApplicationShortcutSystemIcon *)self initWithSystemImageName:&stru_1EDF30888];
}

- (unint64_t)hash
{
  int64_t v3 = [(SBSApplicationShortcutSystemIcon *)self type];
  uint64_t v4 = [(SBSApplicationShortcutSystemIcon *)self systemImageName];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

@end