@interface MRExpanseManager
+ (MRExpanseManager)sharedManager;
- (AVAudioSession)auxiliaryPlaybackAudioSession;
- (BOOL)activeActivityExistsForBundle:(id)a3;
- (BOOL)deviceIsActiveTelevision:(id)a3;
- (BOOL)errorIsTelevisionCapabilitiesError:(id)a3;
- (BOOL)expanseHandoffSupported;
- (BOOL)expanseSessionActive;
- (BOOL)expanseSessionHasActiveActivity;
- (BOOL)expanseSessionHasRemoteActivity;
- (BOOL)expanseSessionHasScreenSharingActivity;
- (MRExpanseManager)initWithQueue:(id)a3;
- (NSHashTable)observers;
- (NSString)activeTelevisionRouteID;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)queue;
- (TUConversationManager)conversationManager;
- (TUNeighborhoodActivityConduit)conduit;
- (id)activeConversation;
- (void)_handleConversationStateChanged;
- (void)_handleExpanseSessionJoined;
- (void)_handleExpanseSessionLeft;
- (void)_notifyObserversThatExpanseSessionJoined;
- (void)_notifyObserversThatExpanseSessionLeft;
- (void)_notifyObserversThatTelevisionJoinedSession;
- (void)_notifyObserversThatTelevisionLeftSession;
- (void)addObserver:(id)a3;
- (void)addTelevisionWithRouteIdentifierToSession:(id)a3 completion:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4;
- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeTelevisionWithRouteIdentifierFromSession:(id)a3 completion:(id)a4;
- (void)serverDisconnectedForConversationManager:(id)a3;
- (void)setAuxiliaryPlaybackAudioSession:(id)a3;
@end

@implementation MRExpanseManager

+ (MRExpanseManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)sharedManager___manager;

  return (MRExpanseManager *)v2;
}

- (BOOL)expanseSessionHasScreenSharingActivity
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(MRExpanseManager *)self activeConversation];
  v3 = [v2 activitySessions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v8 state] == 1)
        {
          v9 = _MRLogForCategory(2uLL);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local activity found.", v15, 2u);
          }

          v10 = [v8 activity];
          int v11 = [v10 isScreenSharingActivity];

          if (v11)
          {
            v13 = _MRLogForCategory(2uLL);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v15 = 0;
              _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local screen sharing activity found.", v15, 2u);
            }

            BOOL v12 = 1;
            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No screen sharing activity found.", v15, 2u);
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (id)activeConversation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MRExpanseManager *)self conversationManager];
  v3 = [v2 activeConversations];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 state] == 3)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

void __33__MRExpanseManager_sharedManager__block_invoke()
{
  v0 = [MRExpanseManager alloc];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.amp.MediaRemote.MRExpanseManager.shared", v4);
  uint64_t v2 = [(MRExpanseManager *)v0 initWithQueue:v1];
  v3 = (void *)sharedManager___manager;
  sharedManager___manager = v2;
}

- (MRExpanseManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRExpanseManager;
  uint64_t v6 = [(MRExpanseManager *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.amp.MediaRemote.MRExpanseManager.notifyQueue", v8);
    notifyQueue = v7->_notifyQueue;
    v7->_notifyQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v11;

    getTUConversationManagerClass[0]();
    uint64_t v13 = objc_opt_new();
    conversationManager = v7->_conversationManager;
    v7->_conversationManager = (TUConversationManager *)v13;

    [(TUConversationManager *)v7->_conversationManager addDelegate:v7 queue:v7->_queue];
    uint64_t v15 = [objc_alloc((Class)getTUNeighborhoodActivityConduitClass[0]()) initWithConversationManager:v7->_conversationManager];
    conduit = v7->_conduit;
    v7->_conduit = (TUNeighborhoodActivityConduit *)v15;

    [(TUNeighborhoodActivityConduit *)v7->_conduit addDelegate:v7 queue:v7->_queue];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(MRExpanseManager *)self conduit];
  [v3 removeDelegate:self];

  id v4 = [(MRExpanseManager *)self conversationManager];
  [v4 removeDelegate:self];

  v5.receiver = self;
  v5.super_class = (Class)MRExpanseManager;
  [(MRExpanseManager *)&v5 dealloc];
}

- (BOOL)activeActivityExistsForBundle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v5 = [(MRExpanseManager *)self activeConversation];
  uint64_t v6 = [v5 activitySessions];

  v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = ((char *)i + 1))
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 state] == 1 || objc_msgSend(v10, "state") == 4)
        {
          uint64_t v11 = [v10 activity];
          long long v12 = [v11 bundleIdentifier];
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            v7 = _MRLogForCategory(2uLL);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              id v20 = v4;
              _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found active activity for %{private}@", buf, 0xCu);
            }

            LOBYTE(v7) = 1;
            goto LABEL_15;
          }
        }
      }
      v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v7;
}

