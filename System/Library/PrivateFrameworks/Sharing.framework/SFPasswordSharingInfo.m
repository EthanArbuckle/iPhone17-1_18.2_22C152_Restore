@interface SFPasswordSharingInfo
+ (BOOL)supportsSecureCoding;
- (NSNumber)channel;
- (NSString)networkName;
- (NSString)psk;
- (SFPasswordSharingInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPsk:(id)a3;
@end

@implementation SFPasswordSharingInfo

- (SFPasswordSharingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPasswordSharingInfo;
  v5 = [(SFPasswordSharingInfo *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ch"];
    uint64_t v7 = [v6 copy];
    channel = v5->_channel;
    v5->_channel = (NSNumber *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"psk"];
    uint64_t v10 = [v9 copy];
    psk = v5->_psk;
    v5->_psk = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nwName"];
    uint64_t v13 = [v12 copy];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  channel = self->_channel;
  id v5 = a3;
  [v5 encodeObject:channel forKey:@"ch"];
  [v5 encodeObject:self->_networkName forKey:@"nwName"];
  [v5 encodeObject:self->_psk forKey:@"psk"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)psk
{
  return self->_psk;
}

- (void)setPsk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_networkName, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

@end