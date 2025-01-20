@interface WCM_Controller
+ (id)newControllerForProcessId:(int)a3;
+ (id)newTestControllerForProcessId:(int)a3;
- (WCM_Controller)init;
- (WCM_Controller)initWithConnection:(id)a3 processId:(int)a4;
- (int)getProcessId;
- (void)dealloc;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)releaseConnection;
- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4;
- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6;
@end

@implementation WCM_Controller

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4
{
  *(_OWORD *)keys = *(_OWORD *)&off_100211158;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  uint64_t mProcessId = self->mProcessId;
  unsigned int v9 = self->mProcessId;
  if (self->mConnection)
  {
    if mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> v9))
    {
      v10 = (&off_100211168)[mProcessId];
    }
    else if (v9 == 42)
    {
      v10 = "WRMSOS";
    }
    else
    {
      v10 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:2, @"Sending messageId(%lld) to %s %@", a3, v10, v7 message];
    xpc_connection_send_message(self->mConnection, v7);
  }
  else
  {
    if (v9 < 0x2A && ((0x3EEEFFFFFFFuLL >> v9) & 1) != 0)
    {
      v11 = (&off_100211168)[v9];
    }
    else
    {
      v11 = "INVALID_PROC_ID!!!";
      if (mProcessId == 42) {
        v11 = "WRMSOS";
      }
    }
    +[WCM_Logging logLevel:0, @"No XPC connection for %s !", v11 message];
  }
  xpc_release(values[0]);
  xpc_release(v7);
}

- (int)getProcessId
{
  return self->mProcessId;
}

- (WCM_Controller)init
{
  +[WCM_Logging logLevel:18 message:@"WCM controller init"];
  v4.receiver = self;
  v4.super_class = (Class)WCM_Controller;
  result = [(WCM_Controller *)&v4 init];
  if (result)
  {
    result->mConnection = 0;
    result->uint64_t mProcessId = 0;
  }
  return result;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:18 message:@"WCM controller dealloc"];
  mConnection = self->mConnection;
  if (mConnection)
  {
    xpc_release(mConnection);
    self->mConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_Controller;
  [(WCM_Controller *)&v4 dealloc];
}

- (WCM_Controller)initWithConnection:(id)a3 processId:(int)a4
{
  self->mConnection = (OS_xpc_object *)a3;
  if (a3) {
    xpc_retain(a3);
  }
  self->uint64_t mProcessId = a4;
  if a4 < 0x2A && ((0x3EEEFFFFFFFuLL >> a4))
  {
    v6 = (&off_100211168)[a4];
  }
  else
  {
    v6 = "INVALID_PROC_ID!!!";
    if (a4 == 42) {
      v6 = "WRMSOS";
    }
  }
  return (WCM_Controller *)+[WCM_Logging logLevel:2, @"Initialize %@ for %s", self, v6 message];
}

- (void)releaseConnection
{
  if (self->mConnection)
  {
    unsigned int mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      objc_super v4 = (&off_100211168)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      objc_super v4 = "WRMSOS";
    }
    else
    {
      objc_super v4 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:2, @"Release mConnection for %s", v4 message];
    xpc_release(self->mConnection);
    self->mConnection = 0;
  }
}

- (void)handlePowerState:(BOOL)a3
{
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    objc_super v4 = (&off_100211168)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    objc_super v4 = "WRMSOS";
  }
  else
  {
    objc_super v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:0, @"WCM_Controller(%s) handlePowerState default implementation", v4 message];
}

- (void)handleMessage:(id)a3
{
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    objc_super v4 = (&off_100211168)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    objc_super v4 = "WRMSOS";
  }
  else
  {
    objc_super v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:0, @"WCM_Controller(%s) handleMessage default implementation", v4 message];
}

- (void)handleDisconnection:(id)a3
{
  unsigned int mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    objc_super v4 = (&off_100211168)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    objc_super v4 = "WRMSOS";
  }
  else
  {
    objc_super v4 = "INVALID_PROC_ID!!!";
  }
  +[WCM_Logging logLevel:0, @"WCM_Controller(%s) handleDisconnection default implementation (conn=%p)", v4, a3 message];
}

- (void)sendMessage:(unint64_t)a3 withArgs:(id)a4 withExtraKey:(const char *)a5 andExtraValue:(id)a6
{
  keys[0] = "kMessageId";
  keys[1] = "kMessageArgs";
  keys[2] = (char *)a5;
  values[0] = xpc_uint64_create(a3);
  values[1] = a4;
  xpc_object_t values[2] = a6;
  xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
  if (self->mConnection)
  {
    unsigned int mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v12 = (&off_100211168)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v12 = "WRMSOS";
    }
    else
    {
      v12 = "INVALID_PROC_ID!!!";
    }
    +[WCM_Logging logLevel:2, @"Sending messageId(%lld) to %s %@", a3, v12, v10 message];
    xpc_connection_send_message(self->mConnection, v10);
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"No XPC connection !"];
  }
  xpc_release(values[0]);
  xpc_release(v10);
}

+ (id)newControllerForProcessId:(int)a3
{
  unsigned int v4 = a3 - 1;
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 29:
    case 30:
    case 33:
    case 34:
    case 35:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
      goto LABEL_3;
    case 6:
      +[WCM_Logging logLevel:3 message:@"WCM_Controller created for test"];
LABEL_3:
      v5 = objc_opt_new();
      if (v5)
      {
        if (v4 < 0x29 && ((0x1F777FFFFFFuLL >> v4) & 1) != 0)
        {
          v6 = (&off_1002112B8)[v4];
        }
        else
        {
          v6 = "INVALID_PROC_ID!!!";
          if (a3 == 42) {
            v6 = "WRMSOS";
          }
        }
        +[WCM_Logging logLevel:2, @"%@ was created for %s", v5, v6 message];
      }
      break;
    default:
      +[WCM_Logging logLevel:0, @"WCM_Controller was not created for processId(%d)", *(void *)&a3 message];
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)newTestControllerForProcessId:(int)a3
{
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 7:
      goto LABEL_4;
    case 5:
    case 6:
      goto LABEL_3;
    default:
      if (a3 == 29)
      {
LABEL_4:
        return (id)objc_opt_new();
      }
      else
      {
LABEL_3:
        +[WCM_Logging logLevel:0, @"Invalid ProcessId: %d", *(void *)&a3 message];
        return 0;
      }
  }
}

@end