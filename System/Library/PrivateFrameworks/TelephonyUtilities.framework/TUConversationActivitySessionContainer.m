@interface TUConversationActivitySessionContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContainer:(id)a3;
- (NSSet)activeRemoteParticipants;
- (NSSet)activitySessions;
- (NSSet)remoteMembers;
- (NSSet)virtualParticipants;
- (NSUUID)UUID;
- (NSUUID)groupUUID;
- (TUConversationActivitySessionContainer)initWithCoder:(id)a3;
- (TUConversationMember)localMember;
- (TUConversationUnreliableMessengerConfig)unreliableMessengerConfig;
- (TUConversationVirtualParticipantConfig)virtualParticipantConfig;
- (TUHandle)initiator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)localParticipantIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveRemoteParticipants:(id)a3;
- (void)setActivitySessions:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setInitiator:(id)a3;
- (void)setLocalMember:(id)a3;
- (void)setLocalParticipantIdentifier:(unint64_t)a3;
- (void)setRemoteMembers:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUnreliableMessengerConfig:(id)a3;
- (void)setVirtualParticipantConfig:(id)a3;
- (void)setVirtualParticipants:(id)a3;
@end

@implementation TUConversationActivitySessionContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUConversationActivitySessionContainer *)self UUID];
  v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUConversationActivitySessionContainer *)self groupUUID];
  v8 = NSStringFromSelector(sel_groupUUID);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(TUConversationActivitySessionContainer *)self state];
  v10 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:v9 forKey:v10];

  v11 = [(TUConversationActivitySessionContainer *)self activitySessions];
  v12 = NSStringFromSelector(sel_activitySessions);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(TUConversationActivitySessionContainer *)self remoteMembers];
  v14 = NSStringFromSelector(sel_remoteMembers);
  [v4 encodeObject:v13 forKey:v14];

  v15 = [(TUConversationActivitySessionContainer *)self localMember];
  v16 = NSStringFromSelector(sel_localMember);
  [v4 encodeObject:v15 forKey:v16];

  v17 = [(TUConversationActivitySessionContainer *)self initiator];
  v18 = NSStringFromSelector(sel_initiator);
  [v4 encodeObject:v17 forKey:v18];

  unint64_t v19 = [(TUConversationActivitySessionContainer *)self localParticipantIdentifier];
  v20 = NSStringFromSelector(sel_localParticipantIdentifier);
  [v4 encodeInt64:v19 forKey:v20];

  v21 = [(TUConversationActivitySessionContainer *)self virtualParticipants];
  v22 = NSStringFromSelector(sel_virtualParticipants);
  [v4 encodeObject:v21 forKey:v22];

  v23 = [(TUConversationActivitySessionContainer *)self virtualParticipantConfig];
  v24 = NSStringFromSelector(sel_virtualParticipantConfig);
  [v4 encodeObject:v23 forKey:v24];

  v25 = [(TUConversationActivitySessionContainer *)self unreliableMessengerConfig];
  v26 = NSStringFromSelector(sel_unreliableMessengerConfig);
  [v4 encodeObject:v25 forKey:v26];

  id v28 = [(TUConversationActivitySessionContainer *)self activeRemoteParticipants];
  v27 = NSStringFromSelector(sel_activeRemoteParticipants);
  [v4 encodeObject:v28 forKey:v27];
}

