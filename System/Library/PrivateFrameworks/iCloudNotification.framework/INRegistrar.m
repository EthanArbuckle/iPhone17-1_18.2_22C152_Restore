@interface INRegistrar
- (INRegistrar)init;
- (void)_handleRegistrationResponse:(id)a3 forRequest:(id)a4 digest:(id)a5 account:(id)a6 completion:(id)a7;
- (void)_handleUnregistrationResponse:(id)a3 account:(id)a4 completion:(id)a5;
- (void)registerForLoggedOutPushWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)registerForPushNotificationsWithAccount:(id)a3 pushToken:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)unregisterFromLoggedOutPushNotificationsWithToken:(NSData *)a3 reason:(unint64_t)a4 completionHandler:(id)a5;
- (void)unregisterFromPushNotificationsForAccount:(id)a3 pushToken:(id)a4 completion:(id)a5;
@end

@implementation INRegistrar

- (INRegistrar)init
{
  v16.receiver = self;
  v16.super_class = (Class)INRegistrar;
  v2 = [(INRegistrar *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inflightRegistrationRequestsByAccountID = v2->_inflightRegistrationRequestsByAccountID;
    v2->_inflightRegistrationRequestsByAccountID = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unregisteredAccountIDs = v2->_unregisteredAccountIDs;
    v2->_unregisteredAccountIDs = v5;

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    inflightRegistrationLock = v2->_inflightRegistrationLock;
    v2->_inflightRegistrationLock = v7;

    v9 = (NSLock *)objc_alloc_init((Class)NSLock);
    unregisteredAcountsLock = v2->_unregisteredAcountsLock;
    v2->_unregisteredAcountsLock = v9;

    uint64_t v11 = +[INRegistrationDigestCache sharedInstance];
    registrationDigestCache = v2->_registrationDigestCache;
    v2->_registrationDigestCache = (INRegistrationDigestCache *)v11;

    uint64_t v13 = +[AAURLSession sharedSessionWithNoUrlCache];
    aaUrlSession = v2->_aaUrlSession;
    v2->_aaUrlSession = (AAURLSession *)v13;
  }
  return v2;
}

- (void)registerForPushNotificationsWithAccount:(id)a3 pushToken:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[INRegistrationRequest bodyParameterValueForRegistrationReason:a5];
  v14 = _INLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v50 = v10;
    __int16 v51 = 2112;
    v52 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Registration request for account %@ has reason code %@", buf, 0x16u);
  }

  [(NSLock *)self->_unregisteredAcountsLock lock];
  unregisteredAccountIDs = self->_unregisteredAccountIDs;
  objc_super v16 = [(__CFString *)v10 identifier];
  LODWORD(unregisteredAccountIDs) = [(NSMutableArray *)unregisteredAccountIDs containsObject:v16];

  [(NSLock *)self->_unregisteredAcountsLock unlock];
  if (!unregisteredAccountIDs)
  {
    v17 = [(INRequest *)[INRegistrationRequest alloc] initWithAccount:v10 pushToken:v11];
    v18 = v17;
    if (!v17)
    {
      v30 = _INLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1000291BC();
      }

      if (!v12) {
        goto LABEL_36;
      }
      INCreateError();
      v19 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void, INRegistrationDigest *))v12 + 2))(v12, 0, 0, v19);
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    v44 = v13;
    [(INRegistrationRequest *)v17 setRegistrationReason:a5];
    v19 = [[INRegistrationDigest alloc] initWithRegistrationRequest:v18];
    [(NSLock *)self->_inflightRegistrationLock lock];
    inflightRegistrationRequestsByAccountID = self->_inflightRegistrationRequestsByAccountID;
    v21 = [(__CFString *)v10 identifier];
    v22 = [(NSMutableDictionary *)inflightRegistrationRequestsByAccountID objectForKey:v21];

    v23 = _INLogSystem();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v22)
    {
      if (v24) {
        sub_100029340();
      }

      v43 = v22;
      v25 = [[INRegistrationDigest alloc] initWithRegistrationRequest:v22];
      unsigned int v26 = [(INRegistrationDigest *)v25 isEqual:v19];
      v27 = _INLogSystem();
      v28 = v27;
      if (v26)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          sub_10002930C();
        }

        v22 = v43;
