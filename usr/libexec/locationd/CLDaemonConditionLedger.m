@interface CLDaemonConditionLedger
- (BOOL)canAddToMonitor;
- (BOOL)isMonitoring;
- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3;
- (BOOL)shouldMigrate;
- (CLClientKeyPath)ckp;
- (CLDaemonConditionLedger)initWithConfiguration:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 hasClassCAccess:(BOOL)a7 callbackHandler:(id)a8;
- (id)callbackHandler;
- (id)containerURLForClientWithClientKey:(id)a3;
- (void)addMonitoringRecord:(id)a3 forIdentifier:(id)a4;
- (void)adjustMonitoringAccordingToClientLedgerDictionary:(id)a3;
- (void)dealloc;
- (void)performMigration;
- (void)refillAwaitingMonitoringConditions:(id)a3;
- (void)removeConditionsWithIdentifiers:(id)a3;
- (void)setCallbackHandler:(id)a3;
- (void)setCkp:(id)a3;
- (void)stopMonitoringAllConditions;
- (void)updateAuthorizationContext:(id)a3;
- (void)updateCallbackHandler:(id)a3;
- (void)updateClientEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateDaemonEvent:(id)a3 forIdentifier:(id)a4;
- (void)updateRecord:(id)a3 identifier:(id)a4;
- (void)validateClientMonitoringRecordsByIdenitifier:(id)a3;
@end

@implementation CLDaemonConditionLedger

- (CLDaemonConditionLedger)initWithConfiguration:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 hasClassCAccess:(BOOL)a7 callbackHandler:(id)a8
{
  if (a7)
  {
    self->_universe = (CLIntersiloUniverse *)a6;
    self->_authContext = (CLClientManagerAuthorizationContext *)a5;
    [(CLDaemonConditionLedger *)self setCallbackHandler:a8];
    [(CLDaemonConditionLedger *)self setCkp:a4];
    id v12 = -[CLDaemonConditionLedger containerURLForClientWithClientKey:](self, "containerURLForClientWithClientKey:", [a4 legacyClientKey]);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Path of the container\", \"containerURL\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v14 = +[NSMutableDictionary dictionaryWithDictionary:a3];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", [v12 path], @"kCLMonitorLedgerPathKey");
    v17.receiver = self;
    v17.super_class = (Class)CLDaemonConditionLedger;
    return [(CLConditionLedger *)&v17 initWithStoreType:1 domain:1 monitorConfiguration:v14];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    v16 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor daemon ledger file is not accessible before first unlock, bailing out early\"}", buf, 0x12u);
    }

    return 0;
  }
}

- (void)dealloc
{
  if (![(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] count])[(CLConditionLedger *)self deleteLedgerFile]; {
  sandbox_extension_release();
  }
  self->_containerExtensionHandle = -1;
  self->_universe = 0;

  self->_ckp = 0;
  self->_authContext = 0;
  [(CLDaemonConditionLedger *)self setCallbackHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonConditionLedger;
  [(CLConditionLedger *)&v3 dealloc];
}

- (void)performMigration
{
  sub_1000E1294((uint64_t *)v19, (uint64_t)[+[NSString stringWithFormat:@"MonitorMigraiton:%@::%@", [(CLClientKeyPath *)[(CLDaemonConditionLedger *)self ckp] description], [(CLConditionLedger *)self ledgerName]] UTF8String], 0);
  if ([(CLDaemonConditionLedger *)self shouldMigrate])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    objc_super v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(CLDaemonConditionLedger *)self ckp];
      v5 = [(CLConditionLedger *)self ledgerName];
      unsigned int v6 = [(NSNumber *)[(CLConditionLedger *)self ledgerVersionNumber] intValue];
      uint64_t buf = 68290050;
      __int16 v22 = 2082;
      id v23 = "";
      __int16 v24 = 2114;
      v25 = v4;
      __int16 v26 = 2114;
      v27 = v5;
      __int16 v28 = 1026;
      unsigned int v29 = v6;
      __int16 v30 = 1026;
      int v31 = 1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Migrating daemon ledger\", \"clientKey\":%{public, location:escape_only}@, \"ledger\":%{public, location:escape_only}@, \"ledgerExistingVersion\":%{public}d, \"newVersionToMigrateTo\":%{public}d}", (uint8_t *)&buf, 0x32u);
    }
    v7 = +[NSDictionary dictionaryWithDictionary:[(CLConditionLedger *)self allMonitoringRecordsByIdentifier]];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(CLClientKeyPath **)(*((void *)&v15 + 1) + 8 * (void)v10);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
          id v12 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] objectForKeyedSubscript:v11];
            uint64_t buf = 68289539;
            __int16 v22 = 2082;
            id v23 = "";
            __int16 v24 = 2114;
            v25 = v11;
            __int16 v26 = 2113;
            v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor removing condition due to migration\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
          }
          [(CLDaemonConditionLedger *)self removeRecordFromMonitoringWithIdentifier:v11];
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }
    if ([(NSArray *)[(CLConditionLedger *)self allMonitoringIdentifiers] count])
    {
      sub_101A892C0();
      abort_report_np();
      __break(1u);
    }
    v14.receiver = self;
    v14.super_class = (Class)CLDaemonConditionLedger;
    [(CLConditionLedger *)&v14 setLedgerVersionNumber:1];
  }
  sub_1000E1098(v19);
}

