@interface NESMAppPushSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)active;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (NESMAppPushSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)dealloc;
- (void)didExtensionExit:(id)a3;
- (void)didReceiveStatusChangeWithInterface:(int64_t)a3;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleProviderInstallationStatus:(id)a3 status:(int64_t)a4;
- (void)handleProviderStopped:(id)a3;
- (void)handleSendInfoMessage:(id)a3 withType:(int)a4;
- (void)install;
- (void)installPended;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)plugin:(id)a3 didReceiveIncomingCallWithUserInfo:(id)a4;
- (void)plugin:(id)a3 didReceiveProviderError:(id)a4;
- (void)plugin:(id)a3 didReceiveProviderError:(id)a4 forMessageID:(id)a5;
- (void)plugin:(id)a3 didReceivePushToTalkMessageWithUserInfo:(id)a4;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidDispose:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)uninstall;
@end

@implementation NESMAppPushSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicySession, 0);
  objc_storeStrong((id *)&self->_outgoingMessageCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_plteMatchMonitor, 0);
  objc_storeStrong((id *)&self->_ssidMatchMonitor, 0);

  objc_storeStrong((id *)&self->_providerWakeTimer, 0);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)didReceiveStatusChangeWithInterface:(int64_t)a3
{
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      unint64_t currentPLTEMatchStaus = self->_currentPLTEMatchStaus;
      self;
      if (currentPLTEMatchStaus > 2) {
        CFStringRef v7 = @"unknown";
      }
      else {
        CFStringRef v7 = off_1000C5740[currentPLTEMatchStaus];
      }
    }
    else
    {
      self;
      CFStringRef v7 = @"Invalid";
    }
    self;
    if ((unint64_t)a3 > 2) {
      CFStringRef v8 = @"unknown";
    }
    else {
      CFStringRef v8 = off_1000C5740[a3];
    }
    if (self) {
      unsigned int refCount = self->_refCount;
    }
    else {
      unsigned int refCount = 0;
    }
    int v15 = 138413058;
    v16 = self;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    __int16 v19 = 2112;
    CFStringRef v20 = v8;
    __int16 v21 = 1024;
    unsigned int v22 = refCount;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ private LTE network match status changed from '%@' to '%@' [ref count:%u]", (uint8_t *)&v15, 0x26u);
  }

  if (a3 == 2)
  {
    if (self && self->_currentPLTEMatchStaus == 1)
    {
      --self->_refCount;
      self->_unint64_t currentPLTEMatchStaus = 2;
      sub_10001044C((uint64_t)self);
      sub_10001055C(self, v14);
    }
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    if (self)
    {
      if (self->_currentPLTEMatchStaus == 1)
      {
LABEL_22:
        if (self->_installed && (sub_10000FF58(self, v10) & 1) == 0)
        {
          v13 = ne_log_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            int v15 = 138412290;
            v16 = self;
            _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ failed to set the scoping policy", (uint8_t *)&v15, 0xCu);
          }
        }
        return;
      }
      ++self->_refCount;
      self->_unint64_t currentPLTEMatchStaus = 1;
    }
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self) {
        unsigned int v12 = self->_refCount;
      }
      else {
        unsigned int v12 = 0;
      }
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 1024;
      LODWORD(v18) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ requesting install for LTE match [ref count:%u]", (uint8_t *)&v15, 0x12u);
    }

    sub_10000FE14((uint64_t)self, 0);
    if (self) {
      goto LABEL_22;
    }
  }
}

- (void)handleProviderInstallationStatus:(id)a3 status:(int64_t)a4
{
  CFStringRef v5 = @"uninstalled";
  if (a4 == 2) {
    CFStringRef v5 = @"installed";
  }
  BOOL v6 = a4 != 1 && a4 == 2;
  if (a4 == 1) {
    CFStringRef v7 = @"installing";
  }
  else {
    CFStringRef v7 = v5;
  }
  self->_providerInstalled = v6;
  CFStringRef v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ provider software installation status changed to [%@]", (uint8_t *)&v9, 0x16u);
  }

  if (self->_providerInstalled && self->_refCount && !self->_installed) {
    sub_10000FE14((uint64_t)self, 1);
  }
}