- (NSString)activeTelevisionRouteID
{
  uint64_t v2 = [(MRExpanseManager *)self conduit];
  v3 = [v2 activeSplitSessionTV];
  id v4 = [v3 identifierWithType:1];

  return (NSString *)v4;
}

- (BOOL)deviceIsActiveTelevision:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(MRExpanseManager *)self activeTelevisionRouteID];
  if (v5)
  {
    if ([v4 deviceSubtype] != 15)
    {
      uint64_t v14 = [v4 uid];
      char v13 = [v14 isEqualToString:v5];

      goto LABEL_15;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_msgSend(v4, "clusterComposition", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) uid];
          char v12 = [v11 isEqualToString:v5];

          if (v12)
          {

            char v13 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  char v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)expanseHandoffSupported
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [(MRExpanseManager *)self activeConversation];
  v3 = [v2 activitySessions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) activity];
        uint64_t v9 = [v8 metadata];
        int v10 = [v9 supportsContinuationOnTV];

        if (v10)
        {
          char v12 = _MRLogForCategory(2uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v14 = 0;
            _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found activity to continue on TV.", v14, 2u);
          }

          BOOL v11 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Found no activity to continue on TV.", v14, 2u);
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)errorIsTelevisionCapabilitiesError:(id)a3
{
  return [a3 code] == 21;
}

- (BOOL)expanseSessionActive
{
  uint64_t v2 = [(MRExpanseManager *)self activeConversation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)expanseSessionHasActiveActivity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [(MRExpanseManager *)self activeConversation];
  BOOL v3 = [v2 activitySessions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) state] == 1)
        {
          uint64_t v9 = _MRLogForCategory(2uLL);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v11 = 0;
            _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Local activity found.", v11, 2u);
          }

          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No local activity found.", v11, 2u);
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)expanseSessionHasRemoteActivity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = [(MRExpanseManager *)self activeConversation];
  BOOL v3 = [v2 activitySessions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) state] == 4)
        {
          uint64_t v9 = _MRLogForCategory(2uLL);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v11 = 0;
            _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Remote activity found.", v11, 2u);
          }

          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v3 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] No remote activity found.", v11, 2u);
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (void)addTelevisionWithRouteIdentifierToSession:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(MRExpanseManager *)self activeConversation];
  uint64_t v9 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v8 UUID];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Adding television with route ID: %@ to conversation %@", buf, 0x16u);
  }
  BOOL v11 = (void *)[objc_alloc(getTUNearbyDeviceHandleClass()) initWithType:1 identifier:v6 name:0];
  long long v12 = [(MRExpanseManager *)self conduit];
  long long v13 = [v8 UUID];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__MRExpanseManager_addTelevisionWithRouteIdentifierToSession_completion___block_invoke;
  v15[3] = &unk_1E57D1C60;
  id v16 = v7;
  id v14 = v7;
  [v12 inviteTVDevice:v11 toConversation:v13 completion:v15];
}

void __73__MRExpanseManager_addTelevisionWithRouteIdentifierToSession_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138477827;
    id v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television add completed with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

- (void)removeTelevisionWithRouteIdentifierFromSession:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Removing television with route ID: %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)[objc_alloc(getTUNearbyDeviceHandleClass()) initWithType:1 identifier:v6 name:0];
  int v10 = [(MRExpanseManager *)self conduit];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__MRExpanseManager_removeTelevisionWithRouteIdentifierFromSession_completion___block_invoke;
  v12[3] = &unk_1E57D1C60;
  id v13 = v7;
  id v11 = v7;
  [v10 disconnectTVDevice:v9 completion:v12];
}

void __78__MRExpanseManager_removeTelevisionWithRouteIdentifierFromSession_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138477827;
    id v8 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television removal completed with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(MRExpanseManager *)v5 observers];
    [v6 addObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(MRExpanseManager *)v5 observers];
    [v6 removeObject:v7];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)_notifyObserversThatTelevisionJoinedSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(MRExpanseManager *)v2 observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [(MRExpanseManager *)v2 notifyQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __63__MRExpanseManager__notifyObserversThatTelevisionJoinedSession__block_invoke;
          v9[3] = &unk_1E57D0790;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __63__MRExpanseManager__notifyObserversThatTelevisionJoinedSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) expanseManagerTelevisionDidJoinSession:*(void *)(a1 + 40)];
}

