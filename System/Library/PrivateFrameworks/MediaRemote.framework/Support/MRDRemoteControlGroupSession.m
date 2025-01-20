@interface MRDRemoteControlGroupSession
+ (id)hostedSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5;
+ (id)remoteSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)isLowPowerMode;
- (BOOL)isUpdatingLowPowerMode;
- (MRDFastSyncGroupSession)fastSyncSession;
- (MRDGroupSessionParticipant)leader;
- (MRDGroupSessionParticipant)localParticipant;
- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6;
- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5 hostSigningKey:(id)a6;
- (MRGroupSessionToken)joinToken;
- (MRUserIdentity)localIdentity;
- (MSVTimer)lowPowerDeferralTimer;
- (NSArray)members;
- (NSArray)participants;
- (NSArray)pendingParticipants;
- (NSArray)remoteParticipants;
- (NSArray)remotePendingParticipants;
- (NSError)lowPowerError;
- (NSHashTable)observers;
- (NSMapTable)pendingJoinCompletions;
- (NSMapTable)pendingParticipantsMap;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedSessionName;
- (NSString)sharedSecret;
- (OS_dispatch_queue)notificationQueue;
- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup;
- (_TtC12mediaremoted19MRDNearbyInvitation)nearbyInvitation;
- (id)handleJoinRequest:(id)a3 isGuest:(BOOL)a4 completion:(id)a5;
- (int64_t)state;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (unsigned)routeType;
- (void)_initializeWithIdentity:(id)a3 nearbyGroup:(id)a4 isHosted:(BOOL)a5 hostSigningKey:(id)a6;
- (void)addObserver:(id)a3;
- (void)approvePendingParticipant:(id)a3;
- (void)clearPendingCompletions;
- (void)dealloc;
- (void)denyPendingParticipant:(id)a3;
- (void)finish;
- (void)handleApprovedJoinRequest:(id)a3 isGuest:(BOOL)a4;
- (void)handleDisplayMonitorChangeNotification:(id)a3;
- (void)reevaluateLowPowerMode;
- (void)removeAllParticipants;
- (void)removeObserver:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)revokeAutoApprovalForAllParticipants;
- (void)revokeAutoApprovalForParticipant:(id)a3;
- (void)sendMessageData:(id)a3 toParticipants:(id)a4;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didReceiveRemoteApprovalForPendingParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteControlMessage:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteRejectionForPendingParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didReceiveRemoteRemoveAllRequestFromParticipant:(id)a4;
- (void)session:(id)a3 didReceiveRemoteRemoveRequestForParticipant:(id)a4 from:(id)a5;
- (void)session:(id)a3 didUpdateMembers:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)sessionDidCompleteIdentityShare:(id)a3;
- (void)setIsHosted:(BOOL)a3;
- (void)setIsLowPowerMode:(BOOL)a3;
- (void)setIsUpdatingLowPowerMode:(BOOL)a3;
- (void)setJoinToken:(id)a3;
- (void)setLeader:(id)a3;
- (void)setLowPowerDeferralTimer:(id)a3;
- (void)setLowPowerError:(id)a3;
- (void)setMembers:(id)a3;
- (void)setNearbyGroup:(id)a3;
- (void)setNearbyInvitation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingJoinCompletions:(id)a3;
- (void)setPendingParticipantsMap:(id)a3;
- (void)setRemotePendingParticipants:(id)a3;
- (void)setSharedSecret:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
- (void)trackJoinResponseApproved:(BOOL)a3;
- (void)transitionToState:(int64_t)a3;
@end

@implementation MRDRemoteControlGroupSession

+ (id)hostedSessionWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MRDRemoteControlGroupSession alloc] initWithNearbyGroup:v9 nearbyInvitation:v8 identity:v7 hostSigningKey:0];

  return v10;
}

+ (id)remoteSessionWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[MRDRemoteControlGroupSession alloc] initWithNearbyGroup:v12 identity:v11 hostSigningKey:v10 joinToken:v9];

  return v13;
}

- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 nearbyInvitation:(id)a4 identity:(id)a5 hostSigningKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)MRDRemoteControlGroupSession;
  v14 = [(MRDRemoteControlGroupSession *)&v27 init];
  v15 = v14;
  if (v14)
  {
    [(MRDRemoteControlGroupSession *)v14 _initializeWithIdentity:v12 nearbyGroup:v10 isHosted:1 hostSigningKey:v13];
    objc_storeStrong((id *)&v15->_nearbyInvitation, a4);
    v16 = +[MRUserSettings currentSettings];
    unsigned int v17 = [v16 groupSessionGenerateSharedSecret];

    if (v17)
    {
      uint64_t v18 = [v10 sessionSecret];
      sharedSecret = v15->_sharedSecret;
      v15->_sharedSecret = (NSString *)v18;
    }
    id v20 = objc_alloc((Class)MRGroupSessionToken);
    v21 = [v11 invitationData];
    v22 = (MRGroupSessionToken *)[v20 initWithInvitationData:v21 sharedSecret:v15->_sharedSecret sessionIdentifier:v15->_identifier equivalentMediaIdentifier:0 version:MRGroupSessionTokenVersion];
    joinToken = v15->_joinToken;
    v15->_joinToken = v22;

    uint64_t v24 = +[MRDFastSyncGroupSession createSessionWithNearbyGroup:v10 asUser:v12 delegate:v15];
    fastSyncSession = v15->_fastSyncSession;
    v15->_fastSyncSession = (MRDFastSyncGroupSession *)v24;
  }
  return v15;
}

- (MRDRemoteControlGroupSession)initWithNearbyGroup:(id)a3 identity:(id)a4 hostSigningKey:(id)a5 joinToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MRDRemoteControlGroupSession;
  v14 = [(MRDRemoteControlGroupSession *)&v21 init];
  v15 = v14;
  if (v14)
  {
    [(MRDRemoteControlGroupSession *)v14 _initializeWithIdentity:v11 nearbyGroup:v10 isHosted:0 hostSigningKey:v12];
    objc_storeStrong((id *)&v15->_joinToken, a6);
    uint64_t v16 = +[MRDFastSyncGroupSession joinSessionWithNearbyGroup:v10 asUser:v11 hostSigningKey:v12 delegate:v15];
    fastSyncSession = v15->_fastSyncSession;
    v15->_fastSyncSession = (MRDFastSyncGroupSession *)v16;

    uint64_t v18 = +[NSNotificationCenter defaultCenter];
    v19 = +[MRDDisplayMonitor sharedMonitor];
    [v18 addObserver:v15 selector:"handleDisplayMonitorChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v19];
  }
  return v15;
}

