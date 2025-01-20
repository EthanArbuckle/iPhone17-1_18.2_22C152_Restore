@interface Browse_Bonjour
- (BOOL)isOKToAdd:(id)a3;
- (Browse_Bonjour)initWithQueue:(id)a3;
- (void)_browserForServiceType:(id)a3 changedFrom:(id)a4 to:(id)a5 done:(BOOL)a6;
- (void)addResult:(id)a3;
- (void)cancel;
- (void)removeResult:(id)a3;
- (void)start;
@end

@implementation Browse_Bonjour

- (Browse_Bonjour)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Browse_Bonjour;
  v6 = [(Browse_Bonjour *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)start
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  serviceBrowsers = self->_serviceBrowsers;
  self->_serviceBrowsers = v3;

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_default_configuration, _nw_parameters_configure_protocol_default_configuration);
  v6 = [(Browse_Implementation *)self session];
  v7 = [v6 clientBundleIdentifier];

  id v15 = v7;
  if (v7)
  {
    [v7 UTF8String];
    nw_parameters_set_attributed_bundle_identifier();
  }
  nw_parameters_set_account_id();
  objc_initWeak(&location, self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [&off_1000B8F08 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(&off_1000B8F08);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        bonjour_service = nw_browse_descriptor_create_bonjour_service((const char *)[v11 UTF8String], 0);
        nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
        v13 = nw_browser_create(bonjour_service, secure_tcp);
        v14 = v13;
        if (v13)
        {
          nw_browser_set_queue(v13, (dispatch_queue_t)self->_queue);
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_10002E8A4;
          handler[3] = &unk_1000A24A0;
          objc_copyWeak(&v17, &location);
          handler[4] = v11;
          nw_browser_set_browse_results_changed_handler(v14, handler);
          [(NSMutableDictionary *)self->_serviceBrowsers setObject:v14 forKeyedSubscript:v11];
          nw_browser_start(v14);
          objc_destroyWeak(&v17);
        }
      }
      id v8 = [&off_1000B8F08 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }
  objc_destroyWeak(&location);
}

- (void)cancel
{
  v3 = [(NSMutableDictionary *)self->_serviceBrowsers allValues];
  [v3 enumerateObjectsUsingBlock:&stru_1000A24E0];

  serviceBrowsers = self->_serviceBrowsers;
  self->_serviceBrowsers = 0;
}

- (BOOL)isOKToAdd:(id)a3
{
  v3 = nw_browse_result_copy_txt_record_object((nw_browse_result_t)a3);
  if (v3
    && ((+[PKDefaults urfIsOptional] & 1) != 0
     || nw_txt_record_find_key(v3, "URF")))
  {
    v4 = +[PKDefaults requiredPDL];
    id v5 = v4;
    if (v4)
    {
      access_value[0] = _NSConcreteStackBlock;
      access_value[1] = 3221225472;
      access_value[2] = sub_10002EB08;
      access_value[3] = &unk_1000A2508;
      id v9 = v4;
      BOOL v6 = nw_txt_record_access_key(v3, "pdl", access_value);
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 134218242;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CHECK Result <%p> %@", (uint8_t *)&v9, 0x16u);
  }

  if ([(Browse_Bonjour *)self isOKToAdd:v4])
  {
    BOOL v6 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218242;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding <%p> %@", (uint8_t *)&v9, 0x16u);
    }

    v7 = [[BonjourBrowse_Entity alloc] initWithBrowseResult:v4];
    id v8 = [(Browse_Implementation *)self addEntity];
    ((void (**)(void, BonjourBrowse_Entity *))v8)[2](v8, v7);
  }
  else
  {
    _PKLogCategory(PKLogCategoryDiscovery[0]);
    v7 = (BonjourBrowse_Entity *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218242;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "NOT Adding <%p> %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)removeResult:(id)a3
{
  id v4 = a3;
  id v5 = _PKLogCategory(PKLogCategoryDiscovery[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing <%p> %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v6 = [[BonjourBrowse_Entity alloc] initWithBrowseResult:v4];
  v7 = [(Browse_Implementation *)self removeEntity];
  ((void (**)(void, BonjourBrowse_Entity *))v7)[2](v7, v6);
}

- (void)_browserForServiceType:(id)a3 changedFrom:(id)a4 to:(id)a5 done:(BOOL)a6
{
  old_result = a4;
  int v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  char changes = nw_browse_result_get_changes(old_result, v8);
  if ((changes & 1) == 0)
  {
    if ((changes & 2) != 0)
    {
LABEL_5:
      [(Browse_Bonjour *)self addResult:v8];
      goto LABEL_7;
    }
    if ((changes & 4) == 0)
    {
      [(Browse_Bonjour *)self removeResult:old_result];
      goto LABEL_5;
    }
    [(Browse_Bonjour *)self removeResult:old_result];
  }
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBrowsers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end