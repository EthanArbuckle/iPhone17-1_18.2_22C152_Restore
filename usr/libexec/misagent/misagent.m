uint64_t sub_100003044(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000314C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@predicate");
  sqlite3_bind_text(a2, v5, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  int v6 = sqlite3_bind_parameter_index(a2, "@wildcard");
  int v7 = *(unsigned __int8 *)(a1 + 48);

  return sqlite3_bind_int(a2, v6, v7);
}

void sub_1000033D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000033F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003408(uint64_t a1)
{
}

uint64_t sub_100003410(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) readSetting:@"databaseSchemaVersion"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v8 = sub_100006ABC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "MISQL: null version, potential erase or updgrade", buf, 2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"1"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE TABLE profiles(uuid TEXT NOT NULL PRIMARY KEY, team_id TEXT NOT NULL, install_time TEXT DEFAULT CURRENT_TIMESTAMP, name TEXT NOT NULL, expires INTEGER, is_for_all_devices INTEGER, is_apple_internal INTEGER, is_local INTEGER, is_beta INTEGER, cms_blob BLOB NOT NULL)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000AB68(a1 + 48);
      }
      goto LABEL_41;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE TABLE certificates(pk INTEGER PRIMARY KEY AUTOINCREMENT, leaf BLOB UNIQUE NOT NULL)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000AAF4(a1 + 48);
      }
      goto LABEL_41;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE UNIQUE INDEX certificate_leaf_index ON certificates (leaf)" withBind:0 withResults:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000AA80(a1 + 48);
      }
      goto LABEL_41;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE TABLE certificate_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, leaf_pk INTEGER NOT NULL, UNIQUE(uuid, leaf_pk), CONSTRAINT fk_certificate_leaf  FOREIGN KEY (leaf_pk)  REFERENCES certificates(pk)  ON DELETE CASCADE, CONSTRAINT fk_cert_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000AA0C(a1 + 48);
      }
      goto LABEL_41;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE TABLE entitlements_provisioning_cache(pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT NOT NULL, predicate TEXT NOT NULL, wildcard INTEGER NOT NULL, UNIQUE(uuid, predicate), CONSTRAINT fk_predicate_profile_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000A998(a1 + 48);
      }
      goto LABEL_41;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE UNIQUE INDEX entitlements_cache_index ON entitlements_provisioning_cache (uuid, predicate)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000A924(a1 + 48);
      }
      goto LABEL_41;
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = @"1";

    int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  if ([v5 isEqualToString:@"1"])
  {
    int v6 = sub_100006ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MISQL: performing database migration 1 -> 2", buf, 2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"2"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"ALTER TABLE profiles ADD COLUMN is_der INTEGER DEFAULT (0)" withBind:0 withResults:0];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000A8B0(a1 + 48);
      }
LABEL_41:
      uint64_t v20 = 0;
LABEL_42:

      return v20;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) executeQuery:@"CREATE TABLE xml_profiles_cache(uuid TEXT NOT NULL PRIMARY KEY, cms_blob BLOB NOT NULL, CONSTRAINT fk_xml_profile_cache_uuid  FOREIGN KEY (uuid)  REFERENCES profiles(uuid)   ON DELETE CASCADE)", 0, 0 withBind withResults];
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      int v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000A83C(a1 + 48);
      }
      goto LABEL_41;
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = @"2";
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"2"])
  {
    v11 = sub_100006ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "MISQL: performing database migration 2 -> 3", buf, 2u);
    }

    [*(id *)(a1 + 32) setSetting:@"databaseSchemaVersion" toValue:@"3"];
    [*(id *)(a1 + 32) findProfilesMatchingEntitlements:&off_1000116C0 withCertificate:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      uint64_t v25 = a1 + 48;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v7);
          }
          v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (!objc_msgSend(v16, "ProvisionsAllDevices", v25)
            && ![v16 AppleInternal])
          {
            v17 = *(void **)(a1 + 32);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100003ACC;
            v26[3] = &unk_100010760;
            v26[4] = v16;
            *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v17 executeQuery:@"UPDATE profiles SET is_beta = 1 WHERE uuid = @uuid" withBind:v26 withResults:0];
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
            {
              v21 = sub_100006ABC();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                sub_10000A7C8(v25);
              }

              goto LABEL_41;
            }
          }
        }
        id v13 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = @"3";

    uint64_t v20 = 1;
    goto LABEL_42;
  }
  return 1;
}

void sub_100003ACC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = [*(id *)(a1 + 32) UUID];
  sqlite3_bind_text(a2, v4, (const char *)[v5 UTF8String], -1, 0);
}

void sub_100003C30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100003C48(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isProfileInstalled:MISProvisioningProfileGetUUID()]) {
    return 1;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 56) insertProfile:*(void *)(a1 + 48)];
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
}

void sub_100003D90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100003DA8(void *a1)
{
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 56) removeProfile:a1[5]];
  return *(_DWORD *)(*(void *)(a1[6] + 8) + 24) == 0;
}

void sub_100003F2C(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"profile_cms_blob"];
  sub_10000A50C(a2, (int)[v5 intValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v6];
}

void sub_100003FB8(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"blob"];
  sub_10000A50C(a2, (int)[v5 intValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObject:v6];
}

void sub_100004104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[BoxedMISProfile fromSQLStatement:a2 withMap:a3];
  [v3 addObject:v4];
}

id sub_100004284(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_100004494(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  return [*(id *)(a1 + 32) appendFormat:@"(%lu,@p%lu)", a3, a3];
}

id sub_1000044EC(uint64_t a1, sqlite3_stmt *a2)
{
  if (*(void *)(a1 + 32))
  {
    int v4 = sqlite3_bind_parameter_index(a2, "@cert");
    sqlite3_bind_blob(a2, v4, [*(id *)(a1 + 32) bytes], (int)[*(id *)(a1 + 32) length], 0);
  }
  int v5 = sqlite3_bind_parameter_index(a2, "@totalPredicates");
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
  sqlite3_bind_int64(a2, v5, (sqlite3_int64)[v6 longLongValue]);

  id result = [*(id *)(a1 + 40) count];
  if (result)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      id v10 = +[NSString stringWithFormat:@"@p%u", v9];
      int v11 = sqlite3_bind_parameter_index(a2, (const char *)[v10 UTF8String]);
      id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
      sqlite3_bind_text(a2, v11, (const char *)[v12 UTF8String], -1, 0);

      unint64_t v8 = (v9 + 1);
      id result = [*(id *)(a1 + 40) count];
      unint64_t v9 = v8;
    }
    while ((unint64_t)result > v8);
  }
  return result;
}

void sub_100004670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[BoxedMISProfile fromSQLStatement:a2 withMap:a3];
  [v3 addObject:v4];
}

