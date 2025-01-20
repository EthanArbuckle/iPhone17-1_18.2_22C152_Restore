@interface CLIndoorBackgroundTasks
- (CLIndoorBackgroundTasks)init;
- (CLIndoorBackgroundTasks)initWithService:(id)a3;
- (void)checkIn;
- (void)handleCheckIn:(id)a3 withPolicy:(const void *)a4 andName:(const char *)a5;
- (void)handleTileCleanup:(id)a3;
- (void)handleTileCleanupCheckIn:(id)a3;
- (void)handleVacuumDBs:(id)a3;
- (void)handleVacuumDBsCheckIn:(id)a3;
@end

@implementation CLIndoorBackgroundTasks

- (CLIndoorBackgroundTasks)init
{
  return 0;
}

- (CLIndoorBackgroundTasks)initWithService:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorBackgroundTasks;
  v5 = [(CLIndoorBackgroundTasks *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_service, v4);
    [(CLIndoorBackgroundTasks *)v6 checkIn];
    v7 = v6;
  }

  return v6;
}

- (void)checkIn
{
  objc_initWeak(&location, self);
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B028);
    v3 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v3 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Checking in to activities", (uint8_t *)buf, 2u);
  }
LABEL_4:
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3321888768;
  handler[2] = sub_100381610;
  handler[3] = &unk_10046AFC8;
  objc_copyWeak(buf, &location);
  objc_copyWeak(&v9, buf);
  xpc_activity_register("com.apple.indoor.ClearTiles", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(buf);
  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_1003817C8;
  v5[3] = &unk_10046AFF8;
  objc_copyWeak(&v4, buf);
  objc_copyWeak(&v6, &v4);
  xpc_activity_register("com.apple.indoor.VacuumDBs", XPC_ACTIVITY_CHECK_IN, v5);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleCheckIn:(id)a3 withPolicy:(const void *)a4 andName:(const char *)a5
{
  v7 = (_xpc_activity_s *)a3;
  xpc_object_t v8 = xpc_activity_copy_criteria(v7);
  if (!v8)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    sub_100381E0C((uint64_t)a4, v8);
    xpc_activity_set_criteria(v7, v8);
    if (qword_10047BEF8 == -1)
    {
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B028);
      id v9 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
    }
    *(_DWORD *)buf = 136446210;
    *(void *)v27 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering %{public}s activity for the first time", buf, 0xCu);
    goto LABEL_45;
  }
  sub_100381F54((uint64_t)buf, v8);
  if (buf[0] && *(unsigned char *)a4)
  {
    if (*(double *)&v27[4] != *((double *)a4 + 1)) {
      goto LABEL_34;
    }
  }
  else if ((buf[0] != 0) == (*(unsigned char *)a4 == 0))
  {
    goto LABEL_34;
  }
  if (v28 && *((unsigned char *)a4 + 16))
  {
    if (v29 != *((double *)a4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((v28 != 0) == (*((unsigned char *)a4 + 16) == 0))
  {
    goto LABEL_34;
  }
  if (v30 && *((unsigned char *)a4 + 32))
  {
    if (v31 != *((double *)a4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((v30 != 0) == (*((unsigned char *)a4 + 32) == 0))
  {
    goto LABEL_34;
  }
  v10 = (char *)*((void *)a4 + 6);
  if (__s1 != v10 && (!__s1 || !v10 || strcmp(__s1, v10)) || v33 != *((_DWORD *)a4 + 14))
  {
LABEL_34:
    if (qword_10047BEF8 != -1) {
      dispatch_once(&qword_10047BEF8, &stru_10046B028);
    }
    v13 = (id)qword_10047BF00;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    sub_100380E3C((uint64_t)buf, &__p);
    int v14 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    std::string::size_type v15 = __p.__r_.__value_.__r.__words[0];
    sub_100380E3C((uint64_t)a4, &v25);
    p_p = &__p;
    if (v14 < 0) {
      p_p = (std::string *)v15;
    }
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v17 = &v25;
    }
    else {
      v17 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)v19 = 136446722;
    v20 = a5;
    __int16 v21 = 2082;
    v22 = p_p;
    __int16 v23 = 2082;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s activity registered as %{public}s. Changing to %{public}s", v19, 0x20u);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v25.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_44;
      }
    }
    else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_44:

      sub_100381E0C((uint64_t)a4, v8);
      xpc_activity_set_criteria(v7, v8);
      goto LABEL_45;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_44;
  }
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046B028);
  }
  v11 = (id)qword_10047BF00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    sub_100381F54((uint64_t)v19, v8);
    sub_100380E3C((uint64_t)v19, &__p);
    v12 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    LODWORD(v25.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = (std::string::size_type)a5;
    WORD2(v25.__r_.__value_.__r.__words[1]) = 2082;
    *(std::string::size_type *)((char *)&v25.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s activity already registered: %{public}s", (uint8_t *)&v25, 0x16u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }

LABEL_45:
}

- (void)handleVacuumDBsCheckIn:(id)a3
{
}

- (void)handleVacuumDBs:(id)a3
{
  id v4 = a3;
  if (xpc_activity_set_state((xpc_activity_t)v4, 4))
  {
    if (qword_10047BEF8 == -1)
    {
      v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10038232C;
        v11[3] = &unk_1004527B8;
        id v12 = v4;
        id v6 = objc_retainBlock(v11);
        [WeakRetained fullyVacuumAllDBsWithReply:v6];

LABEL_7:
        return;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B028);
      v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Requesting vacuum of databases", buf, 2u);
    goto LABEL_6;
  }
  if (qword_10047BEF8 == -1)
  {
    id v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B028);
    id v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
  *(_WORD *)buf = 0;
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set tile cleanup to continue state", buf, 2u);
}

- (void)handleTileCleanupCheckIn:(id)a3
{
  id v4 = a3;
  *(void *)&long long buf = sub_1001637C8();
  *((void *)&buf + 1) = v5;
  char v7 = 0;
  if (!sub_100059C20((uint64_t)&buf, &v7))
  {
    [(CLIndoorBackgroundTasks *)self handleCheckIn:v4 withPolicy:&byte_10047E810 andName:"tile cleanup"];
    goto LABEL_6;
  }
  [(CLIndoorBackgroundTasks *)self handleCheckIn:v4 withPolicy:&byte_10047E890 andName:"tile cleanup"];
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046B028);
    id v6 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  id v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    LODWORD(buf) = 134349056;
    *(double *)((char *)&buf + 4) = (double)(int)*(double *)&qword_10047E898 / 3600.0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@CtsClear, override, %{public}.1f", (uint8_t *)&buf, 0xCu);
  }
LABEL_6:
}

