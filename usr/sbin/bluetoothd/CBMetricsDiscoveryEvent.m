@interface CBMetricsDiscoveryEvent
- (NSString)action;
- (NSString)appID;
- (double)timestamp;
- (int)pid;
- (int)scanRate;
- (unint64_t)discoveryFlags;
- (unsigned)clientID;
- (void)setAction:(id)a3;
- (void)setAppID:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setPid:(int)a3;
- (void)setScanRate:(int)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CBMetricsDiscoveryEvent

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)scanRate
{
  return self->_scanRate;
}

- (void)setScanRate:(int)a3
{
  self->_scanRate = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end