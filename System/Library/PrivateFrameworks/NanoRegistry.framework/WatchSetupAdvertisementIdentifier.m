@interface WatchSetupAdvertisementIdentifier
+ (BOOL)_consistencyCheckForAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6;
- (NSString)humanReadableName;
- (WatchSetupAdvertisementIdentifier)initWithAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6;
- (WatchSetupAdvertisementIdentifier)initWithPackedIdentifierData:(id)a3;
- (id)packedIdentifierData;
- (unsigned)advertisingIdentifier;
- (unsigned)deviceSize;
- (unsigned)enclosureMaterial;
- (unsigned)pairingStrategy;
@end

@implementation WatchSetupAdvertisementIdentifier

- (WatchSetupAdvertisementIdentifier)initWithAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6
{
  if (+[WatchSetupAdvertisementIdentifier _consistencyCheckForAdvertisingIdentifier:pairingStrategy:deviceSize:enclosureMaterial:](WatchSetupAdvertisementIdentifier, "_consistencyCheckForAdvertisingIdentifier:pairingStrategy:deviceSize:enclosureMaterial:"))
  {
    v14.receiver = self;
    v14.super_class = (Class)WatchSetupAdvertisementIdentifier;
    v11 = [(WatchSetupAdvertisementIdentifier *)&v14 init];
    if (v11)
    {
      v11->_advertisingIdentifier = a3;
      v11->_pairingStrategy = a4;
      v11->_deviceSize = a5;
      v11->_enclosureMaterial = a6;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WatchSetupAdvertisementIdentifier)initWithPackedIdentifierData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length] == 4)
  {
    v15.receiver = self;
    v15.super_class = (Class)WatchSetupAdvertisementIdentifier;
    v5 = [(WatchSetupAdvertisementIdentifier *)&v15 init];
    if (v5)
    {
      *(_DWORD *)buf = 0;
      [v4 getBytes:buf length:4];
      unsigned int v6 = buf[0];
      v5->_pairingStrategy = buf[0] >> 5;
      uint8_t v7 = buf[2];
      HIDWORD(v9) = buf[1];
      LODWORD(v9) = buf[2] << 24;
      int v8 = v9 >> 28;
      HIDWORD(v9) = v6;
      LODWORD(v9) = buf[1] << 24;
      v5->_advertisingIdentifier = bswap32(((v9 >> 28) << 16) | (v8 << 24) | (((v6 >> 4) & 1) << 8));
      LOBYTE(v6) = buf[3];
      v5->_deviceSize = (buf[3] >> 6) & 0xC3 | (4 * (v7 & 0xF));
      v5->_enclosureMaterial = v6 & 0x3F;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v11 = nr_framework_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = nr_framework_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v17 = 4;
        __int16 v18 = 2048;
        uint64_t v19 = [v4 length];
        _os_log_error_impl(&dword_1A356E000, v13, OS_LOG_TYPE_ERROR, "Incorrect size of packed identifier data, expecting %lu but got %lu", buf, 0x16u);
      }
    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_consistencyCheckForAdvertisingIdentifier:(unsigned int)a3 pairingStrategy:(unsigned __int8)a4 deviceSize:(unsigned __int8)a5 enclosureMaterial:(unsigned __int8)a6
{
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  unsigned int v8 = a4;
  unint64_t v10 = [@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890" length];
  BOOL v11 = 0;
  if (a3 >> 5 <= 0xC34 && !(a3 >> 17) && v8 <= 7)
  {
    BOOL v12 = v10 > v7 && v10 > v6;
    BOOL v13 = v10 > v8 && v12;
    return (v6 | v7) <= 0x3F && v13;
  }
  return v11;
}

- (id)packedIdentifierData
{
  unsigned int v2 = bswap32(self->_advertisingIdentifier);
  v7[0] = (v2 >> 4) & 0x10 | (v2 >> 20) & 0xF | (32 * self->_pairingStrategy);
  HIDWORD(v3) = HIWORD(v2);
  LODWORD(v3) = v2;
  v7[1] = v3 >> 28;
  unsigned __int8 deviceSize = self->_deviceSize;
  v7[2] = (v2 >> 20) & 0xF0 | (deviceSize >> 2) & 0xF;
  v7[3] = self->_enclosureMaterial & 0x3F | (deviceSize << 6);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:4];

  return v5;
}

- (NSString)humanReadableName
{
  uint64_t advertisingIdentifier = self->_advertisingIdentifier;
  id v4 = _NRStringRepresentationFromInteger(self->_pairingStrategy);
  v5 = _NRStringRepresentationFromInteger(self->_enclosureMaterial);
  uint64_t v6 = _NRStringRepresentationFromInteger(self->_deviceSize);
  unsigned int v7 = (void *)v6;
  if (advertisingIdentifier >> 5 > 0xC34 || v4 == 0 || v5 == 0 || v6 == 0) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = (void *)[[NSString alloc] initWithFormat:@"%05lu%@%@%@", advertisingIdentifier, v4, v5, v6];
  }

  return (NSString *)v11;
}

- (unsigned)pairingStrategy
{
  return self->_pairingStrategy;
}

- (unsigned)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (unsigned)deviceSize
{
  return self->_deviceSize;
}

- (unsigned)enclosureMaterial
{
  return self->_enclosureMaterial;
}

@end