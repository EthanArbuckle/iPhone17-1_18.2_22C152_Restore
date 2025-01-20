@interface NSPToken
+ (BOOL)supportsSecureCoding;
- (NSPToken)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPToken

- (id)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    sub_100048B88(v3, (uint64_t)[(NSMutableArray *)self->_tokens count], @"Token Count", 0, 14);
    sub_100048B88(v3, (uint64_t)[(NSMutableArray *)self->_salts count], @"Salt Count", 0, 14);
    sub_1000482D4(v3, self->_expirationDate, @"Expiration date", 0, 14);
    sub_1000482D4(v3, self->_pairedTokenAccount, @"Paired token account", 0, 14);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSPToken;
  v5 = [(NSPToken *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"tokenArray"];
    if (v6)
    {
      uint64_t v7 = +[NSMutableArray arrayWithArray:v6];
      tokens = v5->_tokens;
      v5->_tokens = (NSMutableArray *)v7;
    }
    v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"saltsArray"];
    if (v9)
    {
      uint64_t v10 = +[NSMutableArray arrayWithArray:v9];
      salts = v5->_salts;
      v5->_salts = (NSMutableArray *)v10;
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenExpirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedTokenAccount"];
    pairedTokenAccount = v5->_pairedTokenAccount;
    v5->_pairedTokenAccount = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_tokens forKey:@"tokenArray"];
    [v5 encodeObject:self->_salts forKey:@"saltsArray"];
    [v5 encodeObject:self->_expirationDate forKey:@"tokenExpirationDate"];
    pairedTokenAccount = self->_pairedTokenAccount;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"tokenArray"];
    [v5 encodeObject:0 forKey:@"saltsArray"];
    [v5 encodeObject:0 forKey:@"tokenExpirationDate"];
    pairedTokenAccount = 0;
  }
  [v5 encodeObject:pairedTokenAccount forKey:@"pairedTokenAccount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPToken allocWithZone:a3] init];
  id v5 = v4;
  if (self)
  {
    sub_10001424C((uint64_t)v4, self->_tokens);
    sub_100042FC0((uint64_t)v5, self->_salts);
    sub_10001088C((uint64_t)v5, self->_expirationDate);
    pairedTokenAccount = self->_pairedTokenAccount;
  }
  else
  {
    sub_10001424C((uint64_t)v4, 0);
    sub_100042FC0((uint64_t)v5, 0);
    sub_10001088C((uint64_t)v5, 0);
    pairedTokenAccount = 0;
  }
  sub_100022CA0((uint64_t)v5, pairedTokenAccount);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedTokenAccount, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_salts, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end