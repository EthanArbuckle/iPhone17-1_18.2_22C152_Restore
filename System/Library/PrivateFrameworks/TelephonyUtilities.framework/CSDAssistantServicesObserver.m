@interface CSDAssistantServicesObserver
- (AFPreferences)assistantPreferences;
- (AFSiriAnnouncementRequestCapabilityManager)announcementRequestCapabilityManager;
- (BOOL)isAssistantAvailableWhenLocked;
- (CSDAssistantServicesDelegate)delegateController;
- (CSDAssistantServicesObserver)initWithQueue:(id)a3;
- (NSString)announceCallsProviderIdentifier;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (int64_t)announceCallsPlatform;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)availableAnnounceCallsRequestTypes;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)dealloc;
- (void)eligibleAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4;
- (void)handleAFPreferencesDidChangeNotification:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setAnnounceCallsProviderIdentifier:(id)a3;
- (void)setAssistantAvailableWhenLocked:(BOOL)a3;
- (void)setAvailableAnnounceCallsRequestTypes:(unint64_t)a3;
- (void)updateAnnounceCallsVersionForAssistantAvailableWhenLocked:(BOOL)a3;
- (void)updateAnnounceCallsVersionForAssistantAvailableWhenLocked:(BOOL)a3 availableRequestTypes:(unint64_t)a4;
- (void)updateAnnounceCallsVersionForAvailableRequestTypes:(unint64_t)a3;
@end

@implementation CSDAssistantServicesObserver

- (CSDAssistantServicesObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDAssistantServicesObserver;
  v6 = [(CSDAssistantServicesObserver *)&v21 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_announceCallsPlatform = 1;
    objc_storeStrong((id *)&v7->_announceCallsProviderIdentifier, TUBundleIdentifierInCallServiceApplication);
    v8 = (CSDAssistantServicesDelegate *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v7->_delegateController;
    v7->_delegateController = v8;

    v10 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v7->_featureFlags;
    v7->_featureFlags = v10;

    uint64_t v12 = +[AFPreferences sharedPreferences];
    assistantPreferences = v7->_assistantPreferences;
    v7->_assistantPreferences = (AFPreferences *)v12;

    v7->_assistantAvailableWhenLocked = [(AFPreferences *)v7->_assistantPreferences disableAssistantWhilePasscodeLocked] ^ 1;
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"handleAFPreferencesDidChangeNotification:" name:AFPreferencesDidChangeNotification object:v7->_assistantPreferences];

    v15 = (AFSiriAnnouncementRequestCapabilityManager *)[objc_alloc((Class)AFSiriAnnouncementRequestCapabilityManager) initWithPlatform:v7->_announceCallsPlatform];
    announcementRequestCapabilityManager = v7->_announcementRequestCapabilityManager;
    v7->_announcementRequestCapabilityManager = v15;

    [(AFSiriAnnouncementRequestCapabilityManager *)v7->_announcementRequestCapabilityManager addObserver:v7];
    v17 = v7->_announcementRequestCapabilityManager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001A107C;
    v19[3] = &unk_100509650;
    v20 = v7;
    [(AFSiriAnnouncementRequestCapabilityManager *)v17 fetchAvailableAnnouncementRequestTypesWithCompletion:v19];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AFPreferencesDidChangeNotification object:self->_assistantPreferences];

  [(AFSiriAnnouncementRequestCapabilityManager *)self->_announcementRequestCapabilityManager removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)CSDAssistantServicesObserver;
  [(CSDAssistantServicesObserver *)&v4 dealloc];
}

- (NSString)announceCallsProviderIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_announceCallsProviderIdentifier;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setAnnounceCallsProviderIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  if ((TUStringsAreEqualOrNil() & 1) == 0)
  {
    id v5 = (NSString *)[v4 copy];
    announceCallsProviderIdentifier = self->_announceCallsProviderIdentifier;
    self->_announceCallsProviderIdentifier = v5;

    v7 = [(CSDAssistantServicesObserver *)self delegateController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A125C;
    v8[3] = &unk_100509678;
    v8[4] = self;
    id v9 = v4;
    [v7 enumerateDelegatesUsingBlock:v8];
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDAssistantServicesObserver *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDAssistantServicesObserver *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)updateAnnounceCallsVersionForAssistantAvailableWhenLocked:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CSDAssistantServicesObserver *)self availableAnnounceCallsRequestTypes];

  [(CSDAssistantServicesObserver *)self updateAnnounceCallsVersionForAssistantAvailableWhenLocked:v3 availableRequestTypes:v5];
}

