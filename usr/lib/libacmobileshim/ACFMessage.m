@interface ACFMessage
+ (id)message;
+ (id)messageWithIdentifier:(id)a3;
+ (id)messageWithInfo:(id)a3;
- (ACFMessage)initWithCoder:(id)a3;
- (ACFMessage)initWithInfo:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)error;
- (id)errorMessage;
- (id)identifier;
- (id)info;
- (id)mutableInfo;
- (id)objectForKey:(id)a3;
- (id)senderPortName;
- (id)senderProcessName;
- (int)senderProcessID;
- (int64_t)errorCode;
- (void)clearError;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setError:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfo:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSenderPortName:(id)a3;
- (void)setSenderProcessID:(int)a3;
- (void)setSenderProcessName:(id)a3;
@end

@implementation ACFMessage

+ (id)message
{
  return (id)[a1 messageWithInfo:0];
}

+ (id)messageWithInfo:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithInfo:a3];

  return v3;
}

- (ACFMessage)initWithInfo:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACFMessage;
  v4 = [(ACFMessage *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ACFMessage *)v4 setInfo:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ACFMessage;
  [(ACFMessage *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [objc_opt_class() messageWithInfo:[-[ACFMessage info](self, "info") copyWithZone:a3]];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    mutableInfo = self->_mutableInfo;
    [a3 encodeObject:mutableInfo forKey:@"ACFMessageInfo"];
  }
}

- (ACFMessage)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACFMessage;
  v4 = [(ACFMessage *)&v6 init];
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      v4->_mutableInfo = (NSMutableDictionary *)[[(id)objc_msgSend(a3, "decodeObjectForKey:", @"ACFMessageInfo") mutableCopy];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)info
{
  return self->_mutableInfo;
}

- (void)setInfo:(id)a3
{
  mutableInfo = self->_mutableInfo;
  if (mutableInfo != a3)
  {

    self->_mutableInfo = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  }
}

- (id)mutableInfo
{
  id result = self->_mutableInfo;
  if (!result)
  {
    id result = (id)objc_opt_new();
    self->_mutableInfo = (NSMutableDictionary *)result;
  }
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    if (a3)
    {
      id v6 = [(ACFMessage *)self mutableInfo];
      [v6 setObject:a3 forKey:a4];
    }
    else
    {
      [(ACFMessage *)self removeObjectForKey:a4];
    }
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACFMessage setObject:forKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFMessage.m", 130, 0, "Attempt to add object with nil key!");
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = [(ACFMessage *)self mutableInfo];

  [v4 removeObjectForKey:a3];
}

- (id)objectForKey:(id)a3
{
  id v4 = [(ACFMessage *)self info];

  return (id)[v4 objectForKey:a3];
}

+ (id)messageWithIdentifier:(id)a3
{
  id v4 = (void *)[a1 message];
  [v4 setIdentifier:a3];
  return v4;
}

- (id)identifier
{
  return [(ACFMessage *)self objectForKey:@"ACFMessageIdentifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (id)error
{
  return [(ACFMessage *)self objectForKey:@"ACFMessageError"];
}

- (void)setError:(id)a3
{
}

- (void)clearError
{
}

- (int64_t)errorCode
{
  id v2 = [(ACFMessage *)self objectForKey:@"ACFMessageError"];

  return [v2 code];
}

- (id)errorMessage
{
  id v2 = [(ACFMessage *)self error];
  return (id)[NSString stringWithFormat:@"%@  %@", [v2 localizedDescription], [v2 localizedRecoverySuggestion]];
}

- (int)senderProcessID
{
  id v2 = [(ACFMessage *)self objectForKey:@"ACFMessageSenderPID"];

  return [v2 intValue];
}

- (id)senderProcessName
{
  return [(ACFMessage *)self objectForKey:@"ACFMessageSenderProcessName"];
}

- (id)senderPortName
{
  return [(ACFMessage *)self objectForKey:@"ACFMessageSenderPortName"];
}

- (void)setSenderProcessID:(int)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];

  [(ACFMessage *)self setObject:v4 forKey:@"ACFMessageSenderPID"];
}

- (void)setSenderProcessName:(id)a3
{
}

- (void)setSenderPortName:(id)a3
{
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p (identifier = %@; error = %@; infoKeys = %@)>",
                       NSStringFromClass(v4),
                       self,
                       [(ACFMessage *)self identifier],
                       [(ACFMessage *)self error],
                       [(-[ACFMessage info](self, "info")) allKeys]);
}

@end