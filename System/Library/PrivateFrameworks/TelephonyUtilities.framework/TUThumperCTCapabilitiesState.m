@interface TUThumperCTCapabilitiesState
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
- (BOOL)isApproved;
- (BOOL)isAssociated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilitiesState:(id)a3;
- (BOOL)supportsDefaultPairedDevice;
- (NSSet)approvedSecondaryDeviceIDs;
- (NSString)accountID;
- (NSString)description;
- (NSString)localDeviceID;
- (TUThumperCTCapabilitiesState)init;
- (TUThumperCTCapabilitiesState)initWithCapabilityInfo:(id)a3;
- (TUThumperCTCapabilitiesState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publiclyAccessibleCopy;
- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setApproved:(BOOL)a3;
- (void)setApprovedSecondaryDeviceIDs:(id)a3;
- (void)setAssociated:(BOOL)a3;
- (void)setLocalDeviceID:(id)a3;
- (void)setSupportsDefaultPairedDevice:(BOOL)a3;
@end

@implementation TUThumperCTCapabilitiesState

- (TUThumperCTCapabilitiesState)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUThumperCTCapabilitiesState;
  v2 = [(TUThumperCTCapabilitiesState *)&v6 init];
  if (v2)
  {
    v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    approvedSecondaryDeviceIDs = v2->_approvedSecondaryDeviceIDs;
    v2->_approvedSecondaryDeviceIDs = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TUThumperCTCapabilitiesState;
  id v4 = a3;
  [(TUCTCapabilitiesState *)&v17 encodeWithCoder:v4];
  v5 = [(TUThumperCTCapabilitiesState *)self accountID];
  objc_super v6 = NSStringFromSelector(sel_accountID);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(TUThumperCTCapabilitiesState *)self isApproved];
  v8 = NSStringFromSelector(sel_isApproved);
  [v4 encodeBool:v7 forKey:v8];

  v9 = [(TUThumperCTCapabilitiesState *)self approvedSecondaryDeviceIDs];
  v10 = NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(TUThumperCTCapabilitiesState *)self isAssociated];
  v12 = NSStringFromSelector(sel_isAssociated);
  [v4 encodeBool:v11 forKey:v12];

  v13 = [(TUThumperCTCapabilitiesState *)self localDeviceID];
  v14 = NSStringFromSelector(sel_localDeviceID);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(TUThumperCTCapabilitiesState *)self supportsDefaultPairedDevice];
  v16 = NSStringFromSelector(sel_supportsDefaultPairedDevice);
  [v4 encodeBool:v15 forKey:v16];
}

- (BOOL)supportsDefaultPairedDevice
{
  return self->_supportsDefaultPairedDevice;
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (BOOL)isAssociated
{
  return self->_associated;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (NSSet)approvedSecondaryDeviceIDs
{
  return self->_approvedSecondaryDeviceIDs;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_approvedSecondaryDeviceIDs, 0);
}

- (TUThumperCTCapabilitiesState)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = [(TUCTCapabilitiesState *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = NSStringFromSelector(sel_accountID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    v10 = NSStringFromSelector(sel_isApproved);
    v5->_approved = [v4 decodeBoolForKey:v10];

    BOOL v11 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v13 = [v11 setWithArray:v12];
    v14 = NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
    uint64_t v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];
    approvedSecondaryDeviceIDs = v5->_approvedSecondaryDeviceIDs;
    v5->_approvedSecondaryDeviceIDs = (NSSet *)v15;

    objc_super v17 = NSStringFromSelector(sel_isAssociated);
    v5->_associated = [v4 decodeBoolForKey:v17];

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_localDeviceID);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    localDeviceID = v5->_localDeviceID;
    v5->_localDeviceID = (NSString *)v20;

    v22 = NSStringFromSelector(sel_supportsDefaultPairedDevice);
    v5->_supportsDefaultPairedDevice = [v4 decodeBoolForKey:v22];
  }
  return v5;
}

