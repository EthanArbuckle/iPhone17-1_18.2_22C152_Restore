@interface TUConversationLinkDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isActivated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationLinkDescriptor:(id)a3;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSDate)creationDate;
- (NSDate)deletionDate;
- (NSDate)expirationDate;
- (NSSet)invitedHandles;
- (NSString)name;
- (NSString)pseudonym;
- (NSUUID)groupUUID;
- (TUConversationLinkDescriptor)initWithCoder:(id)a3;
- (TUConversationLinkDescriptor)initWithConversationLinkDescriptor:(id)a3;
- (TUConversationLinkDescriptor)initWithGroupUUID:(id)a3 originator:(id)a4 pseudonym:(id)a5 publicKey:(id)a6;
- (TUConversationLinkOriginator)originator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)version;
- (int64_t)deleteReason;
- (int64_t)linkLifetimeScope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setDeleteReason:(int64_t)a3;
- (void)setDeletionDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setInvitedHandles:(id)a3;
- (void)setLinkLifetimeScope:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setPrivateKey:(id)a3;
- (void)setPseudonym:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setVersion:(int)a3;
@end

@implementation TUConversationLinkDescriptor

- (TUConversationLinkDescriptor)initWithGroupUUID:(id)a3 originator:(id)a4 pseudonym:(id)a5 publicKey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TUConversationLinkDescriptor;
  v15 = [(TUConversationLinkDescriptor *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_groupUUID, a3);
    objc_storeStrong((id *)&v16->_originator, a4);
    uint64_t v17 = [v13 copy];
    pseudonym = v16->_pseudonym;
    v16->_pseudonym = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    publicKey = v16->_publicKey;
    v16->_publicKey = (NSData *)v19;
  }
  return v16;
}

- (TUConversationLinkDescriptor)initWithConversationLinkDescriptor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationLinkDescriptor;
  v5 = [(TUConversationLinkDescriptor *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_activated = *((unsigned char *)v4 + 8);
    objc_storeStrong((id *)&v5->_creationDate, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_deletionDate, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_expirationDate, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_groupUUID, *((id *)v4 + 7));
    objc_storeStrong((id *)&v6->_invitedHandles, *((id *)v4 + 8));
    objc_storeStrong((id *)&v6->_name, *((id *)v4 + 9));
    objc_storeStrong((id *)&v6->_originator, *((id *)v4 + 10));
    objc_storeStrong((id *)&v6->_privateKey, *((id *)v4 + 11));
    objc_storeStrong((id *)&v6->_pseudonym, *((id *)v4 + 12));
    objc_storeStrong((id *)&v6->_publicKey, *((id *)v4 + 13));
    v6->_version = *((_DWORD *)v4 + 3);
    v6->_linkLifetimeScope = *((void *)v4 + 5);
    v6->_deleteReason = *((void *)v4 + 6);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL activated = self->_activated;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_isActivated);
  [v5 encodeBool:activated forKey:v6];

  creationDate = self->_creationDate;
  objc_super v8 = NSStringFromSelector(sel_creationDate);
  [v5 encodeObject:creationDate forKey:v8];

  deletionDate = self->_deletionDate;
  v10 = NSStringFromSelector(sel_deletionDate);
  [v5 encodeObject:deletionDate forKey:v10];

  expirationDate = self->_expirationDate;
  id v12 = NSStringFromSelector(sel_expirationDate);
  [v5 encodeObject:expirationDate forKey:v12];

  groupUUID = self->_groupUUID;
  id v14 = NSStringFromSelector(sel_groupUUID);
  [v5 encodeObject:groupUUID forKey:v14];

  invitedHandles = self->_invitedHandles;
  v16 = NSStringFromSelector(sel_invitedHandles);
  [v5 encodeObject:invitedHandles forKey:v16];

  name = self->_name;
  v18 = NSStringFromSelector(sel_name);
  [v5 encodeObject:name forKey:v18];

  originator = self->_originator;
  v20 = NSStringFromSelector(sel_originator);
  [v5 encodeObject:originator forKey:v20];

  privateKey = self->_privateKey;
  objc_super v22 = NSStringFromSelector(sel_privateKey);
  [v5 encodeObject:privateKey forKey:v22];

  pseudonym = self->_pseudonym;
  v24 = NSStringFromSelector(sel_pseudonym);
  [v5 encodeObject:pseudonym forKey:v24];

  publicKey = self->_publicKey;
  v26 = NSStringFromSelector(sel_publicKey);
  [v5 encodeObject:publicKey forKey:v26];

  uint64_t version = self->_version;
  v28 = NSStringFromSelector(sel_version);
  [v5 encodeInt32:version forKey:v28];

  int64_t linkLifetimeScope = self->_linkLifetimeScope;
  v30 = NSStringFromSelector(sel_linkLifetimeScope);
  [v5 encodeInteger:linkLifetimeScope forKey:v30];

  int64_t deleteReason = self->_deleteReason;
  NSStringFromSelector(sel_deleteReason);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:deleteReason forKey:v32];
}

