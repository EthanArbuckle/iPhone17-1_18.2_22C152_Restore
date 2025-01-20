@interface ICConnectionConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationFromSourceConfiguration:(id)a3 userIdentity:(id)a4;
- (BOOL)isEqual:(id)a3;
- (ICConnectionConfiguration)init;
- (ICConnectionConfiguration)initWithCoder:(id)a3;
- (ICConnectionConfiguration)initWithUserIdentity:(id)a3;
- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4;
- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4 clientIdentity:(id)a5;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (NSNumber)familyMemberStoreID;
- (NSString)buildIdentifier;
- (NSString)libraryBagKey;
- (NSString)purchaseClientIdentifier;
- (NSURL)baseURL;
- (OS_tcc_identity)clientIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)requestReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBuildIdentifier:(id)a3;
- (void)setFamilyMemberStoreID:(id)a3;
- (void)setLibraryBagKey:(id)a3;
- (void)setPurchaseClientIdentifier:(id)a3;
- (void)setRequestReason:(int64_t)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation ICConnectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberStoreID, 0);
  objc_storeStrong((id *)&self->_purchaseClientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryBagKey, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4 clientIdentity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ICConnectionConfiguration;
  v12 = [(ICConnectionConfiguration *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentity, a3);
    objc_storeStrong((id *)&v13->_userIdentityStore, a4);
    objc_storeStrong((id *)&v13->_clientIdentity, a5);
    v14 = (__CFString *)MGCopyAnswer();
    if (![(__CFString *)v14 length])
    {

      v14 = @"UNKNOWN";
    }
    int v15 = _os_feature_enabled_impl();
    v16 = @"1.5";
    if (v15) {
      v16 = @"1.6";
    }
    uint64_t v17 = [NSString stringWithFormat:@"%@/%@", v16, v14];
    buildIdentifier = v13->_buildIdentifier;
    v13->_buildIdentifier = (NSString *)v17;

    v19 = NSString;
    v20 = ICGetCloudDAAPClientPrefix();
    uint64_t v21 = [v19 stringWithFormat:@"%@/%@%@", @"1.2", v20, v14];
    purchaseClientIdentifier = v13->_purchaseClientIdentifier;
    v13->_purchaseClientIdentifier = (NSString *)v21;

    v13->_requestReason = 0;
  }

  return v13;
}

- (ICConnectionConfiguration)init
{
  v3 = +[ICUserIdentity activeAccount];
  v4 = +[ICUserIdentityStore defaultIdentityStore];
  v5 = [(ICConnectionConfiguration *)self initWithUserIdentity:v3 userIdentityStore:v4];

  return v5;
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3 userIdentityStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = MSVTCCIdentityForCurrentProcess();
  id v9 = [(ICConnectionConfiguration *)self initWithUserIdentity:v7 userIdentityStore:v6 clientIdentity:v8];

  return v9;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentity = self->_userIdentity;
  userIdentityStore = self->_userIdentityStore;
  id v6 = a3;
  objc_msgSend(v6, "ic_encodeUserIdentity:withStore:forKey:", userIdentity, userIdentityStore, @"userIdentity");
  [v6 encodeObject:self->_userIdentityStore forKey:@"userIdentityStore"];
  [v6 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v6 encodeObject:self->_libraryBagKey forKey:@"libraryBagKey"];
  [v6 encodeObject:self->_buildIdentifier forKey:@"buildIdentifier"];
  [v6 encodeObject:self->_purchaseClientIdentifier forKey:@"purchaseClientIdentifier"];
  [v6 encodeInt64:self->_requestReason forKey:@"requestReason"];
  [v6 encodeObject:self->_familyMemberStoreID forKey:@"familyMemberStoreID"];
  [v6 encodeTCCIdentity:self->_clientIdentity forKey:@"tccUserIdentity"];
}

