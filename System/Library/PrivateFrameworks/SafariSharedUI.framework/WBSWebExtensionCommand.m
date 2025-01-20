@interface WBSWebExtensionCommand
- (NSString)commandDescription;
- (NSString)commandName;
- (NSString)extensionComposedIdentifier;
- (NSString)shortcut;
- (UIKeyCommand)keyCommand;
- (WBSWebExtensionCommand)initWithProperties:(id)a3 extensionComposedIdentifier:(id)a4 outErrorMessage:(id *)a5;
- (WBSWebExtensionCommand)initWithWebKitCommand:(id)a3;
- (WKWebExtensionCommand)webKitCommand;
- (id)debugDescription;
- (void)_parseShortcut:(id)a3;
@end

@implementation WBSWebExtensionCommand

- (WBSWebExtensionCommand)initWithProperties:(id)a3 extensionComposedIdentifier:(id)a4 outErrorMessage:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (WBSWebExtensionCommand *)42;
  __break(0xC471u);
  return result;
}

- (WBSWebExtensionCommand)initWithWebKitCommand:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSWebExtensionCommand;
  id v6 = [(WBSWebExtensionCommand *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webKitCommand, a3);
    uint64_t v8 = [v5 identifier];
    commandName = v7->_commandName;
    v7->_commandName = (NSString *)v8;

    uint64_t v10 = [v5 description];
    commandDescription = v7->_commandDescription;
    v7->_commandDescription = (NSString *)v10;

    if (objc_opt_respondsToSelector()) {
      [v5 _userVisibleShortcut];
    }
    else {
    uint64_t v12 = [v5 _shortcut];
    }
    shortcut = v7->_shortcut;
    v7->_shortcut = (NSString *)v12;

    v14 = v7;
  }

  return v7;
}

- (void)_parseShortcut:(id)a3
{
  id v3 = a3;
  __break(0xC471u);
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(WKWebExtensionCommand *)self->_webKitCommand debugDescription];
  id v6 = [v3 stringWithFormat:@"<%@: %p webKitCommand = %@>", v4, self, v5];;

  return v6;
}

- (UIKeyCommand)keyCommand
{
  return (UIKeyCommand *)[(WKWebExtensionCommand *)self->_webKitCommand keyCommand];
}

- (WKWebExtensionCommand)webKitCommand
{
  return self->_webKitCommand;
}

- (NSString)commandName
{
  return self->_commandName;
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (NSString)extensionComposedIdentifier
{
  return self->_extensionComposedIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionComposedIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandName, 0);
  objc_storeStrong((id *)&self->_webKitCommand, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_shortcutKey, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end