- (TUConversationLinkDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TUConversationLinkDescriptor;
  id v5 = [(TUConversationLinkDescriptor *)&v53 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_isActivated);
    v5->_BOOL activated = [v4 decodeBoolForKey:v6];

    uint64_t v7 = objc_opt_class();
    objc_super v8 = NSStringFromSelector(sel_creationDate);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v9;

    uint64_t v11 = objc_opt_class();
    id v12 = NSStringFromSelector(sel_deletionDate);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    deletionDate = v5->_deletionDate;
    v5->_deletionDate = (NSDate *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_expirationDate);
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v17;

    uint64_t v19 = objc_opt_class();
    v20 = NSStringFromSelector(sel_groupUUID);
    uint64_t v21 = [v4 decodeObjectOfClass:v19 forKey:v20];
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v26 = NSStringFromSelector(sel_invitedHandles);
    uint64_t v27 = [v4 decodeObjectOfClasses:v25 forKey:v26];
    invitedHandles = v5->_invitedHandles;
    v5->_invitedHandles = (NSSet *)v27;

    uint64_t v29 = objc_opt_class();
    v30 = NSStringFromSelector(sel_name);
    uint64_t v31 = [v4 decodeObjectOfClass:v29 forKey:v30];
    name = v5->_name;
    v5->_name = (NSString *)v31;

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector(sel_originator);
    uint64_t v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    originator = v5->_originator;
    v5->_originator = (TUConversationLinkOriginator *)v35;

    uint64_t v37 = objc_opt_class();
    v38 = NSStringFromSelector(sel_privateKey);
    uint64_t v39 = [v4 decodeObjectOfClass:v37 forKey:v38];
    privateKey = v5->_privateKey;
    v5->_privateKey = (NSData *)v39;

    uint64_t v41 = objc_opt_class();
    v42 = NSStringFromSelector(sel_pseudonym);
    uint64_t v43 = [v4 decodeObjectOfClass:v41 forKey:v42];
    pseudonym = v5->_pseudonym;
    v5->_pseudonym = (NSString *)v43;

    uint64_t v45 = objc_opt_class();
    v46 = NSStringFromSelector(sel_publicKey);
    uint64_t v47 = [v4 decodeObjectOfClass:v45 forKey:v46];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v47;

    v49 = NSStringFromSelector(sel_version);
    v5->_uint64_t version = [v4 decodeInt32ForKey:v49];

    v50 = NSStringFromSelector(sel_linkLifetimeScope);
    v5->_int64_t linkLifetimeScope = [v4 decodeIntegerForKey:v50];

    v51 = NSStringFromSelector(sel_deleteReason);
    v5->_int64_t deleteReason = [v4 decodeIntegerForKey:v51];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationLinkDescriptor allocWithZone:a3];

  return [(TUConversationLinkDescriptor *)v4 initWithConversationLinkDescriptor:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TUMutableConversationLinkDescriptor allocWithZone:a3];

  return [(TUConversationLinkDescriptor *)v4 initWithConversationLinkDescriptor:self];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_isActivated);
  [v3 appendFormat:@"%@=%d", v4, -[TUConversationLinkDescriptor isActivated](self, "isActivated")];

  [v3 appendFormat:@", "];
  id v5 = NSStringFromSelector(sel_creationDate);
  v6 = [(TUConversationLinkDescriptor *)self creationDate];
  [v3 appendFormat:@"%@=%@", v5, v6];

  [v3 appendFormat:@", "];
  uint64_t v7 = NSStringFromSelector(sel_deletionDate);
  objc_super v8 = [(TUConversationLinkDescriptor *)self deletionDate];
  [v3 appendFormat:@"%@=%@", v7, v8];

  [v3 appendFormat:@", "];
  uint64_t v9 = NSStringFromSelector(sel_expirationDate);
  v10 = [(TUConversationLinkDescriptor *)self expirationDate];
  [v3 appendFormat:@"%@=%@", v9, v10];

  [v3 appendFormat:@", "];
  uint64_t v11 = NSStringFromSelector(sel_groupUUID);
  id v12 = [(TUConversationLinkDescriptor *)self groupUUID];
  [v3 appendFormat:@"%@=%@", v11, v12];

  [v3 appendFormat:@", "];
  uint64_t v13 = NSStringFromSelector(sel_invitedHandles);
  id v14 = [(TUConversationLinkDescriptor *)self invitedHandles];
  [v3 appendFormat:@"%@=%@", v13, v14];

  [v3 appendFormat:@", "];
  uint64_t v15 = NSStringFromSelector(sel_name);
  v16 = [(TUConversationLinkDescriptor *)self name];
  [v3 appendFormat:@"%@=%@", v15, v16];

  [v3 appendFormat:@", "];
  uint64_t v17 = NSStringFromSelector(sel_originator);
  v18 = [(TUConversationLinkDescriptor *)self originator];
  [v3 appendFormat:@"%@=%@", v17, v18];

  [v3 appendFormat:@", "];
  uint64_t v19 = NSStringFromSelector(sel_privateKey);
  v20 = [(TUConversationLinkDescriptor *)self privateKey];
  [v3 appendFormat:@"%@=%@", v19, v20];

  [v3 appendFormat:@", "];
  uint64_t v21 = NSStringFromSelector(sel_pseudonym);
  objc_super v22 = [(TUConversationLinkDescriptor *)self pseudonym];
  [v3 appendFormat:@"%@=%@", v21, v22];

  [v3 appendFormat:@", "];
  v23 = NSStringFromSelector(sel_publicKey);
  uint64_t v24 = [(TUConversationLinkDescriptor *)self publicKey];
  [v3 appendFormat:@"%@=%@", v23, v24];

  [v3 appendFormat:@", "];
  v25 = NSStringFromSelector(sel_version);
  [v3 appendFormat:@"%@=%d", v25, -[TUConversationLinkDescriptor version](self, "version")];

  [v3 appendFormat:@", "];
  v26 = NSStringFromSelector(sel_linkLifetimeScope);
  [v3 appendFormat:@"%@=%ld", v26, -[TUConversationLinkDescriptor linkLifetimeScope](self, "linkLifetimeScope")];

  [v3 appendFormat:@", "];
  uint64_t v27 = NSStringFromSelector(sel_deleteReason);
  [v3 appendFormat:@"%@=%ld", v27, -[TUConversationLinkDescriptor deleteReason](self, "deleteReason")];

  [v3 appendFormat:@">"];
  v28 = (void *)[v3 copy];

  return v28;
}