- (ICConnectionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICConnectionConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentity"];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentityStore"];
    userIdentityStore = v5->_userIdentityStore;
    v5->_userIdentityStore = (ICUserIdentityStore *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryBagKey"];
    libraryBagKey = v5->_libraryBagKey;
    v5->_libraryBagKey = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildIdentifier"];
    buildIdentifier = v5->_buildIdentifier;
    v5->_buildIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseClientIdentifier"];
    purchaseClientIdentifier = v5->_purchaseClientIdentifier;
    v5->_purchaseClientIdentifier = (NSString *)v16;

    v5->_requestReason = [v4 decodeInt64ForKey:@"requestReason"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMemberStoreID"];
    familyMemberStoreID = v5->_familyMemberStoreID;
    v5->_familyMemberStoreID = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeTCCIdentityForKey:@"tccUserIdentity"];
    clientIdentity = v5->_clientIdentity;
    v5->_clientIdentity = (OS_tcc_identity *)v20;
  }
  return v5;
}

- (NSString)purchaseClientIdentifier
{
  return self->_purchaseClientIdentifier;
}

- (NSNumber)familyMemberStoreID
{
  return self->_familyMemberStoreID;
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p [userIdentity:%@]>", v5, self, self->_userIdentity];

  return v6;
}

- (void)setFamilyMemberStoreID:(id)a3
{
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setPurchaseClientIdentifier:(id)a3
{
}

- (void)setBuildIdentifier:(id)a3
{
}

- (void)setLibraryBagKey:(id)a3
{
}

- (NSString)libraryBagKey
{
  return self->_libraryBagKey;
}

- (void)setBaseURL:(id)a3
{
}

- (void)setUserIdentity:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [ICConnectionConfiguration alloc];
  v5 = [(ICConnectionConfiguration *)self userIdentity];
  uint64_t v6 = [(ICConnectionConfiguration *)self userIdentityStore];
  uint64_t v7 = [(ICConnectionConfiguration *)v4 initWithUserIdentity:v5 userIdentityStore:v6];

  uint64_t v8 = [(NSURL *)self->_baseURL copy];
  id v9 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_libraryBagKey copy];
  id v11 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_buildIdentifier copy];
  v13 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_purchaseClientIdentifier copy];
  int v15 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v14;

  *(void *)(v7 + 64) = self->_requestReason;
  objc_storeStrong((id *)(v7 + 72), self->_familyMemberStoreID);
  objc_storeStrong((id *)(v7 + 24), self->_clientIdentity);
  return (id)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICConnectionConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(ICConnectionConfiguration *)self userIdentityStore];
      id v7 = [(ICConnectionConfiguration *)v5 userIdentityStore];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_43:

          goto LABEL_44;
        }
      }
      uint64_t v10 = [(ICConnectionConfiguration *)self userIdentity];
      id v11 = [(ICConnectionConfiguration *)v5 userIdentity];
      uint64_t v12 = [(ICConnectionConfiguration *)self userIdentityStore];
      id v13 = v10;
      id v14 = v11;
      id v15 = v12;
      uint64_t v16 = v15;
      v49 = v6;
      if (v13 == v14)
      {
      }
      else
      {
        LOBYTE(v9) = 0;
        uint64_t v17 = v15;
        id v18 = v14;
        v19 = v13;
        if (!v13 || !v14) {
          goto LABEL_40;
        }
        int v20 = [v13 isEqualToIdentity:v14 inStore:v15];

        if (!v20)
        {
          LOBYTE(v9) = 0;
LABEL_42:
          id v6 = v49;

          goto LABEL_43;
        }
      }
      v19 = [(ICConnectionConfiguration *)self baseURL];
      uint64_t v48 = [(ICConnectionConfiguration *)v5 baseURL];
      if (v19 != (void *)v48)
      {
        uint64_t v21 = [(ICConnectionConfiguration *)self baseURL];
        v45 = [(ICConnectionConfiguration *)v5 baseURL];
        v46 = v21;
        if (!objc_msgSend(v21, "isEqual:"))
        {
          LOBYTE(v9) = 0;
LABEL_39:

          id v18 = (id)v48;
          uint64_t v17 = v46;
LABEL_40:
          v25 = v19;

          v19 = v18;
          goto LABEL_41;
        }
      }
      id v22 = [(ICConnectionConfiguration *)self libraryBagKey];
      id v23 = [(ICConnectionConfiguration *)v5 libraryBagKey];
      v43 = v23;
      v44 = v22;
      if (v22 == v23)
      {
      }
      else
      {
        objc_super v24 = v23;
        int v9 = [v22 isEqual:v23];

        if (!v9)
        {

          if (v19 != (void *)v48) {
            goto LABEL_39;
          }
LABEL_21:
          v25 = v19;
LABEL_41:

          goto LABEL_42;
        }
      }
      id v26 = [(ICConnectionConfiguration *)self buildIdentifier];
      id v27 = [(ICConnectionConfiguration *)v5 buildIdentifier];
      v47 = v26;
      v42 = v27;
      if (v26 == v27)
      {
      }
      else
      {
        v28 = v27;
        int v9 = [v47 isEqual:v27];

        if (!v9)
        {
          v29 = (void *)v48;
          goto LABEL_38;
        }
      }
      id v30 = [(ICConnectionConfiguration *)self purchaseClientIdentifier];
      id v31 = [(ICConnectionConfiguration *)v5 purchaseClientIdentifier];
      v40 = v31;
      v41 = v30;
      if (v30 == v31)
      {
      }
      else
      {
        v32 = v31;
        int v9 = [v30 isEqual:v31];

        if (!v9)
        {
          v29 = (void *)v48;
LABEL_37:

LABEL_38:
          if (v19 != v29) {
            goto LABEL_39;
          }
          goto LABEL_21;
        }
      }
      id v33 = [(ICConnectionConfiguration *)self familyMemberStoreID];
      id v34 = [(ICConnectionConfiguration *)v5 familyMemberStoreID];
      v39 = v34;
      if (v33 == v34)
      {
      }
      else
      {
        v35 = v34;
        int v38 = [v33 isEqual:v34];

        if (!v38)
        {
          LOBYTE(v9) = 0;
LABEL_36:
          v29 = (void *)v48;

          goto LABEL_37;
        }
      }
      int64_t v36 = [(ICConnectionConfiguration *)self requestReason];
      LOBYTE(v9) = v36 == [(ICConnectionConfiguration *)v5 requestReason];
      goto LABEL_36;
    }
    LOBYTE(v9) = 0;
  }
