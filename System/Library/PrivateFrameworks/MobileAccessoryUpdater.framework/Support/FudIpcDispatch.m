@interface FudIpcDispatch
- (BOOL)dispatchEvent:(id)a3;
- (BOOL)dispatchQueryEvent:(id)a3;
- (BOOL)dispatchStateMachineEvent:(id)a3;
- (BOOL)dispatchStatelessEvent:(id)a3;
- (BOOL)isEventQueryRequest:(id)a3;
- (BOOL)isEventStateless:(id)a3;
- (BOOL)isStateMachineAcceptingNewStreamEvents:(id)a3;
- (BOOL)isStateMachineBusyInExclusionGroup:(id)a3;
- (BOOL)isStateMachineForFilterAcceptingNewStreamEvents:(id)a3;
- (BOOL)notifyAccessoryAttachedWithEvent:(id)a3;
- (BOOL)registerClientWithEvent:(id)a3 error:(id *)a4;
- (BOOL)sendDeviceClassAttached:(id)a3 toClient:(id)a4;
- (BOOL)sendReplyToDictionary:(id)a3 forCommand:(int)a4 withStatus:(BOOL)a5 withError:(id)a6;
- (BOOL)setLastRemoteFindWithEvent:(id)a3;
- (BOOL)setupClientSessionWithEvent:(id)a3 error:(id *)a4;
- (BOOL)shouldBlockCriticalSectionDuringStep:(int)a3;
- (BOOL)shouldUnblockCriticalSectionAfterStep:(int)a3 wasSuccessful:(BOOL)a4;
- (BOOL)unregisterClientWithEvent:(id)a3 error:(id *)a4;
- (FudIpcDispatch)initWithStorage:(id)a3;
- (OS_dispatch_queue)workQueue;
- (id)getPluginWithName:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7;
- (id)getStorage;
- (int)getCommandForState:(int)a3;
- (void)accessoryDisconnected:(id)a3 error:(id)a4;
- (void)addEventToQueue:(id)a3 withFilter:(id)a4 stateMachine:(id)a5;
- (void)aquireCriticalSectionLock;
- (void)dealloc;
- (void)disableStreamEventsForStateMachine:(id)a3;
- (void)enableStreamEventsForStateMachine:(id)a3;
- (void)issueNotification:(id)a3 request:(id)a4;
- (void)queueUpEventForAccessory:(id)a3 stateMachine:(id)a4;
- (void)releaseCriticalSectionLock;
- (void)stepComplete:(int)a3 stateMachine:(id)a4 status:(BOOL)a5 error:(id)a6 info:(id)a7;
- (void)stepProgress:(int)a3 stateMachine:(id)a4 progress:(double)a5 overallProgress:(double)a6;
- (void)stepWillBegin:(int)a3 stateMachine:(id)a4;
@end

@implementation FudIpcDispatch

- (FudIpcDispatch)initWithStorage:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FudIpcDispatch;
  v4 = [(FudIpcDispatch *)&v9 init];
  if (a3)
  {
    v4->eventFlags = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:5];
    v4->storage = (FudStorage *)a3;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v4->_attr = (OS_dispatch_queue_attr *)v6;
    v4->isActive = 1;
    v4->workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MobileAccessoryUpdater.dispatch.workQueue", v6);
    v4->criticalSectionSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v4->queuedEvents = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  }
  else
  {
    FudLog();
    v7 = v4;
    return 0;
  }
  return v4;
}

- (BOOL)isEventStateless:(id)a3
{
  if (a3) {
    return [a3 type] == 107
  }
        || [a3 type] == 105
        || [a3 type] == 106
        || [a3 type] == 100
        || [a3 type] == 117;
  FudLog();
  return 0;
}

- (BOOL)isEventQueryRequest:(id)a3
{
  if (a3)
  {
    if ([a3 type] == 104 || objc_msgSend(a3, "type") == 102) {
      return 1;
    }
  }
  else
  {
    FudLog();
  }
  return 0;
}

