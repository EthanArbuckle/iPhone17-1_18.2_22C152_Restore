@interface HAPAccessoryProtocolInfo
- (HAPAccessoryProtocolInfo)initWithIdentifier:(id)a3 currentStateNumber:(id)a4 currentConfigNumber:(id)a5 modelName:(id)a6 protocolVersion:(id)a7 authMethods:(unsigned __int8)a8 statusFlags:(unsigned __int8)a9 categoryIdentifier:(unsigned __int16)a10 setupHash:(id)a11;
- (HMFVersion)protocolVersion;
- (NSData)setupHash;
- (NSNumber)currentConfigNumber;
- (NSNumber)currentStateNumber;
- (NSString)deviceIdentifer;
- (NSString)modelName;
- (unsigned)categoryIdentifier;
- (unsigned)featureFlags;
- (unsigned)statusFlags;
@end

@implementation HAPAccessoryProtocolInfo

- (HAPAccessoryProtocolInfo)initWithIdentifier:(id)a3 currentStateNumber:(id)a4 currentConfigNumber:(id)a5 modelName:(id)a6 protocolVersion:(id)a7 authMethods:(unsigned __int8)a8 statusFlags:(unsigned __int8)a9 categoryIdentifier:(unsigned __int16)a10 setupHash:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v19 = a11;
  v27.receiver = self;
  v27.super_class = (Class)HAPAccessoryProtocolInfo;
  v20 = [(HAPAccessoryProtocolInfo *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceIdentifer, a3);
    objc_storeStrong((id *)&v21->_currentStateNumber, a4);
    objc_storeStrong((id *)&v21->_currentConfigNumber, a5);
    objc_storeStrong((id *)&v21->_modelName, a6);
    objc_storeStrong((id *)&v21->_protocolVersion, a7);
    v21->_featureFlags = a8;
    v21->_statusFlags = a9;
    v21->_categoryIdentifier = a10;
    objc_storeStrong((id *)&v21->_setupHash, a11);
  }

  return v21;
}

- (NSString)deviceIdentifer
{
  return self->_deviceIdentifer;
}

- (NSNumber)currentStateNumber
{
  return self->_currentStateNumber;
}

- (NSNumber)currentConfigNumber
{
  return self->_currentConfigNumber;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (HMFVersion)protocolVersion
{
  return self->_protocolVersion;
}

- (unsigned)featureFlags
{
  return self->_featureFlags;
}

- (unsigned)statusFlags
{
  return self->_statusFlags;
}

- (unsigned)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_currentConfigNumber, 0);
  objc_storeStrong((id *)&self->_currentStateNumber, 0);

  objc_storeStrong((id *)&self->_deviceIdentifer, 0);
}

@end