- (void)_initializeWithIdentity:(id)a3 nearbyGroup:(id)a4 isHosted:(BOOL)a5 hostSigningKey:(id)a6
{
  id v9 = (MRUserIdentity *)a3;
  id v10 = (_TtC12mediaremoted14MRDNearbyGroup *)a4;
  self->_lock._os_unfair_lock_opaque = 0;
  id v11 = +[NSHashTable weakObjectsHashTable];
  observers = self->_observers;
  self->_observers = v11;

  id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = MRGroupSessionSubsystemGetNotificationQueue();
  v15 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.amp.MediaRemote.MRDRemoteControlGroupSession.notificationQueue", v13, v14);
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = v15;

  self->_isHosted = a5;
  localIdentity = self->_localIdentity;
  self->_localIdentity = v9;
  uint64_t v18 = v9;

  v19 = +[NSMapTable strongToStrongObjectsMapTable];
  pendingParticipantsMap = self->_pendingParticipantsMap;
  self->_pendingParticipantsMap = v19;

  objc_super v21 = +[NSMapTable strongToStrongObjectsMapTable];
  pendingJoinCompletions = self->_pendingJoinCompletions;
  self->_pendingJoinCompletions = v21;

  nearbyGroup = self->_nearbyGroup;
  self->_nearbyGroup = v10;
  uint64_t v24 = v10;

  v25 = [(MRDNearbyGroup *)v24 identifier];
  identifier = self->_identifier;
  self->_identifier = v25;

  self->_state = 0;
  objc_super v27 = _MRLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134217984;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%p> Initialized", (uint8_t *)&v28, 0xCu);
  }
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%p> Dealloc.", buf, 0xCu);
  }

  v4 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  [v4 end];

  v5.receiver = self;
  v5.super_class = (Class)MRDRemoteControlGroupSession;
  [(MRDRemoteControlGroupSession *)&v5 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(MRDRemoteControlGroupSession *)self identifier];
  v6 = +[NSNumber numberWithBool:[(MRDRemoteControlGroupSession *)self isHosted]];
  id v7 = [v6 stringValue];
  id v8 = [(MRDRemoteControlGroupSession *)self nearbyGroup];
  id v9 = [(MRDRemoteControlGroupSession *)self nearbyInvitation];
  id v10 = [v3 initWithFormat:@"<%@: identifier=%@, hosted=%@ nearbyGroup=%@ nearbyInvitation=%@>", v4, v5, v7, v8, v9];

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MRDRemoteControlGroupSession *)self identifier];
  objc_super v5 = +[NSNumber numberWithBool:[(MRDRemoteControlGroupSession *)self isHosted]];
  v6 = [v5 stringValue];
  id v7 = [(MRDRemoteControlGroupSession *)self pendingParticipants];
  id v8 = [(MRDRemoteControlGroupSession *)self nearbyGroup];
  id v9 = [(MRDRemoteControlGroupSession *)self nearbyInvitation];
  id v10 = +[NSString stringWithFormat:@"<%@: %p> identifier=%@, hosted=%@, pendingParticipants=%@ nearbyGroup=%@ nearbyInvitation=%@", v3, self, v4, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MRDRemoteControlGroupSession *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      id v7 = identifier;
      id v8 = v7;
      if (v7 == v6) {
        unsigned __int8 v9 = 1;
      }
      else {
        unsigned __int8 v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)localizedSessionName
{
  uint64_t v3 = [(MRDRemoteControlGroupSession *)self leader];
  uint64_t v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 identity];
    v6 = [v5 displayName];
    [(MRDRemoteControlGroupSession *)self routeType];
    id v7 = MRGroupSessionRouteMakeName();
  }
  else
  {
    objc_super v5 = [(MRGroupSessionToken *)self->_joinToken hostInfo];
    id v7 = [v5 localizedSessionName];
  }

  return (NSString *)v7;
}

- (unsigned)routeType
{
  v2 = [(MRGroupSessionToken *)self->_joinToken hostInfo];
  unsigned __int8 v3 = [v2 routeType];

  return v3;
}

- (void)start
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (!state)
  {
    objc_super v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%p> Starting.", (uint8_t *)&v7, 0xCu);
    }

    v6 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
    [v6 start];
  }
}

- (void)finish
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state == 4)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    [(MRDRemoteControlGroupSession *)self setState:4];
    os_unfair_lock_unlock(p_lock);
    uint64_t v4 = _MRLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%p> Finishing.", (uint8_t *)&v6, 0xCu);
    }

    objc_super v5 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
    [v5 end];
  }
}

