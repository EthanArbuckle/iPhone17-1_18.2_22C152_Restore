@interface PKCloudStoreZone
+ (BOOL)supportsSecureCoding;
+ (void)zoneValueForZoneName:(id)a3 outZoneType:(unint64_t *)a4 outAccountIdentifier:(id *)a5 altDSID:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (NSSet)shareParticipants;
- (NSString)containerName;
- (NSString)ownerName;
- (NSString)zoneName;
- (NSString)zoneSubscriptionIdentifier;
- (PKCloudStoreZone)initWithCoder:(id)a3;
- (PKCloudStoreZone)initWithZoneID:(id)a3 containerDatabase:(id)a4;
- (PKCloudStoreZone)initWithZoneID:(id)a3 containerName:(id)a4 scope:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)recordZone;
- (id)shareParticipantWithHandle:(id)a3;
- (id)shareParticipantWithLookupInfo:(id)a3;
- (id)zoneSubscription;
- (int64_t)scope;
- (unint64_t)hash;
- (unint64_t)zoneType;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setOwnerName:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)setShareParticipants:(id)a3;
- (void)setZoneName:(id)a3;
- (void)setZoneSubscriptionIdentifier:(id)a3;
@end

@implementation PKCloudStoreZone

- (PKCloudStoreZone)initWithZoneID:(id)a3 containerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 database];
  v9 = [v8 container];
  v10 = [v9 containerIdentifier];
  uint64_t v11 = [v6 scope];

  v12 = [(PKCloudStoreZone *)self initWithZoneID:v7 containerName:v10 scope:v11];
  return v12;
}

- (PKCloudStoreZone)initWithZoneID:(id)a3 containerName:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudStoreZone;
  v10 = [(PKCloudStoreZone *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 zoneName];
    zoneName = v10->_zoneName;
    v10->_zoneName = (NSString *)v11;

    uint64_t v13 = [v8 ownerName];
    ownerName = v10->_ownerName;
    v10->_ownerName = (NSString *)v13;

    objc_storeStrong((id *)&v10->_containerName, a4);
    v10->_scope = a5;
    v15 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    shareParticipants = v10->_shareParticipants;
    v10->_shareParticipants = v15;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreZone)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKCloudStoreZone;
  v5 = [(PKCloudStoreZone *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerName"];
    ownerName = v5->_ownerName;
    v5->_ownerName = (NSString *)v8;

    v5->_scope = [v4 decodeIntegerForKey:@"scope"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerName"];
    containerName = v5->_containerName;
    v5->_containerName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneSubscriptionIdentifier"];
    zoneSubscriptionIdentifier = v5->_zoneSubscriptionIdentifier;
    v5->_zoneSubscriptionIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"shareParticipants"];
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSSet *)v17;
  }
  return v5;
}