- (unint64_t)hash
{
  if ([(TUConversationLinkDescriptor *)self isActivated]) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  uint64_t v27 = [(TUConversationLinkDescriptor *)self creationDate];
  uint64_t v4 = [v27 hash];
  v26 = [(TUConversationLinkDescriptor *)self deletionDate];
  uint64_t v5 = v4 ^ [v26 hash] ^ v3;
  v25 = [(TUConversationLinkDescriptor *)self expirationDate];
  uint64_t v6 = [v25 hash];
  uint64_t v7 = [(TUConversationLinkDescriptor *)self groupUUID];
  uint64_t v8 = v6 ^ [v7 hash];
  uint64_t v9 = [(TUConversationLinkDescriptor *)self invitedHandles];
  uint64_t v10 = v5 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(TUConversationLinkDescriptor *)self name];
  uint64_t v12 = [v11 hash];
  uint64_t v13 = [(TUConversationLinkDescriptor *)self originator];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(TUConversationLinkDescriptor *)self privateKey];
  uint64_t v16 = v14 ^ [v15 hash];
  uint64_t v17 = [(TUConversationLinkDescriptor *)self pseudonym];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  uint64_t v19 = [(TUConversationLinkDescriptor *)self publicKey];
  uint64_t v20 = [v19 hash];
  uint64_t v21 = v20 ^ [(TUConversationLinkDescriptor *)self version];
  int64_t v22 = v21 ^ [(TUConversationLinkDescriptor *)self linkLifetimeScope];
  unint64_t v23 = v18 ^ v22 ^ [(TUConversationLinkDescriptor *)self deleteReason];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationLinkDescriptor *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationLinkDescriptor *)self isEqualToConversationLinkDescriptor:v4];
  }

  return v5;
}

