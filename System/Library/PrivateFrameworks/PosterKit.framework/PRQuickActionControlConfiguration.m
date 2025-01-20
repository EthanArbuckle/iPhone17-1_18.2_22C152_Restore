@interface PRQuickActionControlConfiguration
+ (BOOL)supportsSecureCoding;
- (CHSControlIdentity)identity;
- (PRQuickActionControlConfiguration)initWithCategory:(int64_t)a3;
- (PRQuickActionControlConfiguration)initWithCoder:(id)a3;
- (PRQuickActionControlConfiguration)initWithControlIdentity:(id)a3 type:(unint64_t)a4;
- (int64_t)category;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRQuickActionControlConfiguration

- (PRQuickActionControlConfiguration)initWithCategory:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PRQuickActionControlConfiguration;
  v4 = [(PRQuickActionControlConfiguration *)&v8 init];
  v5 = v4;
  if (v4)
  {
    identity = v4->_identity;
    v4->_category = a3;
    v4->_identity = 0;

    v5->_type = 0;
  }
  return v5;
}

- (PRQuickActionControlConfiguration)initWithControlIdentity:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRQuickActionControlConfiguration;
  objc_super v8 = [(PRQuickActionControlConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_category = 3;
    objc_storeStrong((id *)&v8->_identity, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRQuickActionControlConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"category"];
  v6 = self;
  id v7 = [v4 decodeObjectOfClass:v6 forKey:@"identity"];

  uint64_t v8 = [v4 decodeIntegerForKey:@"type"];
  if (v5 == 3) {
    v9 = [(PRQuickActionControlConfiguration *)self initWithControlIdentity:v7 type:v8];
  }
  else {
    v9 = [(PRQuickActionControlConfiguration *)self initWithCategory:v5];
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[PRQuickActionControlConfiguration category](self, "category"), @"category");
  id v4 = [(PRQuickActionControlConfiguration *)self identity];
  [v5 encodeObject:v4 forKey:@"identity"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[PRQuickActionControlConfiguration type](self, "type"), @"type");
}

- (int64_t)category
{
  return self->_category;
}

- (CHSControlIdentity)identity
{
  return self->_identity;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end