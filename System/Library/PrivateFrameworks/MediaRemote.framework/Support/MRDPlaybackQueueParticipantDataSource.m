@interface MRDPlaybackQueueParticipantDataSource
- (MRDPlaybackQueueParticipantDataSource)initWithDelegate:(id)a3;
- (MRDPlaybackQueueParticipantDataSourceDelegate)delegate;
- (MSVTimer)pepperExpirationTimer;
- (NSArray)participants;
- (NSDate)pepperExpirationDate;
- (NSMapTable)localIdentityMap;
- (NSMapTable)remoteIdentityMap;
- (NSString)pepper;
- (NSUserDefaults)storage;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)donateAttribution:(id)a3;
- (void)dealloc;
- (void)handleGroupSessionServerDidStartNotification:(id)a3;
- (void)handleMusicStateUpdateNotification:(id)a3;
- (void)loadFromStorage;
- (void)loadLocalIdentities;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)rebuildParticipants;
- (void)rotatePepper;
- (void)saveToStorage;
- (void)setParticipants:(id)a3;
- (void)setPepper:(id)a3;
- (void)setPepperExpirationDate:(id)a3;
- (void)setPepperExpirationTimer:(id)a3;
- (void)updatePepperIfNeededWithSession:(id)a3;
@end

@implementation MRDPlaybackQueueParticipantDataSource

- (MRDPlaybackQueueParticipantDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[MRUserSettings currentSettings];
  unsigned int v6 = [v5 supportGroupSessionAttribution];

  if (v6)
  {
    v32.receiver = self;
    v32.super_class = (Class)MRDPlaybackQueueParticipantDataSource;
    v7 = [(MRDPlaybackQueueParticipantDataSource *)&v32 init];
    v8 = v7;
    if (v7)
    {
      objc_storeWeak((id *)&v7->_delegate, v4);
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create("com.apple.amp.MediaRemote.MRDPlaybackQueueParticipantDataSource.queue", v9);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;

      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = sub_100118314();
      dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.amp.MediaRemote.MRDPlaybackQueueParticipantDataSource.delegateQueue", v12, v13);
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = (OS_dispatch_queue *)v14;

      v16 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mediaremote"];
      storage = v8->_storage;
      v8->_storage = v16;

      uint64_t v18 = +[NSMapTable strongToStrongObjectsMapTable];
      localIdentityMap = v8->_localIdentityMap;
      v8->_localIdentityMap = (NSMapTable *)v18;

      uint64_t v20 = +[NSMapTable strongToStrongObjectsMapTable];
      remoteIdentityMap = v8->_remoteIdentityMap;
      v8->_remoteIdentityMap = (NSMapTable *)v20;

      participants = v8->_participants;
      v8->_participants = (NSArray *)&__NSArray0__struct;

      uint64_t v23 = +[NSDate distantPast];
      pepperExpirationDate = v8->_pepperExpirationDate;
      v8->_pepperExpirationDate = (NSDate *)v23;

      v25 = [(MRDPlaybackQueueParticipantDataSource *)v8 queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001189B8;
      block[3] = &unk_100415CC8;
      v31 = v8;
      dispatch_async(v25, block);
    }
    v26 = _MRLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] Initialized", (uint8_t *)&v29, 2u);
    }

    self = v8;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] Dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDPlaybackQueueParticipantDataSource;
  [(MRDPlaybackQueueParticipantDataSource *)&v4 dealloc];
}

- (NSArray)participants
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = sub_100118C5C;
  v11 = sub_100118C6C;
  id v12 = 0;
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100118C74;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)donateAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100118C5C;
  v16 = sub_100118C6C;
  id v17 = 0;
  v5 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118DCC;
  block[3] = &unk_100416730;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_async_and_wait(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)rebuildParticipants
{
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSMutableArray array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v5 = [(MRDPlaybackQueueParticipantDataSource *)self localIdentityMap];
  id v6 = [v5 keyEnumerator];
  id v7 = [v6 allObjects];

  v8 = v7;
  id v9 = [v7 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v12);
        id v14 = objc_alloc((Class)MRPlaybackQueueParticipant);
        v15 = [(MRDPlaybackQueueParticipantDataSource *)self localIdentityMap];
        v16 = [v15 objectForKey:v13];
        id v17 = [v14 initWithIdentifier:v16 identity:v13];

        [v4 addObject:v17];
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v10);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v18 = [(MRDPlaybackQueueParticipantDataSource *)self remoteIdentityMap];
  v19 = [v18 keyEnumerator];
  uint64_t v20 = [v19 allObjects];

  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v24);
        id v26 = objc_alloc((Class)MRPlaybackQueueParticipant);
        v27 = [(MRDPlaybackQueueParticipantDataSource *)self remoteIdentityMap];
        v28 = [v27 objectForKey:v25];
        id v29 = [v26 initWithIdentifier:v28 identity:v25];

        [v4 addObject:v29];
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v22);
  }

  id v30 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"identity.displayName" ascending:1 selector:"localizedStandardCompare:"];
  id v48 = v30;
  v31 = +[NSArray arrayWithObjects:&v48 count:1];
  [v4 sortUsingDescriptors:v31];

  if (![(NSArray *)self->_participants isEqualToArray:v4])
  {
    objc_super v32 = _MRLogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v4;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] Updated participants: %@", buf, 0xCu);
    }

    id v33 = [v4 copy];
    objc_storeStrong((id *)&self->_participants, v33);
    [(MRDPlaybackQueueParticipantDataSource *)self saveToStorage];
    v34 = [(MRDPlaybackQueueParticipantDataSource *)self delegateQueue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100119324;
    v36[3] = &unk_1004158D8;
    v36[4] = self;
    id v37 = v33;
    id v35 = v33;
    dispatch_async(v34, v36);
  }
}

