@interface MTLibraryConfiguration
+ (id)defaultConfiguration;
- (BOOL)supportsLocalMedia;
- (BOOL)supportsPlayback;
- (id)initSupportsPlayback:(BOOL)a3 supportsLocalMedia:(BOOL)a4;
- (void)setSupportsLocalMedia:(BOOL)a3;
- (void)setSupportsPlayback:(BOOL)a3;
@end

@implementation MTLibraryConfiguration

- (void)setSupportsPlayback:(BOOL)a3
{
  self->_supportsPlayback = a3;
}

- (void)setSupportsLocalMedia:(BOOL)a3
{
  self->_supportsLocalMedia = a3;
}

- (id)initSupportsPlayback:(BOOL)a3 supportsLocalMedia:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTLibraryConfiguration;
  v6 = [(MTLibraryConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(MTLibraryConfiguration *)v6 setSupportsPlayback:v5];
    [(MTLibraryConfiguration *)v7 setSupportsLocalMedia:v4];
  }
  return v7;
}

+ (id)defaultConfiguration
{
  id v2 = [objc_alloc((Class)a1) initSupportsPlayback:1 supportsLocalMedia:1];

  return v2;
}

- (BOOL)supportsPlayback
{
  return self->_supportsPlayback;
}

- (BOOL)supportsLocalMedia
{
  return self->_supportsLocalMedia;
}

@end