@interface W5WiFiPerfLoggingRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWiFiPerfLoggingRequest:(id)a3;
- (NSDictionary)configuration;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5WiFiPerfLoggingRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (unint64_t)hash;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setReply:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5WiFiPerfLoggingRequest

- (W5WiFiPerfLoggingRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiPerfLoggingRequest;
  v2 = [(W5WiFiPerfLoggingRequest *)&v5 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:@"com.apple.wifivelocity.W5WiFiPerfLoggingRequest" transaction:v3];
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:self->_transaction];

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiPerfLoggingRequest;
  [(W5WiFiPerfLoggingRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v3 appendFormat:@"UUID: %@\n", self->_uuid];
  [(NSMutableString *)v3 appendFormat:@"Configuration: %@\n", self->_configuration];
  id v4 = [(NSMutableString *)v3 copy];

  return v4;
}

- (BOOL)isEqualToWiFiPerfLoggingRequest:(id)a3
{
  uuid = self->_uuid;
  id v4 = [a3 uuid];

  return [(NSUUID *)uuid isEqual:v4];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(W5WiFiPerfLoggingRequest *)self isEqualToWiFiPerfLoggingRequest:a3];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5WiFiPerfLoggingRequest allocWithZone:a3] init];
  [(W5WiFiPerfLoggingRequest *)v4 setUuid:self->_uuid];
  [(W5WiFiPerfLoggingRequest *)v4 setConfiguration:self->_configuration];
  [(W5WiFiPerfLoggingRequest *)v4 setReply:self->_reply];
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end