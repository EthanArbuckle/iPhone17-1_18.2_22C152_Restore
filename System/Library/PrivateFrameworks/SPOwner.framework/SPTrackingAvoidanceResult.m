@interface SPTrackingAvoidanceResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)policies;
- (NSUUID)identifier;
- (SPTrackingAvoidanceResult)initWithCoder:(id)a3;
- (SPTrackingAvoidanceResult)initWithIdentifier:(id)a3 type:(int64_t)a4 policies:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPolicies:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SPTrackingAvoidanceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPTrackingAvoidanceResult)initWithIdentifier:(id)a3 type:(int64_t)a4 policies:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPTrackingAvoidanceResult;
  v10 = [(SPTrackingAvoidanceResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(SPTrackingAvoidanceResult *)v10 setIdentifier:v8];
    [(SPTrackingAvoidanceResult *)v11 setType:a4];
    [(SPTrackingAvoidanceResult *)v11 setPolicies:v9];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPTrackingAvoidanceResult alloc];
  v5 = [(SPTrackingAvoidanceResult *)self identifier];
  int64_t v6 = [(SPTrackingAvoidanceResult *)self type];
  v7 = [(SPTrackingAvoidanceResult *)self policies];
  id v8 = [(SPTrackingAvoidanceResult *)v4 initWithIdentifier:v5 type:v6 policies:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPTrackingAvoidanceResult *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      int64_t v6 = [(SPTrackingAvoidanceResult *)v4 identifier];
      char v7 = [(NSUUID *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_policies forKey:@"policies"];
}

- (SPTrackingAvoidanceResult)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_type = [v4 decodeIntegerForKey:@"type"];
  char v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"policies"];

  policies = self->_policies;
  self->_policies = v10;

  return self;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 5) {
    v3 = 0;
  }
  else {
    v3 = off_1E601BAB8[type];
  }
  id v4 = (void *)[[NSString alloc] initWithFormat:@"Result: %@ %@", self->_identifier, v3];

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSArray)policies
{
  return self->_policies;
}

- (void)setPolicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end