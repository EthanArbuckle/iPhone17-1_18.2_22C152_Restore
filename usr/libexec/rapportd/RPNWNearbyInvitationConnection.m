@interface RPNWNearbyInvitationConnection
+ (void)addConnection:(id)a3;
+ (void)initialize;
+ (void)listConnections:(id)a3;
+ (void)removeConnection:(id)a3;
- (BOOL)inbound;
- (BOOL)internal;
- (BOOL)isConnected;
- (NSString)applicationService;
- (NSUUID)connectionUUID;
- (NSUUID)endpointUUID;
- (OS_nw_framer)framer;
- (RPNWNearbyInvitationConnection)init;
- (RPNWNearbyInvitationConnection)initWithPeer:(id)a3 session:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9;
- (RPNWNearbyInvitationPeer)peer;
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
- (void)setPeer:(id)a3;
@end

@implementation RPNWNearbyInvitationConnection

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    id v4 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:5 capacity:10];
    v5 = (void *)qword_100142E68;
    qword_100142E68 = (uint64_t)v4;
  }
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  endpointUUID = self->_endpointUUID;
  connectionUUID = self->_connectionUUID;
  if (self->_inbound) {
    v6 = "IN";
  }
  else {
    v6 = "OUT";
  }
  if (self->_isConnected) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  peer = self->_peer;
  applicationService = self->_applicationService;
  v10 = self->_framer;
  id v11 = objc_alloc_init((Class)NSMutableString);
  [v11 appendFormat:@"%p", v10];

  [v3 appendFormat:@"CONN[%@] (%s): appSvc=%@ connected=%s EP={%@:%@} framer=%@", connectionUUID, v6, applicationService, v7, peer, endpointUUID, v11];

  return v3;
}

- (RPNWNearbyInvitationConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPNWNearbyInvitationConnection;
  v2 = [(RPNWNearbyInvitationConnection *)&v5 init];
  if (v2)
  {
    +[RPNWNearbyInvitationConnection addConnection:v2];
    id v3 = v2;
  }

  return v2;
}

- (RPNWNearbyInvitationConnection)initWithPeer:(id)a3 session:(id)a4 inbound:(BOOL)a5 internal:(BOOL)a6 applicationService:(id)a7 connectionID:(id)a8 endpointID:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)RPNWNearbyInvitationConnection;
  v20 = [(RPNWNearbyInvitationConnection *)&v27 init];
  v21 = v20;
  if (v20)
  {
    [(RPNWNearbyInvitationConnection *)v20 setInbound:v12];
    [(RPNWNearbyInvitationConnection *)v21 setInternal:v11];
    [(RPNWNearbyInvitationConnection *)v21 setApplicationService:v17];
    [(RPNWNearbyInvitationConnection *)v21 setConnectionUUID:v18];
    [(RPNWNearbyInvitationConnection *)v21 setEndpointUUID:v19];
    v22 = objc_alloc_init(RPNWNearbyInvitationPeer);
    [(RPNWNearbyInvitationConnection *)v21 setPeer:v22];

    v23 = [(RPNWNearbyInvitationConnection *)v21 peer];
    [v23 setDestinationDevice:v15];

    v24 = [(RPNWNearbyInvitationConnection *)v21 peer];
    [v24 setNearbyInvitationSession:v16];

    +[RPNWNearbyInvitationConnection addConnection:v21];
    v25 = v21;
  }

  return v21;
}

- (void)dealloc
{
  +[RPNWNearbyInvitationConnection removeConnection:self];
  v3.receiver = self;
  v3.super_class = (Class)RPNWNearbyInvitationConnection;
  [(RPNWNearbyInvitationConnection *)&v3 dealloc];
}

- (void)sendStatusUpdate:(int)a3
{
}

+ (void)addConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100141E58 <= 30)
  {
    if (dword_100141E58 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v8, v4))
    {
      v7 = [v3 connectionUUID];
      LogPrintF();

      id v3 = v8;
    }
  }
  objc_super v5 = (void *)qword_100142E68;
  v6 = [v3 connectionUUID];
  [v5 setObject:v8 forKey:v6];
}

+ (void)removeConnection:(id)a3
{
  id v3 = a3;
  id v8 = v3;
  if (dword_100141E58 <= 30)
  {
    if (dword_100141E58 != -1 || (v4 = _LogCategory_Initialize(), id v3 = v8, v4))
    {
      v7 = [v3 connectionUUID];
      LogPrintF();

      id v3 = v8;
    }
  }
  objc_super v5 = (void *)qword_100142E68;
  v6 = [v3 connectionUUID:v7];
  [v5 removeObjectForKey:v6];
}

+ (void)listConnections:(id)a3
{
  id v3 = a3;
  [v3 appendString:@"Connections\n"];
  if ([(id)qword_100142E68 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = (id)qword_100142E68;
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
          v9 = [(id)qword_100142E68 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
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

- (RPNWNearbyInvitationPeer)peer
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_framer, 0);

  objc_storeStrong((id *)&self->_applicationService, 0);
}

@end