uint64_t sub_100004834(uint64_t result, sqlite3_stmt *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    int v4 = sqlite3_bind_parameter_index(a2, "@cert");
    id v5 = [*(id *)(v3 + 32) bytes];
    int v6 = [*(id *)(v3 + 32) length];
    return sqlite3_bind_blob(a2, v4, v5, v6, 0);
  }
  return result;
}

void sub_1000048C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[BoxedMISProfile fromSQLStatement:a2 withMap:a3];
  [v3 addObject:v4];
}

const char *sub_1000049B8(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)a1 + 8) + 24);
  return sqlite3_errstr(v2);
}

void sub_1000049D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const char *sub_100004A04()
{
  return "/Library/MobileDevice/ProvisioningProfiles";
}

void start()
{
  signal(15, (void (__cdecl *)(int))1);
  v0 = sub_100004ADC();
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100004B20;
  handler[3] = &unk_100010898;
  handler[4] = v1;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_resume(v1);
  int v2 = sub_100004ADC();
  mach_service = xpc_connection_create_mach_service("com.apple.misagent", v2, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000108D8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

uint64_t sub_100004ADC()
{
  if (qword_100014B08 != -1) {
    dispatch_once(&qword_100014B08, &stru_100010918);
  }
  return qword_100014B00;
}

void sub_100004B20(uint64_t a1)
{
}

void sub_100004B3C(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_retain(a2);
    xpc_connection_set_finalizer_f((xpc_connection_t)a2, (xpc_finalizer_t)sub_100004CA0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100004D00;
    handler[3] = &unk_100010938;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    id v5 = sub_100006ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000ABDC((uint64_t)string, v5);
    }
  }
}

void sub_100004C44(id a1)
{
  qword_100014B00 = (uint64_t)dispatch_workloop_create_inactive("com.apple.misagent.worker");
  dispatch_set_qos_class_fallback();
  dispatch_workloop_set_scheduler_priority();
  uint64_t v1 = qword_100014B00;

  dispatch_activate(v1);
}

void sub_100004CA0()
{
  v0 = sub_100006ABC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "XPC connection has been town down", v1, 2u);
  }
}

void sub_100004D00(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    CFTypeRef cf = 0;
    if (lockdown_copy_checkin_info())
    {
      sub_1000054D8(*(void **)(a1 + 32), object);
    }
    else
    {
      sub_100007EC0(cf);
      CFRelease(cf);
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error && sub_100005454(object))
  {
    id v5 = sub_100006ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Releasing XPC connection", v6, 2u);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }
}

uint64_t sub_100004DE4(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004E90;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100004E90(uint64_t a1)
{
  if (MISProvisioningProfileIsForBetaDeployment())
  {
    int v2 = sub_100006ABC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempt to install a Beta profile over lockdown connection.", v4, 2u);
    }

    uint64_t result = 3892346911;
  }
  else
  {
    uint64_t result = sub_100004F28(*(void *)(a1 + 40));
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100004F28(uint64_t a1)
{
  uint64_t v2 = sub_1000062F0();
  uint64_t v3 = sub_100006ABC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 67109120;
      LODWORD(UUID) = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "attempt to install invalid profile: 0x%x", (uint8_t *)&v8, 8u);
    }
  }
  else
  {
    if (v4)
    {
      int v8 = 138412290;
      uint64_t UUID = MISProvisioningProfileGetUUID();
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Installing provisioning profile: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = sub_10000639C();
    if ([v5 insertProfile:a1]) {
      uint64_t v2 = 3892346906;
    }
    else {
      uint64_t v2 = 0;
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MISProvisioningProfileInstalled", 0, 0, 0);
  }
  return v2;
}

uint64_t sub_100005070(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000511C;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000511C(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void sub_100005150(uint64_t a1)
{
  uint64_t v2 = sub_100006ABC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing provisioning profile: %@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = sub_10000639C();
  [v3 removeProfile:a1];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MISProvisioningProfileRemoved", 0, 0, 0);
}

uint64_t sub_100005228(uint64_t a1)
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000052D4;
  v3[3] = &unk_100010960;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000052D4(uint64_t a1)
{
  uint64_t v2 = *(__CFArray ***)(a1 + 40);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    uint64_t v4 = Mutable;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v5 = sub_10000639C();
    uint64_t v6 = [v5 allCMSBlobs];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CFArrayAppendValue(v4, *(const void **)(*((void *)&v13 + 1) + 8 * (void)v10));
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    int v11 = 0;
    *uint64_t v2 = v4;
  }
  else
  {
    id v12 = sub_100006ABC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000AC54();
    }

    int v11 = -402620406;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
}

BOOL sub_100005454(xpc_object_t xdict)
{
  if (xdict != &_xpc_error_connection_invalid)
  {
    xpc_dictionary_get_string(xdict, _xpc_error_key_description);
    uint64_t v2 = sub_100006ABC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10000AC88();
    }
  }
  return xdict == &_xpc_error_connection_invalid;
}

void sub_1000054D8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v4, "MessageType");
  v120 = v3;
  v121 = v4;
  if (!string)
  {
    id v7 = sub_100006ABC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000ACF0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_10;
  }
  uint64_t v6 = string;
  if (!strcmp(string, "Ping"))
  {
    long long v15 = (_xpc_connection_s *)v3;
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    xpc_dictionary_set_string(reply, "Payload", "pong!");
    xpc_dictionary_set_uint64(reply, "Status", 0);
    xpc_connection_send_message(v15, reply);

    goto LABEL_130;
  }
  if (!strcmp(v6, "Install"))
  {
    id v17 = v3;
    id v18 = v4;
    *(void *)&long long length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(v18, "Profile", (size_t *)&length);
    if (!data)
    {
      v46 = sub_100006ABC();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10000AD68(v46, v47, v48, v49, v50, v51, v52, v53);
      }

      CFDataRef v20 = 0;
      int v23 = -402620403;
      goto LABEL_127;
    }
    CFDataRef v20 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
    if (!v20)
    {
      v74 = sub_100006ABC();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
        sub_10000ADE0();
      }

      CFDataRef v20 = 0;
      int v23 = -402620406;
      goto LABEL_127;
    }
    v22 = (void *)MISProfileCreateWithData();
    if (!v22)
    {
      v90 = sub_100006ABC();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
        sub_10000AE14();
      }

      int v23 = -402620406;
      goto LABEL_126;
    }
    int v23 = MISProvisioningProfileValidateSignature();
    if (!v23)
    {
      if (MISProvisioningProfileIsForBetaDeployment())
      {
        v24 = (_xpc_connection_s *)v17;
        uint64_t v25 = (void *)xpc_connection_copy_entitlement_value();
        pid_t pid = xpc_connection_get_pid(v24);

        if (v25 != &_xpc_BOOL_true)
        {
          long long v27 = sub_100006ABC();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10000AE7C(pid, v27);
          }

          long long v28 = sub_100006ABC();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10000AE48();
          }

          int v23 = -402620385;
          goto LABEL_126;
        }
      }
      int v23 = sub_100004F28((uint64_t)v22);
    }
