@interface PXCMMPosterHeaderViewModel
- (BOOL)isHighlighted;
- (BOOL)showStatusCheckmark;
- (NSString)statusString;
- (NSString)subtitle;
- (NSString)title;
- (PXCMMPosterHeaderViewModel)init;
- (PXDisplayAsset)asset;
- (PXUIImageProvider)mediaProvider;
- (void)performChanges:(id)a3;
- (void)setAsset:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setShowStatusCheckmark:(BOOL)a3;
- (void)setStatusString:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXCMMPosterHeaderViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (BOOL)showStatusCheckmark
{
  return self->_showStatusCheckmark;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(PXCMMPosterHeaderViewModel *)self signalChange:64];
  }
}

- (void)setMediaProvider:(id)a3
{
  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXCMMPosterHeaderViewModel *)self signalChange:32];
    v5 = v6;
  }
}

- (void)setAsset:(id)a3
{
  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXCMMPosterHeaderViewModel *)self signalChange:16];
    v5 = v6;
  }
}

- (void)setShowStatusCheckmark:(BOOL)a3
{
  if (self->_showStatusCheckmark != a3)
  {
    self->_showStatusCheckmark = a3;
    [(PXCMMPosterHeaderViewModel *)self signalChange:8];
  }
}

- (void)setStatusString:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_statusString;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      statusString = self->_statusString;
      self->_statusString = v6;

      [(PXCMMPosterHeaderViewModel *)self signalChange:4];
    }
  }
}

- (void)setSubtitle:(id)a3
{
  v10 = (NSString *)a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCMMPosterHeaderViewModel.m", 52, @"Invalid parameter not satisfying: %@", @"subtitle" object file lineNumber description];
  }
  BOOL v5 = self->_subtitle;
  if (v5 == v10)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v10 isEqualToString:v5];

    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v7;

      [(PXCMMPosterHeaderViewModel *)self signalChange:2];
    }
  }
}

- (void)setTitle:(id)a3
{
  v10 = (NSString *)a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCMMPosterHeaderViewModel.m", 42, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  BOOL v5 = self->_title;
  if (v5 == v10)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v10 isEqualToString:v5];

    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      title = self->_title;
      self->_title = v7;

      [(PXCMMPosterHeaderViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMPosterHeaderViewModel;
  [(PXCMMPosterHeaderViewModel *)&v3 performChanges:a3];
}

- (PXCMMPosterHeaderViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXCMMPosterHeaderViewModel;
  v2 = [(PXCMMPosterHeaderViewModel *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1F00B0030;

    subtitle = v3->_subtitle;
    v3->_subtitle = (NSString *)&stru_1F00B0030;

    statusString = v3->_statusString;
    v3->_statusString = (NSString *)&stru_1F00B0030;
  }
  return v3;
}

@end