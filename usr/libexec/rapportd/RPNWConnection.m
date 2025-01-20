@interface RPNWConnection
+ (void)addConnection:(id)a3;
+ (void)initialize;
+ (void)listConnections:(id)a3;
+ (void)removeConnection:(id)a3;
+ (void)stopAllOutgoingConnectionsNotForPeer:(id)a3;
- (BOOL)inbound;
- (BOOL)internal;
- (BOOL)isConnected;
- (NSMutableData)outgoingBuffer;
- (NSNumber)version;
- (NSString)applicationService;
- (NSUUID)connectionUUID;
- (NSUUID)endpointUUID;
- (OS_nw_framer)framer;
- (RPNWConnection)init;
- (RPNWConnection)initWithPeer:(id)a3 version:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9;
- (RPNWPeer)peer;
- (id)description;
- (void)dealloc;
- (void)sendStatusUpdate:(int)a3;
- (void)setApplicationService:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setFramer:(id)a3;
- (void)setInbound:(BOOL)a3;
- (void)setInternal:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setOutgoingBuffer:(id)a3;
- (void)setPeer:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation RPNWConnection

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:5 capacity:10];
    v5 = (void *)qword_100142CE0;
    qword_100142CE0 = (uint64_t)v4;
  }
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  connectionUUID = self->_connectionUUID;
  if (self->_inbound) {
    v5 = "IN";
  }
  else {
    v5 = "OUT";
  }
  [(NSNumber *)self->_version doubleValue];
  uint64_t v7 = v6;
  applicationService = self->_applicationService;
  if (self->_isConnected) {
    v9 = "yes";
  }
  else {
    v9 = "no";
  }
  v10 = [(RPNWPeer *)self->_peer destinationDevice];
  v11 = [v10 name];
  endpointUUID = self->_endpointUUID;
  v13 = self->_framer;
  id v14 = objc_alloc_init((Class)NSMutableString);
  [v14 appendFormat:@"%p", v13];

  [v3 appendFormat:@"CONN[%@] (%s): version=%.2f appSvc=%@ connected=%s EP={%@:%@} framer=%@", connectionUUID, v5, v7, applicationService, v9, v11, endpointUUID, v14];

  return v3;
}

- (RPNWConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPNWConnection;
  v2 = [(RPNWConnection *)&v5 init];
  if (v2)
  {
    +[RPNWConnection addConnection:v2];
    id v3 = v2;
  }

  return v2;
}

- (RPNWConnection)initWithPeer:(id)a3 version:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v26.receiver = self;
  v26.super_class = (Class)RPNWConnection;
  v20 = [(RPNWConnection *)&v26 init];
  v21 = v20;
  if (v20)
  {
    [(RPNWConnection *)v20 setVersion:v16];
    [(RPNWConnection *)v21 setInbound:v12];
    [(RPNWConnection *)v21 setInternal:v11];
    [(RPNWConnection *)v21 setApplicationService:v17];
    [(RPNWConnection *)v21 setConnectionUUID:v18];
    [(RPNWConnection *)v21 setEndpointUUID:v19];
    v22 = objc_alloc_init(RPNWPeer);
    [(RPNWConnection *)v21 setPeer:v22];

    v23 = [(RPNWConnection *)v21 peer];
    [v23 setDestinationDevice:v15];

    +[RPNWConnection addConnection:v21];
    v24 = v21;
  }

  return v21;
}

- (void)dealloc
{
  +[RPNWConnection removeConnection:self];
  id v3 = [(RPNWConnection *)self endpointUUID];
  +[RPNWEndpoint ageOutEndpointMapping:v3];

  v4.receiver = self;
  v4.super_class = (Class)RPNWConnection;
  [(RPNWConnection *)&v4 dealloc];
}

- (void)sendStatusUpdate:(int)a3
{
}

+ (void)addConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100141698 <= 30)
  {
    if (dword_100141698 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v8, v4))
    {
      uint64_t v7 = [v3 connectionUUID];
      LogPrintF();

      id v3 = v8;
    }
  }
  objc_super v5 = (void *)qword_100142CE0;
  uint64_t v6 = [v3 connectionUUID];
  [v5 setObject:v8 forKey:v6];
}

+ (void)removeConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100141698 <= 30)
  {
    if (dword_100141698 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v8, v4))
    {
      uint64_t v7 = [v3 connectionUUID];
      LogPrintF();

      id v3 = v8;
    }
  }
  objc_super v5 = (void *)qword_100142CE0;
  uint64_t v6 = [v3 connectionUUID];
  [v5 removeObjectForKey:v6];
}

+ (void)stopAllOutgoingConnectionsNotForPeer:(id)a3
{
  id v3 = a3;
  if (dword_100141698 <= 40 && (dword_100141698 != -1 || _LogCategory_Initialize()))
  {
    id v15 = [v3 name];
    LogPrintF();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)qword_100142CE0;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [((id)qword_100142CE0) objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i), v15];
        v10 = v9;
        if (v9)
        {
          if ([v9 isConnected])
          {
            if (([v10 inbound] & 1) == 0
              && ([v10 internal] & 1) == 0)
            {
              BOOL v11 = [v10 peer];
              BOOL v12 = [v11 destinationDevice];
              unsigned __int8 v13 = [v12 isEqualToDevice:v3];

              if ((v13 & 1) == 0)
              {
                if (dword_100141698 <= 30 && (dword_100141698 != -1 || _LogCategory_Initialize()))
                {
                  id v15 = [v10 connectionUUID];
                  LogPrintF();
                }
                id v14 = [v10 framer:v15];
                +[RPNWFramer writeErrorOnFramer:v14 error:50];
              }
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

+ (void)listConnections:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Connections\n"];
  if ([(id)qword_100142CE0 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = (id)qword_100142CE0;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [(id)qword_100142CE0 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
          v10 = v9;
          if (v9)
          {
            BOOL v11 = [v9 description];
            [v3 appendFormat:@"  %@\n", v11];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [v3 appendString:@"  <empty>\n"];
  }
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)inbound
{
  return self->_inbound;
}

- (void)setInbound:(BOOL)a3
{
  self->_inbound = a3;
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (NSString)applicationService
{
  return self->_applicationService;
}

- (void)setApplicationService:(id)a3
{
}

- (OS_nw_framer)framer
{
  return self->_framer;
}

- (void)setFramer:(id)a3
{
}

- (RPNWPeer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
}

- (NSUUID)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSMutableData)outgoingBuffer
{
  return self->_outgoingBuffer;
}

- (void)setOutgoingBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingBuffer, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_framer, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

@end