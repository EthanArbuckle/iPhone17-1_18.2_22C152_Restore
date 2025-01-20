@interface SPAccessoryDiscoverySessionState
+ (BOOL)supportsSecureCoding;
- (NSSet)accessories;
- (SPAccessoryDiscoverySessionState)initWithAccessories:(id)a3;
- (SPAccessoryDiscoverySessionState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessories:(id)a3;
@end

@implementation SPAccessoryDiscoverySessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAccessoryDiscoverySessionState)initWithAccessories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPAccessoryDiscoverySessionState;
  v6 = [(SPAccessoryDiscoverySessionState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessories, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPAccessoryDiscoverySessionState alloc];
  id v5 = [(SPAccessoryDiscoverySessionState *)self accessories];
  v6 = [(SPAccessoryDiscoverySessionState *)v4 initWithAccessories:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SPAccessoryDiscoverySessionState)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v7 = [v4 setWithArray:v6];
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"accessories"];

  accessories = self->_accessories;
  self->_accessories = v8;

  return self;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end