- (void)sendMessageData:(id)a3 toParticipants:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  unsigned __int8 v9 = objc_msgSend(v6, "msv_map:", &stru_10041FF90);

  id v10 = +[NSSet setWithArray:v9];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017BDCC;
  v11[3] = &unk_100415F80;
  v11[4] = self;
  [v8 sendRemoteControlMessage:v7 to:v10 completion:v11];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(MRDRemoteControlGroupSession *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(MRDRemoteControlGroupSession *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)handleJoinRequest:(id)a3 isGuest:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  id v11 = [v9 identity];
  id v12 = [v10 prewarmForIdentity:v11];

  os_unfair_lock_lock(&self->_lock);
  id v13 = [MRDFastSyncGroupSessionParticipant alloc];
  v14 = [v9 identity];

  v15 = [(MRDFastSyncGroupSessionParticipant *)v13 initWithIdentifier:v12 identity:v14 connected:0 guest:v5];
  uint64_t v16 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
  unsigned int v17 = [(MRDFastSyncGroupSessionParticipant *)v15 identifier];
  [v16 setObject:v15 forKey:v17];

  uint64_t v18 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
  id v19 = objc_retainBlock(v8);

  id v20 = [(MRDFastSyncGroupSessionParticipant *)v15 identifier];
  [v18 setObject:v19 forKey:v20];

  objc_super v21 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
  v22 = [v21 objectEnumerator];
  v23 = [v22 allObjects];

  uint64_t v24 = [(MRDRemoteControlGroupSession *)self observers];
  v25 = [v24 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  v26 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  [v26 markParticipantAsGuestIfNeeded:v15];

  objc_super v27 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  [v27 addPendingParticipant:v15];

  int v28 = [(MRDRemoteControlGroupSession *)self notificationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017C1BC;
  block[3] = &unk_1004159B8;
  id v33 = v25;
  v34 = self;
  id v35 = v23;
  id v29 = v23;
  id v30 = v25;
  dispatch_async(v28, block);

  return v12;
}

- (void)handleApprovedJoinRequest:(id)a3 isGuest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  id v8 = [v6 identity];
  id v17 = [v7 prewarmForIdentity:v8];

  os_unfair_lock_lock(&self->_lock);
  id v9 = [MRDFastSyncGroupSessionParticipant alloc];
  id v10 = [v6 identity];

  id v11 = [(MRDFastSyncGroupSessionParticipant *)v9 initWithIdentifier:v17 identity:v10 connected:0 guest:v4];
  id v12 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
  id v13 = [(MRDFastSyncGroupSessionParticipant *)v11 identifier];
  [v12 setObject:v11 forKey:v13];

  v14 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
  v15 = [(MRDFastSyncGroupSessionParticipant *)v11 identifier];
  [v14 setObject:&stru_10041FFD0 forKey:v15];

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v16 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  [v16 markParticipantAsGuestIfNeeded:v11];

  [(MRDRemoteControlGroupSession *)self approvePendingParticipant:v17];
}

- (void)approvePendingParticipant:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(MRDRemoteControlGroupSession *)self trackJoinResponseApproved:1];
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    BOOL v5 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
    id v6 = [v5 objectForKey:v4];

    id v7 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
    id v8 = [v7 objectForKey:v4];

    id v9 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
    [v9 removeObjectForKey:v4];

    id v10 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
    [v10 removeObjectForKey:v4];
  }
  else
  {
    id v11 = [(MRDRemoteControlGroupSession *)self remotePendingParticipants];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10017C758;
    v27[3] = &unk_100419878;
    id v28 = v4;
    id v6 = objc_msgSend(v11, "msv_firstWhere:", v27);

    id v8 = 0;
  }
  id v12 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
  id v13 = [v12 objectEnumerator];
  v14 = [v13 allObjects];

  v15 = [(MRDRemoteControlGroupSession *)self observers];
  uint64_t v16 = [v15 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    unsigned int v17 = [(MRDRemoteControlGroupSession *)self isHosted];
    uint64_t v18 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
    id v19 = v18;
    if (v17)
    {
      [v18 removePendingParticipant:v6];

      id v20 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
      [v20 prepareForAddedMember];

      objc_super v21 = [(MRDRemoteControlGroupSession *)self notificationQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017C79C;
      block[3] = &unk_100419F78;
      v26 = v8;
      id v23 = v16;
      uint64_t v24 = self;
      id v25 = v14;
      dispatch_async(v21, block);

      id v19 = v26;
    }
    else
    {
      [v18 remoteApprovePendingParticipant:v6];
    }
  }
  else
  {
    id v19 = _MRLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100332148((uint64_t)v4, v19);
    }
  }
}

