@interface GKAcceptedInviteManager
+ (id)syncQueue;
- (BOOL)removeAndReturnQueuedCancelledInviteWithSessionToken:(id)a3;
- (GKAcceptedInviteManager)init;
- (NSMutableArray)acceptedMultiplayerInvites;
- (NSMutableArray)acceptedTurnBased;
- (NSMutableArray)queuedCancelledMultiplayerInviteSessionTokens;
- (id)_fetchAndRemoveBulletinFromArray:(id)a3 passingTest:(id)a4;
- (id)_fetchObjectFromArray:(id)a3 passingTest:(id)a4;
- (id)description;
- (id)multiplayerInviteForGame:(id)a3;
- (id)multiplayerInviteForGameDescriptor:(id)a3;
- (id)removeAndReturnInviteWithSessionToken:(id)a3;
- (id)removeAndReturnTurnBasedInviteWithMatchID:(id)a3;
- (id)turnBasedInviteForGame:(id)a3;
- (id)turnBasedInviteForGameDescriptor:(id)a3;
- (void)_addBulletin:(id)a3 toArray:(id)a4;
- (void)_insertBulletin:(id)a3 atFrontOfArray:(id)a4;
- (void)addMultiplayerInvite:(id)a3;
- (void)addTurnBasedEvent:(id)a3;
- (void)declineMultiplayerInvite:(id)a3;
- (void)performSync:(id)a3;
- (void)queueCancelledMultiplayerInviteSessionToken:(id)a3;
- (void)setAcceptedMultiplayerInvites:(id)a3;
- (void)setAcceptedTurnBased:(id)a3;
- (void)setQueuedCancelledMultiplayerInviteSessionTokens:(id)a3;
@end

@implementation GKAcceptedInviteManager

- (GKAcceptedInviteManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)GKAcceptedInviteManager;
  v2 = [(GKAcceptedInviteManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    acceptedMultiplayerInvites = v2->_acceptedMultiplayerInvites;
    v2->_acceptedMultiplayerInvites = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedCancelledMultiplayerInviteSessionTokens = v2->_queuedCancelledMultiplayerInviteSessionTokens;
    v2->_queuedCancelledMultiplayerInviteSessionTokens = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    acceptedTurnBased = v2->_acceptedTurnBased;
    v2->_acceptedTurnBased = v7;
  }
  return v2;
}

+ (id)syncQueue
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager syncQueue", v6, 2u);
  }
  if (qword_100329968 != -1) {
    dispatch_once(&qword_100329968, &stru_1002DC408);
  }
  v4 = (void *)qword_100329960;

  return v4;
}

- (void)performSync:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager performSync:", buf, 2u);
  }
  v6 = [(id)objc_opt_class() syncQueue];
  v7 = dispatch_get_current_queue();

  if (v7 == v6)
  {
    label = dispatch_queue_get_label(v6);
    v9 = +[NSThread callStackSymbols];
    objc_super v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the same queue(\"%s\"), would deadlock at %@", "-[GKAcceptedInviteManager performSync:]", label, v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAcceptedInviteManager.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]", v10, "-[GKAcceptedInviteManager performSync:]", [v12 UTF8String], 58);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }
  dispatch_sync(v6, v3);
}

- (void)_addBulletin:(id)a3 toArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _addBulletin: toArray:", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014263C;
  v12[3] = &unk_1002D3B38;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(GKAcceptedInviteManager *)self performSync:v12];
}

- (void)_insertBulletin:(id)a3 atFrontOfArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _insertBulletin:toFrontOfArray:", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100142768;
  v12[3] = &unk_1002D3B38;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(GKAcceptedInviteManager *)self performSync:v12];
}

- (id)_fetchObjectFromArray:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _fetchObjectinFromArray: passingTest:", buf, 2u);
  }
  *(void *)buf = 0;
  v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100142928;
  v22 = sub_100142938;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100142940;
  v14[3] = &unk_1002DC430;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  v17 = buf;
  [(GKAcceptedInviteManager *)self performSync:v14];
  id v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (id)_fetchAndRemoveBulletinFromArray:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager _fetchAndRemoveBulletinFromArray: passingTest:", buf, 2u);
  }
  *(void *)buf = 0;
  v19 = buf;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100142928;
  v22 = sub_100142938;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100142BE0;
  v14[3] = &unk_1002DC430;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  v17 = buf;
  [(GKAcceptedInviteManager *)self performSync:v14];
  id v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (void)addMultiplayerInvite:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager addMultiplayerInvite:", buf, 2u);
  }
  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100142EA4;
  v12[3] = &unk_1002DC458;
  id v8 = v4;
  id v13 = v8;
  v9 = [(GKAcceptedInviteManager *)self _fetchObjectFromArray:queuedCancelledMultiplayerInviteSessionTokens passingTest:v12];
  if (v9)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    id v11 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager remove a queuedCancelledMultiplayerInviteSessionToken: %@", buf, 0xCu);
    }
    [(GKAcceptedInviteManager *)self removeAndReturnQueuedCancelledInviteWithSessionToken:v9];
  }
  [(GKAcceptedInviteManager *)self _insertBulletin:v8 atFrontOfArray:self->_acceptedMultiplayerInvites];
}

