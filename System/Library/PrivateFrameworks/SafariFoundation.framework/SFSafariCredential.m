@interface SFSafariCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultForAnAssociatedDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternal;
- (BOOL)isExternalPasskey;
- (NSDate)creationDate;
- (NSDate)lastUsedDate;
- (NSString)customTitle;
- (NSString)groupName;
- (NSString)oneTimeCode;
- (NSString)password;
- (NSString)site;
- (NSString)user;
- (SFSafariCredential)initWithCoder:(id)a3;
- (SFSafariCredential)initWithExternalCredential:(id)a3;
- (SFSafariCredential)initWithOneTimeCode:(id)a3;
- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6;
- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7;
- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7 groupName:(id)a8;
- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 groupName:(id)a7;
- (SFSafariPasswordCredential)externalCredential;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDefaultForAnAssociatedDomain:(BOOL)a3;
- (void)setLastUsedDate:(id)a3;
@end

@implementation SFSafariCredential

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SFSafariCredential;
  v14 = [(SFSafariCredential *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    user = v14->_user;
    v14->_user = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    password = v14->_password;
    v14->_password = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    site = v14->_site;
    v14->_site = (NSString *)v19;

    objc_storeStrong((id *)&v14->_creationDate, a6);
    v21 = v14;
  }

  return v14;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7
{
  id v12 = a7;
  id v13 = [(SFSafariCredential *)self initWithUser:a3 password:a4 site:a5 creationDate:a6];
  if (v13)
  {
    if ([v12 length])
    {
      uint64_t v14 = [v12 copy];
      customTitle = v13->_customTitle;
      v13->_customTitle = (NSString *)v14;
    }
    v16 = v13;
  }

  return v13;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 groupName:(id)a7
{
  id v12 = a7;
  id v13 = [(SFSafariCredential *)self initWithUser:a3 password:a4 site:a5 creationDate:a6];
  if (v13)
  {
    if ([v12 length])
    {
      uint64_t v14 = [v12 copy];
      groupName = v13->_groupName;
      v13->_groupName = (NSString *)v14;
    }
    v16 = v13;
  }

  return v13;
}

- (SFSafariCredential)initWithUser:(id)a3 password:(id)a4 site:(id)a5 creationDate:(id)a6 customTitle:(id)a7 groupName:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v16 = [(SFSafariCredential *)self initWithUser:a3 password:a4 site:a5 creationDate:a6];
  if (v16)
  {
    if ([v14 length])
    {
      uint64_t v17 = [v14 copy];
      customTitle = v16->_customTitle;
      v16->_customTitle = (NSString *)v17;
    }
    if ([v15 length])
    {
      uint64_t v19 = [v15 copy];
      groupName = v16->_groupName;
      v16->_groupName = (NSString *)v19;
    }
    v21 = v16;
  }

  return v16;
}

- (SFSafariCredential)initWithOneTimeCode:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSafariCredential;
  v5 = [(SFSafariCredential *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    oneTimeCode = v5->_oneTimeCode;
    v5->_oneTimeCode = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFSafariCredential)initWithExternalCredential:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFSafariCredential;
  uint64_t v6 = [(SFSafariCredential *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_externalCredential, a3);
    uint64_t v8 = [(SFSafariPasswordCredential *)v7->_externalCredential user];
    user = v7->_user;
    v7->_user = (NSString *)v8;

    uint64_t v10 = [(SFSafariPasswordCredential *)v7->_externalCredential password];
    id v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = &stru_26CA7A2D0;
    }
    objc_storeStrong((id *)&v7->_password, v12);

    uint64_t v13 = [(SFSafariPasswordCredential *)v7->_externalCredential site];
    site = v7->_site;
    v7->_site = (NSString *)v13;

    id v15 = [(SFSafariPasswordCredential *)v7->_externalCredential creationDate];
    v16 = v15;
    if (v15)
    {
      uint64_t v17 = v15;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263EFF910] distantPast];
    }
    creationDate = v7->_creationDate;
    v7->_creationDate = v17;

    objc_opt_class();
    v7->_isExternalPasskey = objc_opt_isKindOfClass() & 1;
    uint64_t v19 = v7;
  }

  return v7;
}

