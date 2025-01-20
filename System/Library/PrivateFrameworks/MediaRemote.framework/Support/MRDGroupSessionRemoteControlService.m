@interface MRDGroupSessionRemoteControlService
- (MRDGroupSessionRemoteControlService)initWithGroupSessionManager:(id)a3 delegate:(id)a4;
- (MRDGroupSessionRemoteControlServiceDelegate)delegate;
- (NSMapTable)connections;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
@end

@implementation MRDGroupSessionRemoteControlService

- (MRDGroupSessionRemoteControlService)initWithGroupSessionManager:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDGroupSessionRemoteControlService;
  v8 = [(MRDGroupSessionRemoteControlService *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = +[NSMapTable weakToStrongObjectsMapTable];
    connections = v9->_connections;
    v9->_connections = (NSMapTable *)v10;

    [v6 addObserver:v9];
    v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionRemoteControlService] <%@> Initialized", buf, 0xCu);
    }
  }
  return v9;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionRemoteControlService] <%@> Dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRDGroupSessionRemoteControlService;
  [(MRDGroupSessionRemoteControlService *)&v4 dealloc];
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v7 = a4;
  v5 = [(MRDGroupSessionRemoteControlService *)self connections];
  id v6 = +[NSMapTable strongToStrongObjectsMapTable];
  [v5 setObject:v6 forKey:v7];

  [v7 addObserver:self];
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  id v6 = a4;
  v5 = [(MRDGroupSessionRemoteControlService *)self connections];
  [v5 removeObjectForKey:v6];

  [v6 removeObserver:self];
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "msv_compactMap:", &stru_100419830);
  v52 = v7;
  uint64_t v9 = objc_msgSend(v7, "msv_compactMap:", &stru_100419850);
  v47 = (void *)v8;
  uint64_t v10 = +[NSMutableSet setWithArray:v8];
  v46 = (void *)v9;
  v11 = +[NSMutableSet setWithArray:v9];
  v12 = [v6 leader];
  v13 = [v12 identifier];
  [v10 removeObject:v13];

  objc_super v14 = [v6 leader];
  v15 = [v14 identifier];
  v44 = v11;
  [v11 removeObject:v15];

  v16 = [(MRDGroupSessionRemoteControlService *)self connections];
  v17 = [v16 objectForKey:v6];
  v18 = [v17 keyEnumerator];
  v19 = [v18 allObjects];
  v20 = +[NSMutableSet setWithArray:v19];

  id v48 = [v10 mutableCopy];
  [v48 minusSet:v20];
  v43 = v20;
  id v21 = [v20 mutableCopy];
  v45 = v10;
  [v21 minusSet:v10];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v21;
  id v22 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v59;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v59 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v27 = _MRLogForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v63 = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionRemoteControlService] Disconnecting removed participant: %@", buf, 0xCu);
        }

        id v28 = [objc_alloc((Class)NSError) initWithMRError:104 description:@"Participant removed"];
        v29 = [(MRDGroupSessionRemoteControlService *)self connections];
        v30 = [v29 objectForKey:v6];
        v31 = [v30 objectForKey:v26];
        [v31 closeWithError:v28];

        v32 = [(MRDGroupSessionRemoteControlService *)self connections];
        v33 = [v32 objectForKey:v6];
        [v33 removeObjectForKey:v26];
      }
      id v23 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v23);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v49 = v48;
  id v34 = [v49 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v51 = *(void *)v55;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v55 != v51) {
          objc_enumerationMutation(v49);
        }
        uint64_t v37 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v36);
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10008DE74;
        v53[3] = &unk_100419878;
        v53[4] = v37;
        v38 = objc_msgSend(v52, "msv_firstWhere:", v53);
        if (v38)
        {
          v39 = [[MRDGroupSessionTransportConnection alloc] initWithGroupSession:v6 participant:v38];
          v40 = [(MRDGroupSessionRemoteControlService *)self connections];
          v41 = [v40 objectForKey:v6];
          [v41 setObject:v39 forKey:v37];

          v42 = [(MRDGroupSessionRemoteControlService *)self delegate];
          [v42 groupSessionRemoteControlService:self didAcceptConnection:v39];
        }
        else
        {
          _MRLogForCategory();
          v39 = (MRDGroupSessionTransportConnection *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v63 = v37;
            __int16 v64 = 2112;
            id v65 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v39, OS_LOG_TYPE_ERROR, "[MRDGroupSessionRemoteControlService] Could not find added participant with identifier: %@ on session: %@", buf, 0x16u);
          }
        }

        v36 = (char *)v36 + 1;
      }
      while (v35 != v36);
      id v35 = [v49 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v35);
  }
}

- (MRDGroupSessionRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDGroupSessionRemoteControlServiceDelegate *)WeakRetained;
}

- (NSMapTable)connections
{
  return self->_connections;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end