- (BOOL)shouldMigrate
{
  return [(NSNumber *)[(CLConditionLedger *)self ledgerVersionNumber] intValue] < 1;
}

- (id)containerURLForClientWithClientKey:(id)a3
{
  v5 = (std::string *)sub_100134750(buf, (char *)[a3 UTF8String]);
  sub_10000FF54(v5, (uint64_t)v58);
  if (SBYTE3(v76) < 0) {
    operator delete(*(void **)buf);
  }
  sub_100052DDC((uint64_t)v58, (uint64_t)v56);
  sub_100103240();
  if (!sub_1000F08D4() || (sub_100103240(), sub_10073AAE4()))
  {
    if (!container_query_create())
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022F0728);
      }
      v7 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        id v8 = (NSURL *)[a3 UTF8String];
        *(void *)uint64_t buf = 68289282;
        __int16 v73 = 2082;
        v74 = "";
        __int16 v75 = 2082;
        v76 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to create query\", \"clientKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
      }
      uint64_t v9 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        v10 = (NSURL *)[a3 UTF8String];
        *(void *)uint64_t buf = 68289282;
        __int16 v73 = 2082;
        v74 = "";
        __int16 v75 = 2082;
        v76 = v10;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to create query", "{\"msg%{public}.0s\":\"#monitor unable to create query\", \"clientKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
      v11 = 0;
      goto LABEL_87;
    }
    if (v57 < 0)
    {
      if (v56[1])
      {
        unsigned int v6 = (void **)v56[0];
LABEL_22:
        long long v16 = +[NSString stringWithUTF8String:v6];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
        long long v17 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(void *)uint64_t buf = 68289282;
          __int16 v73 = 2082;
          v74 = "";
          __int16 v75 = 2114;
          v76 = (NSURL *)v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor platform bundleID is found\", \"platformBundleID\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        if (v16)
        {
          sub_100103240();
          if (!sub_1000F08D4())
          {
            xpc_object_t v38 = xpc_string_create([(NSString *)v16 UTF8String]);
            container_query_set_identifiers();
            xpc_release(v38);
            container_query_set_class();
            int v18 = 0;
            objc_super v14 = 0;
LABEL_33:
            container_query_operation_set_flags();
            container_query_set_persona_unique_string();
            if ((v18 & 1) == 0)
            {
              sub_100103240();
              if ((sub_1000F08D4() & 1) == 0)
              {
                xpc_object_t v19 = xpc_string_create([(NSString *)v16 UTF8String]);
                container_query_set_identifiers();
                xpc_release(v19);
              }
            }
            if (!container_query_get_single_result())
            {
              container_query_get_last_error();
              __int16 v30 = (NSURL *)container_error_copy_unlocalized_description();
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1022F0728);
              }
              int v31 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
              {
                *(void *)uint64_t buf = 68289282;
                __int16 v73 = 2082;
                v74 = "";
                __int16 v75 = 2082;
                v76 = v30;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Error executing query for container\", \"error\":%{public, location:escape_only}s}", buf, 0x1Cu);
                if (qword_102419530 != -1) {
                  dispatch_once(&qword_102419530, &stru_1022F0728);
                }
              }
              v32 = qword_102419538;
              if (os_signpost_enabled((os_log_t)qword_102419538))
              {
                *(void *)uint64_t buf = 68289282;
                __int16 v73 = 2082;
                v74 = "";
                __int16 v75 = 2082;
                v76 = v30;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Error executing query for container", "{\"msg%{public}.0s\":\"#monitor Error executing query for container\", \"error\":%{public, location:escape_only}s}", buf, 0x1Cu);
              }
              free(v30);
              v11 = 0;
              goto LABEL_87;
            }
            __int16 v20 = +[NSMutableString stringWithCString:container_get_path() encoding:4];
            v21 = v20;
            if (v18) {
              [(NSMutableString *)v20 appendFormat:@"/%@/", v14];
            }
            v11 = +[NSURL fileURLWithPath:v21 isDirectory:1];
            __int16 v22 = (void *)container_copy_sandbox_token();
            if (!v22)
            {
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1022F0728);
              }
              v37 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
              {
                *(void *)uint64_t buf = 68289026;
                __int16 v73 = 2082;
                v74 = "";
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to get sandbox extension from container\"}", buf, 0x12u);
              }
              goto LABEL_87;
            }
            int64_t v23 = sandbox_extension_consume();
            free(v22);
            if (v23 < 0)
            {
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1022F0728);
              }
              v39 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
              {
                int v40 = *__error();
                *(void *)uint64_t buf = 68289282;
                __int16 v73 = 2082;
                v74 = "";
                __int16 v75 = 1026;
                LODWORD(v76) = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Error consuming extension for container\", \"errno\":%{public}d}", buf, 0x18u);
                if (qword_102419530 != -1) {
                  dispatch_once(&qword_102419530, &stru_1022F0728);
                }
              }
              uint64_t v41 = qword_102419538;
              if (!os_signpost_enabled((os_log_t)qword_102419538)) {
                goto LABEL_87;
              }
              int v42 = *__error();
              *(void *)uint64_t buf = 68289282;
              __int16 v73 = 2082;
              v74 = "";
              __int16 v75 = 1026;
              LODWORD(v76) = v42;
              __int16 v26 = "#monitor Error consuming extension for container";
              v27 = "{\"msg%{public}.0s\":\"#monitor Error consuming extension for container\", \"errno\":%{public}d}";
              __int16 v28 = v41;
              uint32_t v29 = 24;