- (void)_notifyObserversThatTelevisionLeftSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(MRExpanseManager *)v2 observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [(MRExpanseManager *)v2 notifyQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __61__MRExpanseManager__notifyObserversThatTelevisionLeftSession__block_invoke;
          v9[3] = &unk_1E57D0790;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __61__MRExpanseManager__notifyObserversThatTelevisionLeftSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) expanseManagerTelevisionDidLeaveSession:*(void *)(a1 + 40)];
}

- (void)_notifyObserversThatExpanseSessionJoined
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(MRExpanseManager *)v2 observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [(MRExpanseManager *)v2 notifyQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __60__MRExpanseManager__notifyObserversThatExpanseSessionJoined__block_invoke;
          v9[3] = &unk_1E57D0790;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __60__MRExpanseManager__notifyObserversThatExpanseSessionJoined__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) expanseManagerDidJoinExpanseSession:*(void *)(a1 + 40)];
}

- (void)_notifyObserversThatExpanseSessionLeft
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(MRExpanseManager *)v2 observers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [(MRExpanseManager *)v2 notifyQueue];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __58__MRExpanseManager__notifyObserversThatExpanseSessionLeft__block_invoke;
          v9[3] = &unk_1E57D0790;
          v9[4] = v7;
          v9[5] = v2;
          dispatch_async(v8, v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __58__MRExpanseManager__notifyObserversThatExpanseSessionLeft__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) expanseManagerDidLeaveExpanseSession:*(void *)(a1 + 40)];
}

- (void)_handleExpanseSessionJoined
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRExpanseManager] Failed to set category for audio session, route picking likely to malfunction. Error: %{private}@.", (uint8_t *)&v2, 0xCu);
}

- (void)_handleExpanseSessionLeft
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = [(MRExpanseManager *)obj auxiliaryPlaybackAudioSession];

  if (v2)
  {
    [(MRExpanseManager *)obj setAuxiliaryPlaybackAudioSession:0];
    [(MRExpanseManager *)obj _notifyObserversThatExpanseSessionLeft];
  }
  objc_sync_exit(obj);
}

- (void)_handleConversationStateChanged
{
  if ([(MRExpanseManager *)self expanseSessionActive])
  {
    [(MRExpanseManager *)self _handleExpanseSessionJoined];
  }
  else
  {
    [(MRExpanseManager *)self _handleExpanseSessionLeft];
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 UUID];
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = [v5 state];
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Conversation %@ state changed to %ld", (uint8_t *)&v8, 0x16u);
  }
  [(MRExpanseManager *)self _handleConversationStateChanged];
}

- (void)serverDisconnectedForConversationManager:(id)a3
{
  uint64_t v4 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MRExpanseManager serverDisconnectedForConversationManager:](v4);
  }

  [(MRExpanseManager *)self _handleConversationStateChanged];
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138478083;
    id v8 = v5;
    __int16 v9 = 1024;
    BOOL v10 = [(MRExpanseManager *)self expanseSessionHasRemoteActivity];
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television joined split session: %{private}@, remoteActivity: %{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  [(MRExpanseManager *)self _notifyObserversThatTelevisionJoinedSession];
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _MRLogForCategory(2uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138478083;
    id v8 = v5;
    __int16 v9 = 1024;
    BOOL v10 = [(MRExpanseManager *)self expanseSessionHasActiveActivity];
    _os_log_impl(&dword_194F3C000, v6, OS_LOG_TYPE_DEFAULT, "[MRExpanseManager] Television left split session: %{private}@, localActivity: %{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  [(MRExpanseManager *)self _notifyObserversThatTelevisionLeftSession];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (TUNeighborhoodActivityConduit)conduit
{
  return self->_conduit;
}

- (AVAudioSession)auxiliaryPlaybackAudioSession
{
  return self->_auxiliaryPlaybackAudioSession;
}

- (void)setAuxiliaryPlaybackAudioSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryPlaybackAudioSession, 0);
  objc_storeStrong((id *)&self->_conduit, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)serverDisconnectedForConversationManager:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_debug_impl(&dword_194F3C000, log, OS_LOG_TYPE_DEBUG, "[MRExpanseManager] Conversation manager lost connection.", v1, 2u);
}

@end