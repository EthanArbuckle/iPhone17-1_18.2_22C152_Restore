@interface EAMatchingPlugin
- (EAMatchingPlugin)initWithModule:(void *)a3;
- (void)accessoryChange:(id)a3 type:(int)a4;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)addClient:(unint64_t)a3 eventMatchDict:(id)a4;
- (void)addClient:(unint64_t)a3 protocol:(id)a4 clientDict:(id)a5;
- (void)dealloc;
- (void)removeClient:(unint64_t)a3;
- (void)removeClient:(unint64_t)a3 clientDict:(id)a4;
- (void)sendAccessoryNotification:(id)a3 client:(unint64_t)a4 notificationTypeKey:(const char *)a5 serialNum:(id)a6;
@end

@implementation EAMatchingPlugin

- (EAMatchingPlugin)initWithModule:(void *)a3
{
  v3 = self;
  if (a3) {
    xpc_event_module_get_aslclient();
  }
  if (self)
  {
    v5 = self;
    return 0;
  }
  return v3;
}

- (void)dealloc
{
}

- (void)addClient:(unint64_t)a3 protocol:(id)a4 clientDict:(id)a5
{
}

- (void)removeClient:(unint64_t)a3 clientDict:(id)a4
{
}

- (void)addClient:(unint64_t)a3 eventMatchDict:(id)a4
{
  if (a4)
  {
    if (xpc_copy_description(a4)) {
      xpc_event_module_get_aslclient();
    }
    string = xpc_dictionary_get_string(a4, "EAMatchingProtocol");
    if (string)
    {
      v8 = +[NSString stringWithCString:string encoding:1];
      if (v8)
      {
        v9 = v8;
        id xdict = a4;
        if (xpc_dictionary_get_BOOL(a4, "EAMatchConnection"))
        {
          accessoryConnectClients = self->_accessoryConnectClients;
          if (!accessoryConnectClients)
          {
            accessoryConnectClients = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
            self->_accessoryConnectClients = accessoryConnectClients;
            if (!accessoryConnectClients) {
              return;
            }
          }
          [(EAMatchingPlugin *)self addClient:a3 protocol:v9 clientDict:accessoryConnectClients];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          obj = [+[EAAccessoryManager sharedAccessoryManager] connectedAccessories];
          id v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v22)
          {
            uint64_t v21 = *(void *)v28;
            do
            {
              v11 = 0;
              do
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
                long long v23 = 0u;
                long long v24 = 0u;
                long long v25 = 0u;
                long long v26 = 0u;
                id v13 = [v12 protocolStrings];
                id v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                if (v14)
                {
                  id v15 = v14;
                  uint64_t v16 = *(void *)v24;
                  do
                  {
                    v17 = 0;
                    do
                    {
                      if (*(void *)v24 != v16) {
                        objc_enumerationMutation(v13);
                      }
                      if ([(NSString *)v9 isEqualToString:*(void *)(*((void *)&v23 + 1) + 8 * (void)v17)])
                      {
                        -[EAMatchingPlugin sendAccessoryNotification:client:notificationTypeKey:serialNum:](self, "sendAccessoryNotification:client:notificationTypeKey:serialNum:", v9, a3, "EAMatchConnection", [v12 serialNumber]);
                      }
                      v17 = (char *)v17 + 1;
                    }
                    while (v15 != v17);
                    id v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                  }
                  while (v15);
                }
                v11 = (char *)v11 + 1;
              }
              while (v11 != v22);
              id v22 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
            }
            while (v22);
          }
        }
        if (xpc_dictionary_get_BOOL(xdict, "EAMatchDisconnection"))
        {
          accessoryDisconnectClients = self->_accessoryDisconnectClients;
          if (accessoryDisconnectClients
            || (accessoryDisconnectClients = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:1], (self->_accessoryDisconnectClients = accessoryDisconnectClients) != 0))
          {
            [(EAMatchingPlugin *)self addClient:a3 protocol:v9 clientDict:accessoryDisconnectClients];
          }
        }
      }
    }
  }
}

- (void)removeClient:(unint64_t)a3
{
}

- (void)sendAccessoryNotification:(id)a3 client:(unint64_t)a4 notificationTypeKey:(const char *)a5 serialNum:(id)a6
{
  if (a3)
  {
    if (a5)
    {
      uint64_t v6 = 0;
      xpc_event_module_get_aslclient();
    }
  }
}

- (void)accessoryChange:(id)a3 type:(int)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = 32;
    if (!a3) {
      return;
    }
  }
  else
  {
    if (a4 != 2) {
      return;
    }
    uint64_t v4 = 40;
    if (!a3) {
      return;
    }
  }
  if (*(Class *)((char *)&self->super.isa + v4))
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = v5;
      if ([v6 protocolStrings])
      {
        objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(objc_msgSend(v6, "protocolStrings"), "count"));
        xpc_event_module_get_aslclient();
      }
    }
  }
}

- (void)accessoryDidConnect:(id)a3
{
}

- (void)accessoryDidDisconnect:(id)a3
{
}

@end