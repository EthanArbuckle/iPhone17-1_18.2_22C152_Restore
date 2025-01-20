@interface MCCSigningAndEncryptionMessagesStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)encryptMessagesIsEnabled;
- (BOOL)signMessagesIsEnabled;
- (MCCSigningAndEncryptionMessagesStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptMessagesIsEnabled:(BOOL)a3;
- (void)setSignMessagesIsEnabled:(BOOL)a3;
@end

@implementation MCCSigningAndEncryptionMessagesStatus

- (MCCSigningAndEncryptionMessagesStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MCCSigningAndEncryptionMessagesStatus *)self init];
  if (v5)
  {
    v5->_signMessagesIsEnabled = [v4 decodeBoolForKey:@"_signMessagesIsEnabled"];
    v5->_encryptMessagesIsEnabled = [v4 decodeBoolForKey:@"_encryptMessagesIsEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL signMessagesIsEnabled = self->_signMessagesIsEnabled;
  id v5 = a3;
  [v5 encodeBool:signMessagesIsEnabled forKey:@"_signMessagesIsEnabled"];
  [v5 encodeBool:self->_encryptMessagesIsEnabled forKey:@"_encryptMessagesIsEnabled"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_signMessagesIsEnabled;
  *((unsigned char *)result + 9) = self->_encryptMessagesIsEnabled;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)signMessagesIsEnabled
{
  return self->_signMessagesIsEnabled;
}

- (void)setSignMessagesIsEnabled:(BOOL)a3
{
  self->_BOOL signMessagesIsEnabled = a3;
}

- (BOOL)encryptMessagesIsEnabled
{
  return self->_encryptMessagesIsEnabled;
}

- (void)setEncryptMessagesIsEnabled:(BOOL)a3
{
  self->_encryptMessagesIsEnabled = a3;
}

@end