- (BOOL)unregisterClientWithEvent:(id)a3 error:(id *)a4
{
  FudLog();
  if (a3 && objc_msgSend(a3, "clientName", "-[FudIpcDispatch unregisterClientWithEvent:error:]"))
  {
    -[FudStorage unregisterClientFromAllPlugins:](self->storage, "unregisterClientFromAllPlugins:", [a3 clientName]);
    return 1;
  }
  else if (a4)
  {
    v8 = (void *)FUDError();
    BOOL result = 0;
    *a4 = v8;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)registerClientWithEvent:(id)a3 error:(id *)a4
{
  FudLog();
  if (!a3)
  {
    CFStringRef v9 = @"Can't register with nil event";
    goto LABEL_21;
  }
  if (!objc_msgSend(a3, "clientName", "-[FudIpcDispatch registerClientWithEvent:error:]"))
  {
    CFStringRef v9 = @"Can't register with nil client name";
    goto LABEL_21;
  }
  v7 = -[FudStorage getClientWithName:](self->storage, "getClientWithName:", [a3 clientName]);
  if ([a3 isInternalEvent])
  {
    xpc_connection_t remote_connection = 0;
  }
  else
  {
    xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection([a3 data]);
    if (!remote_connection)
    {
LABEL_25:
      FudLog();
      return 0;
    }
  }
  if (!v7)
  {
    v7 = -[ClientInfo initWithName:connection:]([ClientInfo alloc], "initWithName:connection:", [a3 clientName], remote_connection);
    if (!v7) {
      goto LABEL_25;
    }
  }
  -[ClientInfo setIsInternalClient:](v7, "setIsInternalClient:", [a3 isInternalEvent]);
  string = xpc_dictionary_get_string([a3 data], "PluginIdentifier");
  if (string)
  {
    v11 = +[NSString stringWithCString:string encoding:4];
    if (![(FudStorage *)self->storage registerClient:v7 withPlugin:v11])
    {
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to register client: %@", [a3 clientName], v17);
LABEL_20:
      CFStringRef v9 = (const __CFString *)v12;
LABEL_21:
      BOOL result = 0;
      if (a4)
      {
        if (v9)
        {
          v15 = (void *)FUDError();
          BOOL result = 0;
          *a4 = v15;
        }
      }
      return result;
    }
  }
  else
  {
    v13 = xpc_dictionary_get_string([a3 data], "GroupIdentifier");
    if (!v13)
    {
      CFStringRef v9 = @"Can't register client with NULL plugin and group identifier";
      goto LABEL_21;
    }
    v11 = +[NSString stringWithCString:v13 encoding:4];
    if (![(FudStorage *)self->storage registerClient:v7 withGroup:v11])
    {
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to register client:%@ for group:%@", [a3 clientName], v11);
      goto LABEL_20;
    }
  }
  id v16 = [a3 clientName];
  FudLog();
  if (remote_connection) {
    -[ClientInfo setConnection:](v7, "setConnection:", remote_connection, v16, v11);
  }
  return 1;
}

- (BOOL)setupClientSessionWithEvent:(id)a3 error:(id *)a4
{
  FudLog();
  if (a3)
  {
    objc_msgSend(a3, "clientName", "-[FudIpcDispatch setupClientSessionWithEvent:error:]");
    id v7 = -[FudStorage getClientWithName:](self->storage, "getClientWithName:", [a3 clientName]);
    if (v7)
    {
      v8 = v7;
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection([a3 data]);
      if (remote_connection)
      {
        [v8 setConnection:remote_connection];
        [v8 name];
        FudLog();
        return 1;
      }
      CFStringRef v11 = @"Can't setup session since connection information was NULL in inbound event";
    }
    else
    {
      CFStringRef v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Can't setup session since this client '%@' isn't registered for any events", [a3 clientName]);
    }
  }
  else
  {
    CFStringRef v11 = @"Can't setup connection with nil event.";
  }
  BOOL result = 0;
  if (a4)
  {
    if (v11)
    {
      v12 = (void *)FUDError();
      BOOL result = 0;
      *a4 = v12;
    }
  }
  return result;
}

- (BOOL)notifyAccessoryAttachedWithEvent:(id)a3
{
  FudLog();
  id v5 = objc_msgSend(a3, "filterName", "-[FudIpcDispatch notifyAccessoryAttachedWithEvent:]");
  if (v5)
  {
    id v6 = v5;
    id v7 = [(FudStorage *)self->storage getPolicyForFilterName:v5];
    if (v7)
    {
      v8 = v7;
      id v9 = -[FudStorage getRegisteredClientsForPlugin:](self->storage, "getRegisteredClientsForPlugin:", [v7 pluginName]);
      if (!v9) {
        return 1;
      }
      v10 = v9;
      if (![v9 count]) {
        return 1;
      }
      id v11 = [v8 getMatchingFilterWithName:v6];
      if (v11)
      {
        id v12 = [v11 exclusionGroup];
        if (v12)
        {
          if ([(FudIpcDispatch *)self isStateMachineBusyInExclusionGroup:v12])
          {
            FudLog();
          }
          else
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            id v13 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v21;
              do
              {
                for (i = 0; i != v14; i = (char *)i + 1)
                {
                  if (*(void *)v21 != v15) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                  id v19 = [v17 name];
                  FudLog();
                  -[FudIpcDispatch sendDeviceClassAttached:toClient:](self, "sendDeviceClassAttached:toClient:", v6, v17, v19, v6);
                }
                id v14 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
              }
              while (v14);
            }
          }
          return 1;
        }
      }
    }
  }
  FudLog();
  return 0;
}

