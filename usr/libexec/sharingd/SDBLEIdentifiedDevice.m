@interface SDBLEIdentifiedDevice
- (NSData)authTag;
- (NSData)btAddr;
- (NSUUID)identifier;
- (RPIdentity)identity;
- (unint64_t)discoveryFlags;
- (unint64_t)lastUpdateTicks;
- (void)setAuthTag:(id)a3;
- (void)setBtAddr:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setLastUpdateTicks:(unint64_t)a3;
@end

@implementation SDBLEIdentifiedDevice

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
}

- (NSData)btAddr
{
  return self->_btAddr;
}

- (void)setBtAddr:(id)a3
{
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (RPIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (unint64_t)lastUpdateTicks
{
  return self->_lastUpdateTicks;
}

- (void)setLastUpdateTicks:(unint64_t)a3
{
  self->_lastUpdateTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_btAddr, 0);

  objc_storeStrong((id *)&self->_authTag, 0);
}

@end