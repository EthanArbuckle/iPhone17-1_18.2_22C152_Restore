@interface REMMembership
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObsolete;
- (NSDate)modifiedOn;
- (NSUUID)groupIdentifier;
- (NSUUID)memberIdentifier;
- (REMMembership)initWithCoder:(id)a3;
- (REMMembership)initWithMemberIdentifier:(id)a3 groupIdentifier:(id)a4 isObsolete:(BOOL)a5 modifiedOn:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMMembership

- (REMMembership)initWithMemberIdentifier:(id)a3 groupIdentifier:(id)a4 isObsolete:(BOOL)a5 modifiedOn:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)REMMembership;
  v14 = [(REMMembership *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_memberIdentifier, a3);
    objc_storeStrong((id *)&v15->_groupIdentifier, a4);
    v15->_isObsolete = a5;
    objc_storeStrong((id *)&v15->_modifiedOn, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMMembership *)self memberIdentifier];
  v6 = [(REMMembership *)self groupIdentifier];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[REMMembership isObsolete](self, "isObsolete"));
  v8 = [(REMMembership *)self modifiedOn];
  v9 = [v3 stringWithFormat:@"<%@: %p memberIdentifier: %@, groupIdentifier: %@, isObsolete: %@, modifiedOn: %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  v5 = [(REMMembership *)self memberIdentifier];
  uint64_t v6 = [v4 memberIdentifier];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [(REMMembership *)self memberIdentifier];
    v9 = [v4 memberIdentifier];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_11;
    }
  }
  id v11 = [(REMMembership *)self groupIdentifier];
  uint64_t v12 = [v4 groupIdentifier];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    id v13 = (void *)v12;
    v14 = [(REMMembership *)self groupIdentifier];
    v15 = [v4 groupIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_11;
    }
  }
  int v17 = [(REMMembership *)self isObsolete];
  if (v17 != [v4 isObsolete])
  {
LABEL_11:
    char v18 = 0;
    goto LABEL_12;
  }
  v20 = [(REMMembership *)self modifiedOn];
  uint64_t v21 = [v4 modifiedOn];
  if (v20 == (void *)v21)
  {
    char v18 = 1;
    v22 = v20;
  }
  else
  {
    v22 = (void *)v21;
    v23 = [(REMMembership *)self modifiedOn];
    v24 = [v4 modifiedOn];
    char v18 = [v23 isEqual:v24];
  }
LABEL_12:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(REMMembership *)self memberIdentifier];
  uint64_t v6 = [(REMMembership *)self groupIdentifier];
  BOOL v7 = [(REMMembership *)self isObsolete];
  v8 = [(REMMembership *)self modifiedOn];
  v9 = (void *)[v4 initWithMemberIdentifier:v5 groupIdentifier:v6 isObsolete:v7 modifiedOn:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMMembership)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memberIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isObsolete"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedOn"];

  v9 = [(REMMembership *)self initWithMemberIdentifier:v5 groupIdentifier:v6 isObsolete:v7 modifiedOn:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMMembership *)self memberIdentifier];
  [v4 encodeObject:v5 forKey:@"memberIdentifier"];

  uint64_t v6 = [(REMMembership *)self groupIdentifier];
  [v4 encodeObject:v6 forKey:@"groupIdentifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMMembership isObsolete](self, "isObsolete"), @"isObsolete");
  id v7 = [(REMMembership *)self modifiedOn];
  [v4 encodeObject:v7 forKey:@"modifiedOn"];
}

- (NSUUID)memberIdentifier
{
  return self->_memberIdentifier;
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isObsolete
{
  return self->_isObsolete;
}

- (NSDate)modifiedOn
{
  return self->_modifiedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedOn, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_memberIdentifier, 0);
}

@end