- (void)updateAnnounceCallsVersionForAvailableRequestTypes:(unint64_t)a3
{
  BOOL v5 = [(CSDAssistantServicesObserver *)self isAssistantAvailableWhenLocked];

  [(CSDAssistantServicesObserver *)self updateAnnounceCallsVersionForAssistantAvailableWhenLocked:v5 availableRequestTypes:a3];
}

- (void)updateAnnounceCallsVersionForAssistantAvailableWhenLocked:(BOOL)a3 availableRequestTypes:(unint64_t)a4
{
  BOOL v5 = a3;
  if (!a3)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Announce calls with answer prompt is not available; Siri is not available when device is locked.",
        buf,
        2u);
    }
  }
  if ((a4 & 2) == 0)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Announce calls with answer prompt is not available; eligible headphones are not connected.",
        v12,
        2u);
    }
  }
  [(CSDAssistantServicesObserver *)self setAssistantAvailableWhenLocked:v5];
  [(CSDAssistantServicesObserver *)self setAvailableAnnounceCallsRequestTypes:a4];
  if ((a4 & 2) != 0 && v5)
  {
    id v9 = [(CSDAssistantServicesObserver *)self featureFlags];
    unsigned int v10 = [v9 announceCalls];
    v11 = &TUBundleIdentifierCallServicesDaemon;
    if (!v10) {
      v11 = &TUBundleIdentifierInCallServiceApplication;
    }
    [(CSDAssistantServicesObserver *)self setAnnounceCallsProviderIdentifier:*v11];
  }
  else
  {
    [(CSDAssistantServicesObserver *)self setAnnounceCallsProviderIdentifier:TUBundleIdentifierInCallServiceApplication];
  }
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  if ([(CSDAssistantServicesObserver *)self announceCallsPlatform] == a4)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      int64_t v9 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Available announcement request types changed for platform %ld", (uint8_t *)&v8, 0xCu);
    }

    [(CSDAssistantServicesObserver *)self updateAnnounceCallsVersionForAvailableRequestTypes:a3];
  }
}

- (void)eligibleAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  if ([(CSDAssistantServicesObserver *)self announceCallsPlatform] == a4)
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int64_t v7 = a4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Eligible announcement request types changed for platform %ld", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleAFPreferencesDidChangeNotification:(id)a3
{
  id v4 = [(CSDAssistantServicesObserver *)self assistantPreferences];
  unsigned int v5 = [v4 disableAssistantWhilePasscodeLocked];

  if (v5 == [(CSDAssistantServicesObserver *)self isAssistantAvailableWhenLocked])
  {
    [(CSDAssistantServicesObserver *)self updateAnnounceCallsVersionForAssistantAvailableWhenLocked:v5 ^ 1];
  }
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AFSiriAnnouncementRequestCapabilityManager)announcementRequestCapabilityManager
{
  return self->_announcementRequestCapabilityManager;
}

- (AFPreferences)assistantPreferences
{
  return self->_assistantPreferences;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (int64_t)announceCallsPlatform
{
  return self->_announceCallsPlatform;
}

- (BOOL)isAssistantAvailableWhenLocked
{
  return self->_assistantAvailableWhenLocked;
}

- (void)setAssistantAvailableWhenLocked:(BOOL)a3
{
  self->_assistantAvailableWhenLocked = a3;
}

- (unint64_t)availableAnnounceCallsRequestTypes
{
  return self->_availableAnnounceCallsRequestTypes;
}

- (void)setAvailableAnnounceCallsRequestTypes:(unint64_t)a3
{
  self->_availableAnnounceCallsRequestTypes = a3;
}

- (CSDAssistantServicesDelegate)delegateController
{
  return self->_delegateController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_assistantPreferences, 0);
  objc_storeStrong((id *)&self->_announcementRequestCapabilityManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_announceCallsProviderIdentifier, 0);
}

@end