- (BOOL)setLastRemoteFindWithEvent:(id)a3
{
  FudLog();
  id v5 = objc_msgSend(a3, "filterName", "-[FudIpcDispatch setLastRemoteFindWithEvent:]");
  if (v5
    && (v6 = v5, (id v7 = [(FudStorage *)self->storage getPolicyForFilterName:v5]) != 0)
    && (v8 = v7, (id v9 = [a3 clientOptions]) != 0)
    && (id v10 = [v9 objectForKey:@"LastRemoteFindDate"]) != 0)
  {
    [(FudStorage *)self->storage recordSuccessfulRemoteFindForPolicy:v8 filter:v6 revision:0 date:v10];
    return 1;
  }
  else
  {
    FudLog();
    return 0;
  }
}

- (BOOL)dispatchEvent:(id)a3
{
  FudLog();
  if (a3 && objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchEvent:]"))
  {
    if (self->isActive)
    {
      workQueue = self->workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100018FA4;
      block[3] = &unk_10007D4B0;
      block[4] = self;
      block[5] = a3;
      dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
      return 1;
    }
  }
  else
  {
    FudLog();
  }
  return 0;
}

- (BOOL)dispatchQueryEvent:(id)a3
{
  FudLog();
  uint64_t v13 = 0;
  FudLog();
  if (!a3 || !objc_msgSend(a3, "data", "-[FudIpcDispatch dispatchQueryEvent:]"))
  {
    FudLog();
    return 0;
  }
  unsigned int v5 = [a3 type];
  if ([a3 type] == 104)
  {
    if ([a3 filterName])
    {
      id v6 = -[FudStorage getStateMachineForFilterName:](self->storage, "getStateMachineForFilterName:", [a3 filterName]);
      if (v6)
      {
        int64_t v7 = -[FudIpcDispatch getCommandForState:](self, "getCommandForState:", [v6 nextStep:&v13]);
        id v12 = (id)v7;
        FudLog();
LABEL_9:
        BOOL v8 = 1;
        goto LABEL_11;
      }
      id v12 = [a3 filterName];
    }
  }
  else if ([a3 type] == 102)
  {
    id v12 = [(NSMutableDictionary *)[(FudStorage *)self->storage pluginToPolicy] allKeys];
    FudLog();
    int64_t v7 = -1;
    goto LABEL_9;
  }
  FudLog();
  BOOL v8 = 0;
  int64_t v7 = -1;
LABEL_11:
  if (objc_msgSend(a3, "isInternalEvent", v12)) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create_reply([a3 data]);
  }
  id v10 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "Response", v5);
    if ([a3 type] == 104)
    {
      xpc_dictionary_set_int64(v10, "NextStep", v7);
      xpc_dictionary_set_BOOL(v10, "Status", v8);
    }
    else if ([a3 type] == 102)
    {
      addObjectToXpcDictionary();
    }
    xpc_dictionary_set_string(v10, "FilterIdentifier", (const char *)objc_msgSend(objc_msgSend(a3, "filterName"), "cStringUsingEncoding:", 4));
    if (v13) {
      addObjectToXpcDictionary();
    }
    FudLog();
    [a3 data];
    sendReplyMessageToClient();
    xpc_release(v10);
  }
  else
  {
    FudLog();
  }
  return v8;
}

