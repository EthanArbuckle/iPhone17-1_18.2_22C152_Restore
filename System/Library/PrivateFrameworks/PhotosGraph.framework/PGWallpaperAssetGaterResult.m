@interface PGWallpaperAssetGaterResult
- (BOOL)didTimeout;
- (BOOL)passesAnyGating;
- (BOOL)passesSegmentation;
- (BOOL)passesSettlingEffect;
- (unint64_t)availableFeatures;
- (void)setDidTimeout:(BOOL)a3;
- (void)setPassesSegmentation:(BOOL)a3;
- (void)setPassesSettlingEffect:(BOOL)a3;
@end

@implementation PGWallpaperAssetGaterResult

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setPassesSettlingEffect:(BOOL)a3
{
  self->_passesSettlingEffect = a3;
}

- (BOOL)passesSettlingEffect
{
  return self->_passesSettlingEffect;
}

- (void)setPassesSegmentation:(BOOL)a3
{
  self->_passesSegmentation = a3;
}

- (BOOL)passesSegmentation
{
  return self->_passesSegmentation;
}

- (unint64_t)availableFeatures
{
  return [(PGWallpaperAssetGaterResult *)self passesSettlingEffect];
}

- (BOOL)passesAnyGating
{
  if ([(PGWallpaperAssetGaterResult *)self passesSettlingEffect]) {
    return 1;
  }
  return [(PGWallpaperAssetGaterResult *)self passesSegmentation];
}

@end