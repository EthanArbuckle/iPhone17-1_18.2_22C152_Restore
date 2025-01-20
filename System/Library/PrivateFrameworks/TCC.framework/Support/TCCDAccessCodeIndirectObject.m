@interface TCCDAccessCodeIndirectObject
- (TCCDAccessCodeIndirectObject)initWithCodeIdentity:(id)a3;
- (TCCDCodeIdentity)codeIdentity;
- (id)description;
- (void)setCodeIdentity:(id)a3;
@end

@implementation TCCDAccessCodeIndirectObject

- (TCCDAccessCodeIndirectObject)initWithCodeIdentity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TCCDAccessCodeIndirectObject;
  v5 = [(TCCDAccessIndirectObject *)&v8 initWithType:1];
  v6 = v5;
  if (v5) {
    [(TCCDAccessCodeIndirectObject *)v5 setCodeIdentity:v4];
  }

  return v6;
}

- (id)description
{
  v2 = [(TCCDAccessCodeIndirectObject *)self codeIdentity];
  v3 = [v2 description];

  return v3;
}

- (TCCDCodeIdentity)codeIdentity
{
  return (TCCDCodeIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCodeIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end