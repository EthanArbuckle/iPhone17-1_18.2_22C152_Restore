@interface IdentifyIncomingCallerIntentHandlerDefaultDataSource
- (CallHistoryDataSource)callHistoryDataSource;
- (CoreTelephonyDataSource)coreTelephonyDataSource;
- (TUCallProviderManager)providerManager;
- (TUContactsDataSource)contactsDataSource;
@end

@implementation IdentifyIncomingCallerIntentHandlerDefaultDataSource

- (CallHistoryDataSource)callHistoryDataSource
{
  callHistoryDataSource = self->_callHistoryDataSource;
  if (!callHistoryDataSource)
  {
    v4 = +[CHManager siriManagerForIntentType:objc_opt_class()];
    v5 = self->_callHistoryDataSource;
    self->_callHistoryDataSource = v4;

    callHistoryDataSource = self->_callHistoryDataSource;
  }

  return callHistoryDataSource;
}

- (TUContactsDataSource)contactsDataSource
{
  v2 = +[TUCallCenter sharedInstance];
  v3 = [v2 contactStore];

  return (TUContactsDataSource *)v3;
}

- (CoreTelephonyDataSource)coreTelephonyDataSource
{
  return (CoreTelephonyDataSource *)+[DefaultCoreTelephonyDataSource sharedInstance];
}

- (TUCallProviderManager)providerManager
{
  providerManager = self->_providerManager;
  if (!providerManager)
  {
    v4 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    v5 = self->_providerManager;
    self->_providerManager = v4;

    providerManager = self->_providerManager;
  }

  return providerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerManager, 0);

  objc_storeStrong((id *)&self->_callHistoryDataSource, 0);
}

@end