@interface SBHLeafIconCustomImageViewController
- (SBHIconImageCache)iconImageCache;
- (SBHLeafIconCustomImageViewController)initWithIcon:(id)a3 iconImageCache:(id)a4;
- (SBIcon)icon;
- (void)loadView;
- (void)updateImage;
@end

@implementation SBHLeafIconCustomImageViewController

- (SBHLeafIconCustomImageViewController)initWithIcon:(id)a3 iconImageCache:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBHLeafIconCustomImageViewController;
  v9 = [(SBHLeafIconCustomImageViewController *)&v16 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_icon, a3);
    objc_storeStrong((id *)&v10->_iconImageCache, a4);
    v11 = self;
    v17[0] = v11;
    v12 = self;
    v17[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    id v14 = (id)[(SBHLeafIconCustomImageViewController *)v10 registerForTraitChanges:v13 withAction:sel_updateImage];
  }
  return v10;
}

- (void)loadView
{
  id v7 = [(SBHLeafIconCustomImageViewController *)self icon];
  v3 = [(SBHLeafIconCustomImageViewController *)self iconImageCache];
  v4 = [(SBHLeafIconCustomImageViewController *)self traitCollection];
  v5 = [v3 imageForIcon:v7 compatibleWithTraitCollection:v4 options:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v5];
  [(SBHLeafIconCustomImageViewController *)self setView:v6];
}

- (void)updateImage
{
  id v7 = [(SBHLeafIconCustomImageViewController *)self icon];
  v3 = [(SBHLeafIconCustomImageViewController *)self iconImageCache];
  v4 = [(SBHLeafIconCustomImageViewController *)self traitCollection];
  v5 = [v3 imageForIcon:v7 compatibleWithTraitCollection:v4 options:0];
  v6 = [(SBHLeafIconCustomImageViewController *)self imageView];
  [v6 setImage:v5];
}

- (SBIcon)icon
{
  return self->_icon;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end