- (TUThumperCTCapabilitiesState)initWithCapabilityInfo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = [(TUCTCapabilitiesState *)&v36 initWithCapabilityInfo:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F242E8]];
    BOOL v7 = v6;
    if (!v6)
    {
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F242F0]];
    uint64_t v9 = [v8 copy];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v9;

    uint64_t v11 = *MEMORY[0x1E4F24300];
    v12 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F24300]];
    uint64_t v13 = [v12 copy];
    localDeviceID = v5->_localDeviceID;
    v5->_localDeviceID = (NSString *)v13;

    uint64_t v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F242F8]];
    v16 = v15;
    if (v15)
    {
      objc_super v17 = [v15 firstObject];
      uint64_t v18 = *MEMORY[0x1E4F24308];
      v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F24308]];

      if (v19)
      {
LABEL_8:
        if ([v19 count])
        {
          v31 = v16;
          uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v19, "count"));
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v30 = v19;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "objectForKeyedSubscript:", v11, v30);
                if (v26) {
                  [v20 addObject:v26];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v37 count:16];
            }
            while (v23);
          }

          uint64_t v27 = [v20 copy];
          approvedSecondaryDeviceIDs = v5->_approvedSecondaryDeviceIDs;
          v5->_approvedSecondaryDeviceIDs = (NSSet *)v27;

          v19 = v30;
          v16 = v31;
        }

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4F24308];
    }
    v19 = [v7 objectForKeyedSubscript:v18];
    goto LABEL_8;
  }
LABEL_21:

  return v5;
}

