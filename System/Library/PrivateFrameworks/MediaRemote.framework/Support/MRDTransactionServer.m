@interface MRDTransactionServer
- (MRDTransactionServer)init;
- (NSMutableArray)transactions;
- (unint64_t)transactionRequestingMemorySize:(id)a3;
- (void)_sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)adjustMemory:(int64_t)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleContentItemTransaction:(id)a3 packets:(id)a4 group:(id)a5;
- (void)handlePlaybackQueueRequestTransaction:(id)a3 packets:(id)a4 group:(id)a5;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)sendContentItemTransactionWithPlaybackQueue:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)transaction:(id)a3 didReceivePackets:(id)a4 receivedSize:(unint64_t)a5 requestedSize:(unint64_t)a6 queue:(id)a7 completion:(id)a8;
- (void)transactionDidEnd:(id)a3 bytesRemaining:(unint64_t)a4;
@end

@implementation MRDTransactionServer

- (MRDTransactionServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRDTransactionServer;
  v2 = [(MRDTransactionServer *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.transactionServer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[MRUserSettings currentSettings];
    v2->_allowedMemory = (unint64_t)[v6 maxTransactionMemorySize];
    [v6 transactionWaitDurationOnXpcSend];
    v2->_transactionWaitDuration = v7;
  }
  return v2;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "MRXPC_TRANSACTION_NAME");
  if (uint64 > 0xA)
  {
    objc_super v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRTransactionServer] Unhandled transaction name: %ld", buf, 0xCu);
    }
  }
  else
  {
    double v7 = [[MRTransaction alloc] initWithName:uint64 fromMessage:v5 withDelegate:self];
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100087FE0;
    v10[3] = &unk_1004158D8;
    v10[4] = self;
    v11 = v7;
    objc_super v9 = v7;
    dispatch_sync((dispatch_queue_t)queue, v10);
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000880DC;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)transactionDidEnd:(id)a3 bytesRemaining:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000881E0;
  block[3] = &unk_100415AA8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (unint64_t)transactionRequestingMemorySize:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000882F4;
  block[3] = &unk_100419598;
  unint64_t v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)transaction:(id)a3 didReceivePackets:(id)a4 receivedSize:(unint64_t)a5 requestedSize:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088574;
  block[3] = &unk_100415C38;
  void block[4] = self;
  void block[5] = a6;
  block[6] = a5;
  v18 = a7;
  dispatch_sync((dispatch_queue_t)queue, block);
  v19 = dispatch_group_create();
  v20 = (char *)[v14 name];
  if ((unint64_t)(v20 - 2) >= 6)
  {
    if (v20 == (char *)10)
    {
      [(MRDTransactionServer *)self handlePlaybackQueueRequestTransaction:v14 packets:v15 group:v19];
    }
    else
    {
      v22 = _MRLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRTransactionServer] Unhandled Transaction delegate callback", buf, 2u);
      }
    }
  }
  else
  {
    [(MRDTransactionServer *)self handleContentItemTransaction:v14 packets:v15 group:v19];
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100088588;
  v23[3] = &unk_1004195C0;
  id v24 = v16;
  unint64_t v25 = a5;
  v23[4] = self;
  id v21 = v16;
  dispatch_group_notify(v19, v18, v23);
}

- (void)adjustMemory:(int64_t)a3
{
  if (a3)
  {
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10032C5F4((uint64_t)self, a3, v5);
    }

    self->_usedMemory += a3;
  }
}

- (void)handlePlaybackQueueRequestTransaction:(id)a3 packets:(id)a4 group:(id)a5
{
  id v38 = a3;
  id v37 = a4;
  unint64_t v7 = a5;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10032C68C(v38);
  }

  objc_super v9 = +[MRDMediaRemoteServer server];
  id v10 = [v9 allClients];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  long long v47 = 0u;
  id obj = v10;
  id v36 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v48;
    group = v7;
    while (2)
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v48 != v35) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v12 = objc_msgSend(v34, "playbackQueueRequests", group);
        uint64_t v13 = [v38 playerPath];
        id v14 = [v12 subscriptionControllerForPlayerPath:v13];

        id v15 = objc_alloc_init((Class)NSMutableArray);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v16 = v37;
        id v17 = [v16 countByEnumeratingWithState:&v43 objects:v59 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v44;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
              v22 = [v21 key];
              v23 = [v22 identifier];

              if ([v14 hasRequest:v23]) {
                [v15 addObject:v21];
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v43 objects:v59 count:16];
          }
          while (v18);
        }

        if ([v15 count])
        {
          id v24 = +[NSUUID UUID];
          unint64_t v25 = [v24 UUIDString];

          v26 = _MRLogForCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            [v38 name];
            v30 = MRTransactionNameGetDescription();
            v31 = MRTransactionPacketsGetKeys();
            *(_DWORD *)buf = 138413058;
            v52 = v25;
            __int16 v53 = 2112;
            v54 = v30;
            __int16 v55 = 2112;
            v56 = v34;
            __int16 v57 = 2112;
            v58 = v31;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[MRTransactionServer] %@ %@ sending client %@ subscribed packets %@", buf, 0x2Au);
          }
          unint64_t v7 = group;
          if (group) {
            dispatch_group_enter(group);
          }
          v27 = [v34 connection];
          v28 = [v27 connection];
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100088B0C;
          v39[3] = &unk_1004195E8;
          id v40 = v25;
          v41 = group;
          id v42 = v38;
          id v29 = v25;
          [v42 send:v15 toConnection:v28 completion:v39];

          goto LABEL_26;
        }
      }
      unint64_t v7 = group;
      id v36 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v36) {
        continue;
      }
      break;
    }
  }
LABEL_26:
}