- (BOOL)dispatchStatelessEvent:(id)a3
{
  FudLog();
  uint64_t v11 = 0;
  if (!a3 || !objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchStatelessEvent:]"))
  {
    FudLog();
    LOBYTE(v6) = 0;
    return v6;
  }
  if ([a3 type] != 105)
  {
    if ([a3 type] == 106)
    {
      BOOL v5 = [(FudIpcDispatch *)self unregisterClientWithEvent:a3 error:&v11];
      goto LABEL_10;
    }
    if ([a3 type] == 107)
    {
      BOOL v5 = [(FudIpcDispatch *)self setupClientSessionWithEvent:a3 error:&v11];
      goto LABEL_10;
    }
    if ([a3 type] == 100)
    {
      unsigned __int8 v9 = [(FudIpcDispatch *)self notifyAccessoryAttachedWithEvent:a3];
    }
    else
    {
      if ([a3 type] != 117)
      {
        LOBYTE(v6) = 0;
        goto LABEL_19;
      }
      unsigned __int8 v9 = [(FudIpcDispatch *)self setLastRemoteFindWithEvent:a3];
    }
    LOBYTE(v6) = v9;
LABEL_19:
    [a3 sendResponse];
    return v6;
  }
  BOOL v5 = [(FudIpcDispatch *)self registerClientWithEvent:a3 error:&v11];
LABEL_10:
  BOOL v6 = v5;
  if ([a3 sendResponse] && objc_msgSend(a3, "data"))
  {
    id v7 = [a3 data];
    id v8 = [a3 type];
    [(FudIpcDispatch *)self sendReplyToDictionary:v7 forCommand:v8 withStatus:v6 withError:v11];
  }
  return v6;
}

- (void)addEventToQueue:(id)a3 withFilter:(id)a4 stateMachine:(id)a5
{
  if ([a4 needsMultiUpdateCheck])
  {
    id v17 = [a4 exclusionGroup];
    FudLog();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    queuedEvents = self->queuedEvents;
    id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](queuedEvents, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v17);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(queuedEvents);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v14 = objc_msgSend(objc_msgSend(v13, "clientOptions"), "objectForKey:", @"SerialNumber");
          if (objc_msgSend(objc_msgSend(v13, "filterName"), "isEqualToString:", objc_msgSend(a3, "filterName"))&& (!v14|| objc_msgSend(v14, "isEqualToString:", objc_msgSend(objc_msgSend(a3, "clientOptions"), "objectForKey:", @"SerialNumber"))))
          {
            id v18 = [a3 filterName];
            FudLog();
            -[NSMutableArray removeObject:](self->queuedEvents, "removeObject:", v13, v18);
            goto LABEL_14;
          }
        }
        id v10 = [(NSMutableArray *)queuedEvents countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
LABEL_14:
  [(NSMutableArray *)self->queuedEvents addObject:a3];
  id v15 = [(NSMutableArray *)self->queuedEvents count];
  id v16 = [a5 stateMachinePluginName];
  id v19 = [a5 stateMachineFilterName];
  FudLog();
  [(NSMutableArray *)self->queuedEvents count];
  FudLog();
}

