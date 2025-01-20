@interface TPSpecificUser
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryAccount;
- (NSString)altDSID;
- (NSString)appleAccountID;
- (NSString)cloudkitContainerName;
- (NSString)octagonContextID;
- (NSString)personaUniqueString;
- (TPSpecificUser)initWithCloudkitContainerName:(id)a3 octagonContextID:(id)a4 appleAccountID:(id)a5 altDSID:(id)a6 isPrimaryPersona:(BOOL)a7 personaUniqueString:(id)a8;
- (TPSpecificUser)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)makeCKContainer;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSpecificUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_octagonContextID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleAccountID, 0);

  objc_storeStrong((id *)&self->_cloudkitContainerName, 0);
}

- (BOOL)isPrimaryAccount
{
  return self->_isPrimaryAccount;
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)octagonContextID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)appleAccountID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)cloudkitContainerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)makeCKContainer
{
  v3 = [(TPSpecificUser *)self cloudkitContainerName];
  v4 = +[CKContainer containerIDForContainerIdentifier:v3];

  id v5 = objc_alloc_init((Class)CKContainerOptions);
  [v5 setBypassPCSEncryption:1];
  if (![(TPSpecificUser *)self isPrimaryAccount])
  {
    id v6 = objc_alloc((Class)CKAccountOverrideInfo);
    v7 = [(TPSpecificUser *)self altDSID];
    id v8 = [v6 initWithAltDSID:v7];
    [v5 setAccountOverrideInfo:v8];
  }
  id v9 = [objc_alloc((Class)CKContainer) initWithContainerID:v4 options:v5];

  return v9;
}

- (unint64_t)hash
{
  v3 = [(TPSpecificUser *)self cloudkitContainerName];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(TPSpecificUser *)self octagonContextID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(TPSpecificUser *)self appleAccountID];
  unint64_t v8 = (unint64_t)[v7 hash];
  id v9 = [(TPSpecificUser *)self altDSID];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  v11 = [(TPSpecificUser *)self personaUniqueString];
  unint64_t v12 = v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[TPSpecificUser allocWithZone:a3];
  id v5 = [(TPSpecificUser *)self cloudkitContainerName];
  unint64_t v6 = [(TPSpecificUser *)self octagonContextID];
  v7 = [(TPSpecificUser *)self appleAccountID];
  unint64_t v8 = [(TPSpecificUser *)self altDSID];
  BOOL v9 = [(TPSpecificUser *)self isPrimaryAccount];
  unint64_t v10 = [(TPSpecificUser *)self personaUniqueString];
  v11 = [(TPSpecificUser *)v4 initWithCloudkitContainerName:v5 octagonContextID:v6 appleAccountID:v7 altDSID:v8 isPrimaryPersona:v9 personaUniqueString:v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(TPSpecificUser *)self cloudkitContainerName];
    v7 = [v5 cloudkitContainerName];
    if (![v6 isEqualToString:v7])
    {
      unsigned __int8 v14 = 0;
LABEL_23:

      goto LABEL_24;
    }
    unint64_t v8 = [(TPSpecificUser *)self octagonContextID];
    BOOL v9 = [v5 octagonContextID];
    if (![v8 isEqualToString:v9])
    {
      unsigned __int8 v14 = 0;
LABEL_22:

      goto LABEL_23;
    }
    unint64_t v10 = [(TPSpecificUser *)self appleAccountID];
    v11 = [v5 appleAccountID];
    if (![v10 isEqualToString:v11])
    {
      unsigned __int8 v14 = 0;
LABEL_21:

      goto LABEL_22;
    }
    unint64_t v12 = [(TPSpecificUser *)self altDSID];
    v23 = [v5 altDSID];
    if (!objc_msgSend(v12, "isEqualToString:"))
    {
      unsigned __int8 v14 = 0;
      goto LABEL_20;
    }
    v22 = v12;
    unsigned int v13 = [(TPSpecificUser *)self isPrimaryAccount];
    if (v13 != [v5 isPrimaryAccount])
    {
      unsigned __int8 v14 = 0;
      unint64_t v12 = v22;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v15 = [(TPSpecificUser *)self personaUniqueString];
    if (v15 || ([v5 personaUniqueString], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = [(TPSpecificUser *)self personaUniqueString];
      [v5 personaUniqueString];
      v16 = v21 = (void *)v15;
      unsigned __int8 v14 = [v20 isEqualToString:v16];

      v17 = v21;
      unint64_t v12 = v22;
      if (v21)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v19 = 0;
      unsigned __int8 v14 = 1;
      unint64_t v12 = v22;
    }
    v17 = (void *)v19;
    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_24:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSpecificUser *)self cloudkitContainerName];
  [v4 encodeObject:v5 forKey:@"cloudkit"];

  unint64_t v6 = [(TPSpecificUser *)self octagonContextID];
  [v4 encodeObject:v6 forKey:@"octagon"];

  v7 = [(TPSpecificUser *)self appleAccountID];
  [v4 encodeObject:v7 forKey:@"aaID"];

  unint64_t v8 = [(TPSpecificUser *)self altDSID];
  [v4 encodeObject:v8 forKey:@"altDSID"];

  [v4 encodeBool:-[TPSpecificUser isPrimaryAccount](self, "isPrimaryAccount") forKey:@"isPrimary"];
  id v9 = [(TPSpecificUser *)self personaUniqueString];
  [v4 encodeObject:v9 forKey:@"persona"];
}

- (TPSpecificUser)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSpecificUser;
  id v5 = [(TPSpecificUser *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudkit"];
    cloudkitContainerName = v5->_cloudkitContainerName;
    v5->_cloudkitContainerName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"octagon"];
    octagonContextID = v5->_octagonContextID;
    v5->_octagonContextID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aaID"];
    appleAccountID = v5->_appleAccountID;
    v5->_appleAccountID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v12;

    v5->_isPrimaryAccount = [v4 decodeBoolForKey:@"isPrimary"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persona"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = [(TPSpecificUser *)self altDSID];
  id v4 = [(TPSpecificUser *)self octagonContextID];
  id v5 = [(TPSpecificUser *)self cloudkitContainerName];
  uint64_t v6 = [(TPSpecificUser *)self personaUniqueString];
  if ([(TPSpecificUser *)self isPrimaryAccount]) {
    CFStringRef v7 = @"primary";
  }
  else {
    CFStringRef v7 = @"secondary";
  }
  uint64_t v8 = [(TPSpecificUser *)self appleAccountID];
  id v9 = +[NSString stringWithFormat:@"<TPSpecificUser: altDSID:%@ o:%@ ck:%@ p:%@/%@ aaID:%@>", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (TPSpecificUser)initWithCloudkitContainerName:(id)a3 octagonContextID:(id)a4 appleAccountID:(id)a5 altDSID:(id)a6 isPrimaryPersona:(BOOL)a7 personaUniqueString:(id)a8
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TPSpecificUser;
  uint64_t v19 = [(TPSpecificUser *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_cloudkitContainerName, a3);
    if (a7 || [v15 hasSuffix:v17])
    {
      v21 = (NSString *)v15;
    }
    else
    {
      v21 = +[NSString stringWithFormat:@"%@_%@", v15, v17];
    }
    octagonContextID = v20->_octagonContextID;
    v20->_octagonContextID = v21;

    objc_storeStrong((id *)&v20->_appleAccountID, a5);
    objc_storeStrong((id *)&v20->_altDSID, a6);
    v20->_isPrimaryAccount = a7;
    objc_storeStrong((id *)&v20->_personaUniqueString, a8);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end