- (void)saveToStorage
{
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MRDPlaybackQueueParticipantDataSource *)self remoteIdentityMap];
  id v11 = [v4 dictionaryRepresentation];

  v5 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
  id v6 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
  [v6 setObject:v5 forKey:@"MRDPQPDS.RPS"];

  id v7 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
  v8 = [(MRDPlaybackQueueParticipantDataSource *)self pepperExpirationDate];
  [v7 setObject:v8 forKey:@"MRDPQPDS.PED"];

  id v9 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
  id v10 = [(MRDPlaybackQueueParticipantDataSource *)self pepper];
  [v9 setObject:v10 forKey:@"MRDPQPDS.PPR"];
}

- (void)loadFromStorage
{
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] loadFromStorage.", buf, 2u);
  }

  v5 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
  id v6 = [v5 objectForKey:@"MRDPQPDS.PPR"];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
      v8 = [v7 objectForKey:@"MRDPQPDS.PED"];

      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 timeIntervalSinceNow];
          if (v9 > 60.0)
          {
            id v10 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
            long long v39 = [v10 objectForKey:@"MRDPQPDS.RPS"];

            if (v39)
            {
              uint64_t v11 = objc_opt_class();
              id v46 = 0;
              long long v38 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:v11 objectsOfClass:objc_opt_class() fromData:v39 error:&v46];
              id v37 = v46;
              if ([v38 count])
              {
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                id v12 = v38;
                id v13 = [v12 countByEnumeratingWithState:&v42 objects:v51 count:16];
                if (v13)
                {
                  uint64_t v14 = *(void *)v43;
                  do
                  {
                    for (i = 0; i != v13; i = (char *)i + 1)
                    {
                      if (*(void *)v43 != v14) {
                        objc_enumerationMutation(v12);
                      }
                      uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                      id v17 = [(MRDPlaybackQueueParticipantDataSource *)self remoteIdentityMap];
                      uint64_t v18 = [v12 objectForKeyedSubscript:v16];
                      [v17 setObject:v18 forKey:v16];
                    }
                    id v13 = [v12 countByEnumeratingWithState:&v42 objects:v51 count:16];
                  }
                  while (v13);
                }

                v19 = _MRLogForCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  id v20 = [v12 count];
                  [v8 timeIntervalSinceNow];
                  *(_DWORD *)buf = 134218240;
                  id v48 = v20;
                  __int16 v49 = 2048;
                  uint64_t v50 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] Rehydrated %lu remote participants with remaining time %f.", buf, 0x16u);
                }

                [(MRDPlaybackQueueParticipantDataSource *)self setPepper:v6];
                [(MRDPlaybackQueueParticipantDataSource *)self setPepperExpirationDate:v8];
                objc_initWeak((id *)buf, self);
                id v22 = [(MRDPlaybackQueueParticipantDataSource *)self pepperExpirationDate];
                [v22 timeIntervalSinceNow];
                double v24 = v23;
                uint64_t v25 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
                v40[0] = _NSConcreteStackBlock;
                v40[1] = 3221225472;
                v40[2] = sub_100119A5C;
                v40[3] = &unk_1004171D0;
                objc_copyWeak(&v41, (id *)buf);
                id v26 = +[MSVTimer timerWithInterval:0 repeats:v25 queue:v40 block:v24 + 1.0];
                [(MRDPlaybackQueueParticipantDataSource *)self setPepperExpirationTimer:v26];

                objc_destroyWeak(&v41);
                objc_destroyWeak((id *)buf);
              }
            }
          }
        }
      }
    }
  }
  v27 = [(MRDPlaybackQueueParticipantDataSource *)self pepper];
  BOOL v28 = v27 == 0;

  if (v28)
  {
    id v29 = _MRLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueParticipantDataSource] Did not rehydrate.", buf, 2u);
    }

    id v30 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
    [v30 setObject:0 forKey:@"MRDPQPDS.RPS"];

    v31 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
    [v31 setObject:0 forKey:@"MRDPQPDS.PED"];

    objc_super v32 = [(MRDPlaybackQueueParticipantDataSource *)self storage];
    [v32 setObject:0 forKey:@"MRDPQPDS.PPR"];
  }
  id v33 = +[MRDMediaRemoteServer server];
  v34 = [v33 groupSessionServer];
  id v35 = [v34 sessionManager];

  v36 = [v35 session];
  [(MRDPlaybackQueueParticipantDataSource *)self updatePepperIfNeededWithSession:v36];
}

