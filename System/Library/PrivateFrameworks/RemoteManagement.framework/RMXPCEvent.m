@interface RMXPCEvent
+ (id)eventKeyForStream:(id)a3 notificationName:(id)a4;
+ (id)newXPCEventForDarwinNotification:(id)a3;
+ (id)newXPCEventForDistributedNotification:(id)a3;
+ (id)newXPCEventForStream:(id)a3 notificationName:(id)a4 descriptor:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (NSDictionary)descriptor;
- (NSString)eventKey;
- (NSString)notificationName;
- (NSString)streamName;
- (RMXPCEvent)initWithStreamName:(id)a3 notificationName:(id)a4 descriptor:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation RMXPCEvent

+ (id)newXPCEventForStream:(id)a3 notificationName:(id)a4 descriptor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[RMXPCEvent alloc] initWithStreamName:v9 notificationName:v8 descriptor:v7];

  return v10;
}

+ (id)newXPCEventForDarwinNotification:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [RMXPCEvent alloc];
  id v8 = @"Notification";
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [(RMXPCEvent *)v4 initWithStreamName:@"com.apple.notifyd.matching" notificationName:v3 descriptor:v5];

  return v6;
}

+ (id)newXPCEventForDistributedNotification:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [RMXPCEvent alloc];
  id v8 = @"Name";
  v9[0] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [(RMXPCEvent *)v4 initWithStreamName:@"com.apple.distnoted.matching" notificationName:v3 descriptor:v5];

  return v6;
}

- (RMXPCEvent)initWithStreamName:(id)a3 notificationName:(id)a4 descriptor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMXPCEvent;
  v12 = [(RMXPCEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_streamName, a3);
    objc_storeStrong((id *)&v13->_notificationName, a4);
    objc_storeStrong((id *)&v13->_descriptor, a5);
  }

  return v13;
}

+ (id)eventKeyForStream:(id)a3 notificationName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@", a3, a4];
}

- (NSString)eventKey
{
  id v3 = [(RMXPCEvent *)self streamName];
  v4 = [(RMXPCEvent *)self notificationName];
  v5 = +[RMXPCEvent eventKeyForStream:v3 notificationName:v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RMXPCEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(RMXPCEvent *)self isEqualToEvent:v4];
  }

  return v5;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RMXPCEvent *)self streamName];
  v6 = [v4 streamName];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(RMXPCEvent *)self notificationName];
    id v8 = [v4 notificationName];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(RMXPCEvent *)self descriptor];
      id v10 = [v4 descriptor];
      char v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(RMXPCEvent *)self streamName];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(RMXPCEvent *)self notificationName];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(RMXPCEvent *)self descriptor];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [RMXPCEvent alloc];
  BOOL v5 = [(RMXPCEvent *)self streamName];
  uint64_t v6 = (void *)[v5 copy];
  id v7 = [(RMXPCEvent *)self notificationName];
  unint64_t v8 = (void *)[v7 copy];
  id v9 = [(RMXPCEvent *)self descriptor];
  id v10 = (void *)[v9 copy];
  char v11 = [(RMXPCEvent *)v4 initWithStreamName:v6 notificationName:v8 descriptor:v10];

  return v11;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (NSDictionary)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

@end