LABEL_86:
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v26, v27, buf, v29);
              goto LABEL_87;
            }
            self->_containerExtensionHandle = v23;
LABEL_42:
            v52.receiver = self;
            v52.super_class = (Class)CLDaemonConditionLedger;
            if ([(CLConditionLedger *)&v52 directoryExists:v11])
            {
LABEL_87:
              container_query_free();
              goto LABEL_88;
            }
            objc_super v14 = (NSString *)&qword_102419000;
            if (qword_102419530 == -1) {
              goto LABEL_44;
            }
            goto LABEL_147;
          }
          int v18 = 0;
          goto LABEL_31;
        }
LABEL_30:
        int v18 = 1;
LABEL_31:
        objc_super v14 = sub_100C8A4B4((uint64_t)v58);
        if (v14)
        {
          container_query_set_class();
          goto LABEL_33;
        }
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
        v11 = (NSURL *)&qword_102419000;
        v44 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          objc_super v14 = __p;
          sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
          if (v54 >= 0) {
            v45 = __p;
          }
          else {
            v45 = (void **)__p[0];
          }
          *(void *)uint64_t buf = 68289795;
          __int16 v73 = 2082;
          v74 = "";
          __int16 v75 = 2082;
          v76 = (NSURL *)v45;
          __int16 v77 = 2082;
          v78 = "assert";
          __int16 v79 = 2081;
          v80 = "subPath";
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
          if (v54 < 0) {
            operator delete(__p[0]);
          }
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
        }
        v46 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          objc_super v14 = __p;
          sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
          if (v54 >= 0) {
            v47 = __p;
          }
          else {
            v47 = (void **)__p[0];
          }
          *(void *)uint64_t buf = 68289795;
          __int16 v73 = 2082;
          v74 = "";
          __int16 v75 = 2082;
          v76 = (NSURL *)v47;
          __int16 v77 = 2082;
          v78 = "assert";
          __int16 v79 = 2081;
          v80 = "subPath";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to get identifiable name from client key", "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
          if (v54 < 0) {
            operator delete(__p[0]);
          }
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
        }
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
        {
          sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
          sub_101A89488();
        }
LABEL_146:
        abort_report_np();
        __break(1u);
LABEL_147:
        dispatch_once(&qword_102419530, &stru_1022F0728);
