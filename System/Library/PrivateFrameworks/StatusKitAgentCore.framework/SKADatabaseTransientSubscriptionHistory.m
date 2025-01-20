@interface SKADatabaseTransientSubscriptionHistory
- (NSDate)lastSubscriptionDate;
- (NSString)channelIdentifier;
- (SKADatabaseTransientSubscriptionHistory)initWithChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4;
- (SKADatabaseTransientSubscriptionHistory)initWithCoreDataTransientSubscriptionHistory:(id)a3;
@end

@implementation SKADatabaseTransientSubscriptionHistory

- (SKADatabaseTransientSubscriptionHistory)initWithCoreDataTransientSubscriptionHistory:(id)a3
{
  id v4 = a3;
  v5 = [v4 channelIdentifier];
  v6 = [v4 lastSubscriptionDate];

  v7 = [(SKADatabaseTransientSubscriptionHistory *)self initWithChannelIdentifier:v5 lastSubscriptionDate:v6];
  return v7;
}

- (SKADatabaseTransientSubscriptionHistory)initWithChannelIdentifier:(id)a3 lastSubscriptionDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SKADatabaseTransientSubscriptionHistory;
  v8 = [(SKADatabaseTransientSubscriptionHistory *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    channelIdentifier = v8->_channelIdentifier;
    v8->_channelIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    lastSubscriptionDate = v8->_lastSubscriptionDate;
    v8->_lastSubscriptionDate = (NSDate *)v11;
  }
  return v8;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSDate)lastSubscriptionDate
{
  return self->_lastSubscriptionDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSubscriptionDate, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end