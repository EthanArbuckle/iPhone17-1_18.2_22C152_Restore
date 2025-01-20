@interface MOContact
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOContact)initWithCoder:(id)a3;
- (MOContact)initWithIdentifier:(id)a3 personId:(id)a4 displayName:(id)a5;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)personId;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContact

- (MOContact)initWithIdentifier:(id)a3 personId:(id)a4 displayName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MOContact;
  v12 = [(MOContact *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_personId, a4);
    objc_storeStrong((id *)&v13->_displayName, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MOContact *)self identifier];
  v5 = [v4 mask];
  v6 = [(MOContact *)self personId];
  v7 = [(MOContact *)self displayName];
  v8 = [v7 mask];
  id v9 = [v3 stringWithFormat:@"identifier, %@, personId, %@, name, %@", v5, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];

  v8 = [(MOContact *)self initWithIdentifier:v5 personId:v6 displayName:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_personId forKey:@"personId"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOContact *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(MOContact *)self identifier];
      v7 = [(MOContact *)v5 identifier];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(MOContact *)self personId];
        id v9 = [(MOContact *)v5 personId];
        if ([v8 isEqualToString:v9])
        {
          id v10 = [(MOContact *)self displayName];
          id v11 = [(MOContact *)v5 displayName];
          char v12 = [v10 isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_personId hash] ^ v3;
  return v4 ^ [(NSString *)self->_displayName hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personId
{
  return self->_personId;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end