LABEL_13:
        [(NSLock *)self->_inflightRegistrationLock unlock];
        v29 = _INLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          sub_1000291FC();
        }

        if (v12) {
          (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 2, 0, 0);
        }
LABEL_34:

        goto LABEL_35;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "The request being prepared looks new!", buf, 2u);
      }

      v22 = v43;
    }
    else
    {
      if (v24) {
        sub_1000292D8();
      }

      if (a5 != 5 && a5)
      {
        v36 = _INLogSystem();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_100029230();
        }

        v37 = [(INRegistrationDigestCache *)self->_registrationDigestCache registrationDigestForAccount:v10 withError:0];
        if (v37)
        {
          v38 = v37;
          unsigned int v39 = [v37 isEqual:v19];
          v40 = _INLogSystem();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v41 = @"YES";
            if (v39) {
              CFStringRef v41 = @"NO";
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v50 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Previous registration digest found. Is it different? %@", buf, 0xCu);
          }

          char v42 = v39;
          uint64_t v13 = v44;
          if (v42) {
            goto LABEL_13;
          }
LABEL_31:
          v31 = v22;
          v32 = _INLogSystem();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v50 = (const __CFString *)v18;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sending registration request %@", buf, 0xCu);
          }

          v33 = self->_inflightRegistrationRequestsByAccountID;
          v34 = [(__CFString *)v10 identifier];
          [(NSMutableDictionary *)v33 setObject:v18 forKey:v34];

          aaUrlSession = self->_aaUrlSession;
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = sub_10000FC64;
          v45[3] = &unk_100041280;
          v45[4] = self;
          v46 = v19;
          v47 = v10;
          id v48 = v12;
          [(INRegistrationRequest *)v18 performRequestWithSession:aaUrlSession withHandler:v45];

          [(NSLock *)self->_inflightRegistrationLock unlock];
          v22 = v31;
          goto LABEL_34;
        }
        _INLogSystem();
        v25 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, &v25->super, OS_LOG_TYPE_DEFAULT, "No previous registration digest was found.", buf, 2u);
        }
      }
      else
      {
        _INLogSystem();
        v25 = (INRegistrationDigest *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v25->super, OS_LOG_TYPE_DEBUG)) {
          sub_100029264();
        }
      }
    }

    goto LABEL_31;
  }
  (*((void (**)(id, uint64_t, void, void))v12 + 2))(v12, 2, 0, 0);
LABEL_37:
}

- (void)_handleRegistrationResponse:(id)a3 forRequest:(id)a4 digest:(id)a5 account:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(id, uint64_t, id, void *))a7;
  inflightRegistrationLock = self->_inflightRegistrationLock;
  id v17 = a4;
  [(NSLock *)inflightRegistrationLock lock];
  inflightRegistrationRequestsByAccountID = self->_inflightRegistrationRequestsByAccountID;
  v19 = [v14 identifier];
  id v20 = [(NSMutableDictionary *)inflightRegistrationRequestsByAccountID objectForKey:v19];

  if (v20 != v17)
  {
    v21 = _INLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "This response is for a stale request. We have another one in-flight.", buf, 2u);
    }

    v22 = 0;
    id v23 = 0;
    uint64_t v24 = 2;
    goto LABEL_14;
  }
  v25 = self->_inflightRegistrationRequestsByAccountID;
  unsigned int v26 = [v14 identifier];
  [(NSMutableDictionary *)v25 removeObjectForKey:v26];

  if (!v12 || [v12 isResponseEmpty])
  {
    v27 = _INLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100029408(v12);
    }
LABEL_13:

    v22 = INCreateError();
    id v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_14;
  }
  v28 = [v12 error];

  if (v28)
  {
    v27 = _INLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100029500(v12);
    }
    goto LABEL_13;
  }
  id v23 = [v12 timeToLive];
  registrationDigestCache = self->_registrationDigestCache;
  id v33 = 0;
  unsigned __int8 v30 = [(INRegistrationDigestCache *)registrationDigestCache updateRegistrationDigest:v13 forAccount:v14 withError:&v33];
  id v31 = v33;
  if ((v30 & 1) == 0)
  {
    v32 = _INLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_10002948C();
    }
  }
  v22 = 0;
  uint64_t v24 = 1;
