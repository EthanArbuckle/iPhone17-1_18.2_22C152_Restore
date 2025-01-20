@interface TUContinuityCall
+ (BOOL)supportsSecureCoding;
- (BOOL)isBranded;
- (NSArray)remoteMemberContactIdentifiers;
- (NSNumber)isCameraEnabled;
- (NSNumber)isMuted;
- (NSString)callerIdSubstring;
- (NSString)displayName;
- (NSUUID)callGroupUUID;
- (NSUUID)conversationUUID;
- (NSUUID)uuid;
- (TUContinuityCall)initWithCoder:(id)a3;
- (TUContinuityCall)initWithUUID:(id)a3 conversationUUID:(id)a4 callGroupUUID:(id)a5 status:(int)a6 isMuted:(id)a7 isCameraEnabled:(id)a8 callInfo:(id)a9;
- (TUContinuityCallInfo)callInfo;
- (id)description;
- (int)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUContinuityCall

- (TUContinuityCall)initWithUUID:(id)a3 conversationUUID:(id)a4 callGroupUUID:(id)a5 status:(int)a6 isMuted:(id)a7 isCameraEnabled:(id)a8 callInfo:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)TUContinuityCall;
  v21 = [(TUContinuityCall *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    uuid = v21->_uuid;
    v21->_uuid = (NSUUID *)v22;

    uint64_t v24 = [v17 copy];
    callGroupUUID = v21->_callGroupUUID;
    v21->_callGroupUUID = (NSUUID *)v24;

    uint64_t v26 = [v20 copy];
    callInfo = v21->_callInfo;
    v21->_callInfo = (TUContinuityCallInfo *)v26;

    v21->_status = a6;
    uint64_t v28 = [v16 copy];
    conversationUUID = v21->_conversationUUID;
    v21->_conversationUUID = (NSUUID *)v28;

    uint64_t v30 = [v18 copy];
    isMuted = v21->_isMuted;
    v21->_isMuted = (NSNumber *)v30;

    uint64_t v32 = [v19 copy];
    isCameraEnabled = v21->_isCameraEnabled;
    v21->_isCameraEnabled = (NSNumber *)v32;
  }
  return v21;
}

- (NSString)displayName
{
  return [(TUContinuityCallInfo *)self->_callInfo displayName];
}

- (NSString)callerIdSubstring
{
  return [(TUContinuityCallInfo *)self->_callInfo callerIdSubstring];
}

- (BOOL)isBranded
{
  return [(TUContinuityCallInfo *)self->_callInfo isBranded];
}

- (NSArray)remoteMemberContactIdentifiers
{
  v2 = [(TUContinuityCallInfo *)self->_callInfo contactIdentifiersByHandle];
  v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  objc_msgSend(v6, "appendFormat:", @" status=%i", self->_status);
  [v6 appendFormat:@" conversationUUID=%@", self->_conversationUUID];
  [v6 appendFormat:@" isMuted=%@", self->_isMuted];
  [v6 appendFormat:@" isCameraEnabled=%@", self->_isCameraEnabled];
  [v6 appendFormat:@" callGroupUUID=%@", self->_callGroupUUID];
  v7 = [(TUContinuityCallInfo *)self->_callInfo description];
  [v6 appendFormat:@" callInfo=%@", v7];

  [v6 appendFormat:@">"];
  v8 = (void *)[v6 copy];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityCall)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v26 = NSStringFromSelector(sel_uuid);
  v23 = [v4 decodeObjectOfClass:v5 forKey:v26];
  uint64_t v6 = objc_opt_class();
  v25 = NSStringFromSelector(sel_conversationUUID);
  v7 = [v4 decodeObjectOfClass:v6 forKey:v25];
  uint64_t v8 = objc_opt_class();
  uint64_t v24 = NSStringFromSelector(sel_callGroupUUID);
  v21 = [v4 decodeObjectOfClass:v8 forKey:v24];
  uint64_t v22 = NSStringFromSelector(sel_status);
  uint64_t v9 = [v4 decodeIntForKey:v22];
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(sel_isMuted);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
  uint64_t v13 = objc_opt_class();
  v14 = NSStringFromSelector(sel_isCameraEnabled);
  id v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_callInfo);
  id v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  id v19 = [(TUContinuityCall *)self initWithUUID:v23 conversationUUID:v7 callGroupUUID:v21 status:v9 isMuted:v12 isCameraEnabled:v15 callInfo:v18];
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_uuid);
  [v5 encodeObject:uuid forKey:v6];

  callInfo = self->_callInfo;
  uint64_t v8 = NSStringFromSelector(sel_callInfo);
  [v5 encodeObject:callInfo forKey:v8];

  uint64_t status = self->_status;
  uint64_t v10 = NSStringFromSelector(sel_status);
  [v5 encodeInt:status forKey:v10];

  conversationUUID = self->_conversationUUID;
  v12 = NSStringFromSelector(sel_conversationUUID);
  [v5 encodeObject:conversationUUID forKey:v12];

  isMuted = self->_isMuted;
  v14 = NSStringFromSelector(sel_isMuted);
  [v5 encodeObject:isMuted forKey:v14];

  isCameraEnabled = self->_isCameraEnabled;
  uint64_t v16 = NSStringFromSelector(sel_isCameraEnabled);
  [v5 encodeObject:isCameraEnabled forKey:v16];

  callGroupUUID = self->_callGroupUUID;
  NSStringFromSelector(sel_callGroupUUID);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:callGroupUUID forKey:v18];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int)status
{
  return self->_status;
}

- (NSUUID)conversationUUID
{
  return self->_conversationUUID;
}

- (NSNumber)isMuted
{
  return self->_isMuted;
}

- (NSNumber)isCameraEnabled
{
  return self->_isCameraEnabled;
}

- (NSUUID)callGroupUUID
{
  return self->_callGroupUUID;
}

- (TUContinuityCallInfo)callInfo
{
  return self->_callInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callInfo, 0);
  objc_storeStrong((id *)&self->_callGroupUUID, 0);
  objc_storeStrong((id *)&self->_isCameraEnabled, 0);
  objc_storeStrong((id *)&self->_isMuted, 0);
  objc_storeStrong((id *)&self->_conversationUUID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end