LABEL_126:

LABEL_127:
    xpc_object_t v112 = xpc_dictionary_create_reply(v18);
    xpc_dictionary_set_uint64(v112, "Status", v23);
    xpc_connection_send_message((xpc_connection_t)v17, v112);
    if (v20) {
      CFRelease(v20);
    }

    goto LABEL_130;
  }
  if (!strcmp(v6, "Remove"))
  {
    long long v29 = (_xpc_connection_s *)v3;
    id v30 = v4;
    v31 = xpc_dictionary_get_string(v30, "ProfileID");
    if (v31)
    {
      CFStringRef v32 = CFStringCreateWithCString(kCFAllocatorDefault, v31, 0x8000100u);
      if (v32)
      {
        CFStringRef v33 = v32;
        sub_100005150((uint64_t)v32);
        uint64_t v34 = 0;
      }
      else
      {
        v88 = sub_100006ABC();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
          sub_10000AF80();
        }

        CFStringRef v33 = 0;
        uint64_t v34 = -402620406;
      }
    }
    else
    {
      v66 = sub_100006ABC();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_10000AF08(v66, v67, v68, v69, v70, v71, v72, v73);
      }

      CFStringRef v33 = 0;
      uint64_t v34 = -402620403;
    }
    xpc_object_t v89 = xpc_dictionary_create_reply(v30);

    xpc_dictionary_set_uint64(v89, "Status", v34);
    xpc_connection_send_message(v29, v89);

    if (v33) {
      CFRelease(v33);
    }

    goto LABEL_130;
  }
  if (!strcmp(v6, "CopyAll"))
  {
    v35 = (_xpc_connection_s *)v3;
    id v36 = v4;
    xpc_object_t empty = xpc_array_create_empty();
    if (empty)
    {
      long long v137 = 0u;
      long long v138 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v136 = 0u;
      v38 = sub_10000639C();
      v39 = [v38 allProfiles];

      uint64_t v40 = (uint64_t)[v39 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v136;
        while (2)
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v136 != v41) {
              objc_enumerationMutation(v39);
            }
            id v43 = [*(id *)(*(void *)&buffer[8] + 8 * i) UUID];
            xpc_object_t v44 = xpc_string_create((const char *)[v43 UTF8String]);

            if (!v44)
            {
              int v45 = 0;
              uint64_t v40 = -402620382;
              goto LABEL_107;
            }
            xpc_array_append_value(empty, v44);
          }
          uint64_t v40 = (uint64_t)[v39 countByEnumeratingWithState:buffer objects:&length count:16];
          int v45 = 1;
          if (v40) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v45 = 1;
      }
    }
    else
    {
      v39 = sub_100006ABC();
      uint64_t v40 = -402620406;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_10000AFB4();
      }
      int v45 = 0;
    }
LABEL_107:

    xpc_object_t v100 = xpc_dictionary_create_reply(v36);
    xpc_dictionary_set_uint64(v100, "Status", v40);
    if (v45) {
      xpc_dictionary_set_value(v100, "Payload", empty);
    }
    xpc_connection_send_message(v35, v100);

    goto LABEL_130;
  }
  if (!strcmp(v6, "CopySingle"))
  {
    v54 = (_xpc_connection_s *)v3;
    id v55 = v4;
    *(void *)&long long length = 0;
    *((void *)&length + 1) = &length;
    uint64_t v131 = 0x3032000000;
    v132 = sub_100006724;
    v133 = sub_100006734;
    id v134 = 0;
    v56 = xpc_dictionary_get_string(v55, "ProfileID");
    if (v56)
    {
      CFStringRef v57 = CFStringCreateWithCString(kCFAllocatorDefault, v56, 0x8000100u);
      if (CFStringGetLength(v57) == 36)
      {
        CFStringGetCString(v57, buffer, 37, 0x8000100u);
        unint64_t v58 = 0;
        BOOL v59 = 0;
        do
        {
          int v60 = buffer[v58];
          BOOL v61 = (v60 - 58) > 0xFFFFFFF5 || (v60 - 71) > 0xFFFFFFF9;
          if (!v61 && (v60 - 97) >= 6 && v60 != 45) {
            break;
          }
          BOOL v59 = v58++ > 0x22;
        }
        while (v58 != 36);
        if (v59)
        {
          BOOL v62 = xpc_dictionary_get_BOOL(v55, "ForceXML");
          v63 = sub_10000639C();
          *(void *)buffer = _NSConcreteStackBlock;
          *(void *)&buffer[8] = 3221225472;
          *(void *)&long long v136 = sub_10000673C;
          *((void *)&v136 + 1) = &unk_1000109C8;
          *(void *)&long long v137 = &length;
          [v63 queryCMSBlobForProfile:v57 forcingXML:v62 handler:buffer];

          if (*(void *)(*((void *)&length + 1) + 40))
          {
            uint64_t v64 = 0;
            int v65 = 1;
LABEL_101:
            xpc_object_t v99 = xpc_dictionary_create_reply(v55);
            xpc_dictionary_set_uint64(v99, "Status", v64);
            if (v65) {
              xpc_dictionary_set_value(v99, "Payload", *(xpc_object_t *)(*((void *)&length + 1) + 40));
            }
            xpc_connection_send_message(v54, v99);
            if (v57) {
              CFRelease(v57);
            }

            _Block_object_dispose(&length, 8);
            goto LABEL_130;
          }
          v91 = sub_100006ABC();
          uint64_t v64 = -402620406;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
            sub_10000B060();
          }
LABEL_100:

          int v65 = 0;
          goto LABEL_101;
        }
      }
      v91 = sub_100006ABC();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        sub_10000B094();
      }
    }
    else
    {
      v91 = sub_100006ABC();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        sub_10000AFE8(v91, v92, v93, v94, v95, v96, v97, v98);
      }
      CFStringRef v57 = 0;
    }
    uint64_t v64 = -402620403;
    goto LABEL_100;
  }
  if (strcmp(v6, "CopyMatching"))
  {
    id v7 = sub_100006ABC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B0FC((uint64_t)v6, v7);
    }
