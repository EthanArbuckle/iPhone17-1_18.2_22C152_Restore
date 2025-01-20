@interface SKADatabaseSubscriptionAssertion
- (NSString)applicationIdentifier;
- (NSString)channelIdentifier;
- (NSString)statusTypeIdentifier;
- (SKADatabaseSubscriptionAssertion)initWithChannelIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5;
- (SKADatabaseSubscriptionAssertion)initWithCoreDataSubscriptionAssertion:(id)a3;
@end

@implementation SKADatabaseSubscriptionAssertion

- (SKADatabaseSubscriptionAssertion)initWithCoreDataSubscriptionAssertion:(id)a3
{
  id v4 = a3;
  v5 = [v4 channelIdentifier];
  v6 = [v4 statusTypeIdentifier];
  v7 = [v4 applicationIdentifier];

  v8 = [(SKADatabaseSubscriptionAssertion *)self initWithChannelIdentifier:v5 statusTypeIdentifier:v6 applicationIdentifier:v7];
  return v8;
}

- (SKADatabaseSubscriptionAssertion)initWithChannelIdentifier:(id)a3 statusTypeIdentifier:(id)a4 applicationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SKADatabaseSubscriptionAssertion;
  v11 = [(SKADatabaseSubscriptionAssertion *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    channelIdentifier = v11->_channelIdentifier;
    v11->_channelIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    statusTypeIdentifier = v11->_statusTypeIdentifier;
    v11->_statusTypeIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = (NSString *)v16;
  }
  return v11;
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end