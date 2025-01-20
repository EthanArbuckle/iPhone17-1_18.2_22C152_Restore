@interface ICUserIdentity
+ (BOOL)supportsSecureCoding;
+ (id)activeAccount;
+ (id)activeLockerAccount;
+ (id)autoupdatingActiveAccount;
+ (id)autoupdatingActiveLockerAccount;
+ (id)carrierBundleWithDeviceIdentifier:(id)a3;
+ (id)defaultMediaIdentity;
+ (id)nullIdentity;
+ (id)specificAccountWithAltDSID:(id)a3;
+ (id)specificAccountWithDSID:(id)a3;
- (BOOL)_isComparableUsingResolvedDSID;
- (BOOL)allowsAccountEstablishment;
- (BOOL)allowsDelegation;
- (BOOL)hasResolvedDSID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentity:(id)a3 inStore:(id)a4;
- (ICUserIdentity)init;
- (ICUserIdentity)initWithCoder:(id)a3;
- (NSNumber)DSID;
- (NSString)accountDSID;
- (NSString)altDSID;
- (NSString)description;
- (NSString)deviceIdentifier;
- (id)_resolvedDSIDUsingSpecificIdentityStore:(id)a3;
- (id)identityAllowingDelegation:(BOOL)a3;
- (id)identityAllowingEstablishment:(BOOL)a3;
- (int64_t)type;
- (unint64_t)creationTime;
- (unint64_t)hash;
- (unint64_t)hashInStore:(id)a3;
- (void)_ensureResolvedDSIDUsingSpecificIdentityStore:(id)a3;
- (void)_performEncodingTaskUsingSpecificIdentityStore:(id)a3 encodingHandler:(id)a4;
- (void)_setResolvedDSID:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICUserIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (NSString)accountDSID
{
  v3 = [(ICUserIdentity *)self DSID];

  if (v3)
  {
    v4 = [(ICUserIdentity *)self DSID];
    v5 = v4;
LABEL_3:
    v6 = [v4 stringValue];
    goto LABEL_5;
  }
  v7 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v10 = 0;
  v5 = [v7 DSIDForUserIdentity:self outError:&v10];
  uint64_t v8 = v10;

  v6 = 0;
  if (!v8)
  {
    v4 = v5;
    goto LABEL_3;
  }
LABEL_5:

  return (NSString *)v6;
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (BOOL)hasResolvedDSID
{
  return self->_hasResolvedDSID;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)allowsDelegation
{
  return self->_allowsDelegation;
}

- (NSString)description
{
  if (self->_hasResolvedDSID)
  {
    DSID = self->_DSID;
    if (DSID)
    {
      ICCreateLoggableValueForDSID(DSID);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = @"signed out";
    }
  }
  else
  {
    v4 = @"unresolved";
  }
  switch(self->_type)
  {
    case 0:
      [NSString stringWithFormat:@"Active Account: <%@>", v4];
      goto LABEL_14;
    case 1:
      [NSString stringWithFormat:@"Active Locker Account: <%@>", v4];
      goto LABEL_14;
    case 2:
      v5 = @"Autoupdating Active Account";
      break;
    case 3:
      v5 = @"Autoupdating Active Locker Account";
      break;
    case 4:
      [NSString stringWithFormat:@"Carrier Bundle: %@", self->_deviceIdentifier];
      goto LABEL_14;
    case 5:
      v5 = @"Null";
      break;
    case 6:
    case 7:
      [NSString stringWithFormat:@"Account: <%@>", v4];
LABEL_14:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = [NSString stringWithFormat:@"<%@ %p: [%@]>", objc_opt_class(), self, v5];

  return (NSString *)v6;
}

+ (id)activeAccount
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 0;
  v3 = +[ICDeviceInfo currentDeviceInfo];
  *((unsigned char *)v2 + 18) = [v3 isWatch] ^ 1;

  return v2;
}

- (ICUserIdentity)init
{
  v4.receiver = self;
  v4.super_class = (Class)ICUserIdentity;
  v2 = [(ICUserIdentity *)&v4 init];
  if (v2) {
    v2->_creationTime = mach_absolute_time();
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setResolvedDSID:(id)a3
{
  objc_super v4 = (NSNumber *)[a3 copy];
  DSID = self->_DSID;
  self->_DSID = v4;

  self->_hasResolvedDSID = 1;
}

+ (id)nullIdentity
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 5;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (ICUserIdentity *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = +[ICUserIdentityStore defaultIdentityStore];
      BOOL v7 = [(ICUserIdentity *)self isEqualToIdentity:v5 inStore:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = +[ICUserIdentityStore defaultIdentityStore];
  unint64_t v4 = [(ICUserIdentity *)self hashInStore:v3];

  return v4;
}

- (void)_ensureResolvedDSIDUsingSpecificIdentityStore:(id)a3
{
  id v3 = [(ICUserIdentity *)self _resolvedDSIDUsingSpecificIdentityStore:a3];
}

- (unint64_t)hashInStore:(id)a3
{
  id v4 = a3;
  if ([(ICUserIdentity *)self _isComparableUsingResolvedDSID])
  {
    v5 = [(ICUserIdentity *)self _resolvedDSIDUsingSpecificIdentityStore:v4];
    unint64_t v6 = [v5 hash];
  }
  else
  {
    int64_t type = self->_type;
    v5 = [(ICUserIdentity *)self deviceIdentifier];
    unint64_t v6 = [v5 hash] ^ type;
  }

  return v6;
}

- (id)_resolvedDSIDUsingSpecificIdentityStore:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_DSID;
  unint64_t type = self->_type;
  BOOL v7 = type > 7;
  uint64_t v8 = (1 << type) & 0x83;
  BOOL v9 = v7 || v8 == 0;
  if (!v9 && !self->_hasResolvedDSID)
  {
    id v10 = v4;
    if (!v10)
    {
      if (!self->_isEncodingUsingSpecificIdentityStore)
      {
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "warning: ICUserIdentity - Resolving DSID without an externally supplied identity store; if encoding the iden"
            "tity into an NSCoder, make sure to use -[NSCoder ic_encodeUserIdentity:withStore:forKey:]. Falling back to u"
            "sing [ICUserIdentityStore defaultIdentityStore].",
            buf,
            2u);
        }
      }
      id v10 = +[ICUserIdentityStore defaultIdentityStore];
    }
    id v16 = 0;
    uint64_t v12 = [v10 DSIDForUserIdentity:self outError:&v16];
    id v13 = v16;

    if (v13)
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v18 = self;
        __int16 v19 = 2114;
        id v20 = v13;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "ICUserIdentity - Unable to retrieve DSID for userIdentity=%{public}@ - error=%{public}@", buf, 0x16u);
      }
    }
    v5 = (NSNumber *)v12;
  }

  return v5;
}