- (void)denyPendingParticipant:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(MRDRemoteControlGroupSession *)self trackJoinResponseApproved:0];
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    BOOL v5 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
    id v6 = [v5 objectForKey:v4];

    id v7 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
    id v8 = [v7 objectForKey:v4];

    id v9 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
    [v9 removeObjectForKey:v4];

    id v10 = [(MRDRemoteControlGroupSession *)self pendingJoinCompletions];
    [v10 removeObjectForKey:v4];
  }
  else
  {
    id v11 = [(MRDRemoteControlGroupSession *)self remotePendingParticipants];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10017CBDC;
    v28[3] = &unk_100419878;
    id v29 = v4;
    id v6 = objc_msgSend(v11, "msv_firstWhere:", v28);

    id v8 = 0;
  }
  id v12 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
  id v13 = [v12 objectEnumerator];
  v14 = [v13 allObjects];

  v15 = [(MRDRemoteControlGroupSession *)self observers];
  uint64_t v16 = [v15 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    unsigned int v17 = [(MRDRemoteControlGroupSession *)self isHosted];
    uint64_t v18 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
    id v19 = v18;
    if (v17)
    {
      [v18 removePendingParticipant:v6];

      id v20 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
      objc_super v21 = [v6 identity];
      [v20 cancelPrewarmedIdentifier:v4 forIdentity:v21];

      v22 = [(MRDRemoteControlGroupSession *)self notificationQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017CC20;
      block[3] = &unk_100419F78;
      objc_super v27 = v8;
      id v24 = v16;
      id v25 = self;
      id v26 = v14;
      dispatch_async(v22, block);

      id v19 = v27;
    }
    else
    {
      [v18 remoteRejectPendingParticipant:v6];
    }
  }
  else
  {
    id v19 = _MRLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1003321C0((uint64_t)v4, v19);
    }
  }
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MRDRemoteControlGroupSession *)self isHosted];
  id v6 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  id v7 = v6;
  if (v5) {
    [v6 removeParticipantWithIdentifier:v4];
  }
  else {
    [v6 remoteRemoveParticipantWithIdentifier:v4];
  }
}

- (void)removeAllParticipants
{
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unsigned __int8 v3 = [(MRDRemoteControlGroupSession *)self participants];
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v17 + 1) + 8 * i) identifier];
          [(MRDRemoteControlGroupSession *)self removeParticipant:v8];
        }
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    os_unfair_lock_lock(&self->_lock);
    id v9 = [(MRDRemoteControlGroupSession *)self observers];
    id v10 = [v9 allObjects];

    os_unfair_lock_unlock(&self->_lock);
    id v11 = [(MRDRemoteControlGroupSession *)self notificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017CFFC;
    block[3] = &unk_1004158D8;
    id v15 = v10;
    uint64_t v16 = self;
    id v12 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    id v13 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
    [v13 remoteRemoveAllParticipants];
  }
}

- (void)revokeAutoApprovalForParticipant:(id)a3
{
  id v4 = a3;
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    participants = self->_participants;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10017D290;
    v10[3] = &unk_100419878;
    id v11 = v4;
    id v7 = [(NSArray *)participants msv_firstWhere:v10];
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      id v8 = [v7 identity];
      id v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] Revoking auto-approval for identity: %@", buf, 0xCu);
      }

      +[MRDGroupSessionApprovalManager donateRemovedIdentity:v8];
    }
  }
}

