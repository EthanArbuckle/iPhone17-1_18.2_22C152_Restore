@interface PDPrivacyKeyMonitorEntry
- (NSArray)existingKeys;
- (NSString)groupIdentifier;
- (NSString)publicKeyIdentifier;
- (double)timeout;
- (id)completion;
- (id)description;
- (void)setCompletion:(id)a3;
- (void)setExistingKeys:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation PDPrivacyKeyMonitorEntry

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: ", v4];

  if (self->_groupIdentifier) {
    [v5 appendFormat:@"groupIdentifier: '%@'; ", self->_groupIdentifier];
  }
  if (self->_publicKeyIdentifier) {
    [v5 appendFormat:@"publicKeyIdentifier: '%@'; ", self->_publicKeyIdentifier];
  }
  objc_msgSend(v5, "appendFormat:", @"timeout: '%lu'; ", (unint64_t)self->_timeout);
  [v5 appendFormat:@">"];
  v6 = +[NSString stringWithString:v5];

  return v6;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)existingKeys
{
  return self->_existingKeys;
}

- (void)setExistingKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingKeys, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end