@interface SPBeaconRoleCategory
+ (BOOL)supportsSecureCoding;
- (NSArray)roles;
- (NSString)category;
- (SPBeaconRoleCategory)initWithCategoryId:(int64_t)a3 category:(id)a4 roles:(id)a5;
- (SPBeaconRoleCategory)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)categoryId;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryId:(int64_t)a3;
- (void)setRoles:(id)a3;
@end

@implementation SPBeaconRoleCategory

- (SPBeaconRoleCategory)initWithCategoryId:(int64_t)a3 category:(id)a4 roles:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPBeaconRoleCategory;
  v10 = [(SPBeaconRoleCategory *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SPBeaconRoleCategory *)v10 setCategoryId:a3];
    [(SPBeaconRoleCategory *)v11 setCategory:v8];
    [(SPBeaconRoleCategory *)v11 setRoles:v9];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconRoleCategory alloc];
  int64_t v5 = [(SPBeaconRoleCategory *)self categoryId];
  v6 = [(SPBeaconRoleCategory *)self category];
  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v8 = [(SPBeaconRoleCategory *)self roles];
  id v9 = (void *)[v7 initWithArray:v8 copyItems:1];
  v10 = [(SPBeaconRoleCategory *)v4 initWithCategoryId:v5 category:v6 roles:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t categoryId = self->_categoryId;
  id v7 = a3;
  v6 = [v4 numberWithInteger:categoryId];
  [v7 encodeObject:v6 forKey:@"categoryId"];

  [v7 encodeObject:self->_category forKey:@"category"];
  [v7 encodeObject:self->_roles forKey:@"roles"];
}

- (SPBeaconRoleCategory)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryId"];
  self->_int64_t categoryId = [v5 integerValue];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
  category = self->_category;
  self->_category = v6;

  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"roles"];

  roles = self->_roles;
  self->_roles = v11;

  return self;
}

- (int64_t)categoryId
{
  return self->_categoryId;
}

- (void)setCategoryId:(int64_t)a3
{
  self->_int64_t categoryId = a3;
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (NSArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roles, 0);

  objc_storeStrong((id *)&self->_category, 0);
}

@end