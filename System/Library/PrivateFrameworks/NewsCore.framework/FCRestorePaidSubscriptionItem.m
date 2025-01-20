@interface FCRestorePaidSubscriptionItem
- (BOOL)isNewsAppPurchase;
- (FCRestorePaidSubscriptionItem)initWithChannelID:(id)a3 isNewsAppPurchase:(BOOL)a4;
- (NSString)channelID;
@end

@implementation FCRestorePaidSubscriptionItem

- (FCRestorePaidSubscriptionItem)initWithChannelID:(id)a3 isNewsAppPurchase:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCRestorePaidSubscriptionItem;
  v8 = [(FCRestorePaidSubscriptionItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channelID, a3);
    v9->_isNewsAppPurchase = a4;
  }

  return v9;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (BOOL)isNewsAppPurchase
{
  return self->_isNewsAppPurchase;
}

- (void).cxx_destruct
{
}

@end