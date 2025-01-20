@interface _REMChangeTrackingClientID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (NSString)clientName;
- (NSString)description;
- (_REMChangeTrackingClientID)initWithClientName:(id)a3 accountIdentifier:(id)a4;
- (_REMChangeTrackingClientID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _REMChangeTrackingClientID

- (_REMChangeTrackingClientID)initWithClientName:(id)a3 accountIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_REMChangeTrackingClientID;
  v9 = [(_REMChangeTrackingClientID *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientName, a3);
    objc_storeStrong((id *)&v10->_accountIdentifier, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_REMChangeTrackingClientID *)self clientName];
  [v4 encodeObject:v5 forKey:@"clientName"];

  id v6 = [(_REMChangeTrackingClientID *)self accountIdentifier];
  [v4 encodeObject:v6 forKey:@"accountIdentifier"];
}

- (_REMChangeTrackingClientID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(_REMChangeTrackingClientID *)self initWithClientName:v5 accountIdentifier:v6];
    id v8 = self;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_REMChangeTrackingClientID *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(_REMChangeTrackingClientID *)self clientName];
      uint64_t v8 = [(_REMChangeTrackingClientID *)v6 clientName];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(_REMChangeTrackingClientID *)self clientName];
        v11 = [(_REMChangeTrackingClientID *)v6 clientName];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(_REMChangeTrackingClientID *)self accountIdentifier];
      uint64_t v15 = [(_REMChangeTrackingClientID *)v6 accountIdentifier];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(_REMChangeTrackingClientID *)self accountIdentifier];
        v18 = [(_REMChangeTrackingClientID *)v6 accountIdentifier];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)_REMChangeTrackingClientID;
  v3 = [(_REMChangeTrackingClientID *)&v10 description];
  id v4 = NSString;
  v5 = [(_REMChangeTrackingClientID *)self clientName];
  id v6 = [(_REMChangeTrackingClientID *)self accountIdentifier];
  BOOL v7 = [v4 stringWithFormat:@" - {clientName: %@, accountIdentifier: %@};", v5, v6];
  uint64_t v8 = [v3 stringByAppendingString:v7];

  return (NSString *)v8;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

@end