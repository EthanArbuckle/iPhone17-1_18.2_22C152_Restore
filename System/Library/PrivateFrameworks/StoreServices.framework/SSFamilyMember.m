@interface SSFamilyMember
- (BOOL)askToBuy;
- (BOOL)isMe;
- (BOOL)isSharingPurchases;
- (NSNumber)iCloudIdentifier;
- (NSNumber)iTunesIdentifier;
- (NSString)description;
- (NSString)firstName;
- (NSString)iCloudAccountName;
- (NSString)lastName;
- (SSFamilyMember)initWithCacheRepresentation:(id)a3;
- (SSFamilyMember)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (id)newCacheRepresentation;
- (void)setFirstName:(id)a3;
- (void)setICloudAccountName:(id)a3;
- (void)setICloudIdentifier:(id)a3;
- (void)setITunesIdentifier:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMe:(BOOL)a3;
- (void)setSharingPurchases:(BOOL)a3;
@end

@implementation SSFamilyMember

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"[%@ %@ %@ me:%d ic:%@ it:%@ atb:%d]", self->_iCloudAccountName, self->_firstName, self->_lastName, self->_me, self->_iCloudIdentifier, self->_iTunesIdentifier, self->_askToBuy];
}

- (SSFamilyMember)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25.receiver = self;
    v25.super_class = (Class)SSFamilyMember;
    v5 = [(SSFamilyMember *)&v25 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"askToBuy"];
      if (objc_opt_respondsToSelector()) {
        v5->_askToBuy = [v6 BOOLValue];
      }
      v7 = [v4 objectForKey:@"firstName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v7 copy];
        firstName = v5->_firstName;
        v5->_firstName = (NSString *)v8;
      }
      v10 = [v4 objectForKey:@"iCloudName"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 copy];
        iCloudAccountName = v5->_iCloudAccountName;
        v5->_iCloudAccountName = (NSString *)v11;
      }
      v13 = [v4 objectForKey:@"lastName"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 copy];
        lastName = v5->_lastName;
        v5->_lastName = (NSString *)v14;
      }
      v16 = [v4 objectForKey:@"iCloudID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v17 = [v16 copy];
        iCloudIdentifier = v5->_iCloudIdentifier;
        v5->_iCloudIdentifier = (NSNumber *)v17;
      }
      v19 = [v4 objectForKey:@"iTunesID"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v19 copy];
        iTunesIdentifier = v5->_iTunesIdentifier;
        v5->_iTunesIdentifier = (NSNumber *)v20;
      }
      v22 = [v4 objectForKey:@"isMe"];

      if (objc_opt_respondsToSelector()) {
        v5->_me = [v22 BOOLValue];
      }
      v23 = [v4 objectForKey:@"sharing"];

      if (objc_opt_respondsToSelector()) {
        v5->_sharingPurchases = [v23 BOOLValue];
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)newCacheRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithBool:self->_askToBuy];
  [v3 setObject:v4 forKey:@"askToBuy"];

  firstName = self->_firstName;
  if (firstName) {
    [v3 setObject:firstName forKey:@"firstName"];
  }
  iCloudAccountName = self->_iCloudAccountName;
  if (iCloudAccountName) {
    [v3 setObject:iCloudAccountName forKey:@"iCloudName"];
  }
  iCloudIdentifier = self->_iCloudIdentifier;
  if (iCloudIdentifier) {
    [v3 setObject:iCloudIdentifier forKey:@"iCloudID"];
  }
  iTunesIdentifier = self->_iTunesIdentifier;
  if (iTunesIdentifier) {
    [v3 setObject:iTunesIdentifier forKey:@"iTunesID"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v3 setObject:lastName forKey:@"lastName"];
  }
  v10 = [NSNumber numberWithBool:self->_me];
  [v3 setObject:v10 forKey:@"isMe"];

  uint64_t v11 = [NSNumber numberWithBool:self->_sharingPurchases];
  [v3 setObject:v11 forKey:@"sharing"];

  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = [NSNumber numberWithBool:self->_askToBuy];
  SSXPCDictionarySetObject(v3, "0", v4);

  SSXPCDictionarySetObject(v3, "1", self->_firstName);
  SSXPCDictionarySetObject(v3, "2", self->_iCloudAccountName);
  SSXPCDictionarySetObject(v3, "3", self->_iCloudIdentifier);
  SSXPCDictionarySetObject(v3, "4", self->_iTunesIdentifier);
  SSXPCDictionarySetObject(v3, "5", self->_lastName);
  v5 = [NSNumber numberWithBool:self->_me];
  SSXPCDictionarySetObject(v3, "6", v5);

  v6 = [NSNumber numberWithBool:self->_sharingPurchases];
  SSXPCDictionarySetObject(v3, "7", v6);

  return v3;
}

- (SSFamilyMember)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v30.receiver = self;
    v30.super_class = (Class)SSFamilyMember;
    v6 = [(SSFamilyMember *)&v30 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      v10 = v9;
      if (v9) {
        v6->_askToBuy = [v9 BOOLValue];
      }
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      firstName = v6->_firstName;
      v6->_firstName = (NSString *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      iCloudAccountName = v6->_iCloudAccountName;
      v6->_iCloudAccountName = (NSString *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v17);
      iCloudIdentifier = v6->_iCloudIdentifier;
      v6->_iCloudIdentifier = (NSNumber *)v18;

      uint64_t v20 = objc_opt_class();
      uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v20);
      iTunesIdentifier = v6->_iTunesIdentifier;
      v6->_iTunesIdentifier = (NSNumber *)v21;

      uint64_t v23 = objc_opt_class();
      uint64_t v24 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v23);
      lastName = v6->_lastName;
      v6->_lastName = (NSString *)v24;

      uint64_t v26 = objc_opt_class();
      v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "6", v26);

      v6->_me = [v27 BOOLValue];
      uint64_t v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "7", v28);

      v6->_sharingPurchases = [v29 BOOLValue];
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)iCloudAccountName
{
  return self->_iCloudAccountName;
}

- (void)setICloudAccountName:(id)a3
{
}

- (NSNumber)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (void)setICloudIdentifier:(id)a3
{
}

- (NSNumber)iTunesIdentifier
{
  return self->_iTunesIdentifier;
}

- (void)setITunesIdentifier:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (BOOL)isMe
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (BOOL)isSharingPurchases
{
  return self->_sharingPurchases;
}

- (void)setSharingPurchases:(BOOL)a3
{
  self->_sharingPurchases = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iTunesIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudAccountName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end