- (void)updatePepperIfNeededWithSession:(id)a3
{
  id v4 = a3;
  v5 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MRDPlaybackQueueParticipantDataSource *)self pepperExpirationDate];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  unsigned int v9 = [v4 isHosted];
  if (v8 < 0.0 && v9)
  {
    id v10 = [(MRDPlaybackQueueParticipantDataSource *)self pepper];

    if (v10) {
      return;
    }
  }
  else if (v8 >= 0.0)
  {
    return;
  }

  [(MRDPlaybackQueueParticipantDataSource *)self rotatePepper];
}

- (void)rotatePepper
{
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = MSVNanoIDCreateTaggedPointer();
  [(MRDPlaybackQueueParticipantDataSource *)self setPepper:v4];

  v5 = +[NSDate now];
  id v6 = +[MRUserSettings currentSettings];
  [v6 groupSessionAttributionValidityDuration];
  double v7 = objc_msgSend(v5, "dateByAddingTimeInterval:");
  [(MRDPlaybackQueueParticipantDataSource *)self setPepperExpirationDate:v7];

  objc_initWeak(&location, self);
  double v8 = [(MRDPlaybackQueueParticipantDataSource *)self pepperExpirationDate];
  [v8 timeIntervalSinceNow];
  double v10 = v9;
  uint64_t v11 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100119DC8;
  id v17 = &unk_1004171D0;
  objc_copyWeak(&v18, &location);
  id v12 = +[MSVTimer timerWithInterval:0 repeats:v11 queue:&v14 block:v10 + 1.0];
  -[MRDPlaybackQueueParticipantDataSource setPepperExpirationTimer:](self, "setPepperExpirationTimer:", v12, v14, v15, v16, v17);

  id v13 = [(MRDPlaybackQueueParticipantDataSource *)self remoteIdentityMap];
  [v13 removeAllObjects];

  [(MRDPlaybackQueueParticipantDataSource *)self saveToStorage];
  [(MRDPlaybackQueueParticipantDataSource *)self rebuildParticipants];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)loadLocalIdentities
{
  v3 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[MRDMusicUserStateCenter sharedCenter];
  v5 = [v4 localUserIdentities];

  id v6 = [(MRDPlaybackQueueParticipantDataSource *)self localIdentityMap];
  [v6 removeAllObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:withRandomData:](MRPlaybackQueueParticipant, "expectedIdentifierForUserIdentity:withRandomData:", v12, 0, (void)v15);
        uint64_t v14 = [(MRDPlaybackQueueParticipantDataSource *)self localIdentityMap];
        [v14 setObject:v13 forKey:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(MRDPlaybackQueueParticipantDataSource *)self rebuildParticipants];
}

- (void)handleMusicStateUpdateNotification:(id)a3
{
  id v4 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011A08C;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)handleGroupSessionServerDidStartNotification:(id)a3
{
  id v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 groupSessionServer];
  id v6 = [v5 sessionManager];

  [v6 addObserver:self];
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011A1CC;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v5 = a4;
  id v6 = [(MRDPlaybackQueueParticipantDataSource *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011A28C;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)setParticipants:(id)a3
{
}

- (MRDPlaybackQueueParticipantDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDPlaybackQueueParticipantDataSourceDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSUserDefaults)storage
{
  return self->_storage;
}

- (NSMapTable)localIdentityMap
{
  return self->_localIdentityMap;
}

- (NSMapTable)remoteIdentityMap
{
  return self->_remoteIdentityMap;
}

- (NSString)pepper
{
  return self->_pepper;
}

- (void)setPepper:(id)a3
{
}

- (NSDate)pepperExpirationDate
{
  return self->_pepperExpirationDate;
}

- (void)setPepperExpirationDate:(id)a3
{
}

- (MSVTimer)pepperExpirationTimer
{
  return self->_pepperExpirationTimer;
}

- (void)setPepperExpirationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pepperExpirationTimer, 0);
  objc_storeStrong((id *)&self->_pepperExpirationDate, 0);
  objc_storeStrong((id *)&self->_pepper, 0);
  objc_storeStrong((id *)&self->_remoteIdentityMap, 0);
  objc_storeStrong((id *)&self->_localIdentityMap, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end