LABEL_10:

    goto LABEL_130;
  }
  connection = (_xpc_connection_s *)v3;
  id v118 = v4;
  xpc_dictionary_get_dictionary(v118, "Payload");
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (xdict)
  {
    v116 = +[NSMutableArray arrayWithCapacity:0];
    size_t v125 = 0;
    v75 = xpc_dictionary_get_data(xdict, "Cert", &v125);
    xpc_dictionary_get_array(xdict, "Predicates");
    xpc_object_t xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
    v114 = 0;
    if (v75 && v125)
    {
      v114 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v75);
    }
    if (xarray)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100006810;
      applier[3] = &unk_1000109F0;
      id v124 = v116;
      xpc_array_apply(xarray, applier);
    }
    xpc_object_t v76 = xpc_array_create_empty();
    v77 = sub_100006ABC();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      LODWORD(length) = 138412290;
      *(void *)((char *)&length + 4) = v116;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Copying profiles for %@", (uint8_t *)&length, 0xCu);
    }

    if ([v116 count])
    {
      long long v137 = 0uLL;
      long long v138 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      long long v136 = 0uLL;
      v78 = sub_10000639C();
      v79 = [v78 findProfilesMatchingPredicates:v116 withCertificate:v114];

      id v80 = [v79 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v80)
      {
        uint64_t v81 = *(void *)v136;
        do
        {
          for (j = 0; j != v80; j = (char *)j + 1)
          {
            if (*(void *)v136 != v81) {
              objc_enumerationMutation(v79);
            }
            v83 = *(void **)(*(void *)&buffer[8] + 8 * (void)j);
            v84 = sub_100006ABC();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              v85 = [v83 UUID];
              v86 = [v83 Name];
              *(_DWORD *)buf = 138412546;
              v127 = v85;
              __int16 v128 = 2112;
              v129 = v86;
              _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
            }
            v87 = sub_100006868(v83);
            xpc_array_append_value(v76, v87);
          }
          id v80 = [v79 countByEnumeratingWithState:buffer objects:&length count:16];
        }
        while (v80);
      }
    }
    else
    {
      long long v137 = 0uLL;
      long long v138 = 0uLL;
      *(_OWORD *)buffer = 0uLL;
      long long v136 = 0uLL;
      v102 = sub_10000639C();
      v79 = [v102 findProfilesWithCertificate:v114];

      id v103 = [v79 countByEnumeratingWithState:buffer objects:&length count:16];
      if (v103)
      {
        uint64_t v104 = *(void *)v136;
        do
        {
          for (k = 0; k != v103; k = (char *)k + 1)
          {
            if (*(void *)v136 != v104) {
              objc_enumerationMutation(v79);
            }
            v106 = *(void **)(*(void *)&buffer[8] + 8 * (void)k);
            v107 = sub_100006ABC();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              v108 = [v106 UUID];
              v109 = [v106 Name];
              *(_DWORD *)buf = 138412546;
              v127 = v108;
              __int16 v128 = 2112;
              v129 = v109;
              _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "Sending %@ - %@", buf, 0x16u);
            }
            v110 = sub_100006868(v106);
            xpc_array_append_value(v76, v110);
          }
          id v103 = [v79 countByEnumeratingWithState:buffer objects:&length count:16];
        }
        while (v103);
      }
    }

    uint64_t v101 = 0;
  }
  else
  {
    xpc_object_t v76 = 0;
    uint64_t v101 = -402620415;
  }
  xpc_object_t v111 = xpc_dictionary_create_reply(v118);
  xpc_dictionary_set_uint64(v111, "Status", v101);
  if (xdict) {
    xpc_dictionary_set_value(v111, "Payload", v76);
  }
  xpc_connection_send_message(connection, v111);

LABEL_130:
}

void sub_1000062C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_1000062F0()
{
  v0 = sub_100006A18();
  if (v0)
  {
    uint64_t v1 = v0;
    CFAbsoluteTime Current = j__CFAbsoluteTimeGetCurrent();
    CFDateRef v3 = CFDateCreate(kCFAllocatorDefault, Current);
    uint64_t v4 = MISProvisioningProfileCheckValidity();
    CFRelease(v3);
    CFRelease(v1);
    return v4;
  }
  else
  {
    uint64_t v6 = sub_100006ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B188();
    }

    return 3892346881;
  }
}

id sub_10000639C()
{
  if (qword_100014B18 != -1) {
    dispatch_once(&qword_100014B18, &stru_1000109A0);
  }
  v0 = (void *)qword_100014B10;

  return v0;
}

void sub_1000063F0(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:sub_100004A04()];
  uint64_t v2 = +[NSURL fileURLWithPath:v1];

  CFDateRef v3 = [v2 URLByAppendingPathComponent:@"/mis.db"];
  uint64_t v4 = +[SQLDB databaseWithURL:v3];
  int v5 = (void *)qword_100014B10;
  qword_100014B10 = v4;

  uint64_t v6 = sub_100004A04();
  id v7 = opendir(v6);
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = readdir(v7); i; uint64_t i = readdir(v8))
    {
      if (i->d_type == 8)
      {
        d_name = i->d_name;
        uint64_t v11 = +[NSString stringWithUTF8String:i->d_name];
        if ([v11 length] == (id)36)
        {
          uint64_t v12 = sub_100004A04();
          uint64_t v13 = snprintf(__str, 0x400uLL, "%s/%s", v12, d_name);
          int v14 = sub_1000065BC(v13, __str);

          if (!v14) {
            break;
          }
        }
        else
        {
        }
      }
    }
    closedir(v8);
  }
  else if (*__error() != 2)
  {
    __error();
    long long v15 = sub_100006ABC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000B1BC();
    }
  }
}

uint64_t sub_1000065BC(uint64_t a1, const char *a2)
{
  CFStringRef v3 = CFStringCreateWithFileSystemRepresentation(kCFAllocatorDefault, a2);
  if (v3)
  {
    CFStringRef v4 = v3;
    int v5 = (const void *)MISProfileCreateWithFile();
    CFRelease(v4);
    if (v5)
    {
      if (!sub_1000062F0() && ![(id)qword_100014B10 insertProfile:v5])
      {
        uint64_t v6 = +[NSFileManager defaultManager];
        id v7 = +[NSString stringWithUTF8String:a2];
        id v13 = 0;
        [v6 removeItemAtPath:v7 error:&v13];
        id v8 = v13;

        uint64_t v9 = sub_100006ABC();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        if (v8)
        {
          if (v10) {
            sub_10000B2C0();
          }
        }
        else if (v10)
        {
          sub_10000B258();
        }
      }
      CFRelease(v5);
    }
  }
  else
  {
    uint64_t v11 = sub_100006ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000B1F0();
    }
  }
  return 1;
}

