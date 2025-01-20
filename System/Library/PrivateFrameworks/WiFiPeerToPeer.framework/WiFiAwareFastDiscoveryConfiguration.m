@interface WiFiAwareFastDiscoveryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)instantCommunicationChannel;
- (WiFiAwareFastDiscoveryConfiguration)init;
- (WiFiAwareFastDiscoveryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)peerBandInformation;
- (void)encodeWithCoder:(id)a3;
- (void)setInstantCommunicationChannel:(id)a3;
- (void)setPeerBandInformation:(unsigned __int8)a3;
@end

@implementation WiFiAwareFastDiscoveryConfiguration

- (WiFiAwareFastDiscoveryConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)WiFiAwareFastDiscoveryConfiguration;
  v2 = [(WiFiAwareFastDiscoveryConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    instantCommunicationChannel = v2->_instantCommunicationChannel;
    v2->_instantCommunicationChannel = 0;

    v3->_peerBandInformation = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareFastDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareFastDiscoveryConfiguration *)self init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareFastDiscoveryConfiguration.instantCommunicationChannel"];
    [(WiFiAwareFastDiscoveryConfiguration *)v5 setInstantCommunicationChannel:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwareFastDiscoveryConfiguration.peerBandInformation"];
    -[WiFiAwareFastDiscoveryConfiguration setPeerBandInformation:](v5, "setPeerBandInformation:", [v7 unsignedCharValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwareFastDiscoveryConfiguration *)self instantCommunicationChannel];
  [v4 encodeObject:v5 forKey:@"WiFiAwareFastDiscoveryConfiguration.instantCommunicationChannel"];

  objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[WiFiAwareFastDiscoveryConfiguration peerBandInformation](self, "peerBandInformation"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"WiFiAwareFastDiscoveryConfiguration.peerBandInformation"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WiFiAwareFastDiscoveryConfiguration);
  v5 = [(WiFiAwareFastDiscoveryConfiguration *)self instantCommunicationChannel];
  id v6 = (void *)[v5 copy];
  [(WiFiAwareFastDiscoveryConfiguration *)v4 setInstantCommunicationChannel:v6];

  [(WiFiAwareFastDiscoveryConfiguration *)v4 setPeerBandInformation:[(WiFiAwareFastDiscoveryConfiguration *)self peerBandInformation]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (WiFiAwareFastDiscoveryConfiguration *)a3;
  if (self == v6)
  {
    v7 = 0;
LABEL_12:
    BOOL v10 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = v6;
    v8 = [(WiFiAwareFastDiscoveryConfiguration *)self instantCommunicationChannel];
    v9 = [(WiFiAwareFastDiscoveryConfiguration *)v7 instantCommunicationChannel];
    if (v8 != v9)
    {
      v3 = [(WiFiAwareFastDiscoveryConfiguration *)self instantCommunicationChannel];
      id v4 = [(WiFiAwareFastDiscoveryConfiguration *)v7 instantCommunicationChannel];
      if (![v3 isEqual:v4])
      {

LABEL_13:
        BOOL v10 = 0;
        goto LABEL_14;
      }
    }
    int v11 = [(WiFiAwareFastDiscoveryConfiguration *)self peerBandInformation];
    int v12 = [(WiFiAwareFastDiscoveryConfiguration *)v7 peerBandInformation];
    if (v8 == v9)
    {
    }
    else
    {
    }
    if (v11 != v12) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v10 = 0;
  v7 = 0;
LABEL_14:

  return v10;
}

- (id)description
{
  v3 = NSString;
  unsigned int v4 = [(WiFiAwareFastDiscoveryConfiguration *)self peerBandInformation];
  v5 = [(WiFiAwareFastDiscoveryConfiguration *)self instantCommunicationChannel];
  id v6 = [v3 stringWithFormat:@"<enabled (peer band: %u, channel: %@)>", v4, v5];

  return v6;
}

- (NSNumber)instantCommunicationChannel
{
  return self->_instantCommunicationChannel;
}

- (void)setInstantCommunicationChannel:(id)a3
{
}

- (unsigned)peerBandInformation
{
  return self->_peerBandInformation;
}

- (void)setPeerBandInformation:(unsigned __int8)a3
{
  self->_peerBandInformation = a3;
}

- (void).cxx_destruct
{
}

@end