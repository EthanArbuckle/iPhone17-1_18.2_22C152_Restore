@interface PUPickerBanner
- (double)height;
- (id)view;
@end

@implementation PUPickerBanner

- (void).cxx_destruct
{
}

- (id)view
{
  view = self->_view;
  if (!view)
  {
    v4 = [PUPickerBannerView alloc];
    v5 = -[PUPickerBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_view;
    self->_view = v5;

    view = self->_view;
  }
  return view;
}

- (double)height
{
  v2 = +[PUInterfaceManager currentTheme];
  [v2 bannerHeight];
  double v4 = v3;

  return v4;
}

@end