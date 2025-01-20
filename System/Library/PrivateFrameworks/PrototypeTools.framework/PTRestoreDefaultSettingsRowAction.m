@interface PTRestoreDefaultSettingsRowAction
+ (BOOL)supportsSecureCoding;
+ (id)action;
+ (id)actionWithSettingsKeyPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)settingsKeyPath;
- (PTRestoreDefaultSettingsRowAction)initWithCoder:(id)a3;
- (id)defaultHandler;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PTRestoreDefaultSettingsRowAction

+ (id)action
{
  return (id)[a1 actionWithSettingsKeyPath:0];
}

+ (id)actionWithSettingsKeyPath:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (id)defaultHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PTRestoreDefaultSettingsRowAction_defaultHandler__block_invoke;
  v4[3] = &unk_1E63BC8A0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1C1899990](v4, a2);
  return v2;
}

BOOL __51__PTRestoreDefaultSettingsRowAction_defaultHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 childSettingsForKeyPath:*(void *)(*(void *)(a1 + 32) + 24)];
  id v3 = v2;
  if (v2) {
    [v2 restoreDefaultValues];
  }

  return v3 != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PTRestoreDefaultSettingsRowAction *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTRestoreDefaultSettingsRowAction;
    if ([(PTRowAction *)&v7 isEqual:v4]) {
      char v5 = BSEqualStrings();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PTRestoreDefaultSettingsRowAction_hash__block_invoke;
  v8[3] = &unk_1E63BC570;
  v8[4] = self;
  id v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v8, 0);
  id v5 = (id)[v3 appendString:self->_settingsKeyPath];
  unint64_t v6 = [v3 hash];

  return v6;
}

id __41__PTRestoreDefaultSettingsRowAction_hash__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  return objc_msgSendSuper2(&v2, sel_hash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  id v4 = a3;
  [(PTRowAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_settingsKeyPath, @"settingsKeyPath", v5.receiver, v5.super_class);
}

- (PTRestoreDefaultSettingsRowAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTRestoreDefaultSettingsRowAction;
  objc_super v5 = [(PTRowAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsKeyPath"];
    settingsKeyPath = v5->_settingsKeyPath;
    v5->_settingsKeyPath = (NSString *)v6;
  }
  return v5;
}

- (NSString)settingsKeyPath
{
  return self->_settingsKeyPath;
}

- (void).cxx_destruct
{
}

@end