LABEL_44:
        __int16 v24 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          *(void *)uint64_t buf = 68289282;
          __int16 v73 = 2082;
          v74 = "";
          __int16 v75 = 2114;
          v76 = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor directory doesn't exist\", \"contrainerURL\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (v14[166] != (NSString)-1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
        }
        uint64_t v25 = qword_102419538;
        if (!os_signpost_enabled((os_log_t)qword_102419538)) {
          goto LABEL_87;
        }
        *(void *)uint64_t buf = 68289282;
        __int16 v73 = 2082;
        v74 = "";
        __int16 v75 = 2114;
        v76 = v11;
        __int16 v26 = "#monitor directory doesn't exist";
        v27 = "{\"msg%{public}.0s\":\"#monitor directory doesn't exist\", \"contrainerURL\":%{public, location:escape_only}@}";
        __int16 v28 = v25;
        uint32_t v29 = 28;
        goto LABEL_86;
      }
    }
    else if (v57)
    {
      unsigned int v6 = v56;
      goto LABEL_22;
    }
    long long v16 = 0;
    goto LABEL_30;
  }
  id v12 = +[NSMutableString stringWithString:@"/var/db/locationd/CLDaemonMonitor/"];
  v13 = sub_100C8A198((uint64_t)v12);
  v55.receiver = self;
  v55.super_class = (Class)CLDaemonConditionLedger;
  objc_super v14 = (NSString *)"directoryExists:";
  if ([(CLConditionLedger *)&v55 directoryExists:v13])
  {
    long long v15 = sub_100C8A4B4((uint64_t)v58);
    if (v15)
    {
      [(NSMutableString *)v12 appendString:+[NSString stringWithFormat:@"%@/", v15]];
      v11 = sub_100C8A198((uint64_t)v12);
      goto LABEL_42;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    v11 = (NSURL *)&qword_102419000;
    v48 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      objc_super v14 = __p;
      sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
      if (v54 >= 0) {
        v49 = __p;
      }
      else {
        v49 = (void **)__p[0];
      }
      *(void *)uint64_t buf = 68289795;
      __int16 v73 = 2082;
      v74 = "";
      __int16 v75 = 2082;
      v76 = (NSURL *)v49;
      __int16 v77 = 2082;
      v78 = "assert";
      __int16 v79 = 2081;
      v80 = "subPath";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (v54 < 0) {
        operator delete(__p[0]);
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022F0728);
      }
    }
    v50 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      objc_super v14 = __p;
      sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
      if (v54 >= 0) {
        v51 = __p;
      }
      else {
        v51 = (void **)__p[0];
      }
      *(void *)uint64_t buf = 68289795;
      __int16 v73 = 2082;
      v74 = "";
      __int16 v75 = 2082;
      v76 = (NSURL *)v51;
      __int16 v77 = 2082;
      v78 = "assert";
      __int16 v79 = 2081;
      v80 = "subPath";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to get identifiable name from client key", "{\"msg%{public}.0s\":\"#monitor unable to get identifiable name from client key\", \"name\":%{public, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (v54 < 0) {
        operator delete(__p[0]);
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022F0728);
      }
    }
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
      sub_101A89488();
    }
    goto LABEL_146;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F0728);
  }
  v33 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
  {
    sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
    if (v54 >= 0) {
      v34 = __p;
    }
    else {
      v34 = (void **)__p[0];
    }
    *(void *)uint64_t buf = 68289282;
    __int16 v73 = 2082;
    v74 = "";
    __int16 v75 = 2082;
    v76 = (NSURL *)v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to create directory to store daemon ledger in locationd path\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v54 < 0) {
      operator delete(__p[0]);
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
  }
  v35 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    sub_1000A7FBC((uint64_t)v58, (uint64_t)__p);
    v36 = v54 >= 0 ? __p : (void **)__p[0];
    *(void *)uint64_t buf = 68289282;
    __int16 v73 = 2082;
    v74 = "";
    __int16 v75 = 2082;
    v76 = (NSURL *)v36;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to create directory to store daemon ledger in locationd path", "{\"msg%{public}.0s\":\"#monitor unable to create directory to store daemon ledger in locationd path\", \"name\":%{public, location:escape_only}s}", buf, 0x1Cu);
    if (v54 < 0) {
      operator delete(__p[0]);
    }
  }
  v11 = 0;