- (BOOL)isEqualToConversationLinkDescriptor:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationLinkDescriptor *)self isActivated];
  if (v5 == [v4 isActivated])
  {
    uint64_t v7 = [(TUConversationLinkDescriptor *)self creationDate];
    uint64_t v8 = [v4 creationDate];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      uint64_t v9 = [(TUConversationLinkDescriptor *)self deletionDate];
      uint64_t v10 = [v4 deletionDate];
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        uint64_t v11 = [(TUConversationLinkDescriptor *)self expirationDate];
        uint64_t v12 = [v4 expirationDate];
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          uint64_t v13 = [(TUConversationLinkDescriptor *)self groupUUID];
          uint64_t v14 = [v4 groupUUID];
          if (TUObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v14))
          {
            v36 = v13;
            unint64_t v15 = [(TUConversationLinkDescriptor *)self invitedHandles];
            [v4 invitedHandles];
            uint64_t v37 = v38 = (void *)v15;
            if (TUObjectsAreEqualOrNil(v15, (uint64_t)v37))
            {
              unint64_t v16 = [(TUConversationLinkDescriptor *)self name];
              v34 = [v4 name];
              uint64_t v35 = (void *)v16;
              if (TUObjectsAreEqualOrNil(v16, (uint64_t)v34))
              {
                unint64_t v17 = [(TUConversationLinkDescriptor *)self originator];
                id v32 = [v4 originator];
                uint64_t v33 = (void *)v17;
                if (TUObjectsAreEqualOrNil(v17, (uint64_t)v32))
                {
                  unint64_t v18 = [(TUConversationLinkDescriptor *)self privateKey];
                  v30 = [v4 privateKey];
                  uint64_t v31 = (void *)v18;
                  if (TUObjectsAreEqualOrNil(v18, (uint64_t)v30))
                  {
                    unint64_t v19 = [(TUConversationLinkDescriptor *)self pseudonym];
                    v28 = [v4 pseudonym];
                    uint64_t v29 = (void *)v19;
                    if (TUStringsAreEqualOrNil(v19, (uint64_t)v28))
                    {
                      unint64_t v20 = [(TUConversationLinkDescriptor *)self publicKey];
                      v26 = [v4 publicKey];
                      uint64_t v27 = (void *)v20;
                      int v21 = TUObjectsAreEqualOrNil(v20, (uint64_t)v26);
                      uint64_t v13 = v36;
                      if (v21
                        && (int v24 = [(TUConversationLinkDescriptor *)self version],
                            v24 == [v4 version])
                        && (int64_t v25 = [(TUConversationLinkDescriptor *)self linkLifetimeScope],
                            v25 == [v4 linkLifetimeScope]))
                      {
                        int64_t v22 = [(TUConversationLinkDescriptor *)self deleteReason];
                        BOOL v6 = v22 == [v4 deleteReason];
                      }
                      else
                      {
                        BOOL v6 = 0;
                      }
                    }
                    else
                    {
                      BOOL v6 = 0;
                      uint64_t v13 = v36;
                    }
                  }
                  else
                  {
                    BOOL v6 = 0;
                    uint64_t v13 = v36;
                  }
                }
                else
                {
                  BOOL v6 = 0;
                  uint64_t v13 = v36;
                }
              }
              else
              {
                BOOL v6 = 0;
                uint64_t v13 = v36;
              }
            }
            else
            {
              BOOL v6 = 0;
              uint64_t v13 = v36;
            }
          }
          else
          {
            BOOL v6 = 0;
          }
        }
        else
        {
          BOOL v6 = 0;
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_BOOL activated = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)linkLifetimeScope
{
  return self->_linkLifetimeScope;
}

- (void)setLinkLifetimeScope:(int64_t)a3
{
  self->_int64_t linkLifetimeScope = a3;
}

- (int64_t)deleteReason
{
  return self->_deleteReason;
}

- (void)setDeleteReason:(int64_t)a3
{
  self->_int64_t deleteReason = a3;
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
}

- (NSSet)invitedHandles
{
  return self->_invitedHandles;
}

- (void)setInvitedHandles:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (TUConversationLinkOriginator)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_uint64_t version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_invitedHandles, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end