LABEL_44:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(ICConnectionConfiguration *)self userIdentity];
  id v4 = [(ICConnectionConfiguration *)self userIdentityStore];
  uint64_t v5 = [v3 hashInStore:v4];
  id v6 = [(ICConnectionConfiguration *)self userIdentityStore];
  uint64_t v7 = [v6 hash] ^ v5;
  int v8 = [(ICConnectionConfiguration *)self baseURL];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(ICConnectionConfiguration *)self libraryBagKey];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  uint64_t v12 = [(ICConnectionConfiguration *)self buildIdentifier];
  uint64_t v13 = [v12 hash];
  id v14 = [(ICConnectionConfiguration *)self purchaseClientIdentifier];
  uint64_t v15 = v13 ^ [v14 hash];
  int64_t v16 = v11 ^ v15 ^ [(ICConnectionConfiguration *)self requestReason];
  uint64_t v17 = [(ICConnectionConfiguration *)self familyMemberStoreID];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (ICConnectionConfiguration)initWithUserIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICUserIdentityStore defaultIdentityStore];
  id v6 = [(ICConnectionConfiguration *)self initWithUserIdentity:v4 userIdentityStore:v5];

  return v6;
}

+ (id)configurationFromSourceConfiguration:(id)a3 userIdentity:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 copy];
  [v6 setUserIdentity:v5];

  return v6;
}

@end