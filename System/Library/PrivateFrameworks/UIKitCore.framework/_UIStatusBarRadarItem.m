@interface _UIStatusBarRadarItem
- (_UIStatusBarRadarView)radarItemView;
- (id)imageForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (void)_create_radarItemView;
- (void)setRadarItemView:(id)a3;
@end

@implementation _UIStatusBarRadarItem

- (id)indicatorEntryKey
{
  return @"radarEntry";
}

- (id)imageForUpdate:(id)a3
{
  id v3 = a3;
  v4 = [v3 data];
  v5 = [v4 radarEntry];
  char v6 = [v5 BOOLValue];

  v7 = (void *)MEMORY[0x1E4F28B50];
  v8 = _UIKitResourceBundlePath(@"CarPlayArtwork.bundle");
  v9 = [v7 bundleWithPath:v8];

  v10 = [v3 styleAttributes];

  v11 = [v10 traitCollection];
  v12 = +[UIImage imageNamed:@"Black_Radar" inBundle:v9 compatibleWithTraitCollection:v11];

  if ((v6 & 1) == 0)
  {
    [v12 size];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v13, v14, 1.0);
    uint64_t v15 = _UIGraphicsGetImageFromCurrentImageContext(0);

    UIGraphicsEndImageContext();
    v12 = (void *)v15;
  }
  v16 = [v12 imageWithRenderingMode:2];

  return v16;
}

- (_UIStatusBarRadarView)radarItemView
{
  radarItemView = self->_radarItemView;
  if (!radarItemView)
  {
    [(_UIStatusBarRadarItem *)self _create_radarItemView];
    radarItemView = self->_radarItemView;
  }
  return radarItemView;
}

- (void)_create_radarItemView
{
  id v3 = [_UIStatusBarRadarView alloc];
  v4 = -[_UIStatusBarRadarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  radarItemView = self->_radarItemView;
  self->_radarItemView = v4;
}

- (void)setRadarItemView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end