- (BOOL)dispatchStateMachineEvent:(id)a3
{
  FudLog();
  if (!a3) {
    goto LABEL_28;
  }
  if (!objc_msgSend(a3, "type", "-[FudIpcDispatch dispatchStateMachineEvent:]")) {
    goto LABEL_28;
  }
  if (![a3 filterName]) {
    goto LABEL_28;
  }
  id v5 = -[FudStorage getPolicyForFilterName:](self->storage, "getPolicyForFilterName:", [a3 filterName]);
  id v6 = [a3 filterName];
  if (!v5) {
    goto LABEL_28;
  }
  id v7 = [v5 getMatchingFilterWithName:v6];
  if (!v7)
  {
    [a3 filterName];
    goto LABEL_28;
  }
  id v8 = v7;
  id v9 = -[FudStorage getStateMachineForFilterName:](self->storage, "getStateMachineForFilterName:", [a3 filterName]);
  if (v9)
  {
    if ([a3 isConnectionEvent])
    {
      unsigned int v10 = [(FudStateMachine *)v9 isActive];
      v26 = [(FudStateMachine *)v9 stateMachinePluginName];
      v28 = [(FudStateMachine *)v9 stateMachineFilterName];
      id v23 = (id)v10;
      FudLog();
      if (v10)
      {
        uint64_t v11 = self;
        id v12 = a3;
        id v13 = v8;
        id v14 = v9;
LABEL_22:
        -[FudIpcDispatch addEventToQueue:withFilter:stateMachine:](v11, "addEventToQueue:withFilter:stateMachine:", v12, v13, v14, v23, v26);
        return 1;
      }
    }
  }
  if (!objc_msgSend(a3, "isConnectionEvent", v23, v26, v28)) {
    goto LABEL_15;
  }
  id v8 = objc_msgSend(v5, "getMatchingFilterWithName:", objc_msgSend(a3, "filterName"));
  id v15 = [a3 filterName];
  if (!v8) {
    goto LABEL_28;
  }
  id v29 = [v8 exclusionGroup];
  FudLog();
  if (-[FudIpcDispatch isStateMachineBusyInExclusionGroup:](self, "isStateMachineBusyInExclusionGroup:", objc_msgSend(v8, "exclusionGroup", "-[FudIpcDispatch dispatchStateMachineEvent:]", v15, v29)))
  {
    if (([v8 needsMultiUpdateCheck] & 1) == 0)
    {
      [v8 exclusionGroup];
      goto LABEL_28;
    }
    [(FudIpcDispatch *)self addEventToQueue:a3 withFilter:v8 stateMachine:v9];
LABEL_15:
    if (v9)
    {
      FudLog();
      [(FudStateMachine *)v9 setDelegate:self];
LABEL_17:
      switch(objc_msgSend(a3, "type", v24))
      {
        case 'g':
        case 'r':
          FudLog();
          -[FudStateMachine performNextStepWithOptions:](v9, "performNextStepWithOptions:", [a3 clientOptions]);
          return 1;
        case 'l':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 2;
          goto LABEL_36;
        case 'm':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 4;
          goto LABEL_36;
        case 'n':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 7;
          goto LABEL_36;
        case 'o':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 8;
          goto LABEL_36;
        case 'p':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 9;
          goto LABEL_36;
        case 'q':
          FudLog();
          id v19 = [a3 clientOptions];
          long long v20 = v9;
          uint64_t v21 = 10;
LABEL_36:
          [(FudStateMachine *)v20 performStep:v21 withOptions:v19];
          break;
        case 'v':
          id v25 = [(NSMutableArray *)self->queuedEvents count];
          FudLog();
          -[FudStateMachine doneWithOptions:](v9, "doneWithOptions:", objc_msgSend(a3, "clientOptions", v25));
          if (!self->isActive) {
            return 0;
          }
          workQueue = self->workQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100019CE4;
          block[3] = &unk_10007CF58;
          block[4] = self;
          dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
          break;
        default:
          [a3 type];
          goto LABEL_28;
      }
      return 1;
    }
    goto LABEL_20;
  }
  FudLog();
  -[FudStorage setStateMachine:forPlugin:forFilter:](self->storage, "setStateMachine:forPlugin:forFilter:", 0, [v5 pluginName], objc_msgSend(a3, "filterName"));
LABEL_20:
  if (-[FudStorage isAnyStateMachineActiveForPlugin:](self->storage, "isAnyStateMachineActiveForPlugin:", [v5 pluginName]))
  {
    id v23 = [v5 pluginName];
    v26 = (NSString *)[a3 filterName];
    FudLog();
    uint64_t v11 = self;
    id v12 = a3;
    id v13 = v8;
    id v14 = 0;
    goto LABEL_22;
  }
  FudLog();
  id v16 = -[FudStateMachine initWithPluginName:filterName:delegate:options:]([FudStateMachine alloc], "initWithPluginName:filterName:delegate:options:", objc_msgSend(v5, "pluginName", a3), objc_msgSend(a3, "filterName"), self, objc_msgSend(a3, "clientOptions"));
  if (v16)
  {
    id v9 = v16;
    -[FudStateMachine setAccessory:](v16, "setAccessory:", [a3 accessory]);
    id v27 = [a3 accessory];
    FudLog();
    id v17 = v9;
    if (!-[FudStorage setStateMachine:forPlugin:forFilter:](self->storage, "setStateMachine:forPlugin:forFilter:", v9, objc_msgSend(v5, "pluginName", v9, v27), objc_msgSend(a3, "filterName")))
    {
      id v24 = [a3 filterName];
      FudLog();
    }
    goto LABEL_17;
  }
  [v5 pluginName];
LABEL_28:
  FudLog();
  return 0;
}

