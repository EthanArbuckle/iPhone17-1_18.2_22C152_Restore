@interface _UIKeyShortcutHUDDismissalResponse
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage;
- (UIKeyCommand)keyCommand;
- (_UIKeyShortcutHUDDismissalResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyCommand:(id)a3;
- (void)setPasteAuthenticationMessage:(id)a3;
@end

@implementation _UIKeyShortcutHUDDismissalResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  keyCommand = self->_keyCommand;
  id v5 = a3;
  [v5 encodeObject:keyCommand forKey:@"keyCommand"];
  [v5 encodeObject:self->_pasteAuthenticationMessage forKey:@"pasteAuthenticationMessage"];
}

- (_UIKeyShortcutHUDDismissalResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (_UIKeyShortcutHUDDismissalResponse *)objc_opt_new();
  v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"keyCommand"];
  [(_UIKeyShortcutHUDDismissalResponse *)v5 setKeyCommand:v7];

  v8 = self;
  v9 = [v4 decodeObjectOfClass:v8 forKey:@"pasteAuthenticationMessage"];

  [(_UIKeyShortcutHUDDismissalResponse *)v5 setPasteAuthenticationMessage:v9];
  return v5;
}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setKeyCommand:(id)a3
{
}

- (BKSHIDEventAuthenticationMessage)pasteAuthenticationMessage
{
  return self->_pasteAuthenticationMessage;
}

- (void)setPasteAuthenticationMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_keyCommand, 0);
}

@end