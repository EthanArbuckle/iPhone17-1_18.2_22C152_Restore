@interface SFSuggestedUser
+ (BOOL)supportsSecureCoding;
+ (id)suggestedUserWithValue:(id)a3 type:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)value;
- (SFSuggestedUser)init;
- (SFSuggestedUser)initWithCoder:(id)a3;
- (SFSuggestedUser)initWithValue:(id)a3 type:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)type;
- (int64_t)usageFrequency;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUsageFrequency:(int64_t)a3;
@end

@implementation SFSuggestedUser

- (SFSuggestedUser)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)suggestedUserWithValue:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithValue:v6 type:a4];

  return v7;
}

- (SFSuggestedUser)initWithValue:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFSuggestedUser;
  v7 = [(SFSuggestedUser *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_type = a4;
    v10 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"suggestedUserValue"];
  [v5 encodeInt64:self->_type forKey:@"suggestedUserType"];
  [v5 encodeInt64:self->_usageFrequency forKey:@"suggestedUserUsageFrequency"];
}

- (SFSuggestedUser)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedUserValue"];
  unint64_t v6 = [v4 decodeInt64ForKey:@"suggestedUserType"];
  if (v6 >= 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  uint64_t v8 = [v4 decodeInt64ForKey:@"suggestedUserUsageFrequency"];

  v9 = [(SFSuggestedUser *)self initWithValue:v5 type:v7];
  v10 = v9;
  if (v9)
  {
    v9->_usageFrequency = v8;
    v11 = v9;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[SFSuggestedUser alloc] initWithValue:self->_value type:self->_type];
  *((void *)result + 3) = self->_usageFrequency;
  return result;
}

- (unint64_t)hash
{
  return [(NSString *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 value];
    value = self->_value;
    if (value == v5) {
      char v7 = 1;
    }
    else {
      char v7 = [(NSString *)value isEqualToString:v5];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 usageFrequency];
  int64_t usageFrequency = self->_usageFrequency;
  if (usageFrequency > v5) {
    goto LABEL_4;
  }
  if (usageFrequency < v5)
  {
LABEL_7:
    int64_t v10 = 1;
    goto LABEL_8;
  }
  NSUInteger v7 = [(NSString *)self->_value length];
  uint64_t v8 = [v4 value];
  unint64_t v9 = [v8 length];

  if (v7 >= v9)
  {
    if (v7 <= v9)
    {
      value = self->_value;
      v13 = [v4 value];
      int64_t v10 = [(NSString *)value compare:v13];

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  int64_t v10 = -1;
LABEL_8:

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  value = self->_value;
  unint64_t v6 = [NSNumber numberWithInteger:self->_type];
  NSUInteger v7 = [NSNumber numberWithInteger:self->_usageFrequency];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p: value=%@ type=%@; usageFrequency=%@>", v4, self, value, v6, v7];;

  return v8;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)usageFrequency
{
  return self->_usageFrequency;
}

- (void)setUsageFrequency:(int64_t)a3
{
  self->_int64_t usageFrequency = a3;
}

- (void).cxx_destruct
{
}

@end