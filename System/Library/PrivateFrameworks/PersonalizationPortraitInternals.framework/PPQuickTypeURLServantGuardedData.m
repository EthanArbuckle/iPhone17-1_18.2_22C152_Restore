@interface PPQuickTypeURLServantGuardedData
- (void)reset;
@end

@implementation PPQuickTypeURLServantGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBundleId, 0);
  objc_storeStrong((id *)&self->_tuConversationLink, 0);
  objc_storeStrong((id *)&self->_lastItem, 0);
}

- (void)reset
{
  lastItem = self->_lastItem;
  self->_lastItem = 0;

  tuConversationLink = self->_tuConversationLink;
  self->_tuConversationLink = 0;

  lastBundleId = self->_lastBundleId;
  self->_lastBundleId = 0;
}

@end