- (BOOL)isStateMachineForFilterAcceptingNewStreamEvents:(id)a3
{
  if (a3) {
    return -[NSMutableDictionary objectForKey:](self->eventFlags, "objectForKey:", a3, "-[FudIpcDispatch isStateMachineForFilterAcceptingNewStreamEvents:]") == 0;
  }
  FudLog();
  return 1;
}

- (BOOL)isStateMachineAcceptingNewStreamEvents:(id)a3
{
  FudLog();
  id v5 = objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch isStateMachineAcceptingNewStreamEvents:]");
  return [(FudIpcDispatch *)self isStateMachineForFilterAcceptingNewStreamEvents:v5];
}

- (BOOL)isStateMachineBusyInExclusionGroup:(id)a3
{
  FudLog();
  if (a3
    && (id v5 = -[FudStorage getFiltersInExclusionGroup:](self->storage, "getFiltersInExclusionGroup:", a3, "-[FudIpcDispatch isStateMachineBusyInExclusionGroup:]")) != 0&& (v6 = v5, [v5 count]))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        unsigned int v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
          id v13 = [v11 filterName];
          FudLog();
          if (!-[FudIpcDispatch isStateMachineForFilterAcceptingNewStreamEvents:](self, "isStateMachineForFilterAcceptingNewStreamEvents:", objc_msgSend(v11, "filterName", v13, a3)))
          {
            LOBYTE(v7) = 1;
            return (char)v7;
          }
          unsigned int v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v8 = v7;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    FudLog();
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (void)disableStreamEventsForStateMachine:(id)a3
{
  FudLog();
  id v5 = objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch disableStreamEventsForStateMachine:]");
  if (v5)
  {
    id v6 = v5;
    eventFlags = self->eventFlags;
    id v8 = +[NSNumber numberWithBool:1];
    [(NSMutableDictionary *)eventFlags setObject:v8 forKey:v6];
  }
  else
  {
    FudLog();
  }
}

