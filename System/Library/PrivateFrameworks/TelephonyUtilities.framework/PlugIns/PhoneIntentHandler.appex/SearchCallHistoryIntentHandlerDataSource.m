@interface SearchCallHistoryIntentHandlerDataSource
- (CNContactStore)contactStore;
- (CallHistoryDataSource)callHistoryDataSource;
- (CoreTelephonyDataSource)coreTelephonyDataSource;
- (IntentHandlerVoicemailDataSource)voicemailDataSource;
- (TUCallProviderManager)providerManager;
- (TUContactsDataSource)contactsDataSource;
- (unint64_t)restrictedCallTypes;
@end

@implementation SearchCallHistoryIntentHandlerDataSource

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

- (IntentHandlerVoicemailDataSource)voicemailDataSource
{
  voicemailDataSource = self->_voicemailDataSource;
  if (!voicemailDataSource)
  {
    v4 = +[IntentHandlerMessageStore sharedInstance];
    v5 = self->_voicemailDataSource;
    self->_voicemailDataSource = v4;

    voicemailDataSource = self->_voicemailDataSource;
  }

  return voicemailDataSource;
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

- (unint64_t)restrictedCallTypes
{
  unint64_t v2 = !+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling")|| (+[TUCallCapabilities supportsTelephonyCalls] & 1) == 0;
  v3 = +[FaceTimeUtilities sharedInstance];
  unsigned __int8 v4 = [v3 isFaceTimeEnabledInSettings];

  if ((v4 & 1) == 0) {
    return v2 | 6;
  }
  if ((+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls] & 1) == 0)return v2 | 2; {
  if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])return v2;
  }
  return v2 | 4;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_voicemailDataSource, 0);
  objc_storeStrong((id *)&self->_providerManager, 0);

  objc_storeStrong((id *)&self->_callHistoryDataSource, 0);
}

@end