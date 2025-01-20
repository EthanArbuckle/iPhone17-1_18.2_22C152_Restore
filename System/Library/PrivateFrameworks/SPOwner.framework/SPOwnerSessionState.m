@interface SPOwnerSessionState
+ (BOOL)supportsSecureCoding;
- (NSSet)disabledReasons;
- (NSString)ownerDataState;
- (NSString)serviceState;
- (SPOwnerSessionState)initWithCoder:(id)a3;
- (SPOwnerSessionState)initWithServiceState:(id)a3 disabledReasons:(id)a4 ownerDataState:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisabledReasons:(id)a3;
- (void)setOwnerDataState:(id)a3;
- (void)setServiceState:(id)a3;
@end

@implementation SPOwnerSessionState

- (SPOwnerSessionState)initWithServiceState:(id)a3 disabledReasons:(id)a4 ownerDataState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPOwnerSessionState;
  v11 = [(SPOwnerSessionState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SPOwnerSessionState *)v11 setServiceState:v8];
    [(SPOwnerSessionState *)v12 setDisabledReasons:v9];
    [(SPOwnerSessionState *)v12 setOwnerDataState:v10];
  }

  return v12;
}

- (SPOwnerSessionState)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceState"];
  serviceState = self->_serviceState;
  self->_serviceState = v5;

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = [v7 setWithArray:v8];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"disabledReasons"];
  disabledReasons = self->_disabledReasons;
  self->_disabledReasons = v10;

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerDataState"];

  ownerDataState = self->_ownerDataState;
  self->_ownerDataState = v12;

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SPOwnerSessionState alloc];
  serviceState = self->_serviceState;
  v6 = (void *)[(NSSet *)self->_disabledReasons copy];
  v7 = [(SPOwnerSessionState *)v4 initWithServiceState:serviceState disabledReasons:v6 ownerDataState:self->_ownerDataState];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPOwnerSessionState *)self serviceState];
  [v4 encodeObject:v5 forKey:@"serviceState"];

  v6 = [(SPOwnerSessionState *)self disabledReasons];
  [v4 encodeObject:v6 forKey:@"disabledReasons"];

  id v7 = [(SPOwnerSessionState *)self ownerDataState];
  [v4 encodeObject:v7 forKey:@"ownerDataState"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(SPOwnerSessionState *)self serviceState];
  v6 = [v5 description];
  id v7 = [(SPOwnerSessionState *)self disabledReasons];
  id v8 = [(SPOwnerSessionState *)self ownerDataState];
  id v9 = [v8 description];
  id v10 = [v3 stringWithFormat:@"<%@: %p serviceState: %@ disabledReasons: %@ ownerDataState: %@>", v4, self, v6, v7, v9];

  return v10;
}

- (NSString)serviceState
{
  return self->_serviceState;
}

- (void)setServiceState:(id)a3
{
}

- (NSSet)disabledReasons
{
  return self->_disabledReasons;
}

- (void)setDisabledReasons:(id)a3
{
}

- (NSString)ownerDataState
{
  return self->_ownerDataState;
}

- (void)setOwnerDataState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerDataState, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);

  objc_storeStrong((id *)&self->_serviceState, 0);
}

@end