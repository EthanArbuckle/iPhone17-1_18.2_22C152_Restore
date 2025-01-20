@interface REMStoreContainerToken
+ (BOOL)supportsSecureCoding;
- (NSUUID)identifier;
- (REMStoreContainerToken)initWithCoder:(id)a3;
- (REMStoreContainerToken)initWithIdentifier:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMStoreContainerToken

- (REMStoreContainerToken)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMStoreContainerToken;
  v6 = [(REMStoreContainerToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMStoreContainerToken *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@: %p identifier: %@>", v4, self, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStoreContainerToken *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (REMStoreContainerToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v6 = [(REMStoreContainerToken *)self initWithIdentifier:v5];
  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end