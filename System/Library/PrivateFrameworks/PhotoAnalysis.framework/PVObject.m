@interface PVObject
- (NSString)localIdentifier;
- (PVObject)initWithLocalIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation PVObject

- (void).cxx_destruct
{
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n%@ <%p>:\n", objc_opt_class(), self];
  [v3 appendFormat:@"  localIdentifier        : %@\n", self->_localIdentifier];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  localIdentifier = self->_localIdentifier;

  return (id)[v4 initWithLocalIdentifier:localIdentifier];
}

- (PVObject)initWithLocalIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PVObject;
  v5 = [(PVObject *)&v10 init];
  if (v5)
  {
    if ([(PVObject *)v5 isMemberOfClass:objc_opt_class()])
    {

      id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AbstractClass" reason:@"'PVObject' cannot be directly instantiated. Use a subclass." userInfo:0];
      objc_exception_throw(v9);
    }
    uint64_t v6 = [v4 copy];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;
  }
  return v5;
}

@end