- (void)enableStreamEventsForStateMachine:(id)a3
{
  FudLog();
  id v5 = objc_msgSend(a3, "stateMachineFilterName", "-[FudIpcDispatch enableStreamEventsForStateMachine:]");
  if (v5)
  {
    id v6 = v5;
    if ([(NSMutableDictionary *)self->eventFlags objectForKey:v5])
    {
      eventFlags = self->eventFlags;
      [(NSMutableDictionary *)eventFlags removeObjectForKey:v6];
    }
  }
  else
  {
    FudLog();
  }
}

- (BOOL)shouldBlockCriticalSectionDuringStep:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 8;
}

- (BOOL)shouldUnblockCriticalSectionAfterStep:(int)a3 wasSuccessful:(BOOL)a4
{
  return (a3 & 0xFFFFFFFE) == 8;
}

- (void)aquireCriticalSectionLock
{
  FudLog();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->criticalSectionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  FudLog();
}

- (void)releaseCriticalSectionLock
{
  FudLog();
  criticalSectionSemaphore = self->criticalSectionSemaphore;
  dispatch_semaphore_signal(criticalSectionSemaphore);
}

- (BOOL)sendDeviceClassAttached:(id)a3 toClient:(id)a4
{
  FudLog();
  if (!a3) {
    goto LABEL_10;
  }
  if (!a4)
  {
    FudLog();
    return (char)a4;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
  {
LABEL_10:
    FudLog();
    LOBYTE(a4) = 0;
    return (char)a4;
  }
  id v7 = v6;
  xpc_dictionary_set_int64(v6, "Response", 100);
  id v8 = (const char *)objc_msgSend(a3, "cStringUsingEncoding:", 4, "-[FudIpcDispatch sendDeviceClassAttached:toClient:]");
  if (v8)
  {
    xpc_dictionary_set_string(v7, "FilterIdentifier", v8);
    LOBYTE(a4) = [a4 sendMessage:v7];
  }
  else
  {
    FudLog();
    LOBYTE(a4) = 0;
  }
  xpc_release(v7);
  return (char)a4;
}

- (BOOL)sendReplyToDictionary:(id)a3 forCommand:(int)a4 withStatus:(BOOL)a5 withError:(id)a6
{
  FudLog();
  if (a3
    && (!xpc_dictionary_get_BOOL(a3, "InternalClient")
      ? (xpc_object_t reply = xpc_dictionary_create_reply(a3))
      : (xpc_object_t reply = xpc_dictionary_create(0, 0, 0)),
        (uint64_t v11 = reply) != 0))
  {
    xpc_dictionary_set_int64(reply, "Response", a4);
    xpc_dictionary_set_BOOL(v11, "Status", a5);
    if (a6) {
      addObjectToXpcDictionary();
    }
    sendReplyMessageToClient();
    xpc_release(v11);
    return 1;
  }
  else
  {
    FudLog();
    return 0;
  }
}

- (int)getCommandForState:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 9 && ((0x1CBu >> v3)) {
    return dword_10006AAD8[v3];
  }
  FudLog();
  return 0;
}

- (id)getPluginWithName:(id)a3 forFilter:(id)a4 delegate:(id)a5 info:(id *)a6 options:(id)a7
{
  FudLog();
  uint64_t v17 = 0;
  if (!a3
    || !a4
    || (id v12 = +[FudUtilities getURLForServiceIdentifier:](FudUtilities, "getURLForServiceIdentifier:", a3, "-[FudIpcDispatch getPluginWithName:forFilter:delegate:info:options:]")) == 0)
  {
    FudLog();
LABEL_11:
    FudLog();
    return 0;
  }
  id v13 = +[FudUtilities copyPluginAtURL:v12 forFilter:a4 delegate:a5 info:a6 options:a7 bundleVersion:&v17];
  if (!v13)
  {
    [0 setDelegate:a5];
    goto LABEL_11;
  }
  long long v14 = v13;
  id v15 = v13;
  [v14 setDelegate:a5];
  if (a6 && *a6 && [*a6 objectForKey:@"AccessoryIdentifier"]) {
    a4 = [*a6 objectForKey:@"AccessoryIdentifier"];
  }
  v18[0] = @"pluginName";
  v18[1] = @"modelName";
  v19[0] = a3;
  v19[1] = a4;
  +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  FudLog();
  AnalyticsSendEvent();
  return v14;
}