- (void)handleTileCleanup:(id)a3
{
  id v4 = (_xpc_activity_s *)a3;
  if (xpc_activity_set_state(v4, 4))
  {
    if (qword_10047BEF8 == -1)
    {
      v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046B028);
      v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
      {
LABEL_6:
        uint64_t v5 = objc_alloc_init(CLIndoorTileEvictionPolicy);
        [(CLIndoorTileEvictionPolicy *)v5 setActivity:v4];
        *(void *)&long long buf = sub_1001637C8();
        *((void *)&buf + 1) = v6;
        char v20 = 0;
        if (!sub_100059C20((uint64_t)&buf, &v20))
        {
          double v10 = *(double *)&qword_10047E818;
          int v11 = byte_10047E820;
          uint64_t v12 = qword_10047E828;
          [(CLIndoorTileEvictionPolicy *)v5 maxModifiedAge];
          double v14 = v10 * 0.5;
          if (v11) {
            double v14 = *(double *)&v12;
          }
          [(CLIndoorTileEvictionPolicy *)v5 setMaxModifiedAge:v13 - (v10 + v14)];
          goto LABEL_20;
        }
        double v7 = *(double *)&qword_10047E8A8;
        if (!byte_10047E8A0) {
          double v7 = *(double *)&qword_10047E898 * 0.5;
        }
        [(CLIndoorTileEvictionPolicy *)v5 setMaxModifiedAge:172800.0 - (*(double *)&qword_10047E898 + v7)];
        if (qword_10047BEF8 == -1)
        {
          xpc_object_t v8 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
LABEL_12:

LABEL_20:
            id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
            [WeakRetained clearTiles:v5];

            goto LABEL_21;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046B028);
          xpc_object_t v8 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
        }
        [(CLIndoorTileEvictionPolicy *)v5 maxModifiedAge];
        LODWORD(buf) = 134349056;
        *(double *)((char *)&buf + 4) = v9 / 3600.0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "@TileEvict, override, %{public}.1f", (uint8_t *)&buf, 0xCu);
        goto LABEL_12;
      }
    }
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting periodic tile cleanup", (uint8_t *)&buf, 2u);
    goto LABEL_6;
  }
  if (qword_10047BEF8 == -1)
  {
    v18 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
LABEL_16:
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "@CtsClear, Failed to set tile cleanup to continue state", (uint8_t *)&buf, 2u);
    goto LABEL_21;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046B028);
  v18 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
    goto LABEL_16;
  }
LABEL_21:
}

- (void).cxx_destruct
{
}

@end