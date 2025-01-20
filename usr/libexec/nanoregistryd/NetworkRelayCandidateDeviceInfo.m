@interface NetworkRelayCandidateDeviceInfo
- (NRWatchPairingExtendedMetadata)extendedMetadata;
- (NSData)identifierData;
- (NetworkRelayCandidateDeviceInfo)initWithIdentifier:(id)a3 extendedMetadata:(id)a4;
- (void)setExtendedMetadata:(id)a3;
- (void)setIdentifierData:(id)a3;
@end

@implementation NetworkRelayCandidateDeviceInfo

- (NetworkRelayCandidateDeviceInfo)initWithIdentifier:(id)a3 extendedMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NetworkRelayCandidateDeviceInfo;
  v9 = [(NetworkRelayCandidateDeviceInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifierData, a3);
    objc_storeStrong((id *)&v10->_extendedMetadata, a4);
  }

  return v10;
}

- (NSData)identifierData
{
  return self->_identifierData;
}

- (void)setIdentifierData:(id)a3
{
}

- (NRWatchPairingExtendedMetadata)extendedMetadata
{
  return self->_extendedMetadata;
}

- (void)setExtendedMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedMetadata, 0);

  objc_storeStrong((id *)&self->_identifierData, 0);
}

@end