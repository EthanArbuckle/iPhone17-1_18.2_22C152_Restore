@interface PRSRoleActivePosterObserverUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (NSString)description;
- (NSString)role;
- (PFServerPosterPath)activePath;
- (PRSRoleActivePosterObserverUpdate)initWithBSXPCCoder:(id)a3;
- (PRSRoleActivePosterObserverUpdate)initWithRole:(id)a3 activePath:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSRoleActivePosterObserverUpdate

- (PRSRoleActivePosterObserverUpdate)initWithRole:(id)a3 activePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSRoleActivePosterObserverUpdate;
  v8 = [(PRSRoleActivePosterObserverUpdate *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    role = v8->_role;
    v8->_role = (NSString *)v9;

    objc_storeStrong((id *)&v8->_activePath, a4);
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  activePath = self->_activePath;
  id v5 = a3;
  [v5 encodeObject:activePath forKey:@"p"];
  [v5 encodeObject:self->_role forKey:@"r"];
}

- (PRSRoleActivePosterObserverUpdate)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSRoleActivePosterObserverUpdate;
  id v5 = [(PRSRoleActivePosterObserverUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    role = v5->_role;
    v5->_role = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    activePath = v5->_activePath;
    v5->_activePath = (PFServerPosterPath *)v8;
  }
  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  role = self->_role;
  id v7 = [(PFServerPosterPath *)self->_activePath identity];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: role=(%@) activePath=(%@)>", v5, role, v7];

  return (NSString *)v8;
}

- (NSString)role
{
  return self->_role;
}

- (PFServerPosterPath)activePath
{
  return self->_activePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePath, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end