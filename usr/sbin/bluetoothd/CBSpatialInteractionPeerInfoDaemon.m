@interface CBSpatialInteractionPeerInfoDaemon
- (NSData)identifierData;
- (NSData)irkData;
- (NSData)tokenData;
- (unsigned)peerID;
- (void)setIdentifierData:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setPeerID:(unsigned int)a3;
- (void)setTokenData:(id)a3;
@end

@implementation CBSpatialInteractionPeerInfoDaemon

- (NSData)identifierData
{
  return self->_identifierData;
}

- (void)setIdentifierData:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (unsigned)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(unsigned int)a3
{
  self->_peerID = a3;
}

- (NSData)tokenData
{
  return self->_tokenData;
}

- (void)setTokenData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenData, 0);
  objc_storeStrong((id *)&self->_irkData, 0);

  objc_storeStrong((id *)&self->_identifierData, 0);
}

@end