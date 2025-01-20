@interface SiriCoreNetEventMessage
- (NETSchemaNETClientEvent)clientEvent;
- (NSUUID)netId;
- (unint64_t)timestamp;
- (void)setClientEvent:(id)a3;
- (void)setNetId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation SiriCoreNetEventMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientEvent, 0);

  objc_storeStrong((id *)&self->_netId, 0);
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setClientEvent:(id)a3
{
}

- (NETSchemaNETClientEvent)clientEvent
{
  return self->_clientEvent;
}

- (void)setNetId:(id)a3
{
}

- (NSUUID)netId
{
  return self->_netId;
}

@end