LABEL_88:
  if (v57 < 0) {
    operator delete(v56[0]);
  }
  if (v71 < 0) {
    operator delete(v70);
  }
  if (v69 < 0) {
    operator delete(v68);
  }
  if (v67 < 0) {
    operator delete(v66);
  }
  if (v65 < 0) {
    operator delete(v64);
  }
  if (v63 < 0) {
    operator delete(v62);
  }
  if (v61 < 0) {
    operator delete(v60);
  }
  if (v59 < 0) {
    operator delete(v58[0]);
  }
  return v11;
}

- (BOOL)isMonitoring
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] allValues];
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) isMonitoring])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (void)validateClientMonitoringRecordsByIdenitifier:(id)a3
{
  sub_1000E1294((uint64_t *)v36, (uint64_t)[+[NSString stringWithFormat:@"Monitor:%@:%@::validateClientMonitoringRecords", [(CLDaemonConditionLedger *)self ckp], [(CLConditionLedger *)self ledgerName]] UTF8String], 0);
  if (a3)
  {
    uint64_t v5 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [a3 allKeys]);
    unsigned int v6 = +[NSMutableSet setWithArray:[(CLConditionLedger *)self allMonitoringIdentifiers]];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(NSMutableSet *)v5 count];
      NSUInteger v9 = [(NSArray *)[(CLConditionLedger *)self allMonitoringIdentifiers] count];
      *(_DWORD *)uint64_t buf = 68289538;
      int v39 = 0;
      __int16 v40 = 2082;
      uint64_t v41 = "";
      __int16 v42 = 2050;
      id v43 = v8;
      __int16 v44 = 2050;
      NSUInteger v45 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor client has monitoring records\", \"clientCount\":%{public}ld, \"daemonCount\":%{public}ld}", buf, 0x26u);
    }
    [(NSMutableSet *)v6 minusSet:v5];
    [(NSMutableSet *)v5 unionSet:+[NSSet setWithArray:[(CLConditionLedger *)self allMonitoringIdentifiers]]];
    [(NSMutableSet *)v5 minusSet:v6];
    id v10 = +[NSMutableDictionary dictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v5);
          }
          [v10 setObject:objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * i)) forKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        }
        id v11 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v11);
    }
    [(CLDaemonConditionLedger *)self removeConditionsWithIdentifiers:v6];
    [(CLDaemonConditionLedger *)self adjustMonitoringAccordingToClientLedgerDictionary:v10];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022F0728);
    }
    objc_super v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v39 = 0;
      __int16 v40 = 2082;
      uint64_t v41 = "";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor reiniting all monitored conditions\"}", buf, 0x12u);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v15 = [(CLConditionLedger *)self allMonitoringIdentifiers];
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v16)
    {
      uint64_t v24 = *(void *)v33;
      do
      {
        id v25 = v16;
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v15);
          }
          int v18 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          xpc_object_t v19 = [[CLDaemonMonitoringRecord alloc] initWithClientMonitoringRecord:[(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] objectForKeyedSubscript:v18] clientKeyPath:[(CLDaemonConditionLedger *)self ckp] authorizationContext:self->_authContext universe:self->_universe identifier:+[NSString stringWithFormat:@"%@:%@", [(CLClientKeyPath *)[(CLDaemonConditionLedger *)self ckp] clientKey], [(CLConditionLedger *)self ledgerName]] initForStopMonitoring:0 callbackHandler:[(CLDaemonConditionLedger *)self callbackHandler]];
          v31.receiver = self;
          v31.super_class = (Class)CLDaemonConditionLedger;
          [(CLConditionLedger *)&v31 updateRecord:v19 identifier:v18];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
          __int16 v20 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v18 UTF8String];
            *(_DWORD *)uint64_t buf = 68289539;
            int v39 = 0;
            __int16 v40 = 2082;
            uint64_t v41 = "";
            __int16 v42 = 2082;
            id v43 = v21;
            __int16 v44 = 2113;
            NSUInteger v45 = (NSUInteger)v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor reinited record\", \"identifier\":%{public, location:escape_only}s, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
          }
        }
        id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v16);
    }
    v30.receiver = self;
    v30.super_class = (Class)CLDaemonConditionLedger;
    if (![(CLConditionLedger *)&v30 writeToFile])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022F0728);
      }
      __int16 v22 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v39 = 0;
        __int16 v40 = 2082;
        uint64_t v41 = "";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning reinited conditions failed to write to disk\"}", buf, 0x12u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
      }
      int64_t v23 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v39 = 0;
        __int16 v40 = 2082;
        uint64_t v41 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor #Warning reinited conditions failed to write to disk", "{\"msg%{public}.0s\":\"#monitor #Warning reinited conditions failed to write to disk\"}", buf, 0x12u);
      }
    }
  }
  sub_1000E1098(v36);
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonConditionLedger;
  [(CLConditionLedger *)&v4 updateRecord:a3 identifier:a4];
}