- (void)revokeAutoApprovalForAllParticipants
{
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    unsigned __int8 v3 = [(MRDRemoteControlGroupSession *)self participants];
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) identifier];
          [(MRDRemoteControlGroupSession *)self revokeAutoApprovalForParticipant:v8];

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (NSArray)pendingParticipants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(MRDRemoteControlGroupSession *)self isHosted])
  {
    id v4 = [(MRDRemoteControlGroupSession *)self pendingParticipantsMap];
    id v5 = [v4 objectEnumerator];
    uint64_t v6 = [v5 allObjects];
  }
  else
  {
    uint64_t v6 = [(MRDRemoteControlGroupSession *)self remotePendingParticipants];
  }
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(int64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_state != a3)
  {
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = sub_10017B008(self->_state);
      id v7 = sub_10017B008(a3);
      *(_DWORD *)buf = 138412802;
      objc_super v21 = self;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] <%@> state changed: %@ -> %@", buf, 0x20u);
    }
    self->_int64_t state = a3;
    if (a3 == 4)
    {
      [(MRDRemoteControlGroupSession *)self clearPendingCompletions];
    }
    else if (a3 == 3)
    {
      objc_initWeak((id *)buf, self);
      id v8 = [(MRDRemoteControlGroupSession *)self notificationQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10017D780;
      v18[3] = &unk_1004171D0;
      objc_copyWeak(&v19, (id *)buf);
      long long v9 = +[MSVTimer timerWithInterval:0 repeats:v8 queue:v18 block:15.0];
      [(MRDRemoteControlGroupSession *)self setLowPowerDeferralTimer:v9];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    long long v10 = [(MRDRemoteControlGroupSession *)self observers];
    long long v11 = [v10 allObjects];

    long long v12 = [(MRDRemoteControlGroupSession *)self notificationQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10017D7F0;
    v14[3] = &unk_100415AA8;
    id v15 = v11;
    uint64_t v16 = self;
    int64_t v17 = a3;
    id v13 = v11;
    dispatch_async(v12, v14);
  }
}

- (MRDGroupSessionParticipant)leader
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_leader;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (MRDGroupSessionParticipant)localParticipant
{
  v2 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
  unsigned __int8 v3 = [v2 localParticipant];

  return (MRDGroupSessionParticipant *)v3;
}

- (NSArray)participants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  participants = self->_participants;
  if (!participants) {
    participants = (NSArray *)&__NSArray0__struct;
  }
  id v5 = participants;
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)setParticipants:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_participants, a3);
  if (self->_state == 3)
  {
    uint64_t v6 = [(MRDRemoteControlGroupSession *)self observers];
    id v7 = [v6 allObjects];

    id v8 = [(MRDRemoteControlGroupSession *)self notificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DB20;
    block[3] = &unk_1004159B8;
    id v11 = v7;
    long long v12 = self;
    id v13 = v5;
    id v9 = v7;
    dispatch_async(v8, block);
  }
}

- (NSArray)remoteParticipants
{
  unsigned __int8 v3 = [(MRDRemoteControlGroupSession *)self participants];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017DCE4;
  v6[3] = &unk_100419878;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "msv_filter:", v6);

  return (NSArray *)v4;
}

- (NSArray)members
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_members;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setMembers:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_storeStrong((id *)&self->_members, a3);
  if (self->_state == 3)
  {
    uint64_t v6 = [(MRDRemoteControlGroupSession *)self observers];
    id v7 = [v6 allObjects];

    id v8 = [(MRDRemoteControlGroupSession *)self notificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DEA4;
    block[3] = &unk_1004159B8;
    id v11 = v7;
    long long v12 = self;
    id v13 = v5;
    id v9 = v7;
    dispatch_async(v8, block);
  }
}

- (void)setRemotePendingParticipants:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  id v6 = [v5 copy];

  objc_storeStrong((id *)&self->_remotePendingParticipants, v6);
  if (self->_state == 3)
  {
    id v7 = [(MRDRemoteControlGroupSession *)self observers];
    id v8 = [v7 allObjects];

    id v9 = [(MRDRemoteControlGroupSession *)self notificationQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017E0E0;
    block[3] = &unk_1004159B8;
    id v12 = v8;
    id v13 = self;
    id v14 = v6;
    id v10 = v8;
    dispatch_async(v9, block);
  }
}

