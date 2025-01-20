@interface VSCredentialEntryField
- (BOOL)isRequired;
- (BOOL)isSecure;
- (NSString)identifier;
- (NSString)placeholder;
- (NSString)recentsMessage;
- (NSString)recentsTitle;
- (NSString)text;
- (NSString)title;
- (VSCredentialEntryField)init;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setRecentsMessage:(id)a3;
- (void)setRecentsTitle:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VSCredentialEntryField

- (VSCredentialEntryField)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSCredentialEntryField;
  v2 = [(VSCredentialEntryField *)&v10 init];
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_26F361E90;

    title = v3->_title;
    v3->_title = (NSString *)&stru_26F361E90;

    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v7;
  }
  return v3;
}

- (NSString)recentsTitle
{
  v2 = self->_recentsTitle;
  if (!v2) {
    v2 = &stru_26F361E90;
  }
  return (NSString *)v2;
}

- (NSString)recentsMessage
{
  v2 = self->_recentsMessage;
  if (!v2) {
    v2 = &stru_26F361E90;
  }
  return (NSString *)v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)isRequired
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void)setRecentsTitle:(id)a3
{
}

- (void)setRecentsMessage:(id)a3
{
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_recentsMessage, 0);
  objc_storeStrong((id *)&self->_recentsTitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end