- (void)updateAuthorizationContext:(id)a3
{
  self->_authContext = (CLClientManagerAuthorizationContext *)a3;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F0728);
  }
  uint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    [a3 registrationResult];
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    id v8 = "";
    __int16 v9 = 2050;
    uint64_t v10 = [a3 registrationResult];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor updateAuthContext change\", \"RegistrationResult\":%{public, location:CLClientRegistrationResult}lld}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)updateCallbackHandler:(id)a3
{
  [(CLDaemonConditionLedger *)self setCallbackHandler:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C8B000;
  v4[3] = &unk_1022F06C8;
  v4[4] = self;
  [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)stopMonitoringAllConditions
{
  v2 = [(CLConditionLedger *)self allMonitoringRecordsByIdentifier];

  [(NSDictionary *)v2 enumerateKeysAndObjectsUsingBlock:&stru_1022F0708];
}

- (void)removeConditionsWithIdentifiers:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 68289282;
    long long v13 = v6;
    do
    {
      __int16 v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        -[CLDaemonConditionLedger removeRecordFromMonitoringWithIdentifier:](self, "removeRecordFromMonitoringWithIdentifier:", v10, v13);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
        id v11 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v10 UTF8String];
          *(_DWORD *)uint64_t buf = v13;
          int v19 = 0;
          __int16 v20 = 2082;
          id v21 = "";
          __int16 v22 = 2082;
          id v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove condition\", \"identifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
        __int16 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v7);
  }
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLDaemonConditionLedger;
  BOOL v4 = -[CLConditionLedger removeRecordFromMonitoringWithIdentifier:](&v7, "removeRecordFromMonitoringWithIdentifier:");
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F0728);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v9 = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2114;
    id v13 = a3;
    __int16 v14 = 1026;
    BOOL v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor remove record with identifier from monitoring \", \"identifier\":%{public, location:escape_only}@, \"removeStatus\":%{public}hhd}", buf, 0x22u);
  }
  return v4;
}

- (void)addMonitoringRecord:(id)a3 forIdentifier:(id)a4
{
  id v7 = [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] objectForKeyedSubscript:a4];
  if (!v7
    || (objc_msgSend(objc_msgSend(v7, "clientCondition"), "isEqual:", objc_msgSend(a3, "condition")) & 1) == 0)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@:%@", [(CLClientKeyPath *)[(CLDaemonConditionLedger *)self ckp] clientKey], [(CLConditionLedger *)self ledgerName]];
    if ([(CLDaemonConditionLedger *)self canAddToMonitor])
    {
      int v9 = [[CLDaemonMonitoringRecord alloc] initWithClientMonitoringRecord:a3 clientKeyPath:[(CLDaemonConditionLedger *)self ckp] authorizationContext:self->_authContext universe:self->_universe identifier:v8 initForStopMonitoring:0 callbackHandler:[(CLDaemonConditionLedger *)self callbackHandler]];
      v13.receiver = self;
      v13.super_class = (Class)CLDaemonConditionLedger;
      if (![(CLConditionLedger *)&v13 addRecordForMonitoring:v9 identifier:a4 persist:1])[(CLDaemonMonitoringRecord *)v9 setPersistenceUnavailable:1]; {
      if (qword_102419530 != -1)
      }
        dispatch_once(&qword_102419530, &stru_1022F0728);
      __int16 v10 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289539;
        int v16 = 0;
        __int16 v17 = 2082;
        int v18 = "";
        __int16 v19 = 2114;
        __int16 v20 = (NSString *)a4;
        __int16 v21 = 2113;
        __int16 v22 = (CLClientKeyPath *)v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor add record for monitoring\", \"identifier\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x26u);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022F0728);
      }
      id v11 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289795;
        int v16 = 0;
        __int16 v17 = 2082;
        int v18 = "";
        __int16 v19 = 2114;
        __int16 v20 = [(CLConditionLedger *)self ledgerName];
        __int16 v21 = 2114;
        __int16 v22 = [(CLDaemonConditionLedger *)self ckp];
        __int16 v23 = 2113;
        id v24 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #monitor number for monitoring conditions limit reached. Sending unmonitoring state\", \"monitor\":%{public, location:escape_only}@, \"client\":%{public, location:escape_only}@, \"record\":%{private, location:escape_only}@}", buf, 0x30u);
      }
      __int16 v12 = [[CLDaemonMonitoringRecord alloc] initWithClientMonitoringRecord:a3 clientKeyPath:[(CLDaemonConditionLedger *)self ckp] authorizationContext:self->_authContext universe:self->_universe identifier:v8 initForStopMonitoring:1 callbackHandler:0];
      [(CLDaemonMonitoringRecord *)v12 setConditionLimitExceeded:1];
      v14.receiver = self;
      v14.super_class = (Class)CLDaemonConditionLedger;
      [(CLConditionLedger *)&v14 addRecordForMonitoring:v12 identifier:a4 persist:0];
    }
  }
}

