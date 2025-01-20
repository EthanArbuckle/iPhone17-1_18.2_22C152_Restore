@interface SBSApplicationShortcutIcon
- (SBSApplicationShortcutIcon)init;
- (SBSApplicationShortcutIcon)initWithXPCDictionary:(id)a3;
- (id)_initForSubclass;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation SBSApplicationShortcutIcon

- (id)_initForSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)SBSApplicationShortcutIcon;
  return [(SBSApplicationShortcutIcon *)&v3 init];
}

- (SBSApplicationShortcutIcon)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@ does not support initialization.", v6 format];

  return (SBSApplicationShortcutIcon *)[(SBSApplicationShortcutIcon *)self _initForSubclass];
}

- (SBSApplicationShortcutIcon)initWithXPCDictionary:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (SBSApplicationShortcutIcon *)[(SBSApplicationShortcutIcon *)self _initForSubclass];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end