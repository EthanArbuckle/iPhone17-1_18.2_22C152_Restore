@interface WFBlacklistStateNode
- (NSString)blacklistedReasonString;
- (NSString)blacklistedStateString;
- (WFBlacklistStateNode)init;
- (double)blacklistedStateTimestamp;
- (int64_t)blacklistedReasonData;
- (unint64_t)blacklistedReason;
- (unint64_t)blacklistedState;
- (void)setBlacklistedReason:(unint64_t)a3;
- (void)setBlacklistedReasonData:(int64_t)a3;
- (void)setBlacklistedReasonString:(id)a3;
- (void)setBlacklistedState:(unint64_t)a3;
- (void)setBlacklistedStateString:(id)a3;
- (void)setBlacklistedStateTimestamp:(double)a3;
@end

@implementation WFBlacklistStateNode

- (WFBlacklistStateNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFBlacklistStateNode;
  return [(WFBlacklistStateNode *)&v3 init];
}

- (unint64_t)blacklistedState
{
  return self->_blacklistedState;
}

- (void)setBlacklistedState:(unint64_t)a3
{
  self->_blacklistedState = a3;
}

- (NSString)blacklistedStateString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBlacklistedStateString:(id)a3
{
}

- (double)blacklistedStateTimestamp
{
  return self->_blacklistedStateTimestamp;
}

- (void)setBlacklistedStateTimestamp:(double)a3
{
  self->_blacklistedStateTimestamp = a3;
}

- (unint64_t)blacklistedReason
{
  return self->_blacklistedReason;
}

- (void)setBlacklistedReason:(unint64_t)a3
{
  self->_blacklistedReason = a3;
}

- (int64_t)blacklistedReasonData
{
  return self->_blacklistedReasonData;
}

- (void)setBlacklistedReasonData:(int64_t)a3
{
  self->_blacklistedReasonData = a3;
}

- (NSString)blacklistedReasonString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBlacklistedReasonString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedReasonString, 0);

  objc_storeStrong((id *)&self->_blacklistedStateString, 0);
}

@end