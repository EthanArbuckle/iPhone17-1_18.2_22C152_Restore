@interface CSDPTTApplicationMessage
- (BOOL)isServiceUpdateMessage;
- (BOOL)isWakingMessage;
- (NSUUID)channelUUID;
- (id)description;
- (id)reply;
- (int64_t)remainingHighPriorityServiceUpdateBudget;
- (void)setChannelUUID:(id)a3;
- (void)setIsServiceUpdateMessage:(BOOL)a3;
- (void)setIsWakingMessage:(BOOL)a3;
- (void)setRemainingHighPriorityServiceUpdateBudget:(int64_t)a3;
- (void)setReply:(id)a3;
@end

@implementation CSDPTTApplicationMessage

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)CSDPTTApplicationMessage;
  v3 = [(CSDVoIPApplicationMessage *)&v11 description];
  id v4 = [v3 mutableCopy];

  [v4 appendFormat:@"<(PTT message), "];
  v5 = NSStringFromSelector("channelUUID");
  v6 = [(CSDPTTApplicationMessage *)self channelUUID];
  [v4 appendFormat:@"%@=%@", v5, v6];

  [v4 appendFormat:@", "];
  v7 = NSStringFromSelector("isServiceUpdateMessage");
  [v4 appendFormat:@"%@=%d", v7, -[CSDPTTApplicationMessage isServiceUpdateMessage](self, "isServiceUpdateMessage")];

  [v4 appendFormat:@", "];
  v8 = NSStringFromSelector("isWakingMessage");
  [v4 appendFormat:@"%@=%d", v8, -[CSDPTTApplicationMessage isWakingMessage](self, "isWakingMessage")];

  [v4 appendFormat:@", "];
  v9 = NSStringFromSelector("remainingHighPriorityServiceUpdateBudget");
  [v4 appendFormat:@"%@=%zd", v9, -[CSDPTTApplicationMessage remainingHighPriorityServiceUpdateBudget](self, "remainingHighPriorityServiceUpdateBudget")];

  [v4 appendFormat:@">"];

  return v4;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (NSUUID)channelUUID
{
  return self->_channelUUID;
}

- (void)setChannelUUID:(id)a3
{
}

- (BOOL)isServiceUpdateMessage
{
  return self->_isServiceUpdateMessage;
}

- (void)setIsServiceUpdateMessage:(BOOL)a3
{
  self->_isServiceUpdateMessage = a3;
}

- (BOOL)isWakingMessage
{
  return self->_isWakingMessage;
}

- (void)setIsWakingMessage:(BOOL)a3
{
  self->_isWakingMessage = a3;
}

- (int64_t)remainingHighPriorityServiceUpdateBudget
{
  return self->_remainingHighPriorityServiceUpdateBudget;
}

- (void)setRemainingHighPriorityServiceUpdateBudget:(int64_t)a3
{
  self->_remainingHighPriorityServiceUpdateBudget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelUUID, 0);

  objc_storeStrong(&self->_reply, 0);
}

@end