uint64_t sub_100006724(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006734(uint64_t a1)
{
}

void sub_10000673C(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = a3;
  id v12 = [v5 objectForKeyedSubscript:@"\"profile_cms_blob\""];
  uint64_t v6 = sqlite3_column_blob(a2, (int)[v12 intValue]);
  id v7 = [v5 objectForKeyedSubscript:@"\"profile_cms_blob\""];

  int v8 = sqlite3_column_bytes(a2, (int)[v7 intValue]);
  xpc_object_t v9 = xpc_data_create(v6, v8);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t sub_100006810(uint64_t a1, int a2, xpc_object_t xstring)
{
  CFStringRef v3 = *(void **)(a1 + 32);
  CFStringRef v4 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(xstring)];
  [v3 addObject:v4];

  return 1;
}

id sub_100006868(void *a1)
{
  id v1 = a1;
  xpc_object_t empty = xpc_array_create_empty();
  id v3 = [v1 UUID];
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v3 UTF8String]);

  id v4 = [v1 TeamID];
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v4 UTF8String]);

  id v5 = [v1 Name];
  xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v5 UTF8String]);

  uint64_t v6 = [v1 Expires];
  [v6 timeIntervalSinceReferenceDate];
  xpc_array_set_date(empty, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)v7);

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 ProvisionsAllDevices] != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 AppleInternal] != 0);
  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, [v1 Local] != 0);
  LODWORD(v6) = [v1 Beta];

  xpc_array_set_BOOL(empty, 0xFFFFFFFFFFFFFFFFLL, v6 != 0);

  return empty;
}

void sub_1000069D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000069F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const void *sub_100006A18()
{
  v0 = (const void *)sub_10000A444();
  if (!v0)
  {
    id v4 = sub_100006ABC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000B328();
    }

    return 0;
  }
  id v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 != CFStringGetTypeID())
  {
    id v3 = sub_100006ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000B35C();
    }

    CFRelease(v1);
    return 0;
  }
  return v1;
}

id sub_100006ABC()
{
  if (qword_100014B28 != -1) {
    dispatch_once(&qword_100014B28, &stru_100010A10);
  }
  if (qword_100014B20) {
    v0 = (void *)qword_100014B20;
  }
  else {
    v0 = &_os_log_default;
  }

  return v0;
}

void sub_100006B20(id a1)
{
  qword_100014B20 = (uint64_t)os_log_create("com.apple.mis", "mis");

  _objc_release_x1();
}

uint64_t sub_100007094(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
  return 1;
}

void sub_1000077E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000077FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000780C(uint64_t a1)
{
}

uint64_t sub_100007814(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, 0);
}

uint64_t sub_100007864(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_10000A454(a2, 0);

  return _objc_release_x1();
}

uint64_t sub_10000797C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  id v4 = (const char *)[*(id *)(a1 + 40) UTF8String];

  return sqlite3_bind_text(a2, 2, v4, -1, 0);
}

uint64_t sub_100007A94(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, 1, v3, -1, 0);
}

void sub_100007C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007C64(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = sub_10000A4CC(a2, 0);

  return _objc_release_x1();
}

void sub_100007D4C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100007D9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_100007DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = a3;
  while (1)
  {
    uint64_t v5 = lockdown_send();
    if (v5 == -1) {
      break;
    }
    a2 += v5;
    v3 -= v5;
    if (!v3) {
      return 0;
    }
  }
  return *__error() | 0xC000u;
}

uint64_t sub_100007E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = a3;
  while (1)
  {
    uint64_t v5 = lockdown_recv();
    if (v5 <= 0) {
      break;
    }
    a2 += v5;
    v3 -= v5;
    if (!v3) {
      return 0;
    }
  }
  if (v5 == -1) {
    return *__error() | 0xC000u;
  }
  else {
    return 3892346892;
  }
}

uint64_t sub_100007EC0(const void *a1)
{
  uint64_t v11 = 0;
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, a1);
  int v3 = secure_lockdown_checkin();
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = sub_100006ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000B5F4(v4, v5);
    }
  }
  else
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    uint64_t v10 = 0;
    uint64_t v10 = os_transaction_create();
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100008010;
    block[3] = &unk_100010A68;
    block[4] = v9;
    block[5] = v11;
    dispatch_async(global_queue, block);
    _Block_object_dispose(v9, 8);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 1;
}

void sub_100008010(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  while (!sub_100009F94(v2, sub_100004DE4, (uint64_t (*)(void))sub_100005070, (uint64_t (*)(void **))sub_100005228));
  lockdown_disconnect();
  int v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  os_release(v3);
}

void sub_100008094(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = +[NSMutableString stringWithString:off_100014AF8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008214;
  v6[3] = &unk_100010A90;
  id v7 = v3;
  id v5 = v3;
  sub_100008158(a1, v4, v6);
}

void sub_100008158(void *a1, void *a2, void *a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008224;
  v7[3] = &unk_100010AB8;
  id v8 = a2;
  id v9 = a3;
  id v5 = v9;
  id v6 = v8;
  [a1 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t sub_100008214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008224(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  *a4 = 0;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  [v7 appendString:v9];
  [*(id *)(a1 + 32) appendString:off_100014AF8];
  sub_1000082EC(*(void **)(a1 + 32), v8, *(void **)(a1 + 40));

  [*(id *)(a1 + 32) deleteCharactersInRange:[*(id *)(a1 + 32) length] + ~(unint64_t)[v9 length] + 1, [v9 length] + 1];
}

void sub_1000082EC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000853C;
      v11[3] = &unk_100010AE0;
      id v12 = v5;
      id v13 = v7;
      [v6 enumerateObjectsUsingBlock:v11];

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[NSString stringWithFormat:@"%@%@%@", @"string", v5, v6];
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFBooleanGetTypeID())
      {
        if (CFEqual(v6, kCFBooleanTrue)) {
          CFStringRef v9 = @"true";
        }
        else {
          CFStringRef v9 = @"false";
        }
        uint64_t v10 = +[NSString stringWithFormat:@"%@%@%@", @"BOOL", v5, v9];
        (*((void (**)(id, void *))v7 + 2))(v7, v10);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        abort();
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%@%lld", @"number", v5, [v6 longLongValue]);
    uint64_t v10 = };
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
LABEL_15:

    goto LABEL_16;
  }
  sub_100008158(v6, v5, v7);
LABEL_16:
}

uint64_t sub_10000853C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
  return sub_1000082EC(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

void sub_1000087A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000087BC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, v4, v5, -1, 0);
}

uint64_t sub_10000882C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000884C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, v4, v5, -1, 0);
}

void sub_100008988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000089A0(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"profile_cms_blob"];
  sub_10000A50C(a2, (int)[v5 intValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MISProfileCreateWithData();
}

void sub_100008B94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008BAC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, v4, v5, -1, 0);
}

void sub_100008C1C(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v5 = [a3 objectForKeyedSubscript:@"profile_uuid"];
  sub_10000A454(a2, (int)[v5 intValue]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) isEqualToString:v6];
}

void sub_10000924C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

uint64_t sub_10000927C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  id v6 = [*(id *)(a1 + 40) bytes];
  int v7 = [*(id *)(a1 + 40) length];

  return sqlite3_bind_blob(a2, v5, v6, v7, 0);
}