- (void)handleProviderStopped:(id)a3
{
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    CFStringRef v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ provider stopped", (uint8_t *)&v6, 0xCu);
  }

  sub_100011084(self, v5);
}

- (void)didExtensionExit:(id)a3
{
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    CFStringRef v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ provider exited", (uint8_t *)&v7, 0xCu);
  }

  sub_100010654(self);
  sub_100010728(self, v5);
  sub_100011084(self, v6);
}

- (void)plugin:(id)a3 didReceivePushToTalkMessageWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CFStringRef v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ provider reported PushToTalk message", (uint8_t *)&v11, 0xCu);
    }

    int v9 = v7;
    if (self)
    {
      v10 = [(NESMSession *)self queue];
      *(void *)&long long v11 = _NSConcreteStackBlock;
      *((void *)&v11 + 1) = 3221225472;
      CFStringRef v12 = sub_100011430;
      v13 = &unk_1000C6C38;
      v14 = self;
      int v15 = v9;
      dispatch_async(v10, &v11);
    }
  }
  else
  {
    int v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ provider reported PushToTalk message with invalid user info", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)plugin:(id)a3 didReceiveIncomingCallWithUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    CFStringRef v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ provider reported incoming call", (uint8_t *)&v11, 0xCu);
    }

    int v9 = v7;
    if (self)
    {
      v10 = [(NESMSession *)self queue];
      *(void *)&long long v11 = _NSConcreteStackBlock;
      *((void *)&v11 + 1) = 3221225472;
      CFStringRef v12 = sub_100011898;
      v13 = &unk_1000C6C38;
      v14 = self;
      int v15 = v9;
      dispatch_async(v10, &v11);
    }
  }
  else
  {
    int v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11) = 138412290;
      *(void *)((char *)&v11 + 4) = self;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ provider reported incoming call with invalid user info", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4 forMessageID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v17 = self;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ provider ack'd message delivery for [%@]", buf, 0x16u);
  }

  v10 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CFC;
  block[3] = &unk_1000C6958;
  block[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, block);
}

- (void)plugin:(id)a3 didReceiveProviderError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_active)
  {
    id v8 = ne_log_obj();
    int v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = self;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@ provider failed to start", (uint8_t *)&v11, 0xCu);
      }

      [(NESMAppPushSession *)self setActive:0];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ provider started, session is active now", (uint8_t *)&v11, 0xCu);
      }

      [(NESMAppPushSession *)self setActive:1];
      sub_100012020(self, v10);
    }
  }
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  return 1;
}

- (void)pluginDidDispose:(id)a3
{
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ provider disposed", buf, 0xCu);
  }

  [(NESMAppPushSession *)self setActive:0];
  CFStringRef v5 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001246C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (!a4 || v7)
  {
    __int16 v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [(NESMSession *)self configuration];
      id v19 = [v18 appPush];
      CFStringRef v20 = [v19 providerBundleIdentifier];
      *(_DWORD *)v25 = 138412802;
      *(void *)&v25[4] = self;
      *(_WORD *)&v25[12] = 2112;
      *(void *)&v25[14] = v20;
      *(_WORD *)&v25[22] = 2112;
      v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: failed to start provider %@. error: %@", v25, 0x20u);
    }
    if (v8)
    {
      __int16 v21 = [v8 domain];
      if ([v21 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v22 = [v8 code];

        if (v22 == (id)2)
        {
          if (!self) {
            goto LABEL_17;
          }
          if (self->_refCount)
          {
            dispatch_time_t v23 = dispatch_time(0, 15000000000);
            v24 = [(NESMSession *)self queue];
            *(void *)v25 = _NSConcreteStackBlock;
            *(void *)&v25[8] = 3221225472;
            *(void *)&v25[16] = sub_100012754;
            v26 = &unk_1000C6C60;
            v27 = self;
            dispatch_after(v23, v24, v25);

            goto LABEL_17;
          }
        }
      }
      else
      {
      }
    }
    sub_100010654(self);
    goto LABEL_17;
  }
  int v9 = [(NESMSession *)self configuration];
  v10 = [v9 appPush];
  int v11 = [v10 providerConfiguration];

  if (self)
  {
    id Property = objc_getProperty(self, v12, 384, 1);
    if (Property)
    {
      id v14 = Property;
      id v15 = v11;
      v16 = [v14 remotePluginObject];
      [v16 startConnectionWithProviderConfig:v15];
    }
  }

