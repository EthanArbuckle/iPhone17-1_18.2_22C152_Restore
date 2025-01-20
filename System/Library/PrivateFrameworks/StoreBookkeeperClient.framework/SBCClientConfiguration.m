@interface SBCClientConfiguration
+ (BOOL)supportsSecureCoding;
- (SBCClientConfiguration)initWithCoder:(id)a3;
- (SBCClientConfiguration)initWithPlaybackPositionDomain:(id)a3;
- (SBCPlaybackPositionDomain)playbackPositionDomain;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBCClientConfiguration

- (void).cxx_destruct
{
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (SBCClientConfiguration)initWithCoder:(id)a3
{
  v4 = [a3 decodeObjectForKey:@"SBCPlaybackPositionDomain"];
  v5 = [(SBCClientConfiguration *)self initWithPlaybackPositionDomain:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SBCClientConfiguration;
  v4 = [(SBCClientConfiguration *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ %@", v4, self->_playbackPositionDomain];

  return v5;
}

- (SBCClientConfiguration)initWithPlaybackPositionDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCClientConfiguration;
  v6 = [(SBCClientConfiguration *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playbackPositionDomain, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end