- (void)handleContentItemTransaction:(id)a3 packets:(id)a4 group:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = a5;
  long long v45 = v8;
  long long v47 = sub_10008915C(v8);
  id v10 = _MRLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10032C7B0(v7, v47);
  }

  unint64_t v11 = +[MRDMediaRemoteServer server];
  v12 = [v11 allClients];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id obj = v12;
  id v48 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v48)
  {
    uint64_t v46 = *(void *)v72;
    *(void *)&long long v13 = 138412802;
    long long v41 = v13;
    group = v9;
    long long v44 = v7;
    do
    {
      for (i = 0; i != v48; i = (char *)i + 1)
      {
        if (*(void *)v72 != v46) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v16 = objc_msgSend(objc_alloc((Class)MRPlaybackQueueRequest), "initFromTransactionName:", objc_msgSend(v7, "name"));
        id v17 = [v15 playbackQueueRequests];
        id v18 = [v7 playerPath];
        uint64_t v19 = [v17 subscriptionControllerForPlayerPath:v18];

        v20 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v47 count]);
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10008937C;
        v67[3] = &unk_100419610;
        id v21 = v16;
        id v68 = v21;
        id v22 = v19;
        id v69 = v22;
        id v23 = v20;
        id v70 = v23;
        [v47 enumerateKeysAndObjectsUsingBlock:v67];
        v56 = v23;
        if ([v23 count])
        {
          id v49 = v22;
          long long v50 = v15;
          id v51 = v21;
          v52 = i;
          id v54 = objc_alloc_init((Class)NSMutableArray);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v53 = v45;
          id v24 = [v53 countByEnumeratingWithState:&v63 objects:v82 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v55 = *(void *)v64;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v64 != v55) {
                  objc_enumerationMutation(v53);
                }
                v27 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                id v28 = v56;
                id v29 = [v28 countByEnumeratingWithState:&v59 objects:v81 count:16];
                if (v29)
                {
                  id v30 = v29;
                  uint64_t v31 = *(void *)v60;
                  while (2)
                  {
                    for (k = 0; k != v30; k = (char *)k + 1)
                    {
                      if (*(void *)v60 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      v33 = *(void **)(*((void *)&v59 + 1) + 8 * (void)k);
                      v34 = objc_msgSend(v27, "key", v41);
                      uint64_t v35 = [v34 identifier];
                      LODWORD(v33) = [v33 isEqualToString:v35];

                      if (v33)
                      {
                        [v54 addObject:v27];
                        goto LABEL_24;
                      }
                    }
                    id v30 = [v28 countByEnumeratingWithState:&v59 objects:v81 count:16];
                    if (v30) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_24:
              }
              id v25 = [v53 countByEnumeratingWithState:&v63 objects:v82 count:16];
            }
            while (v25);
          }

          id v36 = _MRLogForCategory();
          id v7 = v44;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            [v44 name];
            v39 = MRTransactionNameGetDescription();
            id v40 = MRTransactionPacketsGetKeys();
            *(_DWORD *)buf = v41;
            v76 = v39;
            __int16 v77 = 2112;
            v78 = v50;
            __int16 v79 = 2112;
            v80 = v40;
            _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "[MRTransactionServer] %@ sending client %@ subscribed packets %@", buf, 0x20u);
          }
          objc_super v9 = group;
          i = v52;
          if (group) {
            dispatch_group_enter(group);
          }
          id v37 = objc_msgSend(v50, "connection", v41);
          id v38 = [v37 connection];
          v57[0] = _NSConcreteStackBlock;
          v57[1] = 3221225472;
          v57[2] = sub_10008945C;
          v57[3] = &unk_100419638;
          v58 = group;
          [v44 send:v54 toConnection:v38 completion:v57];

          id v21 = v51;
          id v22 = v49;
        }
      }
      id v48 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
    }
    while (v48);
  }
}

- (void)sendContentItemTransactionWithPlaybackQueue:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13)
  {
    id v10 = [v13 contentItems];
    id v11 = [v10 count];

    if (v11)
    {
      v12 = [v13 contentItems];
      if (v12) {
        [(MRDTransactionServer *)self sendContentItemTransaction:v12 request:v8 playerPath:v9];
      }
    }
  }
}

- (void)sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100089624;
    v11[3] = &unk_1004162F8;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)_sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v25 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    uint64_t v27 = _kMRPlaybackQueueRequestIDUserInfoKey;
    id v8 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr_0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        id v10 = MRContentItemGetAncestorIdentifier();
        for (uint64_t i = 2; i != 9; ++i)
        {
          id v12 = [objc_alloc((Class)v8[450]) initFromTransactionName:i];
          id v13 = (void *)MRContentItemCreateFromRequest();
          if ((MRContentItemIsEmpty() & 1) == 0)
          {
            id v14 = objc_alloc_init((Class)_MRTransactionKeyProtobuf);
            uint64_t v15 = [v30 requestIdentifier];
            id v16 = (void *)v15;
            if (v15)
            {
              uint64_t v36 = v27;
              uint64_t v37 = v15;
              id v17 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
              id v18 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:0];
            }
            else
            {
              id v18 = 0;
            }
            [v14 setIdentifier:v10];
            [v14 setUserData:v18];

            ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation();
            id v20 = [objc_alloc((Class)MRTransactionPacket) initWithData:ExternalRepresentation forKey:v14];
            id v21 = [[MRTransaction alloc] initWithName:i playerPath:v29];
            id v35 = v20;
            id v22 = +[NSArray arrayWithObjects:&v35 count:1];
            [(MRDTransactionServer *)self handleContentItemTransaction:v21 packets:v22 group:0];

            id v8 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr_0;
          }
        }
        uint64_t v9 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v25);
  }
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end