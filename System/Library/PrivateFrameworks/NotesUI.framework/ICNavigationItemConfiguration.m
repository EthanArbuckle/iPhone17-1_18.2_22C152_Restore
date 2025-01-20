@interface ICNavigationItemConfiguration
- (BOOL)needsUpdate;
- (BOOL)updateAnimated:(BOOL)a3;
- (ICNavigationItemConfiguration)init;
- (unint64_t)lastUpdateHash;
- (void)reset;
- (void)setLastUpdateHash:(unint64_t)a3;
@end

@implementation ICNavigationItemConfiguration

- (BOOL)updateAnimated:(BOOL)a3
{
  BOOL v4 = [(ICNavigationItemConfiguration *)self needsUpdate];
  if (v4) {
    [(ICNavigationItemConfiguration *)self setLastUpdateHash:[(ICNavigationItemConfiguration *)self hash]];
  }
  return v4;
}

- (void)setLastUpdateHash:(unint64_t)a3
{
  self->_lastUpdateHash = a3;
}

- (BOOL)needsUpdate
{
  uint64_t v3 = [(ICNavigationItemConfiguration *)self hash];
  return v3 != [(ICNavigationItemConfiguration *)self lastUpdateHash];
}

- (unint64_t)lastUpdateHash
{
  return self->_lastUpdateHash;
}

- (void)reset
{
}

- (ICNavigationItemConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICNavigationItemConfiguration;
  v2 = [(ICNavigationItemConfiguration *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(ICNavigationItemConfiguration *)v2 reset];
  }
  return v3;
}

@end