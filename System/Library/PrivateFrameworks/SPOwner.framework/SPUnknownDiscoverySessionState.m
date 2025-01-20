@interface SPUnknownDiscoverySessionState
+ (BOOL)supportsSecureCoding;
- (NSSet)unknownAccessories;
- (SPUnknownDiscoverySessionState)initWithCoder:(id)a3;
- (SPUnknownDiscoverySessionState)initWithUnknownAccessories:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUnknownAccessories:(id)a3;
@end

@implementation SPUnknownDiscoverySessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUnknownDiscoverySessionState)initWithUnknownAccessories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUnknownDiscoverySessionState;
  v6 = [(SPUnknownDiscoverySessionState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_unknownAccessories, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPUnknownDiscoverySessionState alloc];
  id v5 = [(SPUnknownDiscoverySessionState *)self unknownAccessories];
  v6 = [(SPUnknownDiscoverySessionState *)v4 initWithUnknownAccessories:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SPUnknownDiscoverySessionState)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"unknownAccessories"];

  unknownAccessories = self->_unknownAccessories;
  self->_unknownAccessories = v8;

  return self;
}

- (NSSet)unknownAccessories
{
  return self->_unknownAccessories;
}

- (void)setUnknownAccessories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end