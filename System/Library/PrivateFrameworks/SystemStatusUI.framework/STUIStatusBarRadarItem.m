@interface STUIStatusBarRadarItem
- (STUIStatusBarRadarView)radarItemView;
- (id)imageForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (void)_create_radarItemView;
- (void)setRadarItemView:(id)a3;
@end

@implementation STUIStatusBarRadarItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA97A8];
}

- (id)imageForUpdate:(id)a3
{
  id v3 = a3;
  v4 = [v3 data];
  v5 = [v4 radarEntry];
  char v6 = [v5 BOOLValue];

  v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = DashBoardFrameworkBundle();
  v9 = [v3 styleAttributes];

  v10 = [v9 traitCollection];
  v11 = [v7 imageNamed:@"Black_Radar" inBundle:v8 compatibleWithTraitCollection:v10];

  if ((v6 & 1) == 0)
  {
    [v11 size];
    UIGraphicsBeginImageContext(v16);
    uint64_t v12 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v11 = (void *)v12;
  }
  v13 = [v11 imageWithRenderingMode:2];

  return v13;
}

- (STUIStatusBarRadarView)radarItemView
{
  radarItemView = self->_radarItemView;
  if (!radarItemView)
  {
    [(STUIStatusBarRadarItem *)self _create_radarItemView];
    radarItemView = self->_radarItemView;
  }
  return radarItemView;
}

- (void)_create_radarItemView
{
  id v3 = [STUIStatusBarRadarView alloc];
  v4 = -[STUIStatusBarRadarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  radarItemView = self->_radarItemView;
  self->_radarItemView = v4;
  MEMORY[0x1F41817F8](v4, radarItemView);
}

- (void)setRadarItemView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end