+ (void)zoneValueForZoneName:(id)a3 outZoneType:(unint64_t *)a4 outAccountIdentifier:(id *)a5 altDSID:(id *)a6
{
  v28 = (__CFString *)a3;
  id v9 = @"transactions";
  if (v9 == v28)
  {

    goto LABEL_7;
  }
  if (!v28 || !v9)
  {

    goto LABEL_9;
  }
  char v10 = [(__CFString *)v28 isEqualToString:v9];

  if (v10)
  {
LABEL_7:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 1;
    goto LABEL_32;
  }
LABEL_9:
  if ([(__CFString *)v28 hasPrefix:@"cash-"])
  {
    uint64_t v12 = [(__CFString *)v28 stringByReplacingOccurrencesOfString:@"cash-" withString:&stru_1EE0F5368];
    uint64_t v11 = 0;
    unint64_t v13 = 3;
    goto LABEL_32;
  }
  if ([(__CFString *)v28 hasPrefix:@"card-joint-"])
  {
    uint64_t v12 = [(__CFString *)v28 stringByReplacingOccurrencesOfString:@"card-joint-" withString:&stru_1EE0F5368];
    uint64_t v11 = 0;
    unint64_t v13 = 4;
    goto LABEL_32;
  }
  if (![(__CFString *)v28 hasPrefix:@"card-participant-"])
  {
    if ([(__CFString *)v28 hasPrefix:@"card-"])
    {
      uint64_t v12 = -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v28, "stringByReplacingOccurrencesOfString:withString:options:range:", @"card-", &stru_1EE0F5368, 0, 0, [@"card-" length]);
      uint64_t v11 = 0;
      unint64_t v13 = 2;
      goto LABEL_32;
    }
    if ([(__CFString *)v28 hasPrefix:@"savings-"])
    {
      uint64_t v12 = -[__CFString stringByReplacingOccurrencesOfString:withString:options:range:](v28, "stringByReplacingOccurrencesOfString:withString:options:range:", @"savings-", &stru_1EE0F5368, 0, 0, [@"savings-" length]);
      uint64_t v11 = 0;
      unint64_t v13 = 8;
      goto LABEL_32;
    }
    objc_super v20 = v28;
    v21 = @"apple-account";
    if (v21 == v20) {
      goto LABEL_52;
    }
    v22 = v21;
    if (v28 && v21)
    {
      char v23 = [(__CFString *)v20 isEqualToString:v21];

      if (v23) {
        goto LABEL_53;
      }
    }
    else
    {
    }
    v24 = v20;
    v25 = @"apple-account-transactions";
    if (v25 == v24)
    {
LABEL_52:
    }
    else
    {
      v26 = v25;
      if (!v28 || !v25)
      {

LABEL_55:
        unint64_t v13 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        goto LABEL_32;
      }
      char v27 = [(__CFString *)v24 isEqualToString:v25];

      if ((v27 & 1) == 0) {
        goto LABEL_55;
      }
    }
LABEL_53:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 7;
    goto LABEL_32;
  }
  v14 = [(__CFString *)v28 stringByReplacingOccurrencesOfString:@"card-participant-" withString:&stru_1EE0F5368];
  uint64_t v15 = @"individual-";
  if ([v14 hasPrefix:@"individual-"])
  {
    unint64_t v13 = 5;
LABEL_20:
    uint64_t v16 = [v14 stringByReplacingOccurrencesOfString:v15 withString:&stru_1EE0F5368];

    v14 = (void *)v16;
    goto LABEL_24;
  }
  uint64_t v15 = @"joint-";
  if ([v14 hasPrefix:@"joint-"])
  {
    unint64_t v13 = 6;
    goto LABEL_20;
  }
  unint64_t v13 = 0;
LABEL_24:
  uint64_t v18 = [v14 rangeOfString:@"-altDSID-"];
  if (v18 == 0x7FFFFFFFFFFFFFFFLL || v17 >= [v14 length])
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v14 substringToIndex:v18];
  }
  unint64_t v19 = [@"-altDSID-" length] + v18;
  if (v19 >= [v14 length])
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [v14 substringFromIndex:v19];
  }

LABEL_32:
  if (a5) {
    *a5 = v12;
  }
  if (a6) {
    *a6 = v11;
  }
  if (a4) {
    *a4 = v13;
  }
}

- (unint64_t)zoneType
{
  unint64_t v3 = 0;
  [(id)objc_opt_class() zoneValueForZoneName:self->_zoneName outZoneType:&v3 outAccountIdentifier:0 altDSID:0];
  return v3;
}