- (void)transitionToState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_state < a3) {
    [(MRDRemoteControlGroupSession *)self setState:a3];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setIsLowPowerMode:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_isLowPowerMode != v3)
  {
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"OFF";
      if (v3) {
        CFStringRef v6 = @"ON";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDGroupSession] Low power mode changed to %@", (uint8_t *)&v7, 0xCu);
    }

    self->_isLowPowerMode = v3;
  }
}

- (void)handleDisplayMonitorChangeNotification:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(MRDRemoteControlGroupSession *)self reevaluateLowPowerMode];

  os_unfair_lock_unlock(p_lock);
}

- (void)reevaluateLowPowerMode
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = +[MRUserSettings currentSettings];
  unsigned int v4 = [v3 supportGroupSessionLowPowerMode];

  if (v4)
  {
    if (![(MRDRemoteControlGroupSession *)self isHosted]
      && ![(MRDRemoteControlGroupSession *)self isUpdatingLowPowerMode]
      && self->_state == 3)
    {
      id v5 = [(MRDRemoteControlGroupSession *)self lowPowerDeferralTimer];

      if (!v5)
      {
        CFStringRef v6 = [(MRDRemoteControlGroupSession *)self lowPowerError];

        if (!v6)
        {
          int v7 = +[MRDDisplayMonitor sharedMonitor];
          unsigned int v8 = [v7 displayOn];

          unsigned int v9 = [(MRDRemoteControlGroupSession *)self isLowPowerMode];
          if (v8)
          {
            if (!v9) {
              return;
            }
            [(MRDRemoteControlGroupSession *)self setIsUpdatingLowPowerMode:1];
            id v10 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10017E554;
            v12[3] = &unk_100415F80;
            v12[4] = self;
            [v10 exitLowPowerModeWithCompletion:v12];
          }
          else
          {
            if (v9) {
              return;
            }
            [(MRDRemoteControlGroupSession *)self setIsUpdatingLowPowerMode:1];
            id v10 = [(MRDRemoteControlGroupSession *)self fastSyncSession];
            v11[0] = _NSConcreteStackBlock;
            v11[1] = 3221225472;
            v11[2] = sub_10017E620;
            v11[3] = &unk_100415F80;
            v11[4] = self;
            [v10 enterLowPowerModeWithCompletion:v11];
          }
        }
      }
    }
  }
}

