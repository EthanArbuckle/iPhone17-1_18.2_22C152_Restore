@interface GKInviteSession
- (BOOL)shouldBeCleared;
- (CKRecordID)shareRecordID;
- (GKInviteSession)init;
- (GKInviteSession)initWithSessionToken:(id)a3;
- (NSArray)responses;
- (NSData)sessionToken;
- (NSMutableArray)invitedPlayers;
- (NSMutableArray)shareInvitees;
- (NSMutableDictionary)invitees;
- (OS_dispatch_queue)syncQueue;
- (id)allInvitees;
- (id)referencesForInvitee:(id)a3;
- (void)addInvitee:(id)a3 reference:(id)a4;
- (void)addResponse:(id)a3;
- (void)performAsync:(id)a3;
- (void)performSync:(id)a3;
- (void)removeAllInvitees;
- (void)removeAllResponses;
- (void)removeInvitee:(id)a3 reference:(id)a4;
- (void)setInvitedPlayers:(id)a3;
- (void)setInvitees:(id)a3;
- (void)setResponses:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setShareInvitees:(id)a3;
- (void)setShareRecordID:(id)a3;
- (void)setSyncQueue:(id)a3;
@end

@implementation GKInviteSession

- (GKInviteSession)init
{
  v15.receiver = self;
  v15.super_class = (Class)GKInviteSession;
  v2 = [(GKInviteSession *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.gamed.invitesession", v3);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    invitees = v2->_invitees;
    v2->_invitees = v6;

    v8 = (NSArray *)objc_alloc_init((Class)NSArray);
    responses = v2->_responses;
    v2->_responses = v8;

    v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    invitedPlayers = v2->_invitedPlayers;
    v2->_invitedPlayers = v10;

    v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    shareInvitees = v2->_shareInvitees;
    v2->_shareInvitees = v12;
  }
  return v2;
}

- (GKInviteSession)initWithSessionToken:(id)a3
{
  id v5 = a3;
  v6 = [(GKInviteSession *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionToken, a3);
  }

  return v7;
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKInviteSession: performAsync", v7, 2u);
  }
  dispatch_async((dispatch_queue_t)self->_syncQueue, v4);
}

- (void)performSync:(id)a3
{
}

- (void)addInvitee:(id)a3 reference:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [v11 playerID];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_invitees objectForKey:v7];
    if (v8)
    {
      if (!v6)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      v8 = +[NSMutableSet setWithCapacity:0];
      [(NSMutableDictionary *)self->_invitees setObject:v8 forKey:v7];
      [(NSMutableArray *)self->_invitedPlayers addObject:v11];
      v9 = +[GKDataRequestManager sharedManager];
      v10 = +[NSString stringWithFormat:@"inviteInvitee.%@", v7];
      [v9 beginTransaction:v10];

      if (!v6) {
        goto LABEL_5;
      }
    }
    [v8 addObject:v6];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)removeInvitee:(id)a3 reference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    id v11 = [v6 debugDescription];
    *(_DWORD *)buf = 138412546;
    v36 = v11;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKInviteSession: removeInvitee: %@ refrence: %@", buf, 0x16u);
  }
  v12 = [v6 playerID];
  if (v12)
  {
    v13 = [(NSMutableDictionary *)self->_invitees objectForKey:v12];
    v14 = v13;
    if (v13)
    {
      if (!v7 || ([v13 removeObject:v7], !objc_msgSend(v14, "count")))
      {
        [(NSMutableDictionary *)self->_invitees removeObjectForKey:v12];
        [(NSMutableArray *)self->_invitedPlayers removeObject:v6];
        if (!os_log_GKGeneral) {
          id v15 = (id)GKOSLoggers();
        }
        v16 = os_log_GKTrace;
        if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKInviteSession: removeInvitee: reference exist and player has been removed from _invitees/_invitedPlayers", buf, 2u);
        }
        v17 = +[GKDataRequestManager sharedManager];
        v18 = +[NSString stringWithFormat:@"inviteInvitee.%@", v12];
        [v17 endTransaction:v18];
      }
    }
    if ([(NSMutableDictionary *)self->_invitees count]
      || [(NSMutableArray *)self->_shareInvitees count])
    {
      if (!os_log_GKGeneral) {
        id v19 = (id)GKOSLoggers();
      }
      v20 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v21 = v20;
        v22 = [(GKInviteSession *)self sessionToken];
        *(_DWORD *)buf = 138412290;
        v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "GKInviteSession - Still have invitees in invite session, %@", buf, 0xCu);
      }
      if (!os_log_GKGeneral) {
        id v23 = (id)GKOSLoggers();
      }
      v24 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        v26 = [(GKInviteSession *)self invitees];
        *(_DWORD *)buf = 138412290;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "invitees %@", buf, 0xCu);
      }
      if (!os_log_GKGeneral) {
        id v27 = (id)GKOSLoggers();
      }
      v28 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v29 = v28;
        v30 = [(GKInviteSession *)self shareInvitees];
        *(_DWORD *)buf = 138412290;
        v36 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "shareInvitees %@", buf, 0xCu);
      }
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v31 = (id)GKOSLoggers();
      }
      v32 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v33 = v32;
        v34 = [(GKInviteSession *)self sessionToken];
        *(_DWORD *)buf = 138412290;
        v36 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "No more invitees, clearing session token %@", buf, 0xCu);
      }
      [(GKInviteSession *)self setSessionToken:0];
    }
  }
}