- (void)updateClientEvent:(id)a3 forIdentifier:(id)a4
{
  id v6 = [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] objectForKeyedSubscript:a4];
  if (v6)
  {
    id v7 = v6;
    id v8 = [[[v6 clientEvent] state];
    if (v8 != [a3 state]
      || (id v9 = objc_msgSend(objc_msgSend(v7, "clientEvent"), "diagnosticMask"), v9 != objc_msgSend(a3, "diagnosticMask")))
    {
      [v7 updateClientEvent:a3];
      [(CLConditionLedger *)self writeToFile];
    }
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022F0748);
    }
    __int16 v10 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 68289795;
      v11[1] = 0;
      __int16 v12 = 2082;
      objc_super v13 = "";
      __int16 v14 = 2113;
      id v15 = a3;
      __int16 v16 = 2114;
      __int16 v17 = [(CLConditionLedger *)self ledgerName];
      __int16 v18 = 2050;
      __int16 v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor received event from client but record doesn't exist\", \"event\":%{private, location:escape_only}@, \"monitor\":%{public, location:escape_only}@, \"this\":\"%{public}p\"}", (uint8_t *)v11, 0x30u);
    }
  }
}

- (void)updateDaemonEvent:(id)a3 forIdentifier:(id)a4
{
  id v5 = [(NSDictionary *)[(CLConditionLedger *)self allMonitoringRecordsByIdentifier] objectForKeyedSubscript:a4];
  if (v5)
  {
    [v5 updateDaemonEvent:a3];
  }
  else
  {
    if (qword_102419520 != -1) {
      dispatch_once(&qword_102419520, &stru_1022F0748);
    }
    id v6 = qword_102419528;
    if (os_log_type_enabled((os_log_t)qword_102419528, OS_LOG_TYPE_FAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor received daemon event from monitored conditions but record doesn't exist\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
      if (qword_102419520 != -1) {
        dispatch_once(&qword_102419520, &stru_1022F0748);
      }
    }
    id v7 = qword_102419528;
    if (os_signpost_enabled((os_log_t)qword_102419528))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      __int16 v12 = 2113;
      id v13 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor received daemon event from monitored conditions but record doesn't exist", "{\"msg%{public}.0s\":\"#monitor received daemon event from monitored conditions but record doesn't exist\", \"event\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)adjustMonitoringAccordingToClientLedgerDictionary:(id)a3
{
  BOOL v4 = &qword_102419000;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022F0728);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v47 = 0;
    __int16 v48 = 2082;
    v49 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor validate conditions\"}", buf, 0x12u);
  }
  long long v34 = [(CLConditionLedger *)self allMonitoringRecordsByIdentifier];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [a3 allKeys];
  id v36 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v36)
  {
    uint64_t v33 = *(void *)v42;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v9 = [a3 objectForKeyedSubscript:v8];
        if (v4[166] != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
        __int16 v10 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v47 = 0;
          __int16 v48 = 2082;
          v49 = "";
          __int16 v50 = 2113;
          id v51 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor validating client record\", \"clientRecord\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        id v11 = [v9 condition];
        id v12 = [(NSDictionary *)v34 objectForKeyedSubscript:v8];
        if (!v12) {
          goto LABEL_33;
        }
        id v13 = v12;
        id v14 = [v12 condition];
        -[CLDaemonConditionLedger updateClientEvent:forIdentifier:](self, "updateClientEvent:forIdentifier:", [v9 lastEvent], v8);
        unsigned int v15 = [v11 isEqual:v14];
        id v16 = [v13 daemonCondition];
        if (!v15)
        {
          uint64_t v18 = v4[166];
          if (v16)
          {
            if (v18 != -1) {
              dispatch_once(&qword_102419530, &stru_1022F0728);
            }
            __int16 v19 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = [v8 UTF8String];
              *(_DWORD *)uint64_t buf = 68289795;
              int v47 = 0;
              __int16 v48 = 2082;
              v49 = "";
              __int16 v50 = 2082;
              id v51 = v20;
              __int16 v52 = 2113;
              id v53 = v14;
              __int16 v54 = 2113;
              id v55 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor stop monitoring - client condition changed for identifier\", \"identifier\":%{public, location:escape_only}s, \"previous\":%{private, location:escape_only}@, \"current\":%{private, location:escape_only}@}", buf, 0x30u);
            }
            [v13 resetDaemonPartOfCondition];
          }
          else
          {
            if (v18 != -1) {
              dispatch_once(&qword_102419530, &stru_1022F0728);
            }
            __int16 v21 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              id v22 = [v8 UTF8String];
              id v23 = [[objc_msgSend(v13, "recordIdentifier") UTF8String];
              *(_DWORD *)uint64_t buf = 68290051;
              int v47 = 0;
              __int16 v48 = 2082;
              v49 = "";
              __int16 v50 = 2082;
              id v51 = v22;
              __int16 v52 = 2082;
              id v53 = v23;
              __int16 v54 = 2113;
              id v55 = v14;
              __int16 v56 = 2113;
              id v57 = v11;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor need to stop monitoring by init\", \"identifier\":%{public, location:escape_only}s, \"recordIdentifier\":%{public, location:escape_only}s, \"previous\":%{private, location:escape_only}@, \"current\":%{private, location:escape_only}@}", buf, 0x3Au);
            }

            BOOL v4 = &qword_102419000;
          }
          [(CLDaemonConditionLedger *)self removeRecordFromMonitoringWithIdentifier:v8];