- (BOOL)isExternal
{
  return [(SFSafariPasswordCredential *)self->_externalCredential isExternal];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; site = %@; user = %@; date = %@",
               objc_opt_class(),
               self,
               self->_site,
               self->_user,
               self->_creationDate);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFSafariCredential *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      externalCredential = self->_externalCredential;
      if (externalCredential)
      {
        uint64_t v8 = [(SFSafariCredential *)v6 externalCredential];
        char v9 = [(SFSafariPasswordCredential *)externalCredential isEqual:v8];
      }
      else
      {
        user = self->_user;
        uint64_t v8 = [(SFSafariCredential *)v6 user];
        if ([(NSString *)user isEqual:v8])
        {
          password = self->_password;
          id v12 = [(SFSafariCredential *)v6 password];
          if ([(NSString *)password isEqual:v12])
          {
            site = self->_site;
            id v14 = [(SFSafariCredential *)v6 site];
            if ([(NSString *)site isEqual:v14])
            {
              creationDate = self->_creationDate;
              v16 = [(SFSafariCredential *)v6 creationDate];
              char v9 = [(NSDate *)creationDate isEqual:v16];
            }
            else
            {
              char v9 = 0;
            }
          }
          else
          {
            char v9 = 0;
          }
        }
        else
        {
          char v9 = 0;
        }
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  externalCredential = self->_externalCredential;
  if (externalCredential)
  {
    return [(SFSafariPasswordCredential *)externalCredential hash];
  }
  else
  {
    NSUInteger v5 = [(NSString *)self->_user hash];
    NSUInteger v6 = [(NSString *)self->_password hash] ^ v5;
    NSUInteger v7 = [(NSString *)self->_site hash];
    return v6 ^ v7 ^ [(NSDate *)self->_creationDate hash];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSafariCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  NSUInteger v6 = [v4 decodeObjectOfClasses:v5 forKey:@"externalCredential"];

  if (v6)
  {
    NSUInteger v7 = [(SFSafariCredential *)self initWithExternalCredential:v6];
  }
  else
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user"];
    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"password"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"site"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customTitle"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oneTimeCode"];
    if (v14) {
      id v15 = [(SFSafariCredential *)self initWithOneTimeCode:v14];
    }
    else {
      id v15 = [(SFSafariCredential *)self initWithUser:v8 password:v9 site:v10 creationDate:v11 customTitle:v12 groupName:v13];
    }
    NSUInteger v7 = v15;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  externalCredential = self->_externalCredential;
  if (externalCredential)
  {
    id v4 = a3;
    NSUInteger v5 = @"externalCredential";
    oneTimeCode = (NSString *)externalCredential;
  }
  else
  {
    user = self->_user;
    id v9 = a3;
    [v9 encodeObject:user forKey:@"user"];
    [v9 encodeObject:self->_password forKey:@"password"];
    [v9 encodeObject:self->_site forKey:@"site"];
    [v9 encodeObject:self->_creationDate forKey:@"date"];
    [v9 encodeObject:self->_customTitle forKey:@"customTitle"];
    [v9 encodeObject:self->_groupName forKey:@"groupName"];
    oneTimeCode = self->_oneTimeCode;
    NSUInteger v5 = @"oneTimeCode";
    id v4 = v9;
  }
  [v4 encodeObject:oneTimeCode forKey:v5];
}

- (NSString)user
{
  return self->_user;
}

- (NSString)password
{
  return self->_password;
}

- (NSString)site
{
  return self->_site;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (BOOL)isExternalPasskey
{
  return self->_isExternalPasskey;
}

- (NSString)oneTimeCode
{
  return self->_oneTimeCode;
}

- (SFSafariPasswordCredential)externalCredential
{
  return self->_externalCredential;
}

- (BOOL)isDefaultForAnAssociatedDomain
{
  return self->_isDefaultForAnAssociatedDomain;
}

- (void)setIsDefaultForAnAssociatedDomain:(BOOL)a3
{
  self->_isDefaultForAnAssociatedDomain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalCredential, 0);
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end