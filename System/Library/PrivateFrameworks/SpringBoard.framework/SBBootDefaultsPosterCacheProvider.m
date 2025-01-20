@interface SBBootDefaultsPosterCacheProvider
- (NSData)lastActiveHomePoster;
- (NSData)lastActiveLockPoster;
- (SBBootDefaultsPosterCacheProvider)init;
- (void)setLastActiveHomePoster:(id)a3;
- (void)setLastActiveLockPoster:(id)a3;
@end

@implementation SBBootDefaultsPosterCacheProvider

- (SBBootDefaultsPosterCacheProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBBootDefaultsPosterCacheProvider;
  v2 = [(SBBootDefaultsPosterCacheProvider *)&v7 init];
  if (v2)
  {
    v3 = +[SBDefaults localDefaults];
    uint64_t v4 = [v3 bootDefaults];
    bootDefaults = v2->_bootDefaults;
    v2->_bootDefaults = (SBBootDefaults *)v4;
  }
  return v2;
}

- (NSData)lastActiveLockPoster
{
  return (NSData *)[(SBBootDefaults *)self->_bootDefaults lastActiveLockPoster];
}

- (NSData)lastActiveHomePoster
{
  return (NSData *)[(SBBootDefaults *)self->_bootDefaults lastActiveHomePoster];
}

- (void)setLastActiveLockPoster:(id)a3
{
}

- (void)setLastActiveHomePoster:(id)a3
{
}

- (void).cxx_destruct
{
}

@end