LABEL_33:
          [v6 setObject:v9 forKeyedSubscript:v8];
          continue;
        }
        if (!v16)
        {
          [v13 setupDaemonPartOfConditionWithAuthContext:self->_authContext clientKeyPath:-[CLDaemonConditionLedger ckp](self, "ckp") universe:self->_universe identifier:[v13 recordIdentifier] stopMonitoring:0 callbackHandler:-[CLDaemonConditionLedron callbackHandler](self, "callbackHandler")];
          if (v4[166] != -1) {
            dispatch_once(&qword_102419530, &stru_1022F0728);
          }
          __int16 v17 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289283;
            int v47 = 0;
            __int16 v48 = 2082;
            v49 = "";
            __int16 v50 = 2113;
            id v51 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor setup monitoring daemon parts\", \"daemonCondition\":%{private, location:escape_only}@}", buf, 0x1Cu);
          }
        }
      }
      id v36 = [obj countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v36);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = [v6 allKeys];
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      long long v28 = 0;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v28);
        id v30 = [v6 objectForKeyedSubscript:v29];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022F0728);
        }
        objc_super v31 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289283;
          int v47 = 0;
          __int16 v48 = 2082;
          v49 = "";
          __int16 v50 = 2113;
          id v51 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor created daemon record\", \"record\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        [(CLDaemonConditionLedger *)self addMonitoringRecord:v30 forIdentifier:v29];
        long long v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v26);
  }
}

- (BOOL)canAddToMonitor
{
  return [(NSArray *)[(CLConditionLedger *)self allMonitoringIdentifiers] count] < 0x14;
}

- (void)refillAwaitingMonitoringConditions:(id)a3
{
  NSUInteger v5 = [(NSArray *)[(CLConditionLedger *)self allMonitoringIdentifiers] count];
  if (v5 != 20)
  {
    NSUInteger v6 = v5;
    id v7 = +[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", [a3 allKeys]);
    [(NSMutableSet *)v7 minusSet:+[NSMutableSet setWithArray:[(CLConditionLedger *)self allMonitoringIdentifiers]]];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      NSUInteger v10 = 20 - v6;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        -[CLDaemonConditionLedger addMonitoringRecord:forIdentifier:](self, "addMonitoringRecord:forIdentifier:", [a3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v12)], *(void *)(*((void *)&v13 + 1) + 8 * v12));
        if (v10 - 1 == v12) {
          break;
        }
        if (v9 == (id)++v12)
        {
          id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
          v10 -= v12;
          if (v9) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

- (id)callbackHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setCallbackHandler:(id)a3
{
}

- (CLClientKeyPath)ckp
{
  return (CLClientKeyPath *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCkp:(id)a3
{
}

@end