@interface WBSWebExtensionCommandShortcutConflict
- (NSString)extensionDisplayName;
- (NSString)extensionDisplayShortName;
- (NSString)shortcut;
- (WBSWebExtensionCommandShortcutConflict)initWithShortcut:(id)a3 extensionDisplayName:(id)a4 extensionDisplayShortName:(id)a5;
- (id)description;
@end

@implementation WBSWebExtensionCommandShortcutConflict

- (WBSWebExtensionCommandShortcutConflict)initWithShortcut:(id)a3 extensionDisplayName:(id)a4 extensionDisplayShortName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSWebExtensionCommandShortcutConflict;
  v11 = [(WBSWebExtensionCommandShortcutConflict *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    shortcut = v11->_shortcut;
    v11->_shortcut = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    extensionDisplayName = v11->_extensionDisplayName;
    v11->_extensionDisplayName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    extensionDisplayShortName = v11->_extensionDisplayShortName;
    v11->_extensionDisplayShortName = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; shortcut = %@; extensionDisplayName = %@ extensionDisplayShortName = %@>",
               objc_opt_class(),
               self,
               self->_shortcut,
               self->_extensionDisplayName,
               self->_extensionDisplayShortName);
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (NSString)extensionDisplayShortName
{
  return self->_extensionDisplayShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionDisplayShortName, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
}

@end