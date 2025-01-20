@interface STSCHWiFiAwareDiscoveryChannelInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)channelNumber;
- (NSNumber)operatingClass;
- (NSNumber)supportedBands;
- (STSCHWiFiAwareDiscoveryChannelInfo)initWithCoder:(id)a3;
- (STSCHWiFiAwareDiscoveryChannelInfo)initWithSupportedBands:(id)a3 operatingClass:(id)a4 channelNumber:(id)a5;
- (id)asData;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelNumber:(id)a3;
- (void)setOperatingClass:(id)a3;
- (void)setSupportedBands:(id)a3;
@end

@implementation STSCHWiFiAwareDiscoveryChannelInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  supportedBands = self->_supportedBands;
  id v5 = a3;
  [v5 encodeObject:supportedBands forKey:@"supportedBands"];
  [v5 encodeObject:self->_operatingClass forKey:@"operatingClass"];
  [v5 encodeObject:self->_channelNumber forKey:@"channelNumber"];
}

- (STSCHWiFiAwareDiscoveryChannelInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSCHWiFiAwareDiscoveryChannelInfo;
  id v5 = [(STSCHWiFiAwareDiscoveryChannelInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"supportedBands"];
    supportedBands = v5->_supportedBands;
    v5->_supportedBands = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"operatingClass"];
    operatingClass = v5->_operatingClass;
    v5->_operatingClass = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"channelNumber"];
    channelNumber = v5->_channelNumber;
    v5->_channelNumber = (NSNumber *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSCHWiFiAwareDiscoveryChannelInfo *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        v7 = v6;
        if (self->_supportedBands)
        {
          uint64_t v8 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v6 supportedBands];

          supportedBands = self->_supportedBands;
          if (v8)
          {
            uint64_t v10 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 supportedBands];
            unsigned __int8 v11 = [(NSNumber *)supportedBands isEqual:v10];

            if ((v11 & 1) == 0) {
              goto LABEL_24;
            }
            goto LABEL_12;
          }
          if (supportedBands) {
            goto LABEL_24;
          }
        }
        objc_super v13 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 supportedBands];

        if (v13) {
          goto LABEL_24;
        }
LABEL_12:
        if (self->_operatingClass)
        {
          v14 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 operatingClass];

          operatingClass = self->_operatingClass;
          if (v14)
          {
            v16 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 operatingClass];
            unsigned __int8 v17 = [(NSNumber *)operatingClass isEqual:v16];

            if ((v17 & 1) == 0) {
              goto LABEL_24;
            }
            goto LABEL_18;
          }
          if (operatingClass) {
            goto LABEL_24;
          }
        }
        v18 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 operatingClass];

        if (v18) {
          goto LABEL_24;
        }
LABEL_18:
        if (self->_channelNumber)
        {
          v19 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 channelNumber];

          channelNumber = self->_channelNumber;
          if (v19)
          {
            v21 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 channelNumber];
            unsigned __int8 v22 = [(NSNumber *)channelNumber isEqual:v21];

            if (v22) {
              goto LABEL_27;
            }
            goto LABEL_24;
          }
          if (channelNumber) {
            goto LABEL_24;
          }
        }
        v23 = [(STSCHWiFiAwareDiscoveryChannelInfo *)v7 channelNumber];

        if (!v23)
        {
LABEL_27:
          BOOL v12 = 1;
          goto LABEL_25;
        }
LABEL_24:
        BOOL v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    BOOL v12 = 0;
  }
LABEL_26:

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:@"bands=%@,class=%@,channel=%@", self->_supportedBands, self->_operatingClass, self->_channelNumber];
}

- (STSCHWiFiAwareDiscoveryChannelInfo)initWithSupportedBands:(id)a3 operatingClass:(id)a4 channelNumber:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STSCHWiFiAwareDiscoveryChannelInfo;
  BOOL v12 = [(STSCHWiFiAwareDiscoveryChannelInfo *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_supportedBands, a3);
    objc_storeStrong((id *)&v13->_operatingClass, a4);
    objc_storeStrong((id *)&v13->_channelNumber, a5);
  }

  return v13;
}

- (id)asData
{
  v3 = +[NSMutableData data];
  supportedBands = self->_supportedBands;
  if (supportedBands)
  {
    __int16 v10 = 1026;
    unsigned __int8 v11 = [(NSNumber *)supportedBands intValue];
    [v3 appendBytes:&v10 length:3];
  }
  operatingClass = self->_operatingClass;
  if (operatingClass && self->_channelNumber)
  {
    __int16 v7 = 1283;
    unsigned __int8 v8 = [(NSNumber *)operatingClass intValue];
    unsigned __int8 v9 = [(NSNumber *)self->_channelNumber intValue];
    [v3 appendBytes:&v7 length:4];
  }

  return v3;
}

- (NSNumber)supportedBands
{
  return self->_supportedBands;
}

- (void)setSupportedBands:(id)a3
{
}

- (NSNumber)operatingClass
{
  return self->_operatingClass;
}

- (void)setOperatingClass:(id)a3
{
}

- (NSNumber)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelNumber, 0);
  objc_storeStrong((id *)&self->_operatingClass, 0);

  objc_storeStrong((id *)&self->_supportedBands, 0);
}

@end