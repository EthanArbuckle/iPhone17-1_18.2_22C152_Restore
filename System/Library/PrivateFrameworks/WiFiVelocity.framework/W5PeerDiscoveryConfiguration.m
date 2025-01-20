@interface W5PeerDiscoveryConfiguration
+ (BOOL)supportsSecureCoding;
- (W5PeerDiscoveryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)controlFlags;
- (int64_t)discoveryFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setControlFlags:(int64_t)a3;
- (void)setDiscoveryFlags:(int64_t)a3;
@end

@implementation W5PeerDiscoveryConfiguration

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  v4 = W5DescriptionForPeerDiscoveryFlags([(W5PeerDiscoveryConfiguration *)self discoveryFlags]);
  v5 = W5DescriptionForPeerControlFlags([(W5PeerDiscoveryConfiguration *)self controlFlags]);
  [v3 appendFormat:@"Discovery='%@' Control='%@'", v4, v5];

  v6 = (void *)[v3 copy];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5PeerDiscoveryConfiguration allocWithZone:a3] init];
  [(W5PeerDiscoveryConfiguration *)v4 setDiscoveryFlags:self->_discoveryFlags];
  [(W5PeerDiscoveryConfiguration *)v4 setControlFlags:self->_controlFlags];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t controlFlags = self->_controlFlags;
  id v5 = a3;
  [v5 encodeInteger:controlFlags forKey:@"_controlFlags"];
  [v5 encodeInteger:self->_discoveryFlags forKey:@"_discoveryFlags"];
}

- (W5PeerDiscoveryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)W5PeerDiscoveryConfiguration;
  id v5 = [(W5PeerDiscoveryConfiguration *)&v7 init];
  if (v5)
  {
    v5->_int64_t controlFlags = [v4 decodeIntegerForKey:@"_controlFlags"];
    v5->_discoveryFlags = [v4 decodeIntegerForKey:@"_discoveryFlags"];
  }

  return v5;
}

- (int64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(int64_t)a3
{
  self->_discoveryFlags = a3;
}

- (int64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(int64_t)a3
{
  self->_int64_t controlFlags = a3;
}

@end