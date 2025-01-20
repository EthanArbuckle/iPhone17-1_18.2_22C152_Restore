@interface SPBeaconRole
+ (BOOL)supportsSecureCoding;
- (NSString)role;
- (NSString)roleEmoji;
- (SPBeaconRole)initWithCoder:(id)a3;
- (SPBeaconRole)initWithRoleId:(int64_t)a3 role:(id)a4 roleEmoji:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)roleId;
- (void)encodeWithCoder:(id)a3;
- (void)setRole:(id)a3;
- (void)setRoleEmoji:(id)a3;
- (void)setRoleId:(int64_t)a3;
@end

@implementation SPBeaconRole

- (SPBeaconRole)initWithRoleId:(int64_t)a3 role:(id)a4 roleEmoji:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPBeaconRole;
  v10 = [(SPBeaconRole *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SPBeaconRole *)v10 setRoleId:a3];
    [(SPBeaconRole *)v11 setRole:v8];
    [(SPBeaconRole *)v11 setRoleEmoji:v9];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconRole alloc];
  int64_t v5 = [(SPBeaconRole *)self roleId];
  v6 = [(SPBeaconRole *)self role];
  v7 = [(SPBeaconRole *)self roleEmoji];
  id v8 = [(SPBeaconRole *)v4 initWithRoleId:v5 role:v6 roleEmoji:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t roleId = self->_roleId;
  id v7 = a3;
  v6 = [v4 numberWithInteger:roleId];
  [v7 encodeObject:v6 forKey:@"roleId"];

  [v7 encodeObject:self->_role forKey:@"role"];
  [v7 encodeObject:self->_roleEmoji forKey:@"roleEmoji"];
}

- (SPBeaconRole)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleId"];
  self->_int64_t roleId = [v5 integerValue];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  role = self->_role;
  self->_role = v6;

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roleEmoji"];

  roleEmoji = self->_roleEmoji;
  self->_roleEmoji = v8;

  return self;
}

- (int64_t)roleId
{
  return self->_roleId;
}

- (void)setRoleId:(int64_t)a3
{
  self->_int64_t roleId = a3;
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (NSString)roleEmoji
{
  return self->_roleEmoji;
}

- (void)setRoleEmoji:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roleEmoji, 0);

  objc_storeStrong((id *)&self->_role, 0);
}

@end