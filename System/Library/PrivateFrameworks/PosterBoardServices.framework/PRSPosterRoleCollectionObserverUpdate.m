@interface PRSPosterRoleCollectionObserverUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (NSArray)posterCollection;
- (NSString)role;
- (PRSPosterRoleCollectionObserverUpdate)initWithBSXPCCoder:(id)a3;
- (PRSPosterRoleCollectionObserverUpdate)initWithRole:(id)a3 posterCollection:(id)a4;
- (id)description;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSPosterRoleCollectionObserverUpdate

- (PRSPosterRoleCollectionObserverUpdate)initWithRole:(id)a3 posterCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRSPosterRoleCollectionObserverUpdate;
  v8 = [(PRSPosterRoleCollectionObserverUpdate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    role = v8->_role;
    v8->_role = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    posterCollection = v8->_posterCollection;
    v8->_posterCollection = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  posterCollection = self->_posterCollection;
  id v5 = a3;
  [v5 encodeObject:posterCollection forKey:@"c"];
  [v5 encodeObject:self->_role forKey:@"r"];
}

- (PRSPosterRoleCollectionObserverUpdate)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterRoleCollectionObserverUpdate;
  id v5 = [(PRSPosterRoleCollectionObserverUpdate *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    role = v5->_role;
    v5->_role = (NSString *)v6;

    v8 = self;
    uint64_t v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"c"];
    posterCollection = v5->_posterCollection;
    v5->_posterCollection = (NSArray *)v9;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  role = self->_role;
  id v7 = [(NSArray *)self->_posterCollection bs_mapNoNulls:&__block_literal_global];
  v8 = [v3 stringWithFormat:@"<%@: role=(%@) postersCollection=(%@)>", v5, role, v7];

  return v8;
}

uint64_t __52__PRSPosterRoleCollectionObserverUpdate_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identity];
}

- (NSString)role
{
  return self->_role;
}

- (NSArray)posterCollection
{
  return self->_posterCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterCollection, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end