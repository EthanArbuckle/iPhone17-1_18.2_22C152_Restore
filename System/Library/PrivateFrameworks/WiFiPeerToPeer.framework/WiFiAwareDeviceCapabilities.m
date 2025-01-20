@interface WiFiAwareDeviceCapabilities
+ (BOOL)fetchAutoPairingBootstrapBlob:(id *)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)currentDeviceCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsDataTransfer;
- (NSArray)supportedCipherSuites;
- (NSNumber)operatingChannel;
- (NSNumber)operatingClass;
- (NSString)discoveryInterfaceName;
- (WiFiAwareDeviceCapabilities)initWithCoder:(id)a3;
- (WiFiAwareDeviceCapabilities)initWithOperatingChannel:(id)a3 operatingClass:(id)a4 supportedCipherSuites:(id)a5 supportsDataTransfer:(BOOL)a6 supportedBands:(unsigned __int8)a7 discoveryInterfaceName:(id)a8;
- (id)description;
- (unsigned)supportedBands;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiAwareDeviceCapabilities

+ (id)currentDeviceCapabilities
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:1 error:0 querying:&__block_literal_global_1];
}

uint64_t __56__WiFiAwareDeviceCapabilities_currentDeviceCapabilities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryCurrentDeviceCapabilities:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDeviceCapabilities)initWithOperatingChannel:(id)a3 operatingClass:(id)a4 supportedCipherSuites:(id)a5 supportsDataTransfer:(BOOL)a6 supportedBands:(unsigned __int8)a7 discoveryInterfaceName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)WiFiAwareDeviceCapabilities;
  v18 = [(WiFiAwareDeviceCapabilities *)&v28 init];
  if (v18)
  {
    uint64_t v19 = [v16 copy];
    supportedCipherSuites = v18->_supportedCipherSuites;
    v18->_supportedCipherSuites = (NSArray *)v19;

    v18->_supportedBands = a7;
    v18->_supportsDataTransfer = a6;
    uint64_t v21 = [v14 copy];
    operatingChannel = v18->_operatingChannel;
    v18->_operatingChannel = (NSNumber *)v21;

    uint64_t v23 = [v15 copy];
    operatingClass = v18->_operatingClass;
    v18->_operatingClass = (NSNumber *)v23;

    uint64_t v25 = [v17 copy];
    discoveryInterfaceName = v18->_discoveryInterfaceName;
    v18->_discoveryInterfaceName = (NSString *)v25;
  }
  return v18;
}

- (WiFiAwareDeviceCapabilities)initWithCoder:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDeviceCapabilities.supportedBands"];
  uint64_t v6 = [v5 unsignedCharValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDeviceCapabilities.operatingChannel"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDeviceCapabilities.operatingClass"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"WiFiAwareDeviceCapabilities.supportedCipherSuites"];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareDeviceCapabilities.discoveryInterfaceName"];
  uint64_t v14 = [v4 decodeBoolForKey:@"WiFiAwareDeviceCapabilities.supportsDataTransfer"];
  uint64_t v15 = v14;
  if (v12)
  {
    unsigned int v26 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32[0] = v12;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v16 = 0;
        id v17 = 0;
        goto LABEL_7;
      }
      unsigned int v23 = v6;
      v24 = v8;
      uint64_t v25 = v7;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v12;
      uint64_t v19 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        while (2)
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v16);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              id v17 = 0;
              v8 = v24;
              v7 = v25;
              goto LABEL_7;
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v8 = v24;
      v7 = v25;
      uint64_t v6 = v23;
    }
    uint64_t v15 = v26;
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }
  self = [(WiFiAwareDeviceCapabilities *)self initWithOperatingChannel:v7 operatingClass:v8 supportedCipherSuites:v16 supportsDataTransfer:v15 supportedBands:v6 discoveryInterfaceName:v13];
  id v17 = self;
