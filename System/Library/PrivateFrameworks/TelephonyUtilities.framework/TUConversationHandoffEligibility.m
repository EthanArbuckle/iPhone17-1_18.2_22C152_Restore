@interface TUConversationHandoffEligibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandoffEligibility:(id)a3;
- (BOOL)isSendingVideo;
- (BOOL)isUplinkMuted;
- (NSString)localizedDeviceCategory;
- (NSString)originatingDeviceType;
- (NSUUID)conversationGroupUUID;
- (TUConversationHandoffEligibility)initWithCoder:(id)a3;
- (TUConversationHandoffEligibility)initWithHandoffEligibility:(id)a3;
- (TUConversationParticipantAssociation)association;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociation:(id)a3;
- (void)setConversationGroupUUID:(id)a3;
- (void)setEligible:(BOOL)a3;
- (void)setOriginatingDeviceType:(id)a3;
- (void)setSendingVideo:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
@end

@implementation TUConversationHandoffEligibility

- (TUConversationHandoffEligibility)initWithHandoffEligibility:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUConversationHandoffEligibility;
  v5 = [(TUConversationHandoffEligibility *)&v13 init];
  if (v5)
  {
    v5->_eligible = [v4 isEligible];
    v5->_uplinkMuted = [v4 isUplinkMuted];
    v5->_sendingVideo = [v4 isSendingVideo];
    uint64_t v6 = [v4 conversationGroupUUID];
    conversationGroupUUID = v5->_conversationGroupUUID;
    v5->_conversationGroupUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 association];
    association = v5->_association;
    v5->_association = (TUConversationParticipantAssociation *)v8;

    uint64_t v10 = [v4 originatingDeviceType];
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v10;
  }
  return v5;
}

- (NSString)localizedDeviceCategory
{
  v3 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  if ([v3 containsString:@"com.apple.iphone"])
  {

LABEL_4:
    uint64_t v6 = TUBundle();
    v7 = v6;
    uint64_t v8 = @"IPHONE";
LABEL_9:
    v12 = [v6 localizedStringForKey:v8 value:&stru_1EECEA668 table:@"TelephonyUtilities"];

    goto LABEL_10;
  }
  id v4 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  int v5 = [v4 containsString:@"com.apple.homebuttonless-iphone"];

  if (v5) {
    goto LABEL_4;
  }
  v9 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  if ([v9 containsString:@"com.apple.ipad"])
  {

LABEL_8:
    uint64_t v6 = TUBundle();
    v7 = v6;
    uint64_t v8 = @"IPAD";
    goto LABEL_9;
  }
  uint64_t v10 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  int v11 = [v10 containsString:@"com.apple.homebuttonless-ipad"];

  if (v11) {
    goto LABEL_8;
  }
  v14 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  int v15 = [v14 containsString:@"com.apple.ipod"];

  if (v15)
  {
    uint64_t v6 = TUBundle();
    v7 = v6;
    uint64_t v8 = @"IPOD";
    goto LABEL_9;
  }
  v16 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  int v17 = [v16 containsString:@"com.apple.mac"];

  if (v17)
  {
    uint64_t v6 = TUBundle();
    v7 = v6;
    uint64_t v8 = @"MAC";
    goto LABEL_9;
  }
  v18 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  int v19 = [v18 containsString:@"com.apple.visionpro"];

  if (v19)
  {
    uint64_t v6 = TUBundle();
    v7 = v6;
    uint64_t v8 = @"VISIONPRO";
    goto LABEL_9;
  }
  v12 = 0;
LABEL_10:

  return (NSString *)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationHandoffEligibility)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TUConversationHandoffEligibility;
  int v5 = [(TUConversationHandoffEligibility *)&v22 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_isEligible);
    v5->_eligible = [v4 decodeBoolForKey:v6];

    v7 = NSStringFromSelector(sel_isUplinkMuted);
    v5->_uplinkMuted = [v4 decodeBoolForKey:v7];

    uint64_t v8 = NSStringFromSelector(sel_isSendingVideo);
    v5->_sendingVideo = [v4 decodeBoolForKey:v8];

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = NSStringFromSelector(sel_conversationGroupUUID);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    conversationGroupUUID = v5->_conversationGroupUUID;
    v5->_conversationGroupUUID = (NSUUID *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_association);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    association = v5->_association;
    v5->_association = (TUConversationParticipantAssociation *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_originatingDeviceType);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    originatingDeviceType = v5->_originatingDeviceType;
    v5->_originatingDeviceType = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationHandoffEligibility *)self isEligible];
  uint64_t v6 = NSStringFromSelector(sel_isEligible);
  [v4 encodeBool:v5 forKey:v6];

  BOOL v7 = [(TUConversationHandoffEligibility *)self isUplinkMuted];
  uint64_t v8 = NSStringFromSelector(sel_isUplinkMuted);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(TUConversationHandoffEligibility *)self isSendingVideo];
  uint64_t v10 = NSStringFromSelector(sel_isSendingVideo);
  [v4 encodeBool:v9 forKey:v10];

  uint64_t v11 = [(TUConversationHandoffEligibility *)self conversationGroupUUID];
  v12 = NSStringFromSelector(sel_conversationGroupUUID);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(TUConversationHandoffEligibility *)self association];
  v14 = NSStringFromSelector(sel_association);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  uint64_t v15 = NSStringFromSelector(sel_originatingDeviceType);
  [v4 encodeObject:v16 forKey:v15];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationHandoffEligibility allocWithZone:a3];

  return [(TUConversationHandoffEligibility *)v4 initWithHandoffEligibility:self];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" isEligible=%d", -[TUConversationHandoffEligibility isEligible](self, "isEligible"));
  objc_msgSend(v3, "appendFormat:", @" isUplinkMuted=%d", -[TUConversationHandoffEligibility isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", @" isSendingVideo=%d", -[TUConversationHandoffEligibility isSendingVideo](self, "isSendingVideo"));
  id v4 = [(TUConversationHandoffEligibility *)self conversationGroupUUID];
  [v3 appendFormat:@" conversationGroupUUID=%@", v4];

  BOOL v5 = [(TUConversationHandoffEligibility *)self association];
  [v3 appendFormat:@" association=%@", v5];

  uint64_t v6 = [(TUConversationHandoffEligibility *)self originatingDeviceType];

  if (v6)
  {
    BOOL v7 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
    [v3 appendFormat:@" originatingDeviceType=%@", v7];
  }
  [v3 appendString:@">"];
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 1231;
  if ([(TUConversationHandoffEligibility *)self isEligible]) {
    uint64_t v4 = 1231;
  }
  else {
    uint64_t v4 = 1237;
  }
  if ([(TUConversationHandoffEligibility *)self isUplinkMuted]) {
    uint64_t v5 = 1231;
  }
  else {
    uint64_t v5 = 1237;
  }
  uint64_t v6 = v5 ^ v4;
  if (![(TUConversationHandoffEligibility *)self isSendingVideo]) {
    uint64_t v3 = 1237;
  }
  BOOL v7 = [(TUConversationHandoffEligibility *)self conversationGroupUUID];
  uint64_t v8 = v6 ^ v3 ^ [v7 hash];
  BOOL v9 = [(TUConversationHandoffEligibility *)self association];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
  unint64_t v12 = v8 ^ v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationHandoffEligibility *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationHandoffEligibility *)self isEqualToHandoffEligibility:v4];
  }

  return v5;
}