- (void)clearPendingCompletions
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = [(NSMapTable *)self->_pendingJoinCompletions objectEnumerator];
  unsigned int v4 = [v3 allObjects];

  [(NSMapTable *)self->_pendingJoinCompletions removeAllObjects];
  notificationQueue = self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017E7A0;
  block[3] = &unk_100415CC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)notificationQueue, block);
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) < 2)
  {
    id v8 = v6;
    if ([(MRDRemoteControlGroupSession *)self isHosted]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else if (a4 == 3)
  {
    id v8 = v6;
    uint64_t v7 = 2;
  }
  else
  {
    if (a4 != 4) {
      goto LABEL_10;
    }
    id v8 = v6;
    uint64_t v7 = 4;
  }
  [(MRDRemoteControlGroupSession *)self transitionToState:v7];
  id v6 = v8;
LABEL_10:
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  [(MRDRemoteControlGroupSession *)self setParticipants:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didUpdateMembers:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  [(MRDRemoteControlGroupSession *)self setMembers:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didUpdatePendingParticipants:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  [(MRDRemoteControlGroupSession *)self setRemotePendingParticipants:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)sessionDidCompleteIdentityShare:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(MRDRemoteControlGroupSession *)self setState:3];
  id v6 = [v5 leaderParticipant];

  [(MRDRemoteControlGroupSession *)self setLeader:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)session:(id)a3 didReceiveRemoteControlMessage:(id)a4 from:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v9 = [(MRDRemoteControlGroupSession *)self observers];
  id v10 = [v9 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  id v11 = [(MRDRemoteControlGroupSession *)self notificationQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10017EBF8;
  v15[3] = &unk_1004162F8;
  id v16 = v10;
  int64_t v17 = self;
  id v18 = v7;
  id v19 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)session:(id)a3 didReceiveRemoteApprovalForPendingParticipant:(id)a4 from:(id)a5
{
  objc_msgSend(a4, "identifier", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDRemoteControlGroupSession *)self approvePendingParticipant:v6];
}

- (void)session:(id)a3 didReceiveRemoteRejectionForPendingParticipant:(id)a4 from:(id)a5
{
  objc_msgSend(a4, "identifier", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDRemoteControlGroupSession *)self denyPendingParticipant:v6];
}

- (void)session:(id)a3 didReceiveRemoteRemoveRequestForParticipant:(id)a4 from:(id)a5
{
  id v6 = a4;
  id v7 = [v6 identifier];
  [(MRDRemoteControlGroupSession *)self revokeAutoApprovalForParticipant:v7];

  id v8 = [v6 identifier];

  [(MRDRemoteControlGroupSession *)self removeParticipant:v8];
}

- (void)session:(id)a3 didReceiveRemoteRemoveAllRequestFromParticipant:(id)a4
{
  [(MRDRemoteControlGroupSession *)self revokeAutoApprovalForAllParticipants];

  [(MRDRemoteControlGroupSession *)self removeAllParticipants];
}

- (void)trackJoinResponseApproved:(BOOL)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRUserIdentity)localIdentity
{
  return self->_localIdentity;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

- (void)setIsHosted:(BOOL)a3
{
  self->_isHosted = a3;
}

- (NSMapTable)pendingParticipantsMap
{
  return self->_pendingParticipantsMap;
}

- (void)setPendingParticipantsMap:(id)a3
{
}

- (NSArray)remotePendingParticipants
{
  return self->_remotePendingParticipants;
}

- (NSMapTable)pendingJoinCompletions
{
  return self->_pendingJoinCompletions;
}

- (void)setPendingJoinCompletions:(id)a3
{
}

- (void)setLeader:(id)a3
{
}

- (MRDFastSyncGroupSession)fastSyncSession
{
  return self->_fastSyncSession;
}

- (_TtC12mediaremoted19MRDNearbyInvitation)nearbyInvitation
{
  return self->_nearbyInvitation;
}

- (void)setNearbyInvitation:(id)a3
{
}

- (_TtC12mediaremoted14MRDNearbyGroup)nearbyGroup
{
  return self->_nearbyGroup;
}

- (void)setNearbyGroup:(id)a3
{
}

- (MRGroupSessionToken)joinToken
{
  return self->_joinToken;
}

- (void)setJoinToken:(id)a3
{
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (void)setSharedSecret:(id)a3
{
}

- (BOOL)isLowPowerMode
{
  return self->_isLowPowerMode;
}

- (BOOL)isUpdatingLowPowerMode
{
  return self->_isUpdatingLowPowerMode;
}

- (void)setIsUpdatingLowPowerMode:(BOOL)a3
{
  self->_isUpdatingLowPowerMode = a3;
}

- (MSVTimer)lowPowerDeferralTimer
{
  return self->_lowPowerDeferralTimer;
}

- (void)setLowPowerDeferralTimer:(id)a3
{
}

- (NSError)lowPowerError
{
  return self->_lowPowerError;
}

- (void)setLowPowerError:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lowPowerError, 0);
  objc_storeStrong((id *)&self->_lowPowerDeferralTimer, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_joinToken, 0);
  objc_storeStrong((id *)&self->_nearbyGroup, 0);
  objc_storeStrong((id *)&self->_nearbyInvitation, 0);
  objc_storeStrong((id *)&self->_fastSyncSession, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_pendingJoinCompletions, 0);
  objc_storeStrong((id *)&self->_remotePendingParticipants, 0);
  objc_storeStrong((id *)&self->_pendingParticipantsMap, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_members, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end