- (BOOL)isEqualToIdentity:(id)a3 inStore:(id)a4
{
  unint64_t v6 = (ICUserIdentity *)a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_10;
  }
  if (self == v6)
  {
    char v11 = 1;
    goto LABEL_14;
  }
  if (![(ICUserIdentity *)self _isComparableUsingResolvedDSID]
    || ![(ICUserIdentity *)v6 _isComparableUsingResolvedDSID])
  {
    if (self->_type == v6->_type)
    {
      uint64_t v8 = [(ICUserIdentity *)self deviceIdentifier];
      uint64_t v9 = [(ICUserIdentity *)v6 deviceIdentifier];
      goto LABEL_8;
    }
LABEL_10:
    char v11 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [(ICUserIdentity *)self _resolvedDSIDUsingSpecificIdentityStore:v7];
  uint64_t v9 = [(ICUserIdentity *)v6 _resolvedDSIDUsingSpecificIdentityStore:v7];
LABEL_8:
  if (v8 == (void *)v9)
  {
    char v11 = 1;
    id v10 = v8;
  }
  else
  {
    id v10 = (void *)v9;
    char v11 = [v8 isEqual:v9];
  }

LABEL_14:
  return v11;
}

- (BOOL)_isComparableUsingResolvedDSID
{
  return (self->_type < 8uLL) & (0xC3u >> self->_type);
}