uint64_t sub_100009330(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@team_id");
  sqlite3_bind_text(a2, v5, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
  int v6 = sqlite3_bind_parameter_index(a2, "@name");
  sqlite3_bind_text(a2, v6, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
  int v7 = sqlite3_bind_parameter_index(a2, "@expires");
  [*(id *)(a1 + 56) timeIntervalSince1970];
  sqlite3_bind_int64(a2, v7, (uint64_t)v8);
  int v9 = sqlite3_bind_parameter_index(a2, "@is_for_all_devices");
  sqlite3_bind_int(a2, v9, *(unsigned __int8 *)(a1 + 72));
  int v10 = sqlite3_bind_parameter_index(a2, "@is_apple_internal");
  sqlite3_bind_int(a2, v10, *(unsigned __int8 *)(a1 + 73));
  int v11 = sqlite3_bind_parameter_index(a2, "@is_local");
  sqlite3_bind_int(a2, v11, *(unsigned __int8 *)(a1 + 74));
  int v12 = sqlite3_bind_parameter_index(a2, "@is_beta");
  sqlite3_bind_int(a2, v12, *(unsigned __int8 *)(a1 + 75));
  int v13 = sqlite3_bind_parameter_index(a2, "@cms_blob");
  sqlite3_bind_blob(a2, v13, [*(id *)(a1 + 64) bytes], (int)[*(id *)(a1 + 64) length], 0);
  int v14 = sqlite3_bind_parameter_index(a2, "@is_der");
  int v15 = *(unsigned __int8 *)(a1 + 76);

  return sqlite3_bind_int(a2, v14, v15);
}

uint64_t sub_100009520(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  sqlite3_bind_text(a2, v4, (const char *)[*(id *)(a1 + 32) UTF8String], -1, 0);
  int v5 = sqlite3_bind_parameter_index(a2, "@leaf_pk");
  id v6 = [*(id *)(a1 + 40) longLongValue];

  return sqlite3_bind_int64(a2, v5, (sqlite3_int64)v6);
}

void sub_1000095BC(void *a1, void *a2)
{
  if (!*(_DWORD *)(*(void *)(a1[6] + 8) + 24))
  {
    id v3 = (void *)a1[4];
    id v4 = a2;
    id v5 = [v3 Entitlements];
    LODWORD(v3) = [v5 insertEntitlement:v4 forProfile:a1[5]];

    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = v3;
  }
}

uint64_t sub_100009724(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@uuid");
  id v5 = (const char *)[*(id *)(a1 + 32) UTF8String];

  return sqlite3_bind_text(a2, v4, v5, -1, 0);
}

void sub_100009984(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000999C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000099AC(uint64_t a1)
{
}

uint64_t sub_1000099B4(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@cert");
  id v5 = [*(id *)(a1 + 32) bytes];
  int v6 = [*(id *)(a1 + 32) length];

  return sqlite3_bind_blob(a2, v4, v5, v6, 0);
}

uint64_t sub_100009A30(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_bind_parameter_index(a2, "@cert");
  id v5 = [*(id *)(a1 + 32) bytes];
  int v6 = [*(id *)(a1 + 32) length];

  return sqlite3_bind_blob(a2, v4, v5, v6, 0);
}

void sub_100009AAC(uint64_t a1, sqlite3_stmt *a2, void *a3)
{
  id v8 = [a3 objectForKeyedSubscript:@"pk"];
  uint64_t v5 = sub_10000A4CC(a2, (int)[v8 intValue]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t sub_100009F94(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void), uint64_t (*a4)(void **))
{
  CFDictionaryRef theDict = 0;
  uint64_t v8 = sub_10000A280(a1, &theDict);
  if (v8) {
    return v8;
  }
  CFDictionaryRef v9 = theDict;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"ProfileType");
  if (!Value || CFStringCompare(Value, @"Provisioning", 0)) {
    goto LABEL_4;
  }
  CFStringRef v19 = (const __CFString *)CFDictionaryGetValue(v9, @"MessageType");
  CFMutableArrayRef Mutable = (__CFString *)v19;
  if (!v19) {
    goto LABEL_5;
  }
  if (CFStringCompare(v19, @"Install", 0))
  {
    if (CFStringCompare(Mutable, @"Remove", 0))
    {
      CFComparisonResult v20 = CFStringCompare(Mutable, @"CopyAll", 0);
      CFMutableArrayRef Mutable = 0;
      unsigned int v12 = -402620403;
      if (v20 == kCFCompareEqualTo)
      {
        keys[0] = 0;
        unsigned int v12 = a4(keys);
        CFMutableArrayRef Mutable = 0;
        if (!v12)
        {
          if (keys[0])
          {
            uint64_t Count = CFArrayGetCount((CFArrayRef)keys[0]);
            CFMutableArrayRef Mutable = (__CFString *)CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
            if (Mutable && Count >= 1)
            {
              for (CFIndex i = 0; i != Count; ++i)
              {
                ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)keys[0], i);
                CFArrayAppendValue((CFMutableArrayRef)Mutable, ValueAtIndex);
              }
            }
            CFRelease(keys[0]);
          }
        }
      }
      goto LABEL_6;
    }
    if (!CFDictionaryGetValue(v9, @"ProfileID")) {
      goto LABEL_4;
    }
    unsigned int v12 = a3();
LABEL_34:
    CFMutableArrayRef Mutable = 0;
    goto LABEL_6;
  }
  if (CFDictionaryGetValue(v9, @"Profile"))
  {
    uint64_t v24 = MISProfileCreateWithData();
    CFMutableArrayRef Mutable = (__CFString *)v24;
    if (!v24)
    {
      unsigned int v12 = -402620413;
      goto LABEL_6;
    }
    unsigned int v12 = a2(v24);
    CFRelease(Mutable);
    goto LABEL_34;
  }
LABEL_4:
  CFMutableArrayRef Mutable = 0;
LABEL_5:
  unsigned int v12 = -402620403;
LABEL_6:
  unsigned int valuePtr = v12;
  CFNumberRef v13 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  *(_OWORD *)keys = *(_OWORD *)&off_100010BA0;
  CFStringRef v29 = @"Payload";
  values[0] = @"Response";
  values[1] = v13;
  values[2] = Mutable;
  if (Mutable) {
    CFIndex v14 = 3;
  }
  else {
    CFIndex v14 = 2;
  }
  CFDictionaryRef v15 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, v14, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v15)
  {
    CFDictionaryRef v16 = v15;
    unsigned int v17 = sub_10000A388(a1, v15);
    CFRelease(v16);
  }
  else
  {
    unsigned int v17 = -402620406;
  }
  CFRelease(v13);
  if (v12) {
    uint64_t v8 = v12;
  }
  else {
    uint64_t v8 = v17;
  }
  CFRelease(v9);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v8;
}