- (void)declineMultiplayerInvite:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager declineMultiplayerInvite:", buf, 2u);
  }
  id v7 = [v4 declineReason];

  if (v7)
  {
    [(GKAcceptedInviteManager *)self addMultiplayerInvite:v4];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = os_log_GKMatch;
    if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cannot add a multiplayer invite as a declined invite if there is no declineReason set!", v10, 2u);
    }
  }
}

- (void)queueCancelledMultiplayerInviteSessionToken:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager queueCancelledMultiplayerInvite:", v7, 2u);
  }
  [(GKAcceptedInviteManager *)self _insertBulletin:v4 atFrontOfArray:self->_queuedCancelledMultiplayerInviteSessionTokens];
}

- (void)addTurnBasedEvent:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager addTurnBasedEvent:", v7, 2u);
  }
  [(GKAcceptedInviteManager *)self _addBulletin:v4 toArray:self->_acceptedTurnBased];
}

- (id)removeAndReturnInviteWithSessionToken:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnInviteWithSessionToken:", buf, 2u);
  }
  acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100143298;
  v11[3] = &unk_1002DC480;
  id v12 = v4;
  id v8 = v4;
  v9 = [(GKAcceptedInviteManager *)self _fetchAndRemoveBulletinFromArray:acceptedMultiplayerInvites passingTest:v11];

  return v9;
}

- (BOOL)removeAndReturnQueuedCancelledInviteWithSessionToken:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnQueuedCancelledInviteWithSessionToken:", buf, 2u);
  }
  queuedCancelledMultiplayerInviteSessionTokens = self->_queuedCancelledMultiplayerInviteSessionTokens;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001433F8;
  v12[3] = &unk_1002DC458;
  id v13 = v4;
  id v8 = v4;
  v9 = [(GKAcceptedInviteManager *)self _fetchAndRemoveBulletinFromArray:queuedCancelledMultiplayerInviteSessionTokens passingTest:v12];
  BOOL v10 = v9 != 0;

  return v10;
}

- (id)removeAndReturnTurnBasedInviteWithMatchID:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager removeAndReturnTurnBasedInviteWithMatchID:", buf, 2u);
  }
  acceptedTurnBased = self->_acceptedTurnBased;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100143528;
  v11[3] = &unk_1002DC4A8;
  id v12 = v4;
  id v8 = v4;
  v9 = [(GKAcceptedInviteManager *)self _fetchAndRemoveBulletinFromArray:acceptedTurnBased passingTest:v11];

  return v9;
}

- (id)multiplayerInviteForGame:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager multiplayerInviteForGame:", v10, 2u);
  }
  id v7 = [objc_alloc((Class)GKGameDescriptor) initWithDictionary:v4];
  id v8 = [(GKAcceptedInviteManager *)self multiplayerInviteForGameDescriptor:v7];

  return v8;
}

- (id)multiplayerInviteForGameDescriptor:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager multiplayerInviteForGameDescriptor:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    acceptedMultiplayerInvites = self->_acceptedMultiplayerInvites;
    *(_DWORD *)buf = 138412290;
    v17 = acceptedMultiplayerInvites;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager - accepted invite bulletins %@", buf, 0xCu);
  }
  BOOL v10 = self->_acceptedMultiplayerInvites;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100143804;
  v14[3] = &unk_1002DC480;
  id v15 = v4;
  id v11 = v4;
  id v12 = [(GKAcceptedInviteManager *)self _fetchAndRemoveBulletinFromArray:v10 passingTest:v14];

  return v12;
}

- (id)turnBasedInviteForGame:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager turnBasedInviteForGame:", v10, 2u);
  }
  id v7 = [objc_alloc((Class)GKGameDescriptor) initWithDictionary:v4];
  id v8 = [(GKAcceptedInviteManager *)self turnBasedInviteForGameDescriptor:v7];

  return v8;
}

- (id)turnBasedInviteForGameDescriptor:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKAcceptedInviteManager turnBasedInviteForGameDescriptor:", buf, 2u);
  }
  acceptedTurnBased = self->_acceptedTurnBased;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100143A14;
  v11[3] = &unk_1002DC4D0;
  id v12 = v4;
  id v8 = v4;
  v9 = [(GKAcceptedInviteManager *)self _fetchAndRemoveBulletinFromArray:acceptedTurnBased passingTest:v11];

  return v9;
}

- (id)description
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100142928;
  v9 = sub_100142938;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100143B20;
  v4[3] = &unk_1002D6B58;
  v4[4] = self;
  v4[5] = &v5;
  [(GKAcceptedInviteManager *)self performSync:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSMutableArray)acceptedMultiplayerInvites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAcceptedMultiplayerInvites:(id)a3
{
}

- (NSMutableArray)queuedCancelledMultiplayerInviteSessionTokens
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueuedCancelledMultiplayerInviteSessionTokens:(id)a3
{
}

- (NSMutableArray)acceptedTurnBased
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAcceptedTurnBased:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedTurnBased, 0);
  objc_storeStrong((id *)&self->_queuedCancelledMultiplayerInviteSessionTokens, 0);

  objc_storeStrong((id *)&self->_acceptedMultiplayerInvites, 0);
}

@end