LABEL_17:
}

- (void)handleSendInfoMessage:(id)a3 withType:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100013080;
  v31 = sub_100013090;
  id v32 = 0;
  if (a4 == 5)
  {
    id v8 = xpc_dictionary_get_value(v6, "SessionAppPushCallInfo");
    int v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v21 = _NSConcreteStackBlock;
        uint64_t v22 = 3221225472;
        dispatch_time_t v23 = sub_100013098;
        v24 = &unk_1000C5720;
        id v25 = v7;
        v26 = &v27;
        id v11 = v10;
        id v12 = &v21;
        if (self)
        {
          if (self->_active)
          {
            v13 = [(NESMSession *)self queue];
            *(void *)&long long block = _NSConcreteStackBlock;
            *((void *)&block + 1) = 3221225472;
            v36 = sub_100013208;
            v37 = &unk_1000C6D88;
            v38 = self;
            v40 = v12;
            id v39 = v11;
            dispatch_async(v13, &block);
          }
          else
          {
            id v19 = ne_log_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(void *)((char *)&block + 4) = self;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ cannot send outgoing call message for inactive  session", (uint8_t *)&block, 0xCu);
            }

            CFStringRef v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NEAppPushErrorDomain, 4, 0, v21, v22);
            v23((uint64_t)v12, v20);
          }
        }

        xpc_object_t reply = v25;
      }
      else
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v7);
        CFStringRef v33 = @"AppPushSendCallInfoErrorCode";
        v34 = &off_1000C9810;
        uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v16 = (void *)v28[5];
        v28[5] = v15;

        if (v28[5])
        {
          __int16 v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "SessionAppPushSendMessageResult", v17);
        }
        xpc_dictionary_get_remote_connection(v7);
        __int16 v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_connection_send_message(v18, reply);
      }
    }
  }
  _Block_object_dispose(&v27, 8);
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = [(NESMAppPushSession *)self copyExtendedStatus];
    if (v7)
    {
      id v8 = v7;
      int v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_dictionary_set_value(reply, "SessionInfo", v9);
    }
  }
  xpc_dictionary_get_remote_connection(xdict);
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v10, reply);
}

- (id)copyExtendedStatus
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v8.receiver = self;
  v8.super_class = (Class)NESMAppPushSession;
  id v4 = [(NESMSession *)&v8 copyExtendedStatus];
  id v5 = [v3 initWithDictionary:v4];

  id v6 = +[NSNumber numberWithBool:[(NESMAppPushSession *)self active]];
  [v5 setObject:v6 forKeyedSubscript:@"IsAppPushActive"];

  return v5;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v29.receiver = self;
    v29.super_class = (Class)NESMAppPushSession;
    if ([(NESMSession *)&v29 handleUpdateConfiguration:v4])
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        if (self) {
          unsigned int refCount = self->_refCount;
        }
        else {
          unsigned int refCount = 0;
        }
        *(_DWORD *)buf = 138412546;
        v31 = self;
        __int16 v32 = 1024;
        unsigned int v33 = refCount;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ configuration changed [ref count:%u]", buf, 0x12u);
      }

      id v7 = [(NESMSession *)self configuration];
      objc_super v8 = [v7 appPush];
      unsigned __int8 v9 = [v8 isEnabled];

      if (v9)
      {
        if ([(NESMAppPushSession *)self active])
        {
          id v11 = [(NESMSession *)self configuration];
          id v12 = [v11 appPush];
          v13 = [v12 providerConfiguration];

          if (self)
          {
            id Property = objc_getProperty(self, v14, 384, 1);
            if (Property)
            {
              v16 = Property;
              id v17 = v13;
              __int16 v18 = [v16 remotePluginObject];
              [v18 setProviderConfiguration:v17];
            }
          }
        }
        if (self)
        {
          sub_1000137CC(self, v10);
          sub_10001384C(self, v19);
          sub_100013914((uint64_t)self, v20);
          sub_100013BF0(self, v21);
        }
      }
      else
      {
        id v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = self;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ configuration is disabled", buf, 0xCu);
        }

        if (self)
        {
          self->_unsigned int refCount = 0;
          sub_1000137CC(self, v26);
          sub_10001384C(self, v27);
          sub_10001044C((uint64_t)self);
        }
      }
      LOBYTE(self) = 1;
      goto LABEL_25;
    }
