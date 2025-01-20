@interface TUContinuityConversation
+ (BOOL)supportsSecureCoding;
- (NSArray)remoteMemberContactIdentifiers;
- (NSData)handlesHash;
- (NSNumber)state;
- (NSString)displayName;
- (NSUUID)uuid;
- (TUContinuityConversation)initWithCoder:(id)a3;
- (TUContinuityConversation)initWithUUID:(id)a3 displayName:(id)a4 state:(id)a5 avMode:(unint64_t)a6 remoteMemberCount:(int64_t)a7 remoteMemberContactIdentifiers:(id)a8 letMeInRequestState:(int64_t)a9 handlesHash:(id)a10;
- (id)description;
- (int64_t)letMeInRequestState;
- (int64_t)remoteMemberCount;
- (unint64_t)avMode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuityConversation

- (TUContinuityConversation)initWithUUID:(id)a3 displayName:(id)a4 state:(id)a5 avMode:(unint64_t)a6 remoteMemberCount:(int64_t)a7 remoteMemberContactIdentifiers:(id)a8 letMeInRequestState:(int64_t)a9 handlesHash:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a10;
  v33.receiver = self;
  v33.super_class = (Class)TUContinuityConversation;
  v21 = [(TUContinuityConversation *)&v33 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    uuid = v21->_uuid;
    v21->_uuid = (NSUUID *)v22;

    uint64_t v24 = [v17 copy];
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    state = v21->_state;
    v21->_state = (NSNumber *)v26;

    v21->_avMode = a6;
    v21->_remoteMemberCount = a7;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithArray:v19];
    remoteMemberContactIdentifiers = v21->_remoteMemberContactIdentifiers;
    v21->_remoteMemberContactIdentifiers = (NSArray *)v28;

    v21->_letMeInRequestState = a9;
    uint64_t v30 = [v20 copy];
    handlesHash = v21->_handlesHash;
    v21->_handlesHash = (NSData *)v30;
  }
  return v21;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" uuid=%@", self->_uuid];
  [v6 appendFormat:@" displayName=%@", self->_displayName];
  [v6 appendFormat:@" state=%@", self->_state];
  objc_msgSend(v6, "appendFormat:", @" avMode=%zd", self->_avMode);
  objc_msgSend(v6, "appendFormat:", @" letMeInRequestState=%zd", self->_letMeInRequestState);
  objc_msgSend(v6, "appendFormat:", @" remoteMemberCount=%zd", self->_remoteMemberCount);
  objc_msgSend(v6, "appendFormat:", @" remoteMemberContactIdentifiersCount=%zd", -[NSArray count](self->_remoteMemberContactIdentifiers, "count"));
  [v6 appendFormat:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityConversation)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v27 = NSStringFromSelector(sel_uuid);
  v23 = [v3 decodeObjectOfClass:v4 forKey:v27];
  uint64_t v5 = objc_opt_class();
  uint64_t v26 = NSStringFromSelector(sel_displayName);
  v6 = [v3 decodeObjectOfClass:v5 forKey:v26];
  uint64_t v7 = objc_opt_class();
  uint64_t v24 = NSStringFromSelector(sel_state);
  v21 = [v3 decodeObjectOfClass:v7 forKey:v24];
  uint64_t v22 = NSStringFromSelector(sel_avMode);
  uint64_t v20 = [v3 decodeIntegerForKey:v22];
  v8 = NSStringFromSelector(sel_remoteMemberCount);
  uint64_t v9 = [v3 decodeIntegerForKey:v8];
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_remoteMemberContactIdentifiers);
  v12 = [v3 decodeArrayOfObjectsOfClass:v10 forKey:v11];
  v13 = NSStringFromSelector(sel_letMeInRequestState);
  uint64_t v14 = [v3 decodeIntegerForKey:v13];
  uint64_t v15 = objc_opt_class();
  id v16 = NSStringFromSelector(sel_handlesHash);
  id v17 = [v3 decodeObjectOfClass:v15 forKey:v16];

  id v18 = [(TUContinuityConversation *)self initWithUUID:v23 displayName:v6 state:v21 avMode:v20 remoteMemberCount:v9 remoteMemberContactIdentifiers:v12 letMeInRequestState:v14 handlesHash:v17];
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_uuid);
  [v5 encodeObject:uuid forKey:v6];

  displayName = self->_displayName;
  v8 = NSStringFromSelector(sel_displayName);
  [v5 encodeObject:displayName forKey:v8];

  state = self->_state;
  uint64_t v10 = NSStringFromSelector(sel_state);
  [v5 encodeObject:state forKey:v10];

  unint64_t avMode = self->_avMode;
  v12 = NSStringFromSelector(sel_avMode);
  [v5 encodeInteger:avMode forKey:v12];

  int64_t letMeInRequestState = self->_letMeInRequestState;
  uint64_t v14 = NSStringFromSelector(sel_letMeInRequestState);
  [v5 encodeInteger:letMeInRequestState forKey:v14];

  int64_t remoteMemberCount = self->_remoteMemberCount;
  id v16 = NSStringFromSelector(sel_remoteMemberCount);
  [v5 encodeInteger:remoteMemberCount forKey:v16];

  remoteMemberContactIdentifiers = self->_remoteMemberContactIdentifiers;
  id v18 = NSStringFromSelector(sel_remoteMemberContactIdentifiers);
  [v5 encodeObject:remoteMemberContactIdentifiers forKey:v18];

  handlesHash = self->_handlesHash;
  NSStringFromSelector(sel_handlesHash);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:handlesHash forKey:v20];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (int64_t)letMeInRequestState
{
  return self->_letMeInRequestState;
}

- (NSNumber)state
{
  return self->_state;
}

- (int64_t)remoteMemberCount
{
  return self->_remoteMemberCount;
}

- (NSArray)remoteMemberContactIdentifiers
{
  return self->_remoteMemberContactIdentifiers;
}

- (NSData)handlesHash
{
  return self->_handlesHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlesHash, 0);
  objc_storeStrong((id *)&self->_remoteMemberContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end