@interface PRSWallpaperLocationStateObserver
- (BOOL)needsSandboxExtensions;
- (PRSWallpaperLocationStateObserver)init;
- (id)handler;
- (unint64_t)locations;
- (void)setHandler:(id)a3;
- (void)setLocations:(unint64_t)a3;
- (void)setNeedsSandboxExtensions:(BOOL)a3;
@end

@implementation PRSWallpaperLocationStateObserver

- (PRSWallpaperLocationStateObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSWallpaperLocationStateObserver;
  result = [(PRSWallpaperLocationStateObserver *)&v3 init];
  if (result)
  {
    result->_locations = 12;
    result->_needsSandboxExtensions = 1;
  }
  return result;
}

- (unint64_t)locations
{
  return self->_locations;
}

- (void)setLocations:(unint64_t)a3
{
  self->_locations = a3;
}

- (BOOL)needsSandboxExtensions
{
  return self->_needsSandboxExtensions;
}

- (void)setNeedsSandboxExtensions:(BOOL)a3
{
  self->_needsSandboxExtensions = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end