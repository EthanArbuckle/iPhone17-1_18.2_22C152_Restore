@interface PXPhotosGridAddButtonView
- (CGRect)clippingRect;
- (PXPhotosGridAddButtonView)initWithFrame:(CGRect)a3;
- (PXPhotosGridAddButtonViewUserData)userData;
- (UIImage)buttonImage;
- (id)actionHandler;
- (void)_handleButton:(id)a3;
- (void)_updateBackgroundProperties;
- (void)_updateButtonImage;
- (void)layoutSubviews;
- (void)setButtonImage:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXPhotosGridAddButtonView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

- (void)setButtonImage:(id)a3
{
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (PXPhotosGridAddButtonViewUserData)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserData:(id)a3
{
  if (self->_userData != a3)
  {
    v4 = (PXPhotosGridAddButtonViewUserData *)[a3 copy];
    userData = self->_userData;
    self->_userData = v4;

    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateButtonImage];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateBackgroundProperties];
  }
}

- (id)actionHandler
{
  v2 = [(PXPhotosGridAddButtonView *)self userData];
  v3 = [v2 actionHandler];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
}

- (void)_handleButton:(id)a3
{
  uint64_t v3 = [(PXPhotosGridAddButtonView *)self actionHandler];
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v5 = PLGridZeroGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Missing action handler for photos grid add button", v6, 2u);
    }
  }
}

- (void)_updateButtonImage
{
  id v3 = (id)*MEMORY[0x1E4FB2990];
  v4 = [(PXPhotosGridAddButtonView *)self userData];
  uint64_t v5 = [v4 style];

  if (v5 == 1)
  {
    v6 = [(PXPhotosGridAddButtonView *)self traitCollection];
    uint64_t v8 = [v6 horizontalSizeClass];
    v9 = (void *)*MEMORY[0x1E4FB2988];
    if (v8 == 1) {
      v9 = v3;
    }
    id v10 = v9;

    uint64_t v7 = 3;
    id v3 = v10;
    goto LABEL_9;
  }
  if (!v5)
  {
    v6 = [(PXPhotosGridAddButtonView *)self traitCollection];
    if ([v6 horizontalSizeClass] == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 3;
    }
LABEL_9:

    goto LABEL_11;
  }
  uint64_t v7 = 3;
LABEL_11:
  v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:contentSizeCategory:withSymbolicTraits:", v3, *MEMORY[0x1E4FB27D8], 2);
  v12 = [MEMORY[0x1E4FB1830] configurationWithFont:v11 scale:v7];
  v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  id v14 = [v13 imageByApplyingSymbolConfiguration:v12];

  [(PXPhotosGridAddButtonView *)self setButtonImage:v14];
}

- (void)_updateBackgroundProperties
{
  id v13 = [(PXPhotosGridAddButtonView *)self userData];
  uint64_t v3 = [v13 preferredUserInterfaceStyle];
  switch(v3)
  {
    case 2:
      uint64_t v5 = (void *)MEMORY[0x1E4FB1E20];
      uint64_t v6 = 2;
LABEL_7:
      uint64_t v4 = [v5 traitCollectionWithUserInterfaceStyle:v6];
      goto LABEL_8;
    case 1:
      uint64_t v5 = (void *)MEMORY[0x1E4FB1E20];
      uint64_t v6 = 1;
      goto LABEL_7;
    case 0:
      uint64_t v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
LABEL_8:
      uint64_t v7 = (void *)v4;
      goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_10:
  uint64_t v8 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v9 = [v8 resolvedColorWithTraitCollection:v7];
  [(PXPhotosGridAddButtonView *)self setBackgroundColor:v9];

  [v13 cornerRadius];
  double v11 = v10;
  v12 = [(PXPhotosGridAddButtonView *)self layer];
  [v12 setCornerRadius:v11];
}

- (void)layoutSubviews
{
  [(PXUpdater *)self->_updater updateIfNeeded];
  uint64_t v3 = [(PXPhotosGridAddButtonView *)self buttonImage];
  button = self->_button;
  if (!button)
  {
    uint64_t v5 = [MEMORY[0x1E4FB14D0] systemButtonWithImage:v3 target:self action:sel__handleButton_];
    uint64_t v6 = self->_button;
    self->_button = v5;

    [(PXPhotosGridAddButtonView *)self addSubview:self->_button];
    button = self->_button;
  }
  [(UIButton *)button setImage:v3 forState:0];
  [(PXPhotosGridAddButtonView *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosGridAddButtonView;
  [(PXPhotosGridAddButtonView *)&v7 layoutSubviews];
}

- (PXPhotosGridAddButtonView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosGridAddButtonView;
  uint64_t v3 = -[PXPhotosGridAddButtonView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(PXPhotosGridAddButtonView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    uint64_t v6 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v4 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v4->_updater;
    v4->_updater = (PXUpdater *)v6;

    [(PXUpdater *)v4->_updater addUpdateSelector:sel__updateButtonImage needsUpdate:1];
    [(PXUpdater *)v4->_updater addUpdateSelector:sel__updateBackgroundProperties needsUpdate:1];
  }
  return v4;
}

@end