uint64_t sub_10000A280(uint64_t a1, void *a2)
{
  LODWORD(length) = 0;
  uint64_t v4 = sub_100007E34(a1, (uint64_t)&length, 4);
  if (!v4)
  {
    uint64_t v4 = 3892346890;
    size_t v5 = bswap32(length);
    LODWORD(length) = v5;
    uint64_t v6 = (UInt8 *)malloc_type_malloc(v5, 0x3CAACF42uLL);
    if (v6)
    {
      int v7 = v6;
      uint64_t v8 = sub_100007E34(a1, (uint64_t)v6, length);
      if (!v8)
      {
        CFDataRef v9 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, length, kCFAllocatorNull);
        uint64_t v8 = 3892346890;
        if (v9)
        {
          CFDataRef v10 = v9;
          CFPropertyListRef v11 = CFPropertyListCreateWithData(kCFAllocatorDefault, v9, 0, 0, 0);
          *a2 = v11;
          if (v11) {
            uint64_t v8 = 0;
          }
          else {
            uint64_t v8 = 3892346890;
          }
          CFRelease(v10);
        }
      }
      free(v7);
      return v8;
    }
  }
  return v4;
}

uint64_t sub_10000A388(uint64_t a1, const void *a2)
{
  CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data) {
    return 3892346890;
  }
  CFDataRef v4 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  unsigned int Length = CFDataGetLength(v4);
  unsigned int v9 = bswap32(Length);
  uint64_t v7 = sub_100007DBC(a1, (uint64_t)&v9, 4);
  if (!v7) {
    uint64_t v7 = sub_100007DBC(a1, (uint64_t)BytePtr, Length);
  }
  CFRelease(v4);
  return v7;
}

uint64_t sub_10000A444()
{
  return _MGCopyAnswer(@"UniqueDeviceID", 0);
}

id sub_10000A454(sqlite3_stmt *a1, int a2)
{
  uint64_t v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    uint64_t v2 = +[NSString stringWithUTF8String:v2];
  }

  return v2;
}

id sub_10000A494(sqlite3_stmt *a1, int a2)
{
  double v2 = (double)sqlite3_column_int64(a1, a2);

  return +[NSDate dateWithTimeIntervalSince1970:v2];
}

id sub_10000A4CC(sqlite3_stmt *a1, int a2)
{
  sqlite3_int64 v2 = sqlite3_column_int64(a1, a2);

  return +[NSNumber numberWithLongLong:v2];
}

NSData *sub_10000A50C(sqlite3_stmt *a1, int a2)
{
  CFDataRef v4 = sqlite3_column_blob(a1, a2);
  uint64_t v5 = sqlite3_column_bytes(a1, a2);

  return +[NSData dataWithBytes:v4 length:v5];
}

sqlite3 *sub_10000A570(void *a1, int a2)
{
  ppDb = 0;
  if (a2) {
    int v2 = 65537;
  }
  else {
    int v2 = 65542;
  }
  id v3 = [a1 path];
  int v4 = sqlite3_open_v2((const char *)[v3 UTF8String], &ppDb, v2, 0);

  if (v4)
  {
    uint64_t v5 = sub_100006ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000B66C(v4, v5);
    }
  }
  return ppDb;
}

BOOL sub_10000A608(sqlite3 *a1, const char *a2)
{
  return sqlite3_db_readonly(a1, a2) == 1;
}

uint64_t sub_10000A628(const char *a1)
{
  return sub_10000A630(a1, 384);
}

uint64_t sub_10000A630(const char *a1, int a2)
{
  if (!a1) {
    sub_10000B6E4();
  }
  int v3 = open(a1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v3 == -1)
  {
    uint64_t v6 = sub_100006ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B710();
    }

    return 0;
  }
  else
  {
    int v4 = v3;
    if (fstat(v3, &v9) < 0)
    {
      uint64_t v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000B790();
      }
    }
    else
    {
      if ((v9.st_mode & 0x1FF) == a2 || (fchmod(v4, a2) & 0x80000000) == 0)
      {
        uint64_t v5 = 1;
        if (v4 < 0) {
          return v5;
        }
        goto LABEL_16;
      }
      uint64_t v7 = sub_100006ABC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000B810();
      }
    }

    uint64_t v5 = 0;
    if ((v4 & 0x80000000) == 0) {
LABEL_16:
    }
      close(v4);
  }
  return v5;
}

void sub_10000A784(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Critical SQLite error, could not checkpoint", v1, 2u);
}

void sub_10000A7C8(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't update is_beta column: %s", v3, v4, v5, v6, v7);
}

void sub_10000A83C(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create the xml profiles table: %s", v3, v4, v5, v6, v7);
}

void sub_10000A8B0(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't add is_der to the profiles table: %s", v3, v4, v5, v6, v7);
}

void sub_10000A924(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create entitlements index: %s", v3, v4, v5, v6, v7);
}

void sub_10000A998(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create entitlements provisioning cache: %s", v3, v4, v5, v6, v7);
}

void sub_10000AA0C(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates provisioning cache: %s", v3, v4, v5, v6, v7);
}

void sub_10000AA80(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates index: %s", v3, v4, v5, v6, v7);
}

void sub_10000AAF4(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create certificates table: %s", v3, v4, v5, v6, v7);
}

void sub_10000AB68(uint64_t a1)
{
  sub_1000049B8(a1);
  sub_1000049F8();
  sub_1000049D8((void *)&_mh_execute_header, v1, v2, "Couldn't create profiles table: %s", v3, v4, v5, v6, v7);
}

void sub_10000ABDC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "listener connection error: %s\n", (uint8_t *)&v2, 0xCu);
}

void sub_10000AC54()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to allocate profiles array", v2, v3, v4, v5, v6);
}

void sub_10000AC88()
{
  sub_1000049F8();
  sub_1000069D4((void *)&_mh_execute_header, v0, v1, "client connection error: %s\n", v2, v3, v4, v5, v6);
}

void sub_10000ACF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AD68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000ADE0()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for profile data", v2, v3, v4, v5, v6);
}

void sub_10000AE14()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to create MISProfileRef for profile data", v2, v3, v4, v5, v6);
}

void sub_10000AE48()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "Attempted to install a Beta profile without the proper entitlement.", v2, v3, v4, v5, v6);
}

void sub_10000AE7C(int a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  uint64_t v4 = "com.apple.private.mis.beta-install";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Caller (pid %d) does not have required entitlement '%s'", (uint8_t *)v2, 0x12u);
}

void sub_10000AF08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000AF80()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to create CFStringRef for profile id", v2, v3, v4, v5, v6);
}

void sub_10000AFB4()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to create array", v2, v3, v4, v5, v6);
}

void sub_10000AFE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000B060()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to create xpc data object", v2, v3, v4, v5, v6);
}

void sub_10000B094()
{
  sub_1000049F8();
  sub_1000069D4((void *)&_mh_execute_header, v0, v1, "Requested profile has invalid UUID '%s'.", v2, v3, v4, v5, v6);
}