- (id)referencesForInvitee:(id)a3
{
  invitees = self->_invitees;
  id v4 = [a3 playerID];
  id v5 = [(NSMutableDictionary *)invitees objectForKey:v4];

  return v5;
}

- (id)allInvitees
{
  return +[NSArray arrayWithArray:self->_invitedPlayers];
}

- (void)removeAllInvitees
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllInvitees", buf, 2u);
  }
  id v5 = +[GKDataRequestManager sharedManager];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_invitees;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) conciseDescription];
        v12 = +[NSString stringWithFormat:@"inviteInvitee.%@", v11];
        [v5 endTransaction:v12];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->_invitees removeAllObjects];
  [(NSMutableArray *)self->_invitedPlayers removeAllObjects];
  [(NSMutableArray *)self->_shareInvitees removeAllObjects];
}

- (void)addResponse:(id)a3
{
  id v4 = [(NSArray *)self->_responses arrayByAddingObject:a3];
  [(GKInviteSession *)self setResponses:v4];
}

- (void)removeAllResponses
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession: removeAllResponses", v6, 2u);
  }
  id v5 = +[NSArray array];
  [(GKInviteSession *)self setResponses:v5];
}

- (BOOL)shouldBeCleared
{
  if ([(NSMutableDictionary *)self->_invitees count]
    || [(NSArray *)self->_responses count]
    || [(NSMutableArray *)self->_shareInvitees count])
  {
    if (!os_log_GKGeneral) {
      id v3 = (id)GKOSLoggers();
    }
    id v4 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKInviteSession - SHOULD NOT be cleared because still have items:", (uint8_t *)&v16, 2u);
    }
    if (!os_log_GKGeneral) {
      id v5 = (id)GKOSLoggers();
    }
    id v6 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      invitees = self->_invitees;
      int v16 = 138412290;
      v17 = invitees;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "invitees %@", (uint8_t *)&v16, 0xCu);
    }
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    uint64_t v9 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      shareInvitees = self->_shareInvitees;
      int v16 = 138412290;
      v17 = shareInvitees;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "shareInvitees %@", (uint8_t *)&v16, 0xCu);
    }
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    v12 = os_log_GKMatch;
    BOOL v13 = os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO);
    if (v13)
    {
      responses = self->_responses;
      int v16 = 138412290;
      v17 = responses;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "responses %@", (uint8_t *)&v16, 0xCu);
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSMutableArray)shareInvitees
{
  return self->_shareInvitees;
}

- (void)setShareInvitees:(id)a3
{
}

- (CKRecordID)shareRecordID
{
  return self->_shareRecordID;
}

- (void)setShareRecordID:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
}

- (NSMutableArray)invitedPlayers
{
  return self->_invitedPlayers;
}

- (void)setInvitedPlayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedPlayers, 0);
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_shareRecordID, 0);
  objc_storeStrong((id *)&self->_shareInvitees, 0);

  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end