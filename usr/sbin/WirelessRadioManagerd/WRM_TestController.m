@interface WRM_TestController
- (WRM_TestController)init;
- (id)getControllerForProcessId:(int64_t)a3;
- (void)addConrollerToExisitngList:(id)a3;
- (void)addConrollerToNewList:(id)a3;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)handleProcessRegistration:(id)a3;
- (void)removeControllerFromExistingList:(id)a3;
- (void)removeControllerFromNewList:(id)a3;
- (void)sendMessageToController:(id)a3 forProcess:(int)a4;
@end

@implementation WRM_TestController

- (WRM_TestController)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_TestController;
  v2 = [(WCM_Controller *)&v4 init];
  *(void *)(v2 + 20) = objc_alloc_init((Class)NSMutableArray);
  *(void *)(v2 + 28) = objc_alloc_init((Class)NSMutableArray);
  return (WRM_TestController *)v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WRM_TestController;
  [(WCM_Controller *)&v2 dealloc];
}

- (void)addConrollerToExisitngList:(id)a3
{
}

- (void)removeControllerFromExistingList:(id)a3
{
}

- (void)addConrollerToNewList:(id)a3
{
}

- (void)removeControllerFromNewList:(id)a3
{
}

- (id)getControllerForProcessId:(int64_t)a3
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = *(void **)(&self->super.mProcessId + 1);
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if ([v10 getProcessId] == a3) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v10) {
      return v10;
    }
  }
LABEL_11:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = *(NSMutableArray **)((char *)&self->existingControllersList + 4);
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (!v12) {
    return 0;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v18;
LABEL_13:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v18 != v14) {
      objc_enumerationMutation(v11);
    }
    v10 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
    if ([v10 getProcessId] == a3) {
      return v10;
    }
    if (v13 == (id)++v15)
    {
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      v10 = 0;
      if (v13) {
        goto LABEL_13;
      }
      return v10;
    }
  }
}

- (void)handleProcessRegistration:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageArgs");
  +[WCM_Logging logLevel:2, @"Registering Process %d", uint64 message];
  id v5 = [[+[WCM_Server singleton](WCM_Server, "singleton") getSessionFor:uint64];
  if (v5 && (id v6 = [v5 getController]) != 0)
  {
    id v7 = v6;
    +[WCM_Logging logLevel:3, @"Adding Controller %@ to existingList", v6 message];
    [(WRM_TestController *)self addConrollerToExisitngList:v7];
  }
  else
  {
    id v8 = +[WCM_Controller newTestControllerForProcessId:uint64];
    uint64_t v9 = v8;
    switch((int)uint64)
    {
      case 1:
        qword_10027CF38 = (uint64_t)v8;
        uint64_t v9 = objc_opt_new();
        qword_10027CF38 = (uint64_t)v9;
        if (v9) {
          goto LABEL_14;
        }
        break;
      case 2:
      case 3:
      case 4:
        uint64_t v9 = objc_opt_new();
        if (v9) {
          goto LABEL_14;
        }
        break;
      case 7:
        qword_10027CF30 = (uint64_t)v8;
        uint64_t v9 = objc_opt_new();
        qword_10027CF30 = (uint64_t)v9;
        if (v9) {
          goto LABEL_14;
        }
        break;
      default:
        +[WCM_Logging logLevel:0, @"Invalid ProcessId", uint64 message];
        if (v9)
        {
LABEL_14:
          +[WCM_Logging logLevel:3, @"Adding Controller %@ to newList", v9 message];
          [v9 initWithConnection:0 processId:uint64];
          [(WRM_TestController *)self addConrollerToNewList:v9];
        }
        break;
    }
    if (uint64 != 7) {
      [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerSession:v9 ofId:uint64];
    }
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported")&& uint64 <= 7&& ((1 << uint64) & 0xE2) != 0)
    {
      NSLog(@"WCM_TestController received registration message from process id=%d", uint64);
      id v10 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
      [v10 updateControllerSession:v9 ofId:uint64];
    }
  }
}

- (void)sendMessageToController:(id)a3 forProcess:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(WRM_TestController *)self getControllerForProcessId:a4];
  if (v6)
  {
    [v6 handleMessage:a3];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Controller not found for Pid %d", v4 message];
  }
}

- (void)handleMessage:(id)a3
{
  +[WCM_Logging logLevel:2, @"WRM_TestController: Rx messages: %@", a3 message];
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:3, @"Received test messageId: %llu", uint64 message];
  if (uint64 - 400 >= 2)
  {
    if (uint64)
    {
      +[WCM_Logging logLevel:3 message:@"Not handled"];
    }
    else
    {
      [(WRM_TestController *)self handleProcessRegistration:a3];
    }
  }
  else
  {
    id v6 = (void *)qword_10027CF30;
    [v6 handleMessage:a3];
  }
}

@end