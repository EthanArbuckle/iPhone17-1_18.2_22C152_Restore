@interface REMTimestampedUUID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)modifiedOn;
- (NSUUID)identifier;
- (REMTimestampedUUID)initWithCoder:(id)a3;
- (REMTimestampedUUID)initWithIdentifier:(id)a3 modifiedOn:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMTimestampedUUID

- (REMTimestampedUUID)initWithIdentifier:(id)a3 modifiedOn:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTimestampedUUID;
  v9 = [(REMTimestampedUUID *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_modifiedOn, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMTimestampedUUID *)self identifier];
  v6 = [(REMTimestampedUUID *)self modifiedOn];
  id v7 = [v3 stringWithFormat:@"<%@: %p identifier: %@, modifiedOn: %@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  v5 = [(REMTimestampedUUID *)self identifier];
  uint64_t v6 = [v4 identifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMTimestampedUUID *)self identifier];
    v9 = [v4 identifier];
    int v10 = [v8 isEqual:v9];

    if (!v10)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  objc_super v12 = [(REMTimestampedUUID *)self modifiedOn];
  uint64_t v13 = [v4 modifiedOn];
  if (v12 == (void *)v13)
  {
    char v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    v15 = [(REMTimestampedUUID *)self modifiedOn];
    v16 = [v4 modifiedOn];
    char v11 = [v15 isEqual:v16];
  }
LABEL_10:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(REMTimestampedUUID *)self identifier];
  uint64_t v6 = [(REMTimestampedUUID *)self modifiedOn];
  id v7 = (void *)[v4 initWithIdentifier:v5 modifiedOn:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTimestampedUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedOn"];

  id v7 = [(REMTimestampedUUID *)self initWithIdentifier:v5 modifiedOn:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMTimestampedUUID *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(REMTimestampedUUID *)self modifiedOn];
  [v4 encodeObject:v6 forKey:@"modifiedOn"];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)modifiedOn
{
  return self->_modifiedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedOn, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end