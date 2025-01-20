@interface TUJoinContinuityConversationRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestForJoinWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5;
+ (id)requestForStagingAreaWithUUID:(id)a3;
- (BOOL)isAudioEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)wantsStagingArea;
- (NSUUID)uuid;
- (TUJoinContinuityConversationRequest)initWithCoder:(id)a3;
- (TUJoinContinuityConversationRequest)initWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5 wantsStagingArea:(BOOL)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUJoinContinuityConversationRequest

+ (id)requestForStagingAreaWithUUID:(id)a3
{
  id v3 = a3;
  v4 = [[TUJoinContinuityConversationRequest alloc] initWithUUID:v3 isAudioEnabled:1 isVideoEnabled:1 wantsStagingArea:1];

  return v4;
}

+ (id)requestForJoinWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [[TUJoinContinuityConversationRequest alloc] initWithUUID:v7 isAudioEnabled:v6 isVideoEnabled:v5 wantsStagingArea:0];

  return v8;
}

- (TUJoinContinuityConversationRequest)initWithUUID:(id)a3 isAudioEnabled:(BOOL)a4 isVideoEnabled:(BOOL)a5 wantsStagingArea:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUJoinContinuityConversationRequest;
  v11 = [(TUJoinContinuityConversationRequest *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v11->_isAudioEnabled = a4;
    v11->_isVideoEnabled = a5;
    v11->_wantsStagingArea = a6;
  }

  return v11;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  [v6 appendFormat:@" uuid=%@", self->_uuid];
  objc_msgSend(v6, "appendFormat:", @" isAudioEnabled=%d", self->_isAudioEnabled);
  objc_msgSend(v6, "appendFormat:", @" isVideoEnabled=%d", self->_isVideoEnabled);
  objc_msgSend(v6, "appendFormat:", @" wantsStagingArea=%d", self->_wantsStagingArea);
  [v6 appendFormat:@">"];
  id v7 = (void *)[v6 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUJoinContinuityConversationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = NSStringFromSelector(sel_uuid);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = NSStringFromSelector(sel_isAudioEnabled);
  uint64_t v9 = [v4 decodeBoolForKey:v8];
  id v10 = NSStringFromSelector(sel_isVideoEnabled);
  uint64_t v11 = [v4 decodeBoolForKey:v10];
  uint64_t v12 = NSStringFromSelector(sel_wantsStagingArea);
  uint64_t v13 = [v4 decodeBoolForKey:v12];

  v14 = [(TUJoinContinuityConversationRequest *)self initWithUUID:v7 isAudioEnabled:v9 isVideoEnabled:v11 wantsStagingArea:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  BOOL v6 = NSStringFromSelector(sel_uuid);
  [v5 encodeObject:uuid forKey:v6];

  BOOL isAudioEnabled = self->_isAudioEnabled;
  v8 = NSStringFromSelector(sel_isAudioEnabled);
  [v5 encodeBool:isAudioEnabled forKey:v8];

  BOOL isVideoEnabled = self->_isVideoEnabled;
  id v10 = NSStringFromSelector(sel_isVideoEnabled);
  [v5 encodeBool:isVideoEnabled forKey:v10];

  BOOL wantsStagingArea = self->_wantsStagingArea;
  NSStringFromSelector(sel_wantsStagingArea);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:wantsStagingArea forKey:v12];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isAudioEnabled
{
  return self->_isAudioEnabled;
}

- (BOOL)isVideoEnabled
{
  return self->_isVideoEnabled;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void).cxx_destruct
{
}

@end