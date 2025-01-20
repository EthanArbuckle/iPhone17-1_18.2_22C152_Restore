@interface ICMutableClientInfo
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBagProfile:(id)a3;
- (void)setBagProfileVersion:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setRequestingBundleIdentifier:(id)a3;
- (void)setRequestingBundleVersion:(id)a3;
@end

@implementation ICMutableClientInfo

- (void)setClientVersion:(id)a3
{
  self->super._clientVersion = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setClientIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  clientIdentifier = self->super._clientIdentifier;
  self->super._clientIdentifier = v4;

  v6 = self->super._clientIdentifier;

  [(ICClientInfo *)self _setDefaultBagProfileForClientIdentifier:v6];
}

- (void)setProcessName:(id)a3
{
  self->super._processName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setBundleIdentifier:(id)a3
{
  self->super._bundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setRequestingBundleVersion:(id)a3
{
  self->super._requestingBundleVersion = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  self->super._requestingBundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setBagProfileVersion:(id)a3
{
  self->super._bagProfileVersion = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setBagProfile:(id)a3
{
  v4 = (NSString *)[a3 copy];
  bagProfile = self->super._bagProfile;
  self->super._bagProfile = v4;

  MEMORY[0x1F41817F8](v4, bagProfile);
}

@end