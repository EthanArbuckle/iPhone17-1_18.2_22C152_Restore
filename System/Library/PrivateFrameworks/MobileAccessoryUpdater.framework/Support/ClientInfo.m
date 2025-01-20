@interface ClientInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)didRequestReconnect;
- (BOOL)isInternalClient;
- (BOOL)sendMessage:(id)a3;
- (ClientInfo)initWithCoder:(id)a3;
- (ClientInfo)initWithName:(id)a3 connection:(id)a4;
- (ClientInfo)initWithName:(id)a3 connection:(id)a4 isInternalClient:(BOOL)a5;
- (NSString)name;
- (OS_xpc_object)connection;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDidRequestReconnect:(BOOL)a3;
- (void)setIsInternalClient:(BOOL)a3;
@end

@implementation ClientInfo

- (ClientInfo)initWithName:(id)a3 connection:(id)a4
{
  return [(ClientInfo *)self initWithName:a3 connection:a4 isInternalClient:0];
}

- (ClientInfo)initWithName:(id)a3 connection:(id)a4 isInternalClient:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)ClientInfo;
  id v8 = [(ClientInfo *)&v12 init];
  *((void *)v8 + 4) = 0;
  *((_WORD *)v8 + 20) = 0;
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *((unsigned char *)v8 + 42) = a5;
  if (a3)
  {
    *((void *)v8 + 1) = a3;
    v9 = +[NSString stringWithFormat:@"%@.events", a3];
    *((void *)v8 + 3) = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    *((void *)v8 + 2) = dispatch_queue_create([(NSString *)v9 cStringUsingEncoding:4], *((dispatch_queue_attr_t *)v8 + 3));
    [v8 setConnection:a4];
  }
  else
  {
    FudLog();
    id v11 = v8;
    return 0;
  }
  return (ClientInfo *)v8;
}

- (void)setConnection:(id)a3
{
  objc_sync_enter(self);
  if ([(ClientInfo *)self isInternalClient]) {
    goto LABEL_15;
  }
  connection = self->connection;
  if (a3)
  {
    if (connection && connection == a3) {
      goto LABEL_15;
    }
    self->connection = (OS_xpc_object *)a3;
    xpc_retain(a3);
    if (!connection) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  self->connection = 0;
  if (connection) {
LABEL_8:
  }
    xpc_release(connection);
LABEL_9:
  p_didSuspendEventQueue = &self->didSuspendEventQueue;
  if (self->connection)
  {
    if (!self->didSuspendEventQueue) {
      goto LABEL_15;
    }
    FudLog();
    dispatch_resume((dispatch_object_t)self->eventQueue);
  }
  else
  {
    if (self->didSuspendEventQueue) {
      goto LABEL_15;
    }
    FudLog();
    dispatch_suspend((dispatch_object_t)self->eventQueue);
    self->didSuspendEventQueue = 1;
    p_didSuspendEventQueue = &self->didRequestReconnect;
  }
  BOOL *p_didSuspendEventQueue = 0;
LABEL_15:
  objc_sync_exit(self);
}

- (BOOL)sendMessage:(id)a3
{
  if (a3 && (v5 = [(NSString *)self->name cStringUsingEncoding:4]) != 0)
  {
    xpc_dictionary_set_string(a3, "ClientIdentifier", v5);
    objc_sync_enter(self);
    if ([(ClientInfo *)self isInternalClient])
    {
      sendMessageToInternalClient();
    }
    else
    {
      if (!self->connection && !self->didRequestReconnect)
      {
        FudLog();
        [(ClientInfo *)self setConnection:0];
        +[FudUtilities postNotification:self->name];
        [(ClientInfo *)self setDidRequestReconnect:1];
      }
      eventQueue = self->eventQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000266B8;
      v8[3] = &unk_10007D4B0;
      v8[4] = self;
      v8[5] = a3;
      dispatch_async(eventQueue, v8);
    }
    objc_sync_exit(self);
    return 1;
  }
  else
  {
    FudLog();
    return 0;
  }
}

- (void)dealloc
{
  connection = self->connection;
  if (connection) {
    xpc_release(connection);
  }
  eventQueue = self->eventQueue;
  if (eventQueue)
  {
    if (self->didSuspendEventQueue)
    {
      dispatch_resume(eventQueue);
      eventQueue = self->eventQueue;
    }
    dispatch_release(eventQueue);
  }
  name = self->name;
  if (name) {

  }
  v6.receiver = self;
  v6.super_class = (Class)ClientInfo;
  [(ClientInfo *)&v6 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ClientInfo)initWithCoder:(id)a3
{
  if (!a3) {
    goto LABEL_8;
  }
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
  if (!v5) {
    goto LABEL_8;
  }
  result = -[ClientInfo initWithName:connection:isInternalClient:](self, "initWithName:connection:isInternalClient:", v5, 0, [a3 decodeBoolForKey:@"IsInternalClient"]);
  if (!result)
  {
    self = 0;
LABEL_8:
    FudLog();
    v7 = self;
    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (a3)
  {
    [a3 encodeObject:self->name forKey:@"Name"];
    BOOL isInternalClient = self->isInternalClient;
    [a3 encodeBool:isInternalClient forKey:@"IsInternalClient"];
  }
  else
  {
    FudLog();
  }
}

- (NSString)name
{
  return self->name;
}

- (OS_xpc_object)connection
{
  return self->connection;
}

- (BOOL)didRequestReconnect
{
  return self->didRequestReconnect;
}

- (void)setDidRequestReconnect:(BOOL)a3
{
  self->didRequestReconnect = a3;
}

- (BOOL)isInternalClient
{
  return self->isInternalClient;
}

- (void)setIsInternalClient:(BOOL)a3
{
  self->BOOL isInternalClient = a3;
}

@end