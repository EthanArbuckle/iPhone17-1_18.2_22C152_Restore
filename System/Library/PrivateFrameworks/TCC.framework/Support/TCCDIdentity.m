@interface TCCDIdentity
- (NSString)identifier;
- (TCCDIdentity)initWithIdentifier:(id)a3 type:(int64_t)a4;
- (int64_t)identityType;
- (void)setIdentifier:(id)a3;
- (void)setIdentityType:(int64_t)a3;
@end

@implementation TCCDIdentity

- (TCCDIdentity)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCCDIdentity;
  v7 = [(TCCDIdentity *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(TCCDIdentity *)v7 setIdentifier:v6];
    [(TCCDIdentity *)v8 setIdentityType:a4];
  }

  return v8;
}

- (int64_t)identityType
{
  return self->_identityType;
}

- (void)setIdentityType:(int64_t)a3
{
  self->_identityType = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end