- (BOOL)isEqualToHandoffEligibility:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationHandoffEligibility *)self isEligible];
  if (v5 == [v4 isEligible]
    && (int v6 = [(TUConversationHandoffEligibility *)self isUplinkMuted],
        v6 == [v4 isUplinkMuted])
    && (int v7 = [(TUConversationHandoffEligibility *)self isSendingVideo],
        v7 == [v4 isSendingVideo]))
  {
    uint64_t v10 = [(TUConversationHandoffEligibility *)self conversationGroupUUID];
    uint64_t v11 = [v4 conversationGroupUUID];
    if (v10 == v11)
    {
      unint64_t v12 = [(TUConversationHandoffEligibility *)self association];
      uint64_t v13 = [v4 association];
      if ([v12 isEqual:v13])
      {
        v14 = [(TUConversationHandoffEligibility *)self originatingDeviceType];
        uint64_t v15 = [v4 originatingDeviceType];
        char v8 = TUObjectsAreEqualOrNil((unint64_t)v14, (uint64_t)v15);
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (void)setEligible:(BOOL)a3
{
  self->_eligible = a3;
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (void)setUplinkMuted:(BOOL)a3
{
  self->_uplinkMuted = a3;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (void)setSendingVideo:(BOOL)a3
{
  self->_sendingVideo = a3;
}

- (NSUUID)conversationGroupUUID
{
  return self->_conversationGroupUUID;
}

- (void)setConversationGroupUUID:(id)a3
{
}

- (TUConversationParticipantAssociation)association
{
  return self->_association;
}

- (void)setAssociation:(id)a3
{
}

- (NSString)originatingDeviceType
{
  return self->_originatingDeviceType;
}

- (void)setOriginatingDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingDeviceType, 0);
  objc_storeStrong((id *)&self->_association, 0);

  objc_storeStrong((id *)&self->_conversationGroupUUID, 0);
}

@end