LABEL_7:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(WiFiAwareDeviceCapabilities *)self operatingChannel];
  [v9 encodeObject:v4 forKey:@"WiFiAwareDeviceCapabilities.operatingChannel"];

  v5 = [(WiFiAwareDeviceCapabilities *)self operatingClass];
  [v9 encodeObject:v5 forKey:@"WiFiAwareDeviceCapabilities.operatingClass"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WiFiAwareDeviceCapabilities supportedBands](self, "supportedBands"));
  [v9 encodeObject:v6 forKey:@"WiFiAwareDeviceCapabilities.supportedBands"];

  v7 = [(WiFiAwareDeviceCapabilities *)self supportedCipherSuites];
  [v9 encodeObject:v7 forKey:@"WiFiAwareDeviceCapabilities.supportedCipherSuites"];

  v8 = [(WiFiAwareDeviceCapabilities *)self discoveryInterfaceName];
  [v9 encodeObject:v8 forKey:@"WiFiAwareDeviceCapabilities.discoveryInterfaceName"];

  objc_msgSend(v9, "encodeBool:forKey:", -[WiFiAwareDeviceCapabilities supportsDataTransfer](self, "supportsDataTransfer"), @"WiFiAwareDeviceCapabilities.supportsDataTransfer");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (WiFiAwareDeviceCapabilities *)a3;
  if (self == v6)
  {
    v7 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = v6;
    v8 = [(WiFiAwareDeviceCapabilities *)self operatingChannel];
    id v9 = [(WiFiAwareDeviceCapabilities *)v7 operatingChannel];
    if (v8 != v9)
    {
      v3 = [(WiFiAwareDeviceCapabilities *)self operatingChannel];
      id v4 = [(WiFiAwareDeviceCapabilities *)v7 operatingChannel];
      if (![v3 isEqual:v4])
      {

LABEL_22:
        BOOL v10 = 0;
        goto LABEL_24;
      }
      uint64_t v25 = v3;
    }
    v11 = [(WiFiAwareDeviceCapabilities *)self operatingClass];
    v12 = [(WiFiAwareDeviceCapabilities *)v7 operatingClass];
    if (v11 != v12)
    {
      v13 = [(WiFiAwareDeviceCapabilities *)self operatingClass];
      v3 = [(WiFiAwareDeviceCapabilities *)v7 operatingClass];
      if (![v13 isEqual:v3])
      {
        char v16 = 1;
        goto LABEL_18;
      }
      v24 = v13;
    }
    int v14 = [(WiFiAwareDeviceCapabilities *)self supportedBands];
    if (v14 == [(WiFiAwareDeviceCapabilities *)v7 supportedBands]
      && (BOOL v15 = [(WiFiAwareDeviceCapabilities *)self supportsDataTransfer],
          v15 == [(WiFiAwareDeviceCapabilities *)v7 supportsDataTransfer]))
    {
      v18 = [(WiFiAwareDeviceCapabilities *)self supportedCipherSuites];
      uint64_t v19 = [(WiFiAwareDeviceCapabilities *)v7 supportedCipherSuites];
      if (v18 == (void *)v19)
      {

        char v16 = 0;
      }
      else
      {
        unsigned int v23 = (void *)v19;
        uint64_t v21 = [(WiFiAwareDeviceCapabilities *)self supportedCipherSuites];
        [(WiFiAwareDeviceCapabilities *)v7 supportedCipherSuites];
        uint64_t v20 = v22 = v18;
        char v16 = [v21 isEqual:v20] ^ 1;
      }
    }
    else
    {
      char v16 = 1;
    }
    v13 = v24;
    if (v11 == v12)
    {
LABEL_19:

      if (v8 != v9)
      {
      }
      if (v16) {
        goto LABEL_22;
      }
LABEL_23:
      BOOL v10 = 1;
      goto LABEL_24;
    }
LABEL_18:

    goto LABEL_19;
  }
  BOOL v10 = 0;
  v7 = 0;
LABEL_24:

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwareDeviceCapabilities *)self operatingChannel];
  v5 = [(WiFiAwareDeviceCapabilities *)self operatingClass];
  unsigned int v6 = [(WiFiAwareDeviceCapabilities *)self supportedBands];
  v7 = [(WiFiAwareDeviceCapabilities *)self supportedCipherSuites];
  v8 = [v3 stringWithFormat:@"<WiFiAwareDeviceCapabilities operatingChannel=%@, operatingClass=%@, supportedBands=%u, supportedCipherSuites=%@>", v4, v5, v6, v7];

  return v8;
}

+ (BOOL)fetchAutoPairingBootstrapBlob:(id *)a3 error:(id *)a4
{
  return 0;
}

- (NSNumber)operatingChannel
{
  return self->_operatingChannel;
}

- (NSNumber)operatingClass
{
  return self->_operatingClass;
}

- (NSArray)supportedCipherSuites
{
  return self->_supportedCipherSuites;
}

- (unsigned)supportedBands
{
  return self->_supportedBands;
}

- (BOOL)supportsDataTransfer
{
  return self->_supportsDataTransfer;
}

- (NSString)discoveryInterfaceName
{
  return self->_discoveryInterfaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryInterfaceName, 0);
  objc_storeStrong((id *)&self->_supportedCipherSuites, 0);
  objc_storeStrong((id *)&self->_operatingClass, 0);
  objc_storeStrong((id *)&self->_operatingChannel, 0);
}

@end