- (id)shareParticipantWithHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_shareParticipants;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "participantHandle", (void)v16);
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        unint64_t v13 = v12;
        if (v4 && v12)
        {
          int v14 = [v11 isEqualToString:v12];

          if (v14) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)shareParticipantWithLookupInfo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_shareParticipants;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v10 = objc_msgSend(v9, "lookupInfo", (void)v14);
        id v11 = v10;
        if (v4 && v10)
        {
          char v12 = [v4 isEqual:v10];

          if (v12) {
            goto LABEL_14;
          }
        }
        else
        {

          if (v11 == v4)
          {
LABEL_14:
            id v6 = v9;
            goto LABEL_15;
          }
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

- (id)recordZone
{
  if (self->_zoneName && self->_ownerName)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A310]);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:self->_zoneName ownerName:self->_ownerName];
    v5 = (void *)[v3 initWithZoneID:v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)zoneSubscription
{
  if (self->_zoneSubscriptionIdentifier)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A340]);
    id v4 = [(PKCloudStoreZone *)self recordZone];
    v5 = [v4 zoneID];
    id v6 = (void *)[v3 initWithZoneID:v5 subscriptionID:self->_zoneSubscriptionIdentifier];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  zoneName = self->_zoneName;
  id v5 = a3;
  [v5 encodeObject:zoneName forKey:@"zoneName"];
  [v5 encodeObject:self->_zoneSubscriptionIdentifier forKey:@"zoneSubscriptionIdentifier"];
  [v5 encodeObject:self->_ownerName forKey:@"ownerName"];
  [v5 encodeInteger:self->_scope forKey:@"scope"];
  [v5 encodeObject:self->_shareParticipants forKey:@"shareParticipants"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCloudStoreZone allocWithZone:](PKCloudStoreZone, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_zoneName copyWithZone:a3];
  zoneName = v5->_zoneName;
  v5->_zoneName = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_containerName copyWithZone:a3];
  containerName = v5->_containerName;
  v5->_containerName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_zoneSubscriptionIdentifier copyWithZone:a3];
  zoneSubscriptionIdentifier = v5->_zoneSubscriptionIdentifier;
  v5->_zoneSubscriptionIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_ownerName copyWithZone:a3];
  ownerName = v5->_ownerName;
  v5->_ownerName = (NSString *)v12;

  v5->_scope = self->_scope;
  uint64_t v14 = [(NSSet *)self->_shareParticipants copyWithZone:a3];
  shareParticipants = v5->_shareParticipants;
  v5->_shareParticipants = (NSSet *)v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;
  if (!v6) {
    goto LABEL_17;
  }
  zoneName = self->_zoneName;
  uint64_t v8 = (NSString *)v6[2];
  if (zoneName && v8)
  {
    if ((-[NSString isEqual:](zoneName, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (zoneName != v8)
  {
    goto LABEL_17;
  }
  ownerName = self->_ownerName;
  uint64_t v10 = (NSString *)v6[3];
  if (!ownerName || !v10)
  {
    if (ownerName == v10) {
      goto LABEL_13;
    }
LABEL_17:
    char v13 = 0;
    goto LABEL_18;
  }
  if ((-[NSString isEqual:](ownerName, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  containerName = self->_containerName;
  uint64_t v12 = (NSString *)v6[1];
  if (containerName && v12) {
    char v13 = -[NSString isEqual:](containerName, "isEqual:");
  }
  else {
    char v13 = containerName == v12;
  }
LABEL_18:

  return v13;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_zoneName];
  [v3 safelyAddObject:self->_zoneSubscriptionIdentifier];
  [v3 safelyAddObject:self->_containerName];
  [v3 safelyAddObject:self->_ownerName];
  [v3 safelyAddObject:self->_shareParticipants];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_scope - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"containerName: '%@'; ", self->_containerName];
  [v3 appendFormat:@"ownerName: '%@'; ", self->_ownerName];
  uint64_t v4 = CKDatabaseScopeString();
  [v3 appendFormat:@"scope: '%@'; ", v4];

  [v3 appendFormat:@"zoneSubscriptionIdentifier: '%@'; ", self->_zoneSubscriptionIdentifier];
  if ([(NSSet *)self->_shareParticipants count]) {
    [v3 appendFormat:@"shareParticipants: '%@'; ", self->_shareParticipants];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)zoneSubscriptionIdentifier
{
  return self->_zoneSubscriptionIdentifier;
}

- (void)setZoneSubscriptionIdentifier:(id)a3
{
}

- (NSSet)shareParticipants
{
  return self->_shareParticipants;
}

- (void)setShareParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_zoneSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end