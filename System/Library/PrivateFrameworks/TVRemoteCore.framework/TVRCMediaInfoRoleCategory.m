@interface TVRCMediaInfoRoleCategory
+ (id)roleCategoryWithRoleDescription:(id)a3 roles:(id)a4;
- (NSArray)roles;
- (NSString)roleDescription;
- (TVRCMediaInfoRoleCategory)initWithRoleDescription:(id)a3 roles:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVRCMediaInfoRoleCategory

- (TVRCMediaInfoRoleCategory)initWithRoleDescription:(id)a3 roles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TVRCMediaInfoRoleCategory;
  v9 = [(TVRCMediaInfoRoleCategory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_roleDescription, a3);
    objc_storeStrong((id *)&v10->_roles, a4);
  }

  return v10;
}

+ (id)roleCategoryWithRoleDescription:(id)a3 roles:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRoleDescription:v7 roles:v6];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TVRCMediaInfoRoleCategory alloc];
  v5 = [(TVRCMediaInfoRoleCategory *)self roleDescription];
  id v6 = [(TVRCMediaInfoRoleCategory *)self roles];
  id v7 = [(TVRCMediaInfoRoleCategory *)v4 initWithRoleDescription:v5 roles:v6];

  return v7;
}

- (NSString)roleDescription
{
  return self->_roleDescription;
}

- (NSArray)roles
{
  return self->_roles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roles, 0);

  objc_storeStrong((id *)&self->_roleDescription, 0);
}

@end