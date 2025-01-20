@interface W5WiFiSnifferRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToWiFiSnifferRequest:(id)a3;
- (BOOL)monitorMode;
- (BOOL)noAutoStop;
- (BOOL)tcpDump;
- (NSURL)outputFile;
- (NSUUID)uuid;
- (OS_os_transaction)transaction;
- (W5WiFiChannel)channel;
- (W5WiFiSnifferRequest)init;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reply;
- (int64_t)maxFiles;
- (int64_t)maxSize;
- (int64_t)rotationInterval;
- (int64_t)snaplen;
- (unint64_t)hash;
- (void)dealloc;
- (void)setChannel:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMaxFiles:(int64_t)a3;
- (void)setMaxSize:(int64_t)a3;
- (void)setMonitorMode:(BOOL)a3;
- (void)setNoAutoStop:(BOOL)a3;
- (void)setOutputFile:(id)a3;
- (void)setReply:(id)a3;
- (void)setRotationInterval:(int64_t)a3;
- (void)setSnaplen:(int64_t)a3;
- (void)setTcpDump:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5WiFiSnifferRequest

- (W5WiFiSnifferRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiSnifferRequest;
  v2 = [(W5WiFiSnifferRequest *)&v5 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:@"com.apple.wifivelocity.W5WiFiSnifferRequest" transaction:v3];
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionComplete:self->_transaction];

  self->_transaction = 0;
  v3.receiver = self;
  v3.super_class = (Class)W5WiFiSnifferRequest;
  [(W5WiFiSnifferRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v3 appendFormat:@"UUID: %@\n", self->_uuid];
  [(NSMutableString *)v3 appendFormat:@"Channel: %ld (%@)\n", [(W5WiFiChannel *)self->_channel channel], W5DescriptionForChannelWidth()];
  id v4 = [(NSMutableString *)v3 copy];

  return v4;
}

- (BOOL)isEqualToWiFiSnifferRequest:(id)a3
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

  return [(W5WiFiSnifferRequest *)self isEqualToWiFiSnifferRequest:a3];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[W5WiFiSnifferRequest allocWithZone:a3] init];
  [(W5WiFiSnifferRequest *)v4 setUuid:self->_uuid];
  [(W5WiFiSnifferRequest *)v4 setChannel:self->_channel];
  [(W5WiFiSnifferRequest *)v4 setDuration:self->_duration];
  [(W5WiFiSnifferRequest *)v4 setOutputFile:self->_outputFile];
  [(W5WiFiSnifferRequest *)v4 setReply:self->_reply];
  [(W5WiFiSnifferRequest *)v4 setMonitorMode:self->_monitorMode];
  [(W5WiFiSnifferRequest *)v4 setTcpDump:self->_tcpDump];
  [(W5WiFiSnifferRequest *)v4 setSnaplen:self->_snaplen];
  [(W5WiFiSnifferRequest *)v4 setNoAutoStop:self->_noAutoStop];
  [(W5WiFiSnifferRequest *)v4 setRotationInterval:self->_rotationInterval];
  [(W5WiFiSnifferRequest *)v4 setMaxSize:self->_maxSize];
  [(W5WiFiSnifferRequest *)v4 setMaxFiles:self->_maxFiles];
  return v4;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)monitorMode
{
  return self->_monitorMode;
}

- (void)setMonitorMode:(BOOL)a3
{
  self->_monitorMode = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (W5WiFiChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSURL)outputFile
{
  return self->_outputFile;
}

- (void)setOutputFile:(id)a3
{
}

- (BOOL)tcpDump
{
  return self->_tcpDump;
}

- (void)setTcpDump:(BOOL)a3
{
  self->_tcpDump = a3;
}

- (BOOL)noAutoStop
{
  return self->_noAutoStop;
}

- (void)setNoAutoStop:(BOOL)a3
{
  self->_noAutoStop = a3;
}

- (int64_t)snaplen
{
  return self->_snaplen;
}

- (void)setSnaplen:(int64_t)a3
{
  self->_snaplen = a3;
}

- (int64_t)rotationInterval
{
  return self->_rotationInterval;
}

- (void)setRotationInterval:(int64_t)a3
{
  self->_rotationInterval = a3;
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(int64_t)a3
{
  self->_maxSize = a3;
}

- (int64_t)maxFiles
{
  return self->_maxFiles;
}

- (void)setMaxFiles:(int64_t)a3
{
  self->_maxFiles = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

@end