LABEL_19:
    LOBYTE(self) = 0;
    goto LABEL_25;
  }
  uint64_t v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = self;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@ configuration is removed/app uninstalled", buf, 0xCu);
  }

  if (self)
  {
    self->_unsigned int refCount = 0;
    sub_1000137CC(self, v23);
    sub_10001384C(self, v24);
    sub_10001044C((uint64_t)self);
    goto LABEL_19;
  }
LABEL_25:

  return (char)self;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  v10 = (NESMAppPushSession *)a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 368, 1);
  }
  else {
    id Property = 0;
  }
  id v14 = (NESMAppPushSession *)Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"status"];

    if (v15)
    {
      v16 = [(NESMSession *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100014384;
      block[3] = &unk_1000C6C60;
      block[4] = self;
      dispatch_async(v16, block);

      goto LABEL_14;
    }
  }
  else
  {
  }
  if (v10 == self && [v9 isEqualToString:@"active"])
  {
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unsigned int v18 = [(NESMAppPushSession *)self active];
      CFStringRef v19 = @"inactive";
      if (v18) {
        CFStringRef v19 = @"active";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      CFStringRef v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ session became %@", buf, 0x16u);
    }

    [(NESMSession *)self notifyChangedExtendedStatus];
  }
LABEL_14:
}

- (void)dealloc
{
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ deallocating session", buf, 0xCu);
  }

  if (self)
  {
    [objc_getProperty(self, v4, 392, 1) removeAllObjects];
    sub_100010728(self, v5);
    sub_100010808(self, v6);
    sub_100010958((uint64_t)self);
    sub_10001055C(self, v7);
  }
  else
  {
    [0 removeAllObjects];
  }
  v8.receiver = self;
  v8.super_class = (Class)NESMAppPushSession;
  [(NESMSession *)&v8 dealloc];
}

- (void)uninstall
{
  if (self) {
    self->_installed = 0;
  }
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: received uninstall", (uint8_t *)&v4, 0xCu);
  }
}

- (void)installPended
{
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: received install pending", buf, 0xCu);
  }

  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  id v5 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000149B0;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

- (void)install
{
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: received install", (uint8_t *)&v4, 0xCu);
  }

  if (self)
  {
    self->_installed = 1;
    sub_10001281C((uint64_t)self);
  }
}

- (int)type
{
  return 8;
}

- (NESMAppPushSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)NESMAppPushSession;
  int v4 = [(NESMSession *)&v14 initWithConfiguration:a3 andServer:a4];
  id v6 = v4;
  if (v4)
  {
    objc_setProperty_atomic(v4, v5, 0, 384);
    [(NESMAppPushSession *)v6 setActive:0];
    v6->_installed = 0;
    objc_setProperty_atomic(v6, v7, 0, 360);
    objc_setProperty_atomic(v6, v8, 0, 416);
    v6->_unsigned int refCount = 0;
    id v9 = +[NSMutableDictionary dictionary];
    objc_setProperty_atomic(v6, v10, v9, 392);

    v6->_currentSSIDMatchStaus = 0;
    v6->_unint64_t currentPLTEMatchStaus = 0;
    id v11 = [(NESMSession *)v6 queue];
    *(void *)&long long block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472;
    v16 = sub_100014D50;
    id v17 = &unk_1000C6C60;
    unsigned int v18 = v6;
    dispatch_async(v11, &block);

    v6->_providerInstalled = 1;
    [(NESMAppPushSession *)v6 addObserver:v6 forKeyPath:@"active" options:5 context:0];
  }
  id v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(block) = 138412290;
    *(void *)((char *)&block + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ initialized app push provider session", (uint8_t *)&block, 0xCu);
  }

  return v6;
}

+ (BOOL)hasRequiredFrameworks
{
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    uint64_t v2 = objc_opt_class();
    if (v2)
    {
      uint64_t v2 = objc_opt_class();
      if (v2) {
        LOBYTE(v2) = objc_opt_class() != 0;
      }
    }
  }
  return v2;
}

@end