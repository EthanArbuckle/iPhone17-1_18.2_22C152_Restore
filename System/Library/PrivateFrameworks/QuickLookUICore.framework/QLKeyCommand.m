@interface QLKeyCommand
+ (BOOL)supportsSecureCoding;
+ (id)keyCommandWithKeyCommand:(id)a3 identifier:(unint64_t)a4;
- (QLKeyCommand)initWithCoder:(id)a3;
- (UIKeyCommand)keyCommand;
- (unint64_t)keyCommandIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyCommand:(id)a3;
- (void)setKeyCommandIdentifier:(unint64_t)a3;
@end

@implementation QLKeyCommand

+ (id)keyCommandWithKeyCommand:(id)a3 identifier:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setKeyCommand:v5];

  [v6 setKeyCommandIdentifier:a4];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLKeyCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(QLKeyCommand *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyCommand"];
    keyCommand = v5->_keyCommand;
    v5->_keyCommand = (UIKeyCommand *)v6;

    v5->_keyCommandIdentifier = [v4 decodeIntegerForKey:@"keyCommandIdentifier"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  keyCommand = self->_keyCommand;
  id v5 = a3;
  [v5 encodeObject:keyCommand forKey:@"keyCommand"];
  [v5 encodeInteger:self->_keyCommandIdentifier forKey:@"keyCommandIdentifier"];
}

- (UIKeyCommand)keyCommand
{
  return self->_keyCommand;
}

- (void)setKeyCommand:(id)a3
{
}

- (unint64_t)keyCommandIdentifier
{
  return self->_keyCommandIdentifier;
}

- (void)setKeyCommandIdentifier:(unint64_t)a3
{
  self->_keyCommandIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end