- (TUConversationActivitySessionContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)TUConversationActivitySessionContainer;
  v5 = [(TUConversationActivitySessionContainer *)&v57 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_UUID);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_groupUUID);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    groupUUID = v5->_groupUUID;
    v5->_groupUUID = (NSUUID *)v12;

    v14 = NSStringFromSelector(sel_state);
    v5->_state = [v4 decodeIntegerForKey:v14];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = NSStringFromSelector(sel_activitySessions);
    uint64_t v19 = [v4 decodeObjectOfClasses:v17 forKey:v18];
    activitySessions = v5->_activitySessions;
    v5->_activitySessions = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = NSStringFromSelector(sel_remoteMembers);
    uint64_t v25 = [v4 decodeObjectOfClasses:v23 forKey:v24];
    remoteMembers = v5->_remoteMembers;
    v5->_remoteMembers = (NSSet *)v25;

    uint64_t v27 = objc_opt_class();
    id v28 = NSStringFromSelector(sel_localMember);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    localMember = v5->_localMember;
    v5->_localMember = (TUConversationMember *)v29;

    uint64_t v31 = objc_opt_class();
    v32 = NSStringFromSelector(sel_initiator);
    uint64_t v33 = [v4 decodeObjectOfClass:v31 forKey:v32];
    initiator = v5->_initiator;
    v5->_initiator = (TUHandle *)v33;

    v35 = NSStringFromSelector(sel_localParticipantIdentifier);
    v5->_localParticipantIdentifier = [v4 decodeInt64ForKey:v35];

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    v39 = NSStringFromSelector(sel_virtualParticipants);
    uint64_t v40 = [v4 decodeObjectOfClasses:v38 forKey:v39];
    virtualParticipants = v5->_virtualParticipants;
    v5->_virtualParticipants = (NSSet *)v40;

    uint64_t v42 = objc_opt_class();
    v43 = NSStringFromSelector(sel_virtualParticipantConfig);
    uint64_t v44 = [v4 decodeObjectOfClass:v42 forKey:v43];
    virtualParticipantConfig = v5->_virtualParticipantConfig;
    v5->_virtualParticipantConfig = (TUConversationVirtualParticipantConfig *)v44;

    uint64_t v46 = objc_opt_class();
    v47 = NSStringFromSelector(sel_unreliableMessengerConfig);
    uint64_t v48 = [v4 decodeObjectOfClass:v46 forKey:v47];
    unreliableMessengerConfig = v5->_unreliableMessengerConfig;
    v5->_unreliableMessengerConfig = (TUConversationUnreliableMessengerConfig *)v48;

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v53 = NSStringFromSelector(sel_activeRemoteParticipants);
    uint64_t v54 = [v4 decodeObjectOfClasses:v52 forKey:v53];
    activeRemoteParticipants = v5->_activeRemoteParticipants;
    v5->_activeRemoteParticipants = (NSSet *)v54;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUConversationActivitySessionContainer *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUConversationActivitySessionContainer *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v5];

  objc_msgSend(v3, "appendFormat:", @" state=%ld", -[TUConversationActivitySessionContainer state](self, "state"));
  uint64_t v6 = [(TUConversationActivitySessionContainer *)self activitySessions];
  [v3 appendFormat:@" activitySessions=%@", v6];

  v7 = [(TUConversationActivitySessionContainer *)self remoteMembers];
  [v3 appendFormat:@" remoteMembers=%@", v7];

  uint64_t v8 = [(TUConversationActivitySessionContainer *)self localMember];
  [v3 appendFormat:@" localMember=%@", v8];

  int64_t v9 = [(TUConversationActivitySessionContainer *)self initiator];
  [v3 appendFormat:@" initiator=%@", v9];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[TUConversationActivitySessionContainer localParticipantIdentifier](self, "localParticipantIdentifier"));
  [v3 appendFormat:@" localParticipantIdentifier=%@", v10];

  v11 = [(TUConversationActivitySessionContainer *)self virtualParticipants];
  [v3 appendFormat:@" virtualParticipants=%@", v11];

  uint64_t v12 = [(TUConversationActivitySessionContainer *)self virtualParticipantConfig];
  [v3 appendFormat:@" virtualParticipantConfig=%@", v12];

  v13 = [(TUConversationActivitySessionContainer *)self unreliableMessengerConfig];
  [v3 appendFormat:@" unreliableMessengerConfig=%@", v13];

  v14 = [(TUConversationActivitySessionContainer *)self activeRemoteParticipants];
  [v3 appendFormat:@" activeRemoteParticipants=%@", v14];

  [v3 appendString:@">"];
  v15 = (void *)[v3 copy];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TUConversationActivitySessionContainer);
  v5 = [(TUConversationActivitySessionContainer *)self UUID];
  uint64_t v6 = (void *)[v5 copy];
  [(TUConversationActivitySessionContainer *)v4 setUUID:v6];

  v7 = [(TUConversationActivitySessionContainer *)self groupUUID];
  uint64_t v8 = (void *)[v7 copy];
  [(TUConversationActivitySessionContainer *)v4 setGroupUUID:v8];

  [(TUConversationActivitySessionContainer *)v4 setState:[(TUConversationActivitySessionContainer *)self state]];
  int64_t v9 = [(TUConversationActivitySessionContainer *)self activitySessions];
  uint64_t v10 = (void *)[v9 copy];
  [(TUConversationActivitySessionContainer *)v4 setActivitySessions:v10];

  v11 = [(TUConversationActivitySessionContainer *)self remoteMembers];
  uint64_t v12 = (void *)[v11 copy];
  [(TUConversationActivitySessionContainer *)v4 setRemoteMembers:v12];

  v13 = [(TUConversationActivitySessionContainer *)self localMember];
  v14 = (void *)[v13 copy];
  [(TUConversationActivitySessionContainer *)v4 setLocalMember:v14];

  v15 = [(TUConversationActivitySessionContainer *)self initiator];
  uint64_t v16 = (void *)[v15 copy];
  [(TUConversationActivitySessionContainer *)v4 setInitiator:v16];

  [(TUConversationActivitySessionContainer *)v4 setLocalParticipantIdentifier:[(TUConversationActivitySessionContainer *)self localParticipantIdentifier]];
  v17 = [(TUConversationActivitySessionContainer *)self virtualParticipants];
  v18 = (void *)[v17 copy];
  [(TUConversationActivitySessionContainer *)v4 setVirtualParticipants:v18];

  uint64_t v19 = [(TUConversationActivitySessionContainer *)self virtualParticipantConfig];
  v20 = (void *)[v19 copy];
  [(TUConversationActivitySessionContainer *)v4 setVirtualParticipantConfig:v20];

  v21 = [(TUConversationActivitySessionContainer *)self unreliableMessengerConfig];
  uint64_t v22 = (void *)[v21 copy];
  [(TUConversationActivitySessionContainer *)v4 setUnreliableMessengerConfig:v22];

  v23 = [(TUConversationActivitySessionContainer *)self activeRemoteParticipants];
  v24 = (void *)[v23 copy];
  [(TUConversationActivitySessionContainer *)v4 setActiveRemoteParticipants:v24];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUConversationActivitySessionContainer *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationActivitySessionContainer *)self isEqualToContainer:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v25 = [(TUConversationActivitySessionContainer *)self activeRemoteParticipants];
  uint64_t v3 = [v25 hash];
  v24 = [(TUConversationActivitySessionContainer *)self activitySessions];
  uint64_t v4 = [v24 hash] ^ v3;
  BOOL v5 = [(TUConversationActivitySessionContainer *)self groupUUID];
  uint64_t v6 = [v5 hash];
  v7 = [(TUConversationActivitySessionContainer *)self initiator];
  uint64_t v8 = v4 ^ v6 ^ [v7 hash];
  unint64_t v9 = [(TUConversationActivitySessionContainer *)self localParticipantIdentifier];
  uint64_t v10 = [(TUConversationActivitySessionContainer *)self localMember];
  uint64_t v11 = v9 ^ [v10 hash];
  uint64_t v12 = [(TUConversationActivitySessionContainer *)self remoteMembers];
  uint64_t v13 = v8 ^ v11 ^ [v12 hash];
  int64_t v14 = [(TUConversationActivitySessionContainer *)self state];
  v15 = [(TUConversationActivitySessionContainer *)self UUID];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(TUConversationActivitySessionContainer *)self virtualParticipants];
  uint64_t v18 = v16 ^ [v17 hash];
  uint64_t v19 = [(TUConversationActivitySessionContainer *)self virtualParticipantConfig];
  uint64_t v20 = v13 ^ v18 ^ [v19 hash];
  v21 = [(TUConversationActivitySessionContainer *)self unreliableMessengerConfig];
  unint64_t v22 = v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqualToContainer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivitySessionContainer *)self activeRemoteParticipants];
  uint64_t v6 = [v4 activeRemoteParticipants];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    v7 = [(TUConversationActivitySessionContainer *)self activitySessions];
    uint64_t v8 = [v4 activitySessions];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      unint64_t v9 = [(TUConversationActivitySessionContainer *)self groupUUID];
      uint64_t v10 = [v4 groupUUID];
      if ([v9 isEqual:v10])
      {
        uint64_t v11 = [(TUConversationActivitySessionContainer *)self initiator];
        uint64_t v12 = [v4 initiator];
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          uint64_t v33 = v11;
          unint64_t v13 = [(TUConversationActivitySessionContainer *)self localParticipantIdentifier];
          if (v13 == [v4 localParticipantIdentifier])
          {
            unint64_t v14 = [(TUConversationActivitySessionContainer *)self localMember];
            uint64_t v31 = [v4 localMember];
            v32 = (void *)v14;
            if (TUObjectsAreEqualOrNil(v14, (uint64_t)v31))
            {
              unint64_t v15 = [(TUConversationActivitySessionContainer *)self remoteMembers];
              uint64_t v29 = [v4 remoteMembers];
              v30 = (void *)v15;
              if (TUObjectsAreEqualOrNil(v15, (uint64_t)v29)
                && (int64_t v16 = [(TUConversationActivitySessionContainer *)self state],
                    v16 == [v4 state]))
              {
                v17 = [(TUConversationActivitySessionContainer *)self UUID];
                uint64_t v27 = [v4 UUID];
                id v28 = v17;
                int v18 = objc_msgSend(v17, "isEqual:");
                uint64_t v11 = v33;
                if (v18)
                {
                  v26 = [(TUConversationActivitySessionContainer *)self virtualParticipants];
                  uint64_t v25 = [v4 virtualParticipants];
                  if (TUObjectsAreEqualOrNil((unint64_t)v26, (uint64_t)v25))
                  {
                    v24 = [(TUConversationActivitySessionContainer *)self virtualParticipantConfig];
                    v23 = [v4 virtualParticipantConfig];
                    if (TUObjectsAreEqualOrNil((unint64_t)v24, (uint64_t)v23))
                    {
                      unint64_t v22 = [(TUConversationActivitySessionContainer *)self unreliableMessengerConfig];
                      uint64_t v19 = [v4 unreliableMessengerConfig];
                      char v20 = TUObjectsAreEqualOrNil((unint64_t)v22, (uint64_t)v19);

                      uint64_t v11 = v33;
                    }
                    else
                    {
                      char v20 = 0;
                    }
                  }
                  else
                  {
                    char v20 = 0;
                  }
                }
                else
                {
                  char v20 = 0;
                }
              }
              else
              {
                char v20 = 0;
                uint64_t v11 = v33;
              }
            }
            else
            {
              char v20 = 0;
              uint64_t v11 = v33;
            }
          }
          else
          {
            char v20 = 0;
            uint64_t v11 = v33;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSSet)activitySessions
{
  return self->_activitySessions;
}

- (void)setActivitySessions:(id)a3
{
}

- (NSSet)remoteMembers
{
  return self->_remoteMembers;
}

- (void)setRemoteMembers:(id)a3
{
}

- (TUConversationMember)localMember
{
  return self->_localMember;
}

- (void)setLocalMember:(id)a3
{
}

- (TUHandle)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(id)a3
{
}

- (unint64_t)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (void)setLocalParticipantIdentifier:(unint64_t)a3
{
  self->_localParticipantIdentifier = a3;
}

- (NSSet)virtualParticipants
{
  return self->_virtualParticipants;
}

- (void)setVirtualParticipants:(id)a3
{
}

- (TUConversationVirtualParticipantConfig)virtualParticipantConfig
{
  return self->_virtualParticipantConfig;
}

- (void)setVirtualParticipantConfig:(id)a3
{
}

- (TUConversationUnreliableMessengerConfig)unreliableMessengerConfig
{
  return self->_unreliableMessengerConfig;
}

- (void)setUnreliableMessengerConfig:(id)a3
{
}

- (NSSet)activeRemoteParticipants
{
  return self->_activeRemoteParticipants;
}

- (void)setActiveRemoteParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRemoteParticipants, 0);
  objc_storeStrong((id *)&self->_unreliableMessengerConfig, 0);
  objc_storeStrong((id *)&self->_virtualParticipantConfig, 0);
  objc_storeStrong((id *)&self->_virtualParticipants, 0);
  objc_storeStrong((id *)&self->_initiator, 0);
  objc_storeStrong((id *)&self->_localMember, 0);
  objc_storeStrong((id *)&self->_remoteMembers, 0);
  objc_storeStrong((id *)&self->_activitySessions, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end