LABEL_14:
  [(NSLock *)self->_inflightRegistrationLock unlock];
  if (v15) {
    v15[2](v15, v24, v23, v22);
  }
}

- (void)unregisterFromPushNotificationsForAccount:(id)a3 pushToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(INRequest *)[INUnregistrationRequest alloc] initWithAccount:v8 pushToken:v10];

  id v12 = _INLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting unregistration request %@", buf, 0xCu);
  }

  if (v11)
  {
    [(NSLock *)self->_unregisteredAcountsLock lock];
    id v13 = _INLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding %@ to unregistered account IDs.", buf, 0xCu);
    }
    unregisteredAccountIDs = self->_unregisteredAccountIDs;
    objc_super v16 = [v8 identifier];
    [(NSMutableArray *)unregisteredAccountIDs addObject:v16];

    [(NSLock *)self->_unregisteredAcountsLock unlock];
    id v17 = _INLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending unregistration request.", buf, 2u);
    }

    aaUrlSession = self->_aaUrlSession;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100010230;
    v21[3] = &unk_1000412A8;
    v21[4] = self;
    id v22 = v8;
    id v23 = v9;
    [(INUnregistrationRequest *)v11 performRequestWithSession:aaUrlSession withHandler:v21];
  }
  else
  {
    v19 = _INLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100029584();
    }

    id v20 = INCreateError();
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v20);
  }
}

- (void)_handleUnregistrationResponse:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  if (v8)
  {
    id v11 = [v8 error];

    if (!v11)
    {
      registrationDigestCache = self->_registrationDigestCache;
      id v17 = 0;
      uint64_t v15 = [(INRegistrationDigestCache *)registrationDigestCache removeRegistrationDigestForAccount:v9 withError:&v17];
      id v13 = v17;
      if ((v15 & 1) == 0)
      {
        objc_super v16 = _INLogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000296F0();
        }
      }
      if (v10) {
        v10[2](v10, 1, 0);
      }
      goto LABEL_13;
    }
  }
  id v12 = _INLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10002966C(v8);
  }

  if (v10)
  {
    INCreateError();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v13);
LABEL_13:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaUrlSession, 0);
  objc_storeStrong((id *)&self->_registrationDigestCache, 0);
  objc_storeStrong((id *)&self->_unregisteredAcountsLock, 0);
  objc_storeStrong((id *)&self->_inflightRegistrationLock, 0);
  objc_storeStrong((id *)&self->_unregisteredAccountIDs, 0);
  objc_storeStrong((id *)&self->_inflightRegistrationRequestsByAccountID, 0);
}

- (void)registerForLoggedOutPushWithToken:(id)a3 reason:(unint64_t)a4 completion:(id)a5
{
  sub_10001E620(&qword_10004E2B8);
  __chkstk_darwin();
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a5);
  id v12 = a3;
  id v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v14;
  v19[5] = v16;
  v19[6] = a4;
  v19[7] = v13;
  v19[8] = sub_100025CB4;
  v19[9] = v17;
  id v20 = v13;
  sub_10001F8A8(v14, v16);
  swift_retain();
  sub_10001F6FC((uint64_t)v10, (uint64_t)&unk_10004E3A8, (uint64_t)v19);
  swift_release();
  swift_release();
  sub_10001ED84(v14, v16);
}

- (void)unregisterFromLoggedOutPushNotificationsWithToken:(NSData *)a3 reason:(unint64_t)a4 completionHandler:(id)a5
{
  sub_10001E620(&qword_10004E2B8);
  __chkstk_darwin();
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = _Block_copy(a5);
  id v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10004E370;
  v14[5] = v12;
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10004E380;
  v15[5] = v14;
  unint64_t v16 = a3;
  uint64_t v17 = self;
  sub_100022210((uint64_t)v10, (uint64_t)&unk_10004E390, (uint64_t)v15);
  swift_release();
}

@end