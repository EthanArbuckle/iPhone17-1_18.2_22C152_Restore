@interface WCM_Session
- (WCM_Session)init;
- (WCM_Session)initWithConnection:(id)a3;
- (id)description;
- (id)getConnection;
- (id)getController;
- (int)getProcessId;
- (void)dealloc;
- (void)handleCoexProcessRegistration:(id)a3;
- (void)handleDisconnection;
- (void)handleMessage:(id)a3;
- (void)handleXPCMessage:(id)a3;
- (void)handleiRATProcessRegistration:(id)a3;
- (void)sendMessage:(id)a3;
- (void)suspendExternalConnection;
@end

@implementation WCM_Session

- (void)handleMessage:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100024668;
  v3[3] = &unk_10020DAB0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], v3);
}

- (void)handleXPCMessage:(id)a3
{
  xpc_type_t type = xpc_get_type(a3);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary)
    {
      v6 = xpc_copy_description(a3);
      +[WCM_Logging logLevel:0, @"Unexpected XPC server event: %s", v6 message];
      free(v6);
      return;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
    xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
    if (!uint64)
    {
      uint64_t uint64 = xpc_dictionary_get_int64(a3, "kMessageId");
      if (!uint64) {
        goto LABEL_14;
      }
      +[WCM_Logging logLevel:1 message:@"Got a message with a INT64 instead of a UINT64. Please file a radar in Purple Coex Manager"];
    }
    if (uint64 == 301) {
      return;
    }
LABEL_14:
    unsigned int mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v10 = (&off_100211838)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v10 = "WRMSOS";
    }
    else
    {
      v10 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:2, @"Received messageId(%lld) from %s %@", uint64, v10, a3 message];
    if (uint64 == 1)
    {
      [(WCM_Session *)self handleCoexProcessRegistration:value];
      -[WCM_Session handleiRATProcessRegistration:](self, "handleiRATProcessRegistration:");
      return;
    }
    mController = self->mController;
    if (mController) {
      goto LABEL_39;
    }
    if (uint64 - 404 <= 8 && ((1 << (uint64 + 108)) & 0x103) != 0)
    {
      self->unsigned int mProcessId = 13;
      self->mController = (WCM_Controller *)+[WCM_Controller newControllerForProcessId:13];
      [+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") updateControllerSession:self->mController ofId:self->mProcessId];
      mController = self->mController;
LABEL_39:
      [(WCM_Controller *)mController handleMessage:a3];
      return;
    }
    if (uint64 == 2600)
    {
      v14 = (WCM_Controller *)[[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") getControllerOfId:3];
      +[WCM_Logging logLevel:3 message:@"XPC message received for WCMTestCellularNetworkConfiguration"];
      if (v14)
      {
        mController = v14;
        goto LABEL_39;
      }
      CFStringRef v15 = @"No Cellular Controller, drop message WCMTestCellularNetworkConfiguration";
      uint64_t v16 = 3;
      goto LABEL_46;
    }
    if (uint64 != 2601)
    {
      if (uint64 - 1401 <= 1)
      {
        if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2SupportIntegrated"))
        {
          id v12 = +[WCM_PolicyManager singleton];
          uint64_t v13 = 30;
          goto LABEL_38;
        }
        CFStringRef v15 = @"RCU2 Controller - HandleThreadStart - RCU2_SUPPORT_INTEGRATED - Feature not enabled";
        goto LABEL_45;
      }
      if (uint64 != 2602)
      {
        CFStringRef v15 = @"WCM_Session dropping - No Controllers";
LABEL_45:
        uint64_t v16 = 2;
LABEL_46:
        +[WCM_Logging logLevel:v16 message:v15];
        return;
      }
      +[WCM_Logging logLevel:2 message:@"WCM_Session handling WCMTestWifiCoexConfiguration"];
    }
    id v12 = +[WCM_PolicyManager singleton];
    uint64_t v13 = 1;
LABEL_38:
    mController = (WCM_Controller *)[v12 getControllerOfId:v13];
    if (!mController) {
      return;
    }
    goto LABEL_39;
  }
  +[WCM_Logging logLevel:1, @"WCM_Session: XPC server error: %s", xpc_dictionary_get_string(a3, _xpc_error_key_description) message];

  [(WCM_Session *)self handleDisconnection];
}

- (WCM_Session)init
{
  +[WCM_Logging logLevel:2 message:@"WCM_Session init"];
  v4.receiver = self;
  v4.super_class = (Class)WCM_Session;
  result = [(WCM_Session *)&v4 init];
  if (result)
  {
    result->mConnection = 0;
    result->mController = 0;
    result->unsigned int mProcessId = 0;
  }
  return result;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"WCM_Session dealloc"];
  mController = self->mController;
  if (mController) {

  }
  mConnection = self->mConnection;
  if (mConnection) {
    xpc_release(mConnection);
  }
  v5.receiver = self;
  v5.super_class = (Class)WCM_Session;
  [(WCM_Session *)&v5 dealloc];
}

