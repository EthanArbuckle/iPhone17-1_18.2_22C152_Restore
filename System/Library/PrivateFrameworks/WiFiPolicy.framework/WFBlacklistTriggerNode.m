@interface WFBlacklistTriggerNode
- (NSString)bssid;
- (NSString)triggerReasonString;
- (WFBlacklistTriggerNode)init;
- (double)triggerReasonTimestamp;
- (int64_t)triggerReasonData;
- (unint64_t)triggerReason;
- (void)setBssid:(id)a3;
- (void)setTriggerReason:(unint64_t)a3;
- (void)setTriggerReasonData:(int64_t)a3;
- (void)setTriggerReasonString:(id)a3;
- (void)setTriggerReasonTimestamp:(double)a3;
@end

@implementation WFBlacklistTriggerNode

- (WFBlacklistTriggerNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFBlacklistTriggerNode;
  return [(WFBlacklistTriggerNode *)&v3 init];
}

- (unint64_t)triggerReason
{
  return self->_triggerReason;
}

- (void)setTriggerReason:(unint64_t)a3
{
  self->_triggerReason = a3;
}

- (int64_t)triggerReasonData
{
  return self->_triggerReasonData;
}

- (void)setTriggerReasonData:(int64_t)a3
{
  self->_triggerReasonData = a3;
}

- (NSString)triggerReasonString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTriggerReasonString:(id)a3
{
}

- (double)triggerReasonTimestamp
{
  return self->_triggerReasonTimestamp;
}

- (void)setTriggerReasonTimestamp:(double)a3
{
  self->_triggerReasonTimestamp = a3;
}

- (NSString)bssid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBssid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssid, 0);

  objc_storeStrong((id *)&self->_triggerReasonString, 0);
}

@end