void sub_10000B0FC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "MessageType";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unrecognized value for '%s' key: %s", (uint8_t *)&v2, 0x16u);
}

void sub_10000B188()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "could not get device UDID", v2, v3, v4, v5, v6);
}

void sub_10000B1BC()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "unable to open profile directory", v2, v3, v4, v5, v6);
}

void sub_10000B1F0()
{
  sub_1000049F8();
  sub_1000069D4((void *)&_mh_execute_header, v0, v1, "unable to create profile path for '%s'", v2, v3, v4, v5, v6);
}

void sub_10000B258()
{
  sub_1000049F8();
  sub_1000069D4((void *)&_mh_execute_header, v0, v1, "migrated %s", v2, v3, v4, v5, v6);
}

void sub_10000B2C0()
{
  sub_1000049F8();
  sub_1000069D4((void *)&_mh_execute_header, v0, v1, "encountered migration error %@", v2, v3, v4, v5, v6);
}

void sub_10000B328()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "got NULL when querying UDID", v2, v3, v4, v5, v6);
}

void sub_10000B35C()
{
  sub_100006A0C();
  sub_1000069F0((void *)&_mh_execute_header, v0, v1, "got non-string when querying UDID", v2, v3, v4, v5, v6);
}

void sub_10000B390(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Database failed to initialize.", v1, 2u);
}

void sub_10000B3D4()
{
  sub_100007D84();
  sub_100007D4C((void *)&_mh_execute_header, v0, v1, "Finalize error (%d) on query: %@");
}

void sub_10000B43C(sqlite3 **a1)
{
  sqlite3_errmsg(*a1);
  sqlite3_errcode(*a1);
  sub_100007D6C();
  sub_100007D9C((void *)&_mh_execute_header, v2, v3, "SQL error '%s' (%1d)", v4, v5, v6, v7, v8);
}

void sub_10000B4D0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Query canceled", v1, 2u);
}

void sub_10000B514()
{
  sub_100007D84();
  sub_100007D4C((void *)&_mh_execute_header, v0, v1, "Prepare error (%d) on query: %@");
}

void sub_10000B57C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100007D4C((void *)&_mh_execute_header, a2, a3, "Unable to table row count for %@: %d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10000B5F4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "secure_lockdown_checkin failed: %d\n", (uint8_t *)v2, 8u);
}

void sub_10000B66C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error opening DB: %d", (uint8_t *)v2, 8u);
}

void sub_10000B6E4()
{
  __assert_rtn("setDatabasePermissionsInternal", "db_utils.m", 121, "path != NULL");
}

void sub_10000B710()
{
  __error();
  sub_10000A76C();
  sub_100007D9C((void *)&_mh_execute_header, v0, v1, "unable to open file to update permissions: %d, %s", v2, v3, v4, v5, v6);
}

void sub_10000B790()
{
  __error();
  sub_10000A76C();
  sub_100007D9C((void *)&_mh_execute_header, v0, v1, "unable to check filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
}

void sub_10000B810()
{
  __error();
  sub_10000A76C();
  sub_100007D9C((void *)&_mh_execute_header, v0, v1, "unable to set filesystem permissions on db: %d, %s", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t MISProfileCreateDataRepresentation()
{
  return _MISProfileCreateDataRepresentation();
}

uint64_t MISProfileCreateWithData()
{
  return _MISProfileCreateWithData();
}

uint64_t MISProfileCreateWithFile()
{
  return _MISProfileCreateWithFile();
}

uint64_t MISProfileIsDEREncoded()
{
  return _MISProfileIsDEREncoded();
}

uint64_t MISProvisioningProfileCheckValidity()
{
  return _MISProvisioningProfileCheckValidity();
}

uint64_t MISProvisioningProfileGetDeveloperCertificatesHashes()
{
  return _MISProvisioningProfileGetDeveloperCertificatesHashes();
}

uint64_t MISProvisioningProfileGetEmbeddedDER()
{
  return _MISProvisioningProfileGetEmbeddedDER();
}

uint64_t MISProvisioningProfileGetEntitlements()
{
  return _MISProvisioningProfileGetEntitlements();
}

uint64_t MISProvisioningProfileGetExpirationDate()
{
  return _MISProvisioningProfileGetExpirationDate();
}

uint64_t MISProvisioningProfileGetName()
{
  return _MISProvisioningProfileGetName();
}

uint64_t MISProvisioningProfileGetTeamIdentifier()
{
  return _MISProvisioningProfileGetTeamIdentifier();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return _MISProvisioningProfileGetUUID();
}

uint64_t MISProvisioningProfileIsAppleInternalProfile()
{
  return _MISProvisioningProfileIsAppleInternalProfile();
}

uint64_t MISProvisioningProfileIsForBetaDeployment()
{
  return _MISProvisioningProfileIsForBetaDeployment();
}

uint64_t MISProvisioningProfileIsForLocalProvisioning()
{
  return _MISProvisioningProfileIsForLocalProvisioning();
}

uint64_t MISProvisioningProfileProvisionsAllDevices()
{
  return _MISProvisioningProfileProvisionsAllDevices();
}

uint64_t MISProvisioningProfileValidateSignature()
{
  return _MISProvisioningProfileValidateSignature();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

void exit(int a1)
{
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return _sqlite3_bind_parameter_index(a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_origin_name(a1, a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_column_table_name(a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_readonly(db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

void xpc_array_set_BOOL(xpc_object_t xarray, size_t index, BOOL value)
{
}

void xpc_array_set_date(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_AppleInternal(void *a1, const char *a2, ...)
{
  return [a1 AppleInternal];
}

id objc_msgSend_Beta(void *a1, const char *a2, ...)
{
  return [a1 Beta];
}

id objc_msgSend_Entitlements(void *a1, const char *a2, ...)
{
  return [a1 Entitlements];
}

id objc_msgSend_Expires(void *a1, const char *a2, ...)
{
  return [a1 Expires];
}

id objc_msgSend_Local(void *a1, const char *a2, ...)
{
  return [a1 Local];
}

id objc_msgSend_Name(void *a1, const char *a2, ...)
{
  return [a1 Name];
}

id objc_msgSend_ProvisionsAllDevices(void *a1, const char *a2, ...)
{
  return [a1 ProvisionsAllDevices];
}

id objc_msgSend_TeamID(void *a1, const char *a2, ...)
{
  return [a1 TeamID];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_allCMSBlobs(void *a1, const char *a2, ...)
{
  return [a1 allCMSBlobs];
}

id objc_msgSend_allProfiles(void *a1, const char *a2, ...)
{
  return [a1 allProfiles];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return [a1 checkpoint];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_setupPermissions(void *a1, const char *a2, ...)
{
  return [a1 setupPermissions];
}

id objc_msgSend_setupSchema(void *a1, const char *a2, ...)
{
  return [a1 setupSchema];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}