- (BOOL)isEqualToCapabilitiesState:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TUThumperCTCapabilitiesState;
  if ([(TUCTCapabilitiesState *)&v16 isEqualToCapabilitiesState:v4])
  {
    v5 = [(TUThumperCTCapabilitiesState *)self accountID];
    uint64_t v6 = [v4 accountID];
    if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
      && (int v7 = [(TUThumperCTCapabilitiesState *)self isApproved],
          v7 == [v4 isApproved]))
    {
      uint64_t v9 = [(TUThumperCTCapabilitiesState *)self approvedSecondaryDeviceIDs];
      v10 = [v4 approvedSecondaryDeviceIDs];
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10)
        && (int v11 = [(TUThumperCTCapabilitiesState *)self isAssociated],
            v11 == [v4 isAssociated]))
      {
        v12 = [(TUThumperCTCapabilitiesState *)self localDeviceID];
        uint64_t v13 = [v4 localDeviceID];
        if (TUObjectsAreEqualOrNil((unint64_t)v12, (uint64_t)v13))
        {
          BOOL v14 = [(TUThumperCTCapabilitiesState *)self supportsDefaultPairedDevice];
          int v8 = v14 ^ [v4 supportsDefaultPairedDevice] ^ 1;
        }
        else
        {
          LOBYTE(v8) = 0;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TUThumperCTCapabilitiesState;
  v5 = -[TUCTCapabilitiesState copyWithZone:](&v13, sel_copyWithZone_);
  uint64_t v6 = [(TUThumperCTCapabilitiesState *)self approvedSecondaryDeviceIDs];
  uint64_t v7 = [v6 copyWithZone:a3];
  int v8 = (void *)v5[6];
  v5[6] = v7;

  uint64_t v9 = [(TUThumperCTCapabilitiesState *)self localDeviceID];
  uint64_t v10 = [v9 copyWithZone:a3];
  int v11 = (void *)v5[8];
  v5[8] = v10;

  return v5;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)TUThumperCTCapabilitiesState;
  id v4 = [(TUCTCapabilitiesState *)&v16 description];
  v5 = [v3 stringWithFormat:@"<%@", v4];

  uint64_t v6 = NSStringFromSelector(sel_accountID);
  uint64_t v7 = [(TUThumperCTCapabilitiesState *)self accountID];
  [v5 appendFormat:@" %@=%@", v6, v7];

  int v8 = NSStringFromSelector(sel_isApproved);
  [v5 appendFormat:@" %@=%d", v8, -[TUThumperCTCapabilitiesState isApproved](self, "isApproved")];

  uint64_t v9 = NSStringFromSelector(sel_isAssociated);
  [v5 appendFormat:@" %@=%d", v9, -[TUThumperCTCapabilitiesState isAssociated](self, "isAssociated")];

  uint64_t v10 = NSStringFromSelector(sel_approvedSecondaryDeviceIDs);
  int v11 = [(TUThumperCTCapabilitiesState *)self approvedSecondaryDeviceIDs];
  [v5 appendFormat:@" %@=%@", v10, v11];

  v12 = NSStringFromSelector(sel_localDeviceID);
  objc_super v13 = [(TUThumperCTCapabilitiesState *)self localDeviceID];
  [v5 appendFormat:@" %@=%@", v12, v13];

  BOOL v14 = NSStringFromSelector(sel_supportsDefaultPairedDevice);
  [v5 appendFormat:@" %@=%d", v14, -[TUThumperCTCapabilitiesState supportsDefaultPairedDevice](self, "supportsDefaultPairedDevice")];

  [v5 appendString:@">"];

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)TUThumperCTCapabilitiesState;
  unint64_t v3 = [(TUCTCapabilitiesState *)&v17 hash];
  id v4 = [(TUThumperCTCapabilitiesState *)self accountID];
  uint64_t v5 = [v4 hash];
  if ([(TUThumperCTCapabilitiesState *)self isApproved]) {
    uint64_t v6 = 1231;
  }
  else {
    uint64_t v6 = 1237;
  }
  uint64_t v7 = v5 ^ v6;
  int v8 = [(TUThumperCTCapabilitiesState *)self approvedSecondaryDeviceIDs];
  uint64_t v9 = v7 ^ [v8 hash];
  if ([(TUThumperCTCapabilitiesState *)self isAssociated]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  unint64_t v11 = v9 ^ v10 ^ v3;
  v12 = [(TUThumperCTCapabilitiesState *)self localDeviceID];
  uint64_t v13 = [v12 hash];
  if ([(TUThumperCTCapabilitiesState *)self supportsDefaultPairedDevice]) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  unint64_t v15 = v11 ^ v13 ^ v14;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUThumperCTCapabilitiesState *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUThumperCTCapabilitiesState *)self isEqualToCapabilitiesState:v4];
  }

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return [(TUThumperCTCapabilitiesState *)self publiclyAccessibleCopyWithZone:0];
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUThumperCTCapabilitiesState;
  uint64_t v5 = -[TUCTCapabilitiesState publiclyAccessibleCopyWithZone:](&v10, sel_publiclyAccessibleCopyWithZone_);
  uint64_t v6 = [(TUThumperCTCapabilitiesState *)self accountID];
  uint64_t v7 = [v6 copyWithZone:a3];
  int v8 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v7;

  *(unsigned char *)(v5 + 40) = [(TUThumperCTCapabilitiesState *)self isApproved];
  *(unsigned char *)(v5 + 41) = [(TUThumperCTCapabilitiesState *)self isAssociated];
  *(unsigned char *)(v5 + 42) = [(TUThumperCTCapabilitiesState *)self supportsDefaultPairedDevice];

  return (id)v5;
}

+ (id)unarchivedObjectClasses
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___TUThumperCTCapabilitiesState;
  uint64_t v7 = objc_msgSendSuper2(&v10, sel_unarchivedObjectClasses);
  int v8 = [v7 setByAddingObjectsFromSet:v6];

  return v8;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
}

- (void)setApprovedSecondaryDeviceIDs:(id)a3
{
}

- (void)setAccountID:(id)a3
{
}

- (void)setAssociated:(BOOL)a3
{
  self->_associated = a3;
}

- (void)setLocalDeviceID:(id)a3
{
}

- (void)setSupportsDefaultPairedDevice:(BOOL)a3
{
  self->_supportsDefaultPairedDevice = a3;
}

@end