- (NSString)deviceIdentifier
{
  if (self->_deviceIdentifier) {
    return self->_deviceIdentifier;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (id)identityAllowingDelegation:(BOOL)a3
{
  if (self->_allowsDelegation == a3)
  {
    id v4 = self;
  }
  else
  {
    id v4 = (ICUserIdentity *)objc_alloc_init((Class)objc_opt_class());
    v4->_allowsDelegation = a3;
    v4->_allowsAccountEstablishment = self->_allowsAccountEstablishment;
    v4->_creationTime = self->_creationTime;
    uint64_t v6 = [(NSString *)self->_deviceIdentifier copy];
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    uint64_t v8 = [(NSNumber *)self->_DSID copy];
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v8;

    uint64_t v10 = [(NSString *)self->_altDSID copy];
    altDSID = v4->_altDSID;
    v4->_altDSID = (NSString *)v10;

    v4->_hasResolvedDSID = self->_hasResolvedDSID;
    v4->_unint64_t type = self->_type;
  }

  return v4;
}

+ (id)specificAccountWithDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  uint64_t v6 = (void *)v4[5];
  v4[5] = v5;

  v4[3] = 6;
  *((unsigned char *)v4 + 19) = 1;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(ICUserIdentity *)self _ensureResolvedDSIDUsingSpecificIdentityStore:0];
  [v5 encodeBool:self->_allowsDelegation forKey:@"delegation"];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_creationTime];
  [v5 encodeObject:v4 forKey:@"time"];

  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceID"];
  [v5 encodeObject:self->_DSID forKey:@"dsid"];
  [v5 encodeObject:self->_altDSID forKey:@"altDSID"];
  [v5 encodeBool:self->_hasResolvedDSID forKey:@"hasResolvedDSID"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (void)_performEncodingTaskUsingSpecificIdentityStore:(id)a3 encodingHandler:(id)a4
{
  BOOL isEncodingUsingSpecificIdentityStore = self->_isEncodingUsingSpecificIdentityStore;
  if (a3) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = !isEncodingUsingSpecificIdentityStore;
  }
  BOOL v8 = !v7;
  self->_BOOL isEncodingUsingSpecificIdentityStore = v8;
  uint64_t v9 = (void (**)(void))a4;
  [(ICUserIdentity *)self _ensureResolvedDSIDUsingSpecificIdentityStore:a3];
  v9[2](v9);

  self->_BOOL isEncodingUsingSpecificIdentityStore = isEncodingUsingSpecificIdentityStore;
}

- (ICUserIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICUserIdentity;
  id v5 = [(ICUserIdentity *)&v14 init];
  if (v5)
  {
    v5->_allowsDelegation = [v4 decodeBoolForKey:@"delegation"];
    if ([v4 containsValueForKey:@"time"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
      v5->_creationTime = [v6 unsignedLongLongValue];
    }
    else
    {
      v5->_creationTime = mach_absolute_time();
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    DSID = v5->_DSID;
    v5->_DSID = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v11;

    v5->_hasResolvedDSID = [v4 decodeBoolForKey:@"hasResolvedDSID"];
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

+ (id)autoupdatingActiveAccount
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 2;
  id v3 = +[ICDeviceInfo currentDeviceInfo];
  *((unsigned char *)v2 + 18) = [v3 isWatch] ^ 1;

  return v2;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (BOOL)allowsAccountEstablishment
{
  return self->_allowsAccountEstablishment;
}

- (id)identityAllowingEstablishment:(BOOL)a3
{
  if (self->_allowsAccountEstablishment == a3)
  {
    id v4 = self;
  }
  else
  {
    id v4 = (ICUserIdentity *)objc_alloc_init((Class)objc_opt_class());
    v4->_allowsAccountEstablishment = a3;
    v4->_allowsDelegation = self->_allowsDelegation;
    v4->_creationTime = self->_creationTime;
    uint64_t v6 = [(NSString *)self->_deviceIdentifier copy];
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    uint64_t v8 = [(NSNumber *)self->_DSID copy];
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v8;

    uint64_t v10 = [(NSString *)self->_altDSID copy];
    altDSID = v4->_altDSID;
    v4->_altDSID = (NSString *)v10;

    v4->_hasResolvedDSID = self->_hasResolvedDSID;
    v4->_unint64_t type = self->_type;
  }

  return v4;
}

+ (id)defaultMediaIdentity
{
  return +[ICUserIdentity activeAccount];
}

+ (id)specificAccountWithAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  uint64_t v6 = (void *)v4[6];
  v4[6] = v5;

  v4[3] = 7;

  return v4;
}

+ (id)carrierBundleWithDeviceIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  v4[3] = 4;

  return v4;
}

+ (id)autoupdatingActiveLockerAccount
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 3;

  return v2;
}

+ (id)activeLockerAccount
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[3] = 1;

  return v2;
}

@end