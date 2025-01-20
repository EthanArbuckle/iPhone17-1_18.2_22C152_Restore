void sub_1000028DC(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;
  int v4;
  uint64_t vars8;

  v3 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    v4 = sqlite3_bind_int(a2, 2, 0);

    if (!v4) {
      return;
    }
  }
  _db_error(1);
}

void handle_TCCAccessCopyBundleIdentifiersForService(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessCopyBundleIdentifiersForService_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyBundleIdentifiersForService_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v8 = +[TCCDPlatform currentPlatform];
  v9 = [v7 requestingProcess];
  v10 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "function")];
  v11 = [v8 server];
  v44[0] = 0;
  v12 = [v11 serviceFromMessage:v5 error:v44];
  id v13 = v44[0];

  if (v12)
  {
    v14 = [v8 server];
    unsigned int v15 = [v14 canProcess:v9 callFunction:v10 forService:v12 withAccessIdentity:0];

    if (v15)
    {
      xpc_object_t xdict = v6;
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = sub_10000F914;
      v42 = sub_10000F89C;
      id v43 = xpc_array_create(0, 0);
      if (v39[5])
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10004BF70;
        v33[3] = &unk_1000965A0;
        id v16 = v8;
        id v34 = v16;
        id v27 = v12;
        id v35 = v27;
        id v17 = v9;
        id v36 = v17;
        v37 = &v38;
        v28 = objc_retainBlock(v33);
        v18 = [v16 server];
        LODWORD(v17) = [v18 canProcess:v17 manageESClientServiceWith:v10];

        if (v17)
        {
          v19 = v32;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10004C0C8;
          v32[3] = &unk_1000950A8;
          v32[4] = v27;
          int v20 = db_eval((uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE (service = ? OR service = ?) AND client_type = ? AND auth_value != 0", v32, v28);
        }
        else
        {
          v19 = v31;
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1000028DC;
          v31[3] = &unk_1000950A8;
          v31[4] = v27;
          int v20 = db_eval((uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE service = ? AND client_type = ? AND auth_value != 0", v31, v28);
        }
        int v26 = v20;

        if (!v26) {
          xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v39[5]);
        }
      }
      _Block_object_dispose(&v38, 8);

      id v6 = xdict;
    }
  }
  else
  {
    xpc_object_t xdicta = v9;
    id v21 = v6;
    v22 = objc_opt_new();
    v23 = [v8 server];
    [v23 buildErrorString:v22 forError:v13 contextString:0];

    v24 = [v8 server];
    v25 = [v24 logHandle];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10004CEF8();
    }

    id v6 = v21;
    v9 = xdicta;
  }
}

void sub_100002ECC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) _descriptionForXPCObject:a3 depth:*(unsigned int *)(a1 + 56)];
  [*(id *)(a1 + 40) appendFormat:@"%@[%zu] = %@\n", *(void *)(a1 + 48), a2, v5];

  return 1;
}

void sub_100003198(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleEventWithAction:a2 token:a3 descriptor:v7];
}

void sub_1000033AC(void *a1)
{
  v2 = [[TCCDEventFilter alloc] initWithCriteria:a1[4]];
  id v3 = [[TCCDEventSubscriber alloc] initWithToken:a1[6] filter:v2 fromPublisher:a1[5]];
  uint64_t v4 = a1[6];
  id v5 = *(void **)(a1[5] + 24);
  id v6 = +[NSNumber numberWithUnsignedLongLong:v4];
  [v5 setObject:v3 forKeyedSubscript:v6];

  id v7 = tcc_events_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543362;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Added subscriber %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

id tcc_events_log()
{
  if (qword_1000AC578 != -1) {
    dispatch_once(&qword_1000AC578, &stru_100095B38);
  }
  v0 = (void *)qword_1000AC570;
  return v0;
}

void sub_100003A78(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = (void *)qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
      sub_10005CDE4(v4, v2);
    }
  }
  else
  {
    xpc_connection_set_event_handler(v2, &stru_1000956E8);
    xpc_connection_resume(v2);
  }
}

void sub_100003B14(uint64_t a1)
{
  v2 = (sqlite3 *)qword_1000AC608;
  if (!qword_1000AC608)
  {
    if (db_open())
    {
LABEL_8:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      return;
    }
    v2 = (sqlite3 *)qword_1000AC608;
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2(v2, *(const char **)(a1 + 56), -1, &ppStmt, 0))
  {
LABEL_7:
    _db_error(0);
    goto LABEL_8;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    goto LABEL_9;
  }
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 != 100) {
      break;
    }
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_9:
    (*(void (**)(uint64_t, sqlite3_stmt *))(v3 + 16))(v3, ppStmt);
  }
  int v5 = v4;
  if (v4 != 101)
  {
    id v6 = sqlite3_expanded_sql(ppStmt);
    id v7 = +[TCCDPlatform currentPlatform];
    int v8 = [v7 server];
    v9 = [v8 logHandle];

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10) {
        sub_100058FB0((uint64_t)v6, v5, v9);
      }

      sqlite3_free(v6);
      _db_error(0);
    }
    else
    {
      if (v10) {
        sub_100058F34((uint64_t *)(a1 + 56), v9);
      }
    }
    sqlite3_finalize(ppStmt);
    goto LABEL_7;
  }
  sqlite3_finalize(ppStmt);
}

void sub_100003C98(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, 0))
  {
    _db_error(1);
  }
}

void sub_100003D0C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_100003D8C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) service];
  id v4 = [v3 name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_100003E28(uint64_t a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v4 = [*(id *)(a1 + 40) subjectIdentity];
    id v5 = [v4 identifier];
    if (sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
    }
    else
    {
      id v6 = [*(id *)(a1 + 40) subjectIdentity];
      int v7 = sqlite3_bind_int(a2, 3, (int)objc_msgSend(v6, "client_type"));

      if (!v7) {
        return;
      }
    }
  }
  _db_error(1);
}

void handle_TCCAccessCopyInformationForBundle_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = [v7 requestingProcess];
  v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "function")];
  string = xpc_dictionary_get_string(v5, "client");
  v11 = +[TCCDPlatform currentPlatform];
  v12 = [v11 server];
  id v13 = +[TCCDService serviceAll];
  unsigned int v14 = [v12 canProcess:v8 callFunction:v9 forService:v13 withAccessIdentity:0];

  if (v14 && string)
  {
    uint64_t v19 = 0;
    int v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_10000F914;
    v23 = sub_10000F89C;
    id v24 = xpc_array_create(0, 0);
    if (v20[5])
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100003C98;
      v18[3] = &unk_1000958C0;
      v18[4] = string;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100005AC4;
      v15[3] = &unk_100095910;
      id v16 = v11;
      id v17 = &v19;
      if (!db_eval((uint64_t)"SELECT service, auth_value, last_modified, csreq, strftime('%s','now') - last_modified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_identity, auth_reason, auth_version, flags FROM access WHERE client = ? AND client_type = ?", v18, v15))xpc_dictionary_set_value(v6, "services", (xpc_object_t)v20[5]); {
    }
      }
    _Block_object_dispose(&v19, 8);
  }
}

void sub_10000509C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005AC4(uint64_t a1, sqlite3_stmt *a2)
{
  id v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  if (v5)
  {
    uint64_t v6 = sqlite3_column_int64(a2, 1);
    sqlite3_int64 value = sqlite3_column_int64(a2, 8);
    uint64_t v7 = sqlite3_column_int64(a2, 9);
    char v8 = sqlite3_column_int64(a2, 10);
    v9 = +[TCCDPlatform currentPlatform];
    BOOL v10 = [v9 serviceByName:v5];

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) server];
      unsigned __int8 v12 = objc_msgSend(v11, "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 4), v6, v10);

      if ((v12 & 1) == 0)
      {
        xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
        if (v13)
        {
          xpc_dictionary_set_string(v13, "service", (const char *)[v5 UTF8String]);
          xpc_dictionary_set_BOOL(v13, "granted", v6 != 0);
          xpc_dictionary_set_uint64(v13, "auth_value", v6);
          xpc_dictionary_set_uint64(v13, "auth_reason", value);
          xpc_dictionary_set_uint64(v13, "auth_version", v7);
          xpc_dictionary_set_BOOL(v13, "has_prompted_for_allow", (v8 & 0x10) != 0);
          sqlite3_int64 v14 = sqlite3_column_int64(a2, 2);
          xpc_dictionary_set_int64(v13, "last_modified", v14);
          if (sqlite3_column_type(a2, 3) != 5)
          {
            unsigned int v15 = sqlite3_column_blob(a2, 3);
            int v16 = sqlite3_column_bytes(a2, 3);
            xpc_dictionary_set_data(v13, "code_requirement", v15, v16);
          }
          xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v13);
        }
        else
        {
          id v17 = tcc_access_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10004CF6C(v17);
          }
        }
      }
    }
  }
}

id sub_100006D88(void *a1)
{
  id v5 = a1;
  uint64_t v594 = 0;
  v595 = &v594;
  uint64_t v596 = 0x2020000000;
  char v597 = 0;
  id v572 = (id)objc_opt_new();
  [v572 setPromptType:1];
  uint64_t v6 = v572;
  if (!v572) {
    goto LABEL_44;
  }
  [v572 setAuthorizationValue:1];
  [v572 setAuthorizationReason:0];
  uint64_t v7 = [v5 service];
  objc_msgSend(v572, "setAuthorizationVersion:", objc_msgSend(v7, "authorizationVersionNumber"));

  char v8 = [v5 service];
  unsigned int v9 = [v8 upgradeV1AuthorizationValue];

  if (v9
    && ([v5 spiVersion] == (id)1
     || [v5 spiVersion] == (id)2
     && [v5 recordUpgradePolicy] == (id)1
     && [v5 promptRightsMask] == (id)5))
  {
    [v572 setAuthorizationVersion:1];
  }
  [v572 setDatabaseAction:0];
  BOOL v10 = [v5 service];
  v11 = [v10 name];
  unsigned __int8 v12 = [v11 isEqualToString:@"kTCCServiceExposureNotification"];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v1 = [v5 service];
    v2 = [v1 name];
    if ([v2 isEqualToString:@"kTCCServiceCrashDetection"])
    {
      int v13 = 0;
      uint64_t v14 = 1;
    }
    else
    {
      id v3 = [v5 service];
      id v4 = [v3 name];
      uint64_t v14 = (uint64_t)[v4 isEqualToString:@"kTCCServicePasteboard"];
      int v13 = 1;
    }
  }
  [v572 setReplyNoCacheAuthorization:v14];
  if (v13)
  {
  }
  if ((v12 & 1) == 0)
  {
  }
  unsigned int v15 = [(id)qword_1000AC7B0 platform];
  if (![v15 isChinaSKUDevice]) {
    goto LABEL_31;
  }
  int v16 = [v5 service];
  unsigned int v17 = objc_msgSend(v16, "ios_allowRegionalPrompt");

  if (v17)
  {
    id v18 = [[TCCDAccessIdentity alloc] initAssumedIdentityWithRequestContext:v5];
    unsigned int v15 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "client_type"))
      {
        uint64_t v19 = (id)qword_1000AC518;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          sub_10005D2B4();
        }
      }
      else
      {
        [v5 setSubjectIdentity:v15];
        [v5 setPromptingPolicy:1];
        int v20 = [v5 attributionChain];
        uint64_t v19 = [v20 accessingProcess];

        if ([v19 BOOLValueForEntitlement:@"com.apple.private.tcc.kill-on-assumed-identity-authorization-change"])
        {
          uint64_t v21 = [(id)qword_1000AC7B0 assumedIdentityMonitor];
          [v21 startMonitoringProcess:v19 assumingIdentity:v15];
        }
        v22 = (id)qword_1000AC518;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v5 explicitlyAssumedIdentity];
          id v24 = "explicitly";
          *(_DWORD *)buf = 138543874;
          *(void *)v603 = v19;
          if (!v23) {
            id v24 = "implicitly";
          }
          *(_WORD *)&v603[8] = 2082;
          *(void *)&v603[10] = v24;
          *(_WORD *)&v603[18] = 2114;
          *(void *)&v603[20] = v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Accessing process %{public}@ %{public}s assumed identity: %{public}@", buf, 0x20u);
        }
      }
    }
LABEL_31:
  }
  v25 = (id)qword_1000AC518;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = [v5 messageIdentifier];
    id v27 = [v5 functionName];
    v28 = [v5 service];
    v29 = [v28 name];
    if ([v5 isPreflight]) {
      v30 = "yes";
    }
    else {
      v30 = "no";
    }
    id v31 = [v5 queryCount];
    v32 = [v5 clientDict];
    v33 = [v5 daemonDict];
    *(_DWORD *)buf = 138544898;
    *(void *)v603 = v26;
    *(_WORD *)&v603[8] = 2112;
    *(void *)&v603[10] = v27;
    *(_WORD *)&v603[18] = 2112;
    *(void *)&v603[20] = v29;
    *(_WORD *)&v603[28] = 2082;
    *(void *)&v603[30] = v30;
    __int16 v604 = 2048;
    id v605 = v31;
    __int16 v606 = 2112;
    v607 = v32;
    __int16 v608 = 2112;
    v609 = v33;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AUTHREQ_CTX: msgID=%{public}@, function=%@, service=%@, preflight=%{public}s, query=%llu, client_dict=%@, daemon_dict=%@", buf, 0x48u);
  }
  id v34 = [v5 subjectIdentity];
  BOOL v35 = v34 == 0;

  if (!v35)
  {
LABEL_38:
    v592[0] = _NSConcreteStackBlock;
    v592[1] = 3221225472;
    v592[2] = sub_100003D8C;
    v592[3] = &unk_1000950A8;
    id v36 = v5;
    id v593 = v36;
    v591[0] = _NSConcreteStackBlock;
    v591[1] = 3221225472;
    v591[2] = sub_100024B64;
    v591[3] = &unk_1000951B8;
    v591[4] = &v594;
    if (db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", v592, v591))
    {
      v37 = [v36 service];
      uint64_t v38 = [v37 name];
      v39 = [v36 attributionChain];
      uint64_t v40 = [v39 requestingProcess];
      v41 = [v40 description];
      [v572 denyAuthorizationWithErrorCode:4, @"Checking for Service Override on %@: Requestor: %@", v38, v41 format];

LABEL_40:
      id v42 = v572;
LABEL_41:
      id v43 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
LABEL_42:

LABEL_43:
      uint64_t v6 = v572;
      goto LABEL_44;
    }
    v80 = [v36 subjectIdentity];
    BOOL v81 = v80 == 0;

    if (!v81) {
      goto LABEL_65;
    }
    v103 = [v36 attributionChain];
    v104 = [v103 accessingProcess];
    v105 = [v36 service];
    unsigned int v106 = [v104 hasEntitlement:@"com.apple.private.tcc.allow.overridable" containsService:v105 options:1];

    v107 = [v36 service];
    v108 = [v36 attributionChain];
    LODWORD(v104) = accessingProcessHasAllowOrRegionalPromptEntitlement(v107, v108, 1);

    if (v104)
    {
      v109 = [(id)qword_1000AC7B0 platform];
      unsigned __int8 v110 = [v109 isChinaSKUDevice];

      if ((v110 & 1) == 0)
      {
LABEL_76:
        if (!*((unsigned char *)v595 + 24))
        {
          [v572 setAuthorizationValue:2];
          [v572 setAuthorizationReason:11];
          v175 = (id)qword_1000AC518;
          if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
          {
            v176 = [v36 attributionChain];
            v177 = [v176 accessingProcess];
            v178 = [v177 description];
            v179 = [v36 service];
            v180 = [v179 name];
            *(_DWORD *)buf = 138543618;
            *(void *)v603 = v178;
            *(_WORD *)&v603[8] = 2114;
            *(void *)&v603[10] = v180;
            _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_DEFAULT, "Overridable entitlement policy: %{public}@ is Allow access to %{public}@", buf, 0x16u);
          }
          goto LABEL_40;
        }
        v111 = (id)qword_1000AC518;
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v112 = [v36 attributionChain];
          v113 = [v112 accessingProcess];
          v114 = [v113 description];
          v115 = [v36 service];
          v116 = [v115 name];
          *(_DWORD *)buf = 138543618;
          *(void *)v603 = v114;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v116;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Overridable entitlement policy: %{public}@ is Denied/Restricted access to %{public}@", buf, 0x16u);
        }
        goto LABEL_79;
      }
    }
    else if (v106)
    {
      goto LABEL_76;
    }
    v139 = [TCCDAccessIdentity alloc];
    v140 = [v36 attributionChain];
    v141 = [v36 service];
    v142 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:](v139, "initWithAttributionChain:preferMostSpecificIdentifier:", v140, [v141 hasParanoidSecurityPolicy]);
    [v36 setSubjectIdentity:v142];

    v143 = [v36 subjectIdentity];
    BOOL v144 = v143 == 0;

    if (v144)
    {
      v181 = [v36 service];
      v182 = [v181 name];
      v183 = [v36 identityDescription];
      [v572 denyAuthorizationWithErrorCode:2, @"Unable to construct an identity to %@, %@", v182, v183 format];

      goto LABEL_40;
    }
    v145 = (id)qword_1000AC518;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
    {
      v146 = [v36 messageIdentifier];
      v147 = [v36 subjectIdentity];
      v148 = [v147 identifier];
      *(_DWORD *)buf = 138543618;
      *(void *)v603 = v146;
      *(_WORD *)&v603[8] = 2114;
      *(void *)&v603[10] = v148;
      _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "AUTHREQ_SUBJECT: msgID=%{public}@, subject=%{public}@,", buf, 0x16u);
    }
    v149 = [(id)qword_1000AC7B0 platform];
    v150 = [v36 subjectIdentity];
    v151 = [v36 attributionChain];
    [v149 registerWithApplicationResolverSubjectIdentity:v150 processChain:v151];

LABEL_65:
    v82 = [v36 service];
    v83 = [v82 name];
    if ([v83 isEqualToString:@"kTCCServiceUserTracking"])
    {
      v84 = [v36 attributionChain];
      v85 = [v84 accessingProcess];
      unsigned int v86 = [v85 BOOLValueForEntitlement:@"com.apple.developer.web-browser"];

      if (v86)
      {
        v87 = (id)qword_1000AC518;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          id v88 = [v36 functionName];
          id v89 = [v88 UTF8String];
          v90 = [v36 service];
          v91 = [v90 name];
          v92 = [v36 identityDescription];
          *(_DWORD *)buf = 136446722;
          *(void *)v603 = v89;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v91;
          *(_WORD *)&v603[18] = 2114;
          *(void *)&v603[20] = v92;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Refusing %{public}s for service %{public}@ from %{public}@ due to security policy", buf, 0x20u);
        }
        [v572 setAuthorizationValue:0];
        [v572 setAuthorizationReason:14];
      }
    }
    else
    {
    }
    v117 = [v36 subjectIdentity];
    v118 = [v117 pluginBundleIdentifier];
    BOOL v119 = v118 == 0;

    if (!v119)
    {
      v120 = [v36 subjectIdentity];
      unsigned __int8 v121 = [v120 pluginTargetsSystemExtensionPoint];

      if ((v121 & 1) == 0)
      {
        v138 = (id)qword_1000AC518;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          id v207 = [v36 functionName];
          id v208 = [v207 UTF8String];
          v209 = [v36 service];
          v210 = [v209 name];
          v211 = [v36 identityDescription];
          *(_DWORD *)buf = 136446722;
          *(void *)v603 = v208;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v210;
          *(_WORD *)&v603[18] = 2114;
          *(void *)&v603[20] = v211;
          _os_log_error_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "Refusing %{public}s for service %{public}@ from extension %{public}@ targeting 3rd party extension point", buf, 0x20u);
        }
        goto LABEL_116;
      }
      v122 = [v36 subjectIdentity];
      BOOL v123 = [v122 pluginPromptPolicy] == 0;

      if (v123)
      {
        v138 = (id)qword_1000AC518;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          id v251 = [v36 functionName];
          id v252 = [v251 UTF8String];
          v253 = [v36 service];
          v254 = [v253 name];
          v255 = [v36 identityDescription];
          *(_DWORD *)buf = 136446722;
          *(void *)v603 = v252;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v254;
          *(_WORD *)&v603[18] = 2114;
          *(void *)&v603[20] = v255;
          _os_log_error_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "Refusing %{public}s for service %{public}@ from extension %{public}@, extension point disallows prompting", buf, 0x20u);
        }
        goto LABEL_116;
      }
    }
    if (*((unsigned char *)v595 + 24))
    {
      v111 = (id)qword_1000AC518;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        v124 = [v36 identityDescription];
        v125 = [v36 service];
        v126 = [v125 name];
        *(_DWORD *)buf = 138412546;
        *(void *)v603 = v124;
        *(_WORD *)&v603[8] = 2114;
        *(void *)&v603[10] = v126;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Restricted %@ access to %{public}@", buf, 0x16u);
      }
LABEL_79:

      [v572 setAuthorizationValue:0];
      [v572 setAuthorizationReason:7];
      goto LABEL_40;
    }
    v152 = [v36 attributionChain];
    v153 = [v152 accessingProcess];
    if ([v153 isAppClip])
    {
      v154 = [v36 service];
      unsigned __int8 v155 = objc_msgSend(v154, "ios_allowPromptFromAppClip");

      if ((v155 & 1) == 0)
      {
        v156 = (id)qword_1000AC518;
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
        {
          v157 = [v36 attributionChain];
          v158 = [v157 accessingProcess];
          v159 = [v158 description];
          v160 = [v36 service];
          v161 = [v160 name];
          *(_DWORD *)buf = 138543618;
          *(void *)v603 = v159;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v161;
          _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Denying App Clip %{public}@ access to prohibited service %{public}@", buf, 0x16u);
        }
LABEL_105:

        [v572 setAuthorizationValue:0];
        [v572 setAuthorizationReason:5];
        goto LABEL_40;
      }
    }
    else
    {
    }
    v167 = [v36 subjectIdentity];
    if ([v167 isAvocadoWidget])
    {
      v168 = [v36 service];
      unsigned __int8 v169 = [v168 allowedForAvocadoWidget];

      if ((v169 & 1) == 0)
      {
        v138 = (id)qword_1000AC518;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
        {
          v170 = [v36 attributionChain];
          v171 = [v170 accessingProcess];
          v172 = [v171 description];
          v173 = [v36 service];
          v174 = [v173 name];
          *(_DWORD *)buf = 138543618;
          *(void *)v603 = v172;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v174;
          _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Denying Avocado widget %{public}@ access to prohibited service %{public}@", buf, 0x16u);
        }
LABEL_116:

        [v572 setAuthorizationValue:0];
        [v572 setAuthorizationReason:12];
        goto LABEL_40;
      }
    }
    else
    {
    }
    v184 = [v36 service];
    int v185 = sub_10000E800(v184);

    if (v185)
    {
      v156 = (id)qword_1000AC518;
      if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
      {
        v186 = [v36 identityDescription];
        v187 = [v36 service];
        v188 = [v187 name];
        *(_DWORD *)buf = 138543618;
        *(void *)v603 = v186;
        *(_WORD *)&v603[8] = 2114;
        *(void *)&v603[10] = v188;
        _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEFAULT, "Denying %{public}@ access to %{public}@ because is_service_disallowed_on_this_platform() is true", buf, 0x16u);
      }
      goto LABEL_105;
    }
    v189 = [v36 attributionChain];

    if (!v189)
    {
LABEL_136:
      unsigned int v560 = sub_10000E878(v36);
      v584[0] = _NSConcreteStackBlock;
      v584[1] = 3221225472;
      v584[2] = sub_10000F71C;
      v584[3] = &unk_100095228;
      id v571 = v572;
      id v585 = v571;
      id v212 = v36;
      id v586 = v212;
      v564 = objc_retainBlock(v584);
      v562 = (void *)qword_1000AC7B0;
      v569 = [v212 service];
      v565 = [v569 name];
      v567 = [v212 subjectIdentity];
      v213 = [v567 identifier];
      v214 = [v212 subjectIdentity];
      id v215 = objc_msgSend(v214, "client_type");
      v216 = [v212 attributionChain];
      v217 = [v216 requestingProcess];
      v218 = [v212 functionName];
      v219 = [v212 attributionChain];
      v220 = [v562 translateAllFilesToEndpointSecurity:v565 withClient:v213 clientType:v215 requestingProcess:v217 function:v218 attributionChain:v219 executablePath:0];

      v581[0] = _NSConcreteStackBlock;
      v581[1] = 3221225472;
      v581[2] = sub_100003E28;
      v581[3] = &unk_100095228;
      id v221 = v220;
      id v582 = v221;
      id v222 = v212;
      id v583 = v222;
      if (db_eval((uint64_t)"SELECT auth_value, auth_reason, csreq, strftime('%s','now') - last_modified AS age, flags, auth_version, pid, pid_version, boot_uuid, last_reminded FROM access WHERE service = ? AND client = ? AND client_type = ?", v581, v564))
      {
        v223 = [v222 service];
        v224 = [v223 name];
        v225 = [v222 identityDescription];
        [v571 denyAuthorizationWithErrorCode:4, @"Query for current DB state for %@: Requestor: %@", v224, v225 format];

LABEL_138:
        id v226 = v571;
LABEL_139:
        id v43 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
        v47 = 0;
LABEL_140:

        goto LABEL_42;
      }
      v227 = [v222 service];
      unsigned int v228 = [v227 upgradeV1AuthorizationValue];

      if (v228)
      {
        v229 = (id)qword_1000AC518;
        if (os_log_type_enabled(v229, OS_LOG_TYPE_INFO))
        {
          id v230 = [v571 authorizationValue];
          id v231 = [v222 spiVersion];
          id v232 = [v571 authorizationVersion];
          id v233 = [v222 recordUpgradePolicy];
          *(_DWORD *)buf = 134218752;
          *(void *)v603 = v230;
          *(_WORD *)&v603[8] = 2048;
          *(void *)&v603[10] = v231;
          *(_WORD *)&v603[18] = 2048;
          *(void *)&v603[20] = v232;
          *(_WORD *)&v603[28] = 2048;
          *(void *)&v603[30] = v233;
          _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_INFO, "upgradeV1AuthorizationValue: authValue:%llu, spiVersion: %llu, authVersion: %llu, upgrade policy: %llu", buf, 0x2Au);
        }
      }
      id v234 = [v571 authorizationVersion];
      v235 = [v222 service];
      if (v234 < [v235 authorizationVersionNumber])
      {
        v236 = [v222 service];
        if ([v236 upgradeV1AuthorizationValue]
          && ![v222 recordUpgradePolicy])
        {
          BOOL v280 = [v571 authorizationValue] == (id)1;

          if (!v280)
          {
            [v571 setV1AuthorizationUpgrade:1];
            objc_msgSend(v571, "setV1AuthorizationValue:", objc_msgSend(v571, "authorizationValue"));
            objc_msgSend(v571, "setV1AuthorizationReason:", objc_msgSend(v571, "authorizationReason"));
            if (![v571 authorizationValue])
            {
              [v571 setAuthorizationVersion:2];
              [v571 setDatabaseAction:1];
              v338 = (id)qword_1000AC518;
              if (os_log_type_enabled(v338, OS_LOG_TYPE_INFO))
              {
                v339 = [v222 service];
                v340 = [v339 name];
                v341 = [v222 identityDescription];
                *(_DWORD *)buf = 138543618;
                *(void *)v603 = v340;
                *(_WORD *)&v603[8] = 2114;
                *(void *)&v603[10] = v341;
                _os_log_impl((void *)&_mh_execute_header, v338, OS_LOG_TYPE_INFO, "Upgrading to V2 Denied: for %{public}@, %{public}@", buf, 0x16u);
              }
              [v571 setPromptType:0];
              v342 = [(id)qword_1000AC7B0 platform];
              v343 = [v222 service];
              v344 = [v222 subjectIdentity];
              objc_msgSend(v342, "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:", 6, v343, v344, 0, objc_msgSend(v571, "authorizationValue"), 1, objc_msgSend(v571, "v1AuthorizationValue"), objc_msgSend(v222, "desiredAuth"), 0, objc_msgSend(v571, "promptType"));

              goto LABEL_138;
            }
            [v571 setAuthorizationValue:1];
            [v571 setAuthorizationReason:5];
            [v571 setAuthorizationVersion:2];
          }
LABEL_150:
          if (v560 && [v571 authorizationValue] == (id)1)
          {
            [v571 setAuthorizationValue:2];
            [v571 setAuthorizationReason:5];
            v237 = [v222 service];
            unsigned int v238 = [v237 doNotStoreDefaultAllowAccess];

            if (v238)
            {
              v239 = (id)qword_1000AC518;
              if (os_log_type_enabled(v239, OS_LOG_TYPE_DEBUG))
              {
                v381 = [v222 subjectIdentity];
                v382 = [v381 identifier];
                v383 = [v222 service];
                v384 = [v383 name];
                *(_DWORD *)buf = 138543618;
                *(void *)v603 = v382;
                *(_WORD *)&v603[8] = 2114;
                *(void *)&v603[10] = v384;
                _os_log_debug_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_DEBUG, "Default Allow for: Client %{public}@ to %{public}@ will not be stored in database.", buf, 0x16u);
              }
            }
            else
            {
              [v571 setDatabaseAction:1];
            }
            goto LABEL_138;
          }
          if ([v571 authorizationValue] == (id)1)
          {
            v240 = [v222 attributionChain];
            if (v240)
            {
              v241 = [v222 attributionChain];
              v242 = [v241 accessingProcess];
              v243 = [v222 service];
              unsigned int v244 = [v242 hasEntitlement:@"com.apple.private.tcc.system" containsService:v243 options:0];

              if (v244)
              {
                v245 = (id)qword_1000AC518;
                if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
                {
                  v246 = [v222 identityDescription];
                  v247 = [v222 service];
                  v248 = [v247 name];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v603 = v246;
                  *(_WORD *)&v603[8] = 2114;
                  *(void *)&v603[10] = v248;
                  _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "Subject %{public}@ Allowed access to %{public}@ via entitlement 'com.apple.private.tcc.system'", buf, 0x16u);
                }
                [v571 setAuthorizationValue:2];
                [v571 setAuthorizationReason:11];
                [v571 setDatabaseAction:1];
                goto LABEL_138;
              }
            }
          }
          if ([v571 authorizationValue] == (id)1)
          {
            v249 = [v222 service];
            if (![v249 isAccessDeniedByDefault])
            {
LABEL_186:

              goto LABEL_187;
            }
            v250 = [v222 service];
            if ([v250 alertStyle] == (id)1)
            {
            }
            else
            {
              v281 = [v222 service];
              BOOL v282 = [v281 alertStyle] == (id)3;

              if (!v282) {
                goto LABEL_187;
              }
            }
            [v571 setAuthorizationValue:0];
            [v571 setAuthorizationReason:5];
            objc_msgSend(v571, "setDatabaseAction:", objc_msgSend(v222, "isPreflight") ^ 1);
            if ([v571 databaseAction] == (id)1)
            {
              v249 = (id)qword_1000AC518;
              if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
              {
                v283 = [v222 service];
                v284 = [v283 name];
                *(_DWORD *)buf = 138543362;
                *(void *)v603 = v284;
                _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEFAULT, "Service %{public}@ does not allow prompting; recording denied.",
                  buf,
                  0xCu);
              }
              goto LABEL_186;
            }
          }
LABEL_187:
          if ([v571 authorizationValue] == (id)1)
          {
            v285 = [v222 service];
            unsigned int v286 = [v285 applyDevelopmentAuthorizationPolicy];

            if (v286)
            {
              v287 = [v222 service];
              id v288 = [v287 developmentAuthorizationValue];

              if (v288)
              {
                if (v288 == (id)2)
                {
                  [v571 setAuthorizationValue:0];
                  [v571 setAuthorizationReason:5];
                  [v571 setDatabaseAction:0];
                  v289 = "Denied:No Record";
                }
                else if (v288 == (id)1)
                {
                  [v571 setAuthorizationValue:2];
                  [v571 setAuthorizationReason:5];
                  [v571 setDatabaseAction:0];
                  v289 = "Allowed:No Record";
                }
                else
                {
                  v289 = "unexpected!";
                }
                v290 = (id)qword_1000AC518;
                if (os_log_type_enabled(v290, OS_LOG_TYPE_INFO))
                {
                  v291 = [v222 service];
                  v292 = [v291 name];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v603 = v292;
                  *(_WORD *)&v603[8] = 2082;
                  *(void *)&v603[10] = v289;
                  _os_log_impl((void *)&_mh_execute_header, v290, OS_LOG_TYPE_INFO, " %{public}@ has Development Auth value: %{public}s", buf, 0x16u);
                }
              }
            }
          }
          v293 = [v222 subjectIdentity];
          if ([v293 isAvocadoWidget])
          {
            BOOL v294 = [v571 authorizationValue] == (id)1;

            if (v294)
            {
              v295 = (id)qword_1000AC518;
              if (os_log_type_enabled(v295, OS_LOG_TYPE_DEFAULT))
              {
                v296 = [v222 attributionChain];
                v297 = [v296 accessingProcess];
                v298 = [v297 description];
                v299 = [v222 service];
                v300 = [v299 name];
                *(_DWORD *)buf = 138543618;
                *(void *)v603 = v298;
                *(_WORD *)&v603[8] = 2114;
                *(void *)&v603[10] = v300;
                _os_log_impl((void *)&_mh_execute_header, v295, OS_LOG_TYPE_DEFAULT, "Preventing prompt from Avocado widget %{public}@ for service %{public}@", buf, 0x16u);
              }
              [v571 setAuthorizationValue:0];
              [v571 setAuthorizationReason:12];
              [v571 setDatabaseAction:0];
              goto LABEL_138;
            }
          }
          else
          {
          }
          v301 = [v222 subjectIdentity];
          if ([v301 isCaptureExtension])
          {
            BOOL v302 = [v571 authorizationValue] == (id)1;

            if (v302)
            {
              v303 = (id)qword_1000AC518;
              if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
              {
                v304 = [v222 attributionChain];
                v305 = [v304 accessingProcess];
                v306 = [v305 description];
                v307 = [v222 service];
                v308 = [v307 name];
                *(_DWORD *)buf = 138543618;
                *(void *)v603 = v306;
                *(_WORD *)&v603[8] = 2114;
                *(void *)&v603[10] = v308;
                _os_log_impl((void *)&_mh_execute_header, v303, OS_LOG_TYPE_DEFAULT, "Preventing prompt from Capture Extension %{public}@ for service %{public}@", buf, 0x16u);
              }
              [v571 setAuthorizationValue:1];
              [v571 setAuthorizationReason:12];
              [v571 setDatabaseAction:0];
              goto LABEL_138;
            }
          }
          else
          {
          }
          v309 = (id)qword_1000AC518;
          if (os_log_type_enabled(v309, OS_LOG_TYPE_INFO))
          {
            v310 = [v222 service];
            v311 = [v310 name];
            v312 = [v222 identityDescription];
            v313 = [v222 service];
            id v314 = [v571 descriptionWithRespectToService:v313];
            *(_DWORD *)buf = 138543874;
            *(void *)v603 = v311;
            *(_WORD *)&v603[8] = 2114;
            *(void *)&v603[10] = v312;
            *(_WORD *)&v603[18] = 2114;
            *(void *)&v603[20] = v314;
            _os_log_impl((void *)&_mh_execute_header, v309, OS_LOG_TYPE_INFO, "Handling access request to %{public}@, from %{public}@, %{public}@", buf, 0x20u);
          }
          v315 = [v222 service];
          unsigned int v316 = [v315 supportsStagedPrompting];

          if (v316)
          {
            if (![v222 desiredAuth])
            {
              v317 = [v222 service];
              objc_msgSend(v222, "setDesiredAuth:", objc_msgSend(v317, "defaultDesiredAuth"));
            }
            v318 = [v222 service];
            v319 = [v318 name];
            if ([v319 isEqualToString:@"kTCCServicePhotos"]
              && [v571 authorizationValue] == (id)1)
            {
              unsigned __int8 v320 = [v222 isPreflight];

              if ((v320 & 1) == 0)
              {
                *(void *)v600 = 1;
                uint64_t v580 = 0;
                LODWORD(v579) = 0;
                v321 = [(id)qword_1000AC7B0 platform];
                v322 = [v321 serviceByName:@"kTCCServicePhotosAdd"];

                v323 = (void *)qword_1000AC7B0;
                id v324 = [v322 isAccessAllowedByDefault];
                v325 = [v222 subjectIdentity];
                LOBYTE(v324) = [v323 evaluateAccessToService:v322 defaultAccessAllowed:v324 by:v325 checkCodeRequirements:1 authorizationResult:v600 authorizationReason:&v580 flags:&v579 subjectCodeIdentityDataResult:0];

                v326 = (id)qword_1000AC518;
                v327 = v326;
                if (v324)
                {
                  if (os_log_type_enabled(v326, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v328 = *(void *)v600;
                    v329 = [v222 identityDescription];
                    *(_DWORD *)buf = 134218498;
                    *(void *)v603 = v328;
                    *(_WORD *)&v603[8] = 2112;
                    *(void *)&v603[10] = v329;
                    *(_WORD *)&v603[18] = 1024;
                    *(_DWORD *)&v603[20] = v579;
                    _os_log_impl((void *)&_mh_execute_header, v327, OS_LOG_TYPE_DEFAULT, "Got %llu auth from db for client: %@ flags: %d", buf, 0x1Cu);
                  }
                  if ((v579 & 0x10) != 0)
                  {
                    v385 = (id)qword_1000AC518;
                    if (os_log_type_enabled(v385, OS_LOG_TYPE_ERROR))
                    {
                      v386 = [v222 identityDescription];
                      sub_10005D214(v386, (uint64_t)buf, v385);
                    }

                    [v571 setAuthorizationValue:0];
                    [v571 setAuthorizationReason:5];
                    [v571 setDatabaseAction:0];
                    id v387 = v571;

                    goto LABEL_139;
                  }
                  if (*(void *)v600 == 2) {
                    [v571 setAuthorizationValue:4];
                  }
                }
                else
                {
                  if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
                  {
                    v347 = [v222 identityDescription];
                    sub_10005D264(v347, (uint64_t)v601, v327);
                  }
                }
              }
            }
            else
            {
            }
            objc_msgSend(v571, "setPreviousAuthorization:", objc_msgSend(v571, "authorizationValue"));
            if ([v571 authorizationValue] != (id)1)
            {
              id v330 = [v571 authorizationValue];
              if (v330 != [v222 desiredAuth])
              {
                v331 = (id)qword_1000AC518;
                if (os_log_type_enabled(v331, OS_LOG_TYPE_DEFAULT))
                {
                  id v332 = [v571 authorizationValue];
                  id v333 = [v222 desiredAuth];
                  *(_DWORD *)buf = 134218240;
                  *(void *)v603 = v332;
                  *(_WORD *)&v603[8] = 2048;
                  *(void *)&v603[10] = v333;
                  _os_log_impl((void *)&_mh_execute_header, v331, OS_LOG_TYPE_DEFAULT, "got existing auth right: %llu with requested upgrade auth: %llu", buf, 0x16u);
                }

                if ([v222 desiredAuth] == (id)2
                  && ([v571 databaseFlags] & 0x10) != 0)
                {
                  v337 = (id)qword_1000AC518;
                  if (os_log_type_enabled(v337, OS_LOG_TYPE_ERROR)) {
                    sub_10005D1CC(v600, (int)[v571 databaseFlags], v337);
                  }
                  goto LABEL_247;
                }
                v334 = [v222 service];
                unsigned int v335 = objc_msgSend(v334, "authorizationChoicesForCurrentAuth:desiredAuth:aButtonAuth:bButtonAuth:cButtonAuth:", objc_msgSend(v571, "authorizationValue"), objc_msgSend(v222, "desiredAuth"), 0, 0, 0);

                v336 = (id)qword_1000AC518;
                v337 = v336;
                if (v335)
                {
                  if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR)) {
                    sub_10005D17C((uint64_t)v600, (uint64_t)[v571 authorizationValue], (uint64_t)objc_msgSend(v222, "desiredAuth"), v337);
                  }
LABEL_247:

                  objc_msgSend(v571, "setAuthorizationValue:", objc_msgSend(v571, "authorizationValue"));
                  [v571 setAuthorizationReason:5];
                  [v571 setDatabaseAction:0];
                  goto LABEL_248;
                }
                if (os_log_type_enabled(v336, OS_LOG_TYPE_DEFAULT))
                {
                  id v345 = [v571 authorizationValue];
                  id v346 = [v222 desiredAuth];
                  *(_DWORD *)buf = 134218240;
                  *(void *)v603 = v345;
                  *(_WORD *)&v603[8] = 2048;
                  *(void *)&v603[10] = v346;
                  _os_log_impl((void *)&_mh_execute_header, v337, OS_LOG_TYPE_DEFAULT, "attempting upgrade: currentAuth: %llu desiredAuth: %llu", buf, 0x16u);
                }

                if (([v222 isPreflight] & 1) == 0)
                {
                  [v571 setAuthorizationValue:1];
                  [v571 setPromptType:2];
                }
              }
            }
          }
LABEL_248:
          if ([v571 authorizationValue] != (id)1 && objc_msgSend(v571, "authorizationValue") != (id)6)
          {
            if (([v222 isPreflight] & 1) == 0
              && [v571 doUpdateOfSubjectVerifierData])
            {
              [v571 setDatabaseAction:1];
            }
            goto LABEL_138;
          }
          +[NSUserDefaults resetStandardUserDefaults];
          v348 = +[NSUserDefaults standardUserDefaults];
          v349 = [v348 persistentDomainForName:@"com.apple.springboard"];
          v350 = [v349 objectForKeyedSubscript:@"SBParentalControlsCapabilities"];
          v351 = [v222 service];
          v352 = [v351 name];
          unsigned int v353 = [v350 containsObject:v352];

          if (v353)
          {
            [v571 setAuthorizationValue:0];
            [v571 setAuthorizationReason:7];
            [v571 setDatabaseAction:0];
            v354 = (id)qword_1000AC518;
            if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
            {
              v355 = [v222 service];
              v356 = [v355 name];
              *(_DWORD *)buf = 138543362;
              *(void *)v603 = v356;
              _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_DEFAULT, "%{public}@ is restricted by Parental Controls.", buf, 0xCu);
            }
LABEL_271:

            goto LABEL_138;
          }
          v357 = [v222 service];
          BOOL v358 = [v357 alertStyle] == (id)2;

          if (v358)
          {
            v359 = [v222 attributionChain];
            v360 = [v359 responsibleProcess];
            unsigned int v361 = [v360 BOOLValueForEntitlement:@"com.apple.private.packagekit.userconsent"];

            int v362 = v361 ^ 1;
          }
          else
          {
            int v362 = 0;
          }
          v363 = [v222 service];
          v364 = [v363 name];
          unsigned int v365 = [v364 isEqualToString:@"kTCCServiceAccessibility"];

          if (v365)
          {
            [v571 setAuthorizationValue:1];
            [v571 setAuthorizationReason:5];
            [v571 setDatabaseAction:0];
            v354 = (id)qword_1000AC518;
            if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
            {
              v366 = [v222 service];
              v367 = [v366 name];
              *(_DWORD *)buf = 138543362;
              *(void *)v603 = v367;
              _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_DEFAULT, "Service %{public}@ does not allow prompting; returning Unknown",
                buf,
                0xCu);
            }
            goto LABEL_271;
          }
          v368 = [v222 service];
          BOOL v369 = [v368 alertStyle] == (id)1;

          if (v369)
          {
            [v571 setAuthorizationValue:0];
            [v571 setAuthorizationReason:5];
            [v571 setDatabaseAction:0];
            v354 = (id)qword_1000AC518;
            if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
            {
              v370 = [v222 service];
              v371 = [v370 name];
              *(_DWORD *)buf = 138543362;
              *(void *)v603 = v371;
              _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_DEFAULT, "Service %{public}@ does not allow prompting; returning denied.",
                buf,
                0xCu);
            }
            goto LABEL_271;
          }
          v372 = [v222 service];
          BOOL v373 = [v372 alertStyle] == (id)3;

          if (v373)
          {
            [v571 setAuthorizationValue:0];
            [v571 setAuthorizationReason:5];
            [v571 setDatabaseAction:0];
            v354 = (id)qword_1000AC518;
            if (os_log_type_enabled(v354, OS_LOG_TYPE_DEFAULT))
            {
              v374 = [v222 service];
              v375 = [v374 name];
              *(_DWORD *)buf = 138543362;
              *(void *)v603 = v375;
              _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_DEFAULT, "Service %{public}@ does not allow prompting; returning denied.",
                buf,
                0xCu);
            }
            goto LABEL_271;
          }
          if ([v222 isPreflight])
          {
            if ([v222 promptingPolicy] == (id)1)
            {
              [v571 setAuthorizationValue:0];
              [v571 setAuthorizationReason:10];
              [v571 setDatabaseAction:0];
            }
            v354 = [v222 service];
            if ([v354 supportsStagedPrompting])
            {
              BOOL v376 = [v571 authorizationValue] == (id)6;

              if (v376) {
                [v222 setDesiredAuth:6];
              }
              goto LABEL_138;
            }
            goto LABEL_271;
          }
          if (v362)
          {
            v377 = (id)qword_1000AC518;
            if (os_log_type_enabled(v377, OS_LOG_TYPE_DEFAULT))
            {
              v378 = [v222 service];
              v379 = [v378 name];
              *(_DWORD *)buf = 138543362;
              *(void *)v603 = v379;
              _os_log_impl((void *)&_mh_execute_header, v377, OS_LOG_TYPE_DEFAULT, "Service %{public}@ does not allow prompting for unentitled binaries; returning denied.",
                buf,
                0xCu);
            }
            v380 = [v222 service];
            [v222 presentAsynchronousDenialNotificationForService:v380];

            [v571 setAuthorizationValue:0];
            [v571 setAuthorizationReason:2];
            [v571 setDatabaseAction:1];
            goto LABEL_138;
          }
          v388 = [v222 subjectIdentity];
          v47 = [v388 displayName];

          if (!v47)
          {
            v404 = [v222 identityDescription];
            objc_msgSend(v571, "denyAuthorizationWithErrorCode:format:", 2, @"Unable to prompt for client without display name (%{public}@)", v404);

            goto LABEL_138;
          }
          if (_os_feature_enabled_impl())
          {
            if (([v222 watchInitiatedPrompt] & 1) == 0)
            {
              v389 = [(id)qword_1000AC7B0 platform];
              v390 = [v389 protectedAppManager];
              v391 = [v222 service];
              v392 = [v391 name];
              unsigned __int8 v393 = [v390 authenticateForAccessToService:v392];

              if ((v393 & 1) == 0)
              {
                v494 = (id)qword_1000AC518;
                if (os_log_type_enabled(v494, OS_LOG_TYPE_DEFAULT))
                {
                  v495 = [v222 service];
                  v496 = [v495 name];
                  *(_DWORD *)buf = 138412290;
                  *(void *)v603 = v496;
                  _os_log_impl((void *)&_mh_execute_header, v494, OS_LOG_TYPE_DEFAULT, "service: %@ is locked and authentication failed", buf, 0xCu);
                }
                [v571 setAuthorizationValue:0];
                [v571 setAuthorizationReason:15];
                [v571 setDatabaseAction:0];
                id v497 = v571;
                id v43 = 0;
                v44 = 0;
                v45 = 0;
                v46 = 0;
                goto LABEL_140;
              }
            }
          }
          v394 = (id)qword_1000AC518;
          if (os_log_type_enabled(v394, OS_LOG_TYPE_DEFAULT))
          {
            v395 = [v222 messageIdentifier];
            v396 = [v222 service];
            v397 = [v396 name];
            v398 = [v222 identityDescription];
            *(_DWORD *)buf = 138543874;
            *(void *)v603 = v395;
            *(_WORD *)&v603[8] = 2114;
            *(void *)&v603[10] = v397;
            *(_WORD *)&v603[18] = 2114;
            *(void *)&v603[20] = v398;
            _os_log_impl((void *)&_mh_execute_header, v394, OS_LOG_TYPE_DEFAULT, "AUTHREQ_PROMPTING: msgID=%{public}@, service=%{public}@, subject=%{public}@, ", buf, 0x20u);
          }
          v399 = [v222 service];
          v46 = [v399 requestTitleTextLocalizationKey];

          v400 = [v222 service];
          v559 = [v400 requestAdditionalTextLocalizationKey];

          v401 = [v222 service];
          unsigned int v402 = [v401 supportsStagedPrompting];

          if (v402)
          {
            if ([v571 promptType] == (id)2)
            {
              v403 = [v222 service];
              [v403 requestUpgradeTitleTextLocalizationKey];
            }
            else
            {
              v403 = [v222 service];
              objc_msgSend(v403, "requestTitleTextLocalizationKeyForAuthorization:", objc_msgSend(v222, "desiredAuth"));
            }
            id v563 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v563 = 0;
          }
          v405 = [v222 service];
          v561 = [v405 alternatePromptTitleEntitlement];

          if (v561)
          {
            v406 = [v222 attributionChain];
            v407 = [v406 accessingProcess];
            unsigned int v408 = [v407 BOOLValueForEntitlement:v561];

            if (v408)
            {
              v409 = (id)qword_1000AC518;
              if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v409, OS_LOG_TYPE_DEFAULT, "using alternate header text due to entitlement", buf, 2u);
              }

              v410 = [v222 service];
              uint64_t v411 = [v410 requestEntitlementTitleTextLocalizationKey];

              id v563 = (id)v411;
            }
          }
          if (v563)
          {
            id v412 = v563;

            v46 = v412;
          }
          if ([v222 promptRightsMask])
          {
            unsigned __int8 v413 = [v222 promptRightsMask];
          }
          else
          {
            v414 = [v222 service];
            unsigned __int8 v413 = [v414 authorizationPromptRightsMask];
          }
          id v415 = [v222 spiVersion];
          v416 = [v222 service];
          v568 = [v416 allowAuthorizationButtonTitleLocalizationKey];

          uint64_t v580 = 2;
          v417 = [v222 service];
          v566 = [v417 denyAuthorizationButtonTitleLocalizationKey];

          v570 = 0;
          uint64_t v578 = 1;
          uint64_t v579 = 0;
          if ((v413 & 8) != 0 && (unint64_t)v415 >= 2)
          {
            v419 = [v222 service];
            v570 = [v419 limitedAuthorizationButtonTitleLocalizationKey];

            uint64_t v578 = 3;
            if ([v571 v1AuthorizationValue] == (id)2)
            {
              v420 = [v222 service];
              v421 = [v420 requestTitleTextAfterV2UpgradeLocalizationKey];
              BOOL v422 = v421 == 0;

              if (!v422)
              {
                v423 = [v222 service];
                uint64_t v424 = [v423 requestTitleTextAfterV2UpgradeLocalizationKey];

                v46 = (void *)v424;
              }
              v425 = [v222 service];
              v426 = [v425 requestAdditionalTextAfterV2UpgradeLocalizationKey];
              BOOL v427 = v426 == 0;

              if (!v427)
              {
                v428 = [v222 service];
                uint64_t v429 = [v428 requestAdditionalTextAfterV2UpgradeLocalizationKey];

                v559 = (void *)v429;
              }
            }
            v430 = [v222 service];
            v431 = [v430 alertManager];

            if (v431) {
              [v431 displayAlertForCondition:1 withCustomUserInfo:0];
            }
          }
          v432 = [v222 service];
          if ([v432 supportsStagedPrompting])
          {
            v433 = [v222 service];
            v434 = [v433 name];
            if ([v434 isEqualToString:@"kTCCServicePhotos"])
            {
              BOOL v435 = [v222 spiVersion] == (id)1;

              if (v435)
              {
                v555 = v566;
                v557 = v568;
                v553 = v570;
                goto LABEL_327;
              }
            }
            else
            {
            }
            id v453 = [v222 desiredAuth];
            v454 = [v222 service];
            unsigned int v455 = objc_msgSend(v454, "authorizationChoicesForCurrentAuth:desiredAuth:aButtonAuth:bButtonAuth:cButtonAuth:", objc_msgSend(v571, "previousAuthorization"), objc_msgSend(v222, "desiredAuth"), &v580, &v579, &v578);

            if ((v455 & 0x80000000) != 0)
            {
              v498 = (id)qword_1000AC518;
              if (os_log_type_enabled(v498, OS_LOG_TYPE_ERROR))
              {
                id v520 = [v571 previousAuthorization];
                id v521 = [v222 desiredAuth];
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v603 = v453 == 0;
                *(_WORD *)&v603[4] = 2048;
                *(void *)&v603[6] = v520;
                *(_WORD *)&v603[14] = 2048;
                *(void *)&v603[16] = v521;
                _os_log_error_impl((void *)&_mh_execute_header, v498, OS_LOG_TYPE_ERROR, "Staged prompting request is invalid: legacySPI: %d currentAuth: %llu desiredAuth: %llu", buf, 0x1Cu);
              }

              objc_msgSend(v571, "setAuthorizationValue:", objc_msgSend(v571, "previousAuthorization"));
              [v571 setAuthorizationReason:5];
              [v571 setDatabaseAction:0];
              goto LABEL_375;
            }
            if ([v571 previousAuthorization] == (id)6 && objc_msgSend(v222, "desiredAuth") == (id)6)
            {
              v456 = (id)qword_1000AC518;
              if (os_log_type_enabled(v456, OS_LOG_TYPE_DEBUG)) {
                sub_10005D13C();
              }

              [v222 setDesiredAuth:2];
            }
            v457 = [v222 service];
            v557 = objc_msgSend(v457, "buttonTitleLocalizationKeyForAuthorization:desiredAuth:", v580, objc_msgSend(v222, "desiredAuth"));

            v458 = [v222 service];
            v555 = objc_msgSend(v458, "buttonTitleLocalizationKeyForAuthorization:desiredAuth:", v579, objc_msgSend(v222, "desiredAuth"));

            v459 = [v222 service];
            v553 = objc_msgSend(v459, "buttonTitleLocalizationKeyForAuthorization:desiredAuth:", v578, objc_msgSend(v222, "desiredAuth"));

            v460 = (id)qword_1000AC518;
            if (os_log_type_enabled(v460, OS_LOG_TYPE_DEFAULT))
            {
              v461 = [v222 service];
              id v462 = [v571 previousAuthorization];
              id v463 = [v222 desiredAuth];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)v603 = v453 == 0;
              *(_WORD *)&v603[4] = 2112;
              *(void *)&v603[6] = v461;
              *(_WORD *)&v603[14] = 2048;
              *(void *)&v603[16] = v462;
              *(_WORD *)&v603[24] = 2048;
              *(void *)&v603[26] = v463;
              _os_log_impl((void *)&_mh_execute_header, v460, OS_LOG_TYPE_DEFAULT, "got authorization choices for staged prompting request: legacy SPI: %d service: %@ currentAuth: %llu desiredAuth: %llu", buf, 0x26u);
            }
            v432 = (id)qword_1000AC518;
            if (os_log_type_enabled(v432, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(void *)v603 = v580;
              *(_WORD *)&v603[8] = 2048;
              *(void *)&v603[10] = v579;
              *(_WORD *)&v603[18] = 2048;
              *(void *)&v603[20] = v578;
              _os_log_impl((void *)&_mh_execute_header, v432, OS_LOG_TYPE_DEFAULT, "aButtonAuth: %llu bButtonAuth: %llu cButtonAuth: %llu", buf, 0x20u);
            }
          }
          else
          {
            v555 = v566;
            v557 = v568;
            v553 = v570;
          }

LABEL_327:
          v436 = [v222 service];
          v437 = [v436 requestTitleTextForSubsequentRequestsKey];
          BOOL v438 = v437 == 0;

          if (!v438)
          {
            v439 = (void *)qword_1000AC7B0;
            v440 = [v222 service];
            id v441 = [v439 numberOfRecordsForService:v440];

            if (v441)
            {
              v442 = (id)qword_1000AC518;
              if (os_log_type_enabled(v442, OS_LOG_TYPE_DEFAULT))
              {
                v443 = [v222 service];
                v444 = [v443 name];
                *(_DWORD *)buf = 138543618;
                *(void *)v603 = v444;
                *(_WORD *)&v603[8] = 2048;
                *(void *)&v603[10] = v441;
                _os_log_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_DEFAULT, "Using subsequent request strings for %{public}@ with %llu records.", buf, 0x16u);
              }
LABEL_331:

              v445 = [v222 service];
              uint64_t v446 = [v445 requestTitleTextForSubsequentRequestsKey];

              v447 = [v222 service];
              uint64_t v448 = [v447 requestAdditionalTextForSubsequentRequestsLocalizationKey];

              v449 = [v222 service];
              v568 = [v449 subsequentRequestAllowAuthorizationButtonTitleLocalizationKey];

              uint64_t v580 = 2;
              v450 = [v222 service];
              v566 = [v450 subsequentRequestDenyAuthorizationButtonTitleLocalizationKey];

              uint64_t v579 = 0;
              v451 = [v222 service];
              v570 = [v451 subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey];

              uint64_t v578 = 3;
              v452 = (id)qword_1000AC518;
              if (os_log_type_enabled(v452, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)v603 = v568;
                *(_WORD *)&v603[8] = 2112;
                *(void *)&v603[10] = v566;
                *(_WORD *)&v603[18] = 2112;
                *(void *)&v603[20] = v570;
                _os_log_debug_impl((void *)&_mh_execute_header, v452, OS_LOG_TYPE_DEBUG, "Loc Keys: allow %@, deny: %@, limited: %@", buf, 0x20u);
              }

              v559 = (void *)v448;
              v46 = (void *)v446;
              goto LABEL_350;
            }
            v464 = [v222 service];
            v465 = [v464 subsequentRequestStringsRelatedService];
            BOOL v466 = v465 == 0;

            if (!v466)
            {
              v467 = (void *)qword_1000AC7B0;
              v468 = [v222 service];
              v469 = [v468 subsequentRequestStringsRelatedService];
              id v470 = [v467 numberOfRecordsForService:v469 withAuthorizationValue:2];

              if (v470)
              {
                v442 = (id)qword_1000AC518;
                if (os_log_type_enabled(v442, OS_LOG_TYPE_DEFAULT))
                {
                  v471 = [v222 service];
                  v472 = [v471 subsequentRequestStringsRelatedService];
                  v473 = [v472 name];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v603 = v473;
                  *(_WORD *)&v603[8] = 2048;
                  *(void *)&v603[10] = v470;
                  _os_log_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_DEFAULT, "Using subsequent request strings for related service %{public}@ with %llu records.", buf, 0x16u);
                }
                goto LABEL_331;
              }
            }
          }
          v566 = v555;
          v568 = v557;
          v570 = v553;
LABEL_350:
          v474 = [v222 service];
          v475 = [v474 localizedResourcesBundle];
          BOOL v476 = v475 == 0;

          if (!v476)
          {
            v477 = [v222 service];
            v558 = [v477 localizedTextWithKey:v568];

            v478 = [v222 service];
            v556 = [v478 localizedTextWithKey:v566];

            if (v570)
            {
              v479 = [v222 service];
              v554 = [v479 localizedTextWithKey:v570];
            }
            else
            {
              v554 = 0;
            }
            v482 = [v222 service];
            v45 = [v482 localizedTextWithKey:v46];

            if (v45)
            {
              v44 = +[NSString stringWithValidatedFormat:v45, @"%@", 0, v47 validFormatSpecifiers error];
              if (v44)
              {
                BOOL v577 = 0;
                v483 = [v222 service];
                v545 = [v222 subjectIdentity];
                v548 = [v222 service];
                v484 = [v548 localizedResourcesBundle];
                id v576 = 0;
                char oslogb = sub_100024B78(v483, v545, v484, (uint64_t *)&v576, &v577, (uint64_t)[v222 desiredAuth]);
                id v43 = v576;

                if ((oslogb & 1) == 0)
                {
                  v504 = [v222 service];
                  v505 = [v504 name];
                  v506 = [v222 identityDescription];
                  objc_msgSend(v571, "denyAuthorizationWithErrorCode:format:", 2, @"Failure client_usage_string_for_service() service %{public}@ and subject %{public}@", v505, v506);

                  id v507 = v571;
                  goto LABEL_408;
                }
                if (!v43 && v577)
                {
                  v485 = (id)qword_1000AC518;
                  if (os_log_type_enabled(v485, OS_LOG_TYPE_ERROR))
                  {
                    v529 = [v222 service];
                    v552 = [v529 name];
                    os_log_t oslogc = [v222 identityDescription];
                    v547 = [v222 service];
                    v530 = [v547 usageDescriptionKeyName];
                    *(_DWORD *)buf = 138543874;
                    *(void *)v603 = v552;
                    *(_WORD *)&v603[8] = 2114;
                    *(void *)&v603[10] = oslogc;
                    *(_WORD *)&v603[18] = 2114;
                    *(void *)&v603[20] = v530;
                    _os_log_error_impl((void *)&_mh_execute_header, v485, OS_LOG_TYPE_ERROR, "Refusing authorization request for service %{public}@ and subject %{public}@ without %{public}@ key", buf, 0x20u);
                  }
                  [v571 setAuthorizationValue:0];
                  [v571 setAuthorizationReason:8];
                  [v571 setDatabaseAction:0];
                  v486 = [v222 attributionChain];
                  if (!v486) {
                    goto LABEL_367;
                  }
                  v487 = [v222 attributionChain];
                  if (([v487 accessingProcessSpecified] & 1) == 0)
                  {
                    v488 = [v222 service];
                    unsigned __int8 v549 = [v488 pardonMissingUsage];

                    if (v549)
                    {
LABEL_367:
                      id v491 = v571;
                      id v43 = 0;
LABEL_408:

                      goto LABEL_409;
                    }
                    v550 = [v222 service];
                    v489 = [v550 usageDescriptionKeyName];
                    v486 = +[NSString stringWithFormat:@"This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an %@ key with a string value explaining to the user how the app uses this data.", v489];

                    [v571 setServicePolicyAction:1];
                    [v571 setServicePolicyActionDescription:v486];
                    v487 = [v222 service];
                    v490 = [v487 usageDescriptionKeyName];
                    [v571 setServicePolicyActionKeyName:v490];
                  }
                  goto LABEL_367;
                }
                if (v559)
                {
                  os_log_t oslog = [v222 service];
                  v508 = [oslog localizedResourcesBundle];
                  v551 = [v508 localizedStringForKey:v559 value:&stru_100096EC0 table:0];
                  if (v551)
                  {
                    v546 = +[NSString stringWithValidatedFormat:v551, @"%@", 0, v47 validFormatSpecifiers error];

                    if (v546)
                    {
                      if (v43)
                      {
                        uint64_t v509 = +[NSString stringWithFormat:@"%@\n\n%@", v546, v43];

                        id v43 = (id)v509;
                      }
                      else
                      {
                        id v43 = v546;
                        v546 = v43;
                      }
                    }
                    else
                    {
                      v546 = 0;
                    }
LABEL_386:
                    v510 = [v222 service];
                    if ([v510 usesTwoStagePrompting])
                    {
                      BOOL v511 = [v222 desiredAuth] == (id)2;

                      if (v511)
                      {
                        v598[0] = @"BundleRequestingSecondaryPrompt";
                        v512 = [v222 subjectIdentity];
                        os_log_t oslogd = [v512 identifier];
                        v598[1] = @"ResponsiblePID";
                        v599[0] = oslogd;
                        v535 = [v222 subjectIdentity];
                        v513 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v535 responsiblePID]);
                        v599[1] = v513;
                        v533 = +[NSDictionary dictionaryWithObjects:v599 forKeys:v598 count:2];

                        v514 = [v222 service];
                        v515 = [v514 alertManager];
                        [v515 displayAlertForCondition:2 withCustomUserInfo:v533];

                        uint64_t v574 = 0;
                        uint64_t v575 = 1;
                        int v573 = 0;
                        uint64_t v536 = qword_1000AC7B0;
                        v516 = [v222 service];
                        os_log_t osloge = [v222 service];
                        unsigned int v532 = [osloge isAccessAllowedByDefault];
                        v517 = [v222 subjectIdentity];
                        LOBYTE(v536) = [(id)v536 evaluateAccessToService:v516 defaultAccessAllowed:v532 by:v517 checkCodeRequirements:1 authorizationResult:&v575 authorizationReason:&v574 flags:&v573 subjectCodeIdentityDataResult:0];

                        osloga = (id)qword_1000AC518;
                        if (v536)
                        {
                          if (os_log_type_enabled(osloga, OS_LOG_TYPE_DEFAULT))
                          {
                            uint64_t v518 = v575;
                            v519 = [v222 identityDescription];
                            *(_DWORD *)buf = 134218498;
                            *(void *)v603 = v518;
                            *(_WORD *)&v603[8] = 2112;
                            *(void *)&v603[10] = v519;
                            *(_WORD *)&v603[18] = 1024;
                            *(_DWORD *)&v603[20] = v573;
                            _os_log_impl((void *)&_mh_execute_header, osloga, OS_LOG_TYPE_DEFAULT, "AUTHREQ_RESULT: Got %llu auth from db for client: %@ flags: %d", buf, 0x1Cu);
                          }
                          [v571 setAuthorizationValue:v575];
                          [v571 setAuthorizationReason:v574];
                          [v571 setDatabaseAction:0];
                        }
                        else
                        {
                          if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
                          {
                            v522 = [v222 service];
                            v523 = [v222 identityDescription];
                            sub_10005D0D4(v522, v523, (uint64_t)buf, osloga);
                          }
                        }
                        goto LABEL_399;
                      }
                    }
                    else
                    {
                    }
                    LODWORD(v531) = 0;
                    objc_msgSend(v222, "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAuth:currentAuth:withTimeoutInSeconds:updatingResult:", v44, v43, v558, v580, v556, v579, v554, v578, objc_msgSend(v571, "previousAuthorization"), v531, v571);
LABEL_399:
                    v524 = [v222 service];
                    if ([v524 supportsStagedPrompting]
                      && (v580 == 2 || v579 == 2 || v578 == 2)
                      && [v571 authorizationReason] != (id)9)
                    {
                      BOOL v528 = [v571 authorizationReason] == (id)13;

                      if (!v528) {
                        objc_msgSend(v571, "setDatabaseFlags:", objc_msgSend(v571, "databaseFlags") | 0x10);
                      }
                    }
                    else
                    {
                    }
                    v525 = [v222 clientDict];
                    v526 = [v525 objectForKeyedSubscript:kTCCNotificationExtensionClientDataPromptReasonKey];

                    if ([v571 authorizationReason] == (id)2)
                    {
                      os_log_t oslogf = [(id)qword_1000AC7B0 platform];
                      v537 = [v222 service];
                      v534 = [v222 subjectIdentity];
                      -[NSObject sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:](oslogf, "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:", 4, v537, v534, 0, [v571 authorizationValue], objc_msgSend(v571, "v1AuthorizationUpgrade") != 0, objc_msgSend(v571, "v1AuthorizationValue"), objc_msgSend(v222, "desiredAuth"), v526, objc_msgSend(v571, "promptType"));
                    }
                    id v527 = v571;

                    goto LABEL_408;
                  }
                }
                v546 = 0;
                v551 = 0;
                goto LABEL_386;
              }
              v500 = [v222 service];
              v501 = [v500 name];
              v502 = [v222 identityDescription];
              objc_msgSend(v571, "denyAuthorizationWithErrorCode:format:", 2, @"Failed to construct localized request string for service %{public}@ and subject %{public}@", v501, v502);
            }
            else
            {
              v492 = [v222 service];
              v493 = [v492 name];
              objc_msgSend(v571, "denyAuthorizationWithErrorCode:format:", 2, @"Could not find localized string for service %{public}: request_key=%{public}", v493, v46, 0);
            }
            id v503 = v571;
            id v43 = 0;
            v44 = 0;
            goto LABEL_408;
          }
          v480 = [v222 service];
          v481 = [v480 name];
          objc_msgSend(v571, "denyAuthorizationWithErrorCode:format:", 2, @"Failed to load localizedResourcesBundle for service %{public}@", v481);

LABEL_375:
          id v499 = v571;
          id v43 = 0;
          v44 = 0;
          v45 = 0;
LABEL_409:

          goto LABEL_140;
        }
      }
      goto LABEL_150;
    }
    v190 = [v36 attributionChain];
    v191 = [v190 accessingProcess];
    v192 = [v191 arrayValueForEntitlement:@"com.apple.tcc.delegated-services"];

    v193 = [v36 service];
    v194 = [v193 name];
    if ([v192 containsObject:v194])
    {
      v195 = [v36 service];
      v196 = [v195 sandboxOperationForDelegation];
      BOOL v197 = v196 == 0;

      if (v197)
      {
LABEL_135:

        goto LABEL_136;
      }
      v198 = (id)qword_1000AC518;
      if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
      {
        v199 = [v36 identityDescription];
        v200 = [v36 service];
        v201 = [v200 name];
        v202 = [v36 service];
        v203 = [v202 sandboxOperationForDelegation];
        *(_DWORD *)buf = 138412802;
        *(void *)v603 = v199;
        *(_WORD *)&v603[8] = 2112;
        *(void *)&v603[10] = v201;
        *(_WORD *)&v603[18] = 2112;
        *(void *)&v603[20] = v203;
        _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_INFO, "Checking %@ for delegated service: %@: operation: %@", buf, 0x20u);
      }
      v204 = [v36 attributionChain];
      v205 = [v204 accessingProcess];
      v206 = v205;
      if (v205)
      {
        [v205 auditToken];
      }
      else
      {
        long long v589 = 0u;
        long long v590 = 0u;
      }
      BOOL v256 = sandbox_check_by_audit_token() == 0;

      if (!v256)
      {
        v257 = [v36 attributionChain];
        v258 = [v257 accessingProcess];
        v259 = v258;
        if (v258)
        {
          [v258 auditToken];
        }
        else
        {
          long long v587 = 0u;
          long long v588 = 0u;
        }
        v265 = [v36 service];
        id v266 = [v265 sandboxOperationForDelegation];
        [v266 UTF8String];
        int v267 = sandbox_check_by_audit_token();

        if (v267 < 0)
        {
          v268 = [v36 service];
          v275 = [v268 name];
          v276 = [v36 identityDescription];
          v277 = [v36 service];
          v278 = [v277 sandboxOperationForDelegation];
          [v572 denyAuthorizationWithErrorCode:3, @"delegated service: %@: %@ sandbox_check_by_audit_token(%@) fails: %d", v275, v276, v278, *__error() format];
        }
        else
        {
          [v572 setAuthorizationValue:2 * (v267 == 0)];
          [v572 setAuthorizationReason:5];
          [v572 setReplyNoCacheAuthorization:1];
          v268 = (id)qword_1000AC518;
          if (os_log_type_enabled(v268, OS_LOG_TYPE_INFO))
          {
            v269 = [v36 identityDescription];
            v270 = [v36 service];
            v271 = [v270 name];
            v272 = [v36 service];
            v273 = [v272 sandboxOperationForDelegation];
            id v274 = [v572 authorizationValue];
            *(_DWORD *)buf = 138413058;
            *(void *)v603 = v269;
            *(_WORD *)&v603[8] = 2112;
            *(void *)&v603[10] = v271;
            *(_WORD *)&v603[18] = 2112;
            *(void *)&v603[20] = v273;
            *(_WORD *)&v603[28] = 2048;
            *(void *)&v603[30] = v274;
            _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_INFO, "%@ for delegated service: %@: operation: %@ is %lld", buf, 0x2Au);
          }
        }

        id v279 = v572;
        goto LABEL_41;
      }
      v193 = (id)qword_1000AC518;
      if (os_log_type_enabled(v193, OS_LOG_TYPE_INFO))
      {
        v260 = [v36 identityDescription];
        v261 = [v36 service];
        v262 = [v261 name];
        v263 = [v36 service];
        v264 = [v263 sandboxOperationForDelegation];
        *(_DWORD *)buf = 138412802;
        *(void *)v603 = v260;
        *(_WORD *)&v603[8] = 2112;
        *(void *)&v603[10] = v262;
        *(_WORD *)&v603[18] = 2112;
        *(void *)&v603[20] = v264;
        _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_INFO, "%@ for delegated service: %@: operation: %@ is not sandboxed. Ignoring delegation", buf, 0x20u);
      }
    }
    else
    {
    }
    goto LABEL_135;
  }
  v49 = [v5 attributionChain];
  BOOL v50 = v49 == 0;

  if (!v50)
  {
    v51 = (id)qword_1000AC518;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [v5 messageIdentifier];
      v53 = [v5 attributionChain];
      v54 = [v53 description];
      *(_DWORD *)buf = 138543618;
      *(void *)v603 = v52;
      *(_WORD *)&v603[8] = 2114;
      *(void *)&v603[10] = v54;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "AUTHREQ_ATTRIBUTION: msgID=%{public}@, attribution={%{public}@},", buf, 0x16u);
    }
  }
  v55 = [v5 attributionChain];
  unsigned int v56 = [v55 accessingProcessSpecified];

  if (v56)
  {
    v57 = [v5 attributionChain];
    v58 = [v57 requestingProcess];

    if ([v58 euid])
    {
      v59 = [v5 service];
      unsigned __int8 v60 = [v59 shouldAllowUnrestrictedCheckAuditToken];

      if ((v60 & 1) == 0)
      {
        v61 = (void *)qword_1000AC7B0;
        v62 = [v5 functionName];
        v63 = [v5 service];
        LODWORD(v61) = [v61 canProcess:v58 callFunction:v62 forService:v63 withAccessIdentity:0];

        if (!v61)
        {
          v162 = [v58 description];
          v163 = [v5 attributionChain];
          v164 = [v163 accessingProcess];
          v165 = [v164 description];
          [v572 denyAuthorizationWithErrorCode:3, @"Requestor: %@ is not entitled to check access for accessor %@", v162, v165 format];

          id v166 = v572;
          goto LABEL_43;
        }
        v64 = (id)qword_1000AC518;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = [v58 description];
          v66 = [v5 attributionChain];
          v67 = [v66 accessingProcess];
          v68 = [v67 description];
          *(_DWORD *)buf = 138543618;
          *(void *)v603 = v65;
          *(_WORD *)&v603[8] = 2114;
          *(void *)&v603[10] = v68;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "requestor: %{public}@ is checking access for accessor %{public}@", buf, 0x16u);
        }
      }
    }
  }
  v69 = [v5 service];
  v70 = [v5 attributionChain];
  unsigned int v71 = accessingProcessHasAllowOrRegionalPromptEntitlement(v69, v70, 0);

  if (v71)
  {
    v72 = [(id)qword_1000AC7B0 platform];
    unsigned __int8 v73 = [v72 isChinaSKUDevice];

    if (v73) {
      goto LABEL_38;
    }
    v74 = (id)qword_1000AC518;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = [v5 attributionChain];
      v76 = [v75 accessingProcess];
      v77 = [v76 description];
      v78 = [v5 service];
      v79 = [v78 name];
      *(_DWORD *)buf = 138543618;
      *(void *)v603 = v77;
      *(_WORD *)&v603[8] = 2114;
      *(void *)&v603[10] = v79;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Granting %{public}@ access to %{public}@ via entitlement 'com.apple.private.tcc.allow-or-regional-prompt'", buf, 0x16u);
    }
  }
  else
  {
    v93 = [v5 attributionChain];
    v94 = [v93 accessingProcess];
    v95 = [v5 service];
    unsigned int v96 = [v94 hasEntitlement:@"com.apple.private.tcc.allow" containsService:v95 options:1];

    if (v96)
    {
      v74 = (id)qword_1000AC518;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v97 = [v5 attributionChain];
        v98 = [v97 accessingProcess];
        v99 = [v98 description];
        v100 = [v5 service];
        v101 = [v100 name];
        *(_DWORD *)buf = 138543618;
        *(void *)v603 = v99;
        *(_WORD *)&v603[8] = 2114;
        *(void *)&v603[10] = v101;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Granting %{public}@ access to %{public}@ via entitlement 'com.apple.private.tcc.allow'", buf, 0x16u);
      }
    }
    else
    {
      v127 = [v5 service];
      v128 = [v127 name];
      if (([v128 isEqualToString:@"kTCCServiceBluetoothAlways"] & 1) == 0)
      {

        goto LABEL_38;
      }
      v129 = [v5 attributionChain];
      v130 = [v129 accessingProcess];
      v131 = [v5 service];
      unsigned int v132 = [v130 hasEntitlement:@"com.apple.private.tcc.ifdreader" containsService:v131 options:1];

      if (!v132) {
        goto LABEL_38;
      }
      v74 = (id)qword_1000AC518;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v133 = [v5 attributionChain];
        v134 = [v133 accessingProcess];
        v135 = [v134 description];
        v136 = [v5 service];
        v137 = [v136 name];
        *(_DWORD *)buf = 138543618;
        *(void *)v603 = v135;
        *(_WORD *)&v603[8] = 2114;
        *(void *)&v603[10] = v137;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Granting %{public}@ access to %{public}@ via entitlement 'com.apple.private.tcc.ifdreader'", buf, 0x16u);
      }
    }
  }

  [v572 setAuthorizationValue:2];
  [v572 setAuthorizationReason:11];
  uint64_t v6 = v572;
  id v102 = v572;
LABEL_44:
  _Block_object_dispose(&v594, 8);

  return v572;
}

void sub_10000BB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BC8C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) _indentForDepth:(*(_DWORD *)(a1 + 48) + 1)];
  [v6 appendString:v7];

  if (!strcmp(a2, "target_token")
    || !strcmp(a2, "indirect_object_token")
    || !strcmp(a2, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY"))
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_data)
    {
      memset(&buffer, 0, sizeof(buffer));
      if (xpc_data_get_bytes(v5, &buffer, 0, 0x20uLL) == 32)
      {
        *(void *)pidp = 0;
        uid_t euidp = 0;
        audit_token_t atoken = buffer;
        audit_token_to_au32(&atoken, (uid_t *)pidp, &euidp, 0, 0, 0, &pidp[1], 0, 0);
        [*(id *)(a1 + 32) appendFormat:@"%s={pid:%d, auid:%d, euid:%d}", a2, pidp[1], pidp[0], euidp];
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%s={<malformed!>}", a2, v14, v15, v16);
      }
    }
    else
    {
      xpc_type_t type = xpc_get_type(v5);
      unsigned __int8 v12 = *(void **)(a1 + 32);
      if (type == (xpc_type_t)&_xpc_type_null) {
        objc_msgSend(v12, "appendFormat:", @"%s={NULL}", a2, v14, v15, v16);
      }
      else {
        objc_msgSend(v12, "appendFormat:", @"%s={<unknown type!>}", a2, v14, v15, v16);
      }
    }
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  else if (strcmp(a2, "target_csreq"))
  {
    int v8 = strcmp(a2, "extension");
    unsigned int v9 = *(void **)(a1 + 32);
    if (v8)
    {
      BOOL v10 = [*(id *)(a1 + 40) _descriptionForXPCObject:v5 depth:(*(_DWORD *)(a1 + 48) + 1)];
      [v9 appendFormat:@"%s=%@\n", a2, v10];
    }
    else
    {
      objc_msgSend(v9, "appendFormat:", @"%s={<redacted>}\n", a2);
    }
  }

  return 1;
}

void sub_10000C250(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    id v4 = v2;
    string = xpc_dictionary_get_string(v4, "function");
    xpc_dictionary_get_remote_connection(v4);
    uint64_t v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (!reply)
    {
      id v24 = xpc_copy_description(v4);
      v25 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10005CF34();
      }

      free(v24);
      xpc_connection_cancel(v6);
      goto LABEL_70;
    }
    if (!string)
    {
      int v26 = [(id)qword_1000AC7B0 descriptionForMessage:v4];
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
        sub_10005CF9C();
      }

      goto LABEL_69;
    }
    int v8 = xpc_dictionary_get_string(v4, "TCCD_MSG_ID");
    xpc_connection_get_audit_token();
    unsigned int v9 = qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      loga = v9;
      uid_t v10 = geteuid();
      memset(atoken, 0, 32);
      v11 = v4;
      unsigned __int8 v12 = v2;
      xpc_object_t v13 = reply;
      uint64_t v14 = v6;
      uint64_t v15 = string;
      uint64_t v16 = v3;
      unsigned int v17 = v8;
      pid_t v18 = audit_token_to_pid((audit_token_t *)atoken);
      memset(atoken, 0, 32);
      uid_t v19 = audit_token_to_euid((audit_token_t *)atoken);
      memset(atoken, 0, 32);
      uid_t v20 = audit_token_to_auid((audit_token_t *)atoken);
      *(_DWORD *)audit_token_t atoken = 67110402;
      *(_DWORD *)&atoken[4] = v10;
      *(_WORD *)&atoken[8] = 1024;
      *(_DWORD *)&atoken[10] = v18;
      int v8 = v17;
      id v3 = v16;
      string = v15;
      uint64_t v6 = v14;
      xpc_object_t reply = v13;
      v2 = v12;
      id v4 = v11;
      *(_WORD *)&atoken[14] = 1024;
      *(_DWORD *)&atoken[16] = v19;
      *(_WORD *)&atoken[20] = 1024;
      *(_DWORD *)&atoken[22] = v20;
      *(_WORD *)&atoken[26] = 2082;
      *(void *)&atoken[28] = string;
      __int16 v58 = 2082;
      v59 = v8;
      _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "REQUEST: tccd_uid=%d, sender_pid=%d, sender_uid=%d, sender_auid=%d, function=%{public}s, msgID=%{public}s", atoken, 0x2Eu);

      unsigned int v9 = qword_1000AC518;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [(id)qword_1000AC7B0 descriptionForMessage:v4];
      v22 = qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)audit_token_t atoken = 136446466;
        *(void *)&atoken[4] = v8;
        *(_WORD *)&atoken[12] = 2114;
        *(void *)&atoken[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "REQUEST_MSG: msgID=%{public}s, msg=%{public}@", atoken, 0x16u);
      }
    }
    if (strcmp(string, "TCCAccessRequest"))
    {
      if (!strcmp(string, "TCCAccessCopyInformation"))
      {
        handle_TCCAccessCopyInformation(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessCopyInformationForBundle"))
      {
        handle_TCCAccessCopyInformationForBundle(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessCopyInformationForServices"))
      {
        handle_TCCAccessCopyInformationForServices(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessCopyBundleIdentifiersForService"))
      {
        handle_TCCAccessCopyBundleIdentifiersForService(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessCopyBundleIdentifiersDisabledForService"))
      {
        handle_TCCAccessCopyBundleIdentifiersDisabledForService(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessSetInternal"))
      {
        sub_100022554(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessSetOverride"))
      {
        sub_100025874(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessGetOverride"))
      {
        sub_10000E654((uint64_t)v4, reply);
      }
      else if (!strcmp(string, "TCCAccessGetOverrides"))
      {
        sub_100025B7C(reply);
      }
      else if (!strcmp(string, "TCCAccessResetInternal"))
      {
        handle_TCCAccessResetInternal(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessDeclarePolicy"))
      {
        sub_100025C8C(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessSelectPolicyForExtensionWithIdentifier"))
      {
        sub_100025F20(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessResetPoliciesExcept"))
      {
        sub_1000261EC(v4, reply);
      }
      else if (!strcmp(string, "TCCExpirationCopyInformationForService"))
      {
        sub_100026428(v4, reply);
      }
      else if (!strcmp(string, "TCCExpirationReset"))
      {
        sub_1000266F0(v4, reply);
      }
      else if (!strcmp(string, "TCCServiceCopyDescriptions"))
      {
        sub_100026B28(v4, reply);
      }
      else if (!strcmp(string, "TCCTestInternal"))
      {
        sub_100026DA8(v4, reply);
      }
      else if (!strcmp(string, "TCCGetIdentityForCredential"))
      {
        sub_100027C7C(v4, reply);
      }
      else if (!strcmp(string, "TCCReportUse"))
      {
        sub_100028038(v4, reply);
      }
      else if (!strcmp(string, "TCCAccessSetWithPrompt"))
      {
        sub_1000285F4(v4, reply);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR))
      {
        sub_10005D06C();
      }
      goto LABEL_63;
    }
    v54 = v8;
    os_log_t log = reply;
    id v27 = v4;
    v28 = [TCCDRequestContext alloc];
    *(void *)audit_token_t atoken = 0;
    v29 = [(TCCDRequestContext *)v28 initWithRequestMessage:v27 forServer:qword_1000AC7B0 error:atoken];

    id v30 = *(id *)atoken;
    id v31 = v30;
    if (!v29)
    {
      if (!v30) {
        id v31 = +[TCCDServer newErrorWithCode:6 format:@"Failed to create Request Context."];
      }
      os_log_t v35 = log;
      +[TCCDRequestResult populateReplyMessageToDeny:log withError:v31];
      goto LABEL_62;
    }
    id v53 = sub_10000DAD4(v29, 0);
    if (!v53)
    {
      id v36 = +[TCCDServer newErrorWithCode:5 format:@"Failed to create a Result from do_TCCAccessRequest()."];

      os_log_t v35 = log;
      +[TCCDRequestResult populateReplyMessageToDeny:log withError:v36];
      id v31 = v36;
LABEL_61:

LABEL_62:
      int v8 = v54;
LABEL_63:
      v41 = qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
      {
        id v42 = [(id)qword_1000AC7B0 descriptionForMessage:reply];
        id v43 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)audit_token_t atoken = 138543362;
          *(void *)&atoken[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "REPLY_MSG: msg=%{public}@", atoken, 0xCu);
        }

        v41 = qword_1000AC518;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v41;
        uid_t v45 = geteuid();
        *(_DWORD *)audit_token_t atoken = 67109634;
        *(_DWORD *)&atoken[4] = v45;
        *(_WORD *)&atoken[8] = 2082;
        *(void *)&atoken[10] = string;
        *(_WORD *)&atoken[18] = 2082;
        *(void *)&atoken[20] = v8;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "REPLY: (%d) function=%{public}s, msgID=%{public}s", atoken, 0x1Cu);
      }
LABEL_69:
      xpc_connection_send_message(v6, reply);
LABEL_70:

      goto LABEL_71;
    }
    uint64_t v32 = [(TCCDRequestContext *)v29 attributionChain];
    if (!v32)
    {
LABEL_60:
      os_log_t v35 = log;
      [v53 populateReplyMessage:log];
      goto LABEL_61;
    }
    id v33 = (id)v32;
    id v34 = [(TCCDRequestContext *)v29 attributionChain];
    if (([v34 accessingProcessSpecified] & 1) == 0)
    {
      id v51 = [v53 authorizationValue];

      if (v51 != (id)2) {
        goto LABEL_60;
      }
      id v33 = [(TCCDRequestContext *)v29 service];
      v37 = log;
      if ([v33 shouldIssueSandboxExtension])
      {
        xpc_object_t xdict = v37;
        v48 = [v33 name];
        [@"com.apple.tcc." stringByAppendingString:v48];
        v52 = v33;
        id v38 = objc_claimAutoreleasedReturnValue();
        id v39 = [v38 UTF8String];

        if (v39)
        {
          id v34 = v52;
          if (objc_msgSend(v52, "ios_useGenericSandboxExtension")) {
            uint64_t v40 = (const char *)sandbox_extension_issue_generic();
          }
          else {
            uint64_t v40 = (const char *)sandbox_extension_issue_file();
          }
          v46 = (char *)v40;
          if (v40)
          {
            xpc_object_t v47 = xpc_string_create(v40);
            if (v47)
            {
              v49 = v47;
              xpc_dictionary_set_value(xdict, "extension", v47);
              free(v46);

              id v33 = v52;
              goto LABEL_46;
            }
            free(v46);
          }
          else if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR))
          {
            sub_10005D004();
          }
        }

        id v33 = [(TCCDRequestContext *)v29 service];
        id v34 = [(TCCDRequestContext *)v29 identityDescription];
        [v53 denyAuthorizationWithErrorCode:6, @"Failed to issue Sandbox Extension for %@ from %@", v33, v34 format];
        goto LABEL_46;
      }

      id v34 = v33;
    }
LABEL_46:

    goto LABEL_60;
  }
  if (v2 != (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    v23 = (void *)qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
      sub_10005CE8C(v23, v2);
    }
  }
LABEL_71:
}

uint64_t db_eval(uint64_t a1, void *a2, void *a3)
{
  return sub_10000D29C(a1, a2, a3, 0);
}

uint64_t sub_10000D29C(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  if (!a1) {
    __assert_rtn("_db_eval", "TCCDDatabase.m", 605, "sql != NULL");
  }
  unsigned int v9 = v8;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100003B14;
  v16[3] = &unk_100095D58;
  uid_t v19 = &v22;
  uint64_t v20 = a1;
  int v21 = 0;
  id v10 = v7;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  unsigned __int8 v12 = objc_retainBlock(v16);
  xpc_object_t v13 = v12;
  if (a4) {
    ((void (*)(void *))v12[2])(v12);
  }
  else {
    dispatch_sync((dispatch_queue_t)qword_1000AC5F8, v12);
  }
  uint64_t v14 = *((unsigned int *)v23 + 6);

  _Block_object_dispose(&v22, 8);
  return v14;
}

void sub_10000D3F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id accessingProcessHasAllowOrRegionalPromptEntitlement(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (objc_msgSend(v5, "ios_allowRegionalPrompt"))
  {
    if (a3)
    {
      id v7 = [@"com.apple.private.tcc.allow-or-regional-prompt" stringByAppendingString:@".overridable"];
    }
    else
    {
      id v7 = @"com.apple.private.tcc.allow-or-regional-prompt";
    }
    unsigned int v9 = [v6 accessingProcess];
    id v8 = [v9 hasEntitlement:v7 containsService:v5 options:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id sub_10000DAD4(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = 0;
  do
  {
    id v5 = v4;
    objc_msgSend(v3, "setQueryCount:", (char *)objc_msgSend(v3, "queryCount") + 1);
    id v4 = sub_100006D88(v3);

    if (!v4)
    {
      id v27 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
        sub_10005C558(v27);
      }
      goto LABEL_25;
    }
  }
  while ([v4 databaseAction] == (id)2);
  id v7 = [v4 error];

  if (!v7
    && [v4 databaseAction] == (id)1
    && ([(id)qword_1000AC7B0 updateAuthorizationRecordFromContext:v3 forResult:v4 syncedUpdate:a2] & 1) == 0)
  {
    id v8 = [v3 service];
    unsigned int v9 = [v3 identityDescription];
    [v4 denyAuthorizationWithErrorCode:4, @"Failed to update database %@ from %@", v8, v9 format];
  }
  id v10 = (void *)qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    unsigned __int8 v12 = [v3 messageIdentifier];
    id v13 = [v4 authorizationValue];
    id v14 = [v4 authorizationReason];
    uint64_t v15 = a2;
    id v16 = [v4 authorizationVersion];
    id v17 = [v3 desiredAuth];
    id v18 = [v4 error];
    *(_DWORD *)buf = 138544642;
    id v34 = v12;
    __int16 v35 = 2048;
    id v36 = v13;
    __int16 v37 = 2048;
    id v38 = v14;
    __int16 v39 = 2048;
    id v40 = v16;
    a2 = v15;
    __int16 v41 = 2048;
    id v42 = v17;
    __int16 v43 = 2114;
    v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AUTHREQ_RESULT: msgID=%{public}@, authValue=%llu, authReason=%llu, authVersion=%llu, desired_auth=%llu, error=%{public}@,", buf, 0x3Eu);
  }
  uid_t v19 = [v3 service];
  if (![v19 usesTwoStagePrompting]
    || [v4 authorizationValue] != (id)6
    || [v3 desiredAuth] != (id)6)
  {

LABEL_20:
    if ([v4 authorizationValue] == (id)6)
    {
      v28 = [v3 service];
      v29 = [v28 name];
      unsigned int v30 = [v29 isEqualToString:@"kTCCServiceAddressBook"];

      if (v30) {
        [v4 setReplyNoCacheAuthorization:1];
      }
    }
    if ([v4 authorizationValue] == (id)6)
    {
      [v4 setAuthorizationValue:1];
      [v4 setAuthorizationReason:5];
    }
LABEL_25:
    id v26 = v4;
    goto LABEL_26;
  }
  unsigned __int8 v20 = [v3 isPreflight];

  if (v20) {
    goto LABEL_20;
  }
  int v21 = (void *)qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    v23 = [v3 messageIdentifier];
    uint64_t v24 = [v3 service];
    int v25 = [v24 name];
    *(_DWORD *)buf = 138543618;
    id v34 = v23;
    __int16 v35 = 2114;
    id v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AUTHREQ_RESULT: msgID=%{public}@, service=%{public}@, user wants to learn more, redoing prompt with secondary stage", buf, 0x16u);
  }
  [v3 setDesiredAuth:2];
  id v26 = (id)sub_10000DAD4(v3, a2);
LABEL_26:
  id v31 = v26;

  return v31;
}

void sub_10000E414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void handle_TCCAccessCopyInformationForBundle(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessCopyInformationForBundle_with_attribution_chain(v4, v3, v5);
}

void sub_10000E654(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = 0;
  id v4 = [(id)qword_1000AC7B0 serviceFromMessage:a1 error:&v13];
  id v5 = v13;
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003D0C;
    v11[3] = &unk_1000950A8;
    id v12 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000293BC;
    v9[3] = &unk_1000950A8;
    id v6 = v3;
    id v10 = v6;
    if (!db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", v11, v9)) {
      xpc_dictionary_set_BOOL(v6, "result", 1);
    }

    id v7 = v12;
  }
  else
  {
    id v7 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v7 forError:v5 contextString:0];
    id v8 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10005D390();
    }
  }
}

uint64_t sub_10000E800(void *a1)
{
  uint64_t v1 = [a1 disallowedOnPlatformSubtypeNameList];
  unsigned int v2 = [v1 containsObject:@"iphoneos-ephemeral-user"];

  if (!v2) {
    return 0;
  }
  if (qword_1000AC538 != -1) {
    dispatch_once(&qword_1000AC538, &stru_1000957C8);
  }
  return dword_1000AC530;
}

id sub_10000E878(void *a1)
{
  uint64_t v1 = [a1 service];
  id v2 = [v1 isAccessAllowedByDefault];

  return v2;
}

void handle_TCCAccessCopyInformation(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessCopyInformation_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyInformation_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  xpc_object_t xdict = a2;
  id v6 = a3;
  id v7 = [v6 requestingProcess];
  id v8 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "function")];
  unsigned int v9 = +[TCCDPlatform currentPlatform];
  id v10 = [v9 server];
  id v52 = 0;
  id v11 = [v10 serviceFromMessage:v5 error:&v52];
  id v36 = v52;

  if (v11)
  {
    id v12 = [v9 server];
    unsigned int v13 = [v12 canProcess:v7 callFunction:v8 forService:v11 withAccessIdentity:0];

    if (v13)
    {
      id v14 = xpc_dictionary_get_value(v5, "TCCD_MSG_SPI_VERSION");

      if (v14) {
        uint64_t uint64 = xpc_dictionary_get_uint64(v5, "TCCD_MSG_SPI_VERSION");
      }
      else {
        uint64_t uint64 = 1;
      }
      uint64_t v46 = 0;
      xpc_object_t v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_10000F914;
      BOOL v50 = sub_10000F89C;
      id v51 = xpc_array_create(0, 0);
      if (!v47[5])
      {
LABEL_24:
        _Block_object_dispose(&v46, 8);

        goto LABEL_25;
      }
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10004B184;
      v41[3] = &unk_100096550;
      id v20 = v11;
      id v42 = v20;
      id v43 = 0;
      v44 = &v46;
      uint64_t v45 = uint64;
      id v34 = objc_retainBlock(v41);
      int v21 = [v20 name];
      if ([v21 isEqualToString:@"kTCCServiceSystemPolicyAllFiles"])
      {
        uint64_t v22 = [v9 server];
        unsigned int v23 = [v22 canProcess:v7 manageESClientServiceWith:v8];

        if (v23)
        {
          uint64_t v24 = v40;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10004B668;
          v40[3] = &unk_1000950A8;
          v40[4] = v20;
          int v25 = db_eval((uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_modified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_identity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ? OR service = ?", v40, v34);
LABEL_15:
          int v26 = v25;

          if (!v26)
          {
            if ([v8 isEqualToString:@"TCCAccessCopyInformationForServices"])
            {
              id v27 = [v20 name];
              v28 = (const char *)[v27 UTF8String];
              xpc_dictionary_set_value(xdict, v28, (xpc_object_t)v47[5]);
            }
            else
            {
              v29 = tcc_access_log();
              BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);

              if (v30)
              {
                id v31 = tcc_access_log();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  size_t count = xpc_array_get_count((xpc_object_t)v47[5]);
                  sub_10004CBB4(buf, count, v31);
                }

                id v33 = (void *)v47[5];
                applier[0] = _NSConcreteStackBlock;
                applier[1] = 3221225472;
                applier[2] = sub_10004B710;
                applier[3] = &unk_100096578;
                id v38 = v9;
                xpc_array_apply(v33, applier);
              }
              xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v47[5]);
            }
          }

          goto LABEL_24;
        }
      }
      else
      {
      }
      uint64_t v24 = v39;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10000F69C;
      v39[3] = &unk_1000950A8;
      v39[4] = v20;
      int v25 = db_eval((uint64_t)"SELECT client, client_type, auth_value, csreq, last_modified, strftime('%s','now') - last_modified AS age, indirect_object_identifier, indirect_object_identifier_type, indirect_object_code_identity, auth_reason, auth_version, flags, pid, pid_version, boot_uuid FROM access WHERE service = ?", v39, v34);
      goto LABEL_15;
    }
  }
  else
  {
    id v16 = objc_opt_new();
    id v17 = [v9 server];
    [v17 buildErrorString:v16 forError:v36 contextString:0];

    id v18 = [v9 server];
    uid_t v19 = [v18 logHandle];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10004CB40();
    }
  }
LABEL_25:
}

void sub_10000F620(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

id tcc_access_log()
{
  if (qword_1000AC568 != -1) {
    dispatch_once(&qword_1000AC568, &stru_100095B18);
  }
  v0 = (void *)qword_1000AC560;
  return v0;
}

void sub_10000F69C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_10000F71C(uint64_t a1, sqlite3_stmt *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationValue:", sqlite3_column_int64(a2, 0));
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationReason:", sqlite3_column_int64(a2, 1));
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationVersion:", sqlite3_column_int64(a2, 5));
  objc_msgSend(*(id *)(a1 + 32), "setDatabaseFlags:", sqlite3_column_int(a2, 4));
  uint64_t v4 = qword_1000AC7B0;
  uint64_t v5 = sqlite3_column_int(a2, 3);
  id v6 = [*(id *)(a1 + 32) authorizationValue];
  id v7 = [*(id *)(a1 + 40) service];
  LOBYTE(v4) = [(id)v4 isAccessEntryWithAge:v5 authorizationValue:v6 expiredForService:v7];

  if ((v4 & 1) == 0)
  {
    uint64_t v8 = sqlite3_column_int(a2, 9);
    unsigned int v9 = *(void **)(a1 + 32);
    [v9 setLastReminderTime:v8];
  }
}

void sub_10000F864(uint64_t a1)
{
}

void sub_10000F86C(uint64_t a1)
{
}

void sub_10000F874(uint64_t a1)
{
}

void sub_10000F87C(uint64_t a1)
{
}

void sub_10000F884(uint64_t a1)
{
}

void sub_10000F88C(uint64_t a1)
{
}

void sub_10000F894(uint64_t a1)
{
}

void sub_10000F89C(uint64_t a1)
{
}

uint64_t sub_10000F8A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F8B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F8C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F8D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F8E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F8F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F904(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_10000F914(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

const char *TCCAuthGetReasonDescription(uint64_t a1)
{
  if (!v2 & v1)
  {
    switch(a1)
    {
      case 1000:
        result = "Error";
        break;
      case 1001:
        result = "Service Override";
        break;
      case 1002:
        result = "Missing Usage String";
        break;
      case 1003:
        result = "Prompt Timeout";
        break;
      case 1004:
        result = "Preflight Unknown";
        break;
      default:
        if (a1 == 2000) {
          result = "Entitled";
        }
        else {
          result = "<Unknown Reason>";
        }
        break;
    }
  }
  else
  {
    result = "None";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "Recorded";
        break;
      case 2:
        result = "Service Default";
        break;
      case 3:
        result = "Service Policy";
        break;
      case 4:
        result = "Compatibility Policy";
        break;
      case 5:
        result = "Override Policy";
        break;
      case 6:
        result = "Set";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

char *TCCAuthCopyDescription(uint64_t a1)
{
  char v2 = 0;
  if ((a1 & 0x100000000000000) != 0)
  {
    if ((a1 & 0x200000000000000) != 0)
    {
      asprintf(&v2, "Auth:{Access:Unknown}");
    }
    else
    {
      TCCAuthGetReasonDescription(WORD2(a1));
      asprintf(&v2, "{Access:%s, reason:%s}");
    }
  }
  else
  {
    asprintf(&v2, "Auth:{Invalid}");
  }
  return v2;
}

void sub_10000FB54(id a1)
{
  qword_1000AC418 = [[TCCDMainSyncController alloc] initWithAsyncSyncEngineInitialization];
  _objc_release_x1();
}

void sub_10000FBE8(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  qword_1000AC428 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
  _objc_release_x1();
}

void sub_100010014(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 objectForKeyedSubscript:@"companionAppBundleId"];
  id v10 = *(void **)(a1 + 32);
  unsigned int v9 = (void **)(a1 + 32);
  id v11 = [v10 perDeviceMainIdentiferToReplicaIdentifier];
  [v11 setObject:v7 forKeyedSubscript:v8];

  id v12 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100057B70((uint64_t)v8, v9, v12);
  }
  *a4 = 0;
}

void sub_100010F5C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 objectForKeyedSubscript:@"companionAppBundleId"];
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000580B8();
  }
  unsigned int v9 = [*(id *)(a1 + 32) perDeviceReplicaIdentiferToWatchAppInfo];
  [v9 removeObjectForKey:v7];

  id v10 = [*(id *)(a1 + 32) perDeviceMainIdentiferToReplicaIdentifier];
  [v10 removeObjectForKey:v8];

  *a4 = 0;
}

void sub_100011028(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [a1[4] perDeviceReplicaIdentiferToWatchAppInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  unsigned int v9 = [v8 objectForKeyedSubscript:@"companionAppBundleId"];

  id v10 = [(TCCDSyncClientAccessAction *)[TCCDSyncUpdateAccessAction alloc] initWithServiceIdentifier:@"kTCCServiceAll" mainClientIdentifier:v9 replicaClientIdentifier:v6 clientType:0];
  [(TCCDSyncUpdateAccessAction *)v10 setUpdateAccessActionStatus:1];
  [(TCCDSyncAccessAction *)v10 setSyncChangeType:3];
  [a1[5] addObject:v10];
  [a1[6] addObject:v6];
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100058120();
  }
  *a4 = 0;
}

void sub_100011538(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100011550(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = off_1000ABE20();
    uint64_t v8 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_1000581F0(v8, v6);
    }
    unsigned int v9 = [v6 domain];
    if ([v9 isEqualToString:NSCocoaErrorDomain])
    {
      id v10 = [v6 code];

      if (v10 == (id)4099)
      {
        dispatch_time_t v11 = dispatch_time(0, 5000000000);
        id v12 = [*(id *)(a1 + 32) syncControllerQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100011928;
        block[3] = &unk_100094E50;
        block[4] = *(void *)(a1 + 32);
        id v32 = *(id *)(a1 + 48);
        int v33 = *(_DWORD *)(a1 + 64);
        dispatch_after(v11, v12, block);

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
    }
    unsigned int v13 = [v6 domain];
    if ([v13 isEqualToString:v7])
    {
      id v14 = [v6 code];

      if (v14 == (id)43)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_100058188();
        }
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = 1;
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v17 = [v6 domain];
    if ([v17 isEqualToString:v7])
    {
      id v18 = [v6 code];

      if (v18 == (id)44)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = 0;
LABEL_19:
        [v15 setWaitingForACXResync:v16];
        goto LABEL_25;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) setWaitingForACXResync:0];
    uid_t v19 = [*(id *)(a1 + 32) syncCoordinator];
    id v20 = [v19 activeSyncSession];

    if (v20)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_1000581BC();
      }
      int v21 = [*(id *)(a1 + 32) syncControllerQueue];
      uint64_t v22 = *(void **)(a1 + 32);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000119A0;
      v30[3] = &unk_100094E78;
      v30[4] = v22;
      sub_100019A24(v21, v22, v30);
    }
    goto LABEL_25;
  }
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    [*(id *)(a1 + 32) setWaitingForACXResync:0];
    uint64_t v24 = [*(id *)(a1 + 32) syncControllerQueue];
    int v25 = *(void **)(a1 + 32);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000119B0;
    v26[3] = &unk_100094EA0;
    v26[4] = v25;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 48);
    int v29 = *(_DWORD *)(a1 + 64);
    sub_100019AAC(v24, v25, v26);
  }
LABEL_26:

  return v6 == 0;
}

id sub_100011928(uint64_t a1)
{
  uint64_t v2 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "retrying fetch of installed WatchKit apps after delay.", v4, 2u);
  }
  return [*(id *)(a1 + 32) _getInstalledWatchKitAppsWithContinuation:*(void *)(a1 + 40) pairingType:*(unsigned int *)(a1 + 48)];
}

id sub_1000119A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncSessionDidFinishWithResult:8 error:0];
}

id sub_1000119B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gotInstalledWatchKitApps:*(void *)(a1 + 40) continuation:*(void *)(a1 + 48) pairingType:*(unsigned int *)(a1 + 56)];
}

uint64_t sub_1000119C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) setWaitingForACXResync:0];
    id v7 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_1000582C0(v7, v6);
    }
    uint64_t v8 = [*(id *)(a1 + 32) syncCoordinator];
    unsigned int v9 = [v8 activeSyncSession];

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005828C();
      }
      id v10 = [*(id *)(a1 + 32) syncControllerQueue];
      dispatch_time_t v11 = *(void **)(a1 + 32);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100011BCC;
      v19[3] = &unk_100094E78;
      v19[4] = v11;
      sub_100019A24(v10, v11, v19);
    }
  }
  else if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    [*(id *)(a1 + 32) setWaitingForACXResync:0];
    id v12 = [*(id *)(a1 + 32) syncControllerQueue];
    unsigned int v13 = *(void **)(a1 + 32);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011BDC;
    v15[3] = &unk_100094EA0;
    void v15[4] = v13;
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    int v18 = *(_DWORD *)(a1 + 56);
    sub_100019AAC(v12, v13, v15);
  }
  return 1;
}

id sub_100011BCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncSessionDidFinishWithResult:8 error:0];
}

id sub_100011BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gotInstalledWatchKitApps:*(void *)(a1 + 40) continuation:*(void *)(a1 + 48) pairingType:*(unsigned int *)(a1 + 56)];
}

void sub_100011D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011D94(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAccessRequestMessageFromReplica:v3];
}

void sub_100011EDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100011EF8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    }
    [WeakRetained setPendingPostPairingContinuation:0];
  }
}

void sub_100012D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012D44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) perDeviceMainIdentiferToReplicaIdentifier];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && [*(id *)(a1 + 40) isEqualToString:@"kTCCClientAll"])
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_storeStrong(v7, v6);
  }
}

void sub_100012F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012F5C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) perDeviceReplicaIdentiferToWatchAppInfo];
  id v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = [v6 objectForKeyedSubscript:@"companionAppBundleId"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && [*(id *)(a1 + 40) isEqualToString:@"kTCCClientAll"])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

void sub_1000130F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) perDeviceReplicaIdentiferToWatchAppInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"companionAppBundleId"];
    if (v4)
    {
      id v5 = (void *)v4;
      uint64_t v6 = *(void *)(a1 + 48);
LABEL_9:
      if (([v5 isEqualToString:v6] & 1) == 0)
      {
        uint64_t v15 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          uint64_t v16 = *(void *)(a1 + 48);
          int v18 = 138543874;
          uint64_t v19 = v16;
          __int16 v20 = 2114;
          uint64_t v21 = v17;
          __int16 v22 = 2114;
          unsigned int v23 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "registerMainClientIdentifier %{public}@ for replicaClientIdentifier: %{public}@: found existing: %{public}@", (uint8_t *)&v18, 0x20u);
        }
      }
      goto LABEL_12;
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (!v7)
  {
    uint64_t v6 = 0;
    id v5 = 0;
    goto LABEL_9;
  }
  CFStringRef v24 = @"companionAppBundleId";
  uint64_t v25 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  unsigned int v9 = [*(id *)(a1 + 32) perDeviceReplicaIdentiferToWatchAppInfo];
  [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v10 = *(void *)(a1 + 40);
  dispatch_time_t v11 = [*(id *)(a1 + 32) perDeviceMainIdentiferToReplicaIdentifier];
  [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];

  id v12 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    int v18 = 138543618;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registering newMainClientIdentifier %{public}@ for replicaClientIdentifier: %{public}@.", (uint8_t *)&v18, 0x16u);
  }
  [*(id *)(a1 + 32) _writeSavedWatchKitAppInfo];

  id v5 = 0;
LABEL_12:
}

void sub_1000135B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairedDevice];

  if (!v2)
  {
    id v5 = +[NSString stringWithFormat:@"PairedSync beginSyncSession but the device is not paired!"];
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100058A7C();
    }
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = v5;
    uint64_t v6 = &v17;
    uint64_t v7 = &v16;
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 32) hostDeviceUnlocked])
  {
    uint64_t v3 = [*(id *)(a1 + 32) syncService];
    uint64_t v4 = [v3 currentSession];

    if (v4)
    {
      id v5 = +[NSString stringWithFormat:@"PairedSync beginSyncSession there is an active SYService session!"];
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_100058A7C();
      }
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      uint64_t v15 = v5;
      uint64_t v6 = &v15;
      uint64_t v7 = &v14;
LABEL_10:
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v7 count:1];
      unsigned int v9 = [*(id *)(a1 + 40) activeSyncSession];
      uint64_t v10 = +[NSError errorWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:999 userInfo:v8];
      [v9 syncDidFailWithError:v10];

      return;
    }
    id v12 = *(void **)(a1 + 32);
    [v12 _handlePairingSession];
  }
  else
  {
    dispatch_time_t v11 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PairedSync syncCoordinator:beginSyncSession: but the host device is locked; wait until unlock",
        (uint8_t *)&v13,
        2u);
    }
  }
}

uint64_t sub_1000139DC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 beginBatchingDeltaChanges];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013A98;
  v6[3] = &unk_100095008;
  v6[4] = *(void *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:v6];

  [*(id *)(a1 + 32) endBatchingDeltaChanges];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_100013A98(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = [*(id *)(a1 + 32) _addDeltaSyncChange:a2];
  *a4 = 0;
  return result;
}

id sub_100013AC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getInstalledWatchKitAppsWithContinuation:*(void *)(a1 + 40) pairingType:0];
}

void sub_100014170(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v5);
        uint64_t v7 = [TCCDSyncUpdateAccessAction alloc];
        uint64_t v8 = [(TCCDSyncClientAccessAction *)v7 initWithServiceIdentifier:@"kTCCServiceAll", v6, v6, 0, (void)v9 mainClientIdentifier replicaClientIdentifier clientType];
        sub_10002156C(v8);

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

void sub_1000144F4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 pendingPostPairingContinuation];
  [v1 _getInstalledWatchKitAppsWithContinuation:v2 pairingType:3];
}

id sub_100014550(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendSyncSessionDidFinishWithResult:8 error:0];
}

id sub_1000147C8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = [*(id *)(a1 + 32) appendFormat:@"    %@ -> %@\n", a2, a3];
  *a4 = 0;
  return result;
}

void sub_100014894(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100058D64();
  }
  if ([*(id *)(a1 + 32) isSyncingEnabled])
  {
    [*(id *)(a1 + 32) _initiateResetSync];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100058D30();
  }
}

Class sub_100014ABC()
{
  if (!qword_1000AC458) {
    qword_1000AC458 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PairedSync.framework/PairedSync", 2);
  }
  Class result = objc_getClass("PSYSyncCoordinator");
  qword_1000AC450 = (uint64_t)result;
  off_1000ABE10 = (uint64_t (*)())sub_100014B20;
  return result;
}

id sub_100014B20()
{
  return (id)qword_1000AC450;
}

Class sub_100014B2C()
{
  if (!qword_1000AC468) {
    qword_1000AC468 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AppConduit.framework/AppConduit", 2);
  }
  Class result = objc_getClass("ACXDeviceConnection");
  qword_1000AC460 = (uint64_t)result;
  off_1000ABE18 = (uint64_t (*)())sub_100014B90;
  return result;
}

id sub_100014B90()
{
  return (id)qword_1000AC460;
}

id sub_100014B9C()
{
  v0 = (void *)qword_1000AC468;
  if (!qword_1000AC468)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/AppConduit.framework/AppConduit", 2);
    qword_1000AC468 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "ACXErrorDomain");
  objc_storeStrong((id *)&qword_1000AC448, *v1);
  off_1000ABE20 = (uint64_t (*)())sub_100014C20;
  id v2 = (void *)qword_1000AC448;
  return v2;
}

id sub_100014C20()
{
  return (id)qword_1000AC448;
}

id sub_100014C2C()
{
  v0 = (void *)qword_1000AC470;
  if (!qword_1000AC470)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
    qword_1000AC470 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "NRDevicePropertyName");
  objc_storeStrong((id *)&qword_1000AC438, *v1);
  off_1000ABF58 = (uint64_t (*)())sub_100014CB0;
  id v2 = (void *)qword_1000AC438;
  return v2;
}

id sub_100014CB0()
{
  return (id)qword_1000AC438;
}

uint64_t sub_100014CBC(uint64_t a1)
{
  id v2 = (void *)qword_1000AC458;
  if (!qword_1000AC458)
  {
    id v2 = dlopen("/System/Library/PrivateFrameworks/PairedSync.framework/PairedSync", 2);
    qword_1000AC458 = (uint64_t)v2;
  }
  id v3 = (uint64_t (*)())dlsym(v2, "NSStringfromPSYSyncSessionType");
  off_1000ABF60 = v3;
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t sub_100014D28(void *a1)
{
  id v1 = a1;
  id v2 = (void *)qword_1000AC470;
  if (!qword_1000AC470)
  {
    id v2 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
    qword_1000AC470 = (uint64_t)v2;
  }
  off_1000ABF50 = (uint64_t (*)())dlsym(v2, "NRWatchOSVersionForRemoteDevice");
  uint64_t v3 = ((uint64_t (*)(id))off_1000ABF50)(v1);

  return v3;
}

void sub_100014D98(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  uint64_t v3 = [(TCCDSyncAccessAction *)[TCCDSyncOverrideAccessAction alloc] initWithServiceIdentifier:v4];
  [*(id *)(a1 + 32) addObject:v3];
}

id sub_100014E24()
{
  v0 = (void *)qword_1000AC470;
  if (!qword_1000AC470)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
    qword_1000AC470 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "NRDevicePropertyPairingID");
  objc_storeStrong((id *)&qword_1000AC440, *v1);
  off_1000ABE28 = (uint64_t (*)())sub_100014EA8;
  id v2 = (void *)qword_1000AC440;
  return v2;
}

id sub_100014EA8()
{
  return (id)qword_1000AC440;
}

void sub_100014ECC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100014EEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100014F14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100014F50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100014F80(uint64_t a1, void *a2)
{
  return a2;
}

void sub_100014F9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_100014FE4()
{
  return v0;
}

void sub_100014FF0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100015010(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

void sub_100016B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100016B68(uint64_t a1)
{
  if (![*(id *)(a1 + 32) registryDBHandle])
  {
    id result = [*(id *)(a1 + 32) setupDB];
    if (result) {
      goto LABEL_6;
    }
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2((sqlite3 *)[*(id *)(a1 + 32) registryDBHandle], *(const char **)(a1 + 64), -1, &ppStmt, 0))
  {
LABEL_7:
    id result = [*(id *)(a1 + 32) handleDBErrorAndForceCrash:0];
LABEL_6:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    return result;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    goto LABEL_8;
  }
  while (1)
  {
    int v4 = sqlite3_step(ppStmt);
    if (v4 != 100) {
      break;
    }
    uint64_t v2 = *(void *)(a1 + 48);
LABEL_8:
    (*(void (**)(uint64_t, sqlite3_stmt *))(v2 + 16))(v2, ppStmt);
  }
  int v5 = v4;
  if (v4 != 101)
  {
    uint64_t v6 = sqlite3_expanded_sql(ppStmt);
    uint64_t v7 = +[TCCDPlatform currentPlatform];
    uint64_t v8 = [v7 server];
    uint64_t v9 = [v8 logHandle];

    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v10) {
        sub_100058FB0((uint64_t)v6, v5, v9);
      }

      sqlite3_free(v6);
      [*(id *)(a1 + 32) handleDBErrorAndForceCrash:0];
    }
    else
    {
      if (v10) {
        sub_100058F34((uint64_t *)(a1 + 64), v9);
      }
    }
    sqlite3_finalize(ppStmt);
    goto LABEL_7;
  }
  return (id)sqlite3_finalize(ppStmt);
}

uint64_t sub_1000171D8(uint64_t result, sqlite3_stmt *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    if (sqlite3_bind_text(a2, 1, *(const char **)(result + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
      || sqlite3_bind_double(a2, 2, *(double *)(v3 + 48))
      || sqlite3_bind_double(a2, 3, *(double *)(v3 + 48))
      || (id result = sqlite3_bind_int(a2, 4, 1), result))
    {
      int v4 = *(void **)(v3 + 32);
      return (uint64_t)[v4 handleDBErrorAndForceCrash:1];
    }
  }
  return result;
}

void sub_1000173F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001740C(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = sqlite3_column_text(a2, 0);
  BOOL v5 = sqlite3_column_int(a2, 3) != 0;
  double v6 = sqlite3_column_double(a2, 1);
  +[NSString stringWithFormat:@"%s firstSeen = %f previouslySeen = %f known? %d", v4, *(void *)&v6, sqlite3_column_double(a2, 2), v5];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:v13];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByAppendingString:@"\n"];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

uint64_t sub_100017680(uint64_t result, sqlite3_stmt *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id result = sqlite3_bind_text(a2, 1, *(const char **)(result + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (result)
    {
      uint64_t v3 = *(void **)(v2 + 32);
      return (uint64_t)[v3 handleDBErrorAndForceCrash:1];
    }
  }
  return result;
}

void sub_1000176E4(uint64_t a1, sqlite3_stmt *a2)
{
  **(unsigned char **)(a1 + 32) = sqlite3_column_int(a2, 3) != 0;
  double v4 = sqlite3_column_double(a2, 1);
  double v5 = sqlite3_column_double(a2, 2);
  double v6 = +[TCCDPlatform currentPlatform];
  uint64_t v7 = [v6 server];
  uint64_t v8 = [v7 logHandle];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 136446722;
    uint64_t v11 = v9;
    __int16 v12 = 2050;
    double v13 = v4;
    __int16 v14 = 2050;
    double v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "found database %{public}s in registry -- first seen at %{public}f, last seen at %{public}f", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t sub_10001794C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) registryEntryFromStep:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  return _objc_release_x1();
}

uint64_t sub_100017D00(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

void sub_100017E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100017E34(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) evalDB:"BEGIN" locked:1 bind:0 step:0];
  if (result
    || (id result = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(), result)
    || (id result = [*(id *)(a1 + 32) evalDB:"END" locked:1 bind:0 step:0], result))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void sub_100017FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018008(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10001816C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018188(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id sub_100018284(uint64_t a1)
{
  uint64_t v2 = +[TCCDPlatform currentPlatform];
  uint64_t v3 = [v2 server];
  double v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100059394();
  }

  sqlite3_close((sqlite3 *)[*(id *)(a1 + 32) registryDBHandle]);
  return [*(id *)(a1 + 32) setRegistryDBHandle:0];
}

void sub_1000183EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100018408(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100018740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018758(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (unint64_t)[v3 updateAccessActionStatus];
  if (v4 <= 0xE)
  {
    if (((1 << v4) & 0x14C) != 0)
    {
      uint64_t v5 = 2;
LABEL_9:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
      goto LABEL_10;
    }
    if (((1 << v4) & 0x4002) != 0)
    {
LABEL_8:
      uint64_t v5 = 1;
      goto LABEL_9;
    }
    if (!v4)
    {
      double v6 = (void *)qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_FAULT)) {
        sub_10005953C(v6, v3);
      }
      goto LABEL_8;
    }
  }
LABEL_10:
  uint64_t v7 = [*(id *)(a1 + 32) syncController];
  [v7 removeAccessDidUpdateHandlerForSession:*(void *)(a1 + 32)];

  uint64_t v8 = [*(id *)(a1 + 32) sentMessageSemaphore];
  dispatch_semaphore_signal(v8);
}

void sub_10001883C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) syncController];
    [v3 removeAccessDidUpdateHandlerForSession:*(void *)(a1 + 32)];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    unint64_t v4 = [*(id *)(a1 + 32) sentMessageSemaphore];
    dispatch_semaphore_signal(v4);
  }
}

void sub_100018D20(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void sub_100018F08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) messageTypesToHandlers];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    v3[2](v3, *(void *)(a1 + 48));
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100059778();
  }
}

void sub_1000190BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (void *)v2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 48);
    }
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100059898();
  }
}

void sub_10001924C(id a1)
{
  qword_1000AC478 = objc_alloc_init(TCCDIdsMessageController);
  _objc_release_x1();
}

void sub_1000194D0(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    id v5 = objc_retainBlock(v2);
    [*(id *)(a1[4] + 8) setObject:v5 forKeyedSubscript:a1[5]];
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void **)(a1[4] + 8);
    [v4 removeObjectForKey:v3];
  }
}

void sub_100019554(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000195E4;
  block[3] = &unk_100094E78;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_1000195E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _makeReadyToReceiveMessages];
}

void sub_100019798(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000197C8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_1000197E8()
{
  if (qword_1000AC490 != -1) {
    dispatch_once(&qword_1000AC490, &stru_100095368);
  }
  return dword_1000AC498;
}

void sub_10001982C(id a1)
{
  if (db_eval((uint64_t)"SELECT value FROM admin WHERE key = 'sync_version'", 0, &stru_1000953A8))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100059ACC();
    }
    _db_error(0);
  }
}

void sub_10001989C(id a1, sqlite3_stmt *a2)
{
  dword_1000AC498 = sqlite3_column_int(a2, 0);
}

void sub_1000198C4(int a1)
{
  uint64_t v2 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_100059BCC(a1, v2);
  }
  if (dword_1000AC498 != a1)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000199C8;
    v3[3] = &unk_1000953C8;
    int v4 = a1;
    if (db_eval((uint64_t)"INSERT OR REPLACE INTO admin VALUES ('sync_version', ?)", v3, 0))
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_100059B4C();
      }
      _db_error(0);
    }
    else
    {
      dword_1000AC498 = a1;
    }
  }
}

void sub_1000199C8(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int64(a2, 1, *(int *)(a1 + 32)))
  {
    _db_error(1);
  }
}

void sub_100019A10(NSObject *a1, void *context)
{
}

void sub_100019A24(NSObject *a1, void *a2, void *a3)
{
  if (dispatch_get_specific(off_1000AC148) == a2)
  {
    id v5 = (void (*)(void *))a3[2];
    v5(a3);
  }
  else
  {
    dispatch_sync(a1, a3);
  }
}

void sub_100019AAC(NSObject *a1, void *a2, void *a3)
{
  if (dispatch_get_specific(off_1000AC148) == a2)
  {
    id v5 = (void (*)(void *))a3[2];
    v5(a3);
  }
  else
  {
    dispatch_async(a1, a3);
  }
}

CFStringRef sub_100019B34(unsigned int a1)
{
  if (a1 > 7) {
    return @"<Unknown>";
  }
  else {
    return (const __CFString *)*((void *)&off_100095588 + (int)a1);
  }
}

void sub_100019BAC(id a1)
{
  qword_1000AC4A0 = [[TCCDSyncController alloc] initWithAsyncSyncEngineInitialization];
  _objc_release_x1();
}

void sub_100019C40(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  qword_1000AC4B0 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  _objc_release_x1();
}

void sub_100019D94(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  qword_1000AC4C0 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, objc_opt_class(), 0);
  _objc_release_x1();
}

id sub_100019FE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSyncEngine];
}

void sub_10001A15C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

_DWORD *sub_10001A170(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _syncStatusDescriptionString];
    uint64_t v7 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:0];
    uint64_t v8 = malloc_type_malloc((size_t)[v7 length] + 200, 0x526890B3uLL);
    _DWORD *v8 = 1;
    v8[1] = [v7 length];
    objc_msgSend(v7, "getBytes:range:", v8 + 50, 0, objc_msgSend(v7, "length"));
    uint64_t v9 = objc_msgSend(v4, "_os_state_titleWithPrefix:withHints:", @"tccd Sync State", a2);
    int v10 = v9;
    if (v9)
    {
      [v9 UTF8String];
      __strlcpy_chk();
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t sub_10001A814(uint64_t a1, int a2)
{
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result == 1)
  {
    uint64_t v5 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SyncEngine init: Device became unlocked, continuing with _initializeSyncEngineAfterDeviceUnlock.", v6, 2u);
    }
    [*(id *)(a1 + 32) _initializeSyncEngineAfterDeviceUnlock];
    return notify_cancel(a2);
  }
  return result;
}

void sub_10001AB9C(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = v1;
    int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = qword_1000AC7A8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 9)) {
          uint64_t v7 = "Yes";
        }
        else {
          uint64_t v7 = "No";
        }
        *(_DWORD *)buf = 136315138;
        __int16 v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Enabling syncing; isMain: %s", buf, 0xCu);
      }
      uint64_t v8 = [*(id *)(a1 + 32) syncService];
      id v12 = 0;
      unsigned __int8 v9 = [v8 resume:&v12];
      id v10 = v12;

      uint64_t v11 = (void *)qword_1000AC7A8;
      if (v9)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
          sub_10005A0B4();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
      {
        sub_10005A0E8(v11);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Disabling syncing", buf, 2u);
      }
      [*(id *)(a1 + 32) setPendingSyncType:0];
      [*(id *)(a1 + 32) setRetryCount:0];
      id v10 = [*(id *)(a1 + 32) syncService];
      [v10 suspend];
    }
  }
}

void sub_10001AE1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setSyncingEnabled:1];
    if ([v5 pendingSyncType] == 1)
    {
      BOOL v6 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "postPairingContinuation: requesting a ResetSync.", buf, 2u);
      }
      [v5 _initiateResetSync];
    }
    else
    {
      if ([v3 count])
      {
        uint64_t v7 = [v5 pendingDeltaSyncChanges];
        [v7 addObjectsFromArray:v3];

        [v5 setPendingSyncType:2];
      }
      if ([v5 pendingSyncType] == 2)
      {
        uint64_t v8 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "postPairingContinuation: requesting a DeltaSync.", v10, 2u);
        }
        [v5 _acquireTransaction];
        unsigned __int8 v9 = [v5 syncService];
        [v9 setHasChangesAvailable];
      }
      else
      {
        [v5 _sendSyncSessionDidFinishWithResult:0 error:0];
      }
    }
  }
}

id sub_10001CAE0(uint64_t a1)
{
  uint64_t v2 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = v2;
    uint64_t v5 = [v3 retryBlock];
    id v6 = objc_retainBlock(v5);
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) _syncTypeToString:*(unsigned int *)(a1 + 56)];
    int v11 = 134218754;
    id v12 = v6;
    __int16 v13 = 2114;
    __int16 v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2082;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Running retry-block(%p) from session:  %{public}@, count: %llu, type: '%{public}s'", (uint8_t *)&v11, 0x2Au);
  }
  [*(id *)(a1 + 32) setRetryBlock:0];
  return [*(id *)(a1 + 32) _retrySyncType:*(unsigned int *)(a1 + 56)];
}

void sub_10001D23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001D254(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

id sub_10001D2F4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005ABB4();
  }
  return [*(id *)(a1 + 32) setBatchDeltaChanges:1];
}

id sub_10001D3D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDeltaChangeBatching];
}

id sub_10001D464(uint64_t a1)
{
  uint64_t v2 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Begin willShutdown.", v4, 2u);
  }
  return [*(id *)(a1 + 32) _sendSyncSessionDidFinishWithResult:7 error:0];
}

void sub_10001D5B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  id v3 = objc_retainBlock(*(id *)(a1 + 48));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

id sub_10001D6C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:*(void *)(a1 + 40)];
}

id sub_10001D790(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSyncChangeType:", objc_msgSend(*(id *)(a1 + 40), "syChangeTypeForUpdateType:", *(void *)(a1 + 48)));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _addDeltaSyncChange:v3];
}

void sub_10001D874(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventRetryBlock];

  uint64_t v3 = qword_1000AC7A8;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "skipping MemoryPressureCritical...", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "handling MemoryPressureCritical...", buf, 2u);
    }
    [*(id *)(a1 + 32) _writeSyncStateAndAllowTermination];
    uint64_t v5 = [*(id *)(a1 + 32) eventRetryBlock];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) eventRetryBlock];
      dispatch_block_cancel(v6);

      [*(id *)(a1 + 32) setEventRetryBlock:0];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DA34;
    block[3] = &unk_100094E78;
    block[4] = *(void *)(a1 + 32);
    dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    [*(id *)(a1 + 32) setEventRetryBlock:v7];

    dispatch_time_t v8 = dispatch_time(0, 1000000000 * (void)[*(id *)(a1 + 32) eventRetryIntervalSecs]);
    id v9 = [*(id *)(a1 + 32) syncControllerQueue];
    id v10 = [*(id *)(a1 + 32) eventRetryBlock];
    dispatch_after(v8, v9, v10);
  }
}

id sub_10001DA34(uint64_t a1)
{
  uint64_t v2 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "EventRetry for MemoryPressureCritical...", v5, 2u);
  }
  [*(id *)(a1 + 32) _loadSavedSyncState];
  if ([*(id *)(a1 + 32) pendingSyncType] == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005ABE8();
    }
    [*(id *)(a1 + 32) _initiateResetSync];
  }
  else if ([*(id *)(a1 + 32) pendingSyncType] == 2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005AC1C();
    }
    [*(id *)(a1 + 32) _acquireTransaction];
    uint64_t v3 = [*(id *)(a1 + 32) syncService];
    [v3 setHasChangesAvailable];
  }
  return [*(id *)(a1 + 32) setEventRetryBlock:0];
}

void sub_10001DC40(uint64_t a1)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 80);
  id v26 = [v1 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v26)
  {
    uint64_t v3 = *(void *)v29;
    p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
    *(void *)&long long v2 = 136315650;
    long long v22 = v2;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v29 != v3) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_block_t v7 = p_inst_props[245];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v19 = v7;
          __int16 v20 = [v6 syncRequestAccessAction];
          uint64_t v21 = *(void *)(a1 + 40);
          *(_DWORD *)buf = v22;
          int v33 = "-[TCCDSyncController _syncSessionHandlerForUpdateAccessAction:]_block_invoke";
          __int16 v34 = 2112;
          __int16 v35 = v20;
          __int16 v36 = 2112;
          uint64_t v37 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: comparing request:%@ to update:%@", buf, 0x20u);
        }
        dispatch_time_t v8 = objc_msgSend(v6, "syncRequestAccessAction", v22);
        id v9 = [v8 serviceIdentifier];
        id v10 = [*(id *)(a1 + 40) serviceIdentifier];
        if (([v9 isEqualToString:v10] & 1) == 0)
        {

          goto LABEL_15;
        }
        int v11 = [v6 syncRequestAccessAction];
        id v12 = [v11 replicaClientIdentifier];
        __int16 v13 = [*(id *)(a1 + 40) replicaClientIdentifier];
        if (![v12 isEqualToString:v13])
        {

          p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
          goto LABEL_15;
        }
        [v6 syncRequestAccessAction];
        __int16 v15 = v14 = v1;
        unsigned int v25 = [v15 clientType];
        unsigned int v24 = [*(id *)(a1 + 40) clientType];

        id v1 = v14;
        uint64_t v3 = v23;

        p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
        if (v25 != v24) {
          continue;
        }
        uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v6];
        dispatch_time_t v8 = v16;
        if (v16)
        {
          __int16 v17 = *(void **)(a1 + 48);
          id v9 = objc_retainBlock(v16);
          id v18 = v17;
          uint64_t v3 = v23;
          [v18 addObject:v9];
LABEL_15:
        }
      }
      id v26 = [v1 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v26);
  }
}

void sub_1000200F4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, (os_log_type_t)0x90u)) {
    sub_10005C154();
  }
  long long v2 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    BOOL v4 = v2;
    uint64_t v5 = [v3 _syncStatusDescriptionString];
    int v6 = 138412290;
    dispatch_block_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_100020298(uint64_t a1)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "arg1");
  if (!strncmp(string, "maxRetry", 8uLL))
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "arg2");
    dispatch_block_t v7 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = uint64;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting maxRetryCount to %llu", (uint8_t *)&v20, 0xCu);
    }
    [*(id *)(a1 + 40) setMaxRetryCount:uint64];
  }
  else if (!strncmp(string, "retryInterval", 0xDuLL))
  {
    uint64_t v8 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "arg2");
    id v9 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting retryIntervalSecs to %llu", (uint8_t *)&v20, 0xCu);
    }
    [*(id *)(a1 + 40) setRetryIntervalSecs:v8];
  }
  else
  {
    if (strncmp(string, "messageTimeout", 0xEuLL))
    {
      if (!strncmp(string, "inProximity", 0xBuLL))
      {
        id v12 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Calling targetDeviceProximityChanged:YES", (uint8_t *)&v20, 2u);
        }
        __int16 v13 = *(void **)(a1 + 40);
        id v14 = [v13 syncService];
        __int16 v15 = v13;
        uint64_t v16 = v14;
        uint64_t v17 = 1;
      }
      else
      {
        if (strncmp(string, "outProximity", 0xCuLL))
        {
          int v3 = strncmp(string, "testMaxRetry", 0xCuLL);
          BOOL v4 = qword_1000AC7A8;
          BOOL v5 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT);
          if (v3)
          {
            if (v5)
            {
              int v20 = 136315138;
              uint64_t v21 = (uint64_t)string;
              _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "testSyncSet unsupported target: %s", (uint8_t *)&v20, 0xCu);
            }
          }
          else
          {
            if (v5)
            {
              LOWORD(v20) = 0;
              _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting one-shot retryTestMaxRetry", (uint8_t *)&v20, 2u);
            }
            [*(id *)(a1 + 40) setRetryTestMaxRetry:1];
          }
          return;
        }
        id v18 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling targetDeviceProximityChanged:NO", (uint8_t *)&v20, 2u);
        }
        uint64_t v19 = *(void **)(a1 + 40);
        id v14 = [v19 syncService];
        __int16 v15 = v19;
        uint64_t v16 = v14;
        uint64_t v17 = 0;
      }
      [v15 service:v16 targetDeviceProximityChanged:v17];

      return;
    }
    uint64_t v10 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "arg2");
    int v11 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 134217984;
      uint64_t v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting sessionPerMessageTimeoutSecs to %llu", (uint8_t *)&v20, 0xCu);
    }
    [*(id *)(a1 + 40) setSessionPerMessageTimeoutSecs:v10];
  }
}

id sub_1000206CC(uint64_t a1)
{
  long long v2 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Testing handleMemoryPressureCritical", v4, 2u);
  }
  return [*(id *)(a1 + 32) handleMemoryPressureCritical];
}

Class sub_100020AB0()
{
  if (!qword_1000AC4F0) {
    qword_1000AC4F0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CompanionSync.framework/CompanionSync", 2);
  }
  Class result = objc_getClass("SYService");
  qword_1000AC4E8 = (uint64_t)result;
  off_1000AC150 = (uint64_t (*)())sub_100020B14;
  return result;
}

id sub_100020B14()
{
  return (id)qword_1000AC4E8;
}

Class sub_100020B20()
{
  if (!qword_1000AC500) {
    qword_1000AC500 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
  }
  Class result = objc_getClass("NRPairedDeviceRegistry");
  qword_1000AC4F8 = (uint64_t)result;
  off_1000AC158 = (uint64_t (*)())sub_100020B84;
  return result;
}

id sub_100020B84()
{
  return (id)qword_1000AC4F8;
}

id sub_100020B90()
{
  uint64_t v0 = (void *)qword_1000AC500;
  if (!qword_1000AC500)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
    qword_1000AC500 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "NRDevicePropertyLocalPairingDataStorePath");
  objc_storeStrong((id *)&qword_1000AC4E0, *v1);
  off_1000AC160 = (uint64_t (*)())sub_100020C14;
  long long v2 = (void *)qword_1000AC4E0;
  return v2;
}

id sub_100020C14()
{
  return (id)qword_1000AC4E0;
}

id sub_100020C20()
{
  uint64_t v0 = (void *)qword_1000AC500;
  if (!qword_1000AC500)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
    qword_1000AC500 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "NRDevicePropertyPairingID");
  objc_storeStrong((id *)&qword_1000AC4D8, *v1);
  off_1000AC168 = (uint64_t (*)())sub_100020CA4;
  long long v2 = (void *)qword_1000AC4D8;
  return v2;
}

id sub_100020CA4()
{
  return (id)qword_1000AC4D8;
}

id sub_100020CB0()
{
  uint64_t v0 = (void *)qword_1000AC4F0;
  if (!qword_1000AC4F0)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/CompanionSync.framework/CompanionSync", 2);
    qword_1000AC4F0 = (uint64_t)v0;
  }
  id v1 = (id *)dlsym(v0, "kSYDictionaryObjectSyncIDKey");
  objc_storeStrong((id *)&qword_1000AC4D0, *v1);
  off_1000AC170 = (uint64_t (*)())sub_100020D34;
  long long v2 = (void *)qword_1000AC4D0;
  return v2;
}

id sub_100020D34()
{
  return (id)qword_1000AC4D0;
}

uint64_t sub_100020D40()
{
  return v0;
}

void sub_100020D4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100020D6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100020D8C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100020DC0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100020DE0()
{
  return v0;
}

void sub_100020E10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100020E68(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_100020EA4()
{
  return v0;
}

void sub_100020ED4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100020EF4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

CFStringRef sub_100020F50(unint64_t a1)
{
  if (a1 > 2) {
    return @"<Unknown>";
  }
  else {
    return off_1000955F8[a1];
  }
}

unsigned char *sub_100020F74(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex maxBufLen = 0;
  v6.location = 0;
  v6.length = Length;
  int v3 = 0;
  if (CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length
    && (int v3 = malloc_type_malloc(maxBufLen + 1, 0xBE693CA1uLL)) != 0
    && (v7.location = 0,
        v7.length = Length,
        CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v3, maxBufLen, &maxBufLen) == Length))
  {
    v3[maxBufLen] = 0;
  }
  else
  {
    free(v3);
    return 0;
  }
  return v3;
}

void sub_10002105C(void *a1)
{
  id v1 = a1;
  long long v2 = [(id)qword_1000AC7B0 platform];
  int v3 = [v1 serviceIdentifier];
  uint64_t v4 = [v2 serviceByName:v3];

  if (v4)
  {
    if ([v1 clientType])
    {
      uint64_t v5 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
        sub_10005C4C4(v5, v1);
      }
      goto LABEL_29;
    }
    CFRange v7 = [TCCDRequestContext alloc];
    uint64_t v8 = [v1 mainClientIdentifier];
    id v9 = [(TCCDRequestContext *)v7 initForSyncRequestForSubjectBundleIdentifier:v8 service:v4];

    objc_msgSend(v9, "setDesiredAuth:", objc_msgSend(v1, "desiredAuth"));
    if (!v9)
    {
      uint64_t v19 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
        sub_10005C238(v19);
      }
      goto LABEL_28;
    }
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005C43C();
    }
    uint64_t v10 = [v9 subjectIdentity];
    int v11 = [v10 bundle];
    if ([v11 isASKCapable])
    {
      id v12 = [v4 name];
      unsigned int v13 = [v12 isEqualToString:@"kTCCServiceBluetoothAlways"];

      if (v13)
      {
        id v14 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v45 = "tccd_sync_TCCAccessRequest";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: request from watch to prompt for bluetooth when phone app has ASK info plist key", buf, 0xCu);
        }
        unint64_t v15 = +[TCCDSyncUpdateAccessAction accessUpdateStatusForAuthorizationRight:0 forMain:qword_1000AC510 != 0];
        uint64_t v16 = (void *)qword_1000AC508;
        uint64_t v17 = [v1 serviceIdentifier];
        id v18 = [v1 mainClientIdentifier];
        objc_msgSend(v16, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v17, v18, objc_msgSend(v1, "clientType"), v15, objc_msgSend(v4, "authorizationVersionNumber"), 0, 0);

        goto LABEL_28;
      }
    }
    else
    {
    }
    char v43 = 0;
    id v20 = sub_10000DAD4(v9, (uint64_t)&v43);
    uint64_t v21 = v20;
    if (v43)
    {
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    long long v22 = [v20 error];

    if (!v22)
    {
      if ([v21 authorizationValue] != (id)1)
      {
        id v36 = [v21 authorizationValue];
        uint64_t v37 = qword_1000AC508;
        id v38 = [v4 name];
        LOBYTE(v37) = objc_msgSend((id)v37, "peerSupportsService:authVersion:", v38, objc_msgSend(v4, "authorizationVersionNumber"));

        if ((v37 & 1) == 0)
        {
          id v36 = [v4 translateAuth:v36 versionUpgrade:0];
          __int16 v39 = (void *)qword_1000AC518;
          if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
          {
            id v40 = v39;
            __int16 v41 = [v4 name];
            *(_DWORD *)buf = 138412546;
            uint64_t v45 = v41;
            __int16 v46 = 2048;
            id v47 = v36;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "downgrading %@ auth to %lu", buf, 0x16u);
          }
        }
        if (v36 || [v21 authorizationReason] != (id)15)
        {
          id v42 = [v9 service];
          uint64_t v31 = (uint64_t)[v42 accessActionStatusForAuthorizationValue:v36];
        }
        else
        {
          uint64_t v31 = 14;
        }
        goto LABEL_24;
      }
      uint64_t v23 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005C3C4(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    uint64_t v31 = 0;
LABEL_24:
    id v32 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005C2DC(v32, v1);
    }
    int v33 = (void *)qword_1000AC508;
    __int16 v34 = [v1 serviceIdentifier];
    __int16 v35 = [v1 mainClientIdentifier];
    objc_msgSend(v33, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v34, v35, objc_msgSend(v1, "clientType"), v31, 2, objc_msgSend(v21, "databaseFlags"), 0);

    goto LABEL_27;
  }
  CFRange v6 = (void *)qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
    sub_10005C194(v6);
  }
LABEL_29:
}

void sub_10002156C(void *a1)
{
  id v1 = a1;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005C658();
  }
  long long v2 = [(id)qword_1000AC7B0 platform];
  int v3 = [v1 serviceIdentifier];
  uint64_t v4 = [v2 serviceByName:v3];

  if (v4)
  {
    uint64_t v5 = [v1 clientIdentifierForCurrentPlatform];
    int v6 = [v1 clientType];
    int v7 = db_reset_access_internal(v4, v5, v6, (void *)qword_1000AC7B0, 0, 1);

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005C5F0();
      }
    }
  }
}

void sub_10002167C(void *a1, char a2)
{
  id v3 = a1;
  if ([v3 clientType])
  {
    uint64_t v4 = (void *)qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
      sub_10005C928(v4, v3);
    }
    goto LABEL_72;
  }
  uint64_t v5 = [v3 clientIdentifierForCurrentPlatform];

  if (v5)
  {
    int v6 = [(id)qword_1000AC7B0 platform];
    int v7 = [v3 serviceIdentifier];
    uint64_t v8 = [v6 serviceByName:v7];

    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100022208;
    v86[3] = &unk_1000950A8;
    id v9 = v3;
    id v87 = v9;
    uint64_t v10 = objc_retainBlock(v86);
    if ([v9 updateAccessActionStatus] == (id)1)
    {
      sub_10002156C(v9);
LABEL_71:

      goto LABEL_72;
    }
    if (![v9 updateAccessActionStatus] || objc_msgSend(v9, "updateAccessActionStatus") == (id)14) {
      goto LABEL_71;
    }
    id v60 = [v9 authorizationVersion];
    int v11 = [v9 authorizationRightState];
    id v61 = [v11 right];

    unsigned int v59 = [v9 databaseFlags];
    if ([v9 updateAccessActionStatus] == (id)4
      || [v9 updateAccessActionStatus] == (id)5
      || [v9 updateAccessActionStatus] == (id)7
      || [v9 updateAccessActionStatus] == (id)9)
    {
      id v12 = [v9 mainAuthorizationRightState];
      id v61 = [v12 right];
    }
    uint64_t v13 = qword_1000AC508;
    id v14 = [v8 name];
    LOBYTE(v13) = objc_msgSend((id)v13, "peerSupportsService:authVersion:", v14, objc_msgSend(v8, "authorizationVersionNumber"));

    if ((v13 & 1) == 0)
    {
      id v61 = [v8 translateAuth:v61 versionUpgrade:1];
      id v60 = [v8 authorizationVersionNumber];
      unint64_t v15 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v15;
        uint64_t v17 = [v8 name];
        *(_DWORD *)buf = 138412546;
        uint64_t v89 = (uint64_t)v17;
        __int16 v90 = 2048;
        id v91 = v61;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "upgrading %@ auth to %lu", buf, 0x16u);
      }
    }
    if ([v9 updateAccessActionStatus] != (id)2
      && [v9 updateAccessActionStatus] != (id)3
      && [v9 updateAccessActionStatus] != (id)6
      && [v9 updateAccessActionStatus] != (id)8)
    {
      if (!qword_1000AC510)
      {
        id v36 = [v9 mainAuthorizationRightState];
        [v36 setRight:v61];
        __int16 v58 = (void *)qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
          sub_10005C818(v58, v36);
        }
        goto LABEL_63;
      }
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005C8C0();
      }
      id v36 = 0;
LABEL_70:

      goto LABEL_71;
    }
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x2020000000;
    char v85 = 0;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    uint64_t v81 = 1;
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2020000000;
    uint64_t v77 = 1;
    uint64_t v70 = 0;
    unsigned int v71 = &v70;
    uint64_t v72 = 0x2020000000;
    int v73 = 0;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000222F4;
    v69[3] = &unk_100095618;
    v69[4] = &v82;
    v69[5] = &v78;
    v69[6] = &v74;
    v69[7] = &v70;
    db_eval((uint64_t)"SELECT auth_value, auth_version, flags FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ?", v10, v69);
    if (!*((unsigned char *)v83 + 24))
    {
      id v18 = [v9 serviceIdentifier];
      unsigned int v19 = [v18 isEqualToString:@"kTCCServiceBluetoothAlways"];

      if (v19)
      {
        id v20 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "checking for NSAccessorySetupKitSupports info plist key", buf, 2u);
        }
        if ([v9 clientType])
        {
          uint64_t v21 = (id)qword_1000AC518;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            long long v22 = [v9 clientIdentifierForCurrentPlatform];
            unsigned int v23 = [v9 clientType];
            *(_DWORD *)buf = 138412546;
            uint64_t v89 = (uint64_t)v22;
            __int16 v90 = 1024;
            LODWORD(v91) = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received synced bluetooth auth for client not of type bundle id: %@ type: %d not checking for drop eligibility", buf, 0x12u);
          }
        }
        else
        {
          uint64_t v24 = [v9 clientIdentifierForCurrentPlatform];
          uint64_t v21 = +[TCCDBundle bundleWithIdentifier:v24];

          if (v21 && [v21 isASKCapable])
          {
            uint64_t v25 = qword_1000AC518;
            if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NSAccessorySetupKitSupports array found, not persisting auth to local db", buf, 2u);
            }
            uint64_t v26 = qword_1000AC518;
            if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "syncing bluetooth deny authorization to peer", buf, 2u);
            }
            unint64_t v62 = +[TCCDSyncUpdateAccessAction accessUpdateStatusForAuthorizationRight:0 forMain:qword_1000AC510 != 0];
            uint64_t v27 = (void *)qword_1000AC508;
            uint64_t v28 = [v9 serviceIdentifier];
            uint64_t v29 = [v9 clientIdentifierForCurrentPlatform];
            objc_msgSend(v27, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v28, v29, objc_msgSend(v9, "clientType"), v62, objc_msgSend(v8, "authorizationVersionNumber"), 0, 1);

            goto LABEL_61;
          }
        }
      }
    }
    uint64_t v30 = (id)qword_1000AC7A8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      if (*((unsigned char *)v83 + 24)) {
        uint64_t v31 = "replacing";
      }
      else {
        uint64_t v31 = "inserting new";
      }
      id v32 = [v9 description];
      int v33 = [v9 serviceIdentifier];
      __int16 v34 = [v9 clientIdentifierForCurrentPlatform];
      uint64_t v35 = v79[3];
      *(_DWORD *)buf = 136447234;
      uint64_t v89 = (uint64_t)v31;
      __int16 v90 = 2114;
      id v91 = v32;
      __int16 v92 = 2114;
      v93 = v33;
      __int16 v94 = 2114;
      v95 = v34;
      __int16 v96 = 2048;
      uint64_t v97 = v35;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Handling sync update access action: %{public}s AccessActionStatus: %{public}@ for (%{public}@, %{public}@): current auth value: %llu", buf, 0x34u);
    }
    if (!*((unsigned char *)v83 + 24) || v75[3] < (unint64_t)v60) {
      goto LABEL_45;
    }
    if ((id)v79[3] == v61)
    {
      int v38 = *((_DWORD *)v71 + 6);
      __int16 v39 = qword_1000AC7A8;
      BOOL v40 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG);
      if (v38 == v59)
      {
        if (v40) {
          sub_10005C728(v39, v41, v42, v43, v44, v45, v46, v47);
        }
LABEL_61:
        id v36 = 0;
        char v37 = 0;
LABEL_62:
        _Block_object_dispose(&v70, 8);
        _Block_object_dispose(&v74, 8);
        _Block_object_dispose(&v78, 8);
        _Block_object_dispose(&v82, 8);
        if (v37)
        {
LABEL_63:
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = sub_100022370;
          v63[3] = &unk_100095640;
          id v64 = v9;
          id v65 = v36;
          id v67 = v60;
          id v66 = v8;
          char v68 = a2;
          id v57 = v36;
          db_eval((uint64_t)"INSERT OR REPLACE INTO access   (service, client, client_type, auth_value, auth_reason, auth_version, indirect_object_identifier, flags) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", v63, 0);

          goto LABEL_71;
        }
        goto LABEL_70;
      }
      if (v40) {
        sub_10005C7A0(v39, v41, v42, v43, v44, v45, v46, v47);
      }
LABEL_45:
      id v36 = [v9 authorizationRightState];
      [v36 setRight:v61];
      char v37 = 1;
      goto LABEL_62;
    }
    uint64_t v48 = [v8 name];
    if ([v48 isEqualToString:@"kTCCServiceCalendar"] && v79[3] == 4)
    {

      if (v61 == (id)2)
      {
        v49 = (id)qword_1000AC7A8;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v50 = (void *)v79[3];
          id v51 = [v8 name];
          *(_DWORD *)buf = 134218498;
          uint64_t v89 = 2;
          __int16 v90 = 2048;
          id v91 = v50;
          __int16 v92 = 2112;
          v93 = v51;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "incomingAuth: %llu existingAuth: %llu service: %@", buf, 0x20u);
        }
        id v52 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "no kill auth transition", buf, 2u);
        }
        goto LABEL_45;
      }
    }
    else
    {
    }
    id v53 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Forcing reset because existing access status conflicts with incoming status; resetting us and our peer.",
        buf,
        2u);
    }
    sub_10002156C(v9);
    v54 = (void *)qword_1000AC508;
    v55 = [v9 serviceIdentifier];
    unsigned int v56 = [v9 clientIdentifierForCurrentPlatform];
    objc_msgSend(v54, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v55, v56, objc_msgSend(v9, "clientType"), 1, 1, 0, 2);

    goto LABEL_61;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
    sub_10005C6C0();
  }
LABEL_72:
}

void sub_1000221AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_100022208(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) serviceIdentifier];
  if (!sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v5 = [*(id *)(a1 + 32) clientIdentifierForCurrentPlatform];
    if (!sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      int v6 = sqlite3_bind_int(a2, 3, (int)[*(id *)(a1 + 32) clientType]);

      if (!v6) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  _db_error(1);
}

uint64_t sub_1000222F4(void *a1, sqlite3_stmt *a2)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  *(void *)(*(void *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(a1[6] + 8) + 24) = sqlite3_column_int64(a2, 1);
  uint64_t result = sqlite3_column_int(a2, 2);
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

void sub_100022370(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) serviceIdentifier];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    goto LABEL_9;
  }
  id v5 = [*(id *)(a1 + 32) clientIdentifierForCurrentPlatform];
  if (sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 3, (int)objc_msgSend(*(id *)(a1 + 32), "clientType"))|| sqlite3_bind_int64(a2, 4, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 40), "right"))|| sqlite3_bind_int64(a2, 5, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 40), "reason"))|| sqlite3_bind_int64(a2, 6, *(void *)(a1 + 56))|| sqlite3_bind_text(a2, 7, "UNUSED", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {

LABEL_9:
LABEL_10:
    _db_error(1);
    goto LABEL_11;
  }
  int v8 = sqlite3_bind_int(a2, 8, (int)[*(id *)(a1 + 32) databaseFlags]);

  if (v8) {
    goto LABEL_10;
  }
LABEL_11:
  access_changed();
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    int v7 = (void *)qword_1000AC7B0;
    id v9 = [*(id *)(a1 + 32) clientIdentifierForCurrentPlatform];
    objc_msgSend(v7, "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:", 2, v6, v9, objc_msgSend(*(id *)(a1 + 32), "clientType"), objc_msgSend(*(id *)(a1 + 40), "right"), *(unsigned __int8 *)(a1 + 64));
  }
}

void sub_100022554(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v3];
  if (v5)
  {
    uint64_t v6 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
    id v72 = 0;
    int v7 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v72];
    id v8 = v72;
    if (!v7)
    {
      BOOL v40 = objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v40 forError:v8 contextString:0];
      uint64_t v41 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10005C9C0();
      }

      goto LABEL_36;
    }
    xpc_object_t xdict = v4;
    if (_os_feature_enabled_impl())
    {
      id v9 = [(id)qword_1000AC7B0 platform];
      uint64_t v10 = [v9 protectedAppManager];
      int v11 = [v7 name];
      unsigned __int8 v12 = [v10 authenticateForAccessToService:v11];

      if ((v12 & 1) == 0)
      {
        uint64_t v43 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = v43;
          uint64_t v45 = [v7 name];
          *(_DWORD *)buf = 138412290;
          uint64_t v74 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "service: %@ is locked and authentication failed", buf, 0xCu);
        }
        goto LABEL_35;
      }
    }
    id v70 = 0;
    id v71 = 0;
    id v69 = v8;
    uint64_t v13 = [(id)qword_1000AC7B0 recordFromMessage:v3 accessIdentity:&v71 indirectObjectIdentity:&v70 error:&v69];
    id v14 = v71;
    id v65 = v70;
    id v15 = v69;

    id v64 = v15;
    if (v13)
    {
      unint64_t v16 = (unint64_t)[v7 authorizationRightsMask];
      unsigned __int8 v17 = [v13 authorizationValue];
      id v18 = (void *)qword_1000AC7B0;
      if ((v16 & (1 << v17)) != 0)
      {
        unsigned int v19 = [(TCCDAttributionChain *)v5 requestingProcess];
        unsigned __int8 v20 = [v18 canProcess:v19 callFunction:v6 forService:v7 withAccessIdentity:v14];

        if (v20)
        {
          uint64_t v21 = [v13 subjectIdentity];
          id v22 = [v21 identityType];

          if (v22)
          {
LABEL_34:

            id v8 = v64;
LABEL_35:
            id v4 = xdict;
LABEL_36:

            goto LABEL_37;
          }
          id v23 = [v13 subjectIdentity];
          uint64_t v24 = (void *)qword_1000AC7B0;
          uint64_t v25 = [(TCCDAttributionChain *)v5 requestingProcess];
          unsigned int v59 = [v24 isProcessServiceCompositionManager:v25];

          uint64_t v27 = (void *)qword_1000AC7B0;
          uint64_t v26 = [(TCCDAttributionChain *)v5 requestingProcess];
          LODWORD(v27) = [v27 updateAccessRecord:v13 replaceOnly:0 doCompositionWithChildService:v59 withRequestingProcess:v26 function:v6 accessIdentity:v14];

          if (v27)
          {
            char v57 = (char)v27;
            uint64_t v28 = [(TCCDAttributionChain *)v5 requestingProcess];
            uint64_t v29 = v28;
            __int16 v58 = v28;
            if (!v28
              || ([v28 codesignStatus] & 0x4000000) == 0
              || ([v29 identifier],
                  uint64_t v30 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v31 = [v30 isEqualToString:@"com.apple.tccctl"],
                  v30,
                  uint64_t v29 = v58,
                  (v31 & 1) == 0))
            {
              unsigned int v32 = [v29 isSystemPreferencesApp];
              uint64_t v33 = 5;
              if (v32) {
                uint64_t v33 = 2;
              }
              uint64_t v60 = v33;
              __int16 v34 = [(id)qword_1000AC7B0 platform];
              uint64_t v35 = [v23 accessIdentity];
              objc_msgSend(v34, "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:", v60, v7, v35, v65, objc_msgSend(v13, "authorizationValue"), 0, 0, 0, 0, 0);
            }
            [(id)qword_1000AC7B0 scheduleAccessEntryExpiryCheckForService:v7];
            id v61 = [v13 authorizationValue];
            id v36 = [v13 authorizationVersion];
            uint64_t v55 = qword_1000AC508;
            char v37 = [v7 name];
            uint64_t v38 = (void *)v55;
            uint64_t v56 = (uint64_t)v36;
            LOBYTE(v36) = [v38 peerSupportsService:v37 authVersion:v36];

            if (v36)
            {
              id v39 = v61;
            }
            else
            {
              id v39 = [v7 translateAuth:v61 versionUpgrade:0];
              uint64_t v47 = (void *)qword_1000AC518;
              if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v48 = v47;
                [v7 name];
                v49 = id v62 = v39;
                *(_DWORD *)buf = 138412546;
                uint64_t v74 = v49;
                __int16 v75 = 2048;
                id v76 = v62;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "downgrading %@ auth to %lu", buf, 0x16u);

                id v39 = v62;
              }
              uint64_t v56 = 1;
            }
            unint64_t v50 = +[TCCDSyncUpdateAccessAction accessUpdateStatusForAuthorizationRight:v39 forMain:qword_1000AC510 != 0];
            if (qword_1000AC508 && [(id)qword_1000AC508 isSyncingEnabled])
            {
              v63 = (void *)qword_1000AC508;
              [v7 name];
              id v51 = v54 = v50;
              id v52 = [v23 identifier];
              objc_msgSend(v63, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v51, v52, objc_msgSend(v23, "identifierAuthority"), v54, v56, 0, 1);
            }
            access_changed();
            id v53 = (void *)qword_1000AC7B0;
            uint64_t v27 = [v23 identifier];
            objc_msgSend(v53, "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:", 2, v7, v27, objc_msgSend(v23, "identifierAuthority"), objc_msgSend(v13, "authorizationValue"), !xpc_dictionary_get_BOOL(v3, "noKill"));

            LOBYTE(v27) = v57;
          }
          xpc_dictionary_set_BOOL(xdict, "result", (BOOL)v27);
LABEL_33:

          goto LABEL_34;
        }
        id v67 = 0;
        [(id)qword_1000AC7B0 makeError:&v67 withCode:5 infoText:0];
        id v23 = v67;
        uint64_t v42 = objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v42 forError:v23 contextString:0];
        uint64_t v46 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_10005C9C0();
        }
      }
      else
      {
        id v68 = 0;
        [(id)qword_1000AC7B0 makeError:&v68 withCode:9 infoText:0];
        id v23 = v68;
        uint64_t v42 = objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v42 forError:v23 contextString:0];
        uint64_t v46 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_10005C9C0();
        }
      }
    }
    else
    {
      id v23 = (id)objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v23 forError:v15 contextString:0];
      uint64_t v42 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_10005C9C0();
      }
    }

    goto LABEL_33;
  }
  id v8 = (id)objc_opt_new();
  [(id)qword_1000AC7B0 buildErrorString:v8 forError:0 contextString:0];
  uint64_t v6 = [(id)qword_1000AC7B0 logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10005C9C0();
  }
LABEL_37:
}

void sub_100022D88(void *a1, unint64_t a2)
{
  id v3 = a1;
  id v4 = [(id)qword_1000AC7B0 platform];
  id v5 = [v3 serviceIdentifier];
  uint64_t v6 = [v4 serviceByName:v5];

  if (v6)
  {
    int v7 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005CACC(v7, v6);
    }
    db_set_access_override(v6, a2 < 2, (void *)qword_1000AC7B0);
  }
  else
  {
    id v8 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005CA34(v8);
    }
  }
}

id sub_100022E7C()
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100022F2C;
  v2[3] = &unk_1000950A8;
  id v0 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v0;
  db_eval((uint64_t)"SELECT service, client, client_type, auth_value, strftime('%s','now') - last_modified AS age, auth_version FROM access", 0, v2);

  return v0;
}

void sub_100022F2C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 3);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 5);
  uint64_t v6 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  if (v6)
  {
    id v11 = v6;
    int v7 = +[TCCDPlatform currentPlatform];
    id v8 = [v7 serviceByName:v11];

    if (v8
      && (objc_msgSend((id)qword_1000AC7B0, "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 4), v4, v8) & 1) == 0)
    {
      id v9 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 1)];
      uint64_t v10 = [(TCCDSyncClientAccessAction *)[TCCDSyncUpdateAccessAction alloc] initWithServiceIdentifier:v11 mainClientIdentifier:v9 replicaClientIdentifier:0 clientType:sqlite3_column_int(a2, 2)];
      [(TCCDSyncUpdateAccessAction *)v10 setUpdateAccessActionStatus:+[TCCDSyncUpdateAccessAction accessUpdateStatusForAuthorizationRight:v4 forMain:0]];
      [(TCCDSyncUpdateAccessAction *)v10 setAuthorizationVersion:v5];
      [*(id *)(a1 + 32) addObject:v10];
    }
    uint64_t v6 = v11;
  }
}

void sub_1000230C0()
{
  id v0 = [(id)qword_1000AC7B0 fetchAllOverriddenServiceNames];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v1 = [v0 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v29;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v29 != v3) {
          objc_enumerationMutation(v0);
        }
        sqlite3_int64 v5 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "tccd_replica_sync_delete_all_synced_state";
          __int16 v35 = 2112;
          uint64_t v36 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: deleting %@ from access_overrides.", buf, 0x16u);
        }
      }
      id v2 = [v0 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v2);
  }
  unint64_t v16 = v0;
  db_eval((uint64_t)"DELETE FROM access_overrides", 0, 0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000234EC;
  v26[3] = &unk_1000950A8;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v27 = v7;
  db_eval((uint64_t)"SELECT client, client_type FROM access", 0, v26);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
        uint64_t v13 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "tccd_replica_sync_delete_all_synced_state";
          __int16 v35 = 2112;
          uint64_t v36 = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s: deleting state for client: %@", buf, 0x16u);
        }
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10002368C;
        v21[3] = &unk_1000950A8;
        v21[4] = v12;
        id v14 = objc_retainBlock(v21);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002370C;
        v20[3] = &unk_1000950A8;
        v20[4] = v12;
        db_eval((uint64_t)"SELECT service FROM access WHERE client = ? AND client_xpc_type_t type = ?", v14, v20);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000237DC;
        v18[3] = &unk_100095668;
        id v19 = v14;
        id v15 = v14;
        db_transaction(v18);

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }

  if ([obj count]) {
    access_changed();
  }
}

void sub_1000234EC(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v5 = sqlite3_column_text(a2, 0);
  int v6 = sqlite3_column_int(a2, 1);
  if (v6 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005CD4C();
    }
  }
  else
  {
    int v7 = v6;
    if (v6)
    {
      uint64_t v13 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005CBAC((uint64_t)v5, v7, v13);
      }
    }
    else
    {
      id v8 = +[NSString stringWithUTF8String:v5];
      if (v8)
      {
        id v9 = +[LSApplicationProxy applicationProxyForIdentifier:v8];
        uint64_t v10 = v9;
        if (v9)
        {
          if (([v9 isWatchKitApp] & 1) != 0
            || ([v10 counterpartIdentifiers],
                id v11 = objc_claimAutoreleasedReturnValue(),
                id v12 = [v11 count],
                v11,
                v12))
          {
            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
              sub_10005CCC4();
            }
            [*(id *)(a1 + 32) addObject:v8];
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
      {
        sub_10005CC48();
      }
    }
  }
}

void sub_10002368C(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 2, 0))
  {
    _db_error(1);
  }
}

void sub_10002370C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = [(id)qword_1000AC7B0 platform];
  sqlite3_int64 v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  id v7 = [v4 serviceByName:v5];

  int v6 = v7;
  if (v7)
  {
    [(id)qword_1000AC7B0 publishAccessChangedEvent:3 forService:v7 client:*(void *)(a1 + 32) clientType:0 authValue:1 andKillClient:1];
    int v6 = v7;
  }
}

uint64_t sub_1000237DC(uint64_t a1)
{
  return db_eval_locked((uint64_t)"DELETE FROM access WHERE client = ? AND client_xpc_type_t type = ?", *(void **)(a1 + 32), 0);
}

void sub_1000237F0(const char **a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = *a1;
    if (*a1) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sqlite3_int64 v5 = "_with_parameters";
      if (!a1) {
        sqlite3_int64 v5 = "";
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v10 = v5;
      __int16 v11 = 2082;
      uint64_t v12 = a2;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "FAIL: sandbox_init%{public}s() : %{public}s", buf, 0x16u);
    }
    abort_with_reason();
LABEL_8:
    int v6 = a1 + 2;
    do
    {
      uint64_t v7 = (uint64_t)*(v6 - 1);
      if (v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v10 = v2;
          __int16 v11 = 2082;
          uint64_t v12 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "sandbox parameter: %{public}s = %{public}s", buf, 0x16u);
        }
      }
      id v8 = *v6;
      v6 += 2;
      id v2 = v8;
    }
    while (v8);
  }
}

void sub_10002393C()
{
  id v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &stru_100095688);
}

uint64_t sub_100023990()
{
  id v0 = qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "shutting down tccd...", buf, 2u);
  }
  if (qword_1000AC508) {
    [(id)qword_1000AC508 willShutdown];
  }
  db_close();
  id v1 = qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "...exiting when clean.", v3, 2u);
  }
  return xpc_transaction_exit_clean();
}

uint64_t start()
{
  os_log_t v0 = os_log_create("com.apple.TCC", "access");
  id v1 = (void *)qword_1000AC518;
  qword_1000AC518 = (uint64_t)v0;

  db_setup_queue();
  uint64_t v3 = objc_alloc_init(TCCDServer);
  sqlite3_int64 v4 = (void *)qword_1000AC7B0;
  qword_1000AC7B0 = (uint64_t)v3;

  [(id)qword_1000AC7B0 setLogHandle:qword_1000AC518];
  [(id)qword_1000AC7B0 setAllowsInternalSecurityPolicies:os_variant_allows_internal_security_policies()];
  sqlite3_int64 v5 = +[TCCDPlatform currentPlatform];
  [(id)qword_1000AC7B0 setPlatform:v5];

  int v6 = [(id)qword_1000AC7B0 platform];
  [v6 loadConfigurationDictionary];

  id v7 = [(id)qword_1000AC7B0 cacheDirectory];
  [v7 UTF8String];
  id v8 = [(id)qword_1000AC7B0 temporaryDirectory];
  [v8 UTF8String];
  *(void *)long long v31 = 0;
  if (sandbox_init("com.apple.tccd", 1uLL, (char **)v31)) {
    sub_1000237F0(0, *(uint64_t *)v31);
  }

  id v9 = (void *)qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    uid_t v11 = geteuid();
    *(_DWORD *)long long v31 = 136315394;
    *(void *)&v31[4] = "com.apple.tccd";
    __int16 v32 = 1024;
    uid_t v33 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "starting as: %s; UID: %d", v31, 0x12u);
  }
  uint64_t v12 = +[TCCDMainSyncController sharedSyncController];
  uint64_t v13 = (void *)qword_1000AC510;
  qword_1000AC510 = v12;

  objc_storeStrong((id *)&qword_1000AC508, (id)qword_1000AC510);
  uint64_t v14 = qword_1000AC510;
  id v15 = [(id)qword_1000AC7B0 platform];
  [v15 setMainSyncController:v14];

  uint64_t v16 = qword_1000AC510;
  unsigned __int8 v17 = [(id)qword_1000AC7B0 platform];
  [v17 setSyncController:v16];

  id v18 = +[TCCDEventPublisher sharedPublisher];
  [(id)qword_1000AC7B0 setEventPublisher:v18];

  if (_os_feature_enabled_impl())
  {
    id v19 = objc_alloc_init(TCCDProtectedServiceManager);
    unsigned __int8 v20 = [(id)qword_1000AC7B0 platform];
    [v20 setProtectedAppManager:v19];
  }
  uint64_t v21 = [TCCDAssumedIdentityMonitor alloc];
  long long v22 = [(id)qword_1000AC7B0 stateDirectory];
  long long v23 = [(TCCDAssumedIdentityMonitor *)v21 initWithStateDirectoryPath:v22];
  [(id)qword_1000AC7B0 setAssumedIdentityMonitor:v23];

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.tccd", 0, 1uLL);
  long long v25 = (void *)qword_1000AC520;
  qword_1000AC520 = (uint64_t)mach_service;

  if (!mach_service) {
    sub_10005CDC8();
  }
  xpc_connection_set_event_handler((xpc_connection_t)qword_1000AC520, &stru_1000956C8);
  xpc_connection_resume((xpc_connection_t)qword_1000AC520);
  xpc_activity_register("com.apple.tccd.gc", XPC_ACTIVITY_CHECK_IN, &stru_100095708);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100095728);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100095748);

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v27 = (void *)qword_1000AC528;
  qword_1000AC528 = (uint64_t)v26;

  if (qword_1000AC528)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000AC528, &stru_100095768);
    dispatch_resume((dispatch_object_t)qword_1000AC528);
  }
  *(_DWORD *)long long v31 = 0;
  long long v28 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch("com.apple.language.changed", (int *)v31, v28, &stru_1000957A8);

  [(id)qword_1000AC7B0 purgeAllExpiredAccessEntries];
  long long v29 = +[NSRunLoop mainRunLoop];
  [v29 run];

  return 0;
}

void sub_100023E9C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    sub_100023ED8();
  }
}

void sub_100023ED8()
{
  os_log_t v0 = objc_opt_new();
  id v1 = objc_opt_new();
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10002A350;
  v56[3] = &unk_100095228;
  id v2 = v0;
  id v57 = v2;
  id v3 = v1;
  id v58 = v3;
  db_eval((uint64_t)"SELECT DISTINCT client, client_type FROM access", 0, v56);
  if (![v2 count]) {
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  unint64_t v5 = 0;
  p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
  *(void *)&long long v4 = 138543618;
  long long v38 = v4;
  id v39 = v3;
  id v40 = v2;
  do
  {
    id v8 = [v2 objectAtIndexedSubscript:v5];
    id v9 = [v3 objectAtIndexedSubscript:v5];
    id v10 = [v9 intValue];

    id v11 = v8;
    uint64_t v12 = (const char *)[v11 UTF8String];
    if (v10 == 1)
    {
      if (access(v12, 0) == -1 && *__error() == 2)
      {
        int v19 = 1;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if (v10) {
      goto LABEL_12;
    }
    uint64_t v13 = +[NSString stringWithUTF8String:v12];
    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v14 = (void *)v13;
    id v43 = v11;
    uint64_t v45 = v7;
    id v15 = +[LSApplicationProxy applicationProxyForIdentifier:v13];
    uint64_t v16 = v15;
    if (v15)
    {
      unsigned __int8 v17 = [v15 appState];
      unsigned __int8 v18 = [v17 isInstalled];

      if (v18)
      {

        p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
        id v11 = v43;
        id v7 = v45;
LABEL_12:
        int v19 = 0;
        goto LABEL_13;
      }
    }
    if (qword_1000AC510
      && [(id)qword_1000AC510 isSyncingEnabled]
      && ([(id)qword_1000AC510 replicaClientIdentifierForMainClientIdentifier:v14],
          __int16 v34 = objc_claimAutoreleasedReturnValue(),
          v34,
          v34))
    {
      int v19 = 0;
    }
    else
    {
      __int16 v35 = objc_msgSend((id)qword_1000AC7B0, "platform", v38);
      unsigned int v36 = [v35 isNonAppBundleIdentifierValid:v14];

      int v19 = v36 ^ 1;
    }

    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
    id v11 = v43;
    id v7 = v45;
LABEL_13:
    unsigned __int8 v20 = p_inst_props[163];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      if (!v19) {
        goto LABEL_25;
      }
LABEL_15:
      id v44 = v11;
      uint64_t v46 = v7;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10002A424;
      v53[3] = &unk_100095978;
      id v21 = v11;
      id v54 = v21;
      int v55 = (int)v10;
      long long v22 = objc_retainBlock(v53);
      long long v23 = objc_opt_new();
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10002A4A8;
      v51[3] = &unk_1000950A8;
      id v24 = v23;
      id v52 = v24;
      db_eval((uint64_t)"SELECT DISTINCT service FROM access WHERE client = ? AND client_xpc_type_t type = ?", v22, v51);
      uint64_t v41 = v22;
      db_eval((uint64_t)"DELETE FROM access WHERE client = ? AND client_xpc_type_t type = ?", v22, 0);
      long long v25 = p_inst_props[163];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v61 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Pruned entries for %{public}@", buf, 0xCu);
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = v24;
      id v27 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v48;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            __int16 v32 = objc_msgSend((id)qword_1000AC7B0, "platform", v38);
            uid_t v33 = [v32 serviceByName:v31];

            [(id)qword_1000AC7B0 publishAccessChangedEvent:3 forService:v33 client:v21 clientType:v10 authValue:1 andKillClient:0];
          }
          id v28 = [v26 countByEnumeratingWithState:&v47 objects:v59 count:16];
        }
        while (v28);
      }
      ++v42;

      id v3 = v39;
      id v2 = v40;
      p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
      id v11 = v44;
      id v7 = v46;
      goto LABEL_25;
    }
    *(_DWORD *)buf = v38;
    char v37 = "Valid";
    if (v19) {
      char v37 = "Invalid";
    }
    id v61 = v11;
    __int16 v62 = 2082;
    v63 = v37;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "prune_database() %{public}@ : %{public}s", buf, 0x16u);
    if (v19) {
      goto LABEL_15;
    }
LABEL_25:

    ++v5;
  }
  while (v5 < (unint64_t)[v2 count]);
  if (v42) {
    access_changed();
  }
LABEL_39:
}

void sub_100024478(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string && !strcmp(string, "Application Uninstalled"))
  {
    long long v4 = xpc_dictionary_get_value(v2, "UserInfo");
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary) {
      unint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else {
      unint64_t v5 = 0;
    }
    p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
    id v7 = qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling Application Uninstalled event for %{public}@.", buf, 0xCu);
    }
    if (v5)
    {
      id v8 = [v5 objectForKeyedSubscript:@"bundleIDs"];
      id v9 = v8;
      if (v8)
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v10 = [v8 countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v10)
        {
          id v11 = v10;
          unsigned int v36 = v4;
          char v37 = v2;
          uint64_t v12 = 0;
          uint64_t v13 = *(void *)v51;
          id v39 = v9;
          uint64_t v38 = *(void *)v51;
          do
          {
            uint64_t v14 = 0;
            id v40 = v11;
            do
            {
              if (*(void *)v51 != v13) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * (void)v14);
              if (qword_1000AC510
                && [(id)qword_1000AC510 isSyncingEnabled]
                && ([(id)qword_1000AC510 replicaClientIdentifierForMainClientIdentifier:v15],
                    (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                unsigned __int8 v17 = (void *)v16;
                unsigned __int8 v18 = p_inst_props[163];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)int v55 = 138543618;
                  uint64_t v56 = v15;
                  __int16 v57 = 2114;
                  id v58 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Postponing removal of %{public}@ because it has an associated WatchKit app: %{public}@", v55, 0x16u);
                }
              }
              else
              {
                int v19 = +[LSApplicationWorkspace defaultWorkspace];
                unsigned int v20 = [v19 applicationIsInstalled:v15];

                if (v20)
                {
                  id v21 = p_inst_props[163];
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int v55 = 138543362;
                    uint64_t v56 = v15;
                    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "LS says %{public}@ was uninstalled but now we have found it is still installed.", v55, 0xCu);
                  }
                }
                else
                {
                  uint64_t v41 = v12;
                  v48[0] = _NSConcreteStackBlock;
                  v48[1] = 3221225472;
                  v48[2] = sub_10002A52C;
                  v48[3] = &unk_100095978;
                  v48[4] = v15;
                  int v49 = 0;
                  long long v22 = objc_retainBlock(v48);
                  long long v23 = objc_opt_new();
                  v46[0] = _NSConcreteStackBlock;
                  v46[1] = 3221225472;
                  v46[2] = sub_10002A5B0;
                  v46[3] = &unk_1000950A8;
                  id v24 = v23;
                  id v47 = v24;
                  db_eval((uint64_t)"SELECT DISTINCT service FROM access WHERE client = ? AND client_xpc_type_t type = ?", v22, v46);
                  db_eval((uint64_t)"DELETE FROM access WHERE client = ? AND client_xpc_type_t type = ?", v22, 0);
                  db_eval((uint64_t)"VACUUM access", 0, 0);
                  long long v25 = p_inst_props[163];
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)int v55 = 138543362;
                    uint64_t v56 = v15;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Deleted entries for %{public}@", v55, 0xCu);
                  }
                  long long v44 = 0u;
                  long long v45 = 0u;
                  long long v42 = 0u;
                  long long v43 = 0u;
                  id v26 = v24;
                  id v27 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
                  if (v27)
                  {
                    id v28 = v27;
                    uint64_t v29 = *(void *)v43;
                    do
                    {
                      for (i = 0; i != v28; i = (char *)i + 1)
                      {
                        if (*(void *)v43 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                        __int16 v32 = [(id)qword_1000AC7B0 platform];
                        uid_t v33 = [v32 serviceByName:v31];

                        [(id)qword_1000AC7B0 publishAccessChangedEvent:3 forService:v33 client:v15 clientType:0 authValue:1 andKillClient:0];
                      }
                      id v28 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
                    }
                    while (v28);
                  }

                  __int16 v34 = [(id)qword_1000AC7B0 platform];
                  unsigned int v35 = [v34 removalOfAppBundleIdentifierRequiresPruning:v15];

                  if (v35) {
                    sub_100023ED8();
                  }
                  uint64_t v12 = v41 + 1;

                  p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
                  id v9 = v39;
                  id v11 = v40;
                  uint64_t v13 = v38;
                }
              }
              uint64_t v14 = (char *)v14 + 1;
            }
            while (v14 != v11);
            id v11 = [v9 countByEnumeratingWithState:&v50 objects:buf count:16];
          }
          while (v11);
          long long v4 = v36;
          id v2 = v37;
          if (v12) {
            access_changed();
          }
        }
      }
    }
    else
    {
      sub_100023ED8();
    }
  }
}

void sub_100024A08(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string && !strcmp(string, "com.apple.sockpuppet.applications.updated"))
  {
    id v3 = qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notification event: WatchKit applications updated.", v4, 2u);
    }
  }
}

void sub_100024A94(id a1)
{
  id v1 = qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Handling SIGTERM...", v2, 2u);
  }
  sub_100023990();
}

void sub_100024AFC(id a1, int a2)
{
  id v2 = qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling language change...", v3, 2u);
  }
  sub_100023990();
}

uint64_t sub_100024B64(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_100024B78(void *a1, void *a2, void *a3, uint64_t *a4, BOOL *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v103 = a3;
  *a5 = 0;
  if (a6) {
    uint64_t v13 = a6;
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = [v11 usageDescriptionKeyName];
  uint64_t v15 = [v11 usageDescriptionKeyForAuthorization:v13];
  if (v15)
  {
    uint64_t v16 = qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)unsigned int v106 = v15;
      *(_WORD *)&v106[8] = 2048;
      *(void *)v107 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "found auth specifc usage key: %@ for desired auth: %llu", buf, 0x16u);
    }
  }
  unsigned __int8 v17 = [v12 bundle];
  if (v17)
  {

    if (v14 | v15)
    {
      *a4 = 0;
      if (v15
        && ([v12 bundle],
            int v19 = objc_claimAutoreleasedReturnValue(),
            [v19 localizedUsageDescriptionForKey:v15],
            unsigned int v20 = objc_claimAutoreleasedReturnValue(),
            v19,
            v20))
      {
        id v102 = v20;
        *a4 = (uint64_t)v102;
        id v21 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *a4;
          *(_DWORD *)buf = 138412290;
          *(void *)unsigned int v106 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "found auth specifc usage string: %@", buf, 0xCu);
        }
      }
      else
      {
        id v102 = 0;
      }
      long long v23 = [v12 bundle];
      id v24 = [v23 localizedUsageDescriptionForKey:v14];

      long long v25 = qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)unsigned int v106 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "found general usage key: %@", buf, 0xCu);
      }
      if (v15 || !v24)
      {
        if (!*a4) {
          goto LABEL_28;
        }
      }
      else
      {
        id v26 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)unsigned int v106 = v24;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "using general usage key: %@", buf, 0xCu);
        }
        *a4 = (uint64_t)v24;
      }
      id v27 = (id)qword_1000AC518;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        if (v102) {
          uint64_t v60 = (void *)v15;
        }
        else {
          uint64_t v60 = (void *)v14;
        }
        id v97 = [v60 UTF8String];
        unsigned int v93 = [v12 responsiblePID];
        v101 = [v12 bundle];
        id v99 = [v101 bundleURL];
        id v61 = [v99 fileSystemRepresentation];
        uint64_t v62 = *a4;
        *(_DWORD *)buf = 136315906;
        *(void *)unsigned int v106 = v97;
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)v107 = v93;
        *(_WORD *)&v107[4] = 2080;
        *(void *)&v107[6] = v61;
        *(_WORD *)&v107[14] = 2112;
        *(void *)&v107[16] = v62;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Usage key:%s, client[%d](%s), usage string: '%@'", buf, 0x26u);
      }
      if (*a4) {
        goto LABEL_25;
      }
LABEL_28:
      uint64_t v104 = 0;
      uint64_t v18 = (uint64_t)[v12 getSDKVersion:&v104 platformType:(char *)&v104 + 4];
      if (!v18 && v24)
      {
        *a4 = (uint64_t)v24;
        uint64_t v29 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "falling back to general usage description because there was an error parsing client sdk version", buf, 2u);
        }
LABEL_25:
        uint64_t v18 = 1;
LABEL_26:

        goto LABEL_27;
      }
      v98 = v24;
      long long v30 = objc_msgSend(v11, "iOS_minimumSDKVersionNumber");
      uint64_t v31 = objc_msgSend(v11, "iOS_minimumSDKVersionNumberAuthSpecific");
      __int16 v32 = +[NSNumber numberWithUnsignedLongLong:v13];
      v100 = [v31 objectForKeyedSubscript:v32];

      __int16 v96 = v30;
      if (v30) {
        unsigned int v92 = [v30 unsignedIntValue];
      }
      else {
        unsigned int v92 = 655360;
      }
      uid_t v33 = [v11 name];
      unsigned int v34 = [v33 isEqualToString:@"kTCCServiceBluetoothAlways"];

      if (v34
        && (int active_platform = dyld_get_active_platform(),
            [v12 bundle],
            unsigned int v36 = objc_claimAutoreleasedReturnValue(),
            unsigned int v37 = [v36 isASKCapable],
            v36,
            v37))
      {
        id v24 = v98;
        p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
        if (active_platform != 11 && active_platform != 1) {
          goto LABEL_44;
        }
        id v39 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "binCompat ASK app found, using default usage description", buf, 2u);
        }
        id v40 = +[NSNumber numberWithUnsignedLong:-1];
        unsigned int v92 = [v40 unsignedIntValue];
      }
      else
      {
        id v24 = v98;
      }
      p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
LABEL_44:
      uint64_t v41 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
      {
        id v42 = (id) v14;
        os_log_t log = v41;
        id v43 = [v42 UTF8String];
        unsigned int v44 = [v12 responsiblePID];
        id v87 = [v12 bundle];
        id v45 = [v87 bundleURL];
        id v46 = [v45 fileSystemRepresentation];
        *(_DWORD *)buf = 136315650;
        *(void *)unsigned int v106 = v43;
        *(_WORD *)&v106[8] = 1024;
        *(_DWORD *)v107 = v44;
        id v24 = v98;
        *(_WORD *)&v107[4] = 2080;
        *(void *)&v107[6] = v46;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "No usage string found (key:%s) for client[%d] in bundle:%s", buf, 0x1Cu);

        p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props;
      }
      if (v18)
      {
        id v47 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG))
        {
          id v76 = (id) v14;
          uint64_t v77 = v47;
          id v88 = [v76 UTF8String];
          unsigned int v78 = [v12 responsiblePID];
          os_log_t loga = [v12 bundle];
          id v79 = [loga bundleURL];
          id v80 = [v79 fileSystemRepresentation];
          *(_DWORD *)buf = 136316162;
          *(void *)unsigned int v106 = v88;
          *(_WORD *)&v106[8] = 1024;
          *(_DWORD *)v107 = v92;
          *(_WORD *)&v107[4] = 1024;
          *(_DWORD *)&v107[6] = v78;
          id v24 = v98;
          *(_WORD *)&v107[10] = 2080;
          *(void *)&v107[12] = v80;
          *(_WORD *)&v107[20] = 1024;
          *(_DWORD *)&v107[22] = v104;
          _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "Usage key:%s service sdk version: 0x%x;  client[%d](%s) sdk version: 0x%x",
            buf,
            0x28u);

          p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
        }
        long long v48 = p_inst_props[163];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          int v49 = v48;
          unsigned int v50 = [v100 unsignedIntValue];
          *(_DWORD *)buf = 138412802;
          *(void *)unsigned int v106 = v24;
          *(_WORD *)&v106[8] = 1024;
          *(_DWORD *)v107 = v50;
          *(_WORD *)&v107[4] = 1024;
          *(_DWORD *)&v107[6] = v104;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "usage description: %@, minSDKVersionAuthSpecific: 0x%x, client_sdk_verison: 0x%x", buf, 0x18u);

          p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SYChange + 56);
        }
        if (v24)
        {
          if (![v100 unsignedIntValue]
            || (unsigned int v51 = v104,
                BOOL v52 = v51 >= [v100 unsignedIntValue],
                p_inst_props = &OBJC_PROTOCOL___SYChange.inst_props,
                !v52))
          {
            long long v53 = p_inst_props[163];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "No auth specific usage string, falling back to general usage string", buf, 2u);
            }
            id v54 = p_inst_props[163];
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              int v55 = v54;
              unsigned int v56 = [v100 unsignedIntValue];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)unsigned int v106 = v56;
              *(_WORD *)&v106[4] = 1024;
              *(_DWORD *)&v106[6] = v104;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "minSDKVersionAuthSpecific: 0x%x, client_sdk_version: 0x%x", buf, 0xEu);
            }
            *a4 = (uint64_t)v24;

            goto LABEL_25;
          }
        }
        BOOL v52 = v104 >= v92;
        *a5 = v104 >= v92;
        if (!v52)
        {
          __int16 v57 = [v11 secondaryUsageDescriptionKeyName];

          if (v57)
          {
            id v58 = [v12 bundle];
            unsigned int v59 = [v58 localizedUsageDescriptionForKey:v57];

            if (v59) {
              *a4 = (uint64_t)v59;
            }
            else {
              *a5 = v104 >> 17 > 4;
            }
            __int16 v75 = (void *)qword_1000AC518;
            if (!os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG))
            {
              id v24 = v59;
              uint64_t v14 = (uint64_t)v57;
              goto LABEL_80;
            }
            v98 = v59;
            uint64_t v14 = v57;
            v95 = v75;
            id v81 = [(id)v14 UTF8String];
            unsigned int v82 = [v12 responsiblePID];
            v83 = [v12 bundle];
            id v84 = [v83 bundleURL];
            id v85 = [v84 fileSystemRepresentation];
            uint64_t v86 = *a4;
            *(_DWORD *)buf = 136316418;
            *(void *)unsigned int v106 = v81;
            *(_WORD *)&v106[8] = 1024;
            *(_DWORD *)v107 = 655360;
            *(_WORD *)&v107[4] = 1024;
            *(_DWORD *)&v107[6] = v82;
            *(_WORD *)&v107[10] = 2080;
            *(void *)&v107[12] = v85;
            *(_WORD *)&v107[20] = 1024;
            *(_DWORD *)&v107[22] = v104;
            *(_WORD *)&v107[26] = 2112;
            *(void *)&v107[28] = v86;
            _os_log_debug_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "Secondary Usage key:%s service sdk version: 0x%x;  client[%d](%s) sdk version: 0x%x: usage string: '%@'",
              buf,
              0x32u);
          }
          else
          {
            if (![v11 shouldUseADefaultDescriptionString])
            {
              uint64_t v14 = 0;
              goto LABEL_80;
            }
            v63 = [v11 name];
            id v64 = +[NSString stringWithFormat:@"REQUEST_DEFAULT_PURPOSE_STRING_SERVICE_%@", v63];

            id v65 = &stru_100096EC0;
            os_log_t v94 = [v103 localizedStringForKey:v64 value:&stru_100096EC0 table:0];
            if (&_MGGetStringAnswer)
            {
              uint64_t v66 = MGGetStringAnswer();
              id v67 = @"device";
              if (v66) {
                id v67 = (__CFString *)v66;
              }
              id v65 = v67;
            }
            id v68 = [v12 displayName];
            *a4 = +[NSString stringWithValidatedFormat:v94, @"%@ %@", 0, v68, v65 validFormatSpecifiers error];

            id v69 = (void *)qword_1000AC518;
            if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
            {
              logb = v69;
              unsigned int v70 = [v12 responsiblePID];
              id v71 = [v12 bundle];
              id v72 = [v71 bundleURL];
              id v73 = [v72 fileSystemRepresentation];
              uint64_t v74 = *a4;
              *(_DWORD *)buf = 138544386;
              *(void *)unsigned int v106 = v64;
              *(_WORD *)&v106[8] = 1024;
              *(_DWORD *)v107 = v70;
              *(_WORD *)&v107[4] = 2082;
              *(void *)&v107[6] = v73;
              *(_WORD *)&v107[14] = 1024;
              *(_DWORD *)&v107[16] = v104;
              *(_WORD *)&v107[20] = 2114;
              *(void *)&v107[22] = v74;
              _os_log_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_INFO, "Per-App Default Purpose String key: %{public}@, client[%d](%{public}s) sdk version: 0x%x: usage string: '%{public}@'", buf, 0x2Cu);
            }
            uint64_t v14 = 0;
          }
          id v24 = v98;
        }
      }
LABEL_80:

      goto LABEL_26;
    }
  }
  *a4 = 0;
  uint64_t v18 = 1;
LABEL_27:

  return v18;
}

void sub_100025778(id a1)
{
  Class v1 = off_1000AC2F0();
  if (v1)
  {
    id v2 = [(objc_class *)v1 sharedManager];
    if (v2)
    {
      id v4 = v2;
      id v3 = [v2 currentUser];
      dword_1000AC530 = [v3 userType] == (id)1;
    }
  }
}

Class sub_100025804()
{
  if (!qword_1000AC548) {
    qword_1000AC548 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  }
  Class result = objc_getClass("UMUserManager");
  qword_1000AC540 = (uint64_t)result;
  off_1000AC2F0 = (uint64_t (*)())sub_100025868;
  return result;
}

id sub_100025868()
{
  return (id)qword_1000AC540;
}

void sub_100025874(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [[TCCDAttributionChain alloc] initWithMessage:v3];
  int v6 = [(TCCDAttributionChain *)v5 requestingProcess];
  id v7 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
  id v23 = 0;
  id v8 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v23];
  id v9 = v23;
  if (v8)
  {
    if ([(id)qword_1000AC7B0 canProcess:v6 callFunction:v7 forService:v8 withAccessIdentity:0])
    {
      BOOL v10 = xpc_dictionary_get_BOOL(v3, "override");
      uint64_t v19 = 0;
      unsigned int v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      if (v10 && qword_1000AC510 && [(id)qword_1000AC510 isSyncingEnabled])
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100029328;
        v17[3] = &unk_1000950A8;
        id v18 = v8;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1000293A8;
        v16[3] = &unk_1000951B8;
        void v16[4] = &v19;
        db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", v17, v16);
      }
      if (!db_set_access_override(v8, v10, (void *)qword_1000AC7B0))
      {
        xpc_dictionary_set_BOOL(v4, "result", 1);
        if (qword_1000AC510)
        {
          if ([(id)qword_1000AC510 isSyncingEnabled])
          {
            if (v10) {
              uint64_t v13 = *((unsigned __int8 *)v20 + 24);
            }
            else {
              uint64_t v13 = 2;
            }
            uint64_t v14 = (void *)qword_1000AC510;
            uint64_t v15 = [v8 name];
            [v14 syncOverrideUpdateForServiceIdentifier:v15 updateType:v13];
          }
        }
      }
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    id v11 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v11 forError:v9 contextString:0];
    id v12 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10005D31C();
    }
  }
}

void sub_100025B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025B7C(void *a1)
{
  id v1 = a1;
  +[NSMutableArray array];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000293D0;
  v4[3] = &unk_1000950A8;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v2;
  if (!db_eval((uint64_t)"SELECT service FROM access_overrides", 0, v4))
  {
    id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v3)
    {
      xpc_dictionary_set_value(v1, "overrides", v3);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR))
    {
      sub_10005D404();
    }
  }
}

void sub_100025C8C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uuid = xpc_dictionary_get_uuid(v3, "policy");
  string = xpc_dictionary_get_string(v3, "display");
  if (uuid)
  {
    id v7 = string;
    if (string)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      xpc_dictionary_get_audit_token();
      pid_t pidp = 0;
      memset(atoken, 0, 32);
      audit_token_to_au32((audit_token_t *)atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
      *(_OWORD *)audit_token_t atoken = v18;
      *(_OWORD *)&atoken[16] = v19;
      if (sub_100029440(atoken))
      {
        id v8 = [[TCCDAttributionChain alloc] initWithMessage:v3];
        id v9 = [[TCCDAccessIdentity alloc] initWithAttributionChain:v8 preferMostSpecificIdentifier:1];
        BOOL v10 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
        {
          id v11 = v10;
          id v12 = [(TCCDAccessIdentity *)v9 identifier];
          *(_DWORD *)audit_token_t atoken = 138544130;
          *(void *)&atoken[4] = v12;
          *(_WORD *)&atoken[12] = 1040;
          *(_DWORD *)&atoken[14] = 16;
          *(_WORD *)&atoken[18] = 2096;
          *(void *)&atoken[20] = uuid;
          *(_WORD *)&atoken[28] = 2082;
          *(void *)&atoken[30] = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "AccessDeclarePolicy() for %{public}@ policy: %{uuid_t}.16P; display: '%{public}s'",
            atoken,
            0x26u);
        }
        uint64_t v13 = [(TCCDAccessIdentity *)v9 bundle];
        id v14 = [v13 bundleIdentifier];
        id v15 = [v14 UTF8String];

        if (v15)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000294DC;
          v16[3] = &unk_1000957E8;
          void v16[4] = uuid;
          void v16[5] = v15;
          v16[6] = v7;
          if (!db_eval((uint64_t)"INSERT OR REPLACE INTO policies (bundle_id, uuid, display) VALUES (?, ?, ?)", v16, 0))xpc_dictionary_set_BOOL(v4, "result", 1); {
        }
          }
      }
    }
  }
}

void sub_100025F20(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uuid = xpc_dictionary_get_uuid(v3, "policy");
  string = xpc_dictionary_get_string(v3, "bundle_id");
  if (uuid)
  {
    id v7 = string;
    if (string)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      xpc_dictionary_get_audit_token();
      memset(buf, 0, 32);
      if (sub_100029440(buf))
      {
        id v8 = [[TCCDAttributionChain alloc] initWithMessage:v3];
        id v9 = [[TCCDAccessIdentity alloc] initWithAttributionChain:v8 preferMostSpecificIdentifier:1];
        BOOL v10 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
        {
          id v11 = v10;
          id v12 = [(TCCDAccessIdentity *)v9 identifier];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v12;
          *(_WORD *)&buf[12] = 1040;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2096;
          *(void *)&buf[20] = uuid;
          *(_WORD *)&buf[28] = 2082;
          *(void *)&buf[30] = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SelectPolicyForExtensionWithIdentifier() for %{public}@ policy: %{uuid_t}.16P; bundle_id: '%{public}s",
            buf,
            0x26u);
        }
        uint64_t v13 = [(TCCDAccessIdentity *)v9 bundle];
        id v14 = [v13 bundleIdentifier];
        id v15 = [v14 UTF8String];

        if (v15)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x2020000000;
          buf[24] = 0;
          v17[0] = 0;
          v17[1] = v17;
          v17[2] = 0x2020000000;
          v17[3] = 0;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000295AC;
          v16[3] = &unk_100095860;
          v16[6] = uuid;
          void v16[7] = v15;
          void v16[4] = v17;
          void v16[5] = buf;
          v16[8] = v7;
          if (!db_transaction(v16)) {
            xpc_dictionary_set_BOOL(v4, "result", *(unsigned char *)(*(void *)&buf[8] + 24));
          }
          _Block_object_dispose(v17, 8);
          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
}

void sub_1000261C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000261EC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = xpc_dictionary_get_value(v3, "exceptions");
  int v6 = v5;
  if (v5)
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      xpc_dictionary_get_audit_token();
      *(_OWORD *)buf = 0u;
      long long v22 = 0u;
      if (sub_100029440(buf))
      {
        id v7 = [[TCCDAttributionChain alloc] initWithMessage:v3];
        id v8 = [[TCCDAccessIdentity alloc] initWithAttributionChain:v7 preferMostSpecificIdentifier:1];
        id v9 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_INFO))
        {
          BOOL v10 = v9;
          uint64_t v11 = [(TCCDAccessIdentity *)v8 identifier];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ResetPoliciesExcept() for %{public}@", buf, 0xCu);
        }
        id v12 = [(TCCDAccessIdentity *)v8 bundle];
        id v13 = [v12 bundleIdentifier];
        id v14 = [v13 UTF8String];

        if (v14)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100029888;
          v16[3] = &unk_1000958E8;
          id v17 = v6;
          id v18 = v14;
          int v15 = db_transaction(v16);
          access_changed();
          if (!v15) {
            xpc_dictionary_set_BOOL(v4, "result", 1);
          }
        }
      }
    }
  }
}

void sub_100026428(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v3];
  int v6 = [(TCCDAttributionChain *)v5 requestingProcess];
  id v7 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
  id v23 = 0;
  id v8 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v23];
  id v9 = v23;
  if (v8)
  {
    if ([(id)qword_1000AC7B0 canProcess:v6 callFunction:v7 forService:v8 withAccessIdentity:0])
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x3032000000;
      long long v20 = sub_10000F8C4;
      uint64_t v21 = sub_10000F874;
      id v22 = xpc_array_create(0, 0);
      if (v18[5])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100029AF8;
        v15[3] = &unk_1000950A8;
        id v16 = v8;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100029B78;
        v12[3] = &unk_100095910;
        id v13 = v16;
        id v14 = &v17;
        if (!db_eval((uint64_t)"SELECT client, client_type, csreq, last_modified, expired_at FROM expired WHERE service = ?", v15, v12))xpc_dictionary_set_value(v4, "clients", (xpc_object_t)v18[5]); {
      }
        }
      _Block_object_dispose(&v17, 8);
    }
  }
  else
  {
    BOOL v10 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v10 forError:v9 contextString:0];
    uint64_t v11 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10005D46C();
    }
  }
}

void sub_1000266D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000266F0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v3];
  int v6 = [(TCCDAttributionChain *)v5 requestingProcess];
  id v7 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
  id v26 = 0;
  id v8 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v26];
  id v9 = v26;
  if (!v8)
  {
    BOOL v10 = (TCCDAccessIdentity *)objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v10 forError:v9 contextString:0];
    id v14 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10005D4E0();
    }
    goto LABEL_24;
  }
  if (xpc_dictionary_get_string(v3, "client"))
  {
    xpc_object_t xdict = v4;
    BOOL v10 = [[TCCDAccessIdentity alloc] initWithMessage:v3];
    id v11 = [(TCCDAccessIdentity *)v10 identifier];
    id v12 = [v11 UTF8String];

    if (v12
      && [(id)qword_1000AC7B0 canProcess:v6 callFunction:v7 forService:v8 withAccessIdentity:v10])
    {
      id v13 = [(TCCDAccessIdentity *)v10 identifier];
      goto LABEL_11;
    }
    id v4 = xdict;
  }
  else
  {
    BOOL v10 = 0;
    if ([(id)qword_1000AC7B0 canProcess:v6 callFunction:v7 forService:v8 withAccessIdentity:0])
    {
      xpc_object_t xdict = v4;
      id v13 = @"kTCCClientAll";
LABEL_11:
      unsigned int v23 = [(TCCDAccessIdentity *)v10 client_type];
      id v15 = v8;
      id v14 = v13;
      id v24 = v15;
      id v16 = [v15 name];
      LODWORD(v15) = [v16 isEqualToString:@"kTCCServiceAll"];

      unsigned int v17 = [v14 isEqualToString:@"kTCCClientAll"];
      if (v15)
      {
        if (v17)
        {
          int v18 = db_transaction(&stru_100095950);
        }
        else
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_100029E94;
          v33[3] = &unk_1000959A0;
          unsigned int v34 = v14;
          unsigned int v35 = v23;
          int v18 = db_transaction(v33);
        }
        uint64_t v19 = v24;
        if (v18)
        {
LABEL_18:

          id v4 = xdict;
LABEL_24:

          goto LABEL_25;
        }
      }
      else
      {
        if (v17)
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_100029FBC;
          v31[3] = &unk_1000959C8;
          uint64_t v19 = v24;
          id v32 = v24;
          int v20 = db_transaction(v31);
          uint64_t v21 = v32;
        }
        else
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10002A0D4;
          v27[3] = &unk_100095A18;
          uint64_t v19 = v24;
          id v28 = v24;
          uint64_t v29 = v14;
          unsigned int v30 = v23;
          int v20 = db_transaction(v27);

          uint64_t v21 = v28;
        }

        if (v20) {
          goto LABEL_18;
        }
      }
      db_eval((uint64_t)"VACUUM expired", 0, 0);
      id v22 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG)) {
        sub_10005D554(v22, v19);
      }

      id v4 = xdict;
      xpc_dictionary_set_BOOL(xdict, "result", 1);
      goto LABEL_24;
    }
  }
LABEL_25:
}

void sub_100026B28(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!has_private_tcc_entitlement(v3, @"com.apple.private.tcc.manager.service-descriptions", 1))
  {
    id v14 = 0;
    [(id)qword_1000AC7B0 makeError:&v14 withCode:5 infoText:0];
    id v6 = v14;
    BOOL v10 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v10 forError:v6 contextString:0];
    id v11 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10005D670();
    }
    goto LABEL_22;
  }
  id v5 = [(id)qword_1000AC7B0 platform];
  id v6 = [v5 name];

  string = xpc_dictionary_get_string(v3, "platform_name");
  if (!string)
  {
LABEL_19:
    BOOL v10 = +[TCCDService serviceDescriptionsForPlatformName:v6];
    id v11 = _CFXPCCreateXPCObjectFromCFObject();
    if (v11) {
      xpc_dictionary_set_value(v4, "service_descriptions", v11);
    }
    xpc_dictionary_set_BOOL(v4, "result", v11 != 0);
LABEL_22:

    goto LABEL_23;
  }
  id v8 = string;
  if (!strncmp(string, "macos", 5uLL))
  {
    id v12 = &TCCDPlatformNameMacOS;
LABEL_17:
    CFStringRef v13 = *v12;
LABEL_18:

    id v6 = (id)v13;
    goto LABEL_19;
  }
  if (!strncmp(v8, "ios", 3uLL))
  {
    id v12 = &TCCDPlatformNameIOS;
    goto LABEL_17;
  }
  if (!strncmp(v8, "watchos", 7uLL))
  {
    id v12 = &TCCDPlatformNameWatchOS;
    goto LABEL_17;
  }
  if (!strncmp(v8, "tvos", 4uLL))
  {
    id v12 = &TCCDPlatformNameTVOS;
    goto LABEL_17;
  }
  if (!strncmp(v8, "all", 3uLL))
  {
    CFStringRef v13 = @"all";
    goto LABEL_18;
  }
  id v9 = [(id)qword_1000AC7B0 logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10005D608();
  }

  xpc_dictionary_set_BOOL(v4, "result", 0);
LABEL_23:
}

void sub_100026DA8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "operation");
  id v6 = [[TCCDAttributionChain alloc] initWithMessage:v3];
  id v7 = [(TCCDAttributionChain *)v6 requestingProcess];
  if ([(id)qword_1000AC7B0 canProcess:v7 callFunction:0 forService:0 withAccessIdentity:0])
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG)) {
      sub_10005D9FC();
    }
    if (!strncmp(string, "TestDBAbort", 0xBuLL))
    {
      id v8 = qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG)) {
        sub_10005D6E4(v8);
      }
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      BOOL v10 = dispatch_get_global_queue(0, 0);
      dispatch_after(v9, v10, &stru_100095A38);
LABEL_33:

LABEL_68:
      BOOL v24 = 1;
      goto LABEL_69;
    }
    if (strncmp(string, "TestDatabaseDescription", 0x17uLL))
    {
      if (!strncmp(string, "TestToggleDoComposition", 0x17uLL))
      {
        objc_msgSend((id)qword_1000AC7B0, "setTestDoComposition:", xpc_dictionary_get_BOOL(v3, "arg1"));
        xpc_dictionary_set_BOOL(v4, "test_do_composition", (BOOL)[(id)qword_1000AC7B0 testDoComposition]);
        goto LABEL_68;
      }
      if (!strncmp(string, "SyncFull", 8uLL))
      {
        if (qword_1000AC510)
        {
          [(id)qword_1000AC510 testMainResetSync];
          goto LABEL_68;
        }
      }
      else
      {
        if (!strncmp(string, "SyncPromptForWatchApp", 0x15uLL))
        {
          id v14 = xpc_dictionary_get_string(v3, "arg1");
          id v15 = xpc_dictionary_get_string(v3, "arg2");
          id v16 = [(id)qword_1000AC7B0 platform];
          unsigned int v17 = +[NSString stringWithUTF8String:v15];
          int v18 = [v16 serviceByName:v17];

          uint64_t v19 = [TCCDRequestContext alloc];
          int v20 = +[NSString stringWithUTF8String:v14];
          id v21 = [(TCCDRequestContext *)v19 initForSyncRequestForSubjectBundleIdentifier:v20 service:v18];

          if (v21)
          {
            buf[0] = 0;
            id v22 = sub_10000DAD4(v21, (uint64_t)buf);
            unsigned int v23 = [v22 error];

            BOOL v24 = v23 == 0;
            if (v23)
            {
              long long v25 = (void *)qword_1000AC7A8;
              if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
                sub_10005D764(v25);
              }
            }

            goto LABEL_65;
          }
          goto LABEL_64;
        }
        if (!strncmp(string, "SyncStatus", 0xAuLL))
        {
          if (qword_1000AC508)
          {
            [(id)qword_1000AC508 testSyncStatus];
            goto LABEL_68;
          }
        }
        else if (!strncmp(string, "SyncSet", 7uLL))
        {
          if (qword_1000AC508)
          {
            [(id)qword_1000AC508 testSyncSet:v3];
            goto LABEL_68;
          }
        }
        else
        {
          if (strncmp(string, "SyncMemoryPressureCritical", 0x1AuLL))
          {
            if (strncmp(string, "SetGenerateBacktraceOnPrompt", 0x1CuLL))
            {
              if (!strncmp(string, "PruneDB", 7uLL))
              {
                sub_100023ED8();
                goto LABEL_68;
              }
              if (strncmp(string, "pstate-get", 0xAuLL)
                && strncmp(string, "pstate-set", 0xAuLL)
                && strncmp(string, "pstate-reset", 0xCuLL))
              {
                if (strncmp(string, "show-alert", 0xAuLL))
                {
                  if (!strncmp(string, "LogFDs", 6uLL))
                  {
                    log_open_file_descriptors();
                    goto LABEL_68;
                  }
                  if (!strncmp(string, "ExhaustFDs", 0xAuLL))
                  {
                    CFStringRef v13 = dispatch_get_global_queue(0, 0);
                    dispatch_async(v13, &stru_100095A98);
                    goto LABEL_35;
                  }
                  if (!strncmp(string, "SetReminderCooldownPeriod", 0x19uLL))
                  {
                    int64_t int64 = xpc_dictionary_get_int64(v3, "arg1");
                    int64_t v40 = xpc_dictionary_get_int64(v3, "arg2");
                    uint64_t v41 = [(id)qword_1000AC7B0 logHandle];
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134349312;
                      int64_t v76 = int64;
                      __int16 v77 = 2050;
                      uint64_t v78 = v40;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "SetReminderCooldownPeriod, system: %{public}llu, service: %{public}llu", buf, 0x16u);
                    }

                    id v42 = [(id)qword_1000AC7B0 reminderMonitor];
                    [v42 setReminderCooldownPeriod:int64 with:v40];

                    goto LABEL_68;
                  }
                  if (!strncmp(string, "GetReminderCooldownPeriod", 0x19uLL))
                  {
                    id v46 = [(id)qword_1000AC7B0 logHandle];
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                    {
                      id v47 = [(id)qword_1000AC7B0 reminderMonitor];
                      [v47 systemCooldown];
                      uint64_t v49 = (uint64_t)v48;
                      unsigned int v50 = [(id)qword_1000AC7B0 reminderMonitor];
                      [v50 serviceCooldown];
                      *(_DWORD *)buf = 134349312;
                      int64_t v76 = v49;
                      __int16 v77 = 2050;
                      uint64_t v78 = (uint64_t)v51;
                      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "GetReminderCooldownPeriod, system: %{public}llu, service: %{public}llu", buf, 0x16u);
                    }
                    BOOL v52 = [(id)qword_1000AC7B0 reminderMonitor];
                    [v52 systemCooldown];
                    xpc_dictionary_set_int64(v4, "systemReminderCooldown", (uint64_t)v53);

                    CFStringRef v13 = [(id)qword_1000AC7B0 reminderMonitor];
                    [v13 serviceCooldown];
                    int64_t v55 = (uint64_t)v54;
                    unsigned int v56 = "serviceReminderCooldown";
LABEL_103:
                    xpc_dictionary_set_int64(v4, v56, v55);
                    goto LABEL_35;
                  }
                  if (strncmp(string, "accessSetPrompt", 0xFuLL))
                  {
                    if (!strncmp(string, "TestDatabaseCorrupt", 0x13uLL))
                    {
                      int v58 = xpc_dictionary_get_int64(v3, "arg1");
                      int v59 = db_test_corrupt(v58);
                      xpc_dictionary_set_int64(v4, "result_type", v59);
                      BOOL v24 = v59 == 0;
                      goto LABEL_69;
                    }
                    if (strncmp(string, "GetIndirectRequestsOutstanding", 0x1EuLL))
                    {
                      if (!strncmp(string, "SurfaceIndirectOutstandingAlert", 0x1FuLL))
                      {
                        v63 = [(id)qword_1000AC7B0 logHandle];
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "SurfaceIndirectOutstandingAlert", buf, 2u);
                        }

                        BOOL v10 = [(id)qword_1000AC7B0 platform];
                        +[TCCDTapToRadar surfaceIndirectAlert:(int)[v10 indirectRequestsOutstanding]];
                      }
                      else
                      {
                        if (strncmp(string, "SetIndrectRequesetsOutstanding", 0x1EuLL))
                        {
                          if (strncmp(string, "incomingSyncAuth", 0x10uLL))
                          {
                            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
                              sub_10005D994();
                            }
                            goto LABEL_50;
                          }
                          uint64_t v66 = xpc_dictionary_get_string(v3, "arg1");
                          id v67 = xpc_dictionary_get_string(v3, "arg2");
                          uint64_t uint64 = xpc_dictionary_get_uint64(v3, "arg3");
                          int64_t v69 = xpc_dictionary_get_int64(v3, "arg4");
                          unsigned int v70 = [TCCDSyncUpdateAccessAction alloc];
                          id v71 = +[NSString stringWithUTF8String:v66];
                          id v72 = +[NSString stringWithUTF8String:v67];
                          int v18 = [(TCCDSyncClientAccessAction *)v70 initWithServiceIdentifier:v71 mainClientIdentifier:v72 replicaClientIdentifier:0 clientType:uint64];

                          BOOL v24 = v18 != 0;
                          if (v18)
                          {
                            [(TCCDSyncUpdateAccessAction *)v18 setUpdateAccessActionStatus:+[TCCDSyncUpdateAccessAction accessUpdateStatusForAuthorizationRight:v69 forMain:0]];
                            [(TCCDSyncUpdateAccessAction *)v18 updateDatabase:1 killClient:0];
                          }
                          else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
                          {
                            sub_10005D960();
                          }
LABEL_66:

                          goto LABEL_69;
                        }
                        int64_t v64 = xpc_dictionary_get_int64(v3, "arg1");
                        id v65 = [(id)qword_1000AC7B0 logHandle];
                        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 67240192;
                          LODWORD(v76) = v64;
                          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "SetIndrectRequesetsOutstanding, requests: %{public}d", buf, 8u);
                        }

                        BOOL v10 = [(id)qword_1000AC7B0 platform];
                        [v10 setIndirectRequestsOutstanding:v64];
                      }
                      goto LABEL_33;
                    }
                    uint64_t v60 = [(id)qword_1000AC7B0 logHandle];
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      id v61 = [(id)qword_1000AC7B0 platform];
                      *(_DWORD *)buf = 134349056;
                      int64_t v76 = (int)[v61 indirectRequestsOutstanding];
                      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "GetIndirectRequestsOutstanding, indirect reuqests outstanding: %{public}llu", buf, 0xCu);
                    }
                    CFStringRef v13 = [(id)qword_1000AC7B0 platform];
                    int64_t v55 = (int)[v13 indirectRequestsOutstanding];
                    unsigned int v56 = "indirectRequestsOutstanding";
                    goto LABEL_103;
                  }
                  __int16 v57 = [(id)qword_1000AC7B0 logHandle];
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315138;
                    int64_t v76 = (int64_t)"handle_TCCTestInternal";
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s accessSetPrompt", buf, 0xCu);
                  }

                  CFStringRef v13 = [(id)qword_1000AC7B0 logHandle];
                  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
                    goto LABEL_35;
                  }
                  *(_DWORD *)buf = 136315138;
                  int64_t v76 = (int64_t)"handle_TCCTestInternal";
                  id v28 = "%s not functional";
                  goto LABEL_55;
                }
                id v32 = xpc_dictionary_get_string(v3, "arg1");
                uid_t v33 = xpc_dictionary_get_string(v3, "arg2");
                if (v32)
                {
                  unsigned int v34 = +[NSString stringWithUTF8String:v32];
                }
                else
                {
                  unsigned int v34 = 0;
                }
                if (v33)
                {
                  unsigned int v35 = +[NSString stringWithUTF8String:v33];
                  unsigned int v36 = v35;
                  if (v34 && v35)
                  {
                    unsigned int v74 = [v35 isEqualToString:@"FirstPromptFor3Rights"];
                    if (v74)
                    {
                      int v37 = 1;
                      +[TCCDPlatform currentPlatform];
                    }
                    else
                    {
                      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
                        sub_10005D8F8();
                      }
                      int v37 = 0;
                      +[TCCDPlatform currentPlatform];
                    id v43 = };
                    uint64_t v38 = [v43 serviceByName:v34];

                    if (v38)
                    {
                      if (v74)
                      {
                        unsigned int v44 = [v38 alertManager];
                        id v45 = v44;
                        if (v44)
                        {
                          [v44 displayAlertForCondition:v73 withCustomUserInfo:0];
                        }
                        else
                        {
                          uint64_t v62 = qword_1000AC518;
                          if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543362;
                            int64_t v76 = (int64_t)v34;
                            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "show-alert: Service: %{public}@ has no alert manager.", buf, 0xCu);
                          }
                        }

                        int v37 = 1;
                      }
                      goto LABEL_89;
                    }
                    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
                      sub_10005D890();
                    }
LABEL_88:
                    uint64_t v38 = 0;
                    int v37 = 0;
LABEL_89:

                    BOOL v24 = v37 != 0;
                    goto LABEL_69;
                  }
                }
                else
                {
                  unsigned int v36 = 0;
                }
                if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
                  sub_10005D814();
                }
                goto LABEL_88;
              }
              int v18 = (TCCDSyncUpdateAccessAction *)xpc_dictionary_get_string(v3, "arg1");
              id v21 = (id)xpc_dictionary_get_string(v3, "arg2");
              int64_t v29 = xpc_dictionary_get_int64(v3, "arg3");
              if (v18)
              {
                int v18 = +[NSString stringWithUTF8String:v18];
              }
              if (v21)
              {
                id v21 = +[NSString stringWithUTF8String:v21];
              }
              if (!v18) {
                goto LABEL_64;
              }
              uint64_t v30 = [(TCCDSyncUpdateAccessAction *)v18 isEqualToString:@"PostUpgrade3RightAlert"];
              if (!strncmp(string, "pstate-get", 0xAuLL))
              {
                int value = db_persistent_state_get_value(v30, v21);
                xpc_dictionary_set_int64(v4, "pstate_value", value);
              }
              else if (!strncmp(string, "pstate-set", 0xAuLL))
              {
                db_persistent_state_set_value(v30, v21, v29);
              }
              else
              {
                if (strncmp(string, "pstate-reset", 0xCuLL))
                {
LABEL_64:
                  BOOL v24 = 0;
LABEL_65:

                  goto LABEL_66;
                }
                db_persistent_state_reset(v30, v21);
              }
              BOOL v24 = 1;
              goto LABEL_65;
            }
            BOOL v26 = xpc_dictionary_get_BOOL(v3, "arg1");
            [(id)qword_1000AC7B0 setGenerateBacktraceOnPrompt:v26];
            CFStringRef v13 = [(id)qword_1000AC7B0 logHandle];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              id v27 = "false";
              if (v26) {
                id v27 = "true";
              }
              *(_DWORD *)buf = 136446210;
              int64_t v76 = (int64_t)v27;
              id v28 = "Setting generateBacktraceOnPrompt: %{public}s";
LABEL_55:
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v28, buf, 0xCu);
            }
LABEL_35:

            goto LABEL_68;
          }
          if (qword_1000AC508)
          {
            [(id)qword_1000AC508 testMemoryPressureCritical];
            goto LABEL_68;
          }
        }
      }
LABEL_50:
      BOOL v24 = 0;
LABEL_69:
      xpc_dictionary_set_BOOL(v4, "result", v24);
      goto LABEL_70;
    }
    id v11 = [(id)qword_1000AC7B0 stateDumpDictionary];
    id v12 = [v11 description];

    CFStringRef v13 = v12;
    xpc_dictionary_set_string(v4, "description_string", (const char *)[v13 UTF8String]);
    goto LABEL_35;
  }
LABEL_70:
}

void sub_100027C7C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (has_private_tcc_entitlement(v3, @"com.apple.private.tcc.manager.get-identity-for-credential", 1))
  {
    id v5 = xpc_dictionary_get_value(v3, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
    id v6 = v5;
    if (!v5 || xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary)
    {
      id v17 = 0;
      [(id)qword_1000AC7B0 makeError:&v17 withCode:7 infoText:0];
      id v7 = v17;
      id v8 = (TCCDAttributionChain *)objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v8 forError:v7 contextString:0];
      dispatch_time_t v9 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005DA64();
      }
LABEL_6:

      goto LABEL_9;
    }
    if (xpc_dictionary_get_uint64(v6, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") != 1)
    {
      id v16 = 0;
      [(id)qword_1000AC7B0 makeError:&v16 withCode:3 infoText:0];
      id v7 = v16;
      id v8 = (TCCDAttributionChain *)objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v8 forError:v7 contextString:0];
      dispatch_time_t v9 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005DA64();
      }
      goto LABEL_6;
    }
    size_t length = 0;
    if (!xpc_dictionary_get_data(v6, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", &length) || length != 32)
    {
      id v14 = 0;
      [(id)qword_1000AC7B0 makeError:&v14 withCode:4 infoText:0];
      id v7 = v14;
      id v8 = (TCCDAttributionChain *)objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v8 forError:v7 contextString:0];
      dispatch_time_t v9 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005DA64();
      }
      goto LABEL_6;
    }
    id v8 = [[TCCDAttributionChain alloc] initWithMessage:v3];
    if (v8)
    {
      BOOL v10 = [[TCCDAccessIdentity alloc] initWithAttributionChain:v8 preferMostSpecificIdentifier:1];
      id v11 = v10;
      if (v10)
      {
        xpc_dictionary_set_uint64(v4, "TCCD_MSG_IDENTITY_TYPE_KEY", [(TCCDAccessIdentity *)v10 client_type]);
        id v12 = [(TCCDAccessIdentity *)v11 identifier];
        xpc_dictionary_set_string(v4, "TCCD_MSG_IDENTITY_ID_KEY", (const char *)[v12 UTF8String]);
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR))
      {
        sub_10005DB78();
      }
    }
    else
    {
      CFStringRef v13 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
        sub_10005DAD8(v13);
      }
    }
    id v7 = 0;
  }
  else
  {
    id v18 = 0;
    [(id)qword_1000AC7B0 makeError:&v18 withCode:5 infoText:0];
    id v7 = v18;
    id v6 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v6 forError:v7 contextString:0];
    id v8 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
      sub_10005DA64();
    }
  }
LABEL_9:
}

void sub_100028038(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [TCCDRequestContext alloc];
  id v40 = 0;
  id v6 = [(TCCDRequestContext *)v5 initWithRequestMessage:v3 forServer:qword_1000AC7B0 error:&v40];
  id v7 = v40;
  [(TCCDRequestContext *)v6 setInitialPrompt:0];
  if (v6)
  {
    id v8 = (void *)qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v8;
      dispatch_time_t v9 = [(TCCDRequestContext *)v6 messageIdentifier];
      BOOL v10 = [(TCCDRequestContext *)v6 functionName];
      id v11 = [(TCCDRequestContext *)v6 service];
      [v11 name];
      v12 = id v34 = v3;
      id v13 = v4;
      id v14 = [(TCCDRequestContext *)v6 queryCount];
      id v15 = [(TCCDRequestContext *)v6 clientDict];
      id v16 = [(TCCDRequestContext *)v6 daemonDict];
      *(_DWORD *)buf = 138544642;
      id v42 = v9;
      __int16 v43 = 2112;
      unsigned int v44 = v10;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 2048;
      id v48 = v14;
      id v4 = v13;
      __int16 v49 = 2112;
      unsigned int v50 = v15;
      __int16 v51 = 2112;
      BOOL v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "AUTHREQ_CTX: msgID=%{public}@, function=%@, service=%@, query=%llu, client_dict=%@, daemon_dict=%@", buf, 0x3Eu);

      id v3 = v34;
    }
    id v17 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
    id v39 = v7;
    id v18 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v39];
    id v19 = v39;

    if (v18)
    {
      id v20 = [v18 downgradeAuthRight];
      id v21 = (void *)qword_1000AC7B0;
      if (v20)
      {
        id v22 = [(TCCDRequestContext *)v6 attributionChain];
        unsigned int v23 = [v22 requestingProcess];
        unsigned __int8 v24 = [v21 canProcess:v23 callFunction:v17 forService:v18 withAccessIdentity:0];

        if (v24)
        {
          long long v25 = [TCCDAccessIdentity alloc];
          BOOL v26 = [(TCCDRequestContext *)v6 attributionChain];
          id v27 = [(TCCDRequestContext *)v6 service];
          id v28 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:](v25, "initWithAttributionChain:preferMostSpecificIdentifier:", v26, [v27 hasParanoidSecurityPolicy]);
          [(TCCDRequestContext *)v6 setSubjectIdentity:v28];

          int64_t v29 = [(id)qword_1000AC7B0 reminderMonitor];
          uint64_t v30 = [v29 reportResourceUsage:v6];

          if (v30)
          {
            xpc_dictionary_set_BOOL(v4, "result", 1);
LABEL_22:

            id v7 = v19;
            goto LABEL_23;
          }
          id v35 = v19;
          [(id)qword_1000AC7B0 makeError:&v35 withCode:8 infoText:0];
          id v31 = v35;

          uint64_t v30 = objc_opt_new();
          [(id)qword_1000AC7B0 buildErrorString:v30 forError:v31 contextString:0];
          id v32 = [(id)qword_1000AC7B0 logHandle];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10005DBF4();
          }
        }
        else
        {
          id v36 = v19;
          [(id)qword_1000AC7B0 makeError:&v36 withCode:5 infoText:0];
          id v31 = v36;

          uint64_t v30 = objc_opt_new();
          [(id)qword_1000AC7B0 buildErrorString:v30 forError:v31 contextString:0];
          id v32 = [(id)qword_1000AC7B0 logHandle];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10005DBF4();
          }
        }
      }
      else
      {
        id v37 = v19;
        [(id)qword_1000AC7B0 makeError:&v37 withCode:2 infoText:0];
        id v31 = v37;

        uint64_t v30 = objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v30 forError:v31 contextString:0];
        id v32 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10005DBF4();
        }
      }
    }
    else
    {
      id v38 = v19;
      [(id)qword_1000AC7B0 makeError:&v38 withCode:2 infoText:0];
      id v31 = v38;

      uint64_t v30 = objc_opt_new();
      [(id)qword_1000AC7B0 buildErrorString:v30 forError:v31 contextString:0];
      id v32 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10005DBF4();
      }
    }

    id v19 = v31;
    goto LABEL_22;
  }
  if (!v7) {
    id v7 = +[TCCDServer newErrorWithCode:6 format:@"Failed to create Request Context."];
  }
  id v17 = objc_opt_new();
  [(id)qword_1000AC7B0 buildErrorString:v17 forError:v7 contextString:0];
  id v18 = [(id)qword_1000AC7B0 logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10005DBF4();
  }
LABEL_23:
}

void sub_1000285F4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new();
  [v5 setPromptType:4];
  id v6 = qword_1000AC518;
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v96 = "handle_TCCSetAccessWithPrompt";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s begin", buf, 0xCu);
  }
  id v94 = 0;
  id v7 = [(id)qword_1000AC7B0 serviceFromMessage:v3 error:&v94];
  id v8 = v94;
  if (v7)
  {
    if (!_os_feature_enabled_impl()) {
      goto LABEL_6;
    }
    dispatch_time_t v9 = [(id)qword_1000AC7B0 platform];
    BOOL v10 = [v9 protectedAppManager];
    id v11 = [v7 name];
    unsigned __int8 v12 = [v10 authenticateForAccessToService:v11];

    if (v12)
    {
LABEL_6:
      id v88 = v5;
      id v13 = objc_alloc_init(TCCDRequestContext);
      [(TCCDRequestContext *)v13 setSpiVersion:2];
      [(TCCDRequestContext *)v13 setFunctionName:@"TCCAccessRequest"];
      [(TCCDRequestContext *)v13 setService:v7];
      [(TCCDRequestContext *)v13 setAccessSetPrompt:1];
      id v14 = [[TCCDAttributionChain alloc] initWithMessage:v3];
      id v15 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = v15;
        id v17 = [(TCCDAttributionChain *)v14 requestingProcess];
        *(_DWORD *)buf = 138412290;
        __int16 v96 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "requesting process; %@", buf, 0xCu);
      }
      id v18 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "function")];
      uint64_t v19 = qword_1000AC7B0;
      id v20 = [(TCCDAttributionChain *)v14 requestingProcess];
      uint64_t v86 = v18;
      LOBYTE(v19) = [(id)v19 canProcess:v20 callFunction:v18 forService:v7 withAccessIdentity:0];

      id v87 = v14;
      if ((v19 & 1) == 0)
      {
        id v92 = v8;
        [(id)qword_1000AC7B0 makeError:&v92 withCode:5 infoText:0];
        id v23 = v92;

        unsigned __int8 v24 = (TCCDAccessIdentity *)objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v24 forError:v23 contextString:0];
        long long v25 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10005DC68();
        }
        goto LABEL_17;
      }
      string = xpc_dictionary_get_string(v3, "client_type");
      id v22 = xpc_dictionary_get_string(v3, "client");
      if (strcmp(string, "bundle"))
      {
        id v91 = v8;
        [(id)qword_1000AC7B0 makeError:&v91 withCode:6 infoText:0];
        id v23 = v91;

        unsigned __int8 v24 = (TCCDAccessIdentity *)objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v24 forError:v23 contextString:0];
        long long v25 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10005DC68();
        }
        goto LABEL_17;
      }
      id v32 = [TCCDAccessIdentity alloc];
      uid_t v33 = +[NSString stringWithUTF8String:v22];
      unsigned __int8 v24 = [(TCCDAccessIdentity *)v32 initWithIdentifier:v33 type:0 executableURL:0 SDKVersion:0 platformType:0];

      id v34 = qword_1000AC518;
      if (!v24)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
          sub_10005DCDC(v34, v52, v53, v54, v55, v56, v57, v58);
        }
        id v90 = v8;
        [(id)qword_1000AC7B0 makeError:&v90 withCode:6 infoText:0];
        id v23 = v90;

        long long v25 = objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v25 forError:v23 contextString:0];
        int v59 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_10005DC68();
        }
        goto LABEL_61;
      }
      id v81 = v4;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = v34;
        id v36 = [(TCCDRequestContext *)v13 subjectIdentity];
        id v37 = [v36 identifier];
        *(_DWORD *)buf = 138412290;
        __int16 v96 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "context.subjectIdentity.identifier: %@", buf, 0xCu);
      }
      [(TCCDRequestContext *)v13 setSubjectIdentity:v24];
      uint64_t uint64 = xpc_dictionary_get_uint64(v3, "desired_auth_value");
      [(TCCDRequestContext *)v13 setDesiredAuth:uint64];
      long long v25 = [v7 settingsRequestFullTitleTextLocalizationKey];
      uint64_t v83 = uint64;
      uint64_t v85 = [v7 buttonTitleLocalizationKeyForAuthorization:uint64 desiredAuth:uint64];
      id v84 = [v7 cancelButtontitleLocalizationKey];
      id v39 = (void *)qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = v39;
        uint64_t v41 = [v7 name];
        *(_DWORD *)buf = 136315906;
        __int16 v96 = "handle_TCCSetAccessWithPrompt";
        __int16 v97 = 2048;
        uint64_t v98 = 1;
        __int16 v99 = 2048;
        uint64_t v100 = v83;
        __int16 v101 = 2112;
        id v102 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s currentAuth: %llu desiredAuth: %llu, got auth choices for service %@", buf, 0x2Au);
      }
      id v42 = qword_1000AC518;
      if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        __int16 v96 = 0;
        __int16 v97 = 2048;
        uint64_t v98 = v83;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "aButtonAuth: %llu bButtonAuth: %llu", buf, 0x16u);
      }
      __int16 v43 = [(TCCDRequestContext *)v13 service];
      unsigned int v44 = [v43 localizedTextWithKey:v84];

      __int16 v45 = [(TCCDRequestContext *)v13 service];
      unsigned int v82 = [v45 localizedTextWithKey:v85];

      uint64_t v46 = [v7 localizedTextWithKey:v25];
      id v80 = (void *)v46;
      if (!v46)
      {
        __int16 v49 = tcc_access_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v96 = (const char *)v7;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Could not find localized string for service: %@", buf, 0xCu);
        }
        id v4 = v81;
        goto LABEL_60;
      }
      id v79 = v44;
      uint64_t v47 = v46;
      id v48 = [(TCCDAccessIdentity *)v24 displayName];
      __int16 v49 = +[NSString stringWithValidatedFormat:v47, @"%@", 0, v48 validFormatSpecifiers error];

      if (!v49)
      {
        uint64_t v60 = tcc_access_log();
        id v4 = v81;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v96 = (const char *)v7;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Could not find localized request string for service: %@", buf, 0xCu);
        }

        unsigned int v44 = v79;
        goto LABEL_60;
      }
      uint64_t v78 = v49;
      -[TCCDRequestContext presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAuth:currentAuth:updatingResult:](v13, "presentSynchronousPromptWithHeader:message:aButtonTitle:aButtonAuth:bButtonTitle:bButtonAuth:cButtonTitle:cButtonAuth:currentAuth:updatingResult:", 0, 1, 1, v88);
      unsigned int v50 = tcc_access_log();
      id v4 = v81;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v96 = "handle_TCCSetAccessWithPrompt";
        __int16 v97 = 2112;
        uint64_t v98 = (uint64_t)v88;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s: result %@", buf, 0x16u);
      }

      if (!v88)
      {
        id v89 = v8;
        [(id)qword_1000AC7B0 makeError:&v89 withCode:8 infoText:0];
        id v61 = v89;

        uint64_t v62 = objc_opt_new();
        [(id)qword_1000AC7B0 buildErrorString:v62 forError:v61 contextString:0];
        v63 = [(id)qword_1000AC7B0 logHandle];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          sub_10005DC68();
        }

        id v8 = v61;
        goto LABEL_59;
      }
      if ([v88 databaseAction] != (id)1 || !objc_msgSend(v88, "authorizationValue"))
      {
LABEL_55:
        id v67 = (void *)qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t loga = v67;
          __int16 v75 = [(TCCDRequestContext *)v13 messageIdentifier];
          id v74 = [v88 authorizationValue];
          id v73 = [v88 authorizationReason];
          id v72 = [v88 authorizationVersion];
          id v68 = [v88 error];
          *(_DWORD *)buf = 138544386;
          __int16 v96 = v75;
          __int16 v97 = 2048;
          uint64_t v98 = (uint64_t)v74;
          __int16 v99 = 2048;
          uint64_t v100 = (uint64_t)v73;
          __int16 v101 = 2048;
          id v102 = v72;
          __int16 v103 = 2114;
          uint64_t v104 = v68;
          _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "AUTH_SET_PROMPT: msgID=%{public}@, authValue=%llu, authReason=%llu, authVersion=%llu, error=%{public}@,", buf, 0x34u);
        }
        int64_t v69 = [(id)qword_1000AC7B0 platform];
        unsigned int v70 = [(TCCDRequestContext *)v13 service];
        objc_msgSend(v69, "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:", 4, v70, v24, 0, objc_msgSend(v88, "authorizationValue"), 0, objc_msgSend(v88, "v1AuthorizationValue"), v83, 0, objc_msgSend(v88, "promptType"));

        id v4 = v81;
        [v88 populateReplyMessage:v81];
        id v71 = qword_1000AC518;
        if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v96 = "handle_TCCSetAccessWithPrompt";
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%s end", buf, 0xCu);
        }
LABEL_59:
        __int16 v49 = v78;
        unsigned int v44 = v79;
LABEL_60:

        id v23 = v8;
        int v59 = v85;
        id v18 = v86;
LABEL_61:

LABEL_17:
        id v8 = v23;
        id v5 = v88;
        goto LABEL_18;
      }
      __int16 v51 = [v7 name];
      if ([v51 isEqualToString:@"kTCCServicePhotos"])
      {
      }
      else
      {
        int64_t v64 = [v7 name];
        unsigned int log = [v64 isEqualToString:@"kTCCServiceCalendar"];

        if (!log) {
          goto LABEL_53;
        }
      }
      objc_msgSend(v88, "setAuthorizationVersion:", objc_msgSend(v7, "authorizationVersionNumber"));
LABEL_53:
      if (([(id)qword_1000AC7B0 updateAuthorizationRecordFromContext:v13 forResult:v88 syncedUpdate:0] & 1) == 0)
      {
        id v65 = [(TCCDRequestContext *)v13 service];
        uint64_t v66 = [(TCCDRequestContext *)v13 identityDescription];
        [v88 denyAuthorizationWithErrorCode:4, @"Failed to update database %@ from %@", v65, v66 format];
      }
      goto LABEL_55;
    }
    int64_t v29 = (void *)qword_1000AC518;
    if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v29;
      id v31 = [v7 name];
      *(_DWORD *)buf = 138412290;
      __int16 v96 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "service: %@ is locked and authentication failed", buf, 0xCu);
    }
  }
  else
  {
    id v93 = v8;
    [(id)qword_1000AC7B0 makeError:&v93 withCode:2 infoText:0];
    id v26 = v93;

    id v27 = objc_opt_new();
    [(id)qword_1000AC7B0 buildErrorString:v27 forError:v26 contextString:0];
    id v28 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10005DC68();
    }

    id v8 = v26;
  }
LABEL_18:
}

void sub_100029328(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

uint64_t sub_1000293A8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_1000293BC(uint64_t a1)
{
}

void sub_1000293D0(uint64_t a1, sqlite3_stmt *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  [v2 addObject:v3];
}

BOOL sub_100029440(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)v8.val = *a1;
  *(_OWORD *)&v8.val[4] = v1;
  id v2 = SecTaskCreateWithAuditToken(0, &v8);
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, @"com.apple.private.tcc.policy-override", 0);
  if (v4)
  {
    id v5 = v4;
    BOOL v6 = CFEqual(v4, kCFBooleanTrue) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

void sub_1000294DC(uint64_t a1, sqlite3_stmt *a2)
{
  memset(v4, 0, sizeof(v4));
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), v4);
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, v4, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 3, *(const char **)(a1 + 48), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

uint64_t sub_1000295AC(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000296F8;
  v7[3] = &unk_100095200;
  long long v8 = *(_OWORD *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000297AC;
  v5[3] = &unk_100095810;
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t result = db_eval_locked((uint64_t)"SELECT id FROM policies WHERE bundle_id = ? AND uuid = ?", v7, v5);
  if (!result)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1000297F4;
      v4[3] = &unk_100095838;
      uint64_t v3 = *(void *)(a1 + 64);
      void v4[4] = *(void *)(a1 + 32);
      v4[5] = v3;
      return db_eval_locked((uint64_t)"INSERT OR REPLACE INTO active_policy VALUES (?, ?, ?)", v4, 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_1000296F8(uint64_t a1, sqlite3_stmt *a2)
{
  memset(v4, 0, sizeof(v4));
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), v4);
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_text(a2, 2, v4, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

sqlite3_int64 sub_1000297AC(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_1000297F4(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_int(a2, 2, 0)
    || sqlite3_bind_int64(a2, 3, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)))
  {
    _db_error(1);
  }
}

uint64_t sub_100029888(uint64_t a1)
{
  uint64_t v2 = db_eval_locked((uint64_t)"CREATE TEMPORARY TABLE _exceptions (uuid TEXT NOT NULL)", 0, 0);
  if (!v2)
  {
    xpc_array_apply(*(xpc_object_t *)(a1 + 32), &stru_1000958A0);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100029AA8;
    v4[3] = &unk_1000958C0;
    void v4[4] = *(void *)(a1 + 40);
    uint64_t v2 = db_eval_locked((uint64_t)"DELETE FROM policies WHERE bundle_id = ? AND uuid NOT IN (SELECT uuid FROM _exceptions)", v4, 0);
  }
  db_eval_locked((uint64_t)"DROP TABLE IF EXISTS _exceptions", 0, 0);
  return v2;
}

BOOL sub_100029958(id a1, unint64_t a2, OS_xpc_object *a3)
{
  uint64_t v3 = a3;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_uuid)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100029A14;
    v6[3] = &unk_1000958C0;
    v6[4] = xpc_uuid_get_bytes(v3);
    BOOL v4 = db_eval_locked((uint64_t)"INSERT INTO _exceptions VALUES (?)", v6, 0) == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100029A14(uint64_t a1, sqlite3_stmt *a2)
{
  memset(v3, 0, sizeof(v3));
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), v3);
  if (sqlite3_bind_text(a2, 1, v3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)) {
    _db_error(1);
  }
}

void sub_100029AA8(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

void sub_100029AF8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_100029B78(uint64_t a1, sqlite3_stmt *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    unsigned int v5 = sqlite3_column_int(a2, 1);
    int v6 = v5;
    if (v5 >= 2)
    {
      id v7 = [(id)qword_1000AC7B0 logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10005DD88(a1, v6, v7);
      }

      goto LABEL_21;
    }
    if (v5 == 1)
    {
      dispatch_time_t v9 = sqlite3_column_text(a2, 0);
      xpc_dictionary_set_string(v4, "path", (const char *)v9);
LABEL_11:
      sqlite3_int64 v10 = sqlite3_column_int64(a2, 3);
      xpc_dictionary_set_int64(v4, "last_modified", v10);
      sqlite3_int64 v11 = sqlite3_column_int64(a2, 4);
      xpc_dictionary_set_int64(v4, "expired_at", v11);
      if (sqlite3_column_type(a2, 2) != 5)
      {
        unsigned __int8 v12 = sqlite3_column_blob(a2, 2);
        int v13 = sqlite3_column_bytes(a2, 2);
        xpc_dictionary_set_data(v4, "code_requirement", v12, v13);
      }
      xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
      goto LABEL_21;
    }
    id v14 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
    if (!v14) {
      goto LABEL_21;
    }
    id v15 = v14;
    xpc_dictionary_set_string(v4, "bundle_id", (const char *)[v15 UTF8String]);
    id v16 = +[LSApplicationProxy applicationProxyForIdentifier:v15 placeholder:0];
    id v17 = v16;
    if (v16)
    {
      id v18 = [v16 bundleURL];

      if (v18)
      {
        uint64_t v19 = [v17 bundleURL];
        id v20 = [v19 absoluteString];
        xpc_dictionary_set_string(v4, "bundle", (const char *)[v20 UTF8String]);

        goto LABEL_11;
      }
    }
    id v21 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "bundle Id: %@ has no LSProxy or URL", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    long long v8 = [(id)qword_1000AC7B0 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10005DD54();
    }
  }
LABEL_21:
}

int sub_100029E80(id a1)
{
  return db_eval_locked((uint64_t)"DELETE FROM expired", 0, 0);
}

uint64_t sub_100029E94(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029F38;
  v4[3] = &unk_100095978;
  id v5 = *(id *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 40);
  v2 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE client = ? AND client_xpc_type_t type = ?", v4, 0);

  return v2;
}

void sub_100029F38(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }
}

uint64_t sub_100029FBC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002A054;
  v3[3] = &unk_1000950A8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v1 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE service = ?", v3, 0);

  return v1;
}

void sub_10002A054(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

uint64_t sub_10002A0D4(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002A18C;
  v4[3] = &unk_1000959F0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  int v7 = *(_DWORD *)(a1 + 48);
  v2 = db_eval_locked((uint64_t)"DELETE FROM expired WHERE service = ? AND client = ? AND client_xpc_type_t type = ?", v4, 0);

  return v2;
}

void sub_10002A18C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

    if (!v5) {
      return;
    }
  }
  _db_error(1);
}

void sub_10002A25C(id a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_DEBUG)) {
    sub_10005DE3C();
  }
  db_eval((uint64_t)"SELECT NULL FROM access_overrides WHERE service = ?", &stru_100095A58, &stru_100095A78);
}

void sub_10002A2B8(id a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 10, "kTCCBogusService", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

void sub_10002A30C(id a1, sqlite3_stmt *a2)
{
  if (os_log_type_enabled((os_log_t)qword_1000AC518, OS_LOG_TYPE_ERROR)) {
    sub_10005DE7C();
  }
}

void sub_10002A350(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  if (v4)
  {
    uint64_t v6 = v5;
    int v7 = *(void **)(a1 + 32);
    long long v8 = +[NSString stringWithUTF8String:v4];
    [v7 addObject:v8];

    dispatch_time_t v9 = *(void **)(a1 + 40);
    id v10 = +[NSNumber numberWithInt:v6];
    [v9 addObject:v10];
  }
}

void sub_10002A424(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }
}

void sub_10002A4A8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = +[NSString stringWithUTF8String:v3];
    [v4 addObject:v5];
  }
}

void sub_10002A52C(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }
}

void sub_10002A5B0(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = +[NSString stringWithUTF8String:v3];
    [v4 addObject:v5];
  }
}

void sub_10002A634(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002A66C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10002B2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10002B3A0(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int64(a2, 1, 2)) {
    _db_error(1);
  }
  id v4 = [*(id *)(a1 + 32) identifier];
  int v5 = sqlite3_bind_text(a2, 2, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v5) {
    _db_error(1);
  }
  uint64_t v6 = [*(id *)(a1 + 40) service];
  id v7 = [v6 name];
  int v8 = sqlite3_bind_text(a2, 3, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (v8) {
    _db_error(1);
  }
  if (sqlite3_bind_int64(a2, 4, 2)) {
    _db_error(1);
  }
  if (sqlite3_bind_int64(a2, 5, 4))
  {
    _db_error(1);
  }
}

void sub_10002B4E8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_column_int(a2, 1);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = sqlite3_column_int(a2, 2);
  int v7 = sqlite3_column_int(a2, 3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = sqlite3_column_int(a2, 4);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = sqlite3_column_int(a2, 5);
  int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (v8 < 1)
  {
    sqlite3_int64 v11 = tcc_access_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v12 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v24 = 136315650;
      long long v25 = "-[TCCDReminderMonitor reportResourceUsage:]_block_invoke_2";
      __int16 v26 = 2048;
      id v27 = v12;
      __int16 v28 = 1024;
      int v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: lastReminded is 0 for this record, now: %f last_modified: %d", (uint8_t *)&v24, 0x1Cu);
    }
    double v10 = (double)v7 - kCFAbsoluteTimeIntervalSince1970;
  }
  else
  {
    double v10 = (double)v8;
  }
  double v13 = v9 - v10;
  [*(id *)(a1 + 32) serviceCooldown];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v13 > v14;
  id v15 = tcc_access_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) UTF8String];
    int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v18 = [*(id *)(a1 + 40) service];
    id v19 = [v18 name];
    id v20 = [v19 UTF8String];
    int v21 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    [*(id *)(a1 + 32) serviceCooldown];
    int v24 = 136317186;
    long long v25 = "-[TCCDReminderMonitor reportResourceUsage:]_block_invoke";
    __int16 v26 = 2080;
    id v27 = v16;
    __int16 v28 = 1024;
    int v29 = v17;
    __int16 v30 = 2080;
    id v31 = v20;
    __int16 v32 = 1024;
    int v33 = v21;
    __int16 v34 = 1024;
    int v35 = v7;
    __int16 v36 = 2048;
    uint64_t v37 = v22;
    __int16 v38 = 2048;
    double v39 = v13;
    __int16 v40 = 2048;
    uint64_t v41 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: client: %s clientType: %d service: %s last_reminded: %d last_modified: %d now: %f elapsed: %f service_cooldown: %f", (uint8_t *)&v24, 0x50u);
  }
}

void sub_10002BC64(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error retrieving authorization record associated with attribution chain: %@ service: %@", buf, 0x16u);
}

void sub_10002BFFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C0C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C324(id a1)
{
  qword_1000AC558 = [[TCCDAccessIndirectObject alloc] initWithType:0];
  _objc_release_x1();
}

void sub_10002C404(id a1)
{
  qword_1000AC560 = (uint64_t)os_log_create("com.apple.TCC", "access");
  _objc_release_x1();
}

void sub_10002C448(id a1)
{
  qword_1000AC570 = (uint64_t)os_log_create("com.apple.TCC", "events");
  _objc_release_x1();
}

id tcc_sync_log()
{
  if (qword_1000AC588 != -1) {
    dispatch_once(&qword_1000AC588, &stru_100095B58);
  }
  os_log_t v0 = (void *)qword_1000AC580;
  return v0;
}

void sub_10002C4E0(id a1)
{
  qword_1000AC580 = (uint64_t)os_log_create("com.apple.TCC", "sync");
  _objc_release_x1();
}

id tcc_assumed_identity_monitor_log()
{
  if (qword_1000AC598 != -1) {
    dispatch_once(&qword_1000AC598, &stru_100095B78);
  }
  os_log_t v0 = (void *)qword_1000AC590;
  return v0;
}

void sub_10002C578(id a1)
{
  qword_1000AC590 = (uint64_t)os_log_create("com.apple.TCC", "assumed_identity_monitor");
  _objc_release_x1();
}

id tcc_open_fds_log()
{
  if (qword_1000AC5A8 != -1) {
    dispatch_once(&qword_1000AC5A8, &stru_100095B98);
  }
  os_log_t v0 = (void *)qword_1000AC5A0;
  return v0;
}

void sub_10002C610(id a1)
{
  qword_1000AC5A0 = (uint64_t)os_log_create("com.apple.TCC", "open_fds");
  _objc_release_x1();
}

void sub_10002CA44(uint64_t a1)
{
  uint64_t v1 = sem_open("com.apple.tccd", 2560, 0, 1);
  if (v1 != (sem_t *)-1)
  {
    sem_close(v1);
    goto LABEL_30;
  }
  if (*__error() == 17)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v39 = a1 + 32;
    uint64_t v3 = *(void *)(v2 + 8);
    id v55 = 0;
    uint64_t v4 = +[NSData dataWithContentsOfFile:v3 options:0 error:&v55];
    id v5 = v55;
    id v6 = v5;
    if (!v4)
    {
      if ([v5 code] == (id)260)
      {
LABEL_45:

        goto LABEL_46;
      }
      double v10 = tcc_assumed_identity_monitor_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002DBF4();
      }
LABEL_44:

      goto LABEL_45;
    }
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    double v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    id v54 = v6;
    sqlite3_int64 v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v4 error:&v54];
    id v12 = v54;

    if (v11)
    {
      id v35 = v12;
      __int16 v36 = v11;
      uint64_t v37 = v4;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v13 = v11;
      id v41 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v41)
      {
        uint64_t v40 = *(void *)v50;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v50 != v40) {
              objc_enumerationMutation(v13);
            }
            uint64_t v15 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            id v16 = [v13 objectForKeyedSubscript:v15];
            int v17 = +[NSMutableSet set];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v18 = v16;
            id v19 = [v18 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v46;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(void *)v46 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
                  long long v43 = 0u;
                  long long v44 = 0u;
                  [v23 getBytes:&v43 length:32];
                  int v24 = [TCCDProcess alloc];
                  v42[0] = v43;
                  v42[1] = v44;
                  long long v25 = [(TCCDProcess *)v24 initWithAuditToken:v42 responsibleIdentity:0];
                  if (v25) {
                    [v17 addObject:v25];
                  }
                }
                id v20 = [v18 countByEnumeratingWithState:&v45 objects:v57 count:16];
              }
              while (v20);
            }

            if ([v17 count]) {
              [*(id *)(*(void *)v39 + 24) setObject:v17 forKeyedSubscript:v15];
            }
          }
          id v41 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }
        while (v41);
      }

      __int16 v26 = tcc_assumed_identity_monitor_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_10002DD2C(v39, v26);
      }
      id v6 = v35;
      sqlite3_int64 v11 = v36;
      uint64_t v4 = v37;
    }
    else
    {
      id v31 = tcc_assumed_identity_monitor_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10002DCC4();
      }

      __int16 v32 = +[NSFileManager defaultManager];
      uint64_t v33 = *(void *)(*(void *)v39 + 8);
      id v53 = v12;
      unsigned __int8 v34 = [v32 removeItemAtPath:v33 error:&v53];
      id v6 = v53;

      if (v34) {
        goto LABEL_43;
      }
      __int16 v26 = tcc_assumed_identity_monitor_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002DC5C();
      }
    }

LABEL_43:
    goto LABEL_44;
  }
  id v27 = tcc_assumed_identity_monitor_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_10002DDAC(v27);
  }

LABEL_30:
  __int16 v28 = +[NSFileManager defaultManager];
  uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 8);
  id v56 = 0;
  unsigned __int8 v30 = [v28 removeItemAtPath:v29 error:&v56];
  id v6 = v56;

  if ((v30 & 1) == 0 && [v6 code] != (id)4)
  {
    uint64_t v4 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002DC5C();
    }
    goto LABEL_45;
  }
LABEL_46:
}

void sub_10002D0E8(uint64_t a1)
{
  id v20 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 24);
  id v1 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v27;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v27 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v4);
        id v6 = objc_opt_new();
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v5];
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            sqlite3_int64 v11 = 0;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v11) description];
              [v6 addObject:v12];

              sqlite3_int64 v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v9);
        }

        [v20 setObject:v6 forKeyedSubscript:v5];
        uint64_t v4 = (char *)v4 + 1;
      }
      while (v4 != v2);
      id v2 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v2);
  }

  id v21 = 0;
  uint64_t v13 = +[NSPropertyListSerialization dataWithPropertyList:v20 format:200 options:0 error:&v21];
  id v14 = v21;
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;

  if (v14)
  {
    int v17 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002DEA8();
    }
  }
}

_DWORD *sub_10002D3EC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 32) _osStateDump];
  uint64_t v3 = v2;
  if (!v2 || (unint64_t)[v2 length] >> 32)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unsigned int v4 = [v3 length];
    uint64_t v5 = malloc_type_calloc(1uLL, v4 + 200, 0x88B04D42uLL);
    _DWORD *v5 = 1;
    v5[1] = v4;
    __strlcpy_chk();
    memcpy(v5 + 50, [v3 bytes], v4);
    id v6 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002DF10(v4, v6);
    }
  }
  return v5;
}

void sub_10002D5F0(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 24);
  unsigned int v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    if ([v5 containsObject:*(void *)(a1 + 48)]) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = objc_opt_new();
    id v6 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  [v5 addObject:*(void *)(a1 + 48)];
  id v8 = tcc_assumed_identity_monitor_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002DFF0((uint64_t *)(a1 + 48), v2, v8);
  }

  [*(id *)(a1 + 32) _saveState];
LABEL_8:
}

void sub_10002D788(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v8];
        [v9 removeObject:*(void *)(a1 + 40)];
        if (![v9 count]) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v2;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObjectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * (void)j), (void)v16);
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v15 = tcc_assumed_identity_monitor_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_10002E080(a1, v15);
  }

  [*(id *)(a1 + 32) _saveState];
}

void sub_10002DAAC(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002DB7C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10002DB8C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Serializing state failed: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DBF4()
{
  sub_10002DB7C(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to load saved state from file %{public}@: %{public}@");
}

void sub_10002DC5C()
{
  sub_10002DB7C(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to remove file %{public}@: %{public}@");
}

void sub_10002DCC4()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed to deserialize saved state: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DD2C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Loaded saved state: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10002DDAC(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "sem_open() failed: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_10002DE3C()
{
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to save state file %{public}@: %{public}@");
}

void sub_10002DEA8()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Error serializing state data: %@", v2, v3, v4, v5, v6);
}

void sub_10002DF10(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "State dump of %u bytes", (uint8_t *)v2, 8u);
}

void sub_10002DF88()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Can't monitor non-bundle assumed identity: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DFF0(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Started monitoring %{public}@ with assumed identity %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_10002E080(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Stopped monitoring %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10002E124(id a1)
{
  id v1 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:40];
  uint64_t v2 = (void *)qword_1000AC5B0;
  qword_1000AC5B0 = (uint64_t)v1;

  qword_1000AC5B8 = (uint64_t)[objc_alloc((Class)NSMutableArray) initWithCapacity:40];
  _objc_release_x1();
}

void sub_10002E558(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10002E938(uint64_t a1)
{
  id v1 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 32) placeholder:0];
  uint64_t v2 = [v1 localizedName];

  return v2;
}

id sub_10002E998(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10002EE58(uint64_t a1)
{
  id v1 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 32) placeholder:0];
  uint64_t v2 = [v1 localizedName];

  return v2;
}

id sub_10002F474(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 objectForKeyedSubscript:@"type"];
  if (qword_1000AC5E8 != -1) {
    dispatch_once(&qword_1000AC5E8, &stru_100095C50);
  }
  int v5 = [(id)qword_1000AC5F0 objectForKeyedSubscript:v4];
  if (v5)
  {

    id v6 = [v3 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (id v7 = +[TCCDServer newErrorWithCode:3, @"Invalid identifier type: identifiers should be strings, got %@: %@", objc_opt_class(), v6 format]) == 0)
    {
LABEL_6:
      [v5 intValue];
      id v6 = v6;
      [v6 UTF8String];
      uint64_t v8 = (void *)tcc_identity_create();
      id v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    id v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100030BD8();
    }

    id v7 = +[TCCDServer newErrorWithCode:3, @"Invalid identity type %@", v4 format];
    id v6 = 0;
    if (!v7) {
      goto LABEL_6;
    }
  }
  if (a2)
  {
    id v7 = v7;
    uint64_t v8 = 0;
    *a2 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_13:

  return v8;
}

void sub_100030270(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100030338(_OWORD *a1)
{
  long long v2 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v2;
  uint64_t v3 = audit_token_to_pid(&atoken);
  long long v4 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v4;
  uint64_t v5 = audit_token_to_pidversion(&atoken);
  long long v6 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v6;
  id v7 = +[NSString stringWithFormat:@"{pid=%d, pidversion=%d, euid=%d}", v3, v5, audit_token_to_euid(&atoken)];
  return v7;
}

void sub_1000303D4(id a1)
{
  v3[0] = @"bundleID";
  v3[1] = @"path";
  v4[0] = &off_10009CEE0;
  v4[1] = &off_10009CEF8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  long long v2 = (void *)qword_1000AC5F0;
  qword_1000AC5F0 = v1;
}

void sub_100030488(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000304A8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "identityCache: evicting: %{public}@", buf, 0xCu);
}

void sub_100030500(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030538(void *a1)
{
  uint64_t v1 = [a1 responsibleProcess];
  long long v2 = [v1 responsiblePath];
  sub_100014F08();
  sub_100030488((void *)&_mh_execute_header, v3, v4, "IDENTITY_ATTRIBUTION: Refusing executable path (%{public}@) which is not a bundle", v5, v6, v7, v8, v9);
}

void sub_1000305D4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 28);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IDENTITY_ATTRIBUTION: identifier = %{public}@, type %u", (uint8_t *)&v4, 0x12u);
}

void sub_100030660(void *a1)
{
  uint64_t v1 = [a1 responsibleProcess];
  uint64_t v2 = [v1 responsiblePath];
  sub_100014F08();
  sub_100030488((void *)&_mh_execute_header, v3, v4, "IDENTITY_ATTRIBUTION: Refusing App Extension without attributed app bundle (%{public}@)", v5, v6, v7, v8, v9);
}

void sub_1000306FC()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "IDENTITY_ATTRIBUTION: Invalid hosting app bundle for App Extension %{public}@: %{public}@");
}

void sub_100030764()
{
  sub_100030470();
  sub_100018408((void *)&_mh_execute_header, v0, v1, "Failed to get RBSProcessHandle for App Extension with PID %{public}d: %{public}@");
}

void sub_1000307CC()
{
  sub_100030470();
  sub_100018408((void *)&_mh_execute_header, v0, v1, "Failed to get hosting process from RBSProcessHandle for App Extension with PID %{public}d: %{public}@");
}

void sub_100030834()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to get hosting app bundle record for hosting process %{public}@: %{public}@");
}

void sub_10003089C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed to attribute App Extension to hosting process because the hosting process %{public}@ is not an application", v2, v3, v4, v5, v6);
}

void sub_100030904(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Using default policy for App Extension with unrecognized extension point policy: %d", (uint8_t *)v2, 8u);
}

void sub_10003097C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 responsibleProcess];
  uint64_t v4 = [v3 responsiblePath];
  sub_100014F08();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IDENTITY_ATTRIBUTION: starting for: %{public}@", v5, 0xCu);
}

void sub_100030A28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030A60(uint64_t *a1, id a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  int v5 = 136446978;
  uint8_t v6 = "-[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]";
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = a2;
  __int16 v11 = 2082;
  id v12 = [a2 fileSystemRepresentation];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s: failed to construct bundle for: %{public}@, URL: %{public}@, %{public}s", (uint8_t *)&v5, 0x2Au);
}

void sub_100030B2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030B64()
{
  sub_100014F08();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Invalid implicitly assumed identity entitlement: %{public}@", v1, 0xCu);
}

void sub_100030BD8()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Cannot map type string to TCC identity type: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100030C40()
{
  sub_100014EB4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Invalid explicitly assumed identity, requested identity %{public}@ not found in entitlement: %{public}@", v1, 0x16u);
}

void sub_100030CB8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to get filesystem representation for %{public}@", buf, 0xCu);
}

void sub_100030D10(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to read commands from %{public}s: %{public}s", buf, 0x16u);
}

void sub_100030D68()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "load command truncated for %{public}s", v2, v3, v4, v5, v6);
}

void sub_100030DD0()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "load command broken for %{public}s", v2, v3, v4, v5, v6);
}

void sub_100030E38()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "min version command truncated for %{public}s", v2, v3, v4, v5, v6);
}

void sub_100030EA0()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "build version command truncated for %{public}s", v2, v3, v4, v5, v6);
}

void sub_100030F08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t db_set_access_override(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (a2)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003118C;
    v20[3] = &unk_1000950A8;
    __int16 v7 = &v21;
    id v21 = v5;
    uint64_t v8 = "INSERT OR IGNORE INTO access_overrides VALUES (?)";
    __int16 v9 = v20;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000313A4;
    v18[3] = &unk_1000950A8;
    __int16 v7 = &v19;
    id v19 = v5;
    uint64_t v8 = "DELETE FROM access_overrides WHERE service = ?";
    __int16 v9 = v18;
  }
  uint64_t v10 = sub_10000D29C((uint64_t)v8, v9, 0, 0);

  if (!v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100031420;
    v16[3] = &unk_1000950A8;
    id v17 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003149C;
    v12[3] = &unk_100095C78;
    char v15 = a2;
    id v13 = v6;
    id v14 = v17;
    uint64_t v10 = sub_10000D29C((uint64_t)"SELECT client, client_type, auth_value FROM access WHERE service = ?", v16, v12, 0);
    access_changed();
  }
  return v10;
}

void sub_10003118C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void _db_error(int a1)
{
  __int16 v11 = 0;
  uint64_t v2 = sub_1000323C0();
  id v3 = sqlite3_errmsg((sqlite3 *)qword_1000AC608);
  if (asprintf(&v11, "database error: %s", v3) != -1)
  {
    uint64_t v4 = +[TCCDPlatform currentPlatform];
    id v5 = [v4 server];
    id v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = " aborting...";
      *(_DWORD *)buf = 136446722;
      if (!a1) {
        uint64_t v10 = "";
      }
      id v13 = v11;
      __int16 v14 = 2080;
      char v15 = v10;
      __int16 v16 = 2112;
      id v17 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s%s\n%@", buf, 0x20u);
    }
  }
  int v7 = sqlite3_errcode((sqlite3 *)qword_1000AC608);
  sqlite3_close((sqlite3 *)qword_1000AC608);
  qword_1000AC608 = 0;
  if (v7 == 26 || v7 == 11)
  {
    __int16 v9 = db_dir_get();
    removefile(v9, 0, 3u);
    free(v9);
  }
  if (a1) {
    sub_100058EF8();
  }
}

void sub_1000313A4(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_100031420(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_10003149C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  int v6 = sqlite3_column_int(a2, 2);
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  __int16 v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = +[NSString stringWithUTF8String:v4];
  [v9 publishAccessChangedEvent:2 forService:v8 client:v10 clientType:v5 authValue:v7 andKillClient:1];
}

void access_changed()
{
  uint32_t v0 = notify_post("com.apple.tcc.access.changed");
  if (v0)
  {
    int v1 = v0;
    uint64_t v2 = +[TCCDPlatform currentPlatform];
    id v3 = [v2 server];
    uint64_t v4 = [v3 logHandle];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000350C8(v1, v4);
    }
  }
}

uint64_t db_reset_access_internal(void *a1, void *a2, int a3, void *a4, uint64_t a5, char a6)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a4;
  id v13 = [v10 name];
  unsigned int v14 = [v13 isEqualToString:@"kTCCServiceAll"];

  unsigned int v15 = [v11 isEqualToString:@"kTCCClientAll"];
  if (!v14)
  {
    if (v15)
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_100032088;
      v68[3] = &unk_1000950A8;
      id v19 = v10;
      id v69 = v19;
      long long v20 = objc_retainBlock(v68);
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100032104;
      v65[3] = &unk_100095228;
      id v66 = v12;
      id v67 = v19;
      LODWORD(v19) = sub_10000D29C((uint64_t)"SELECT client, client_type FROM access WHERE service = ?", v20, v65, 0);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000321A8;
      v63[3] = &unk_100095668;
      id v64 = v20;
      id v21 = v20;
      uint64_t v17 = db_transaction(v63) | v19;

      id v18 = v69;
    }
    else
    {
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000321C0;
      v59[3] = &unk_1000959F0;
      id v42 = v10;
      id v60 = v42;
      id v43 = v11;
      id v61 = v43;
      int v62 = a3;
      long long v44 = objc_retainBlock(v59);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10003228C;
      v53[3] = &unk_100095CC8;
      id v54 = v12;
      id v55 = v42;
      id v56 = v43;
      int v57 = a3;
      char v58 = a6;
      v45 = sub_10000D29C((uint64_t)"SELECT NULL FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ?", v44, v53, 0);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1000322AC;
      v51[3] = &unk_100095668;
      id v52 = v44;
      long long v46 = v44;
      uint64_t v17 = db_transaction(v51) | v45;

      id v18 = v60;
    }
LABEL_11:

    if (v17) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v15)
  {
    uint64_t v78 = _NSConcreteStackBlock;
    uint64_t v79 = 3221225472;
    id v80 = sub_100034648;
    id v81 = &unk_1000950A8;
    id v82 = v12;
    int v16 = sub_10000D29C((uint64_t)"SELECT service, client, client_type FROM access", 0, &v78, 0);
    uint64_t v17 = db_transaction(&stru_100095D30) | v16;
    id v18 = v82;
    goto LABEL_11;
  }
  id v22 = v11;
  id v23 = v12;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100034768;
  v85[3] = &unk_100095978;
  id v24 = v22;
  id v86 = v24;
  int v87 = a3;
  long long v25 = objc_retainBlock(v85);
  uint64_t v78 = _NSConcreteStackBlock;
  uint64_t v79 = 3221225472;
  id v80 = sub_1000347E8;
  id v81 = &unk_1000959F0;
  id v82 = v23;
  id v83 = v24;
  int v84 = a3;
  id v26 = v23;
  id v27 = v24;
  v28 = sub_10000D29C((uint64_t)"SELECT service FROM access WHERE client = ? AND client_xpc_type_t type = ?", v25, &v78, 0);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000348A8;
  v76[3] = &unk_100095668;
  id v77 = v25;
  long long v29 = v25;
  int v30 = db_transaction(v76);

  id v31 = [v26 platform];
  __int16 v32 = [v31 prefixOfBundleIdentifiersToResetAfterResetOfAppBundleIdentifier:v27];

  if (v32)
  {
    +[NSString stringWithFormat:@"SELECT service, client FROM access WHERE client LIKE '%@%@' AND client_xpc_type_t type = %d", v32, @"%", 0];
    id v33 = objc_claimAutoreleasedReturnValue();
    id v34 = [v33 UTF8String];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_100031D94;
    v72[3] = &unk_100095CA0;
    id v73 = v26;
    id v35 = v32;
    id v74 = v35;
    id v75 = v10;
    int v36 = sub_10000D29C((uint64_t)v34, 0, v72, 0);
    v37 = +[NSString stringWithFormat:@"DELETE FROM access WHERE client LIKE '%@%@' AND client_xpc_type_t type = %d", v35, @"%", 0];

    __int16 v38 = +[TCCDPlatform currentPlatform];
    uint64_t v39 = [v38 server];
    uint64_t v40 = [v39 logHandle];

    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000351EC();
    }

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100032044;
    v70[3] = &unk_1000959C8;
    id v71 = v37;
    id v41 = v37;
    uint64_t v17 = db_transaction(v70) | v36;
  }
  else
  {
    uint64_t v17 = v30 | v28;
  }

  if (!v17)
  {
LABEL_15:
    sub_10000D29C((uint64_t)"VACUUM access", 0, 0, 0);
    long long v47 = +[TCCDPlatform currentPlatform];
    long long v48 = [v47 server];
    long long v49 = [v48 logHandle];

    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      sub_100035140(v10, (uint64_t)v11, v49);
    }
  }
LABEL_18:
  access_changed();

  return v17;
}

void sub_100031D94(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) platform];
  uint64_t v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  int v6 = [v4 serviceByName:v5];

  if (v6)
  {
    uint64_t v7 = sqlite3_column_text(a2, 1);
    uint64_t v8 = *(void **)(a1 + 32);
    __int16 v9 = +[NSString stringWithUTF8String:v7];
    [v8 publishAccessChangedEvent:3 forService:v6 client:v9 clientType:0 authValue:1 andKillClient:0];

    id v10 = +[TCCDPlatform currentPlatform];
    id v11 = [v10 server];
    id v12 = [v11 logHandle];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      unsigned int v14 = [*(id *)(a1 + 48) name];
      unsigned int v15 = +[NSString stringWithUTF8String:v7];
      int v16 = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Bundle Prefix: '%@'; deleting (%@ : %@)",
        (uint8_t *)&v16,
        0x20u);
    }
  }
}

uint64_t db_transaction(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (v1)
  {
    id v3 = qword_1000AC5F8;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100034498;
    v6[3] = &unk_100095D10;
    id v7 = v1;
    uint64_t v8 = &v9;
    dispatch_sync(v3, v6);
    uint64_t v4 = *((unsigned int *)v10 + 6);
  }
  else
  {
    uint64_t v4 = 1;
  }
  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t sub_100032044(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UTF8String];
  return sub_10000D29C((uint64_t)v1, 0, 0, 1);
}

uint64_t db_eval_locked(uint64_t a1, void *a2, void *a3)
{
  return sub_10000D29C(a1, a2, a3, 1);
}

void sub_100032088(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  LODWORD(a2) = sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (a2)
  {
    _db_error(1);
  }
}

void sub_100032104(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = sqlite3_column_text(a2, 0);
  uint64_t v5 = sqlite3_column_int(a2, 1);
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = +[NSString stringWithUTF8String:v4];
  [v7 publishAccessChangedEvent:3 forService:v6 client:v8 clientType:v5 authValue:1 andKillClient:1];
}

uint64_t sub_1000321A8(uint64_t a1)
{
  return sub_10000D29C((uint64_t)"DELETE FROM access WHERE service = ?", *(void **)(a1 + 32), 0, 1);
}

void sub_1000321C0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

    if (!v5) {
      return;
    }
  }
  _db_error(1);
}

id sub_10003228C(uint64_t a1)
{
  return [*(id *)(a1 + 32) publishAccessChangedEvent:3 forService:*(void *)(a1 + 40) client:*(void *)(a1 + 48) clientType:*(unsigned int *)(a1 + 56) authValue:1 andKillClient:*(unsigned __int8 *)(a1 + 60)];
}

uint64_t sub_1000322AC(uint64_t a1)
{
  return sub_10000D29C((uint64_t)"DELETE FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ?", *(void **)(a1 + 32), 0, 1);
}

void db_setup_queue()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.tcc.db_queue", 0);
  id v1 = (void *)qword_1000AC5F8;
  qword_1000AC5F8 = (uint64_t)v0;

  if (!v0) {
    sub_100035254();
  }
}

uint64_t db_unavailable_get()
{
  return byte_1000AC600;
}

uint64_t db_commit()
{
  return sqlite3_exec((sqlite3 *)qword_1000AC608, "COMMIT", 0, 0, 0);
}

char *db_dir_get()
{
  dispatch_queue_t v0 = +[TCCDPlatform currentPlatform];
  id v1 = [v0 server];
  uint64_t v2 = [v1 stateDirectory];

  if (!v2) {
    sub_100058EC0();
  }
  id v3 = v2;
  id v4 = strdup((const char *)[v3 UTF8String]);
  if (!v4) {
    sub_100058EDC();
  }
  int v5 = v4;

  return v5;
}

id sub_1000323C0()
{
  __chkstk_darwin();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)uint64_t v6 = 0u;
  long long v7 = 0u;
  int v0 = backtrace(v6, 1024);
  id v1 = backtrace_symbols(v6, v0);
  id v2 = objc_alloc_init((Class)NSMutableString);
  if (v1)
  {
    if (v0 >= 1)
    {
      for (unint64_t i = 0; i != v0; objc_msgSend(v2, "appendFormat:", v4, v1[i++]))
      {
        if (!v1[i]) {
          break;
        }
        id v4 = i >= (v0 - 1) ? @"%s" : @"%s\n";
      }
    }
    free(v1);
  }
  return v2;
}

uint64_t _create_database(const char *a1, char *path)
{
  patha = 0;
  uint64_t v4 = mkpath_np(path, 0x1C0u);
  if (v4 && (uint64_t v5 = v4, v4 != 17))
  {
    long long v18 = +[TCCDPlatform currentPlatform];
    long long v19 = [v18 server];
    long long v20 = [v19 logHandle];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100035270();
    }
  }
  else
  {
    if (asprintf(&patha, "%s/TCC.db", path) == -1) {
      sub_1000590E0();
    }
    uint64_t v5 = _sqlite3_integrity_check();
    uint64_t v6 = +[TCCDPlatform currentPlatform];
    long long v7 = [v6 server];
    long long v8 = [v7 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v27 = patha;
      __int16 v28 = 1024;
      int v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_sqlite3_integrity_check for %s returned (%d)", buf, 0x12u);
    }

    if (v5 == 11)
    {
      long long v9 = +[TCCDPlatform currentPlatform];
      long long v10 = [v9 server];
      long long v11 = [v10 logHandle];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v27 = patha;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "database is corrupt: %s", buf, 0xCu);
      }

      if (!removefile(patha, 0, 3u)) {
        sub_1000352F4();
      }
      long long v12 = +[TCCDPlatform currentPlatform];
      long long v13 = [v12 server];
      long long v14 = [v13 logHandle];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000353B0();
      }
    }
    if (sqlite3_open_v2(patha, (sqlite3 **)&qword_1000AC608, 4227078, 0))
    {
      long long v15 = +[TCCDPlatform currentPlatform];
      long long v16 = [v15 server];
      long long v17 = [v16 logHandle];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100035310(v17);
      }

      if (qword_1000AC608) {
        uint64_t v5 = sqlite3_errcode((sqlite3 *)qword_1000AC608);
      }
      else {
        uint64_t v5 = 12;
      }
    }
    else if (sqlite3_exec((sqlite3 *)qword_1000AC608, "PRAGMA journal_mode=WAL;PRAGMA foreign_keys=ON;", 0, 0, 0) {
           || sqlite3_exec((sqlite3 *)qword_1000AC608, "BEGIN", 0, 0, 0)
    }
           || sqlite3_exec((sqlite3 *)qword_1000AC608, a1, 0, 0, 0))
    {
      _db_error(0);
    }
    else
    {
      long long v22 = +[TCCDPlatform currentPlatform];
      long long v23 = [v22 server];
      long long v24 = [v23 logHandle];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        long long v27 = patha;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "using database: %{public}s", buf, 0xCu);
      }

      uint64_t v5 = 0;
    }
  }
  if (patha) {
    free(patha);
  }
  return v5;
}

uint64_t _PLPlatformLimitedLibrarySupported()
{
  return 1;
}

uint64_t db_open()
{
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v45 = 0;
  if (byte_1000AC600)
  {
    uint64_t database = 1;
    goto LABEL_91;
  }
  id v1 = db_dir_get();
  uint64_t database = _create_database("CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNORE"
               " INTO admin VALUES ('version', 30);CREATE TABLE IF NOT EXISTS policies(   id        INTEGER    NOT NULL"
               " PRIMARY KEY,     bundle_id    TEXT    NOT NULL,     uuid        TEXT    NOT NULL,     display        TEX"
               "T    NOT NULL,     UNIQUE (bundle_id, uuid));CREATE TABLE IF NOT EXISTS active_policy(   client        "
               "TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     policy_id    INTEGER NOT NULL,     PRIMARY "
               "KEY (client, client_type),     FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDAT"
               "E CASCADE);CREATE INDEX IF NOT EXISTS active_policy_id ON active_policy(policy_id);CREATE TABLE IF NOT EX"
               "ISTS access(   service        TEXT        NOT NULL,     client         TEXT        NOT NULL,     client"
               "_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason    INTEGER     NO"
               "T NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTEGER,    "
               " indirect_object_identifier_type    INTEGER,     indirect_object_identifier         TEXT NOT NULL DEFAULT"
               " 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  IN"
               "TEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     pid            INTEGER,     pid_v"
               "ersion    INTEGER,     boot_uuid      TEXT NOT NULL DEFAULT 'UNUSED',     last_reminded  INTEGER     NOT "
               "NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, indi"
               "rect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE C"
               "ASCADE);CREATE TABLE IF NOT EXISTS access_overrides(   service        TEXT    NOT NULL PRIMARY KEY);CRE"
               "ATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT NULL,     client         TEXT        "
               "NOT NULL,     client_type    INTEGER     NOT NULL,     csreq          BLOB,     last_modified  INTEGER   "
               "  NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),    "
               " PRIMARY KEY (service, client, client_type));",
               v1);
  if (!database)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100033740;
    v41[3] = &unk_1000951B8;
    void v41[4] = &v42;
    uint64_t database = sub_10000D29C("SELECT value FROM admin WHERE key = 'version'", 0, v41, 1);
    if (!database)
    {
      id v2 = +[TCCDPlatform currentPlatform];
      id v3 = [v2 server];
      uint64_t v4 = [v3 logHandle];

      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *((_DWORD *)v43 + 6);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using database version: %d", buf, 8u);
      }

      switch(*((_DWORD *)v43 + 6))
      {
        case 1:
        case 2:
        case 3:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DROP TABLE access; DROP TABLE access_times; DROP TABLE access_overrides;",
                 0,
                 0,
                 0))
          {
            goto LABEL_87;
          }
          int v6 = sqlite3_exec((sqlite3 *)qword_1000AC608, "CREATE TABLE IF NOT EXISTS admin (key TEXT PRIMARY KEY NOT NULL, value INTEGER NOT NULL);INSERT OR IGNO"
                 "RE INTO admin VALUES ('version', 30);CREATE TABLE IF NOT EXISTS policies(   id        INTEGER    NOT "
                 "NULL PRIMARY KEY,     bundle_id    TEXT    NOT NULL,     uuid        TEXT    NOT NULL,     display     "
                 "   TEXT    NOT NULL,     UNIQUE (bundle_id, uuid));CREATE TABLE IF NOT EXISTS active_policy(   client"
                 "        TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     policy_id    INTEGER NOT NULL,   "
                 "  PRIMARY KEY (client, client_type),     FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASC"
                 "ADE ON UPDATE CASCADE);CREATE INDEX IF NOT EXISTS active_policy_id ON active_policy(policy_id);CREATE T"
                 "ABLE IF NOT EXISTS access(   service        TEXT        NOT NULL,     client         TEXT        NOT "
                 "NULL,     client_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason"
                 "    INTEGER     NOT NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_"
                 "id      INTEGER,     indirect_object_identifier_type    INTEGER,     indirect_object_identifier        "
                 " TEXT NOT NULL DEFAULT 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGE"
                 "R,     last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     pid    "
                 "        INTEGER,     pid_version    INTEGER,     boot_uuid      TEXT NOT NULL DEFAULT 'UNUSED',     las"
                 "t_reminded  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (serv"
                 "ice, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(i"
                 "d) ON DELETE CASCADE ON UPDATE CASCADE);CREATE TABLE IF NOT EXISTS access_overrides(   service       "
                 " TEXT    NOT NULL PRIMARY KEY);CREATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT N"
                 "ULL,     client         TEXT        NOT NULL,     client_type    INTEGER     NOT NULL,     csreq       "
                 "   BLOB,     last_modified  INTEGER     NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAS"
                 "T(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type));",
                 0,
                 0,
                 0);
          goto LABEL_81;
        case 4:
          if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN csreq BLOB", 0, 0, 0)) {
            goto LABEL_27;
          }
          goto LABEL_87;
        case 5:
LABEL_27:
          if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access_times", 0, 0, 0)) {
            goto LABEL_28;
          }
          goto LABEL_87;
        case 6:
LABEL_28:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE service = 'kTCCServicePhotos' AND allowed = 0", 0, 0, 0))
          {
            goto LABEL_87;
          }
          access_changed();
LABEL_30:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT    NOT NULL,     client        TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     allowed        INTEGER    NOT NULL,     prompt_count    INTEGER    NOT NULL,     csreq        BLOB,     policy_id    INTEGER,     PRIMARY KEY (service, client, client_type),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, NULL FROM access", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "DROP TABLE access", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE NEW_access RENAME TO access", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_34:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE(service = 'kTCCServicePhotos' or service = 'kTCCServicePhotosAdd')", 0, 0, 0))
          {
            goto LABEL_87;
          }
          access_changed();
LABEL_36:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT    NOT NULL,     client        TEXT    NOT NULL,     client_type    INTEGER    NOT NULL,     allowed        INTEGER    NOT NULL,     prompt_count    INTEGER    NOT NULL,     csreq        BLOB,     policy_id    INTEGER,     indirect_object_identifier_type        INTEGER,     indirect_object_identifier        TEXT NOT NULL,     indirect_object_code_identity        BLOB,     PRIMARY KEY (service, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, policy_id, NULL, 'UNUSED', NULL FROM access", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "DROP TABLE access", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE NEW_access RENAME TO access", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_40:
          if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN flags INTEGER", 0, 0, 0)) {
            goto LABEL_45;
          }
          long long v14 = sqlite3_errmsg((sqlite3 *)qword_1000AC608);
          if (strcmp(v14, "duplicate column name: flags")) {
            goto LABEL_87;
          }
          long long v15 = +[TCCDPlatform currentPlatform];
          long long v16 = [v15 server];
          long long v17 = [v16 logHandle];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate 'flags' column for version 10.", buf, 2u);
          }

LABEL_45:
          sqlite3_exec((sqlite3 *)qword_1000AC608, "DROP TABLE access_times", 0, 0, 0);
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT        NOT NULL,     client         TEXT        NOT NULL,     client_type    INTEGER     NOT NULL,     allowed        INTEGER     NOT NULL,     prompt_count   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTEGER,     indirect_object_identifier_type    INTEGER,     indirect_object_identifier         TEXT DEFAULT 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "INSERT INTO NEW_access SELECT service, client, client_type, allowed, prompt_count, csreq, policy_id, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, CAST(strftime('%s','now') AS INTEGER) FROM access", 0, 0, 0)
            || sqlite3_exec((sqlite3 *)qword_1000AC608, "DROP TABLE access", 0, 0, 0)
            || sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE NEW_access RENAME TO access", 0, 0, 0))
          {
            goto LABEL_87;
          }
          access_changed();
LABEL_50:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "CREATE TABLE IF NOT EXISTS expired(   service        TEXT        NOT NULL,     client         TEXT        NOT NULL,     client_type    INTEGER     NOT NULL,     csreq          BLOB,     last_modified  INTEGER     NOT NULL ,     expired_at     INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type))", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_51:
          if (sub_100033778((sqlite3 *)qword_1000AC608)) {
            goto LABEL_88;
          }
LABEL_52:
          long long v18 = +[NSString stringWithFormat:@"POST_UPGRADE_3_RIGHT_ALERT_%@", @"kTCCServicePhotos"];
          long long v19 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO admin (key, value) VALUES ('%@', %d)", v18, 1];
          long long v20 = (sqlite3 *)qword_1000AC608;
          id v21 = v19;
          if (sqlite3_exec(v20, (const char *)[v21 UTF8String], 0, 0, 0))
          {
            _db_error(0);

            goto LABEL_88;
          }

LABEL_55:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE client = 'com.apple.Health' AND service = 'kTCCServiceLiverpool'", 0, 0, 0))
          {
            goto LABEL_87;
          }
          access_changed();
LABEL_57:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE client = '/usr/sbin/sshd' AND service = 'kTCCServiceSystemPolicyAllFiles'", 0, 0, 0))
          {
            goto LABEL_87;
          }
          access_changed();
LABEL_8:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "UPDATE OR REPLACE access SET service = 'kTCCServiceSystemPolicyAllFiles' WHERE service = 'kTCCServiceEndpointSecurityClient' and auth_int value = 2", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE service = 'kTCCServiceEndpointSecurityClient'", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_10:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN pid INTEGER", 0, 0, 0)
            || sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN pid_version INTEGER", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN boot_uuid TEXT NOT NULL DEFAULT 'UNUSED'", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_13:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN last_reminded INTEGER NOT NULL DEFAULT 0", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_14:
          if (sqlite3_exec((sqlite3 *)qword_1000AC608, "DELETE FROM access WHERE client = 'com.apple.installer' and client_xpc_type_t type = 0", 0, 0, 0))
          {
            goto LABEL_87;
          }
LABEL_15:
          *(void *)buf = 0;
          id v52 = buf;
          uint64_t v53 = 0x2020000000;
          int v54 = 0;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100033838;
          v40[3] = &unk_1000951B8;
          v40[4] = buf;
          if (sub_10000D29C("SELECT COUNT(*) FROM pragma_table_info('access') WHERE name='pid'", 0, v40, 1))goto LABEL_16; {
          if (*((_DWORD *)v52 + 6))
          }
          {
            long long v22 = +[TCCDPlatform currentPlatform];
            long long v23 = [v22 server];
            long long v24 = [v23 logHandle];

            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v48) = 136315138;
              *(void *)((char *)&v48 + 4) = "db_open";
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s session cols present, not adding", (uint8_t *)&v48, 0xCu);
            }
          }
          else
          {
            long long v25 = +[TCCDPlatform currentPlatform];
            long long v26 = [v25 server];
            long long v27 = [v26 logHandle];

            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v48) = 136315138;
              *(void *)((char *)&v48 + 4) = "db_open";
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s session cols not present, adding", (uint8_t *)&v48, 0xCu);
            }

            if (sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN pid INTEGER", 0, 0, 0)
              || sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN pid_version INTEGER", 0, 0, 0)|| sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN boot_uuid TEXT NOT NULL DEFAULT 'UNUSED'", 0, 0, 0))
            {
LABEL_16:
              _db_error(0);
LABEL_17:
              _Block_object_dispose(buf, 8);
LABEL_88:
              uint64_t database = 1;
              break;
            }
          }
          *(void *)&long long v48 = 0;
          *((void *)&v48 + 1) = &v48;
          uint64_t v49 = 0x2020000000;
          int v50 = 0;
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100033870;
          v39[3] = &unk_1000951B8;
          v39[4] = &v48;
          if (sub_10000D29C("SELECT COUNT(*) FROM pragma_table_info('access') WHERE name='last_reminded'", 0, v39, 1))goto LABEL_64; {
          if (*(_DWORD *)(*((void *)&v48 + 1) + 24))
          }
          {
            __int16 v28 = +[TCCDPlatform currentPlatform];
            int v29 = [v28 server];
            long long v30 = [v29 logHandle];

            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long v46 = 136315138;
              long long v47 = "db_open";
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s last_reminded col present, not adding", v46, 0xCu);
            }
          }
          else
          {
            long long v36 = +[TCCDPlatform currentPlatform];
            long long v37 = [v36 server];
            __int16 v38 = [v37 logHandle];

            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long v46 = 136315138;
              long long v47 = "db_open";
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s last_reminded col not present, adding", v46, 0xCu);
            }

            if (sqlite3_exec((sqlite3 *)qword_1000AC608, "ALTER TABLE access ADD COLUMN last_reminded INTEGER NOT NULL DEFAULT 0", 0, 0, 0))
            {
LABEL_64:
              _db_error(0);
              _Block_object_dispose(&v48, 8);
              goto LABEL_17;
            }
          }
          _Block_object_dispose(&v48, 8);
          _Block_object_dispose(buf, 8);
LABEL_79:
          if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "UPDATE access set auth_int value = 4, auth_reason = 4 WHERE service = 'kTCCServiceCalendar' and auth_int value = 2", 0, 0, 0))
          {
            int v6 = sqlite3_exec((sqlite3 *)qword_1000AC608, "UPDATE access set auth_version = 2 WHERE service = 'kTCCServiceCalendar'", 0, 0, 0);
LABEL_81:
            if (!v6)
            {
              access_changed();
LABEL_83:
              long long v31 = +[TCCDPlatform currentPlatform];
              long long v32 = [v31 server];
              long long v33 = [v32 logHandle];

              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                int v34 = *((_DWORD *)v43 + 6);
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v34;
                LOWORD(v52) = 1024;
                *(_DWORD *)((char *)&v52 + 2) = 30;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Upgrading database from version %d to %d", buf, 0xEu);
              }

              if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "UPDATE admin SET int value = 30 WHERE key = 'version'", 0, 0, 0))
              {
LABEL_86:
                if (!sqlite3_exec((sqlite3 *)qword_1000AC608, "COMMIT", 0, 0, 0))
                {
                  free(v1);
                  uint64_t database = 0;
                  goto LABEL_91;
                }
              }
            }
          }
LABEL_87:
          _db_error(0);
          goto LABEL_88;
        case 7:
          goto LABEL_30;
        case 8:
          goto LABEL_34;
        case 9:
          goto LABEL_36;
        case 0xA:
          goto LABEL_40;
        case 0xB:
          goto LABEL_45;
        case 0xC:
        case 0xD:
        case 0xE:
          goto LABEL_50;
        case 0xF:
          goto LABEL_51;
        case 0x10:
          goto LABEL_52;
        case 0x11:
        case 0x12:
          goto LABEL_55;
        case 0x13:
          goto LABEL_57;
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x17:
          goto LABEL_8;
        case 0x18:
          goto LABEL_10;
        case 0x19:
          goto LABEL_13;
        case 0x1A:
          goto LABEL_14;
        case 0x1B:
          goto LABEL_15;
        case 0x1C:
          goto LABEL_79;
        case 0x1D:
          goto LABEL_83;
        case 0x1E:
          goto LABEL_86;
        default:
          long long v7 = +[TCCDPlatform currentPlatform];
          long long v8 = [v7 server];
          long long v9 = [v8 logHandle];

          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *((_DWORD *)v43 + 6);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v10;
            LOWORD(v52) = 1024;
            *(_DWORD *)((char *)&v52 + 2) = 30;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Downgrading database from version %d to %d", buf, 0xEu);
          }

          sqlite3_close((sqlite3 *)qword_1000AC608);
          qword_1000AC608 = 0;
          if (removefile(v1, 0, 3u))
          {
            long long v11 = +[TCCDPlatform currentPlatform];
            long long v12 = [v11 server];
            long long v13 = [v12 logHandle];

            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              sub_1000353E4();
            }

            uint64_t database = 1;
          }
          else
          {
            uint64_t database = db_open();
          }
          access_changed();
          free(v1);
          if (database) {
            goto LABEL_90;
          }
          goto LABEL_91;
      }
    }
  }
  free(v1);
LABEL_90:
  byte_1000AC600 = 1;
  dword_1000AC610 = sqlite3_extended_errcode((sqlite3 *)qword_1000AC608);
  sqlite3_close((sqlite3 *)qword_1000AC608);
  qword_1000AC608 = 0;
LABEL_91:
  _Block_object_dispose(&v42, 8);
  return database;
}

void sub_100033654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033740(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100033778(sqlite3 *a1)
{
  uint64_t v2 = sqlite3_exec(a1, "CREATE TABLE IF NOT EXISTS NEW_access(   service        TEXT        NOT NULL,     client         TEXT        NOT NULL,     client_type    INTEGER     NOT NULL,     auth_value     INTEGER     NOT NULL,     auth_reason    INTEGER     NOT NULL,     auth_version   INTEGER     NOT NULL,     csreq          BLOB,     policy_id      INTEGER,     indirect_object_identifier_type    INTEGER,     indirect_object_identifier         TEXT NOT NULL DEFAULT 'UNUSED',     indirect_object_code_identity      BLOB,     flags          INTEGER,     last_modified  INTEGER     NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),     PRIMARY KEY (service, client, client_type, indirect_object_identifier),    FOREIGN KEY (policy_id) REFERENCES policies(id) ON DELETE CASCADE ON UPDATE CASCADE)", 0, 0, 0);
  if (v2
    || (uint64_t v2 = sub_10000D29C("SELECT * FROM access", 0, &stru_100095D78, 1), v2)
    || (uint64_t v2 = sqlite3_exec(a1, "DROP TABLE access", 0, 0, 0), v2))
  {
    uint64_t v3 = v2;
    _db_error(0);
    return v3;
  }
  else
  {
    return sqlite3_exec(a1, "ALTER TABLE NEW_access RENAME TO access", 0, 0, 0);
  }
}

uint64_t sub_100033838(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100033870(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t db_get_current_version()
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000339D8;
  v5[3] = &unk_1000951B8;
  void v5[4] = &v6;
  if (sub_10000D29C((uint64_t)"SELECT value FROM admin WHERE key = 'version'", 0, v5, 0))
  {
    int v0 = +[TCCDPlatform currentPlatform];
    id v1 = [v0 server];
    uint64_t v2 = [v1 logHandle];

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100059360();
    }
  }
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1000339BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000339D8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t db_get_current_version_locked()
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033B40;
  v5[3] = &unk_1000951B8;
  void v5[4] = &v6;
  if (sub_10000D29C((uint64_t)"SELECT value FROM admin WHERE key = 'version'", 0, v5, 1))
  {
    int v0 = +[TCCDPlatform currentPlatform];
    id v1 = [v0 server];
    uint64_t v2 = [v1 logHandle];

    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100059360();
    }
  }
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100033B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033B40(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t db_persistent_state_get_value(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = -1;
  uint64_t v4 = sub_100033D24(a1, v3);
  if (v4)
  {
    int v5 = +[NSString stringWithFormat:@"SELECT value FROM admin WHERE key = '%@'", v4];
    uint64_t v6 = +[TCCDPlatform currentPlatform];
    long long v7 = [v6 server];
    uint64_t v8 = [v7 logHandle];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100035418();
    }

    id v9 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033E9C;
    v12[3] = &unk_1000951B8;
    void v12[4] = &v13;
    if (sub_10000D29C((uint64_t)[v9 UTF8String], 0, v12, 0)) {
      _db_error(0);
    }
  }
  uint64_t v10 = *((unsigned int *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return v10;
}

void sub_100033D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100033D24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 == 1)
  {
    if (v3)
    {
      int v5 = +[NSString stringWithFormat:@"POST_UPGRADE_3_RIGHT_ALERT_%@", v3];
      goto LABEL_9;
    }
    CFStringRef v6 = @"Missing Service Name.";
  }
  else
  {
    CFStringRef v6 = @"Invalid TCCDPersistentStateType.";
  }
  long long v7 = sub_1000323C0();
  uint64_t v8 = +[TCCDPlatform currentPlatform];
  id v9 = [v8 server];
  uint64_t v10 = [v9 logHandle];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v13 = a1;
    __int16 v14 = 2112;
    CFStringRef v15 = v6;
    __int16 v16 = 2112;
    long long v17 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot construct Persistent State key name. type: %llu: %@\n%@", buf, 0x20u);
  }

  int v5 = 0;
LABEL_9:

  return v5;
}

uint64_t sub_100033E9C(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void db_persistent_state_set_value(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = sub_100033D24(a1, a2);
  if (v4)
  {
    if ((a3 & 0x80000000) != 0)
    {
      sub_1000323C0();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = +[TCCDPlatform currentPlatform];
      long long v11 = [v10 server];
      long long v12 = [v11 logHandle];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        int v14 = a3;
        __int16 v15 = 2112;
        __int16 v16 = v4;
        __int16 v17 = 2112;
        id v18 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Persistent State value (%d) is negative; key name: %@\n%@",
          buf,
          0x1Cu);
      }
    }
    else
    {
      int v5 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO admin (key, value) VALUES ('%@', %d)", v4, a3];
      CFStringRef v6 = +[TCCDPlatform currentPlatform];
      long long v7 = [v6 server];
      uint64_t v8 = [v7 logHandle];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100035418();
      }

      id v9 = v5;
      if (sub_10000D29C((uint64_t)[v9 UTF8String], 0, 0, 0)) {
        _db_error(0);
      }
    }
  }
}

void db_persistent_state_reset(uint64_t a1, void *a2)
{
  uint64_t v2 = sub_100033D24(a1, a2);
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"DELETE FROM admin WHERE key = '%@'", v2];
    uint64_t v4 = +[TCCDPlatform currentPlatform];
    int v5 = [v4 server];
    CFStringRef v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100035418();
    }

    id v7 = v3;
    if (sub_10000D29C((uint64_t)[v7 UTF8String], 0, 0, 0)) {
      _db_error(0);
    }
  }
}

uint64_t db_get_database_error_code()
{
  if (byte_1000AC600) {
    return dword_1000AC610;
  }
  else {
    return 0;
  }
}

const char *db_get_filename()
{
  uint64_t result = (const char *)qword_1000AC608;
  if (qword_1000AC608)
  {
    uint64_t result = sqlite3_db_filename((sqlite3 *)qword_1000AC608, "main");
    if (result)
    {
      if (!*result) {
        return 0;
      }
    }
  }
  return result;
}

id db_get_file_metadata(const char *a1)
{
  uint64_t v2 = objc_opt_new();
  if (a1)
  {
    id v3 = +[NSString stringWithUTF8String:a1];
    [v2 setObject:v3 forKeyedSubscript:@"FILENAME"];

    memset(&v13, 0, sizeof(v13));
    if (!stat(a1, &v13))
    {
      uint64_t v4 = +[NSString stringWithFormat:@"%o", v13.st_mode];
      [v2 setObject:v4 forKeyedSubscript:@"ST_MODE"];

      int v5 = +[NSNumber numberWithUnsignedInt:v13.st_uid];
      [v2 setObject:v5 forKeyedSubscript:@"ST_UID"];

      CFStringRef v6 = +[NSNumber numberWithUnsignedInt:v13.st_gid];
      [v2 setObject:v6 forKeyedSubscript:@"ST_GID"];

      id v7 = +[NSDate dateWithTimeIntervalSince1970:(double)v13.st_atimespec.tv_sec];
      [v2 setObject:v7 forKeyedSubscript:@"ST_ATIME"];

      uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:(double)v13.st_mtimespec.tv_sec];
      [v2 setObject:v8 forKeyedSubscript:@"ST_MTIME"];

      id v9 = +[NSDate dateWithTimeIntervalSince1970:(double)v13.st_ctimespec.tv_sec];
      [v2 setObject:v9 forKeyedSubscript:@"ST_CTIME"];

      uint64_t v10 = +[NSDate dateWithTimeIntervalSince1970:(double)v13.st_birthtimespec.tv_sec];
      [v2 setObject:v10 forKeyedSubscript:@"ST_BIRTHTIME"];
    }
  }
  id v11 = [v2 copy];

  return v11;
}

void db_close()
{
}

void sub_100034410(id a1)
{
  id v1 = +[TCCDPlatform currentPlatform];
  uint64_t v2 = [v1 server];
  id v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100035480();
  }

  sqlite3_close((sqlite3 *)qword_1000AC608);
  qword_1000AC608 = 0;
}

uint64_t sub_100034498(uint64_t a1)
{
  uint64_t result = sub_10000D29C((uint64_t)"BEGIN", 0, 0, 1);
  if (result
    || (uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(), result)
    || (uint64_t result = sub_10000D29C((uint64_t)"END", 0, 0, 1), result))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t db_test_corrupt(int a1)
{
  uint64_t v2 = +[TCCDPlatform currentPlatform];
  id v3 = [v2 server];
  uint64_t v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Corrupting database...", v10, 2u);
  }

  uint64_t v5 = sub_10000D29C((uint64_t)"SELECT * FROM active_policy WHERE client='NOT EXIST'", 0, 0, 0);
  if (!v5)
  {
    CFStringRef v6 = db_dir_get();
    *(void *)&v6[strlen(v6)] = 0x62642E4343542FLL;
    uint64_t v5 = 2;
    int v7 = open(v6, 2);
    if (v7 != -1)
    {
      int v8 = v7;
      lseek(v7, 0, 0);
      write(v8, "Let you corrupt", 0xFuLL);
      _db_error(a1);
      close(v8);
      return 0;
    }
  }
  return v5;
}

void sub_100034648(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) platform];
  uint64_t v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  id v10 = [v4 serviceByName:v5];

  if (v10)
  {
    CFStringRef v6 = sqlite3_column_text(a2, 1);
    uint64_t v7 = sqlite3_column_int(a2, 2);
    int v8 = *(void **)(a1 + 32);
    id v9 = +[NSString stringWithUTF8String:v6];
    [v8 publishAccessChangedEvent:3 forService:v10 client:v9 clientType:v7 authValue:1 andKillClient:1];
  }
}

int sub_100034750(id a1)
{
  return sub_10000D29C((uint64_t)"DELETE FROM access", 0, 0, 1);
}

void sub_100034768(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 2, *(_DWORD *)(a1 + 40)))
  {
    _db_error(1);
  }
}

void sub_1000347E8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) platform];
  uint64_t v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  id v7 = [v4 serviceByName:v5];

  CFStringRef v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) publishAccessChangedEvent:3 forService:v7 client:*(void *)(a1 + 40) clientType:*(unsigned int *)(a1 + 48) authValue:1 andKillClient:1];
    CFStringRef v6 = v7;
  }
}

uint64_t sub_1000348A8(uint64_t a1)
{
  return sub_10000D29C((uint64_t)"DELETE FROM access WHERE client = ? AND client_xpc_type_t type = ?", *(void **)(a1 + 32), 0, 1);
}

void sub_1000348C0(id a1, sqlite3_stmt *a2)
{
  __s1 = (char *)sqlite3_column_text(a2, 0);
  int v34 = sqlite3_column_text(a2, 1);
  int v35 = sqlite3_column_int(a2, 2);
  int v3 = sqlite3_column_int(a2, 3);
  int v4 = sqlite3_column_int(a2, 4);
  int v33 = sqlite3_column_type(a2, 5);
  long long v32 = sqlite3_column_blob(a2, 5);
  int v31 = sqlite3_column_bytes(a2, 5);
  int v30 = sqlite3_column_type(a2, 6);
  int v29 = sqlite3_column_int(a2, 6);
  int v28 = sqlite3_column_type(a2, 7);
  int v27 = sqlite3_column_int(a2, 7);
  int v5 = sqlite3_column_type(a2, 8);
  CFStringRef v6 = sqlite3_column_text(a2, 8);
  int v7 = sqlite3_column_type(a2, 9);
  int v8 = sqlite3_column_blob(a2, 9);
  int v9 = sqlite3_column_bytes(a2, 9);
  int v10 = sqlite3_column_type(a2, 10);
  int v11 = sqlite3_column_int(a2, 10);
  int v12 = sqlite3_column_int(a2, 11);
  if (v4 == 1 || !v4 && !strcmp(__s1, "kTCCServiceAppleEvents"))
  {
    if (!v3)
    {
      uint64_t v13 = 0;
LABEL_13:
      uint64_t v26 = v13;
      id v18 = "<%@: token=%llu, state=%s, csid=%@>" + 22;
      BOOL v19 = v5 == 5;
      if (v5 == 5) {
        long long v20 = "UNUSED";
      }
      else {
        long long v20 = (const char *)v6;
      }
      if (v19 || (int v21 = strcmp((const char *)v6, "UNUSED"), v18 = "=%s, csid=%@>", !v21))
      {
        uint64_t v63 = 0;
        id v64 = &v63;
        uint64_t v65 = 0x2020000000;
        char v66 = 0;
        id v55 = _NSConcreteStackBlock;
        uint64_t v56 = *((void *)v18 + 82);
        int v57 = sub_100034E4C;
        char v58 = &unk_100095D98;
        int v59 = __s1;
        id v60 = v34;
        int v62 = v35;
        id v61 = v20;
        v54[0] = _NSConcreteStackBlock;
        v54[1] = v56;
        v54[2] = sub_100034ED4;
        v54[3] = &unk_1000951B8;
        v54[4] = &v63;
        sub_10000D29C((uint64_t)"SELECT count(*) FROM NEW_access WHERE service = ? AND client = ? AND client_xpc_type_t type = ? AND indirect_object_identifier = ?", &v55, v54, 1);
        if (*((unsigned char *)v64 + 24))
        {
          long long v22 = +[TCCDPlatform currentPlatform];
          long long v23 = [v22 server];
          long long v24 = [v23 logHandle];

          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            long long v25 = "(null)";
            *(_DWORD *)buf = 136316418;
            if (v6) {
              long long v25 = (const char *)v6;
            }
            id v68 = __s1;
            __int16 v69 = 2080;
            unsigned int v70 = v34;
            __int16 v71 = 1024;
            int v72 = v35;
            __int16 v73 = 2080;
            id v74 = v25;
            __int16 v75 = 1024;
            int v76 = v3;
            __int16 v77 = 1024;
            int v78 = v4;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Dropping duplicate v15 access row: service=%s, client=%s, client_type=%d, indirect_object_identifier=%s, allowed=%d, prompt_count=%d", buf, 0x32u);
          }

          _Block_object_dispose(&v63, 8);
          return;
        }
        _Block_object_dispose(&v63, 8);
      }
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100034F14;
      v37[3] = &unk_100095DB8;
      v37[4] = __s1;
      v37[5] = v34;
      v37[6] = v26;
      long long v38 = xmmword_100076490;
      int v42 = v35;
      int v43 = v33;
      int v44 = v31;
      int v45 = v30;
      int v46 = v29;
      int v47 = v28;
      uint64_t v39 = v32;
      uint64_t v40 = v20;
      int v48 = v27;
      int v49 = v7;
      id v41 = v8;
      int v50 = v9;
      int v51 = v10;
      int v52 = v11;
      int v53 = v12;
      sub_10000D29C((uint64_t)"INSERT INTO NEW_access   (service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, last_modified) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", v37, 0, 1);
      return;
    }
    if (v3 == 1)
    {
      uint64_t v13 = 2;
      goto LABEL_13;
    }
  }
  int v14 = +[TCCDPlatform currentPlatform];
  __int16 v15 = [v14 server];
  __int16 v16 = [v15 logHandle];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = "(null)";
    *(_DWORD *)buf = 136316418;
    if (v6) {
      __int16 v17 = (const char *)v6;
    }
    id v68 = __s1;
    __int16 v69 = 2080;
    unsigned int v70 = v34;
    __int16 v71 = 1024;
    int v72 = v35;
    __int16 v73 = 2080;
    id v74 = v17;
    __int16 v75 = 1024;
    int v76 = v3;
    __int16 v77 = 1024;
    int v78 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Dropping invalid v15 access row: service=%s, client=%s, client_type=%d, indirect_object_identifier=%s, allowed=%d, prompt_count=%d", buf, 0x32u);
  }
}

void sub_100034E28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034E4C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(a2, 2, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 56));
  int v4 = *(const char **)(a1 + 48);
  return sqlite3_bind_text(a2, 4, v4, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100034ED4(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result > 0;
  return result;
}

uint64_t sub_100034F14(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(a2, 2, *(const char **)(a1 + 40), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 96));
  sqlite3_bind_int64(a2, 4, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 5, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 6, *(void *)(a1 + 64));
  if (*(_DWORD *)(a1 + 100) == 5) {
    sqlite3_bind_null(a2, 7);
  }
  else {
    sqlite3_bind_blob(a2, 7, *(const void **)(a1 + 72), *(_DWORD *)(a1 + 104), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  if (*(_DWORD *)(a1 + 108) == 5) {
    sqlite3_bind_null(a2, 8);
  }
  else {
    sqlite3_bind_int(a2, 8, *(_DWORD *)(a1 + 112));
  }
  if (*(_DWORD *)(a1 + 116) == 5) {
    sqlite3_bind_null(a2, 9);
  }
  else {
    sqlite3_bind_int(a2, 9, *(_DWORD *)(a1 + 120));
  }
  sqlite3_bind_text(a2, 10, *(const char **)(a1 + 80), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (*(_DWORD *)(a1 + 124) == 5) {
    sqlite3_bind_null(a2, 11);
  }
  else {
    sqlite3_bind_blob(a2, 11, *(const void **)(a1 + 88), *(_DWORD *)(a1 + 128), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  if (*(_DWORD *)(a1 + 132) == 5) {
    sqlite3_bind_null(a2, 12);
  }
  else {
    sqlite3_bind_int(a2, 12, *(_DWORD *)(a1 + 136));
  }
  int v4 = *(_DWORD *)(a1 + 140);
  return sqlite3_bind_int(a2, 13, v4);
}

void sub_1000350C8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to post com.apple.tcc.access.changed notification (%u)", (uint8_t *)v2, 8u);
}

void sub_100035140(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = [a1 name];
  sub_100014F08();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "VACUUM after DELETE of (%@ : %@)", v6, 0x16u);
}

void sub_1000351EC()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Bundle prefix delete SQL: '%@'", v2, v3, v4, v5, v6);
}

void sub_100035254()
{
}

void sub_100035270()
{
  sub_100014F08();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to create %{public}s (%d)", v2, 0x12u);
}

void sub_1000352F4()
{
}

void sub_100035310(NSObject *a1)
{
  if (qword_1000AC608) {
    sqlite3_errmsg((sqlite3 *)qword_1000AC608);
  }
  sub_100014F08();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to open database: %{public}s", v2, 0xCu);
}

void sub_1000353B0()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to remove old database, not crashing", v2, v3, v4, v5, v6);
}

void sub_1000353E4()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to remove old database", v2, v3, v4, v5, v6);
}

void sub_100035418()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "SQL: %@", v2, v3, v4, v5, v6);
}

void sub_100035480()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Closing database.", v2, v3, v4, v5, v6);
}

id sub_10003584C(uint64_t a1)
{
  return [*(id *)(a1 + 32) watchPlistChanges];
}

void sub_100035B08(id a1)
{
  byte_1000AC620 = MGGetBoolAnswer();
}

void sub_1000364F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_CFBundleCreateUnique failed for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003656C()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "bundleRecordWithBundleIdentifier failed for %{public}@: %{public}@", v1);
}

void sub_1000365DC()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "%{public}@: Info.plist is missing or has invalid value for NSExtension/EXAppExtensionAttributes key: %{public}@", v1);
}

void sub_10003664C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 executableURL];
  sub_1000364DC();
  sub_100020E10((void *)&_mh_execute_header, a3, v5, "Unable to resolve realpath of: %{public}@: %{public}@", v6);
}

void sub_1000366E4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = [a1 bundleURL];
  sub_1000364DC();
  sub_100020E10((void *)&_mh_execute_header, a3, v5, "Unable to resolve realpath of: %{public}@: %{public}@", v6);
}

void sub_100036D10(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[TCCDIconGenerator _writeIcon:withDescriptor:toTempURL:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: unable to write icon to URL %@", (uint8_t *)&v2, 0x16u);
}

void sub_100036F44(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100036F64(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid filter key: must be the name of a TCC service, found %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100036FDC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_opt_class();
  sub_1000364DC();
  __int16 v7 = v5;
  uint64_t v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Invalid filter value: array must contain only strings, found %{public}@ in %{public}@: %{public}@", v6, 0x20u);
}

void sub_10003707C()
{
  objc_opt_class();
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v0, v1, "Invalid filter value: must be a BOOLean or an array, found %{public}@: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000370F8()
{
  objc_opt_class();
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v0, v1, "Invalid filter key: must be a string, found %{public}@: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100037174()
{
  objc_opt_class();
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v0, v1, "Invalid filter: must be a dictionary, found %{public}@: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100037984(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 3) {
      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003E1E4(a1, a2, v4);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
      uint64_t v6 = *(void *)(a1 + 48);
      __int16 v7 = [*(id *)(a1 + 56) name];
      int v8 = 138543874;
      int v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Terminating plugin %{public}@ of %{public}@ because access to the %{public}@ service changed.", (uint8_t *)&v8, 0x20u);
    }
  }
}

id sub_100037FDC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "analytics timer fired: attempting to surface events", v4, 2u);
  }

  return [*(id *)(a1 + 32) sendRecordMetricsForService:"kTCCServiceCalendar"];
}

id sub_1000389DC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) internalPreferenceBoolValueForName:@"generateBacktraceOnPrompt"];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = (_BYTE)result;
  return result;
}

uint64_t sub_10003905C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSMutableString) initWithString:@"FROM access WHERE service = ? AND strftime('%s','now') - last_modified > ?"];
  if ([*(id *)(a1 + 32) expireOnlyAllowedEntries]) {
    [v2 appendString:@" AND auth_value != 0"];
  }
  if (![*(id *)(a1 + 32) saveExpiredEntries]) {
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 40) logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [*(id *)(a1 + 32) name];
    *(_DWORD *)buf = 136446466;
    long long v20 = "-[TCCDServer purgeExpiredAccessEntriesForService:]_block_invoke";
    __int16 v21 = 2114;
    long long v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}s: Recording %{public}@ clients in expired table.", buf, 0x16u);
  }
  id v5 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO expired (service, client, client_type, csreq, last_modified) SELECT  service, client, client_type, csreq, last_modified %@", v2];
  id v6 = [v5 UTF8String];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003934C;
  v17[3] = &unk_1000950A8;
  id v18 = *(id *)(a1 + 32);
  uint64_t v7 = db_eval_locked((uint64_t)v6, v17, 0);

  if (!v7)
  {
LABEL_7:
    id v8 = +[NSString stringWithFormat:@"DELETE %@", v2];
    id v9 = [v8 UTF8String];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100039410;
    v15[3] = &unk_1000950A8;
    id v16 = *(id *)(a1 + 32);
    uint64_t v7 = db_eval_locked((uint64_t)v9, v15, 0);
    if (!v7)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000394D4;
      v13[3] = &unk_100095228;
      int8x16_t v12 = *(int8x16_t *)(a1 + 32);
      id v10 = (id)v12.i64[0];
      int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
      uint64_t v7 = db_eval_locked((uint64_t)"SELECT changes()", 0, v13);
    }
  }

  return v7;
}

void sub_10003934C(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) expirySeconds];
    int v6 = sqlite3_bind_int(a2, 2, (int)[v5 intValue]);

    if (!v6) {
      return;
    }
  }
  _db_error(1);
}

void sub_100039410(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) expirySeconds];
    int v6 = sqlite3_bind_int(a2, 2, (int)[v5 intValue]);

    if (!v6) {
      return;
    }
  }
  _db_error(1);
}

void sub_1000394D4(uint64_t a1, sqlite3_stmt *a2)
{
  int v3 = sqlite3_column_int(a2, 0);
  if (v3 >= 1)
  {
    int v4 = v3;
    id v5 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [*(id *)(a1 + 40) name];
      int v8 = 136446722;
      id v9 = "-[TCCDServer purgeExpiredAccessEntriesForService:]_block_invoke_3";
      __int16 v10 = 1024;
      int v11 = v4;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}s: purged %d expired access records for service: %{public}@", (uint8_t *)&v8, 0x1Cu);
    }
    uint64_t v7 = dispatch_get_global_queue(-32768, 0);
    dispatch_async(v7, &stru_100095F98);
  }
}

id sub_10003984C(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeExpiredAccessEntriesForService:*(void *)(a1 + 40)];
}

id sub_100039858(uint64_t a1)
{
  return [*(id *)(a1 + 32) purgeExpiredAccessEntriesForService:*(void *)(a1 + 40)];
}

void sub_10003A284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10003A2AC(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (!sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v5 = [*(id *)(a1 + 40) identifier];
    if (!sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      int v6 = sqlite3_bind_int(a2, 3, (int)objc_msgSend(*(id *)(a1 + 40), "client_type"));

      if (!v6) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  _db_error(1);
}

void sub_10003A398(uint64_t a1, sqlite3_stmt *a2)
{
  **(void **)(a1 + 64) = sqlite3_column_int64(a2, 0);
  **(void **)(a1 + 72) = sqlite3_column_int64(a2, 1);
  if (*(void *)(a1 + 80)) {
    **(_DWORD **)(a1 + 80) = sqlite3_column_int(a2, 4);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 3), **(void **)(a1 + 64), *(void *)(a1 + 40)))
  {
    id v4 = *(void **)(a1 + 72);
    **(void **)(a1 + 64) = 1;
    *id v4 = 5;
  }
  else if (sqlite3_column_type(a2, 2) != 5)
  {
    id v5 = sqlite3_column_blob(a2, 2);
    int v6 = sqlite3_column_bytes(a2, 2);
    if (v5 && v6 >= 1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = +[NSData dataWithBytes:v5 length:v6];
      _objc_release_x1();
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003E674((id *)(a1 + 40), a1, v7);
      }

      int v8 = *(void **)(a1 + 72);
      **(void **)(a1 + 64) = 0;
      void *v8 = 1;
    }
  }
}

void sub_10003AE3C(uint64_t a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text(a2, 1, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v4 = [*(id *)(a1 + 40) identifier];
    if (sqlite3_bind_text(a2, 2, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 3, (int)objc_msgSend(*(id *)(a1 + 40), "identifierAuthority"))|| sqlite3_bind_int64(a2, 4, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 48), "authorizationValue"))|| sqlite3_bind_int64(a2, 5, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 48), "authorizationReason"))|| sqlite3_bind_int64(a2, 6, (sqlite3_int64)objc_msgSend(*(id *)(a1 + 48), "authorizationVersion")))
    {
    }
    else
    {
      int v15 = sqlite3_bind_int(a2, 12, *(_DWORD *)(a1 + 80));

      if (!v15) {
        goto LABEL_9;
      }
    }
  }
  _db_error(1);
LABEL_9:
  if ([*(id *)(a1 + 56) type] == (id)1 && (id v5 = *(void **)(a1 + 64)) != 0)
  {
    int v6 = [v5 identifierAuthority];
    uint64_t v7 = [*(id *)(a1 + 64) identifier];
    int v8 = [*(id *)(a1 + 64) verifierData];
  }
  else if ([*(id *)(a1 + 56) type] == (id)2)
  {
    uint64_t v7 = (__CFString *)*(id *)(a1 + 72);
    int v8 = 0;
    int v6 = 3;
  }
  else
  {
    int v6 = 0;
    int v8 = 0;
    uint64_t v7 = @"UNUSED";
  }
  if (sqlite3_bind_int(a2, 8, v6)
    || sqlite3_bind_text(a2, 9, (const char *)-[__CFString UTF8String](v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| (id v9 = objc_retainAutorelease(v8), sqlite3_bind_blob(a2, 10, [v9 bytes], (int)objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)))
  {
    _db_error(1);
  }
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = sub_10000F8F4;
  int v34 = sub_10000F88C;
  id v35 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10003B3C0;
  v26[3] = &unk_100095CA0;
  id v27 = *(id *)(a1 + 32);
  id v28 = *(id *)(a1 + 40);
  __int16 v10 = v7;
  int v29 = v10;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003B4C0;
  v25[3] = &unk_1000951B8;
  v25[4] = &v30;
  if (db_eval_locked((uint64_t)"SELECT csreq FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ? AND indirect_object_identifier = ?", v26, v25))_db_error(1); {

  }
  if ([*(id *)(a1 + 40) verifierType] == (id)1
    && ([*(id *)(a1 + 40) verifierData],
        int v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v11)
    && (([*(id *)(a1 + 48) replaceStoredCodeRequirement] & 1) != 0 || !v31[5]))
  {
    id v12 = [*(id *)(a1 + 40) verifierData];
  }
  else
  {
    id v12 = (id)v31[5];
  }
  id v13 = v12;
  if (sqlite3_bind_blob(a2, 7, [v13 bytes], (int)objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  if ([*(id *)(a1 + 48) flags])
  {
    int v14 = [*(id *)(a1 + 48) flags];
    *((_DWORD *)v22 + 6) = v14;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003B560;
    v17[3] = &unk_100095CA0;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    long long v20 = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003B660;
    v16[3] = &unk_1000951B8;
    void v16[4] = &v21;
    if (db_eval_locked((uint64_t)"SELECT flags FROM access WHERE service = ? AND client = ? AND client_xpc_type_t type = ? AND indirect_object_identifier = ?", v17, v16))_db_error(1); {

    }
    int v14 = *((_DWORD *)v22 + 6);
  }
  sqlite3_bind_int(a2, 11, v14);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v30, 8);
}

void sub_10003B38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10003B3C0(id *a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text(a2, 1, (const char *)[a1[4] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v4 = [a1[5] identifier];
    if (sqlite3_bind_text(a2, 2, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 3, (int)objc_msgSend(a1[5], "identifierAuthority")))
    {
    }
    else
    {
      int v5 = sqlite3_bind_text(a2, 4, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      if (!v5) {
        return;
      }
    }
  }
  _db_error(1);
}

uint64_t sub_10003B4C0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = sqlite3_column_blob(a2, 0);
  uint64_t result = sqlite3_column_bytes(a2, 0);
  if (v4 && (int)result >= 1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSData dataWithBytes:v4 length:result];
    return _objc_release_x1();
  }
  return result;
}

void sub_10003B560(id *a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_text(a2, 1, (const char *)[a1[4] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v4 = [a1[5] identifier];
    if (sqlite3_bind_text(a2, 2, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 3, (int)objc_msgSend(a1[5], "identifierAuthority")))
    {
    }
    else
    {
      int v5 = sqlite3_bind_text(a2, 4, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      if (!v5) {
        return;
      }
    }
  }
  _db_error(1);
}

uint64_t sub_10003B660(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10003BBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

sqlite3_int64 sub_10003BBFC(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 result = sqlite3_column_int64(a2, 0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_10003C13C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) accessRecordFromStep:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  return _objc_release_x1();
}

void sub_10003C27C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v5 = *(void **)(a1 + 32);
  int v6 = [a2 descriptionDictionary];
  [v5 addObject:v6];

  *a4 = 0;
}

void sub_10003C3DC(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = +[NSString stringWithUTF8String:v3];
    [v4 addObject:v5];
  }
}

void sub_10003C570(uint64_t a1, sqlite3_stmt *a2)
{
  v9[0] = @"id";
  id v4 = +[NSNumber numberWithInt:sqlite3_column_int(a2, 0)];
  v10[0] = v4;
  v9[1] = @"bundle_id";
  id v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 1)];
  v10[1] = v5;
  v9[2] = @"uuid";
  int v6 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 2)];
  v10[2] = v6;
  v9[3] = @"display";
  uint64_t v7 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 3)];
  v10[3] = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  [*(id *)(a1 + 32) addObject:v8];
}

void sub_10003C800(uint64_t a1, sqlite3_stmt *a2)
{
  v7[0] = @"client";
  id v4 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  v7[1] = @"policy_id";
  v8[0] = v4;
  id v5 = +[NSNumber numberWithInt:sqlite3_column_int(a2, 2)];
  v8[1] = v5;
  int v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  [*(id *)(a1 + 32) addObject:v6];
}

_DWORD *sub_10003CB9C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) stateDumpDictionary];
  id v11 = 0;
  id v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v11];
  id v5 = v11;
  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003ECF4();
    }
  }
  if ((unint64_t)[v4 length] >> 32)
  {
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003ECB0(v9);
    }
    int v8 = 0;
  }
  else
  {
    unsigned int v7 = [v4 length];
    int v8 = malloc_type_calloc(1uLL, v7 + 200, 0x75A57665uLL);
    _DWORD *v8 = 1;
    v8[1] = v7;
    __strlcpy_chk();
    memcpy(v8 + 50, [v4 bytes], v7);
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003EC44();
    }
  }

  return v8;
}

void sub_10003D4D0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  id v5 = (const char *)[v4 UTF8String];
  if (!v5) {
    id v5 = (const char *)[*(id *)(a1 + 40) UTF8String];
  }
  if (!sqlite3_bind_text(a2, 1, v5, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    int v6 = [*(id *)(a1 + 48) subjectIdentity];
    id v7 = [v6 identifier];
    if (!sqlite3_bind_text(a2, 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      int v8 = [*(id *)(a1 + 48) subjectIdentity];
      if (!sqlite3_bind_int(a2, 3, (int)objc_msgSend(v8, "client_type"))
        && !sqlite3_bind_int64(a2, 4, *(void *)(a1 + 72))
        && !sqlite3_bind_int64(a2, 5, (sqlite3_int64)[*(id *)(a1 + 56) authorizationReason])
        && !sqlite3_bind_int64(a2, 6, (sqlite3_int64)[*(id *)(a1 + 56) authorizationVersion])
        && !sqlite3_bind_text(a2, 9, "UNUSED", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
        && !sqlite3_bind_int(a2, 10, *(_DWORD *)(a1 + 80))
        && !sqlite3_bind_int(a2, 14, (int)[*(id *)(a1 + 56) lastReminderTime]))
      {
        __int16 v10 = [*(id *)(a1 + 48) subjectIdentity];
        id v11 = objc_msgSend(v10, "policy_id");
        int v12 = sub_10003D788(a2, v11);

        if (!v12) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
  }

LABEL_15:
  _db_error(1);
LABEL_16:
  if (sqlite3_bind_null(a2, 11) || sqlite3_bind_null(a2, 12) || sqlite3_bind_null(a2, 13)) {
    _db_error(1);
  }
  id v9 = *(void **)(a1 + 64);
  if (v9)
  {
    if (!sqlite3_bind_blob(a2, 7, [v9 bytes], (int)objc_msgSend(*(id *)(a1 + 64), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))return; {
  }
    }
  else if (!sqlite3_bind_null(a2, 7))
  {
    return;
  }
  _db_error(1);
}

uint64_t sub_10003D788(sqlite3_stmt *a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 longLongValue];
    return sqlite3_bind_int64(a1, 8, (sqlite3_int64)v3);
  }
  else
  {
    return sqlite3_bind_null(a1, 8);
  }
}

void sub_10003D7F4(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (!sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    id v5 = [*(id *)(a1 + 40) subjectIdentity];
    id v6 = [v5 identifier];
    if (!sqlite3_bind_text(a2, 2, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      id v7 = [*(id *)(a1 + 40) subjectIdentity];
      int v8 = sqlite3_bind_int(a2, 3, (int)objc_msgSend(v7, "client_type"));

      if (!v8) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  _db_error(1);
}

void sub_10003D910(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) subjectIdentity];
  id v4 = [v6 identifier];
  id v5 = [*(id *)(a1 + 48) subjectIdentity];
  objc_msgSend(v2, "publishAccessChangedEvent:forService:client:clientType:authValue:andKillClient:", 3, v3, v4, objc_msgSend(v5, "client_type"), 1, 0);
}

void sub_10003DCD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10003DD04(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_text(a2, 0);
  uint64_t v4 = sqlite3_column_int(a2, 1);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 2);
  id v6 = sqlite3_column_text(a2, 6);
  uint64_t v7 = sqlite3_column_int(a2, 7);
  sqlite3_int64 v8 = sqlite3_column_int64(a2, 9);
  sqlite3_int64 v9 = sqlite3_column_int64(a2, 10);
  uint64_t v10 = sqlite3_column_int(a2, 11);
  v21[0] = @"subject_ID";
  id v11 = +[NSString stringWithUTF8String:v3];
  v22[0] = v11;
  v21[1] = @"subject_ID_type";
  int v12 = +[NSNumber numberWithInt:v4];
  v22[1] = v12;
  v21[2] = @"authorization_value";
  uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:v5];
  v22[2] = v13;
  v21[3] = @"indirect_object_id";
  int v14 = +[NSString stringWithUTF8String:v6];
  v22[3] = v14;
  v21[4] = @"indirect_object_type";
  int v15 = +[NSNumber numberWithInt:v7];
  v22[4] = v15;
  void v21[5] = @"auth_reason";
  id v16 = +[NSNumber numberWithUnsignedLongLong:v8];
  v22[5] = v16;
  v21[6] = @"auth_version";
  __int16 v17 = +[NSNumber numberWithUnsignedLongLong:v9];
  v22[6] = v17;
  v21[7] = @"flags";
  id v18 = +[NSNumber numberWithInt:v10];
  v22[7] = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:8];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v19];
}

void sub_10003DFA0(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_text(a2, 1, *(const char **)(a1 + 32), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

void sub_10003E174(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_10003E18C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void sub_10003E1A4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_10003E1E4(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 40) bundleIdentifier];
  sub_10003E1C4();
  int v8 = a2;
  sub_10003E174((void *)&_mh_execute_header, a3, v6, "Unable to kill %{public}@ (%d)", v7);
}

void sub_10003E284(void *a1)
{
  [a1 UTF8String];
  sub_100014F08();
  sub_100030488((void *)&_mh_execute_header, v1, v2, "service is nil, not publishing access change event for client: %s", v3, v4, v5, v6, v7);
}

void sub_10003E300()
{
  sub_10003E1C4();
  int v3 = v0;
  sub_10003E174((void *)&_mh_execute_header, v1, (uint64_t)v1, "Failed to post notification: %s, status=%d", v2);
}

void sub_10003E374()
{
}

void sub_10003E390()
{
}

void sub_10003E3AC()
{
}

void sub_10003E3C8()
{
}

void sub_10003E3E4(NSObject *a1)
{
  getuid();
  sub_10003E1D8();
  sub_10003E18C((void *)&_mh_execute_header, a1, v2, "failed to get passwd entry for uid %u", v3);
}

void sub_10003E464(NSObject *a1)
{
  getuid();
  sub_10003E1D8();
  sub_10003E18C((void *)&_mh_execute_header, a1, v2, "passwd entry for uid %u missing home directory", v3);
}

void sub_10003E4E4()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "failed to realpath %{public}s: error=%{public}@", v1);
}

void sub_10003E554()
{
  sub_10003E158();
  sub_10003E1A4((void *)&_mh_execute_header, v0, v1, "Found BOOLean preference value: %{public}@=%{BOOL}d");
}

void sub_10003E5BC(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 identifier];
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  unsigned int v8 = [a1 pid];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Process %{public}@[%d] is a composition manager.", (uint8_t *)&v5, 0x12u);
}

void sub_10003E674(id *a1, uint64_t a2, NSObject *a3)
{
  int v5 = [*a1 name];
  uint64_t v6 = [*(id *)(a2 + 48) identifier];
  int v8 = 138543618;
  sqlite3_int64 v9 = v5;
  sub_10003E148();
  sub_100020E10((void *)&_mh_execute_header, a3, v7, "Stored code identity data is invalid for: Service: %{public}@), client: %{public}@", (uint8_t *)&v8);
}

void sub_10003E72C(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 type];
  uint64_t v6 = [a2 description];
  int v8 = 134218242;
  id v9 = v5;
  sub_10003E148();
  sub_100020E10((void *)&_mh_execute_header, a3, v7, "Update Access Record: Unexpected indirect object identity type: %ld; for: %{public}@",
    (uint8_t *)&v8);
}

void sub_10003E7D8(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 subjectIdentity];
  id v5 = [v4 identityType];
  uint64_t v6 = [a1 description];
  int v8 = 134218242;
  id v9 = v5;
  sub_10003E148();
  sub_100020E10((void *)&_mh_execute_header, a2, v7, "Update Access Record: Unexpected identity type: %ld; for: %{public}@",
    (uint8_t *)&v8);
}

void sub_10003E894()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer evaluateComposedAuthorizationToService:andAccessSubject:withRelation:authorizationResult:authorizati"
       "onReason:subjectCodeIdentityDataResult:]";
  sub_10003E148();
  sub_100020E10((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", (uint8_t *)&v2);
}

void sub_10003E910()
{
  int v2 = 136446466;
  int v3 = "-[TCCDServer numberOfRecordsForService:withAuthorizationValue:]";
  sub_10003E148();
  sub_100020E10((void *)&_mh_execute_header, v0, v1, "%{public}s: database access error for: %{public}@", (uint8_t *)&v2);
}

void sub_10003E98C()
{
  sub_100014F08();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to find a service object for %{public}@", v1, 0xCu);
}

void sub_10003EA00()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "Database: entry for {%{public}@,  %{public}@} indirectObjectIdentifier is NULL.", v1);
}

void sub_10003EA70()
{
  sub_10003E1D8();
  sub_10003E18C((void *)&_mh_execute_header, v0, v1, "'SELECT * FROM access' failed: %d", v2);
}

void sub_10003EADC()
{
  v2[0] = 136446466;
  sub_100020F14();
  sub_10003E174((void *)&_mh_execute_header, v0, v1, "%{public}s: database access error for access_overrides: %d", (uint8_t *)v2);
}

void sub_10003EB54()
{
  v2[0] = 136446466;
  sub_100020F14();
  sub_10003E174((void *)&_mh_execute_header, v0, v1, "%{public}s: database access error for policies: %d", (uint8_t *)v2);
}

void sub_10003EBCC()
{
  v2[0] = 136446466;
  sub_100020F14();
  sub_10003E174((void *)&_mh_execute_header, v0, v1, "%{public}s: database access error for policies: %d", (uint8_t *)v2);
}

void sub_10003EC44()
{
  sub_10003E1D8();
  sub_10003E18C((void *)&_mh_execute_header, v0, v1, "State dump of %u bytes", v2);
}

void sub_10003ECB0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error serializing state data for tccd state dump: data size greater than UINT32_MAX", v1, 2u);
}

void sub_10003ECF4()
{
  sub_100014F08();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error serializing state data: %@", v1, 0xCu);
}

void sub_10003ED68(void *a1)
{
  uint64_t v1 = [a1 subjectIdentity];
  int v2 = [v1 identifier];
  sub_100014F08();
  sub_100030488((void *)&_mh_execute_header, v3, v4, "Failed: Reset kTCCServicePhotosAdd Access: %@", v5, v6, v7, v8, v9);
}

void sub_10003EE04(void *a1)
{
  uint64_t v1 = [a1 subjectIdentity];
  int v2 = [v1 identifier];
  sub_100014F08();
  sub_100030488((void *)&_mh_execute_header, v3, v4, "prompt type is upgrade but received a auth result of deny: %@", v5, v6, v7, v8, v9);
}

void sub_10003F928(id a1)
{
  id v1 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.tccd"];
  int v2 = (void *)qword_1000AC638;
  qword_1000AC638 = (uint64_t)v1;

  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)qword_1000AC640;
  qword_1000AC640 = v3;

  [(id)qword_1000AC638 setDelegate:qword_1000AC640];
  uint64_t v5 = (void *)qword_1000AC638;
  [v5 setWantsNotificationResponsesDelivered];
}

void sub_10003F9A8(id a1, NSError *a2)
{
  int v2 = a2;
  if (v2)
  {
    uint64_t v3 = tcc_access_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000419F8((uint64_t)v2, v3);
    }
  }
}

void sub_100040F44(id a1)
{
  dispatch_semaphore_t v1 = dispatch_semaphore_create(1);
  int v2 = (void *)qword_1000AC650;
  qword_1000AC650 = (uint64_t)v1;

  if (!v1) {
    sub_100041EC0();
  }
  dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
  uint64_t v4 = (void *)qword_1000AC658;
  qword_1000AC658 = (uint64_t)v3;

  if (!v3) {
    sub_100041EC0();
  }
}

id sub_100040FA8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)qword_1000AC670;
  uint64_t v7 = qword_1000AC670;
  if (!qword_1000AC670)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    void v3[2] = sub_1000410F4;
    v3[3] = &unk_100096198;
    void v3[4] = &v4;
    sub_1000410F4((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100041074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000410F4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000AC678)
  {
    v4[1] = _NSConcreteStackBlock;
    void v4[2] = 3221225472;
    v4[3] = sub_100041238;
    void v4[4] = &unk_1000961D0;
    void v4[5] = v4;
    long long v5 = off_1000961B8;
    uint64_t v6 = 0;
    qword_1000AC678 = _sl_dlopen();
    id v2 = (id)v4[0];
    if (!qword_1000AC678)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SPDeviceConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = sub_100041EDC();
LABEL_8:
    free(v2);
  }
  qword_1000AC670 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100041238()
{
  uint64_t result = _sl_dlopen();
  qword_1000AC678 = result;
  return result;
}

id sub_1000412AC()
{
  if (qword_1000AC688 != -1) {
    dispatch_once(&qword_1000AC688, &stru_1000961F0);
  }
  os_log_t v0 = (void *)qword_1000AC680;
  return v0;
}

void sub_100041300(const void *a1, const char *a2)
{
  uint64_t v4 = tcc_access_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v36 = "notificationResponseHandler";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v5 = +[NSValue valueWithPointer:a1];
  uint64_t v6 = sub_1000412AC();
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];

  uint8_t v9 = sub_1000412AC();
  uint64_t v10 = [v9 objectForKeyedSubscript:v5];
  id v11 = [v10 objectAtIndexedSubscript:1];

  int v12 = tcc_access_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v13)
    {
      int v14 = [v11 service];
      int v15 = [v14 name];
      id v16 = [v11 subjectIdentity];
      __int16 v17 = [v16 identifier];
      *(_DWORD *)buf = 134218498;
      long long v36 = a2;
      __int16 v37 = 2114;
      id v38 = v15;
      __int16 v39 = 2114;
      id v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CFUserNotification response: 0x%lx; service %{public}@ and subject %{public}@",
        buf,
        0x20u);
    }
    id v18 = sub_1000412AC();
    int v34 = v5;
    [v18 removeObjectForKey:v5];

    uint64_t v19 = 3;
    uint64_t v20 = 1;
    switch(a2 & 3)
    {
      case 1:
        goto LABEL_8;
      case 2:
        uint64_t v19 = 2;
LABEL_8:
        [v8 setAuthorizationReason:2];
        uint64_t v20 = v19;
        break;
      default:
        break;
    }
    [v8 setAuthorizationValue:v20];
    [v8 setDatabaseAction:1];
    uint64_t v21 = [v11 server];
    unsigned __int8 v22 = [v21 updateAuthorizationRecordFromContext:v11 forResult:v8 syncedUpdate:0];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = [v11 service];
      int v24 = [v11 identityDescription];
      [v8 denyAuthorizationWithErrorCode:4, @"Failed to update database %@ from %@", v23, v24 format];
    }
    CFRelease(a1);
    long long v25 = [v11 server];
    uint64_t v26 = [v25 platform];
    id v27 = [v11 service];
    id v28 = [v11 subjectIdentity];
    objc_msgSend(v26, "sendAnalyticsForAction:service:subjectIdentity:indirectObjectIdentity:authValue:includeV1AuthValue:v1AuthValue:desiredAuth:domainReason:promptType:", 4, v27, v28, 0, objc_msgSend(v8, "authorizationValue"), objc_msgSend(v8, "v1AuthorizationUpgrade") != 0, objc_msgSend(v8, "v1AuthorizationValue"), objc_msgSend(v11, "desiredAuth"), 0, objc_msgSend(v8, "promptType"));

    int v12 = tcc_access_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v29 = [v11 messageIdentifier];
      id v30 = [v8 authorizationValue];
      id v31 = [v8 authorizationReason];
      id v32 = [v8 authorizationVersion];
      int v33 = [v8 error];
      *(_DWORD *)buf = 138544386;
      long long v36 = v29;
      __int16 v37 = 2048;
      id v38 = v30;
      __int16 v39 = 2048;
      id v40 = v31;
      __int16 v41 = 2048;
      id v42 = v32;
      __int16 v43 = 2114;
      int v44 = v33;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "REMINDER_RESULT: msgID=%{public}@, authValue=%llu, authReason=%llu, authVersion=%llu, error=%{public}@,", buf, 0x34u);
    }
    long long v5 = v34;
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138412290;
    long long v36 = (const char *)a1;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Couldn't find result for notification %@", buf, 0xCu);
  }
}

void sub_1000417B4(uint64_t a1)
{
  id v5 = +[TCCDPlatform currentPlatform];
  id v2 = [*(id *)(a1 + 32) attributionChain];
  dispatch_semaphore_t v3 = [v2 accessingProcess];
  uint64_t v4 = [*(id *)(a1 + 32) service];
  [v5 runBacktraceToolOnProcess:v3 forService:v4];
}

void sub_100041854(id a1)
{
  qword_1000AC680 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
  _objc_release_x1();
}

void sub_100041890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041908(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041980(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000419F8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  dispatch_semaphore_t v3 = "-[TCCDRequestContext(AsynchronousNotification) presentAsynchronousDenialNotificationWithMessage:buttonTitle:]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: failed to add user notification: %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_100041A84(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 name];
  uint64_t v6 = [a2 identityDescription];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to construct localized notification string for service %{public}@ and subject %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100041B48()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 306, "header != nil");
}

void sub_100041B74()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 307, "aButtonTitle != nil");
}

void sub_100041BA0()
{
  __assert_rtn("display_prompt", "TCCDRequestContext+Prompt.m", 308, "bButtonTitle != nil");
}

void sub_100041BCC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating reminder notification", v1, 2u);
}

void sub_100041C10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "notification_dictionary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041C88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041CF4(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 integerValue];
  uint64_t v6 = [a2 subjectIdentity];
  int v7 = [v6 displayName];
  int v8 = 134218242;
  id v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "WK2 showUserNotification %ld for display name: %@", (uint8_t *)&v8, 0x16u);
}

void sub_100041DC0(void *a1, void *a2, NSObject *a3)
{
  id v5 = [a1 integerValue];
  uint64_t v6 = [a2 subjectIdentity];
  int v7 = [v6 displayName];
  int v8 = [a2 subjectIdentity];
  id v9 = [v8 pluginBundleIdentifier];
  int v10 = 134218498;
  id v11 = v5;
  __int16 v12 = 2112;
  BOOL v13 = v7;
  __int16 v14 = 2112;
  int v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "WK1 showUserNotification %ld for app: %@, extensionID: %@", (uint8_t *)&v10, 0x20u);
}

void sub_100041EC0()
{
}

id sub_100041EDC()
{
  os_log_t v0 = (TCCDAdhocSignatureCache *)abort_report_np();
  return [(TCCDAdhocSignatureCache *)v0 logHandle];
}

_DWORD *sub_1000423C8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) == 2)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_10000F904;
    uint64_t v21 = sub_10000F894;
    id v22 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    __int16 v4 = *(NSObject **)(v3 + 56);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000426CC;
    block[3] = &unk_100095518;
    block[4] = v3;
    void block[5] = &v17;
    dispatch_sync(v4, block);
    uint64_t v5 = v18[5];
    id v15 = 0;
    uint64_t v6 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:&v15];
    id v7 = v15;
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100043F6C();
      }
    }
    else if ((unint64_t)[v6 length] >> 32)
    {
      int v8 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10003ECB0(v8);
      }
    }
    else
    {
      unsigned int v10 = [v6 length];
      id v11 = malloc_type_calloc(1uLL, v10 + 200, 0x17EE4109uLL);
      id v9 = v11;
      if (v11)
      {
        _DWORD *v11 = 1;
        v11[1] = v10;
        __strlcpy_chk();
        memcpy(v9 + 50, [v6 bytes], v10);
        int v8 = [*(id *)(a1 + 32) logHandle];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v24 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AdhocSignatureCache dump of %u bytes", buf, 8u);
        }
        goto LABEL_15;
      }
      int v8 = [*(id *)(a1 + 32) logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = __error();
        BOOL v13 = strerror(*v12);
        sub_100043F24((uint64_t)v13, buf, v8);
      }
    }
    id v9 = 0;
LABEL_15:

    _Block_object_dispose(&v17, 8);
    return v9;
  }
  return 0;
}

void sub_100042690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000426CC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stateDump];
  return _objc_release_x1();
}

void sub_1000431B4(uint64_t a1)
{
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  id v3 = [v2 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (!v3)
  {
LABEL_27:

    return;
  }
  id v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v38;
  do
  {
    for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v38 != v6) {
        objc_enumerationMutation(v2);
      }
      int v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      id v9 = [v8 objectForKeyedSubscript:@"Size"];
      uint64_t v5 = &v5[(void)[v9 unsignedIntegerValue]];
    }
    id v4 = [v2 countByEnumeratingWithState:&v37 objects:v46 count:16];
  }
  while (v4);

  unsigned int v10 = *(void **)(a1 + 32);
  if ((unint64_t)v5 > v10[3])
  {
    id v11 = [v10 logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = *(void **)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218240;
      __int16 v43 = v5;
      __int16 v44 = 2048;
      id v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Cache size exceeds capacity, evicting lru items: cacheSize=%lu _capacity=%lu", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) keysSortedByValueUsingComparator:&stru_100096230];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v34;
      *(void *)&long long v13 = 138543618;
      long long v28 = v13;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v2);
          }
          id v15 = *(char **)(*((void *)&v33 + 1) + 8 * (void)j);
          id v31 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", v15, v28);
          id v16 = [v31 objectForKeyedSubscript:@"UUID"];
          uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 32);
          id v18 = [v16 UUIDString];
          uint64_t v19 = [v17 stringByAppendingPathComponent:v18];

          uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 48);
          id v32 = 0;
          unsigned __int8 v21 = [v20 removeItemAtPath:v19 error:&v32];
          id v22 = v32;
          uint64_t v23 = [*(id *)(a1 + 32) logHandle];
          unsigned int v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              __int16 v43 = v15;
              __int16 v44 = 2114;
              id v45 = v19;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Evicted cached signature: key=%{public}@, path=%{public}@", buf, 0x16u);
            }

            [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v15];
            [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v16];
            long long v25 = v31;
            uint64_t v26 = [v31 objectForKeyedSubscript:@"Size"];
            v5 -= (unint64_t)[v26 unsignedIntegerValue];
            unint64_t v27 = *(void *)(*(void *)(a1 + 32) + 24);

            if ((unint64_t)v5 < v27)
            {

              goto LABEL_26;
            }
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              __int16 v43 = (char *)v19;
              __int16 v44 = 2114;
              id v45 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error removing item %{public}@: %{public}@", buf, 0x16u);
            }

            long long v25 = v31;
          }
        }
        id v30 = [v2 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v30);
    }
LABEL_26:

    [*(id *)(a1 + 32) saveKeysToDirectory];
    goto LABEL_27;
  }
}

int64_t sub_1000435EC(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKey:@"LastUsed"];
  uint64_t v6 = [v4 objectForKey:@"LastUsed"];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100043790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000437A8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"UUID"];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    int v8 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v9 = [v8 logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100044714();
      }
    }
    else
    {
      uint64_t v10 = [v8 loadSignatureWithUUID:v4];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      __int16 v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        long long v13 = [*(id *)(a1 + 32) logHandle];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_1000446AC();
        }

        [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v4];
      }
    }
    __int16 v14 = *(void **)(a1 + 32);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v15 = v14[7];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000439DC;
      v19[3] = &unk_100094FE0;
      id v16 = v3;
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v20 = v16;
      uint64_t v21 = v17;
      dispatch_async(v15, v19);
      id v18 = v20;
    }
    else
    {
      id v18 = [v14 logHandle];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100044644();
      }
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000445DC();
    }
  }
}

void sub_1000439DC(uint64_t a1)
{
  id v2 = +[NSDate date];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"LastUsed"];

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"UsedCount"];
  id v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v4 integerValue] + 1);
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"UsedCount"];

  [*(id *)(a1 + 40) saveKeysToDirectory];
}

void sub_100043B80(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10004477C();
    }
  }
  else
  {
    uint64_t v5 = +[NSUUID UUID];
    uint64_t v6 = +[NSDate date];
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) length]);
    v15[0] = @"UUID";
    v15[1] = @"Created";
    v16[0] = v5;
    v16[1] = v6;
    v15[2] = @"LastUsed";
    v15[3] = @"UsedCount";
    v16[2] = v6;
    v16[3] = &off_10009CF58;
    void v15[4] = @"Size";
    void v16[4] = v7;
    id v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
    int v8 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKey:cost:", *(void *)(a1 + 48), v5, objc_msgSend(v7, "unsignedIntegerValue"));
    [*(id *)(a1 + 32) saveKeysToDirectory];
    [*(id *)(a1 + 32) saveSignature:*(void *)(a1 + 48) withUUID:v5];
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *v2;
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      __int16 v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Added signature: key=%{public}@ UUID=%{public}@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 32) maintainSize];
  }
}

void sub_100043E48(id a1)
{
  qword_1000AC698 = (uint64_t)os_log_create("com.apple.TCC", "AdhocSignatureCache");
  _objc_release_x1();
}

void sub_100043EA4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100043EBC()
{
  sub_100043EA4(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error creating state directory %{public}@: %{public}@");
}

void sub_100043F24(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error allocating memory for os_state_data_t: %s", buf, 0xCu);
}

void sub_100043F6C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Error serializing AdhocSignatureCache state: %@", v2, v3, v4, v5, v6);
}

void sub_100043FD4()
{
  sub_100043EA4(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error unarchiving keys from %{public}@: %{public}@");
}

void sub_10004403C()
{
  sub_100043EA4(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error reading archived keys from %{public}@: %{public}@");
}

void sub_1000440A4()
{
  sub_100043EA4(__stack_chk_guard);
  sub_10002DB64();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error writing archived keys to %{public}@: %{public}@");
}

void sub_10004410C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Error archiving keys: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100044174()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error reading signature from %{public}@: %{public}@");
}

void sub_1000441DC()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error writing signature to %{public}@: %{public}@");
}

void sub_100044244(void *a1, NSObject *a2)
{
  [a1 fileSystemRepresentation];
  sub_100014F08();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to collect mount relative tracking info: path=%{public}s", v3, 0xCu);
}

void sub_1000442D0(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  strerror(a3);
  sub_100043E8C();
  sub_100020DC0((void *)&_mh_execute_header, v5, v6, "Failed to get path attributes: path=%{public}s error=%{public}s", v7, v8, v9, v10, v11);
}

void sub_100044364()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "No persistent object ids for volume: volumePath=%{public}s", v2, v3, v4, v5, v6);
}

void sub_1000443CC()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "No UUID for volume: volumePath=%{public}s", v2, v3, v4, v5, v6);
}

void sub_100044434(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  strerror(a3);
  sub_100043E8C();
  sub_100020DC0((void *)&_mh_execute_header, v5, v6, "Failed to get volume attributes: volumePath=%{public}s error=%{public}s", v7, v8, v9, v10, v11);
}

void sub_1000444C8(void *a1, NSObject *a2)
{
  [a1 fileSystemRepresentation];
  uint64_t v3 = __error();
  strerror(*v3);
  sub_100043E8C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to stat path: path=%{public}s error=%{public}s", v4, 0x16u);
}

void sub_100044564(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SecCodeCopyPath failed: result=%d", (uint8_t *)v2, 8u);
}

void sub_1000445DC()
{
  sub_100043EA4(__stack_chk_guard);
  sub_100043EB0();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "No cache entry found: key=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100044644()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "No signature found: UUID=%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000446AC()
{
  sub_100043EA4(__stack_chk_guard);
  sub_100043EB0();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Got signature from on-disk cache: key=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100044714()
{
  sub_100043EA4(__stack_chk_guard);
  sub_100043EB0();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Got signature from in-memory cache: key=%{public}@", v2, v3, v4, v5, v6);
}

void sub_10004477C()
{
  sub_100043EA4(__stack_chk_guard);
  sub_100043EB0();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Rejecting request to update signature: key=%{public}@", v2, v3, v4, v5, v6);
}

void sub_100044884(uint64_t a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = [[TCCDService alloc] initWithName:@"kTCCServiceAll" availability:&off_10009DF18];
  [v1 addObject:v2];
  uint64_t v3 = (void *)qword_1000AC6B0;
  qword_1000AC6B0 = (uint64_t)v2;
  uint64_t v4 = v2;

  uint64_t v5 = [TCCDService alloc];
  uint8_t v6 = [(TCCDService *)v5 initWithName:@"kTCCServiceAddressBook" availability:&off_10009DF40];
  [(TCCDService *)v6 setUsageDescriptionKeyName:@"NSContactsUsageDescription"];
  [(TCCDService *)v6 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v6 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v6 setMacos_helpAnchor:@"mh40711"];
  [(TCCDService *)v6 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.addressbook"];
  [(TCCDService *)v6 setIos_allowRegionalPrompt:1];
  if (_os_feature_enabled_impl())
  {
    v250[0] = @"TCCDAlertConfig_SBRemoteAlertServiceName";
    v250[1] = @"TCCDAlertConfig_SBRemoteAlertViewControllerClassName";
    v251[0] = @"com.apple.ContactsUI.LimitedAccessPromptView";
    v251[1] = @"ContactsLimitedAccessPromptSceneDelegate";
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v251 forKeys:v250 count:2];
    uint64_t v8 = [[TCCDAlert alloc] initWithCondition:2 platformName:@"TCCDPlatformIOS" service:v6 displayPolicy:0 persistentStateType:-1 displayCountlimit:0 configuration:v7];
    uint64_t v9 = [TCCDAlertManager alloc];
    v249 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v249 count:1];
    uint8_t v11 = [(TCCDAlertManager *)v9 initWithAlerts:v10];
    [(TCCDService *)v6 setAlertManager:v11];

    [(TCCDService *)v6 setUsesTwoStagePrompting:1];
    [(TCCDService *)v6 setFirstStagePromptHeaderAssetCatalogPath:@"/System/Library/Frameworks/ContactsUI.framework/Assets.car"];
    [(TCCDService *)v6 setFirstStagePromptHeaderAssetName:@"PromptHeader"];
    uint64_t v12 = [(TCCDService *)v6 name];
    __int16 v13 = +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v12];
    [(TCCDService *)v6 setLimitedAuthorizationButtonTitleLocalizationKey:v13];

    [(TCCDService *)v6 setAuthorizationRightsMask:79];
    [(TCCDService *)v6 setSupportsStagedPrompting:1];
    [(TCCDService *)v6 setAuthorizationVersionNumber:2];
    [(TCCDService *)v6 setDefaultDesiredAuth:6];
    [(TCCDService *)v6 setSettingsRequestFullTitleTextLocalizationKey:@"REQUEST_ACCESS_SETTINGS_FULL_kTCCServiceAddressBook"];
    [(TCCDService *)v6 setCancelButtontitleLocalizationKey:@"REQUEST_ACCESS_DONT_ALLOW_kTCCServiceAddressBook_DONT_ALLOW"];
    [(TCCDService *)v6 _makePromptAuthorizationChoiceBlock:&stru_1000962D8];
    [(TCCDService *)v6 _makePromptButtonLocalizationKeyBlock:&stru_100096318];
  }
  [v1 addObject:v6];
  __int16 v14 = [[TCCDService alloc] initWithName:@"kTCCServiceContactsLimited" availability:&off_10009DF68];

  [(TCCDService *)v14 setUsageDescriptionKeyName:@"NSContactsUsageDescription"];
  [(TCCDService *)v14 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v14 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v14 setMacos_helpAnchor:@"mh40711"];
  [(TCCDService *)v14 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.addressbook"];
  [(TCCDService *)v14 setShouldTreatAsDeprecated:1];
  [v1 addObject:v14];
  id v15 = [[TCCDService alloc] initWithName:@"kTCCServiceContactsFull" availability:&off_10009DF90];

  [(TCCDService *)v15 setUsageDescriptionKeyName:@"NSContactsUsageDescription"];
  [(TCCDService *)v15 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v15 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v15 setMacos_helpAnchor:@"mh40711"];
  [(TCCDService *)v15 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.addressbook"];
  [(TCCDService *)v15 setShouldTreatAsDeprecated:1];
  [v1 addObject:v15];
  id v16 = [[TCCDService alloc] initWithName:@"kTCCServiceCalendar" availability:&off_10009DFB8];

  [(TCCDService *)v16 setUsageDescriptionKeyName:@"NSCalendarsUsageDescription"];
  [(TCCDService *)v16 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v16 setMacos_helpAnchor:@"mh43609"];
  [(TCCDService *)v16 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.calendars"];
  [(TCCDService *)v16 setAddModifyAddedAuthorizationButtonTitleLocalizationKey:@"REQUEST_ACCESS_ADD_MODIFY_ADDED"];
  [(TCCDService *)v16 setRequestFullTitleTextLocalizationKey:@"REQUEST_ACCESS_SERVICE_kTCCServiceCalendar_FULL"];
  [(TCCDService *)v16 setRequestAddTitleTextLocalizationKey:@"REQUEST_ACCESS_SERVICE_kTCCServiceCalendar_ADD"];
  [(TCCDService *)v16 setRequestUpgradeTitleTextLocalizationKey:@"REQUEST_ACCESS_UPGRADE_kTCCServiceCalendar"];
  [(TCCDService *)v16 setSettingsRequestFullTitleTextLocalizationKey:@"REQUEST_ACCESS_SETTINGS_FULL_kTCCServiceCalendar"];
  [(TCCDService *)v16 setFullAccessUsageDescriptionKeyName:@"NSCalendarsFullAccessUsageDescription"];
  [(TCCDService *)v16 setAddAccessUsageDescriptionKeyName:@"NSCalendarsWriteOnlyAccessUsageDescription"];
  [(TCCDService *)v16 setAuthorizationRightsMask:23];
  [(TCCDService *)v16 setSupportsStagedPrompting:1];
  [(TCCDService *)v16 setAuthorizationVersionNumber:2];
  [(TCCDService *)v16 setDefaultDesiredAuth:4];
  [(TCCDService *)v16 _makePromptAuthorizationChoiceBlock:&stru_100096338];
  [(TCCDService *)v16 _makePromptButtonLocalizationKeyBlock:&stru_100096358];
  uint64_t v247 = 0x10009D000;
  CFStringRef v248 = @"com.apple.EventKitTCCUI.EventKitTCCFullAccessNotificationUIExtension";
  uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v248 forKeys:&v247 count:1];
  [(TCCDService *)v16 setAuthSpecificNotificationExtensionBundleIdentifier:v17];

  [(TCCDService *)v16 _makeAuthTranslationBlock:&stru_100096398];
  v233[0] = _NSConcreteStackBlock;
  v233[1] = 3221225472;
  v233[2] = sub_100047BA8;
  v233[3] = &unk_1000963C0;
  id v234 = v16;
  id v18 = v16;
  v220 = objc_retainBlock(v233);
  -[TCCDService _makeAnalyticsPopulationBlock:](v18, "_makeAnalyticsPopulationBlock:");
  [v1 addObject:v18];
  uint64_t v19 = [TCCDService alloc];

  uint64_t v20 = [(TCCDService *)v19 initWithName:@"kTCCServiceReminders" availability:&off_10009DFE0];
  [(TCCDService *)v20 setUsageDescriptionKeyName:@"NSRemindersUsageDescription"];
  [(TCCDService *)v20 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v20 setMacos_helpAnchor:@"mchlcfc41e54"];
  [(TCCDService *)v20 setFullAccessUsageDescriptionKeyName:@"NSRemindersFullAccessUsageDescription"];
  [v1 addObject:v20];
  long long v231 = 0u;
  long long v232 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  id v21 = [&off_10009EAE8 countByEnumeratingWithState:&v229 objects:v246 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v230;
    do
    {
      unsigned int v24 = 0;
      long long v25 = v20;
      do
      {
        if (*(void *)v230 != v23) {
          objc_enumerationMutation(&off_10009EAE8);
        }
        uint64_t v20 = [[TCCDService alloc] initWithName:*(void *)(*((void *)&v229 + 1) + 8 * (void)v24) availability:&off_10009E008];

        [(TCCDService *)v20 setIsRevocable:1];
        [(TCCDService *)v20 setAlertStyle:1];
        [(TCCDService *)v20 setShouldTreatAsDeprecated:1];
        [v1 addObject:v20];
        unsigned int v24 = (char *)v24 + 1;
        long long v25 = v20;
      }
      while (v22 != v24);
      id v22 = [&off_10009EAE8 countByEnumeratingWithState:&v229 objects:v246 count:16];
    }
    while (v22);
  }
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  id v26 = [&off_10009EB00 countByEnumeratingWithState:&v225 objects:v245 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v226;
    do
    {
      uint64_t v29 = 0;
      id v30 = v20;
      do
      {
        if (*(void *)v226 != v28) {
          objc_enumerationMutation(&off_10009EB00);
        }
        uint64_t v20 = [[TCCDService alloc] initWithName:*(void *)(*((void *)&v225 + 1) + 8 * (void)v29) availability:&off_10009E030];

        [(TCCDService *)v20 setIsRevocable:1];
        [(TCCDService *)v20 setAlertStyle:1];
        [(TCCDService *)v20 setIsAccessAllowedByDefault:1];
        [(TCCDService *)v20 setMdm_macos_allowedInPayloadDefition:0];
        [v1 addObject:v20];
        uint64_t v29 = (char *)v29 + 1;
        id v30 = v20;
      }
      while (v27 != v29);
      id v27 = [&off_10009EB00 countByEnumeratingWithState:&v225 objects:v245 count:16];
    }
    while (v27);
  }
  id v31 = [[TCCDService alloc] initWithName:@"kTCCServicePhotos" availability:&off_10009E058];

  [(TCCDService *)v31 setUsageDescriptionKeyName:@"NSPhotoLibraryUsageDescription"];
  [(TCCDService *)v31 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v31 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.photos-library"];
  [(TCCDService *)v31 setAuthorizationRightsMask:15];
  [(TCCDService *)v31 setUpgradeV1AuthorizationValue:1];
  [(TCCDService *)v31 setAuthorizationVersionNumber:2];
  [(TCCDService *)v31 setDowngradeAuthRight:3];
  id v32 = [(TCCDService *)v31 name];
  long long v33 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v32];
  [(TCCDService *)v31 setAllowAuthorizationButtonTitleLocalizationKey:v33];

  long long v34 = [(TCCDService *)v31 allowAuthorizationButtonTitleLocalizationKey];

  if (!v34) {
    sub_10004A1E0();
  }
  long long v35 = [(TCCDService *)v31 name];
  long long v36 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v35];
  [(TCCDService *)v31 setDenyAuthorizationButtonTitleLocalizationKey:v36];

  long long v37 = [(TCCDService *)v31 denyAuthorizationButtonTitleLocalizationKey];

  if (!v37) {
    sub_10004A1E0();
  }
  long long v38 = [(TCCDService *)v31 name];
  long long v39 = +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v38];
  [(TCCDService *)v31 setLimitedAuthorizationButtonTitleLocalizationKey:v39];

  long long v40 = [(TCCDService *)v31 limitedAuthorizationButtonTitleLocalizationKey];

  if (!v40) {
    sub_10004A1E0();
  }
  [(TCCDService *)v31 setMacos_helpAnchor:@"mchl325bd573"];
  __int16 v41 = [TCCDAlert alloc];
  v243[0] = @"TCCDAlertConfig_SBRemoteAlertServiceName";
  v243[1] = @"TCCDAlertConfig_SBRemoteAlertViewControllerClassName";
  v244[0] = @"com.apple.Photos.PhotosUIService";
  v244[1] = @"PhotosUIServiceVirtualLibraryEducationViewController";
  id v42 = +[NSDictionary dictionaryWithObjects:v244 forKeys:v243 count:2];
  __int16 v43 = [(TCCDAlert *)v41 initWithCondition:1 platformName:@"TCCDPlatformIOS" service:v31 displayPolicy:2 persistentStateType:1 displayCountlimit:0 configuration:v42];

  __int16 v44 = [TCCDAlertManager alloc];
  v242 = v43;
  id v45 = +[NSArray arrayWithObjects:&v242 count:1];
  int v46 = [(TCCDAlertManager *)v44 initWithAlerts:v45];
  [(TCCDService *)v31 setAlertManager:v46];

  [(TCCDService *)v31 setRequestFullTitleTextLocalizationKey:@"REQUEST_ACCESS_SERVICE_kTCCServicePhotos_FULL"];
  [(TCCDService *)v31 setRequestLimitedTitleTextLocalizationKey:@"REQUEST_ACCESS_SERVICE_kTCCServicePhotos_LIMITED"];
  [(TCCDService *)v31 setSettingsRequestFullTitleTextLocalizationKey:@"REQUEST_ACCESS_SETTINGS_FULL_kTCCServicePhotos"];
  [(TCCDService *)v31 setRequestUpgradeTitleTextLocalizationKey:@"REQUEST_ACCESS_UPGRADE_kTCCServicePhotos"];
  [(TCCDService *)v31 setSupportsStagedPrompting:1];
  [(TCCDService *)v31 setAddModifyAddedAuthorizationButtonTitleLocalizationKey:@"REQUEST_ACCESS_ADD_MODIFY_ADDED"];
  [(TCCDService *)v31 _makePromptAuthorizationChoiceBlock:&stru_1000963E0];
  [(TCCDService *)v31 _makePromptButtonLocalizationKeyBlock:&stru_100096400];
  int v47 = [(TCCDService *)v31 name];
  int v48 = +[TCCDService reminderTitleTextLocalizationKeyNameForServiceName:v47];
  [(TCCDService *)v31 setReminderTitleTextLocalizationKey:v48];

  int v49 = [(TCCDService *)v31 name];
  int v50 = +[TCCDService reminderRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v49];
  [(TCCDService *)v31 setReminderAllowButtonTitleTextLocalizationKey:v50];

  int v51 = [(TCCDService *)v31 name];
  int v52 = +[TCCDService reminderRequestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v51];
  [(TCCDService *)v31 setReminderLimitedButtonTitleTextLocalizationKey:v52];

  [v1 addObject:v31];
  int v53 = [[TCCDService alloc] initWithName:@"kTCCServicePhotosAdd" availability:&off_10009E080];

  [(TCCDService *)v53 setUsageDescriptionKeyName:@"NSPhotoLibraryAddUsageDescription"];
  [(TCCDService *)v53 setSecondaryUsageDescriptionKeyName:@"NSPhotoLibraryUsageDescription"];
  [(TCCDService *)v53 setIOS_minimumSDKVersionNumber:&off_10009D018];
  [(TCCDService *)v53 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v53 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.personal-information.photos-library"];
  [(TCCDService *)v53 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v53];
  int v54 = [[TCCDService alloc] initWithName:@"kTCCServiceCamera" availability:&off_10009E0A8];

  [(TCCDService *)v54 setUsageDescriptionKeyName:@"NSCameraUsageDescription"];
  [(TCCDService *)v54 setSandboxOperationForDelegation:@"device-camera"];
  [(TCCDService *)v54 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.device.camera"];
  [(TCCDService *)v54 setMdm_isAuthorizationDenyOnly:1];
  [(TCCDService *)v54 setMacos_helpAnchor:@"mchlf88b936b"];
  [(TCCDService *)v54 setIos_allowPromptFromAppClip:1];
  [(TCCDService *)v54 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v54 setIos_useGenericSandboxExtension:1];
  [(TCCDService *)v54 setAllowedForAvocadoWidget:0];
  [v1 addObject:v54];
  id v55 = [[TCCDService alloc] initWithName:@"kTCCServiceMicrophone" availability:&off_10009E0D0];

  [(TCCDService *)v55 setUsageDescriptionKeyName:@"NSMicrophoneUsageDescription"];
  [(TCCDService *)v55 setSandboxOperationForDelegation:@"device-microphone"];
  [(TCCDService *)v55 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.device.audio-input"];
  [(TCCDService *)v55 setMdm_isAuthorizationDenyOnly:1];
  [(TCCDService *)v55 setMacos_helpAnchor:@"mchl7fa8e3cc"];
  [(TCCDService *)v55 setIos_allowPromptFromAppClip:1];
  [(TCCDService *)v55 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v55 setIos_useGenericSandboxExtension:1];
  [(TCCDService *)v55 setAllowedForAvocadoWidget:0];
  [v1 addObject:v55];
  uint64_t v56 = [[TCCDService alloc] initWithName:@"kTCCServiceWillow" availability:&off_10009E0F8];

  [(TCCDService *)v56 setUsageDescriptionKeyName:@"NSHomeKitUsageDescription"];
  [(TCCDService *)v56 setExternalName:@"HomeKit"];
  [(TCCDService *)v56 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v56];
  int v57 = [[TCCDService alloc] initWithName:@"kTCCServiceMediaLibrary" availability:&off_10009E120];

  [(TCCDService *)v57 setUsageDescriptionKeyName:@"NSAppleMusicUsageDescription"];
  [(TCCDService *)v57 setShouldIssueSandboxExtension:1];
  [(TCCDService *)v57 setMacos_minimumSDKVersionNumber:&off_10009D048];
  char v58 = +[NSNumber numberWithUnsignedLongLong:59616000];
  [(TCCDService *)v57 setExpirySeconds:v58];

  [(TCCDService *)v57 setExpireOnlyAllowedEntries:1];
  [(TCCDService *)v57 setSaveExpiredEntries:1];
  int v59 = +[TCCDPlatform currentPlatform];
  id v60 = [v59 configurationDictionary];
  id v61 = [v60 objectForKeyedSubscript:@"expiration.kTCCServiceMediaLibrary"];

  if (v61)
  {
    if ((uint64_t)[v61 integerValue] >= 1)
    {
      id v62 = [v61 integerValue];
      uint64_t v63 = [(TCCDService *)v57 expirySeconds];
      id v64 = [v63 integerValue];

      if ((uint64_t)v62 < (uint64_t)v64)
      {
        [(TCCDService *)v57 setExpirySeconds:v61];
        uint64_t v65 = +[TCCDPlatform currentPlatform];
        char v66 = [v65 server];
        id v67 = [v66 logHandle];

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          id v68 = [(TCCDService *)v57 name];
          *(_DWORD *)buf = 138543618;
          v239 = v68;
          __int16 v240 = 2114;
          v241 = v61;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "For %{public}@ set expirySeconds: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  [v1 addObject:v57];
  __int16 v69 = [[TCCDService alloc] initWithName:@"kTCCServiceSiri" availability:&off_10009E148];

  [(TCCDService *)v69 setUsageDescriptionKeyName:@"NSSiriUsageDescription"];
  unsigned int v70 = [(TCCDService *)v69 name];
  __int16 v71 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v70];
  [(TCCDService *)v69 setRequestAdditionalTextLocalizationKey:v71];

  [(TCCDService *)v69 setIsRevocable:1];
  [(TCCDService *)v69 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v69];
  int v72 = [[TCCDService alloc] initWithName:@"kTCCServiceMotion" availability:&off_10009E170];

  [(TCCDService *)v72 setUsageDescriptionKeyName:@"NSMotionUsageDescription"];
  [(TCCDService *)v72 setDisallowedOnPlatformSubtypeNameList:&off_10009EB18];
  [(TCCDService *)v72 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v72];
  __int16 v73 = [[TCCDService alloc] initWithName:@"kTCCServiceSpeechRecognition" availability:&off_10009E198];

  [(TCCDService *)v73 setUsageDescriptionKeyName:@"NSSpeechRecognitionUsageDescription"];
  id v74 = [(TCCDService *)v73 name];
  __int16 v75 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v74];
  [(TCCDService *)v73 setRequestAdditionalTextLocalizationKey:v75];

  [(TCCDService *)v73 setMacos_minimumSDKVersionNumber:&off_10009CFB8];
  [v1 addObject:v73];
  int v76 = [[TCCDService alloc] initWithName:@"kTCCServiceUserTracking" availability:&off_10009E1C0];

  [(TCCDService *)v76 setUsageDescriptionKeyName:@"NSUserTrackingUsageDescription"];
  [(TCCDService *)v76 setMacos_minimumSDKVersionNumber:&off_10009D060];
  [(TCCDService *)v76 setIOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v76 setWatchOS_minimumSDKVersionNumber:&off_10009D090];
  [(TCCDService *)v76 setTvOS_minimumSDKVersionNumber:&off_10009D078];
  __int16 v77 = [(TCCDService *)v76 name];
  int v78 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v77];
  [(TCCDService *)v76 setAllowAuthorizationButtonTitleLocalizationKey:v78];

  uint64_t v79 = [(TCCDService *)v76 allowAuthorizationButtonTitleLocalizationKey];

  if (!v79) {
    sub_10004A1E0();
  }
  id v80 = [(TCCDService *)v76 name];
  id v81 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v80];
  [(TCCDService *)v76 setDenyAuthorizationButtonTitleLocalizationKey:v81];

  id v82 = [(TCCDService *)v76 denyAuthorizationButtonTitleLocalizationKey];

  if (!v82) {
    sub_10004A1E0();
  }
  [v1 addObject:v76];
  id v83 = [[TCCDService alloc] initWithName:@"kTCCServiceBluetoothAlways" availability:&off_10009E1E8];

  [(TCCDService *)v83 setUsageDescriptionKeyName:@"NSBluetoothAlwaysUsageDescription"];
  [(TCCDService *)v83 setIOS_minimumSDKVersionNumber:&off_10009CFD0];
  [(TCCDService *)v83 setWatchOS_minimumSDKVersionNumber:&off_10009CFE8];
  [(TCCDService *)v83 setTvOS_minimumSDKVersionNumber:&off_10009CFD0];
  [(TCCDService *)v83 setMacos_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v83 setShouldUseADefaultDescriptionString:1];
  if (_os_feature_enabled_impl())
  {
    int v84 = [(TCCDService *)v83 name];
    uint64_t v85 = +[TCCDService requestAdditionalTextExtensionLocalizationKeyNameForServiceName:v84];
    [(TCCDService *)v83 setRequestNotificationExtensionTextLocalizationKey:v85];

    id v86 = *(void **)(a1 + 32);
    int v87 = [(TCCDService *)v83 requestTitleTextLocalizationKey];
    id v88 = [v86 localizationKeyNameWithFeatureFlagEnabled:v87];
    [(TCCDService *)v83 setRequestTitleTextLocalizationKey:v88];
  }
  [(TCCDService *)v83 setIos_allowPromptFromAppClip:1];
  [v1 addObject:v83];
  id v89 = [[TCCDService alloc] initWithName:@"kTCCServiceWebKitIntelligentTrackingPrevention" availability:&off_10009E210];

  [(TCCDService *)v89 setMacos_minimumSDKVersionNumber:&off_10009D060];
  [(TCCDService *)v89 setIOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v89 setWatchOS_minimumSDKVersionNumber:&off_10009D090];
  [(TCCDService *)v89 setTvOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v89 setIsRevocable:0];
  [(TCCDService *)v89 setAlertStyle:1];
  [(TCCDService *)v89 setIsAccessAllowedByDefault:1];
  [(TCCDService *)v89 setMdm_macos_allowedInPayloadDefition:1];
  [v1 addObject:v89];
  id v90 = [[TCCDService alloc] initWithName:@"kTCCServicePrototype3Rights" availability:&off_10009E238];

  [(TCCDService *)v90 setMacos_minimumSDKVersionNumber:&off_10009D060];
  [(TCCDService *)v90 setIOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v90 setWatchOS_minimumSDKVersionNumber:&off_10009D090];
  [(TCCDService *)v90 setTvOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v90 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v90];
  id v91 = [[TCCDService alloc] initWithName:@"kTCCServicePrototype4Rights" availability:&off_10009E260];

  [(TCCDService *)v91 setMacos_minimumSDKVersionNumber:&off_10009D060];
  [(TCCDService *)v91 setIOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v91 setWatchOS_minimumSDKVersionNumber:&off_10009D090];
  [(TCCDService *)v91 setTvOS_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v91 setMdm_macos_allowedInPayloadDefition:0];
  [(TCCDService *)v91 setAuthorizationRightsMask:15];
  [(TCCDService *)v91 setUpgradeV1AuthorizationValue:1];
  [(TCCDService *)v91 setAuthorizationVersionNumber:2];
  id v92 = [(TCCDService *)v91 name];
  id v93 = +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v92];
  [(TCCDService *)v91 setLimitedAuthorizationButtonTitleLocalizationKey:v93];

  [v1 addObject:v91];
  id v94 = [[TCCDService alloc] initWithName:@"kTCCServiceGameCenterFriends" availability:&off_10009E288];

  [(TCCDService *)v94 setMacos_minimumSDKVersionNumber:&off_10009D0A8];
  [(TCCDService *)v94 setIOS_minimumSDKVersionNumber:&off_10009D0C0];
  [(TCCDService *)v94 setWatchOS_minimumSDKVersionNumber:&off_10009D0D8];
  [(TCCDService *)v94 setTvOS_minimumSDKVersionNumber:&off_10009D0C0];
  v95 = [(TCCDService *)v94 name];
  __int16 v96 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v95];
  [(TCCDService *)v94 setAllowAuthorizationButtonTitleLocalizationKey:v96];

  __int16 v97 = [(TCCDService *)v94 allowAuthorizationButtonTitleLocalizationKey];

  if (!v97) {
    sub_10004A1E0();
  }
  uint64_t v98 = [(TCCDService *)v94 name];
  __int16 v99 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v98];
  [(TCCDService *)v94 setDenyAuthorizationButtonTitleLocalizationKey:v99];

  uint64_t v100 = [(TCCDService *)v94 denyAuthorizationButtonTitleLocalizationKey];

  if (!v100) {
    sub_10004A1E0();
  }
  v219 = v61;
  [(TCCDService *)v94 setDisallowedOnPlatformSubtypeNameList:&off_10009EB30];
  [(TCCDService *)v94 setUsageDescriptionKeyName:@"NSGKFriendListUsageDescription"];
  [v1 addObject:v94];
  __int16 v101 = [[TCCDService alloc] initWithName:@"kTCCServiceVoiceBanking" availability:&off_10009E2B0];

  id v102 = [(TCCDService *)v101 name];
  __int16 v103 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v102];
  [(TCCDService *)v101 setRequestAdditionalTextLocalizationKey:v103];

  [v1 addObject:v101];
  uint64_t v104 = [[TCCDService alloc] initWithName:@"kTCCServiceBluetoothPeripheral" availability:&off_10009E2D8];

  [(TCCDService *)v104 setUsageDescriptionKeyName:@"NSBluetoothPeripheralUsageDescription"];
  [v1 addObject:v104];
  v105 = [[TCCDService alloc] initWithName:@"kTCCServiceBluetoothWhileInUse" availability:&off_10009E300];

  [(TCCDService *)v105 setUsageDescriptionKeyName:@"NSBluetoothWhileInUseUsageDescription"];
  [(TCCDService *)v105 setIOS_minimumSDKVersionNumber:&off_10009CFD0];
  [(TCCDService *)v105 setWatchOS_minimumSDKVersionNumber:&off_10009CFE8];
  [(TCCDService *)v105 setTvOS_minimumSDKVersionNumber:&off_10009CFD0];
  [(TCCDService *)v105 setShouldTreatAsDeprecated:1];
  [v1 addObject:v105];
  unsigned int v106 = [[TCCDService alloc] initWithName:@"kTCCServiceKeyboardNetwork" availability:&off_10009E328];

  [(TCCDService *)v106 setAlertStyle:1];
  [(TCCDService *)v106 setShouldIssueSandboxExtension:1];
  [v1 addObject:v106];
  v107 = [[TCCDService alloc] initWithName:@"kTCCServiceMSO" availability:&off_10009E350];

  [(TCCDService *)v107 setIsRevocable:1];
  [(TCCDService *)v107 setAlertStyle:1];
  [v1 addObject:v107];
  v108 = [[TCCDService alloc] initWithName:@"kTCCServiceCalls" availability:&off_10009E378];

  [(TCCDService *)v108 setUsageDescriptionKeyName:@"NSVoIPUsageDescription"];
  [(TCCDService *)v108 setIOS_minimumSDKVersionNumber:&off_10009D108];
  [(TCCDService *)v108 setIsRevocable:1];
  [v1 addObject:v108];
  v109 = [[TCCDService alloc] initWithName:@"kTCCServiceFaceID" availability:&off_10009E3A0];

  [(TCCDService *)v109 setUsageDescriptionKeyName:@"NSFaceIDUsageDescription"];
  [(TCCDService *)v109 setShouldUseADefaultDescriptionString:1];
  [(TCCDService *)v109 setIOS_minimumSDKVersionNumber:&off_10009D0A8];
  [v1 addObject:v109];
  v236[0] = @"kTCCServiceSensorKitMotion";
  v236[1] = @"kTCCServiceSensorKitWatchMotion";
  v237[0] = &off_10009E3C8;
  v237[1] = &off_10009E3C8;
  v236[2] = @"kTCCServiceSensorKitLocationMetrics";
  v236[3] = @"kTCCServiceSensorKitAmbientLightSensor";
  v237[2] = &off_10009E3C8;
  v237[3] = &off_10009E3C8;
  v236[4] = @"kTCCServiceSensorKitWatchAmbientLightSensor";
  v236[5] = @"kTCCServiceSensorKitWatchHeartRate";
  v237[4] = &off_10009E3C8;
  v237[5] = &off_10009E3C8;
  v236[6] = @"kTCCServiceSensorKitWatchOnWristState";
  v236[7] = @"kTCCServiceSensorKitKeyboardMetrics";
  v237[6] = &off_10009E3C8;
  v237[7] = &off_10009E3C8;
  v236[8] = @"kTCCServiceSensorKitWatchPedometer";
  v236[9] = @"kTCCServiceSensorKitPedometer";
  v237[8] = &off_10009E3F0;
  v237[9] = &off_10009E3F0;
  v236[10] = @"kTCCServiceSensorKitWatchFallStats";
  v236[11] = @"kTCCServiceSensorKitWatchForegroundAppCategory";
  v237[10] = &off_10009E3F0;
  v237[11] = &off_10009E3F0;
  v236[12] = @"kTCCServiceSensorKitForegroundAppCategory";
  v236[13] = @"kTCCServiceSensorKitWatchSpeechMetrics";
  v237[12] = &off_10009E3F0;
  v237[13] = &off_10009E3F0;
  v236[14] = @"kTCCServiceSensorKitSpeechMetrics";
  v236[15] = @"kTCCServiceSensorKitMotionHeartRate";
  v237[14] = &off_10009E3F0;
  v237[15] = &off_10009E3F0;
  v236[16] = @"kTCCServiceSensorKitOdometer";
  v236[17] = @"kTCCServiceSensorKitElevation";
  v237[16] = &off_10009E3F0;
  v237[17] = &off_10009E3F0;
  v236[18] = @"kTCCServiceSensorKitStrideCalibration";
  v236[19] = @"kTCCServiceSensorKitDeviceUsage";
  v237[18] = &off_10009E3F0;
  v237[19] = &off_10009E3F0;
  v236[20] = @"kTCCServiceSensorKitPhoneUsage";
  v236[21] = @"kTCCServiceSensorKitMessageUsage";
  v237[20] = &off_10009E3F0;
  v237[21] = &off_10009E3F0;
  v236[22] = @"kTCCServiceSensorKitFacialMetrics";
  v236[23] = @"kTCCServiceSensorKitWristTemperature";
  v237[22] = &off_10009E418;
  v237[23] = &off_10009E440;
  v236[24] = @"kTCCServiceSensorKitHistoricalMobilityMetrics";
  v236[25] = @"kTCCServiceSensorKitHistoricalCardioMetrics";
  v237[24] = &off_10009E468;
  v237[25] = &off_10009E468;
  +[NSDictionary dictionaryWithObjects:v237 forKeys:v236 count:26];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  id v110 = (id)objc_claimAutoreleasedReturnValue();
  id v111 = [v110 countByEnumeratingWithState:&v221 objects:v235 count:16];
  if (v111)
  {
    id v112 = v111;
    uint64_t v113 = *(void *)v222;
    do
    {
      v114 = 0;
      v115 = v109;
      do
      {
        if (*(void *)v222 != v113) {
          objc_enumerationMutation(v110);
        }
        uint64_t v116 = *(void *)(*((void *)&v221 + 1) + 8 * (void)v114);
        v117 = [TCCDService alloc];
        v118 = [v110 objectForKeyedSubscript:v116];
        v109 = [(TCCDService *)v117 initWithName:v116 availability:v118];

        [(TCCDService *)v109 setIsRevocable:1];
        [(TCCDService *)v109 setAlertStyle:1];
        [v1 addObject:v109];
        v114 = (char *)v114 + 1;
        v115 = v109;
      }
      while (v112 != v114);
      id v112 = [v110 countByEnumeratingWithState:&v221 objects:v235 count:16];
    }
    while (v112);
  }

  BOOL v119 = [[TCCDService alloc] initWithName:@"kTCCServiceExposureNotificationRegion" availability:&off_10009E490];
  [(TCCDService *)v119 setIOS_minimumSDKVersionNumber:&off_10009D180];
  [(TCCDService *)v119 setIsRevocable:1];
  [(TCCDService *)v119 setAlertStyle:1];
  [v1 addObject:v119];
  v120 = [[TCCDService alloc] initWithName:@"kTCCServiceExposureNotification" availability:&off_10009E4B8];
  unsigned __int8 v121 = [(TCCDService *)v120 name];
  v122 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v121];
  [(TCCDService *)v120 setRequestAdditionalTextLocalizationKey:v122];

  BOOL v123 = [(TCCDService *)v120 requestAdditionalTextLocalizationKey];

  if (!v123) {
    sub_10004A1E0();
  }
  v124 = [(TCCDService *)v120 name];
  v125 = +[TCCDService requestTitleTextForSubsequentRequestsLocalizationKeyNameForServiceName:v124];
  [(TCCDService *)v120 setRequestTitleTextForSubsequentRequestsKey:v125];

  v126 = [(TCCDService *)v120 requestTitleTextForSubsequentRequestsKey];

  if (!v126) {
    sub_10004A1E0();
  }
  v127 = [(TCCDService *)v120 name];
  v128 = +[TCCDService requestAdditionalTextForSubsequentRequestsKeyNameForServiceName:v127];
  [(TCCDService *)v120 setRequestAdditionalTextForSubsequentRequestsLocalizationKey:v128];

  v129 = [(TCCDService *)v120 requestAdditionalTextForSubsequentRequestsLocalizationKey];

  if (!v129) {
    sub_10004A1E0();
  }
  [(TCCDService *)v120 setSubsequentRequestStringsRelatedService:v119];
  [(TCCDService *)v120 setIOS_minimumSDKVersionNumber:&off_10009D180];
  v130 = [(TCCDService *)v120 name];
  v131 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v130];
  [(TCCDService *)v120 setAllowAuthorizationButtonTitleLocalizationKey:v131];

  unsigned int v132 = [(TCCDService *)v120 allowAuthorizationButtonTitleLocalizationKey];

  if (!v132) {
    sub_10004A1E0();
  }
  v133 = [(TCCDService *)v120 name];
  v134 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v133];
  [(TCCDService *)v120 setDenyAuthorizationButtonTitleLocalizationKey:v134];

  v135 = [(TCCDService *)v120 denyAuthorizationButtonTitleLocalizationKey];

  if (!v135) {
    sub_10004A1E0();
  }
  v136 = [(TCCDService *)v120 name];
  v137 = +[TCCDService subsequentRequestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v136];
  [(TCCDService *)v120 setSubsequentRequestAllowAuthorizationButtonTitleLocalizationKey:v137];

  v138 = [(TCCDService *)v120 subsequentRequestAllowAuthorizationButtonTitleLocalizationKey];

  if (!v138) {
    sub_10004A1E0();
  }
  v139 = [(TCCDService *)v120 name];
  v140 = +[TCCDService subsequentRequestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v139];
  [(TCCDService *)v120 setSubsequentRequestDenyAuthorizationButtonTitleLocalizationKey:v140];

  v141 = [(TCCDService *)v120 subsequentRequestDenyAuthorizationButtonTitleLocalizationKey];

  if (!v141) {
    sub_10004A1E0();
  }
  [v1 addObject:v120];
  v142 = [[TCCDService alloc] initWithName:@"kTCCServiceContactlessAccess" availability:&off_10009E4E0];

  v143 = [(TCCDService *)v142 name];
  BOOL v144 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v143];
  [(TCCDService *)v142 setRequestAdditionalTextLocalizationKey:v144];

  [(TCCDService *)v142 setIsRevocable:1];
  [v1 addObject:v142];
  v145 = [[TCCDService alloc] initWithName:@"kTCCServiceSecureElementAccess" availability:&off_10009E508];

  [(TCCDService *)v145 setIsRevocable:1];
  v146 = [(TCCDService *)v145 name];
  v147 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v146];
  [(TCCDService *)v145 setRequestAdditionalTextLocalizationKey:v147];

  [v1 addObject:v145];
  v148 = [[TCCDService alloc] initWithName:@"kTCCServiceMicrophoneInjection" availability:&off_10009E530];

  [(TCCDService *)v148 setUsageDescriptionKeyName:@"NSMicrophoneInjectionUsageDescription"];
  v149 = [(TCCDService *)v148 name];
  v150 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v149];
  [(TCCDService *)v148 setRequestAdditionalTextLocalizationKey:v150];

  [v1 addObject:v148];
  v151 = [[TCCDService alloc] initWithName:@"kTCCServiceFallDetection" availability:&off_10009E558];

  [(TCCDService *)v151 setUsageDescriptionKeyName:@"NSFallDetectionUsageDescription"];
  [(TCCDService *)v151 setIOS_minimumSDKVersionNumber:&off_10009D1C8];
  [(TCCDService *)v151 setWatchOS_minimumSDKVersionNumber:&off_10009D1E0];
  [(TCCDService *)v151 setMdm_macos_allowedInPayloadDefition:0];
  v152 = [(TCCDService *)v151 name];
  v153 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v152];
  [(TCCDService *)v151 setRequestAdditionalTextLocalizationKey:v153];

  v154 = [(TCCDService *)v151 requestAdditionalTextLocalizationKey];

  if (!v154) {
    sub_10004A1E0();
  }
  unsigned __int8 v155 = [(TCCDService *)v151 name];
  v156 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v155];
  [(TCCDService *)v151 setAllowAuthorizationButtonTitleLocalizationKey:v156];

  v157 = [(TCCDService *)v151 allowAuthorizationButtonTitleLocalizationKey];

  if (!v157) {
    sub_10004A1E0();
  }
  v158 = [(TCCDService *)v151 name];
  v159 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v158];
  [(TCCDService *)v151 setDenyAuthorizationButtonTitleLocalizationKey:v159];

  v160 = [(TCCDService *)v151 denyAuthorizationButtonTitleLocalizationKey];

  if (!v160) {
    sub_10004A1E0();
  }
  [v1 addObject:v151];
  v161 = [[TCCDService alloc] initWithName:@"kTCCServiceSensorKitBedSensing" availability:&off_10009E580];

  [(TCCDService *)v161 setIsRevocable:1];
  [(TCCDService *)v161 setAlertStyle:1];
  [v1 addObject:v161];
  v162 = [[TCCDService alloc] initWithName:@"kTCCServiceSensorKitSoundDetection" availability:&off_10009E5A8];

  [(TCCDService *)v162 setIsRevocable:1];
  [(TCCDService *)v162 setAlertStyle:1];
  [v1 addObject:v162];
  v163 = [[TCCDService alloc] initWithName:@"kTCCServiceSensorKitBedSensingWriting" availability:&off_10009E5D0];

  [(TCCDService *)v163 setUsageDescriptionKeyName:@"NSSensorKitBedSensingWritingUsageDescription"];
  [(TCCDService *)v163 setIOS_minimumSDKVersionNumber:&off_10009D0C0];
  [(TCCDService *)v163 setWatchOS_minimumSDKVersionNumber:&off_10009D0D8];
  v164 = [(TCCDService *)v163 name];
  v165 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v164];
  [(TCCDService *)v163 setRequestAdditionalTextLocalizationKey:v165];

  id v166 = [(TCCDService *)v163 requestAdditionalTextLocalizationKey];

  if (!v166) {
    sub_10004A1E0();
  }
  v167 = [(TCCDService *)v163 name];
  v168 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v167];
  [(TCCDService *)v163 setAllowAuthorizationButtonTitleLocalizationKey:v168];

  unsigned __int8 v169 = [(TCCDService *)v163 allowAuthorizationButtonTitleLocalizationKey];

  if (!v169) {
    sub_10004A1E0();
  }
  [v1 addObject:v163];
  v170 = [[TCCDService alloc] initWithName:@"kTCCServiceSensorKitMediaEvents" availability:&off_10009E5F8];

  [(TCCDService *)v170 setIsRevocable:1];
  [(TCCDService *)v170 setAlertStyle:1];
  [v1 addObject:v170];
  v171 = [[TCCDService alloc] initWithName:@"kTCCServiceNearbyInteraction" availability:&off_10009E620];

  [(TCCDService *)v171 setUsageDescriptionKeyName:@"NSNearbyInteractionUsageDescription"];
  [(TCCDService *)v171 setIOS_minimumSDKVersionNumber:&off_10009D048];
  [(TCCDService *)v171 setWatchOS_minimumSDKVersionNumber:&off_10009D228];
  [v1 addObject:v171];
  v172 = [[TCCDService alloc] initWithName:@"kTCCServiceCrashDetection" availability:&off_10009E648];

  [(TCCDService *)v172 setIsRevocable:1];
  [(TCCDService *)v172 setAlertStyle:1];
  [v1 addObject:v172];
  v173 = [[TCCDService alloc] initWithName:@"kTCCServiceFinancialData" availability:&off_10009E670];

  [(TCCDService *)v173 setUsageDescriptionKeyName:@"NSFinancialDataUsageDescription"];
  [(TCCDService *)v173 setMdm_isAuthorizationDenyOnly:1];
  [(TCCDService *)v173 setSupportsStagedPrompting:1];
  v174 = [(TCCDService *)v173 name];
  v175 = +[TCCDService requestLimitedAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v174];
  [(TCCDService *)v173 setLimitedAuthorizationButtonTitleLocalizationKey:v175];

  [(TCCDService *)v173 setDefaultDesiredAuth:3];
  [(TCCDService *)v173 setAuthorizationVersionNumber:2];
  [(TCCDService *)v173 _makePromptAuthorizationChoiceBlock:&stru_100096420];
  [v1 addObject:v173];
  v176 = [[TCCDService alloc] initWithName:@"kTCCServiceWebBrowserPublicKeyCredential" availability:&off_10009E698];

  v177 = [(TCCDService *)v176 name];
  v178 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v177];
  [(TCCDService *)v176 setRequestAdditionalTextLocalizationKey:v178];

  [(TCCDService *)v176 setMacos_pardonMissingUsage:1];
  [v1 addObject:v176];
  v179 = [[TCCDService alloc] initWithName:@"kTCCServicePasteboard" availability:&off_10009E6C0];

  [(TCCDService *)v179 setIOS_minimumSDKVersionNumber:&off_10009D180];
  [(TCCDService *)v179 setMacos_minimumSDKVersionNumber:&off_10009D180];
  [(TCCDService *)v179 setIsRevocable:1];
  [(TCCDService *)v179 setAlertStyle:1];
  [(TCCDService *)v179 setAuthorizationRightsMask:15];
  [(TCCDService *)v179 setAuthorizationVersionNumber:2];
  [v1 addObject:v179];
  v180 = [[TCCDService alloc] initWithName:@"kTCCServiceFocusStatus" availability:&off_10009E6E8];

  [(TCCDService *)v180 setUsageDescriptionKeyName:@"NSFocusStatusUsageDescription"];
  [(TCCDService *)v180 setMacos_minimumSDKVersionNumber:&off_10009D108];
  [(TCCDService *)v180 setIOS_minimumSDKVersionNumber:&off_10009D048];
  [(TCCDService *)v180 setWatchOS_minimumSDKVersionNumber:&off_10009D228];
  v181 = [(TCCDService *)v180 name];
  v182 = +[TCCDService requestAllowAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v181];
  [(TCCDService *)v180 setAllowAuthorizationButtonTitleLocalizationKey:v182];

  v183 = [(TCCDService *)v180 allowAuthorizationButtonTitleLocalizationKey];

  if (!v183) {
    sub_10004A1E0();
  }
  v184 = [(TCCDService *)v180 name];
  int v185 = +[TCCDService requestDenyAuthorizationButtonTitleTextLocalizationKeyNameForServiceName:v184];
  [(TCCDService *)v180 setDenyAuthorizationButtonTitleLocalizationKey:v185];

  v186 = [(TCCDService *)v180 denyAuthorizationButtonTitleLocalizationKey];

  if (!v186) {
    sub_10004A1E0();
  }
  [(TCCDService *)v180 setMdm_macos_allowedInPayloadDefition:1];
  [v1 addObject:v180];
  v187 = [[TCCDService alloc] initWithName:@"kTCCServiceUserAvailability" availability:&off_10009E710];

  [(TCCDService *)v187 setUsageDescriptionKeyName:@"NSUserAvailabilityNameUsageDescription"];
  [(TCCDService *)v187 setMacos_minimumSDKVersionNumber:&off_10009D108];
  [(TCCDService *)v187 setIOS_minimumSDKVersionNumber:&off_10009D048];
  [(TCCDService *)v187 setWatchOS_minimumSDKVersionNumber:&off_10009D228];
  [(TCCDService *)v187 setMdm_macos_allowedInPayloadDefition:1];
  [v1 addObject:v187];
  v188 = [[TCCDService alloc] initWithName:@"kTCCServiceLinkedIn" availability:&off_10009E738];

  [(TCCDService *)v188 setAlertStyle:1];
  [(TCCDService *)v188 setIsRevocable:1];
  [(TCCDService *)v188 setShouldTreatAsDeprecated:1];
  [v1 addObject:v188];
  v189 = [[TCCDService alloc] initWithName:@"kTCCServiceAccessibility" availability:&off_10009E760];

  [(TCCDService *)v189 setAlertStyle:1];
  [(TCCDService *)v189 setShouldAllowUnrestrictedCheckAuditToken:1];
  [(TCCDService *)v189 setHasParanoidSecurityPolicy:1];
  [(TCCDService *)v189 setMacos_isPerSystem:1];
  [(TCCDService *)v189 setMacos_compositionPromoteChildAuthorizationToParent:1];
  [v1 addObject:v189];
  v190 = [[TCCDService alloc] initWithName:@"kTCCServicePostEvent" availability:&off_10009E788];
  [(TCCDService *)v190 setHasParanoidSecurityPolicy:1];
  [(TCCDService *)v190 setMacos_isPerSystem:1];
  [(TCCDService *)v190 setAlertStyle:3];
  [(TCCDService *)v190 setDoNotStoreDefaultAllowAccess:1];
  [v1 addObject:v190];
  v191 = [[TCCDService alloc] initWithName:@"kTCCServiceListenEvent" availability:&off_10009E7B0];
  [(TCCDService *)v191 setHasParanoidSecurityPolicy:1];
  [(TCCDService *)v191 setMacos_isPerSystem:1];
  [(TCCDService *)v191 setAlertStyle:3];
  [(TCCDService *)v191 setDoNotStoreDefaultAllowAccess:1];
  [(TCCDService *)v191 setMdm_isAuthorizationDenyOnly:1];
  [(TCCDService *)v191 setMdm_allowStandardUserToSetSystemService:1];
  v192 = v191;
  [v1 addObject:v192];
  [(TCCDService *)v189 setMacos_compositionChildService:v190];
  [(TCCDService *)v190 setMacos_compositionParentService:v189];
  [(TCCDService *)v192 setMacos_compositionParentService:v190];

  v193 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyAllFiles" availability:&off_10009E7D8];
  [(TCCDService *)v193 setAlertStyle:1];
  [(TCCDService *)v193 setIsAccessDeniedByDefault:1];
  [(TCCDService *)v193 setMacos_isPerSystem:1];
  [v1 addObject:v193];
  v217 = v119;
  v194 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyAppBundles" availability:&off_10009E800];

  [(TCCDService *)v194 setAlertStyle:2];
  v195 = +[NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_AppBundles"];
  [(TCCDService *)v194 setNotificationActionURL:v195];

  [(TCCDService *)v194 setUsageDescriptionKeyName:@"NSAppBundlesUsageDescription"];
  [(TCCDService *)v194 setIsAccessDeniedByDefault:1];
  [v1 addObject:v194];
  v196 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicySysAdminFiles" availability:&off_10009E828];

  [(TCCDService *)v196 setUsageDescriptionKeyName:@"NSSystemAdministrationUsageDescription"];
  [(TCCDService *)v196 setExpirySeconds:&off_10009D288];
  [(TCCDService *)v196 setMacos_helpAnchor:@"mchlccb25729"];
  [v1 addObject:v196];
  BOOL v197 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyDeveloperFiles" availability:&off_10009E850];

  [(TCCDService *)v197 setShouldTreatAsDeprecated:1];
  [v1 addObject:v197];
  v198 = [[TCCDService alloc] initWithName:@"kTCCServiceAppleEvents" availability:&off_10009E878];

  [(TCCDService *)v198 setMacos_hasIndirectObject:1];
  [(TCCDService *)v198 setMacos_shouldAllowSameTeam:1];
  [(TCCDService *)v198 setUsageDescriptionKeyName:@"NSAppleEventsUsageDescription"];
  [(TCCDService *)v198 setMacos_helpAnchor:@"mchl108e1718"];
  [(TCCDService *)v198 setMacos_hardenedRuntimeEntitlementName:@"com.apple.security.automation.apple-events"];
  [v1 addObject:v198];
  v199 = [[TCCDService alloc] initWithName:@"kTCCServiceScreenCapture" availability:&off_10009E8A0];

  [(TCCDService *)v199 setCheckAllowEntitlementOnResponsibleProcess:1];
  [(TCCDService *)v199 setMacos_isPerSystem:1];
  [(TCCDService *)v199 setAlertStyle:3];
  [(TCCDService *)v199 setDoNotStoreDefaultAllowAccess:1];
  [(TCCDService *)v199 setMacos_helpAnchor:@"mchl592e5686"];
  [(TCCDService *)v199 setMdm_isAuthorizationDenyOnly:1];
  [(TCCDService *)v199 setMdm_allowStandardUserToSetSystemService:1];
  [v1 addObject:v199];
  v200 = [[TCCDService alloc] initWithName:@"kTCCServiceRemoteDesktop" availability:&off_10009E8C8];

  [(TCCDService *)v200 setMacos_minimumSDKVersionNumber:&off_10009D078];
  [(TCCDService *)v200 setAlertStyle:3];
  [(TCCDService *)v200 setMacos_isPerSystem:1];
  [v1 addObject:v200];
  v201 = [[TCCDService alloc] initWithName:@"kTCCServiceDeveloperTool" availability:&off_10009E8F0];

  [(TCCDService *)v201 setMacos_helpAnchor:@"mchl830dc1d6"];
  [(TCCDService *)v201 setAlertStyle:1];
  [(TCCDService *)v201 setMacos_isPerSystem:1];
  [(TCCDService *)v201 setCheckAllowEntitlementOnResponsibleProcess:1];
  [(TCCDService *)v201 setMdm_macos_allowedInPayloadDefition:0];
  [v1 addObject:v201];
  v202 = [[TCCDService alloc] initWithName:@"kTCCServiceFSKitBlockDevice" availability:&off_10009E918];

  v203 = [(TCCDService *)v202 name];
  v204 = +[TCCDService requestAdditionalTextLocalizationKeyNameForServiceName:v203];
  [(TCCDService *)v202 setRequestAdditionalTextLocalizationKey:v204];

  [(TCCDService *)v202 setUsageDescriptionKeyName:@"NSFSKitBlockDeviceUsageDescription"];
  [(TCCDService *)v202 setMacos_minimumSDKVersionNumber:&off_10009D048];
  [v1 addObject:v202];
  v205 = [[TCCDService alloc] initWithName:@"kTCCServiceFileProviderPresence" availability:&off_10009E940];

  [(TCCDService *)v205 setUsageDescriptionKeyName:@"NSFileProviderPresenceUsageDescription"];
  [(TCCDService *)v205 setMacos_minimumSDKVersionNumber:&off_10009CFB8];
  [v1 addObject:v205];
  v206 = [[TCCDService alloc] initWithName:@"kTCCServiceFileProviderDomain" availability:&off_10009E968];

  [(TCCDService *)v206 setMacos_hasIndirectObject:1];
  [(TCCDService *)v206 setUsageDescriptionKeyName:@"NSFileProviderDomainUsageDescription"];
  [(TCCDService *)v206 setMacos_minimumSDKVersionNumber:&off_10009CFB8];
  [(TCCDService *)v206 setMdm_macos_allowedInPayloadDefition:0];
  [(TCCDService *)v206 setMacos_helpAnchor:@"mchl4206cab8"];
  [v1 addObject:v206];
  id v207 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyAppData" availability:&off_10009E990];

  [(TCCDService *)v207 setUsageDescriptionKeyName:@"NSAppDataUsageDescription"];
  [(TCCDService *)v207 setMacos_minimumSDKVersionNumber:&off_10009D180];
  [(TCCDService *)v207 setShouldUseADefaultDescriptionString:1];
  [(TCCDService *)v207 setSessionPidAuthorizationButtonTitleLocalizationKey:@"REQUEST_ACCESS_SESSION_PID"];
  [(TCCDService *)v207 setAuthorizationRightsMask:39];
  [(TCCDService *)v207 setSupportsStagedPrompting:1];
  [(TCCDService *)v207 _makePromptAuthorizationChoiceBlock:&stru_100096440];
  [v1 addObject:v207];
  id v208 = [[TCCDService alloc] initWithName:@"kTCCServiceVirtualMachineNetworking" availability:&off_10009E9B8];

  [(TCCDService *)v208 setMacos_minimumSDKVersionNumber:&off_10009D078];
  [v1 addObject:v208];
  v209 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyRemovableVolumes" availability:&off_10009E9E0];

  [(TCCDService *)v209 setMacos_helpAnchor:@"mchl6f613f75"];
  [(TCCDService *)v209 setUsageDescriptionKeyName:@"NSRemovableVolumesUsageDescription"];
  [v1 addObject:v209];
  v210 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyNetworkVolumes" availability:&off_10009EA08];

  [(TCCDService *)v210 setMacos_helpAnchor:@"mchl336d3371"];
  [(TCCDService *)v210 setUsageDescriptionKeyName:@"NSNetworkVolumesUsageDescription"];
  [v1 addObject:v210];
  v211 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyDesktopFolder" availability:&off_10009EA30];

  [(TCCDService *)v211 setMacos_helpAnchor:@"mchlf62acc05"];
  [(TCCDService *)v211 setUsageDescriptionKeyName:@"NSDesktopFolderUsageDescription"];
  [v1 addObject:v211];
  id v212 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyDownloadsFolder" availability:&off_10009EA58];

  [(TCCDService *)v212 setMacos_helpAnchor:@"mchld27a5c7a"];
  [(TCCDService *)v212 setUsageDescriptionKeyName:@"NSDownloadsFolderUsageDescription"];
  [v1 addObject:v212];
  v213 = [[TCCDService alloc] initWithName:@"kTCCServiceSystemPolicyDocumentsFolder" availability:&off_10009EA80];

  [(TCCDService *)v213 setMacos_helpAnchor:@"mchl1ffddf58"];
  [(TCCDService *)v213 setUsageDescriptionKeyName:@"NSDocumentsFolderUsageDescription"];
  [v1 addObject:v213];
  v214 = [[TCCDService alloc] initWithName:@"kTCCServiceAudioCapture" availability:&off_10009EAA8];

  [(TCCDService *)v214 setUsageDescriptionKeyName:@"NSAudioCaptureUsageDescription"];
  [(TCCDService *)v214 setMacos_pardonMissingUsage:1];
  [(TCCDService *)v214 setMdm_macos_allowedInPayloadDefition:0];
  [(TCCDService *)v214 setMacos_helpAnchor:@"mchl2844ecab"];
  [v1 addObject:v214];
  id v215 = [v1 copy];
  v216 = (void *)qword_1000AC6A0;
  qword_1000AC6A0 = (uint64_t)v215;
}

int sub_1000479F8(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0;
  if (a2 == 6)
  {
    if ((a3 | 4) == 6)
    {
      if (!v8) {
        return 0;
      }
      unint64_t v10 = 3;
      unint64_t v11 = 2;
      goto LABEL_20;
    }
    return -1;
  }
  if (a2 != 1) {
    return -1;
  }
  if (a3 == 6)
  {
    int result = 0;
  }
  else
  {
    LOBYTE(v8) = 0;
    int result = -1;
  }
  if (v8)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 6;
LABEL_20:
    int result = 0;
    *a4 = v11;
    *a5 = v10;
    *a6 = 1;
  }
  return result;
}

NSString *__cdecl sub_100047A74(id a1, unint64_t a2, unint64_t a3)
{
  CFStringRef v3 = @"REQUEST_ACCESS_DONT_ALLOW_kTCCServiceAddressBook_DONT_ALLOW";
  if (a2) {
    CFStringRef v3 = 0;
  }
  CFStringRef v4 = @"REQUEST_ACCESS_FULL_kTCCServiceAddressBook_FULL_ACCESS_PROMPT";
  if (a2 != 2) {
    CFStringRef v4 = 0;
  }
  CFStringRef v5 = @"REQUEST_ACCESS_LEARN_MORE_kTCCServiceAddressBook_LEARN_MORE";
  if (a2 != 6) {
    CFStringRef v5 = 0;
  }
  if (a3 != 6) {
    CFStringRef v5 = 0;
  }
  if (a3 != 2) {
    CFStringRef v4 = v5;
  }
  if (a3) {
    return &v4->isa;
  }
  else {
    return &v3->isa;
  }
}

int sub_100047AC0(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0;
  if (a2 != 4)
  {
    if (a2 == 1)
    {
      if (a3 == 2)
      {
        if (v8)
        {
          unint64_t v11 = 0;
          unint64_t v9 = 2;
          goto LABEL_25;
        }
        return 0;
      }
      if (a3 == 4)
      {
        if (v8)
        {
          unint64_t v9 = 0;
LABEL_22:
          unint64_t v11 = 4;
LABEL_25:
          int result = 0;
          *a4 = v11;
          *a5 = v9;
          *a6 = 1;
          return result;
        }
        return 0;
      }
    }
    return -1;
  }
  if (a3 == 2)
  {
    int result = 0;
  }
  else
  {
    int v8 = 0;
    int result = -1;
  }
  if (v8 == 1)
  {
    unint64_t v9 = 2;
    goto LABEL_22;
  }
  return result;
}

NSString *__cdecl sub_100047B50(id a1, unint64_t a2, unint64_t a3)
{
  CFStringRef v3 = @"REQUEST_ACCESS_FULL_kTCCServiceCalendar_FULL";
  if (a2 != 2) {
    CFStringRef v3 = 0;
  }
  CFStringRef v4 = @"REQUEST_ACCESS_ADD_kTCCServiceCalendar_ADD";
  if (a2 != 4) {
    CFStringRef v4 = 0;
  }
  if (a3 != 4) {
    CFStringRef v4 = 0;
  }
  if (a3 == 2) {
    return &v3->isa;
  }
  else {
    return &v4->isa;
  }
}

unint64_t sub_100047B84(id a1, unint64_t a2, BOOL a3)
{
  unint64_t v3 = 4;
  if (a2 != 2) {
    unint64_t v3 = a2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 2 * (a2 != 0);
  }
}

id sub_100047BA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v30[0] = @"subject_ID";
  v30[1] = @"subject_ID_type";
  v30[2] = @"authorization_value";
  v30[3] = @"auth_reason";
  +[NSArray arrayWithObjects:v30 count:4];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, (void)v25);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [*(id *)(a1 + 32) name];
  [v4 setObject:v12 forKeyedSubscript:@"service"];

  __int16 v13 = [v3 objectForKeyedSubscript:@"flags"];
  LODWORD(v12) = [v13 intValue];

  __int16 v14 = +[NSNumber numberWithBool:(v12 >> 4) & 1];
  [v4 setObject:v14 forKeyedSubscript:@"prompted_for_full"];

  id v15 = [v3 objectForKeyedSubscript:@"auth_reason"];
  unsigned int v16 = [v15 intValue];

  uint64_t v17 = [v3 objectForKeyedSubscript:@"authorization_value"];
  uint64_t v18 = (int)[v17 intValue];

  BOOL v20 = (v12 & 0x10) == 0 && v16 == 2;
  BOOL v21 = v16 == 2;
  if (v18 != 4) {
    BOOL v21 = 0;
  }
  if (v18) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = v20;
  }
  uint64_t v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22, (void)v25);
  [v4 setObject:v23 forKeyedSubscript:@"prompted_for_add"];

  return v4;
}

int sub_100047E4C(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a4) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v8 = !v6 && a6 != 0;
  if (a2 == 4)
  {
    if (a3 == 2)
    {
      int result = 0;
    }
    else
    {
      int v8 = 0;
      int result = -1;
    }
    if (v8 == 1)
    {
      unint64_t v10 = 4;
      goto LABEL_22;
    }
  }
  else
  {
    if (a2 != 1) {
      return -1;
    }
    if (a3 == 2)
    {
      int result = 0;
    }
    else
    {
      LOBYTE(v8) = 0;
      int result = -1;
    }
    if (v8)
    {
      unint64_t v10 = 0;
LABEL_22:
      int result = 0;
      *a4 = 2;
      *a5 = v10;
      *a6 = 3;
    }
  }
  return result;
}

NSString *__cdecl sub_100047EC0(id a1, unint64_t a2, unint64_t a3)
{
  CFStringRef v3 = @"REQUEST_ACCESS_LIMITED_kTCCServicePhotos_FULL";
  if (a2 != 3) {
    CFStringRef v3 = 0;
  }
  if (a2 == 2) {
    CFStringRef v3 = @"REQUEST_ACCESS_FULL_kTCCServicePhotos_FULL";
  }
  if (a3 == 2) {
    return &v3->isa;
  }
  else {
    return 0;
  }
}

int sub_100047EEC(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  BOOL v6 = a2 == 1 && a3 == 3;
  int v7 = !v6;
  int result = v7 << 31 >> 31;
  if (v6 && a4 && a5)
  {
    if (a6)
    {
      int result = 0;
      *a4 = 0;
      *a5 = 3;
      *a6 = 1;
    }
  }
  return result;
}

int sub_100047F28(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  if (a3 == 2) {
    int result = 0;
  }
  else {
    int result = -1;
  }
  if (a3 == 2 && a4 && a5)
  {
    if (a6)
    {
      int result = 0;
      *a4 = 5;
      *a5 = 0;
      *a6 = 1;
    }
  }
  return result;
}

id sub_100047F5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) allServices];
}

void sub_10004886C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v8 = [(id)objc_opt_class() tccdPlatformNameForDYLDPlatformName:v6];

  int v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
    int v7 = v8;
  }
  *a4 = 0;
}

int sub_1000488F4(id a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  return -1;
}

NSString *__cdecl sub_1000488FC(id a1, unint64_t a2, unint64_t a3)
{
  return 0;
}

unint64_t sub_100048904(id a1, unint64_t a2, BOOL a3)
{
  return a2;
}

NSDictionary *__cdecl sub_10004890C(id a1, NSDictionary *a2)
{
  return 0;
}

void sub_100048FA8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  unint64_t v9 = [(id)objc_opt_class() versionStringFromDYLDVersionNumber:v7];

  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
  *a4 = 0;
}

void sub_1000492FC(uint64_t a1)
{
  uint64_t v2 = +[TCCDPlatform currentPlatform];
  CFStringRef v3 = [v2 server];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10004A1FC(a1, v4);
  }
}

void sub_100049498(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000494AC(uint64_t a1)
{
  uint64_t v2 = +[TCCDPlatform currentPlatform];
  CFStringRef v3 = [v2 server];
  id v4 = [v3 logHandle];

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10004A28C(a1, v4);
  }
}

void sub_10004A1E0()
{
}

void sub_10004A1FC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 208);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load localizedResourcesBundle for %{public}@ from path %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_10004A28C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v4 = +[TCCDService defaultLocalizedResourcesBundlePath];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load default localization bundle for %{public}@ from path %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_10004A348(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NSLocalizedStringFromTableInBundle failed for service %{public}@: request_key=%{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10004A628(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_1000AC6D0;
  qword_1000AC6D0 = (uint64_t)v1;

  uint64_t v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)qword_1000AC6D0 setLocale:v3];

  [(id)qword_1000AC6D0 setDateFormat:@"yyyy-MM-dd HH:mm:ssZZZ"];
  id v4 = +[NSTimeZone systemTimeZone];
  [(id)qword_1000AC6D0 setTimeZone:v4];
}

void handle_TCCAccessResetInternal(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessResetInternal_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessResetInternal_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [a3 requestingProcess];
  long long v39 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "function")];
  uint64_t v8 = +[TCCDPlatform currentPlatform];
  unint64_t v9 = [v8 server];
  id v40 = 0;
  unint64_t v10 = [v9 serviceFromMessage:v5 error:&v40];
  id v11 = v40;

  if (!v10)
  {
    __int16 v13 = (TCCDAccessIdentity *)objc_opt_new();
    unsigned int v16 = [v8 server];
    [v16 buildErrorString:v13 forError:v11 contextString:0];

    uint64_t v17 = [v8 server];
    uint64_t v18 = [v17 logHandle];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10004CACC();
    }
    goto LABEL_19;
  }
  string = xpc_dictionary_get_string(v5, "client");
  if (string)
  {
    __int16 v13 = [[TCCDAccessIdentity alloc] initWithMessage:v5];
    id v14 = [(TCCDAccessIdentity *)v13 identifier];
    id v15 = [v14 UTF8String];

    if (!v15) {
      goto LABEL_20;
    }
  }
  else
  {
    __int16 v13 = 0;
  }
  uint64_t v19 = [v8 server];
  unsigned int v20 = [v19 canProcess:v7 callFunction:v39 forService:v10 withAccessIdentity:v13];

  if (v20)
  {
    long long v38 = v7;
    if (string)
    {
      uint64_t v18 = [(TCCDAccessIdentity *)v13 identifier];
    }
    else
    {
      uint64_t v18 = @"kTCCClientAll";
    }
    char v21 = !xpc_dictionary_get_BOOL(v5, "noKill");
    int v22 = [(TCCDAccessIdentity *)v13 client_type];
    uint64_t v23 = [v8 server];
    int v24 = db_reset_access_internal(v10, v18, v22, v23, 0, v21);

    int v37 = v24;
    if (!v24)
    {
      uint64_t v30 = [v8 syncController];
      if (v30)
      {
        id v31 = (void *)v30;
        id v32 = [v8 syncController];
        unsigned int v33 = [v32 isSyncingEnabled];

        if (v33)
        {
          long long v34 = [v8 syncController];
          long long v35 = [v10 name];
          objc_msgSend(v34, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v35, v18, -[TCCDAccessIdentity client_type](v13, "client_type"), 1, 1, 0, 2);
        }
      }
    }
    int64_t int64 = xpc_dictionary_get_int64(v5, "syncAuth");
    uint64_t v7 = v38;
    if (int64 != 1)
    {
      int64_t v26 = int64;
      long long v27 = tcc_access_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "sending syncAuth value of %llu after reset", buf, 0xCu);
      }

      id v36 = [v10 authorizationVersionNumber];
      long long v28 = [v8 syncController];
      uint64_t v29 = [v10 name];
      objc_msgSend(v28, "syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizationVersion:flags:updateType:", v29, v18, -[TCCDAccessIdentity client_type](v13, "client_type"), objc_msgSend(v10, "accessActionStatusForAuthorizationValue:", v26), v36, 0, 0);

      uint64_t v7 = v38;
    }
    if (!v37) {
      xpc_dictionary_set_BOOL(v6, "result", 1);
    }
LABEL_19:
  }
LABEL_20:
}

id showBundleForService(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = +[TCCDPlatform currentPlatform];
  if (objc_msgSend(v4, "ios_allowRegionalPrompt")
    && ((unsigned __int8 v6 = sub_10004B0DC(v3, @"com.apple.private.tcc.allow-or-regional-prompt", v4),
         unsigned int v7 = sub_10004B0DC(v3, @"com.apple.private.tcc.allow-or-regional-prompt.overridable", v4),
         (v6 & 1) != 0)
     || v7))
  {
    id v8 = [v5 isChinaSKUDevice];
  }
  else
  {
    id v8 = (id)(sub_10004B0DC(v3, @"com.apple.private.tcc.allow", v4) ^ 1);
  }

  return v8;
}

id sub_10004B0DC(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  unsigned int v7 = [a1 entitlements];
  id v8 = [v7 objectForKey:v6 ofClass:objc_opt_class()];

  unint64_t v9 = [v5 name];

  id v10 = [v8 containsObject:v9];
  return v10;
}

void sub_10004B184(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = a1;
  id v4 = *(id *)(a1 + 32);
  id v5 = +[TCCDPlatform currentPlatform];
  uint64_t v6 = sqlite3_column_int64(a2, 2);
  uint64_t v7 = sqlite3_column_int64(a2, 9);
  uint64_t v8 = sqlite3_column_int64(a2, 10);
  char v9 = sqlite3_column_int64(a2, 11);
  id v10 = [v5 server];
  unsigned __int8 v11 = objc_msgSend(v10, "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 5), v6, v4);

  if ((v11 & 1) == 0)
  {
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    if (v14)
    {
      id v15 = xpc_dictionary_create(0, 0, 0);
      int v16 = sqlite3_column_int(a2, 1);
      xpc_dictionary_set_uint64(v15, "TCCD_MSG_IDENTITY_TYPE_KEY", v16);
      uint64_t v17 = sqlite3_column_text(a2, 0);
      xpc_dictionary_set_string(v15, "TCCD_MSG_IDENTITY_ID_KEY", (const char *)v17);
      if (sqlite3_column_type(a2, 3) == 5)
      {
        xpc_dictionary_set_uint64(v15, "TCCD_MSG_IDENTITY_VERIFIER_TYPE_KEY", 0);
      }
      else
      {
        char v41 = v9;
        uint64_t v20 = v8;
        uint64_t v21 = v7;
        int v22 = v5;
        id v23 = v4;
        uint64_t v24 = v3;
        long long v25 = v15;
        int64_t v26 = sqlite3_column_blob(a2, 3);
        int v27 = sqlite3_column_bytes(a2, 3);
        long long v28 = v26;
        id v15 = v25;
        uint64_t v3 = v24;
        id v4 = v23;
        id v5 = v22;
        uint64_t v7 = v21;
        uint64_t v8 = v20;
        char v9 = v41;
        xpc_dictionary_set_data(v14, "code_requirement", v28, v27);
      }
      xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY", v15);
      xpc_dictionary_set_BOOL(v14, "granted", v6 != 0);
      xpc_dictionary_set_uint64(v14, "auth_value", v6);
      xpc_dictionary_set_uint64(v14, "auth_reason", v7);
      xpc_dictionary_set_uint64(v14, "auth_version", v8);
      xpc_dictionary_set_BOOL(v14, "has_prompted_for_allow", (v9 & 0x10) != 0);
      sqlite3_int64 v29 = sqlite3_column_int64(a2, 4);
      xpc_dictionary_set_int64(v14, "last_modified", v29);
      int v30 = sqlite3_column_int(a2, 1);
      uint64_t v19 = v15;
      if (v30 == 2)
      {
        int v37 = tcc_access_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10004CD6C(a2, v37);
        }

        int v12 = 1;
        goto LABEL_21;
      }
      if (v30 == 1)
      {
        long long v38 = sqlite3_column_text(a2, 0);
        xpc_dictionary_set_string(v14, "path", (const char *)v38);
        goto LABEL_20;
      }
      if (v30)
      {
        long long v39 = tcc_access_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_10004CC54(a2, v39);
        }
      }
      else
      {
        id v31 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
        if (v31)
        {
          id v32 = v31;
          xpc_dictionary_set_string(v14, "bundle_id", (const char *)[v32 UTF8String]);
          id v42 = 0;
          id v33 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v32 allowPlaceholder:0 error:&v42];
          id v34 = v42;
          if (v33)
          {
            if (showBundleForService(v33, v4))
            {
              long long v35 = [v33 URL];
              id v36 = [v35 absoluteString];
              xpc_dictionary_set_string(v14, "bundle", (const char *)[v36 UTF8String]);

LABEL_20:
              int v12 = 0;
LABEL_21:
              id v13 = v14;
LABEL_26:

              goto LABEL_27;
            }
          }
          else
          {
            id v40 = tcc_access_log();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              sub_10004CCE4((uint64_t)v32, (uint64_t)v34, v40);
            }
          }
          id v13 = v14;

          int v12 = 1;
          goto LABEL_26;
        }
      }
    }
    else
    {
      uint64_t v18 = tcc_access_log();
      uint64_t v19 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10004CC10(v18);
      }
    }
    int v12 = 0;
    id v13 = 0;
    goto LABEL_26;
  }
  int v12 = 0;
  id v13 = 0;
LABEL_27:

  if (v13 && (*(void *)(v3 + 56) != 1 || !v12)) {
    xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(v3 + 48) + 8) + 40), v13);
  }
}

void sub_10004B668(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v4 = sqlite3_bind_text(a2, 2, "kTCCServiceEndpointSecurityClient", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    if (!v4) {
      return;
    }
  }
  _db_error(1);
}

uint64_t sub_10004B710(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 server];
  uint64_t v7 = [v6 descriptionForMessage:v5];

  uint64_t v8 = tcc_access_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10004CDFC((uint64_t)v7, a2, v8);
  }

  return 1;
}

BOOL TCCDServerHasPolicyOverride(void *a1, id *a2, void **a3, id *a4)
{
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_10000F914;
  int v37 = sub_10000F89C;
  id v38 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  int v30 = sub_10000F914;
  id v31 = sub_10000F89C;
  id v32 = 0;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10000F914;
  long long v25 = sub_10000F89C;
  id v26 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004BB58;
  v19[3] = &unk_1000950A8;
  id v7 = a1;
  id v20 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004BBDC;
  v18[3] = &unk_100095618;
  void v18[4] = &v33;
  void v18[5] = &v27;
  v18[6] = &v21;
  v18[7] = &v39;
  db_eval((uint64_t)"SELECT    id, uuid, display FROM    policies JOIN active_policy ON (policies.id = active_policy.policy_id) WHERE    active_policy.client_xpc_type_t type = ? AND active_policy.client = ?", v19, v18);
  if (*((unsigned char *)v40 + 24))
  {
    objc_storeStrong(a2, (id)v34[5]);
    uint64_t v8 = +[NSString stringWithFormat:@"%@:%@", v7, v28[5]];
    char v9 = *a3;
    *a3 = (void *)v8;

    objc_storeStrong(a4, (id)v22[5]);
    id v10 = +[TCCDPlatform currentPlatform];
    unsigned __int8 v11 = [v10 server];
    int v12 = [v11 logHandle];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v34[5];
      xpc_object_t v14 = *a3;
      uint64_t v15 = v22[5];
      *(_DWORD *)buf = 138544130;
      id v44 = v7;
      __int16 v45 = 2114;
      uint64_t v46 = v13;
      __int16 v47 = 2114;
      int v48 = v14;
      __int16 v49 = 2114;
      uint64_t v50 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "PolicyOverride: For %{public}@: policy_id:%{public}@, policy_client: %{public}@, display_name: %{public}@", buf, 0x2Au);
    }

    BOOL v16 = *((unsigned char *)v40 + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v16;
}

void sub_10004BB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10004BB58(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int(a2, 1, 0)
    || sqlite3_bind_text(a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    _db_error(1);
  }
}

void sub_10004BBDC(void *a1, sqlite3_stmt *a2)
{
  if (sqlite3_column_type(a2, 0) != 5)
  {
    uint64_t v4 = +[NSNumber numberWithLongLong:sqlite3_column_int64(a2, 0)];
    uint64_t v5 = *(void *)(a1[4] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  uint64_t v7 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 1)];
  uint64_t v8 = *(void *)(a1[5] + 8);
  char v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 2)];
  uint64_t v11 = *(void *)(a1[6] + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
}

BOOL has_private_tcc_entitlement(void *a1, void *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  xpc_dictionary_get_audit_token();
  memset(&token, 0, sizeof(token));
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &token);
  if (!v7)
  {
    BOOL v14 = 0;
LABEL_13:
    if (a3)
    {
      id v15 = v5;
      BOOL v16 = v6;
      memset(&token, 0, sizeof(token));
      pid_t pidp = 0;
      xpc_dictionary_get_audit_token();
      audit_token_t atoken = token;
      audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
      uint64_t v17 = +[TCCDPlatform currentPlatform];
      uint64_t v18 = [v17 server];
      uint64_t v19 = [v18 logHandle];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        pid_t v21 = pidp;
        string = xpc_dictionary_get_string(v15, "function");
        atoken.val[0] = 67109634;
        atoken.val[1] = v21;
        LOWORD(atoken.val[2]) = 2082;
        *(void *)((char *)&atoken.val[2] + 2) = string;
        HIWORD(atoken.val[4]) = 2114;
        *(void *)&atoken.val[5] = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "pid %d attempted to call %{public}s without the %{public}@ entitlement", (uint8_t *)&atoken, 0x1Cu);
      }
    }
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  if (!v6) {
    goto LABEL_9;
  }
  if (([(__CFString *)v6 hasPrefix:@"com.apple.private.tcc."] & 1) == 0)
  {
    char v9 = +[TCCDPlatform currentPlatform];
    uint64_t v10 = [v9 server];
    uint64_t v11 = [v10 logHandle];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10004CE84();
    }
  }
  CFTypeRef v12 = SecTaskCopyValueForEntitlement(v8, v6, 0);
  if (v12)
  {
    uint64_t v13 = v12;
    BOOL v14 = CFEqual(v12, kCFBooleanTrue) != 0;
    CFRelease(v13);
  }
  else
  {
LABEL_9:
    BOOL v14 = 0;
  }
  CFRelease(v8);
  if (!v14) {
    goto LABEL_13;
  }
LABEL_17:

  return v14;
}

void sub_10004BF70(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 2);
  id v5 = [*(id *)(a1 + 32) server];
  LOBYTE(v4) = objc_msgSend(v5, "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 1), v4, *(void *)(a1 + 40));

  if (v4) {
    return;
  }
  uint64_t v6 = sqlite3_column_text(a2, 0);
  if (!v6) {
    return;
  }
  SecTaskRef v7 = v6;
  xpc_object_t v8 = xpc_string_create((const char *)v6);
  if (!v8) {
    return;
  }
  xpc_object_t value = v8;
  if (objc_msgSend(*(id *)(a1 + 40), "ios_allowRegionalPrompt")
    && [*(id *)(a1 + 48) isSystemPreferencesApp])
  {
    id v9 = objc_alloc((Class)LSApplicationRecord);
    uint64_t v10 = +[NSString stringWithUTF8String:v7];
    id v11 = [v9 initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];

    if (v11 && !showBundleForService(v11, *(void **)(a1 + 40)))
    {

      goto LABEL_10;
    }
  }
  xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), value);
LABEL_10:
}

void sub_10004C0C8(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, "kTCCServiceEndpointSecurityClient", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v4 = sqlite3_bind_int(a2, 3, 0);

    if (!v4) {
      return;
    }
  }
  _db_error(1);
}

void handle_TCCAccessCopyBundleIdentifiersDisabledForService(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessCopyBundleIdentifiersDisabledForService_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyBundleIdentifiersDisabledForService_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_object_t v8 = [v7 requestingProcess];
  id v9 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "function")];
  uint64_t v10 = +[TCCDPlatform currentPlatform];
  id v11 = [v10 server];
  v44[0] = 0;
  CFTypeRef v12 = [v11 serviceFromMessage:v5 error:v44];
  id v13 = v44[0];

  if (v12)
  {
    BOOL v14 = [v10 server];
    unsigned int v15 = [v14 canProcess:v8 callFunction:v9 forService:v12 withAccessIdentity:0];

    if (v15)
    {
      xpc_object_t xdict = v6;
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x3032000000;
      uint64_t v41 = sub_10000F914;
      char v42 = sub_10000F89C;
      id v43 = xpc_array_create(0, 0);
      if (v39[5])
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10004C618;
        v33[3] = &unk_1000965A0;
        id v16 = v10;
        id v34 = v16;
        id v27 = v12;
        id v35 = v27;
        id v17 = v8;
        id v36 = v17;
        uint64_t v37 = &v38;
        long long v28 = objc_retainBlock(v33);
        uint64_t v18 = [v16 server];
        LODWORD(v17) = [v18 canProcess:v17 manageESClientServiceWith:v9];

        if (v17)
        {
          uint64_t v19 = v32;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10004C770;
          v32[3] = &unk_1000950A8;
          v32[4] = v27;
          int v20 = db_eval((uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE (service = ? OR service = ?) AND client_type = ? AND auth_value = 0", v32, v28);
        }
        else
        {
          uint64_t v19 = v31;
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10004C828;
          v31[3] = &unk_1000950A8;
          void v31[4] = v27;
          int v20 = db_eval((uint64_t)"SELECT client, strftime('%s','now') - last_modified AS age, auth_value FROM access WHERE service = ? AND client_type = ? AND auth_value = 0", v31, v28);
        }
        int v26 = v20;

        if (!v26) {
          xpc_dictionary_set_value(xdict, "clients", (xpc_object_t)v39[5]);
        }
      }
      _Block_object_dispose(&v38, 8);

      id v6 = xdict;
    }
  }
  else
  {
    xpc_object_t xdicta = v8;
    id v21 = v6;
    int v22 = objc_opt_new();
    uint64_t v23 = [v10 server];
    [v23 buildErrorString:v22 forError:v13 contextString:0];

    uint64_t v24 = [v10 server];
    long long v25 = [v24 logHandle];

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10004CFF0();
    }

    id v6 = v21;
    xpc_object_t v8 = xdicta;
  }
}

void sub_10004C600(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10004C618(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 2);
  id v5 = [*(id *)(a1 + 32) server];
  LOBYTE(v4) = objc_msgSend(v5, "isAccessEntryWithAge:authorizationValue:expiredForService:", sqlite3_column_int(a2, 1), v4, *(void *)(a1 + 40));

  if (v4) {
    return;
  }
  id v6 = sqlite3_column_text(a2, 0);
  if (!v6) {
    return;
  }
  id v7 = v6;
  xpc_object_t v8 = xpc_string_create((const char *)v6);
  if (!v8) {
    return;
  }
  xpc_object_t value = v8;
  if (objc_msgSend(*(id *)(a1 + 40), "ios_allowRegionalPrompt")
    && [*(id *)(a1 + 48) isSystemPreferencesApp])
  {
    id v9 = objc_alloc((Class)LSApplicationRecord);
    uint64_t v10 = +[NSString stringWithUTF8String:v7];
    id v11 = [v9 initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];

    if (v11 && !showBundleForService(v11, *(void **)(a1 + 40)))
    {

      goto LABEL_10;
    }
  }
  xpc_array_append_value(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), value);
LABEL_10:
}

void sub_10004C770(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, "kTCCServiceEndpointSecurityClient", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v4 = sqlite3_bind_int(a2, 3, 0);

    if (!v4) {
      return;
    }
  }
  _db_error(1);
}

void sub_10004C828(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v4 = sqlite3_bind_int(a2, 2, 0);

    if (!v4) {
      return;
    }
  }
  _db_error(1);
}

void handle_TCCAccessCopyInformationForServices(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [[TCCDAttributionChain alloc] initWithMessage:v4];
  handle_TCCAccessCopyCountInformationForServices_with_attribution_chain(v4, v3, v5);
}

void handle_TCCAccessCopyCountInformationForServices_with_attribution_chain(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_get_array(v5, "services");
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_array)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10004CA80;
    applier[3] = &unk_1000965C8;
    id v11 = v5;
    id v12 = v6;
    id v13 = v7;
    xpc_array_apply(v8, applier);

    id v9 = v11;
  }
  else
  {
    id v9 = tcc_access_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10004D064(v9);
    }
  }
}

uint64_t sub_10004CA80(xpc_object_t *a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  xpc_dictionary_set_string(a1[4], "service", string_ptr);
  handle_TCCAccessCopyInformation_with_attribution_chain(a1[4], a1[5], a1[6]);
  return 1;
}

void sub_10004CACC()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004CB40()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004CBB4(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = "handle_TCCAccessCopyInformation_with_attribution_chain";
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}s: returning %zu clients", buf, 0x16u);
}

void sub_10004CC10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "handle_TCCAccessCopyInformation(): failed to allocate clientInfo dictionary.", v1, 2u);
}

void sub_10004CC54(sqlite3_stmt *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = sqlite3_column_int(a1, 1);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "handle_TCCAccessCopyInformation(): Unknown identity type: %d.", (uint8_t *)v3, 8u);
}

void sub_10004CCE4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to initialize LSApplicationRecord with bundle ID: %{public}@, error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10004CD6C(sqlite3_stmt *a1, NSObject *a2)
{
  int v3 = 136446210;
  uint64_t v4 = sqlite3_column_text(a1, 0);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "handle_TCCAccessCopyInformation(): skipping identity type: IDENTITY_TYPE_POLICY_ID for identifier: %{public}s.", (uint8_t *)&v3, 0xCu);
}

void sub_10004CDFC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[%zu] = %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10004CE84()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: invalid entitlement requested - %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004CEF8()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004CF6C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "handle_TCCAccessCopyInformationForBundle_with_attribution_chain_block_invoke_2";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: failed to allocate accessRecord dictionary", (uint8_t *)&v1, 0xCu);
}

void sub_10004CFF0()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10004D064(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Services list loading error", v1, 2u);
}

void sub_10004D150(id a1)
{
  qword_1000AC6E0 = (uint64_t)dispatch_queue_create("com.apple.tccd.policy-override", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  _objc_release_x1();
}

void sub_10004D498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004D4B0(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      while (2)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        id v8 = *(id *)(a1 + 40);
        do
        {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(v7, "_locked_evaluateAccessByIdentity:toService:withIndirectObjectIdentityIdentity:authorizationReason:", *(void *)(a1 + 48), v8, *(void *)(a1 + 56), *(void *)(a1 + 72), (void)v14);
          if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 1)
          {
            uint64_t v10 = +[TCCDPlatform currentPlatform];
            id v11 = [v10 server];
            id v12 = [v11 logHandle];

            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              id v13 = [*(id *)(a1 + 48) identifier];
              *(_DWORD *)buf = 138543874;
              uint64_t v19 = v7;
              __int16 v20 = 2114;
              id v21 = v8;
              __int16 v22 = 2114;
              uint64_t v23 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Override: found override in %{public}@ for %{public}@ and %{public}@", buf, 0x20u);
            }
            goto LABEL_15;
          }
          uint64_t v9 = objc_msgSend(v8, "macos_compositionParentService");

          id v8 = (id)v9;
        }
        while (v9);
        if ((id)++v6 != v4) {
          continue;
        }
        break;
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v4);
  }
LABEL_15:
}

void sub_10004DB84(uint64_t a1)
{
  if (qword_1000AC6F8 != -1) {
    dispatch_once(&qword_1000AC6F8, &stru_100096630);
  }
  id v2 = qword_1000AC700;
  if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_DEBUG)) {
    sub_10004EDE8(a1, v2);
  }
  [*(id *)(a1 + 32) loadPlist];
  [*(id *)(a1 + 32) parsePlist];
  access_changed();
}

id sub_10004EA90(uint64_t a1)
{
  id result = (id)dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (result)
  {
    id v3 = result;
    sleep(3u);
    if (qword_1000AC6F8 != -1) {
      dispatch_once(&qword_1000AC6F8, &stru_100096630);
    }
    id v4 = qword_1000AC700;
    if (os_log_type_enabled((os_log_t)qword_1000AC700, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134218242;
      id v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Override: watchPlistChanges: reloading (0x%lx): %{public}@", (uint8_t *)&v6, 0x16u);
    }
    [*(id *)(a1 + 48) loadAndParse];
    return [*(id *)(a1 + 48) watchPlistChanges];
  }
  return result;
}

uint64_t sub_10004EB98(uint64_t a1)
{
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  return close(handle);
}

void sub_10004EC70(id a1)
{
  qword_1000AC700 = (uint64_t)os_log_create("com.apple.TCC", "access");
  _objc_release_x1();
}

void sub_10004ECB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Override: no plist file path.", v1, 2u);
}

void sub_10004ECF8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100014ECC((void *)&_mh_execute_header, a2, a3, "Override: error opening: %{public}@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10004ED70(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100014ECC((void *)&_mh_execute_header, a2, a3, "Override:  found a config file at %{public}@ but could not get a plist from it: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10004EDE8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Override: loading policy data for %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10004EE64(uint64_t a1, void *a2)
{
  int v3 = a2;
  int v4 = *__error();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Override: watchPlistChanges: failed to open(%{public}@, O_EVTONLY): %{darwin.errno}d ", (uint8_t *)&v5, 0x12u);
}

void sub_10004F0AC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ read client data", (uint8_t *)&v3, 0xCu);
}

void sub_10004F128(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@ request specified explicitly assumed identity: %{public}@", (uint8_t *)&v4, 0x16u);
}

CFStringRef TCCDPromptPolicyResultString(unint64_t a1)
{
  if (a1 > 4) {
    return @"<Invalid Prompt Policy Result>";
  }
  else {
    return *(&off_100096788 + a1);
  }
}

void sub_10004F22C(id a1)
{
  qword_1000AC708 = +[NSSet setWithObjects:@"TCCDPlatformMacOS", @"TCCDPlatformIOS", @"TCCDPlatformWatchOS", @"TCCDPlatformTVOS", 0];
  _objc_release_x1();
}

void sub_10004F2F0(id a1)
{
  qword_1000AC718 = +[NSSet setWithObjects:@"TCCDPlatformIOS", @"TCCDPlatformWatchOS", @"TCCDPlatformTVOS", 0];
  _objc_release_x1();
}

void sub_10004F3AC(id a1)
{
  qword_1000AC728 = +[NSSet setWithObjects:@"TCCDPlatformMacOS", 0];
  _objc_release_x1();
}

void sub_10004F400(id a1)
{
  qword_1000AC738 = [[TCCDPlatformIOS alloc] initWithName:@"TCCDPlatformIOS"];
  _objc_release_x1();
}

void sub_10004F448(id a1)
{
  v3[0] = @"com.apple.private.tcc.manager";
  v3[1] = @"com.apple.private.tcc.manager.set-responsible";
  _DWORD v3[2] = @"com.apple.private.tcc.manager.compute-designated-requirement";
  v3[3] = @"com.apple.private.tcc.manager.compute-indirect-object-identity";
  void v3[4] = @"com.apple.private.tcc.manager.service-composition";
  void v3[5] = @"com.apple.private.tcc.manager.check-by-audit-token";
  v3[6] = @"com.apple.private.tcc.manager.access.read";
  v3[7] = @"com.apple.private.tcc.manager.access.modify";
  uint8_t v3[8] = @"com.apple.private.tcc.manager.access.modify.webapp";
  v3[9] = @"com.apple.private.tcc.manager.access.delete";
  v3[10] = @"com.apple.private.tcc.manager.access.report";
  v3[11] = @"com.apple.private.tcc.manager.service-override.modify";
  v3[12] = @"com.apple.private.tcc.manager.expiration.read";
  v3[13] = @"com.apple.private.tcc.manager.expiration.delete";
  v3[14] = @"com.apple.private.tcc.test-manager.service-composition";
  v3[15] = @"com.apple.private.tcc.allow";
  uint8_t v3[16] = @"com.apple.private.tcc.allow.overridable";
  v3[17] = @"com.apple.private.tcc.allow-or-regional-prompt";
  v3[18] = @"com.apple.private.tcc.allow-or-regional-prompt.overridable";
  v3[19] = @"com.apple.private.tcc.check-allow-on-responsible-process";
  v3[20] = @"com.apple.private.tcc.system";
  v3[21] = @"com.apple.private.tcc.policy-override";
  v3[22] = @"com.apple.private.tcc.allow-prompting";
  v3[23] = @"com.apple.security.personal-information.addressbook";
  unsigned char v3[24] = @"com.apple.security.personal-information.calendars";
  v3[25] = @"com.apple.security.personal-information.photos-library";
  v3[26] = @"com.apple.security.device.camera";
  v3[27] = @"com.apple.security.device.audio-input";
  v3[28] = @"com.apple.security.automation.apple-events";
  v3[29] = @"com.apple.private.tcc.override-prompt-policy";
  v3[30] = @"com.apple.tcc.delegated-services";
  v3[31] = @"com.apple.developer.on-demand-install-capable";
  v3[32] = @"com.apple.private.attribution.implicitly-assumed-identity";
  v3[33] = @"com.apple.private.attribution.explicitly-assumed-identities";
  v3[34] = @"com.apple.private.tcc.kill-on-assumed-identity-authorization-change";
  v3[35] = @"com.apple.developer.endpoint-security.client";
  v3[36] = @"com.apple.private.tcc.set_client_data";
  unsigned char v3[37] = @"com.apple.private.tcc.ifdreader";
  v3[38] = @"com.apple.developer.arkit.barcode-detection.allow";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:39];
  uint64_t v2 = (void *)qword_1000AC750;
  qword_1000AC750 = v1;
}

void sub_10004F8C4(uint64_t a1)
{
  uint64_t v2 = +[TCCDService allServices];
  uint64_t v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "validOnPlatformNames", (void)v15);
        id v11 = [*(id *)(a1 + 32) name];
        unsigned int v12 = [v10 containsObject:v11];

        if (v12)
        {
          id v13 = [v9 name];
          [v3 setObject:v9 forKeyedSubscript:v13];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v14 = [v3 copy];
  [*(id *)(a1 + 32) setServicesByName:v14];

  [*(id *)(a1 + 32) _configureServices];
}

id sub_100050398(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [*(id *)(a1 + 32) name];
  [v2 setObject:v3 forKeyedSubscript:@"service"];

  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"API"];
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"plugin"];
  return v2;
}

void sub_100050434()
{
  uint64_t v0 = tcc_access_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_1000514CC();
  }
}

id sub_100050840(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = [*(id *)(a1 + 32) stringForAnalyticsAction:*(void *)(a1 + 80)];
  [v2 setObject:v3 forKeyedSubscript:@"action"];

  id v4 = [*(id *)(a1 + 40) name];
  [v2 setObject:v4 forKeyedSubscript:@"service"];

  id v5 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
  [v2 setObject:v5 forKeyedSubscript:@"authorization_value"];

  id v6 = +[NSNumber numberWithInteger:*(void *)(a1 + 96)];
  [v2 setObject:v6 forKeyedSubscript:@"prompt_type"];

  uint64_t v7 = [*(id *)(a1 + 40) authorizationRightStateForValue:*(void *)(a1 + 88) reason:0];
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 rightDescription];
    [v2 setObject:v9 forKeyedSubscript:@"authorization_right"];
  }
  if (*(unsigned char *)(a1 + 120))
  {
    uint64_t v10 = [*(id *)(a1 + 40) authorizationRightStateForValue:*(void *)(a1 + 104) reason:0];

    if (v10)
    {
      id v11 = [v10 rightDescription];
      [v2 setObject:v11 forKeyedSubscript:@"v1_authorization_right"];

      int v8 = v10;
    }
    else
    {
      int v8 = 0;
    }
  }
  unsigned int v12 = [*(id *)(a1 + 40) name];
  unsigned __int8 v13 = [v12 isEqualToString:@"kTCCServiceUserTracking"];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      [*(id *)(a1 + 32) updateAnalyticsEvent:v2 fromIdentity:v14 keyPrefix:@"subject"];
    }
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      [*(id *)(a1 + 32) updateAnalyticsEvent:v2 fromIdentity:v15 keyPrefix:@"indirect_object"];
    }
  }
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16) {
    [v2 setObject:v16 forKeyedSubscript:@"request_reason"];
  }
  if (*(void *)(a1 + 112))
  {
    long long v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
    [v2 setObject:v17 forKeyedSubscript:@"desired_auth"];
  }
  long long v18 = [*(id *)(a1 + 32) server];
  uint64_t v19 = [v18 logHandle];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(a1 + 72);
    int v22 = 138543618;
    uint64_t v23 = v20;
    __int16 v24 = 2114;
    id v25 = v2;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Analytics Event sending: %{public}@\n%{public}@", (uint8_t *)&v22, 0x16u);
  }

  return v2;
}

void sub_100050B3C()
{
  uint64_t v0 = tcc_access_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_100051540();
  }
}

id sub_100050D6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  uint64_t v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Analytics Event sending: %{public}@\n%{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = *(void **)(a1 + 48);
  return v6;
}

void sub_100050E54()
{
  uint64_t v0 = tcc_access_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_1000515B4();
  }
}

id sub_100051084(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  uint64_t v3 = [v2 logHandle];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Analytics Event async sending: %{public}@\n%{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = *(void **)(a1 + 48);
  return v6;
}

void sub_10005116C()
{
  uint64_t v0 = tcc_access_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_100051628();
  }
}

void sub_10005131C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100051328(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "configurationDictionary:  found a config file at %{public}@ but could not get a plist from it: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_1000513DC()
{
  __assert_rtn("-[TCCDPlatform bootUUID]", "TCCDPlatform.m", 283, "len == sizeof(uuidString)");
}

void sub_100051408(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  int v6 = [a2 path];
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Identified provisional outer-most app bundle for %@ as %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000514CC()
{
  sub_10005131C(__stack_chk_guard);
  sub_100051308();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%s: Analytics is not available for Event: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100051540()
{
  sub_10005131C(__stack_chk_guard);
  sub_100051308();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%s: Analytics is not available for Event: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_1000515B4()
{
  sub_10005131C(__stack_chk_guard);
  sub_100051308();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%s: Analytics is not available for Event: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100051628()
{
  sub_10005131C(__stack_chk_guard);
  sub_100051308();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%s: Analytics is not available for Event: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100051900(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  uint64_t v4 = [v3 localizedDescription];
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100051A04(id a1)
{
  qword_1000AC780 = objc_alloc_init(TCCDEventPublisher);
  _objc_release_x1();
}

void sub_100051C14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100051C44(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleError:a2];
}

void sub_100051DCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    memset(v17, 0, sizeof(v17));
    xpc_dictionary_get_audit_token();
    __int16 v8 = (const char *)xpc_copy_code_signing_identity_for_token();
    if (v8)
    {
      id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v8, strlen(v8), 4, 1, v17[0], v17[1]);
    }
    else
    {
      __int16 v10 = xpc_copy_description(v3);
      uint64_t v11 = tcc_events_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000528B4(a1, (uint64_t)v10, v11);
      }

      free(v10);
      id v9 = 0;
    }
    unsigned int v12 = (void *)xpc_copy_entitlement_for_token();
    unsigned __int8 v13 = v12;
    if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(v13);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      if (value) {
        goto LABEL_14;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    objc_msgSend(*(id *)(a1 + 40), "_removeSubscriber:", objc_msgSend(*(id *)(a1 + 32), "token", v17[0], v17[1]));
LABEL_14:

    goto LABEL_15;
  }
  int v5 = type;
  int v6 = xpc_copy_description(v3);
  int v7 = tcc_events_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    name = xpc_type_get_name(v5);
    uint64_t v16 = *(void *)(a1 + 32);
    LODWORD(v17[0]) = 136446722;
    *(void *)((char *)v17 + 4) = v6;
    WORD6(v17[0]) = 2082;
    *(void *)((char *)v17 + 14) = name;
    WORD3(v17[1]) = 2114;
    *((void *)&v17[1] + 1) = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Received invalid reply %{public}s of type %{public}s from subscriber %{public}@", (uint8_t *)v17, 0x20u);
  }

  free(v6);
  objc_msgSend(*(id *)(a1 + 40), "_removeSubscriber:", objc_msgSend(*(id *)(a1 + 32), "token"));
LABEL_15:
}

void sub_1000520A0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(*(void *)(a1 + 32) + 24);
  int v7 = +[NSNumber numberWithUnsignedLongLong:v5];
  [v6 removeObjectForKey:v7];

  __int16 v8 = tcc_events_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    __int16 v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removed subscriber %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

void sub_100052530(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[32])
  {
    id v3 = tcc_events_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      id v5 = [*(id *)(*(void *)(a1 + 32) + 24) count];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v4;
      __int16 v21 = 2048;
      id v22 = v5;
      __int16 v23 = 2114;
      uint64_t v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Publishing %{public}@ to %lu subscribers: %{public}@", buf, 0x20u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(*(void *)(a1 + 32) + 24);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), (void)v14);
          [v12 publish:*(void *)(a1 + 40)];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    [v2 _addPendingEvent:v13];
  }
}

void sub_100052778(uint64_t a1, NSObject *a2)
{
  int v3 = 136315138;
  uint64_t v4 = xpc_strerror();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received error: %s", (uint8_t *)&v3, 0xCu);
}

void sub_100052804(int a1, uint64_t a2, os_log_t log)
{
  int v3 = "Add";
  if (a1 == 1) {
    int v3 = "Remove";
  }
  if (a1 == 2) {
    int v3 = "Initial Barrier";
  }
  int v4 = 136446466;
  id v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Received event: action=%{public}s, token=%llu", (uint8_t *)&v4, 0x16u);
}

void sub_1000528B4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2082;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to copy code signing identity of subscriber %{public}@ from reply: %{public}s", (uint8_t *)&v4, 0x16u);
}

void sub_100052940(uint64_t a1, NSObject *a2)
{
  int v3 = 138543362;
  uint64_t v4 = objc_opt_class();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ pendingEvents exceeded limit, removed oldest event", (uint8_t *)&v3, 0xCu);
}

void sub_1000529CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Added pending event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100052E24(void *a1, NSObject *a2)
{
  unsigned int v3 = [a1 pid];
  int v4 = *__error();
  uint64_t v5 = __error();
  __int16 v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2082;
  uint64_t v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "proc_pidpath_audittoken() failed from PID[%d]: (#%d) %{public}s", (uint8_t *)v7, 0x18u);
}

void sub_100052EE8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get realpath of binaryPath: %{public}s: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100052F70(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v2, v3, "%{public}@: Entitlement: %{public}@ is not of type Boolean/NSNumber as expected.", v4, v5, v6, v7, v8);
}

void sub_100053000(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v2, v3, "%{public}@: Entitlement: %{public}@ is not of type NSArray as required.", v4, v5, v6, v7, v8);
}

void sub_100053090(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_1000364DC();
  sub_100036F44((void *)&_mh_execute_header, v2, v3, "%{public}@: Entitlement: %{public}@ is not of type NSDictionary as required.", v4, v5, v6, v7, v8);
}

void sub_100053120(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053190()
{
  sub_100052E0C();
  sub_100018408((void *)&_mh_execute_header, v0, v1, "FAIL: PID[%d]: SecTaskCopySigningIdentifier(): %{public}@");
}

void sub_100053200()
{
  sub_100052E0C();
  sub_100018408((void *)&_mh_execute_header, v0, v1, "FAIL: PID[%d]: SecTaskCopyValuesForEntitlements(): %{public}@");
}

void sub_100053270(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000532E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void log_open_file_descriptors()
{
  uint64_t v0 = tcc_open_fds_log();
  pid_t v1 = getpid();
  int v2 = proc_pidinfo(v1, 1, 0, 0, 0);
  if (v2 == -1)
  {
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_10005382C(v0, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  else
  {
    int v3 = v2;
    uint64_t v4 = (int *)malloc_type_malloc(v2, 0x962A2578uLL);
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = proc_pidinfo(v1, 1, 0, v4, v3);
      if (v6 == -1)
      {
        if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
          sub_10005389C(v0, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      else
      {
        int v7 = v6;
        int v8 = v6 >> 3;
        if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%{public}d open file descriptors", buf, 8u);
        }
        if (v7 >= 8)
        {
          if (v8 <= 1) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = v8;
          }
          __int16 v10 = v5 + 1;
          do
          {
            if (*v10 == 1)
            {
              memcpy(buf, "<path not found>", sizeof(buf));
              fcntl(*(v10 - 1), 50, buf);
              if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
              {
                int v11 = *(v10 - 1);
                int v12 = *v10;
                v40[0] = 67240706;
                v40[1] = v11;
                __int16 v41 = 1026;
                int v42 = v12;
                __int16 v43 = 2082;
                id v44 = buf;
                uint64_t v13 = (uint8_t *)v40;
                long long v14 = v0;
                long long v15 = "%{public}d|%{public}d : %{public}s";
                uint32_t v16 = 24;
LABEL_16:
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, v13, v16);
              }
            }
            else if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
            {
              int v17 = *(v10 - 1);
              int v18 = *v10;
              *(_DWORD *)buf = 67240448;
              *(_DWORD *)&uint8_t buf[4] = v17;
              *(_WORD *)&uint8_t buf[8] = 1026;
              *(_DWORD *)&buf[10] = v18;
              uint64_t v13 = buf;
              long long v14 = v0;
              long long v15 = "%{public}d|%{public}d";
              uint32_t v16 = 14;
              goto LABEL_16;
            }
            v10 += 2;
            --v9;
          }
          while (v9);
        }
      }
      free(v5);
    }
    else if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      sub_100053864(v0, v26, v27, v28, v29, v30, v31, v32);
    }
  }
}

void exhaust_file_descriptors()
{
  uint64_t v0 = tcc_open_fds_log();
  pid_t v1 = getpid();
  int v2 = +[TCCDPlatform currentPlatform];
  int v3 = [v2 server];
  id v4 = [v3 temporaryDirectory];
  uint64_t v5 = (const char *)[v4 UTF8String];

  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Exhausting available file descriptors by opening files in %{public}s", buf, 0xCu);
  }
  bzero(buf, 0x400uLL);
  if ((snprintf((char *)buf, 0x400uLL, "%s/tccd-%d-%04d", v5, v1, 0) & 0x80000000) == 0)
  {
    int v6 = 1;
    do
    {
      if (open((const char *)buf, 513, 493) == -1)
      {
        int v7 = v0;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v9 = *__error();
          *(_DWORD *)__int16 v10 = 136446722;
          int v11 = "exhaust_file_descriptors";
          __int16 v12 = 2082;
          uint64_t v13 = buf;
          __int16 v14 = 1024;
          int v15 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: failed to open temp file at path \"%{public}s\": open() failed with errno %d", v10, 0x1Cu);
        }
      }
      int v8 = snprintf((char *)buf, 0x400uLL, "%s/tccd-%d-%04d", v5, v1, v6++);
    }
    while ((v8 & 0x80000000) == 0);
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_1000538D4(v0);
  }
}

void sub_10005382C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100053864(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005389C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000538D4(os_log_t log)
{
  int v1 = 136446210;
  int v2 = "exhaust_file_descriptors";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: failed to format string for temp_file_path", (uint8_t *)&v1, 0xCu);
}

id sub_100053A98(uint64_t a1)
{
  int v2 = +[TCCDPolicyOverride logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "MDMPolicyOverride: configuration profile changed; reloading.",
      v4,
      2u);
  }

  return [*(id *)(a1 + 32) loadAndParse];
}

void sub_1000540D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100054118(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v5 = sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 48));

    if (!v5) {
      return;
    }
  }
  _db_error(1);
}

uint64_t sub_1000541E8(uint64_t a1, sqlite3_stmt *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t result = sqlite3_column_int(a2, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100054230(uint64_t a1, sqlite3_stmt *a2)
{
  if (!sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 56)))
  {
    id v4 = [*(id *)(a1 + 32) name];
    if (sqlite3_bind_text(a2, 2, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 3, (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
    }
    else
    {
      int v5 = sqlite3_bind_int(a2, 4, *(_DWORD *)(a1 + 48));

      if (!v5) {
        return;
      }
    }
  }
  _db_error(1);
}

void sub_100054314(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) name];
  if (sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 2, (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 3, *(_DWORD *)(a1 + 56))|| sqlite3_bind_int64(a2, 4, 0)|| sqlite3_bind_int64(a2, 5, 6)|| sqlite3_bind_int64(a2, 6, 2)|| sqlite3_bind_blob(a2, 7, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "bytes"),
         (int)[*(id *)(a1 + 48) length],
         (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
    || sqlite3_bind_null(a2, 8)
    || sqlite3_bind_text(a2, 9, "UNUSED", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
  }
  else
  {
    int v5 = sqlite3_bind_int(a2, 10, *(_DWORD *)(a1 + 64));

    if (!v5) {
      return;
    }
  }
  _db_error(1);
}

void sub_100054764(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 32)))
  {
    _db_error(1);
  }
}

void sub_1000547AC(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 0)];
  int v5 = +[NSString stringWithUTF8String:sqlite3_column_text(a2, 1)];
  int v6 = sqlite3_column_int(a2, 2);
  int v7 = sqlite3_column_int(a2, 3);
  int v8 = [*(id *)(a1 + 32) policyAccessByIdentifier];
  int v9 = [v8 objectForKeyedSubscript:v5];

  if (!v9) {
    goto LABEL_10;
  }
  __int16 v10 = [v9 objectForKeyedSubscript:v4];
  int v11 = v10;
  if (v10)
  {
    __int16 v12 = [v10 objectForKeyedSubscript:@"IdentifierType"];
    if ([v12 isEqualToString:@"bundleID"]) {
      BOOL v13 = v6 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
    }
    else
    {
      __int16 v14 = [v11 objectForKeyedSubscript:@"IdentifierType"];
      unsigned int v15 = [v14 isEqualToString:@"path"];

      if (!v15 || v6 != 1) {
        goto LABEL_9;
      }
    }

    goto LABEL_17;
  }
LABEL_9:

LABEL_10:
  int v16 = v7 & ~*(_DWORD *)(a1 + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100054A60;
  v20[3] = &unk_1000968B0;
  int v23 = v16;
  id v17 = v4;
  id v21 = v17;
  id v18 = v5;
  id v22 = v18;
  int v24 = v6;
  if (db_eval_locked((uint64_t)"UPDATE access SET flags = ? WHERE service = ? AND client = ? AND client_xpc_type_t type = ?", v20, 0))
  {
    uint64_t v19 = +[TCCDPolicyOverride logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v26 = v17;
      __int16 v27 = 2114;
      id v28 = v18;
      __int16 v29 = 1024;
      int v30 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to remove TCCD_ACCESS_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE flag from database record: serviceName=%{public}@, identifier=%{public}@, identifier_type=%d", buf, 0x1Cu);
    }
  }
LABEL_17:
}

void sub_100054A60(uint64_t a1, sqlite3_stmt *a2)
{
  if (sqlite3_bind_int(a2, 1, *(_DWORD *)(a1 + 48))
    || sqlite3_bind_text(a2, 2, (const char *)[*(id *)(a1 + 32) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_text(a2, 3, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)|| sqlite3_bind_int(a2, 4, *(_DWORD *)(a1 + 52)))
  {
    _db_error(1);
  }
}

void sub_100054CF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Skipping MDM policy authorization record with invalid IdentifierType: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100054E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100054E30(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v7 = *(os_unfair_lock_s **)(a1 + 32);
  int v6 = (uint64_t *)(a1 + 32);
  int v8 = v7 + 6;
  os_unfair_lock_lock(v7 + 6);
  id v9 = [v5 copy];
  __int16 v10 = *(void **)(*v6 + 48);
  *(void *)(*v6 + 48) = v9;

  uint64_t v11 = *v6;
  if (a3)
  {
    *(void *)(v11 + 32) = 2;
    __int16 v12 = tcc_events_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100055258(v6, v12);
    }

    [(id)*v6 _publishPendingEvents];
  }
  else
  {
    *(void *)(v11 + 32) = 3;
    BOOL v13 = tcc_events_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000552D4(v6, v13);
    }
  }
  os_unfair_lock_unlock(v8);
}

void sub_100054F14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100054FCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100055258(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ passed entitlement check", (uint8_t *)&v3, 0xCu);
}

void sub_1000552D4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed entitlement check", (uint8_t *)&v3, 0xCu);
}

void sub_100055350(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ pendingEvents exceeded limit, removed oldest event", (uint8_t *)&v2, 0xCu);
}

void sub_1000554A4(uint64_t a1, void *a2)
{
  int v2 = [a2 requestingProcess];
  uint64_t v3 = [v2 description];
  sub_100020DA8();
  sub_100036F44((void *)&_mh_execute_header, v4, v5, "Failed to build 'accessingProcess' from %{public}s in message from <%{public}@>", v6, v7, v8, v9, v10);
}

void sub_100055548(uint64_t a1, void *a2)
{
  int v2 = [a2 requestingProcess];
  uint64_t v3 = [v2 description];
  sub_100020DA8();
  sub_100036F44((void *)&_mh_execute_header, v4, v5, "'%{public}s' is wrong size in message from %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000555EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BUNDLE_ATTRIBUTION: attributed bundle creation fails for: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100055AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100055B20(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    uint64_t v5 = state64;
    uint64_t v6 = [WeakRetained server];
    uint64_t v7 = [v6 logHandle];

    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = MKBGetDeviceLockState();
        *(_DWORD *)buf = 67109120;
        int v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote Alert: lock state notification with MKB lock state: %d.", buf, 8u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Remote Alert: Notified of device unlock.", buf, 2u);
      }

      notify_cancel(a2);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
}

void sub_100055D5C(id a1)
{
  BOOL v1 = objc_opt_class() && objc_opt_class() && objc_opt_class() && objc_opt_class() != 0;
  byte_1000AC7A0 = v1;
}

void sub_100056758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_100056778(uint64_t a1)
{
  if ([*(id *)(a1 + 32) condition] != (id)1) {
    goto LABEL_3;
  }
  id v2 = [*(id *)(a1 + 32) persistentStateType];
  uint64_t v3 = [*(id *)(a1 + 32) service];
  uint64_t v4 = [v3 name];
  objc_msgSend(*(id *)(a1 + 32), "setPersistentStateValue:", db_persistent_state_get_value((uint64_t)v2, v4));

  if ((int)[*(id *)(a1 + 32) persistentStateValue] >= 1)
  {
LABEL_3:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _displaySBRemoteAlert:*(void *)(a1 + 32)];
      id WeakRetained = v6;
    }
  }
}

void sub_100056FC4()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Remote Alert: failed to allocate SBSRemoteAlertDefinition.", v2, v3, v4, v5, v6);
}

void sub_100056FF8()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Remote Alert: failed to allocate SBSRemoteAlertHandle.", v2, v3, v4, v5, v6);
}

void sub_10005702C()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Remote Alert: failed to allocate SBSRemoteAlertActivationContext.", v2, v3, v4, v5, v6);
}

void sub_100057060(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote Alert: alert not configured correctly: %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000570D8(void *a1, NSObject *a2)
{
  id v4 = [a1 condition];
  uint64_t v5 = [a1 configuration];
  int v6 = 134218242;
  id v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Display Alert: alert condition (%ld) not supported or misconfigured: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100057194(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Remote Alert: handle: %{public}@, didInvalidateWithError: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10005721C()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "error attempting to create RBSTarget for prompting clienting", v2, v3, v4, v5, v6);
}

void sub_100057250()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "error attempting to create RBSDomainAttribute for prompting clienting", v2, v3, v4, v5, v6);
}

void sub_100057284(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error attempting to acquire RBSDomainAttribute for prompting clienting with error: %@", (uint8_t *)&v2, 0xCu);
}

id sub_10005752C(uint64_t a1)
{
  [*(id *)(a1 + 32) setCustomUserInfo:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 32);
  return [v2 display];
}

void sub_100057AA0()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Removed WatchKit app file: %@", v2, v3, v4, v5, v6);
}

void sub_100057B08()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to remove WatchKit app file: %{public}@; because: %{public}@");
}

void sub_100057B70(uint64_t a1, void **a2, void *a3)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a3;
  uint8_t v6 = [v4 perDeviceMainIdentiferToReplicaIdentifier];
  id v7 = [v6 objectForKeyedSubscript:a1];
  int v8 = 138412546;
  uint64_t v9 = a1;
  sub_100014F40();
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Computed: mainClientIdentifier: %@ -> replicaClientIdentifier: %@", (uint8_t *)&v8, 0x16u);
}

void sub_100057C3C()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "No existing saved per-device WatchKitApp info at: %@", v2, v3, v4, v5, v6);
}

void sub_100057CA4()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Failed to unarchive WatchKit data in: %{public}@: %{public}@");
}

void sub_100057D0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = +[TCCDMainSyncController currentArchiveVersion];
  sub_100014F6C();
  uint64_t v9 = a2;
  __int16 v10 = v6;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unarchived WatchKit data in: %{public}@: version mismatch: %@ vs %@", v8, 0x20u);
}

void sub_100057DD0()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Error writing WatchKitAppInfo to: perDeviceReplicaIdentiferToWatchAppInfo is nil.", v2, v3, v4, v5, v6);
}

void sub_100057E04()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Error writing WatchKitAppInfo to: %{public}@; error:%{public}@");
}

void sub_100057E6C(uint64_t a1, void *a2)
{
  sub_100014F80(a1, a2);
  uint64_t v5 = [(id)sub_100014FE4() description];
  *uint64_t v3 = 138412290;
  void *v2 = v5;
  sub_100015010((void *)&_mh_execute_header, v6, v7, "Syncing newly installed WatchKit application with action: %@");
}

void sub_100057ED0(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "Have %lu access actions from the database.", v6, v7, v8, v9, v10);
}

void sub_100057F58(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "Have %lu new watchkit apps that have been installed", v6, v7, v8, v9, v10);
}

void sub_100057FE0(uint64_t a1, void *a2)
{
  sub_100014F80(a1, a2);
  uint64_t v5 = [(id)sub_100014FE4() bundleIdentifier];
  *(_DWORD *)id v3 = 138412290;
  void *v2 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Recieved WatchKit application id: %@ that has no companion app identifier.", v3, 0xCu);
}

void sub_100058054(uint64_t a1, void *a2)
{
  sub_100014F80(a1, a2);
  uint64_t v5 = [(id)sub_100014FE4() bundleIdentifier];
  *id v3 = 138412290;
  void *v2 = v5;
  sub_100015010((void *)&_mh_execute_header, v6, v7, "Known WatchKit application id: %@");
}

void sub_1000580B8()
{
  sub_100014FB4();
  sub_100014F14((void *)&_mh_execute_header, v0, v1, "Deleting our record of WatchKit application id: %@ -> main id: %@");
}

void sub_100058120()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Resetting all state for %@ for reunion sync", v2, v3, v4, v5, v6);
}

void sub_100058188()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Waiting for database resync.", v2, v3, v4, v5, v6);
}

void sub_1000581BC()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Terminating sync session.", v2, v3, v4, v5, v6);
}

void sub_1000581F0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v3, v5, "Failed to enumerate installed watch applications: %{public}@", v6);
}

void sub_10005828C()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Terminating sync session <2>.", v2, v3, v4, v5, v6);
}

void sub_1000582C0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v3, v5, "Failed to enumerate locally available applications: %{public}@", v6);
}

void sub_10005835C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000583D8()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to allocate ACXDeviceConnection.", v2, v3, v4, v5, v6);
}

void sub_10005840C()
{
  sub_100014F34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Main _initializeSyncEngineAfterDeviceUnlockHook", v1, 2u);
}

void sub_10005844C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Newly paired device OS version: 0x%x is too old; not syncing",
    (uint8_t *)v2,
    8u);
}

void sub_1000584C4()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "_didUnPairDeviceHook: there is an active PSYServiceSyncSession syncSession; that's unexpected!",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000584F8(int a1, NSObject *a2)
{
  int v2 = 136446466;
  uint64_t v3 = "tccd_main_sync_get_current_override_status";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s: database access error for access_overrides: %d", (uint8_t *)&v2, 0x12u);
}

void sub_100058584()
{
  sub_100014F08();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Failing PSYServiceSyncSession: %{public}@", v1, 0xCu);
}

void sub_1000585F8()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "Unable to make a requestAccessAction from %{public}@", v2);
}

void sub_100058664()
{
  sub_100014FB4();
  sub_100014F14((void *)&_mh_execute_header, v0, v1, "Handling a Access Request Message: %@ -> %@");
}

void sub_1000586CC()
{
  sub_100014FCC();
  sub_100014F14((void *)&_mh_execute_header, v0, v1, "mainClientIdentifier: %@ -> replicaClientIdentifier: %@");
}

void sub_10005873C()
{
  sub_100014FCC();
  sub_100014F14((void *)&_mh_execute_header, v0, v1, "replicaClientIdentifier: %@ -> mainClientIdentifier: %@");
}

void sub_1000587AC(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  uint64_t v3 = "-[TCCDMainSyncController syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizat"
       "ionVersion:flags:updateType:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to get a replicaClientIdentifier for mainClientIdentifier: %{public}@.", (uint8_t *)&v2, 0x16u);
}

void sub_100058838()
{
  int v3 = 136315650;
  __int16 v4 = "-[TCCDMainSyncController syncAccessUpdateForServiceIdentifier:clientIdentifier:clientType:accessStatus:authorizat"
       "ionVersion:flags:updateType:]";
  sub_100014F40();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: Sending potential syncAccessUpdate for: %@, %@", (uint8_t *)&v3, 0x20u);
}

void sub_1000588C8()
{
  int v1 = 136315394;
  os_log_t v2 = "-[TCCDMainSyncController syncOverrideUpdateForServiceIdentifier:updateType:]";
  sub_100014F40();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Syncing not enabled... dropping sync of: %@", (uint8_t *)&v1, 0x16u);
}

void sub_10005894C(void *a1, void *a2)
{
  __int16 v4 = a1;
  id v5 = a2;
  uint64_t v6 = [(id)sub_100014FE4() serviceName];
  id v7 = [v2 syncSessionType];
  uint64_t v8 = off_1000ABF60((uint64_t)v7);
  uint64_t v9 = [v2 pairedDevice];

  uint8_t v10 = off_1000ABF58();
  uint64_t v11 = [v9 valueForProperty:v10];
  sub_100014F6C();
  unsigned int v15 = v8;
  __int16 v16 = v12;
  uint64_t v17 = v13;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "PairedSync syncCoordinator:beginSyncSession: from coordinator with service name: \"%@\" and sync type: \"%@\" for device: \"%@\"", v14, 0x20u);
}

void sub_100058A7C()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "%{public}@", v2);
}

void sub_100058AE8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [a3 serviceName];
  uint64_t v8 = [v6 pairedDevice];

  uint64_t v9 = off_1000ABF58();
  uint8_t v10 = [v8 valueForProperty:v9];
  int v11 = 138412546;
  __int16 v12 = v7;
  sub_100014F40();
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did receive syncCoordinator:didInvalidateSyncSession: from coordinator with service name: \"%@\" for device: \"%@\"", (uint8_t *)&v11, 0x16u);
}

void sub_100058BF8()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Not handling applicationsInstalled from ACX because of pairing ID mismatch: expected: %{public}@ vs given: %{public}@");
}

void sub_100058C60()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Not handling applicationsUninstalled from ACX because of pairing ID mismatch: expected: %{public}@ vs given: %{public}@");
}

void sub_100058CC8()
{
  sub_100014EB4();
  sub_100014ECC((void *)&_mh_execute_header, v0, v1, "Not handling applicationDatabaseResyncedForDeviceWithPairingID from ACX because of pairing ID mismatch: expected: %{public}@ vs given: %{public}@");
}

void sub_100058D30()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failing testResetSync because isSyncingEnabled is NO", v2, v3, v4, v5, v6);
}

void sub_100058D64()
{
  sub_100014F34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "testResetSync", v1, 2u);
}

void sub_100058DA4()
{
  v1[0] = 136446466;
  sub_1000165D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: Could not find  main client ID for replica client ID: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_100058E24()
{
  v1[0] = 136446466;
  sub_1000165D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: no replicaClientIdentifier for syncID for: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_100058EA4()
{
}

void sub_100058EC0()
{
}

void sub_100058EDC()
{
}

void sub_100058EF8()
{
  os_log_t v0 = +[TCCDPlatform currentPlatform];
  [v0 prepareForAbort];

  _os_crash();
  __break(1u);
}

void sub_100058F34(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sqlite3_expanded_sql failed on %{public}s", (uint8_t *)&v3, 0xCu);
}

void sub_100058FB0(uint64_t a1, int a2, NSObject *a3)
{
  int v4 = 136446722;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 2080;
  uint64_t v9 = sqlite3_errstr(a2);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "sqlite3_step() for %{public}s failed: %d (%s)", (uint8_t *)&v4, 0x1Cu);
}

void sub_100059068(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136446466;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100018408((void *)&_mh_execute_header, a2, a3, "Failed to create %{public}s (%d)", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_1000590E0()
{
}

void sub_1000590FC(void *a1, NSObject *a2)
{
  if ([a1 registryDBHandle]) {
    int v4 = sqlite3_errmsg((sqlite3 *)[a1 registryDBHandle]);
  }
  else {
    int v4 = "allocation failed";
  }
  int v5 = 136446210;
  __int16 v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to open database: %{public}s", (uint8_t *)&v5, 0xCu);
}

void sub_1000591A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059214(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 136446466;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 1026;
  *(_DWORD *)&v3[14] = a2;
  sub_100018408((void *)&_mh_execute_header, a2, a3, "Failed to query registry for db at path %{public}s: error %{public}d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10005928C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000592F8()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to remove old registry", v2, v3, v4, v5, v6);
}

void sub_10005932C()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to get is_setup", v2, v3, v4, v5, v6);
}

void sub_100059360()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to get database version", v2, v3, v4, v5, v6);
}

void sub_100059394()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Closing registry.", v2, v3, v4, v5, v6);
}

void sub_1000593C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059434(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "-[TCCDSyncSession performRequestAccessAction:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: Unexpected nil messageController", (uint8_t *)&v1, 0xCu);
}

void sub_1000594B8(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "-[TCCDSyncSession performRequestAccessAction:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: Attempt enque a RequestAccessAction while one is already inflight", (uint8_t *)&v1, 0xCu);
}

void sub_10005953C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 replicaClientIdentifier];
  uint64_t v5 = [a2 mainClientIdentifier];
  int v6 = 138543618;
  int v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "An error occured during syncing of TCC privacy state from the companion device for '%{public}@' with companion application '%{public}@'.\n Check for error messages from tccd or the companion app on the companion device.", (uint8_t *)&v6, 0x16u);
}

void sub_10005960C()
{
  int v2 = 136446722;
  sub_10001977C();
  sub_1000197C8((void *)&_mh_execute_header, v0, v1, "%{public}s: Allocation failure: _idsService: %p, _messageIdsToHandlers: %p", v2);
}

void sub_100059688(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059700(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100014F14((void *)&_mh_execute_header, a2, a3, "Incoming IDS message from %@: msg: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100059778()
{
  v1[0] = 136446466;
  sub_1000197B4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: No handler defined for incoming message type: %@", (uint8_t *)v1, 0x16u);
}

void sub_1000597FC(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = "Failed";
  if (a1) {
    uint64_t v3 = "Success";
  }
  CFStringRef v4 = &stru_100096EC0;
  if ((a1 & 1) == 0) {
    CFStringRef v4 = (const __CFString *)a2;
  }
  *(_DWORD *)uint64_t v5 = 136315394;
  *(void *)&void v5[4] = v3;
  *(_WORD *)&v5[12] = 2112;
  *(void *)&v5[14] = v4;
  sub_100014F14((void *)&_mh_execute_header, a2, a3, "IDS message didSendWithSuccess: %s: %@", *(void *)v5, *(void *)&v5[8], *(void *)&v5[16]);
}

void sub_100059898()
{
  v1[0] = 136446466;
  sub_1000197B4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: No outgoing message handler for message id: %@", (uint8_t *)v1, 0x16u);
}

void sub_10005991C()
{
  int v2 = 136446722;
  sub_10001977C();
  sub_1000197C8((void *)&_mh_execute_header, v0, v1, "%{public}s: Allocation failure: _queue %p, _messageTypesToHandlers: %p", v2);
}

void sub_100059998(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059A10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100059A88(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Platform does not support sending messages!", v1, 2u);
}

void sub_100059ACC()
{
  v1[0] = 136446466;
  sub_100020F14();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: database access error when getting sync_version: %d", (uint8_t *)v1, 0x12u);
}

void sub_100059B4C()
{
  v1[0] = 136446466;
  sub_100020F14();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: database access error when setting sync_version: %d", (uint8_t *)v1, 0x12u);
}

void sub_100059BCC(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = dword_1000AC498;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Changing sync version from %d to %d", (uint8_t *)v2, 0xEu);
}

void sub_100059C58()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "SyncEngine init:  Allocation failure!", v2, v3, v4, v5, v6);
}

void sub_100059C8C()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "SyncEngine init: proceeding to _initializeSyncEngineAfterDeviceUnlock.", v2, v3, v4, v5, v6);
}

void sub_100059CC0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "SyncEngine init: MKBDeviceUnlockedSinceBoot() returns: %d !!", (uint8_t *)v2, 8u);
}

void sub_100059D38()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "SyncEngine init: Hey! Device is not actually locked.", v2, v3, v4, v5, v6);
}

void sub_100059D6C()
{
  sub_100020EB0();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100020EA4() localizedDescription];
  sub_100020DA8();
  sub_100020DC0((void *)&_mh_execute_header, v4, v5, "SyncEngine init:  found a config file at %{public}@ but could not get a plist from it: %{public}@", v6, v7, v8, v9, v10);
}

void sub_100059E04(void *a1, void *a2)
{
  id v4 = a1;
  [(id)sub_100020D40() maxRetryCount];
  id v5 = [(id)sub_100020EA4() retryIntervalSecs];
  id v6 = [a2 sessionPerMessageTimeoutSecs];
  [a2 eventRetryIntervalSecs];
  sub_100020F3C();
  id v10 = v5;
  __int16 v11 = v7;
  id v12 = v6;
  __int16 v13 = v7;
  uint64_t v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "SyncEngine init: Using config file values: maxRetryCount: %llu, retryIntervalSecs: %llu, sessionPerMessageTimeoutSecs: %llu, eventRetryIntervalSecs %llu", v9, 0x2Au);
}

void sub_100059EDC()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed _initializeSyncEngineHook.", v2, v3, v4, v5, v6);
}

void sub_100059F10()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "Beginning SyncEngine initialization.", v2, v3, v4, v5, v6);
}

void sub_100059F44()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to allocate TCCDMessageController.", v2, v3, v4, v5, v6);
}

void sub_100059F78()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to allocate SYSyncService.", v2, v3, v4, v5, v6);
}

void sub_100059FAC()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "SyncEngine is initialized; waiting on a device pairing",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100059FE0()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "_initializeSyncEngineAfterDeviceUnlockHook returns NO!", v2, v3, v4, v5, v6);
}

void sub_10005A014(void *a1)
{
  id v2 = a1;
  [(id)sub_100020D40() isMain];
  sub_100014FF0((void *)&_mh_execute_header, v3, v4, "SyncEngine init after device unlock: isMain: %s", v5, v6, v7, v8, 2u);
}

void sub_10005A0B4()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "Resumed SYService", v2, v3, v4, v5, v6);
}

void sub_10005A0E8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() localizedDescription];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "failed to resume syncService: %{public}@", v6, v7, v8, v9, v10);
}

void sub_10005A178()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "_didPairToDevice: got a nil device; failing.", v2, v3, v4, v5, v6);
}

void sub_10005A1AC()
{
  sub_100020EB0();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100020EA4() pairedDeviceStorageRoot];
  sub_100020EBC();
  sub_100020D4C((void *)&_mh_execute_header, v4, v5, "did pair to new device: %@: %@", v6, v7, v8, v9, v10);
}

void sub_10005A244(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() pairedDeviceStorageRoot];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "_didPairToDevice: created: %@", v6, v7, v8, v9, v10);
}

void sub_10005A2D4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 pairedDeviceStorageRoot];
  __error();
  uint64_t v5 = __error();
  strerror(*v5);
  sub_100020E44();
  sub_100020ED4((void *)&_mh_execute_header, v6, v7, "_didPairToDevice: failed to mkdir(%{public}@): %d/%{public}s", v8, v9, v10, v11, v12);
}

void sub_10005A384(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 pairedDeviceStorageRoot];
  __error();
  uint64_t v5 = __error();
  strerror(*v5);
  sub_100020E44();
  sub_100020ED4((void *)&_mh_execute_header, v6, v7, "_didPairToDevice: failed to stat(%{public}@): %d/%{public}s", v8, v9, v10, v11, v12);
}

void sub_10005A434()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "did pair to current device.", v2, v3, v4, v5, v6);
}

void sub_10005A468()
{
  sub_100020F28();
  uint64_t v3 = v0;
  sub_100020E10((void *)&_mh_execute_header, v1, (uint64_t)v1, "_didPairToDevice: attempt to pair new device (%@) without unpairing the current device (%@).", v2);
}

void sub_10005A4DC()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "_didUnPairDevice: there is a current SYService session; that's unexpected!",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10005A510(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() pairedDeviceStorageRoot];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "_didUnPairDevice: %@", v6, v7, v8, v9, v10);
}

void sub_10005A5A0(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() description];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "added pendingDeltaSyncChange: %@", v6, v7, v8, v9, v10);
}

void sub_10005A630()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to unarchive data in: %{public}@: %{public}@", v1);
}

void sub_10005A6A0()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "Delta sync archive is missing changes in: %{public}@", v2);
}

void sub_10005A70C()
{
  sub_100014EB4();
  sub_100020E10((void *)&_mh_execute_header, v0, (uint64_t)v0, "Sync archive is missing SyncType key: %{public}@, in %{public}@", v1);
}

void sub_10005A77C()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "Failed to allocate archive data to write sync state!: %{public}@", v2);
}

void sub_10005A7E8()
{
  sub_100020EB0();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100020EA4() localizedDescription];
  sub_100020DA8();
  sub_100020DC0((void *)&_mh_execute_header, v4, v5, "Error writing sync state to: %{public}@; error:%{public}@",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10005A880()
{
  sub_100014F08();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Removed sync state file: %@", v1, 0xCu);
}

void sub_10005A8F4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() retryBlock];
  id v4 = objc_retainBlock(v3);
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v5, v6, "Cancelling retry-block %p", v7, v8, v9, v10, v11);
}

void sub_10005A998()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Failed to allocte the retry-block.", v2, v3, v4, v5, v6);
}

void sub_10005A9CC()
{
  sub_100020E04();
  id v2 = v1;
  [(id)sub_100020DE0() maxRetryCount];
  sub_100014F08();
  sub_100020DC0((void *)&_mh_execute_header, v3, v4, "Reached maximum retry count (%llu); %llu retry syncs failed; saving state to disk.",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void sub_10005AA64()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "RetryMaxReached Not retrying sync. Paired device is in proxmitiy.", v2, v3, v4, v5, v6);
}

void sub_10005AA98()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "RetryMaxReached: Not retrying sync. Paired device is NOT in proxmitiy; waiting for it return.",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10005AACC()
{
  int v2 = 136315650;
  sub_100020E28();
  sub_100020E68((void *)&_mh_execute_header, v0, v1, "%s: Sending potential syncAccessUpdate for: %@, %@", v2);
}

void sub_10005AB40()
{
  sub_100014F08();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Unknown SYChangeType: 0x%lx", v1, 0xCu);
}

void sub_10005ABB4()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "Begin batching delta changes.", v2, v3, v4, v5, v6);
}

void sub_10005ABE8()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "EventRetry for MemoryPressureCritical: requesting a ResetSync.", v2, v3, v4, v5, v6);
}

void sub_10005AC1C()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "EventRetry for MemoryPressureCritical: requesting a DeltaSync.", v2, v3, v4, v5, v6);
}

void sub_10005AC50()
{
  int v2 = 136315650;
  sub_100020E28();
  sub_100020E68((void *)&_mh_execute_header, v0, v1, "%s: update access: %@ -> %@", v2);
}

void sub_10005ACC4()
{
  int v2 = 136315650;
  sub_100020E28();
  sub_100020E68((void *)&_mh_execute_header, v0, v1, "%s: override access: %@ -> %@", v2);
}

void sub_10005AD38()
{
  sub_100020EB0();
  id v1 = v0;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100020E88();
  sub_100020EF4((void *)&_mh_execute_header, v4, v5, "%{public}s: syncStore %{public}@: Unexpected subclass: %{public}@", v6, v7, v8, v9, 2u);
}

void sub_10005ADE4()
{
  sub_100020EB0();
  id v1 = v0;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100020E88();
  sub_100020EF4((void *)&_mh_execute_header, v4, v5, "%{public}s: syncStore %{public}@: Unexpected object of class: %{public}@", v6, v7, v8, v9, 2u);
}

void sub_10005AE90()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Should not be invoking _beginResetSyncHook on the replica.", v2, v3, v4, v5, v6);
}

void sub_10005AEC4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "Rejecting new SYSession:%{public}@ when syncing is not enabled but is expected.", v6, v7, v8, v9, v10);
}

void sub_10005AF54()
{
  sub_100020E04();
  id v2 = v1;
  uint64_t v3 = [(id)sub_100020DE0() identifier];
  sub_100020F28();
  sub_100020D4C((void *)&_mh_execute_header, v4, v5, "SYService starting SYSession:%{public}@: adding changes for reset sync: %@", v6, v7, v8, v9, v10);
}

void sub_10005AFF0(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "Rejecting new SYSession:%{public}@ because a Sending ResetSync is requested on replica.", v6, v7, v8, v9, v10);
}

void sub_10005B080()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_100020D40() pendingDeltaSyncChanges];
  [v4 count];
  sub_100020DEC();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYService starting SYSession:%{public}@: with %lu delta sync changes", v7, v8, v9, v10, v11);
}

void sub_10005B12C()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_100020D40() sessionSyncChanges];
  sub_100020EBC();
  sub_100020DC0((void *)&_mh_execute_header, v5, v6, "SYService starting Sending SYSession:%{public}@: expected self.sessionSyncChanges to be empty but it has these changes: %@", v7, v8, v9, v10, v11);
}

void sub_10005B1D4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_100020DE0() retryBlock];
  id v5 = objc_retainBlock(v4);
  sub_100020F3C();
  uint64_t v9 = v6;
  sub_100020E10((void *)&_mh_execute_header, v3, v7, "Rejecting new SYSession:%{public}@ ResetSync because we have existing retry state (block: %p); retrying",
    v8);
}

void sub_10005B29C()
{
  sub_100020E04();
  id v3 = v2;
  uint64_t v4 = [(id)sub_100020DE0() identifier];
  [v0 isEqualToString:@"com.apple.identityservices.error"];
  sub_100020DC0((void *)&_mh_execute_header, v5, v6, "SYService sessionEnded:%{public}@ with %@ timeout error", v7, v8, v9, v10, 2u);
}

void sub_10005B36C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "SYService sessionEnded:%{public}@ with SYErrorLostCollisionTest error.", v6, v7, v8, v9, v10);
}

void sub_10005B3FC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "SYService sessionEnded:%{public}@ with TCCDSyncErrorCodeSyncNeedToRetrySync error.", v6, v7, v8, v9, v10);
}

void sub_10005B48C()
{
  sub_100020E04();
  id v4 = v3;
  [(id)sub_100020DE0() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)sub_100020D40() localizedDescription];
  sub_100020DA8();
  __int16 v8 = v6;
  uint64_t v9 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "SYService sessionEnded:%{public}@ with error: %{public}@; %{public}@",
    v7,
    0x20u);
}

void sub_10005B54C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "SYSession:%{public}@ was cancelled by us.", v6, v7, v8, v9, v10);
}

void sub_10005B5DC(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "SYSession:%{public}@ was unexpectedly cancelled. Will retry.", v6, v7, v8, v9, v10);
}

void sub_10005B66C(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "SYService sessionEnded:%{public}@ sync completed.", v6, v7, v8, v9, v10);
}

void sub_10005B6FC(void *a1)
{
  id v3 = a1;
  [(id)sub_100020D40() identifier];
  objc_claimAutoreleasedReturnValue();
  int v5 = 138543618;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = [(id)sub_100020EA4() state];
  sub_100020E10((void *)&_mh_execute_header, v1, v4, "SYService sessionEnded:%{public}@: unexpected session state  %ld.", (uint8_t *)&v5);
}

void sub_10005B7B4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = [(id)sub_100020DE0() localizedDescription];
  uint64_t v6 = [a2 description];

  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint8_t v11 = v6;
  sub_100020E10((void *)&_mh_execute_header, v3, v7, "SYService enountered error: %{public}@; context: %@",
    (uint8_t *)&v8);
}

void sub_10005B888()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() UUIDString];
  objc_claimAutoreleasedReturnValue();
  id v4 = [(id)sub_100020D40() UUIDString];
  sub_100020DA8();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYService willSwitchFromPairingID:%{public}@ toParingID:%{public}@", v7, v8, v9, v10, v11);
}

void sub_10005B930()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() UUIDString];
  objc_claimAutoreleasedReturnValue();
  id v4 = [(id)sub_100020D40() UUIDString];
  sub_100020DA8();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYService didSwitchFromPairingID:%{public}@ toParingID:%{public}@", v7, v8, v9, v10, v11);
}

void sub_10005B9D8()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "Paired device is now in proximity: nothing to sync.", v2, v3, v4, v5, v6);
}

void sub_10005BA0C()
{
  sub_100014F34();
  sub_100020D8C((void *)&_mh_execute_header, v0, v1, "Paired device is now out of proximity: nothing to do.", v2, v3, v4, v5, v6);
}

void sub_10005BA40()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_100020D40() identifier];
  sub_100020DA8();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "Will prefer session:%{public}@ over this session: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10005BAE8(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "Cancelling new SYSession:%{public}@ because we are testing maxRetry handling.", v6, v7, v8, v9, v10);
}

void sub_10005BB78()
{
  sub_100020E04();
  id v3 = v2;
  [(id)sub_100020DE0() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)sub_100020D40() sessionSyncChanges];
  [v4 count];
  sub_100020DEC();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYSession:%{public}@; unable to enqueue a change; have %lu left",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void sub_10005BC24()
{
  sub_100020E04();
  id v3 = v2;
  uint64_t v4 = [(id)sub_100020DE0() identifier];
  [v0 count];
  sub_100020DEC();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYSession:%{public}@; enqueuing %lu changes.",
    v7,
    v8,
    v9,
    v10,
    v11);
}

void sub_10005BCC4()
{
  sub_100020E04();
  id v3 = v2;
  uint64_t v4 = [(id)sub_100020DE0() identifier];
  [v0 count];
  sub_100020DEC();
  sub_100020D4C((void *)&_mh_execute_header, v5, v6, "SYSession:%{public}@; applying %lu changes", v7, v8, v9, v10, v11);
}

void sub_10005BD64(void *a1, void *a2)
{
  uint64_t v9 = [a1 identifier];
  if (a2)
  {
    uint64_t v10 = [a2 localizedDescription];
  }
  else
  {
    uint64_t v10 = @"<none>";
  }
  sub_100020DC0((void *)&_mh_execute_header, v3, v4, "SYSession:%{public}@; ended with error: %{public}@",
    v5,
    v6,
    v7,
    v8,
    2u);
  if (a2) {
}
  }

void sub_10005BE2C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "SYSession:%{public}@; resetDataStoreForSyncSession: called for main",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10005BEBC(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() identifier];
  sub_100014F08();
  sub_100014FF0((void *)&_mh_execute_header, v4, v5, "SYSession:%{public}@; resetDataStoreForSyncSession: called for replica",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10005BF4C()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "dataFromChange: Failing to archive SYChange: %{public}@", v2);
}

void sub_10005BFB8(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "dataFromChange: Unexpected class %{public}@ for SYChange archiving", v6, v7, v8, v9, v10);
}

void sub_10005C050()
{
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v0, v1, "changeFromData: Failure to unarchive data %{public}@", v2);
}

void sub_10005C0BC(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  sub_100014F08();
  sub_100020D6C((void *)&_mh_execute_header, v4, v5, "changeFromData: Invalid class %{public}@", v6, v7, v8, v9, v10);
}

void sub_10005C154()
{
  sub_100014F34();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "Generating Sync Status state dump.", v1, 2u);
}

void sub_10005C194(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() serviceIdentifier];
  v5[0] = 136446466;
  sub_1000165D4();
  sub_100020E10((void *)&_mh_execute_header, v1, v4, "%{public}s failed to create a Service: %{public}@", (uint8_t *)v5);
}

void sub_10005C238(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() mainClientIdentifier];
  v5[0] = 136446466;
  sub_1000165D4();
  sub_100020E10((void *)&_mh_execute_header, v1, v4, "%{public}s failed to create Request Context for: %{public}@", (uint8_t *)v5);
}

void sub_10005C2DC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 serviceIdentifier];
  uint8_t v10 = [a2 mainClientIdentifier];
  sub_10002A65C();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x2Au);
}

void sub_10005C3C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10005C43C()
{
  int v1 = 136315394;
  id v2 = "tccd_sync_TCCAccessRequest";
  sub_10002A650();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: incoming client: %@", (uint8_t *)&v1, 0x16u);
}

void sub_10005C4C4(void *a1, void *a2)
{
  id v3 = a1;
  [a2 clientType];
  sub_100020F14();
  sub_10002A66C((void *)&_mh_execute_header, v4, v5, "%{public}s an invalid client type: %d", v6, v7, v8, v9, 2u);
}

void sub_10005C558(void *a1)
{
  id v2 = a1;
  id v3 = [(id)sub_100020D40() messageIdentifier];
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v1, v4, "AUTHREQ_ERROR: msgID=%{public}@, nil result", v5);
}

void sub_10005C5F0()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed: Reset Access: %@", v2, v3, v4, v5, v6);
}

void sub_10005C658()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Handling sync change for Reset Access: %@", v2, v3, v4, v5, v6);
}

void sub_10005C6C0()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Unable to process sync update from request action because the client identifier is nil: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005C728(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C7A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005C818(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  sub_100014F08();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "setting access value to %{public}@ due to TCCDSyncMainSetAccessAction", v5, 0xCu);
}

void sub_10005C8C0()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Attempting to handle a TCCDSyncMainSetAccessAction on the main: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005C928(void *a1, void *a2)
{
  id v3 = a1;
  [a2 clientType];
  sub_100020F14();
  sub_10002A66C((void *)&_mh_execute_header, v4, v5, "%{public}s an invalid client type: %d", v6, v7, v8, v9, 2u);
}

void sub_10005C9C0()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005CA34(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() serviceIdentifier];
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v1, v4, "tccd_replica_sync_update_from_OverrideAccessAction: Invalid service: %{public}@", v5);
}

void sub_10005CACC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_10002A65C();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x20u);
}

void sub_10005CBAC(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136446722;
  uint64_t v4 = "tccd_replica_sync_delete_all_synced_state_block_invoke";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 2082;
  uint64_t v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: unsupported client type %d for client: %{public}s", (uint8_t *)&v3, 0x1Cu);
}

void sub_10005CC48()
{
  sub_10002A650();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: failed to allocate NSString for client: %s", v2, v3, v4, v5, 2u);
}

void sub_10005CCC4()
{
  int v1 = 136315394;
  uint64_t v2 = "tccd_replica_sync_delete_all_synced_state_block_invoke";
  sub_10002A650();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: WatchKit client: %@", (uint8_t *)&v1, 0x16u);
}

void sub_10005CD4C()
{
  sub_10002A650();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: unsupported IDENTITY_TYPE_EXECUTABLE_PATH for client: %{public}s", v2, v3, v4, v5, 2u);
}

void sub_10005CDC8()
{
}

void sub_10005CDE4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  xpc_dictionary_get_string(a2, _xpc_error_key_description);
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v3, v4, "service handler: %{public}s", v5);
}

void sub_10005CE8C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  xpc_dictionary_get_string(a2, _xpc_error_key_description);
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v3, v4, "client handler: %{public}s", v5);
}

void sub_10005CF34()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed to create a reply dictionary for message: %s", v2, v3, v4, v5, v6);
}

void sub_10005CF9C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Unhandled message!: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005D004()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed to issue sandbox extension for class: %{public}s", v2, v3, v4, v5, v6);
}

void sub_10005D06C()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Ignoring unknown request (%{public}s)", v2, v3, v4, v5, v6);
}

void sub_10005D0D4(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_100020E10((void *)&_mh_execute_header, a4, a3, "AUTHREQ_ERROR: Failed to retrieve %@ record from db for client: %@", (uint8_t *)a3);
}

void sub_10005D13C()
{
  sub_100014F34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "setting desired auth to Allowed", v1, 2u);
}

void sub_10005D17C(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_100020E10((void *)&_mh_execute_header, a4, a3, "Staged prompting request is invalid: currentAuth: %llu desiredAuth: %llu", (uint8_t *)a1);
}

void sub_10005D1CC(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "client has already prompted for full access, flags: %d", buf, 8u);
}

void sub_10005D214(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100014F9C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Client %@ has already prompted for full access to kTCCServicePhotosAdd", (uint8_t *)a2);
}

void sub_10005D264(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100014F9C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to retrieve kTCCPhotosAdd record from db for client: %@", (uint8_t *)a2);
}

void sub_10005D2B4()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Ignoring assumed identity for authorization request it's not a bundle: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005D31C()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005D390()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005D404()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Failed to convert overrides to an XPC object: %@", v2, v3, v4, v5, v6);
}

void sub_10005D46C()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005D4E0()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005D554(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014F08();
  sub_10002A65C();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x16u);
}

void sub_10005D608()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Invalid platform name: %{public}s", v2, v3, v4, v5, v6);
}

void sub_10005D670()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005D6E4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Generating bogus DB query in %u seconds...", (uint8_t *)v1, 8u);
}

void sub_10005D764(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_100020D40() error];
  uint64_t v4 = [v3 localizedDescription];
  sub_100014F08();
  sub_100014F9C((void *)&_mh_execute_header, v1, v5, "do_TCCAccessRequest() fails: %@", v6);
}

void sub_10005D814()
{
  sub_100014F08();
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  sub_100020E10((void *)&_mh_execute_header, v1, (uint64_t)v1, "show-alert: Invalid parameters service arg: %{public}s, condition arg: %{public}s", v2);
}

void sub_10005D890()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "show-alert: Undefined service: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005D8F8()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "show-alert: Invalid condition : %{public}@", v2, v3, v4, v5, v6);
}

void sub_10005D960()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "incomingSyncAuth test command is only supported on iOS and watchOS", v2, v3, v4, v5, v6);
}

void sub_10005D994()
{
  sub_100014F08();
  sub_100019798((void *)&_mh_execute_header, v0, v1, "Unsupported internal test operation: %s", v2, v3, v4, v5, v6);
}

void sub_10005D9FC()
{
  sub_100014F08();
  sub_100014F50((void *)&_mh_execute_header, v0, v1, "Handling internal test operation: %s", v2, v3, v4, v5, v6);
}

void sub_10005DA64()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005DAD8(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_100020D40();
  xpc_copy_description(v3);
  int v5 = 136446466;
  uint8_t v6 = "handle_TCCGetIdentityForCredential";
  sub_10002A650();
  sub_100020E10((void *)&_mh_execute_header, v1, v4, "%{public}s: Failed to initialize attributionChain for message: %{public}s", (uint8_t *)&v5);
}

void sub_10005DB78()
{
  sub_10002A650();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: Failed to attribute identity for attributionChain: %@", v2, v3, v4, v5, 2u);
}

void sub_10005DBF4()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005DC68()
{
  sub_1000165D4();
  sub_10002A634((void *)&_mh_execute_header, v0, v1, "%{public}s: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10005DCDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005DD54()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "handle_TCCExpirationCopyInformationForService(): failed to allocate clientInfo dictionary.", v2, v3, v4, v5, v6);
}

void sub_10005DD88(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) name];
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2114;
  uint64_t v8 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "handle_TCCExpirationCopyInformationForService(): unexpected client_type: %d for query for service %{public}@.", (uint8_t *)v6, 0x12u);
}

void sub_10005DE3C()
{
  sub_100014F34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "... Generating bogus DB query", v1, 2u);
}

void sub_10005DE7C()
{
  sub_100014F34();
  sub_100014EEC((void *)&_mh_execute_header, v0, v1, "Unexpected execution of SQL statement step block when generating a database error.", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return _CFBundleCopyBundleURL(bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return _CFBundleCopyExecutableURL(bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFDictionaryRef CFBundleGetLocalInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetLocalInfoDictionary(bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t DMCopyMigrationPhaseDescription()
{
  return _DMCopyMigrationPhaseDescription();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSProcessIDForDisplayIdentifier()
{
  return _SBSProcessIDForDisplayIdentifier();
}

OSStatus SecCodeCopyPath(SecStaticCodeRef staticCode, SecCSFlags flags, CFURLRef *path)
{
  return _SecCodeCopyPath(staticCode, flags, path);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return _SecTaskCopyValuesForEntitlements(task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TMIsAutomaticTimeEnabled()
{
  return _TMIsAutomaticTimeEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
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

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _sqlite3_integrity_check()
{
  return __sqlite3_integrity_check();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t abort_with_reason()
{
  return _abort_with_reason();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return _audit_token_to_asid(atoken);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return _audit_token_to_auid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return _audit_token_to_pidversion(atoken);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t csops()
{
  return _csops();
}

uint64_t csops_audittoken()
{
  return _csops_audittoken();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return _dyld_get_active_platform();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t launch_remove_external_service()
{
  return _launch_remove_external_service();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t sandbox_extension_issue_generic()
{
  return _sandbox_extension_issue_generic();
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
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

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return _sqlite3_db_filename(db, zDbName);
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

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_expanded_sql(pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return _sqlite3_extended_errcode(db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
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

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tcc_authorization_changed_for_service_notification_name()
{
  return _tcc_authorization_changed_for_service_notification_name();
}

uint64_t tcc_identity_create()
{
  return _tcc_identity_create();
}

uint64_t tcc_identity_get_identifier()
{
  return _tcc_identity_get_identifier();
}

uint64_t tcc_identity_get_type()
{
  return _tcc_identity_get_type();
}

uint64_t tcc_identity_type_and_identifiers_are_equal()
{
  return _tcc_identity_type_and_identifiers_are_equal();
}

uint64_t tcc_object_copy_description()
{
  return _tcc_object_copy_description();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return _tcc_service_singleton_for_CF_name();
}

uint64_t terminate_with_reason()
{
  return _terminate_with_reason();
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return _xpc_copy_code_signing_identity_for_token();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
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

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return _xpc_event_publisher_fire_with_reply();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_strerror()
{
  return _xpc_strerror();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return _xpc_uuid_get_bytes(xuuid);
}

id objc_msgSend_MDMOverridesFilePath(void *a1, const char *a2, ...)
{
  return [a1 MDMOverridesFilePath];
}

id objc_msgSend_SDKDictionary(void *a1, const char *a2, ...)
{
  return [a1 SDKDictionary];
}

id objc_msgSend_TCCPolicy(void *a1, const char *a2, ...)
{
  return [a1 TCCPolicy];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__acquireTransaction(void *a1, const char *a2, ...)
{
  return [a1 _acquireTransaction];
}

id objc_msgSend__beginAsyncSyncEngineInitialization(void *a1, const char *a2, ...)
{
  return [a1 _beginAsyncSyncEngineInitialization];
}

id objc_msgSend__beginResetSyncHook(void *a1, const char *a2, ...)
{
  return [a1 _beginResetSyncHook];
}

id objc_msgSend__checkEntitlement(void *a1, const char *a2, ...)
{
  return [a1 _checkEntitlement];
}

id objc_msgSend__computeMainIdentifiersFromWatchKitAppInfo(void *a1, const char *a2, ...)
{
  return [a1 _computeMainIdentifiersFromWatchKitAppInfo];
}

id objc_msgSend__configureServices(void *a1, const char *a2, ...)
{
  return [a1 _configureServices];
}

id objc_msgSend__createOSStateHandler(void *a1, const char *a2, ...)
{
  return [a1 _createOSStateHandler];
}

id objc_msgSend__dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 _dateFormatter];
}

id objc_msgSend__description(void *a1, const char *a2, ...)
{
  return [a1 _description];
}

id objc_msgSend__didUnPairDevice(void *a1, const char *a2, ...)
{
  return [a1 _didUnPairDevice];
}

id objc_msgSend__didUnPairDeviceHook(void *a1, const char *a2, ...)
{
  return [a1 _didUnPairDeviceHook];
}

id objc_msgSend__handlePairingSession(void *a1, const char *a2, ...)
{
  return [a1 _handlePairingSession];
}

id objc_msgSend__initIdentityCache(void *a1, const char *a2, ...)
{
  return [a1 _initIdentityCache];
}

id objc_msgSend__initializeSyncEngineAfterDeviceUnlock(void *a1, const char *a2, ...)
{
  return [a1 _initializeSyncEngineAfterDeviceUnlock];
}

id objc_msgSend__initializeSyncEngineAfterDeviceUnlockHook(void *a1, const char *a2, ...)
{
  return [a1 _initializeSyncEngineAfterDeviceUnlockHook];
}

id objc_msgSend__initializeSyncEngineHook(void *a1, const char *a2, ...)
{
  return [a1 _initializeSyncEngineHook];
}

id objc_msgSend__initiateResetSync(void *a1, const char *a2, ...)
{
  return [a1 _initiateResetSync];
}

id objc_msgSend__invalidMethodForPlatform(void *a1, const char *a2, ...)
{
  return [a1 _invalidMethodForPlatform];
}

id objc_msgSend__isDeviceLocked(void *a1, const char *a2, ...)
{
  return [a1 _isDeviceLocked];
}

id objc_msgSend__isSBRemoteAlertAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isSBRemoteAlertAvailable];
}

id objc_msgSend__loadSavedSyncState(void *a1, const char *a2, ...)
{
  return [a1 _loadSavedSyncState];
}

id objc_msgSend__loadSavedWatchKitAppInfo(void *a1, const char *a2, ...)
{
  return [a1 _loadSavedWatchKitAppInfo];
}

id objc_msgSend__loadState(void *a1, const char *a2, ...)
{
  return [a1 _loadState];
}

id objc_msgSend__makePostPairingContinuation(void *a1, const char *a2, ...)
{
  return [a1 _makePostPairingContinuation];
}

id objc_msgSend__osStateDump(void *a1, const char *a2, ...)
{
  return [a1 _osStateDump];
}

id objc_msgSend__publishPendingEvents(void *a1, const char *a2, ...)
{
  return [a1 _publishPendingEvents];
}

id objc_msgSend__removeSavedSyncState(void *a1, const char *a2, ...)
{
  return [a1 _removeSavedSyncState];
}

id objc_msgSend__removeWatchKitAppInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _removeWatchKitAppInfoFile];
}

id objc_msgSend__resetSyncingAndCancelAnyInFlightSessions(void *a1, const char *a2, ...)
{
  return [a1 _resetSyncingAndCancelAnyInFlightSessions];
}

id objc_msgSend__retrySyncCancel(void *a1, const char *a2, ...)
{
  return [a1 _retrySyncCancel];
}

id objc_msgSend__retrySyncReset(void *a1, const char *a2, ...)
{
  return [a1 _retrySyncReset];
}

id objc_msgSend__saveState(void *a1, const char *a2, ...)
{
  return [a1 _saveState];
}

id objc_msgSend__savedSyncStateFile(void *a1, const char *a2, ...)
{
  return [a1 _savedSyncStateFile];
}

id objc_msgSend__savedWatchKitAppInfoFile(void *a1, const char *a2, ...)
{
  return [a1 _savedWatchKitAppInfoFile];
}

id objc_msgSend__serializeState(void *a1, const char *a2, ...)
{
  return [a1 _serializeState];
}

id objc_msgSend__setupOSStateHandler(void *a1, const char *a2, ...)
{
  return [a1 _setupOSStateHandler];
}

id objc_msgSend__syncStatusDescriptionString(void *a1, const char *a2, ...)
{
  return [a1 _syncStatusDescriptionString];
}

id objc_msgSend__updateInstalledWatchKitApps(void *a1, const char *a2, ...)
{
  return [a1 _updateInstalledWatchKitApps];
}

id objc_msgSend__waitForDeviceUnlock(void *a1, const char *a2, ...)
{
  return [a1 _waitForDeviceUnlock];
}

id objc_msgSend__writeSavedWatchKitAppInfo(void *a1, const char *a2, ...)
{
  return [a1 _writeSavedWatchKitAppInfo];
}

id objc_msgSend__writeSyncState(void *a1, const char *a2, ...)
{
  return [a1 _writeSyncState];
}

id objc_msgSend__writeSyncStateAndAllowTermination(void *a1, const char *a2, ...)
{
  return [a1 _writeSyncStateAndAllowTermination];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return [a1 absoluteURL];
}

id objc_msgSend_accessIdentity(void *a1, const char *a2, ...)
{
  return [a1 accessIdentity];
}

id objc_msgSend_accessObject(void *a1, const char *a2, ...)
{
  return [a1 accessObject];
}

id objc_msgSend_accessSetPrompt(void *a1, const char *a2, ...)
{
  return [a1 accessSetPrompt];
}

id objc_msgSend_accessingProcess(void *a1, const char *a2, ...)
{
  return [a1 accessingProcess];
}

id objc_msgSend_accessingProcessIsValid(void *a1, const char *a2, ...)
{
  return [a1 accessingProcessIsValid];
}

id objc_msgSend_accessingProcessSpecified(void *a1, const char *a2, ...)
{
  return [a1 accessingProcessSpecified];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_acxDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 acxDeviceConnection];
}

id objc_msgSend_acxDeviceConnectionClass(void *a1, const char *a2, ...)
{
  return [a1 acxDeviceConnectionClass];
}

id objc_msgSend_addAccessUsageDescriptionKeyName(void *a1, const char *a2, ...)
{
  return [a1 addAccessUsageDescriptionKeyName];
}

id objc_msgSend_addModifyAddedAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 addModifyAddedAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_alertManager(void *a1, const char *a2, ...)
{
  return [a1 alertManager];
}

id objc_msgSend_alertQueue(void *a1, const char *a2, ...)
{
  return [a1 alertQueue];
}

id objc_msgSend_alertSemaphore(void *a1, const char *a2, ...)
{
  return [a1 alertSemaphore];
}

id objc_msgSend_alertStyle(void *a1, const char *a2, ...)
{
  return [a1 alertStyle];
}

id objc_msgSend_alerts(void *a1, const char *a2, ...)
{
  return [a1 alerts];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allServices(void *a1, const char *a2, ...)
{
  return [a1 allServices];
}

id objc_msgSend_allTCCEntitlements(void *a1, const char *a2, ...)
{
  return [a1 allTCCEntitlements];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 allowAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_allowedClassesForSYChangeUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForSYChangeUnarchiving];
}

id objc_msgSend_allowedClassesForSavedSyncStateUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForSavedSyncStateUnarchiving];
}

id objc_msgSend_allowedClassesForWatchKitAppInfoUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForWatchKitAppInfoUnarchiving];
}

id objc_msgSend_allowedForAvocadoWidget(void *a1, const char *a2, ...)
{
  return [a1 allowedForAvocadoWidget];
}

id objc_msgSend_allowsInternalSecurityPolicies(void *a1, const char *a2, ...)
{
  return [a1 allowsInternalSecurityPolicies];
}

id objc_msgSend_alternatePromptTitleEntitlement(void *a1, const char *a2, ...)
{
  return [a1 alternatePromptTitleEntitlement];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_applicationMode(void *a1, const char *a2, ...)
{
  return [a1 applicationMode];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_applyDevelopmentAuthorizationPolicy(void *a1, const char *a2, ...)
{
  return [a1 applyDevelopmentAuthorizationPolicy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assumedIdentityMonitor(void *a1, const char *a2, ...)
{
  return [a1 assumedIdentityMonitor];
}

id objc_msgSend_attributionChain(void *a1, const char *a2, ...)
{
  return [a1 attributionChain];
}

id objc_msgSend_attributionPath(void *a1, const char *a2, ...)
{
  return [a1 attributionPath];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_auid(void *a1, const char *a2, ...)
{
  return [a1 auid];
}

id objc_msgSend_authSpecificNotificationExtensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 authSpecificNotificationExtensionBundleIdentifier];
}

id objc_msgSend_authorizationPromptRightsMask(void *a1, const char *a2, ...)
{
  return [a1 authorizationPromptRightsMask];
}

id objc_msgSend_authorizationReason(void *a1, const char *a2, ...)
{
  return [a1 authorizationReason];
}

id objc_msgSend_authorizationRightState(void *a1, const char *a2, ...)
{
  return [a1 authorizationRightState];
}

id objc_msgSend_authorizationRightsMask(void *a1, const char *a2, ...)
{
  return [a1 authorizationRightsMask];
}

id objc_msgSend_authorizationValue(void *a1, const char *a2, ...)
{
  return [a1 authorizationValue];
}

id objc_msgSend_authorizationValueType(void *a1, const char *a2, ...)
{
  return [a1 authorizationValueType];
}

id objc_msgSend_authorizationVersion(void *a1, const char *a2, ...)
{
  return [a1 authorizationVersion];
}

id objc_msgSend_authorizationVersionNumber(void *a1, const char *a2, ...)
{
  return [a1 authorizationVersionNumber];
}

id objc_msgSend_batchDeltaChanges(void *a1, const char *a2, ...)
{
  return [a1 batchDeltaChanges];
}

id objc_msgSend_beginBatchingDeltaChanges(void *a1, const char *a2, ...)
{
  return [a1 beginBatchingDeltaChanges];
}

id objc_msgSend_binaryPath(void *a1, const char *a2, ...)
{
  return [a1 binaryPath];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 cacheDirectory];
}

id objc_msgSend_cancelButtontitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 cancelButtontitleLocalizationKey];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_checkAllowEntitlementOnResponsibleProcess(void *a1, const char *a2, ...)
{
  return [a1 checkAllowEntitlementOnResponsibleProcess];
}

id objc_msgSend_clientDict(void *a1, const char *a2, ...)
{
  return [a1 clientDict];
}

id objc_msgSend_clientIdentifierForCurrentPlatform(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifierForCurrentPlatform];
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return [a1 clientType];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_codeIdentity(void *a1, const char *a2, ...)
{
  return [a1 codeIdentity];
}

id objc_msgSend_codesignStatus(void *a1, const char *a2, ...)
{
  return [a1 codesignStatus];
}

id objc_msgSend_companionAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 companionAppBundleID];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationDictionary(void *a1, const char *a2, ...)
{
  return [a1 configurationDictionary];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterpartIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 counterpartIdentifiers];
}

id objc_msgSend_createStateHandler(void *a1, const char *a2, ...)
{
  return [a1 createStateHandler];
}

id objc_msgSend_currentArchiveVersion(void *a1, const char *a2, ...)
{
  return [a1 currentArchiveVersion];
}

id objc_msgSend_currentPlatform(void *a1, const char *a2, ...)
{
  return [a1 currentPlatform];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_customUserInfo(void *a1, const char *a2, ...)
{
  return [a1 customUserInfo];
}

id objc_msgSend_daemonDict(void *a1, const char *a2, ...)
{
  return [a1 daemonDict];
}

id objc_msgSend_databaseAction(void *a1, const char *a2, ...)
{
  return [a1 databaseAction];
}

id objc_msgSend_databaseFlags(void *a1, const char *a2, ...)
{
  return [a1 databaseFlags];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultDesiredAuth(void *a1, const char *a2, ...)
{
  return [a1 defaultDesiredAuth];
}

id objc_msgSend_defaultDevelopmentAuthorizationValue(void *a1, const char *a2, ...)
{
  return [a1 defaultDevelopmentAuthorizationValue];
}

id objc_msgSend_defaultLocalizedResourcesBundlePath(void *a1, const char *a2, ...)
{
  return [a1 defaultLocalizedResourcesBundlePath];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_denyAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 denyAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionDictionariesForAllAccessRecords(void *a1, const char *a2, ...)
{
  return [a1 descriptionDictionariesForAllAccessRecords];
}

id objc_msgSend_descriptionDictionary(void *a1, const char *a2, ...)
{
  return [a1 descriptionDictionary];
}

id objc_msgSend_desiredAuth(void *a1, const char *a2, ...)
{
  return [a1 desiredAuth];
}

id objc_msgSend_developmentAuthorizationValue(void *a1, const char *a2, ...)
{
  return [a1 developmentAuthorizationValue];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didSendMessage(void *a1, const char *a2, ...)
{
  return [a1 didSendMessage];
}

id objc_msgSend_disallowedOnPlatformSubtypeNameList(void *a1, const char *a2, ...)
{
  return [a1 disallowedOnPlatformSubtypeNameList];
}

id objc_msgSend_displayCountlimit(void *a1, const char *a2, ...)
{
  return [a1 displayCountlimit];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNamePolicyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 displayNamePolicyIdentifier];
}

id objc_msgSend_displayPolicy(void *a1, const char *a2, ...)
{
  return [a1 displayPolicy];
}

id objc_msgSend_displayQueue(void *a1, const char *a2, ...)
{
  return [a1 displayQueue];
}

id objc_msgSend_doNotStoreDefaultAllowAccess(void *a1, const char *a2, ...)
{
  return [a1 doNotStoreDefaultAllowAccess];
}

id objc_msgSend_doUpdateOfSubjectVerifierData(void *a1, const char *a2, ...)
{
  return [a1 doUpdateOfSubjectVerifierData];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downgradeAuthRight(void *a1, const char *a2, ...)
{
  return [a1 downgradeAuthRight];
}

id objc_msgSend_endBatchingDeltaChanges(void *a1, const char *a2, ...)
{
  return [a1 endBatchingDeltaChanges];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return [a1 euid];
}

id objc_msgSend_eventPublisher(void *a1, const char *a2, ...)
{
  return [a1 eventPublisher];
}

id objc_msgSend_eventRetryBlock(void *a1, const char *a2, ...)
{
  return [a1 eventRetryBlock];
}

id objc_msgSend_eventRetryIntervalSecs(void *a1, const char *a2, ...)
{
  return [a1 eventRetryIntervalSecs];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return [a1 executablePath];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return [a1 executableURL];
}

id objc_msgSend_expireOnlyAllowedEntries(void *a1, const char *a2, ...)
{
  return [a1 expireOnlyAllowedEntries];
}

id objc_msgSend_expirySeconds(void *a1, const char *a2, ...)
{
  return [a1 expirySeconds];
}

id objc_msgSend_explicitlyAssumedIdentity(void *a1, const char *a2, ...)
{
  return [a1 explicitlyAssumedIdentity];
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionPointIdentifier];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_extensionPointType(void *a1, const char *a2, ...)
{
  return [a1 extensionPointType];
}

id objc_msgSend_externalName(void *a1, const char *a2, ...)
{
  return [a1 externalName];
}

id objc_msgSend_fetchAllAccessRecords(void *a1, const char *a2, ...)
{
  return [a1 fetchAllAccessRecords];
}

id objc_msgSend_fetchAllActivePolicies(void *a1, const char *a2, ...)
{
  return [a1 fetchAllActivePolicies];
}

id objc_msgSend_fetchAllOverriddenServiceNames(void *a1, const char *a2, ...)
{
  return [a1 fetchAllOverriddenServiceNames];
}

id objc_msgSend_fetchAllPolicies(void *a1, const char *a2, ...)
{
  return [a1 fetchAllPolicies];
}

id objc_msgSend_fileProviderDomainID(void *a1, const char *a2, ...)
{
  return [a1 fileProviderDomainID];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstStagePromptHeaderAssetCatalogPath(void *a1, const char *a2, ...)
{
  return [a1 firstStagePromptHeaderAssetCatalogPath];
}

id objc_msgSend_firstStagePromptHeaderAssetName(void *a1, const char *a2, ...)
{
  return [a1 firstStagePromptHeaderAssetName];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_fullAccessUsageDescriptionKeyName(void *a1, const char *a2, ...)
{
  return [a1 fullAccessUsageDescriptionKeyName];
}

id objc_msgSend_functionName(void *a1, const char *a2, ...)
{
  return [a1 functionName];
}

id objc_msgSend_generateBacktraceOnPrompt(void *a1, const char *a2, ...)
{
  return [a1 generateBacktraceOnPrompt];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getRegistryDir(void *a1, const char *a2, ...)
{
  return [a1 getRegistryDir];
}

id objc_msgSend_handleMemoryPressureCritical(void *a1, const char *a2, ...)
{
  return [a1 handleMemoryPressureCritical];
}

id objc_msgSend_hasParanoidSecurityPolicy(void *a1, const char *a2, ...)
{
  return [a1 hasParanoidSecurityPolicy];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hideUserNotification(void *a1, const char *a2, ...)
{
  return [a1 hideUserNotification];
}

id objc_msgSend_homeRelativePathToStateDirectory(void *a1, const char *a2, ...)
{
  return [a1 homeRelativePathToStateDirectory];
}

id objc_msgSend_hostDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 hostDeviceUnlocked];
}

id objc_msgSend_hostProcess(void *a1, const char *a2, ...)
{
  return [a1 hostProcess];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierAuthority(void *a1, const char *a2, ...)
{
  return [a1 identifierAuthority];
}

id objc_msgSend_identifierForInvalidCode(void *a1, const char *a2, ...)
{
  return [a1 identifierForInvalidCode];
}

id objc_msgSend_identityDescription(void *a1, const char *a2, ...)
{
  return [a1 identityDescription];
}

id objc_msgSend_identityType(void *a1, const char *a2, ...)
{
  return [a1 identityType];
}

id objc_msgSend_idsMessageDictionary(void *a1, const char *a2, ...)
{
  return [a1 idsMessageDictionary];
}

id objc_msgSend_indirectObject(void *a1, const char *a2, ...)
{
  return [a1 indirectObject];
}

id objc_msgSend_indirectRequestsOutstanding(void *a1, const char *a2, ...)
{
  return [a1 indirectRequestsOutstanding];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initWithAsyncSyncEngineInitialization(void *a1, const char *a2, ...)
{
  return [a1 initWithAsyncSyncEngineInitialization];
}

id objc_msgSend_initialPrompt(void *a1, const char *a2, ...)
{
  return [a1 initialPrompt];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isASKCapable(void *a1, const char *a2, ...)
{
  return [a1 isASKCapable];
}

id objc_msgSend_isAccessAllowedByDefault(void *a1, const char *a2, ...)
{
  return [a1 isAccessAllowedByDefault];
}

id objc_msgSend_isAccessDeniedByDefault(void *a1, const char *a2, ...)
{
  return [a1 isAccessDeniedByDefault];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return [a1 isAppClip];
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return [a1 isApplication];
}

id objc_msgSend_isAvocadoWidget(void *a1, const char *a2, ...)
{
  return [a1 isAvocadoWidget];
}

id objc_msgSend_isCaptureExtension(void *a1, const char *a2, ...)
{
  return [a1 isCaptureExtension];
}

id objc_msgSend_isChinaSKUDevice(void *a1, const char *a2, ...)
{
  return [a1 isChinaSKUDevice];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isMain(void *a1, const char *a2, ...)
{
  return [a1 isMain];
}

id objc_msgSend_isPlatformBinary(void *a1, const char *a2, ...)
{
  return [a1 isPlatformBinary];
}

id objc_msgSend_isPreflight(void *a1, const char *a2, ...)
{
  return [a1 isPreflight];
}

id objc_msgSend_isResetSync(void *a1, const char *a2, ...)
{
  return [a1 isResetSync];
}

id objc_msgSend_isRevocable(void *a1, const char *a2, ...)
{
  return [a1 isRevocable];
}

id objc_msgSend_isSending(void *a1, const char *a2, ...)
{
  return [a1 isSending];
}

id objc_msgSend_isSyncingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSyncingEnabled];
}

id objc_msgSend_isSystemPreferencesApp(void *a1, const char *a2, ...)
{
  return [a1 isSystemPreferencesApp];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWatchKitApp(void *a1, const char *a2, ...)
{
  return [a1 isWatchKitApp];
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return [a1 lastModifiedDate];
}

id objc_msgSend_lastReminderTime(void *a1, const char *a2, ...)
{
  return [a1 lastReminderTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_limitedAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 limitedAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_loadAndParse(void *a1, const char *a2, ...)
{
  return [a1 loadAndParse];
}

id objc_msgSend_loadConfigurationDictionary(void *a1, const char *a2, ...)
{
  return [a1 loadConfigurationDictionary];
}

id objc_msgSend_loadKeysFromDirectory(void *a1, const char *a2, ...)
{
  return [a1 loadKeysFromDirectory];
}

id objc_msgSend_loadPlist(void *a1, const char *a2, ...)
{
  return [a1 loadPlist];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedResourcesBundle(void *a1, const char *a2, ...)
{
  return [a1 localizedResourcesBundle];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainAuthorizationRightState(void *a1, const char *a2, ...)
{
  return [a1 mainAuthorizationRightState];
}

id objc_msgSend_mainClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mainClientIdentifier];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_maintainSize(void *a1, const char *a2, ...)
{
  return [a1 maintainSize];
}

id objc_msgSend_maxRetryCount(void *a1, const char *a2, ...)
{
  return [a1 maxRetryCount];
}

id objc_msgSend_messageController(void *a1, const char *a2, ...)
{
  return [a1 messageController];
}

id objc_msgSend_messageIdentifier(void *a1, const char *a2, ...)
{
  return [a1 messageIdentifier];
}

id objc_msgSend_messageTypesToHandlers(void *a1, const char *a2, ...)
{
  return [a1 messageTypesToHandlers];
}

id objc_msgSend_moreAuthorizationOptionsButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 moreAuthorizationOptionsButtonTitleLocalizationKey];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationActionURL(void *a1, const char *a2, ...)
{
  return [a1 notificationActionURL];
}

id objc_msgSend_notificationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 notificationButtonTitleLocalizationKey];
}

id objc_msgSend_notificationTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 notificationTitleTextLocalizationKey];
}

id objc_msgSend_notifyRegistryChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyRegistryChanged];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nrPairedDeviceRegisteryClass(void *a1, const char *a2, ...)
{
  return [a1 nrPairedDeviceRegisteryClass];
}

id objc_msgSend_orderedOverridePolicies(void *a1, const char *a2, ...)
{
  return [a1 orderedOverridePolicies];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_pairedDeviceStorageRoot(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceStorageRoot];
}

id objc_msgSend_pardonMissingUsage(void *a1, const char *a2, ...)
{
  return [a1 pardonMissingUsage];
}

id objc_msgSend_parsePlist(void *a1, const char *a2, ...)
{
  return [a1 parsePlist];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingDeltaSyncChanges(void *a1, const char *a2, ...)
{
  return [a1 pendingDeltaSyncChanges];
}

id objc_msgSend_pendingPostPairingContinuation(void *a1, const char *a2, ...)
{
  return [a1 pendingPostPairingContinuation];
}

id objc_msgSend_pendingSyncType(void *a1, const char *a2, ...)
{
  return [a1 pendingSyncType];
}

id objc_msgSend_perDeviceMainIdentiferToReplicaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 perDeviceMainIdentiferToReplicaIdentifier];
}

id objc_msgSend_perDeviceReplicaIdentiferToWatchAppInfo(void *a1, const char *a2, ...)
{
  return [a1 perDeviceReplicaIdentiferToWatchAppInfo];
}

id objc_msgSend_persistentStateType(void *a1, const char *a2, ...)
{
  return [a1 persistentStateType];
}

id objc_msgSend_persistentStateValue(void *a1, const char *a2, ...)
{
  return [a1 persistentStateValue];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return [a1 placeholder];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_platformAvailability(void *a1, const char *a2, ...)
{
  return [a1 platformAvailability];
}

id objc_msgSend_platformName(void *a1, const char *a2, ...)
{
  return [a1 platformName];
}

id objc_msgSend_plistDictionary(void *a1, const char *a2, ...)
{
  return [a1 plistDictionary];
}

id objc_msgSend_plistFilePath(void *a1, const char *a2, ...)
{
  return [a1 plistFilePath];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return [a1 plugInKitPlugins];
}

id objc_msgSend_pluginBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pluginBundleIdentifier];
}

id objc_msgSend_pluginPromptPolicy(void *a1, const char *a2, ...)
{
  return [a1 pluginPromptPolicy];
}

id objc_msgSend_pluginTargetsSystemExtensionPoint(void *a1, const char *a2, ...)
{
  return [a1 pluginTargetsSystemExtensionPoint];
}

id objc_msgSend_policyAccessByIdentifier(void *a1, const char *a2, ...)
{
  return [a1 policyAccessByIdentifier];
}

id objc_msgSend_prepareForAbort(void *a1, const char *a2, ...)
{
  return [a1 prepareForAbort];
}

id objc_msgSend_previousAuthorization(void *a1, const char *a2, ...)
{
  return [a1 previousAuthorization];
}

id objc_msgSend_promptRightsMask(void *a1, const char *a2, ...)
{
  return [a1 promptRightsMask];
}

id objc_msgSend_promptType(void *a1, const char *a2, ...)
{
  return [a1 promptType];
}

id objc_msgSend_promptingPolicy(void *a1, const char *a2, ...)
{
  return [a1 promptingPolicy];
}

id objc_msgSend_promptingSemaphore(void *a1, const char *a2, ...)
{
  return [a1 promptingSemaphore];
}

id objc_msgSend_promptingSemaphoreHeld(void *a1, const char *a2, ...)
{
  return [a1 promptingSemaphoreHeld];
}

id objc_msgSend_protectedAppManager(void *a1, const char *a2, ...)
{
  return [a1 protectedAppManager];
}

id objc_msgSend_psySyncCoordinatorClass(void *a1, const char *a2, ...)
{
  return [a1 psySyncCoordinatorClass];
}

id objc_msgSend_purgeAllExpiredAccessEntries(void *a1, const char *a2, ...)
{
  return [a1 purgeAllExpiredAccessEntries];
}

id objc_msgSend_queryCount(void *a1, const char *a2, ...)
{
  return [a1 queryCount];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_reasonDescription(void *a1, const char *a2, ...)
{
  return [a1 reasonDescription];
}

id objc_msgSend_recordUpgradePolicy(void *a1, const char *a2, ...)
{
  return [a1 recordUpgradePolicy];
}

id objc_msgSend_registryDBHandle(void *a1, const char *a2, ...)
{
  return [a1 registryDBHandle];
}

id objc_msgSend_registryDBUnavailable(void *a1, const char *a2, ...)
{
  return [a1 registryDBUnavailable];
}

id objc_msgSend_registryQueue(void *a1, const char *a2, ...)
{
  return [a1 registryQueue];
}

id objc_msgSend_reminderAllowButtonTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 reminderAllowButtonTitleTextLocalizationKey];
}

id objc_msgSend_reminderLimitedButtonTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 reminderLimitedButtonTitleTextLocalizationKey];
}

id objc_msgSend_reminderMonitor(void *a1, const char *a2, ...)
{
  return [a1 reminderMonitor];
}

id objc_msgSend_reminderPrompt(void *a1, const char *a2, ...)
{
  return [a1 reminderPrompt];
}

id objc_msgSend_reminderTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 reminderTitleTextLocalizationKey];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_replaceStoredCodeRequirement(void *a1, const char *a2, ...)
{
  return [a1 replaceStoredCodeRequirement];
}

id objc_msgSend_replicaClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 replicaClientIdentifier];
}

id objc_msgSend_replyNoCacheAuthorization(void *a1, const char *a2, ...)
{
  return [a1 replyNoCacheAuthorization];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestAddTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestAddTitleTextLocalizationKey];
}

id objc_msgSend_requestAdditionalTextAfterV2UpgradeLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestAdditionalTextAfterV2UpgradeLocalizationKey];
}

id objc_msgSend_requestAdditionalTextForSubsequentRequestsLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestAdditionalTextForSubsequentRequestsLocalizationKey];
}

id objc_msgSend_requestAdditionalTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestAdditionalTextLocalizationKey];
}

id objc_msgSend_requestEntitlementTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestEntitlementTitleTextLocalizationKey];
}

id objc_msgSend_requestFullTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestFullTitleTextLocalizationKey];
}

id objc_msgSend_requestLimitedTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestLimitedTitleTextLocalizationKey];
}

id objc_msgSend_requestNotificationExtensionTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestNotificationExtensionTextLocalizationKey];
}

id objc_msgSend_requestTitleTextAfterV2UpgradeLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestTitleTextAfterV2UpgradeLocalizationKey];
}

id objc_msgSend_requestTitleTextForSubsequentRequestsKey(void *a1, const char *a2, ...)
{
  return [a1 requestTitleTextForSubsequentRequestsKey];
}

id objc_msgSend_requestTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestTitleTextLocalizationKey];
}

id objc_msgSend_requestUpgradeTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 requestUpgradeTitleTextLocalizationKey];
}

id objc_msgSend_requestingProcess(void *a1, const char *a2, ...)
{
  return [a1 requestingProcess];
}

id objc_msgSend_resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy(void *a1, const char *a2, ...)
{
  return [a1 resetDatabaseFlagsForRecordsRemovedFromPreviousPolicy];
}

id objc_msgSend_resetStandardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 resetStandardUserDefaults];
}

id objc_msgSend_responsiblePID(void *a1, const char *a2, ...)
{
  return [a1 responsiblePID];
}

id objc_msgSend_responsiblePath(void *a1, const char *a2, ...)
{
  return [a1 responsiblePath];
}

id objc_msgSend_responsibleProcess(void *a1, const char *a2, ...)
{
  return [a1 responsibleProcess];
}

id objc_msgSend_retryBlock(void *a1, const char *a2, ...)
{
  return [a1 retryBlock];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_retryIntervalSecs(void *a1, const char *a2, ...)
{
  return [a1 retryIntervalSecs];
}

id objc_msgSend_retryTestMaxRetry(void *a1, const char *a2, ...)
{
  return [a1 retryTestMaxRetry];
}

id objc_msgSend_right(void *a1, const char *a2, ...)
{
  return [a1 right];
}

id objc_msgSend_rightDescription(void *a1, const char *a2, ...)
{
  return [a1 rightDescription];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sandboxOperationForDelegation(void *a1, const char *a2, ...)
{
  return [a1 sandboxOperationForDelegation];
}

id objc_msgSend_saveExpiredEntries(void *a1, const char *a2, ...)
{
  return [a1 saveExpiredEntries];
}

id objc_msgSend_saveKeysToDirectory(void *a1, const char *a2, ...)
{
  return [a1 saveKeysToDirectory];
}

id objc_msgSend_secondaryUsageDescriptionKeyName(void *a1, const char *a2, ...)
{
  return [a1 secondaryUsageDescriptionKeyName];
}

id objc_msgSend_sentMessageSemaphore(void *a1, const char *a2, ...)
{
  return [a1 sentMessageSemaphore];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceAll(void *a1, const char *a2, ...)
{
  return [a1 serviceAll];
}

id objc_msgSend_serviceBundleMap(void *a1, const char *a2, ...)
{
  return [a1 serviceBundleMap];
}

id objc_msgSend_serviceCooldown(void *a1, const char *a2, ...)
{
  return [a1 serviceCooldown];
}

id objc_msgSend_serviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 serviceIdentifier];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceObject(void *a1, const char *a2, ...)
{
  return [a1 serviceObject];
}

id objc_msgSend_servicePolicyAction(void *a1, const char *a2, ...)
{
  return [a1 servicePolicyAction];
}

id objc_msgSend_servicePolicyActionDescription(void *a1, const char *a2, ...)
{
  return [a1 servicePolicyActionDescription];
}

id objc_msgSend_servicePolicyActionKeyName(void *a1, const char *a2, ...)
{
  return [a1 servicePolicyActionKeyName];
}

id objc_msgSend_servicesByName(void *a1, const char *a2, ...)
{
  return [a1 servicesByName];
}

id objc_msgSend_sessionPendingConfirmationSyncChanges(void *a1, const char *a2, ...)
{
  return [a1 sessionPendingConfirmationSyncChanges];
}

id objc_msgSend_sessionPerMessageTimeoutSecs(void *a1, const char *a2, ...)
{
  return [a1 sessionPerMessageTimeoutSecs];
}

id objc_msgSend_sessionPidAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 sessionPidAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_sessionShouldCancelWhenActive(void *a1, const char *a2, ...)
{
  return [a1 sessionShouldCancelWhenActive];
}

id objc_msgSend_sessionSyncChanges(void *a1, const char *a2, ...)
{
  return [a1 sessionSyncChanges];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setHasChangesAvailable(void *a1, const char *a2, ...)
{
  return [a1 setHasChangesAvailable];
}

id objc_msgSend_setNeedsResetSync(void *a1, const char *a2, ...)
{
  return [a1 setNeedsResetSync];
}

id objc_msgSend_settingsRequestFullTitleTextLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 settingsRequestFullTitleTextLocalizationKey];
}

id objc_msgSend_setupDB(void *a1, const char *a2, ...)
{
  return [a1 setupDB];
}

id objc_msgSend_setupTemporaryDirectories(void *a1, const char *a2, ...)
{
  return [a1 setupTemporaryDirectories];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return [a1 sharedGuard];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMessageControllerForCurrentPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedMessageControllerForCurrentPlatform];
}

id objc_msgSend_sharedPublisher(void *a1, const char *a2, ...)
{
  return [a1 sharedPublisher];
}

id objc_msgSend_sharedSyncController(void *a1, const char *a2, ...)
{
  return [a1 sharedSyncController];
}

id objc_msgSend_shouldAllowUnrestrictedCheckAuditToken(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowUnrestrictedCheckAuditToken];
}

id objc_msgSend_shouldIssueSandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 shouldIssueSandboxExtension];
}

id objc_msgSend_shouldTreatAsDeprecated(void *a1, const char *a2, ...)
{
  return [a1 shouldTreatAsDeprecated];
}

id objc_msgSend_shouldUseADefaultDescriptionString(void *a1, const char *a2, ...)
{
  return [a1 shouldUseADefaultDescriptionString];
}

id objc_msgSend_spiVersion(void *a1, const char *a2, ...)
{
  return [a1 spiVersion];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateDirectory(void *a1, const char *a2, ...)
{
  return [a1 stateDirectory];
}

id objc_msgSend_stateDump(void *a1, const char *a2, ...)
{
  return [a1 stateDump];
}

id objc_msgSend_stateDumpDictionary(void *a1, const char *a2, ...)
{
  return [a1 stateDumpDictionary];
}

id objc_msgSend_stringFromBacktrace(void *a1, const char *a2, ...)
{
  return [a1 stringFromBacktrace];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subjectIdentifier(void *a1, const char *a2, ...)
{
  return [a1 subjectIdentifier];
}

id objc_msgSend_subjectIdentity(void *a1, const char *a2, ...)
{
  return [a1 subjectIdentity];
}

id objc_msgSend_subsequentRequestAllowAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 subsequentRequestAllowAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_subsequentRequestDenyAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 subsequentRequestDenyAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey(void *a1, const char *a2, ...)
{
  return [a1 subsequentRequestLimitedAuthorizationButtonTitleLocalizationKey];
}

id objc_msgSend_subsequentRequestStringsRelatedService(void *a1, const char *a2, ...)
{
  return [a1 subsequentRequestStringsRelatedService];
}

id objc_msgSend_supportsStagedPrompting(void *a1, const char *a2, ...)
{
  return [a1 supportsStagedPrompting];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_syServiceClass(void *a1, const char *a2, ...)
{
  return [a1 syServiceClass];
}

id objc_msgSend_syncChangeType(void *a1, const char *a2, ...)
{
  return [a1 syncChangeType];
}

id objc_msgSend_syncController(void *a1, const char *a2, ...)
{
  return [a1 syncController];
}

id objc_msgSend_syncControllerQueue(void *a1, const char *a2, ...)
{
  return [a1 syncControllerQueue];
}

id objc_msgSend_syncCoordinator(void *a1, const char *a2, ...)
{
  return [a1 syncCoordinator];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncId(void *a1, const char *a2, ...)
{
  return [a1 syncId];
}

id objc_msgSend_syncRequestAccessAction(void *a1, const char *a2, ...)
{
  return [a1 syncRequestAccessAction];
}

id objc_msgSend_syncService(void *a1, const char *a2, ...)
{
  return [a1 syncService];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncSessionsQueue(void *a1, const char *a2, ...)
{
  return [a1 syncSessionsQueue];
}

id objc_msgSend_syncTransaction(void *a1, const char *a2, ...)
{
  return [a1 syncTransaction];
}

id objc_msgSend_systemCooldown(void *a1, const char *a2, ...)
{
  return [a1 systemCooldown];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetIsInProximity(void *a1, const char *a2, ...)
{
  return [a1 targetIsInProximity];
}

id objc_msgSend_targetPID(void *a1, const char *a2, ...)
{
  return [a1 targetPID];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_testDoComposition(void *a1, const char *a2, ...)
{
  return [a1 testDoComposition];
}

id objc_msgSend_testMainResetSync(void *a1, const char *a2, ...)
{
  return [a1 testMainResetSync];
}

id objc_msgSend_testMemoryPressureCritical(void *a1, const char *a2, ...)
{
  return [a1 testMemoryPressureCritical];
}

id objc_msgSend_testSyncStatus(void *a1, const char *a2, ...)
{
  return [a1 testSyncStatus];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unusedIndirectObject(void *a1, const char *a2, ...)
{
  return [a1 unusedIndirectObject];
}

id objc_msgSend_updateAccessActionStatus(void *a1, const char *a2, ...)
{
  return [a1 updateAccessActionStatus];
}

id objc_msgSend_updateDatabase(void *a1, const char *a2, ...)
{
  return [a1 updateDatabase];
}

id objc_msgSend_upgradeV1AuthorizationValue(void *a1, const char *a2, ...)
{
  return [a1 upgradeV1AuthorizationValue];
}

id objc_msgSend_usageDescriptionKeyName(void *a1, const char *a2, ...)
{
  return [a1 usageDescriptionKeyName];
}

id objc_msgSend_userHomeDirectory(void *a1, const char *a2, ...)
{
  return [a1 userHomeDirectory];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return [a1 userType];
}

id objc_msgSend_usesTwoStagePrompting(void *a1, const char *a2, ...)
{
  return [a1 usesTwoStagePrompting];
}

id objc_msgSend_v1AuthorizationUpgrade(void *a1, const char *a2, ...)
{
  return [a1 v1AuthorizationUpgrade];
}

id objc_msgSend_v1AuthorizationValue(void *a1, const char *a2, ...)
{
  return [a1 v1AuthorizationValue];
}

id objc_msgSend_validOnPlatformNames(void *a1, const char *a2, ...)
{
  return [a1 validOnPlatformNames];
}

id objc_msgSend_verifierData(void *a1, const char *a2, ...)
{
  return [a1 verifierData];
}

id objc_msgSend_verifierDescription(void *a1, const char *a2, ...)
{
  return [a1 verifierDescription];
}

id objc_msgSend_verifierType(void *a1, const char *a2, ...)
{
  return [a1 verifierType];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_versionNumber(void *a1, const char *a2, ...)
{
  return [a1 versionNumber];
}

id objc_msgSend_waitingForACXResync(void *a1, const char *a2, ...)
{
  return [a1 waitingForACXResync];
}

id objc_msgSend_watchInitiatedPrompt(void *a1, const char *a2, ...)
{
  return [a1 watchInitiatedPrompt];
}

id objc_msgSend_watchPlistChanges(void *a1, const char *a2, ...)
{
  return [a1 watchPlistChanges];
}

id objc_msgSend_watchedFileVnodeSource(void *a1, const char *a2, ...)
{
  return [a1 watchedFileVnodeSource];
}

id objc_msgSend_watchedPath(void *a1, const char *a2, ...)
{
  return [a1 watchedPath];
}

id objc_msgSend_willShutdown(void *a1, const char *a2, ...)
{
  return [a1 willShutdown];
}

id objc_msgSend_xpcObject(void *a1, const char *a2, ...)
{
  return [a1 xpcObject];
}