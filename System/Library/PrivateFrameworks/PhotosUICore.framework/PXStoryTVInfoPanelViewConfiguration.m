@interface PXStoryTVInfoPanelViewConfiguration
- (BOOL)isEqual:(id)a3;
- (PXStoryViewModel)viewModel;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setViewModel:(id)a3;
@end

@implementation PXStoryTVInfoPanelViewConfiguration

- (void).cxx_destruct
{
}

- (void)setViewModel:(id)a3
{
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXStoryTVInfoPanelViewConfiguration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(PXStoryTVInfoPanelViewConfiguration *)v4 viewModel];
      v6 = [(PXStoryTVInfoPanelViewConfiguration *)self viewModel];
      if (v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PXStoryTVInfoPanelViewConfiguration *)self viewModel];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(PXStoryTVInfoPanelViewConfiguration *)self viewModel];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

@end