- (id)description
{
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v3 = (&off_100211838)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v3 = "WRMSOS";
  }
  else
  {
    v3 = "INVALID_PROC_ID!!!";
  }
  return +[NSString stringWithFormat:@"WCM_Session(%s)", v3];
}

- (void)suspendExternalConnection
{
  unsigned int v3 = [(WCM_Session *)self getProcessId];
  if (v3 != 6) {
    +[WCM_Logging logLevel:2, @"Suspending XPC with Process %d Connection %@", v3, [(WCM_Session *)self getConnection] message];
  }
}

- (WCM_Session)initWithConnection:(id)a3
{
  self->mConnection = (OS_xpc_object *)a3;
  xpc_retain(a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002465C;
  handler[3] = &unk_10020F458;
  handler[4] = self;
  xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
  xpc_connection_resume(self->mConnection);
  return result;
}

- (void)handleDisconnection
{
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    objc_super v4 = (&off_100211838)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    objc_super v4 = "WRMSOS";
  }
  else
  {
    objc_super v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:2, @"Handle disconnection with %s", v4 message];
  mController = self->mController;
  if (mController)
  {
    if (mController == [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") getControllerOfId:self->mProcessId])[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerSession:0 ofId:self->mProcessId]; {
    v6 = self->mController;
    }
    if (v6 == [[+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton") getControllerOfId:self->mProcessId]])[[+[WCM_UCMClientManager WCM_UCMClientManagerSingleton](WCM_UCMClientManager, "WCM_UCMClientManagerSingleton") updateControllerSession:0 ofId:self->mProcessId];
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
    }
    {
      [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerSession:0 ofId:self->mProcessId];
      [+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") updateControllerSession:0 ofId:self->mProcessId];
      [+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") updateControllerSession:0 ofId:self->mProcessId];
      [+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton") updateControllerSession:0 ofId:self->mProcessId];
    }
    [(WCM_Controller *)self->mController handleDisconnection:self->mConnection];
  }
  if ([(WCM_Session *)self getProcessId] == 6) {
    [+[WCM_Server singleton](WCM_Server, "singleton") exitTestMode];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D5D50;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)sendMessage:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D5E8C;
  v3[3] = &unk_10020DAB0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], v3);
}

- (void)handleCoexProcessRegistration:(id)a3
{
  if (a3)
  {
    uint64_t int64 = xpc_dictionary_get_int64(a3, "kWCMRegisterProcess_ProcessId");
    if (!int64) {
      uint64_t int64 = xpc_dictionary_get_uint64(a3, "kWCMRegisterProcess_ProcessId");
    }
    id v6 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:int64];
    if (v6)
    {
      if int64 < 0x2A && ((0x3EEEFFFFFFFuLL >> int64))
      {
        v7 = (&off_100211838)[(int)int64];
      }
      else
      {
        v7 = "INVALID_PROC_ID!!!";
        if (int64 == 42) {
          v7 = "WRMSOS";
        }
      }
      +[WCM_Logging logLevel:0, @"Server already has a existing session(%p) for %s, new session(%p)", v6, v7, self message];
    }
    self->uint64_t mProcessId = int64;
    if ((objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "coexSupported") & 1) != 0|| (unsigned int v8 = self->mProcessId, v8 == 6))
    {
      if (self->mController)
      {
        +[WCM_Logging logLevel:0 message:@"Controller already exists for this session"];
      }
      else
      {
        mController = +[WCM_Controller newControllerForProcessId:self->mProcessId];
        self->mController = mController;
        if (self->mProcessId == 6)
        {
          [+[WCM_Server singleton](WCM_Server, "singleton") enterTestMode];
          mController = self->mController;
        }
        if (mController)
        {
          [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerSession:self->mController ofId:self->mProcessId];
          [(WCM_Controller *)self->mController initWithConnection:self->mConnection processId:self->mProcessId];
          [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") initControllerPolicy:self->mProcessId];
        }
      }
      id v10 = +[WCM_UCMClientManager WCM_UCMClientManagerSingleton];
      v11 = self->mController;
      uint64_t mProcessId = self->mProcessId;
      [v10 updateControllerSession:v11 ofId:mProcessId];
    }
    else
    {
      if (v8 < 0x2A && ((0x3EEEFFFFFBFuLL >> v8) & 1) != 0)
      {
        uint64_t v13 = (&off_1002116E8)[v8];
      }
      else if (v8 == 42)
      {
        uint64_t v13 = "WRMSOS";
      }
      else
      {
        uint64_t v13 = "INVALID_PROC_ID!!!";
      }
      +[WCM_Logging logLevel:1, @"WCM_Session: Coex not active on this platform, not registering for %s", v13 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:");
  }
}

- (void)handleiRATProcessRegistration:(id)a3
{
  if (a3)
  {
    int int64 = xpc_dictionary_get_int64(a3, "kWCMRegisterProcess_ProcessId");
    self->unsigned int mProcessId = int64;
    if (!int64) {
      self->unsigned int mProcessId = xpc_dictionary_get_uint64(a3, "kWCMRegisterProcess_ProcessId");
    }
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
    {
      if (!self->mController)
      {
        unsigned int mProcessId = self->mProcessId;
        if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
        {
          v7 = (&off_100211838)[mProcessId];
        }
        else if (mProcessId == 42)
        {
          v7 = "WRMSOS";
        }
        else
        {
          v7 = "INVALID_PROC_ID!!!";
        }
        +[WCM_Logging logLevel:18, @"WCM_Session: iRAT registering for %s", v7 message];
        self->mController = (WCM_Controller *)+[WCM_Controller newControllerForProcessId:self->mProcessId];
        if (self->mProcessId == 6) {
          [+[WCM_Server singleton](WCM_Server, "singleton") enterTestMode];
        }
        +[WCM_Logging logLevel:18, @"WCM_Session: mConnection %@", self->mConnection message];
        [(WCM_Controller *)self->mController initWithConnection:self->mConnection processId:self->mProcessId];
      }
      +[WCM_Logging logLevel:3 message:@"WCM_Session: Registed with Handover Manager, updating controller"];
      [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerSession:self->mController ofId:self->mProcessId];
      [+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") updateControllerSession:self->mController ofId:self->mProcessId];
      [+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") updateControllerSession:self->mController ofId:self->mProcessId];
      id v10 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
      mController = self->mController;
      uint64_t v12 = self->mProcessId;
      [v10 updateControllerSession:mController ofId:v12];
    }
    else
    {
      unsigned int v8 = self->mProcessId;
      if (v8 < 0x2A && ((0x3EEEFFFFFFFuLL >> v8) & 1) != 0)
      {
        v9 = (&off_100211838)[v8];
      }
      else if (v8 == 42)
      {
        v9 = "WRMSOS";
      }
      else
      {
        v9 = "INVALID_PROC_ID!!!";
      }
      +[WCM_Logging logLevel:1, @"WCM_Session: iRAT not active on this platform, not registering for %s.", v9 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:");
  }
}

- (id)getConnection
{
  return self->mConnection;
}

- (int)getProcessId
{
  return self->mProcessId;
}

- (id)getController
{
  return self->mController;
}

@end