- (id)getStorage
{
  return self->storage;
}

- (void)stepWillBegin:(int)a3 stateMachine:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  FudLog();
  if (-[FudIpcDispatch shouldBlockCriticalSectionDuringStep:](self, "shouldBlockCriticalSectionDuringStep:", v5, "-[FudIpcDispatch stepWillBegin:stateMachine:]"))
  {
    [(FudIpcDispatch *)self aquireCriticalSectionLock];
  }
  if (self->isActive)
  {
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A7C0;
    block[3] = &unk_10007D700;
    int v9 = v5;
    block[4] = a4;
    void block[5] = self;
    dispatch_sync(workQueue, block);
  }
}

- (void)queueUpEventForAccessory:(id)a3 stateMachine:(id)a4
{
  FudLog();
  workQueue = self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A8F4;
  block[3] = &unk_10007D500;
  block[4] = a4;
  void block[5] = a3;
  void block[6] = self;
  dispatch_sync(workQueue, block);
}

- (void)stepComplete:(int)a3 stateMachine:(id)a4 status:(BOOL)a5 error:(id)a6 info:(id)a7
{
  FudLog();
  objc_msgSend(a4, "stateMachinePluginName", "-[FudIpcDispatch stepComplete:stateMachine:status:error:info:]");
  FudLog();
  if (self->isActive)
  {
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AB28;
    block[3] = &unk_10007D728;
    int v15 = a3;
    block[4] = a4;
    void block[5] = self;
    BOOL v16 = a5;
    void block[6] = a7;
    void block[7] = a6;
    dispatch_sync(workQueue, block);
  }
}

- (void)stepProgress:(int)a3 stateMachine:(id)a4 progress:(double)a5 overallProgress:(double)a6
{
  FudLog();
  if (self->isActive)
  {
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B170;
    block[3] = &unk_10007D750;
    int v13 = a3;
    block[4] = a4;
    void block[5] = self;
    *(double *)&void block[6] = a5;
    *(double *)&void block[7] = a6;
    dispatch_sync(workQueue, block);
  }
}

- (void)accessoryDisconnected:(id)a3 error:(id)a4
{
  FudLog();
  if (self->isActive)
  {
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B5B8;
    block[3] = &unk_10007D500;
    block[4] = a3;
    void block[5] = self;
    void block[6] = a4;
    dispatch_sync(workQueue, block);
  }
}

- (void)dealloc
{
  workQueue = self->workQueue;
  if (workQueue)
  {
    self->isActive = 0;
    dispatch_sync(workQueue, &stru_10007D770);
    dispatch_release((dispatch_object_t)self->workQueue);
  }
  storage = self->storage;
  if (storage) {

  }
  eventFlags = self->eventFlags;
  if (eventFlags) {

  }
  queuedEvents = self->queuedEvents;
  if (queuedEvents) {

  }
  v7.receiver = self;
  v7.super_class = (Class)FudIpcDispatch;
  [(FudIpcDispatch *)&v7 dealloc];
}

- (void)issueNotification:(id)a3 request:(id)a4
{
  FudLog();
  if (self->isActive)
  {
    id v7 = a4;
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B968;
    block[3] = &unk_10007D500;
    block[4] = a3;
    void block[5] = self;
    void block[6] = v7;
    dispatch_sync(workQueue, block);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->workQueue;
}

@end