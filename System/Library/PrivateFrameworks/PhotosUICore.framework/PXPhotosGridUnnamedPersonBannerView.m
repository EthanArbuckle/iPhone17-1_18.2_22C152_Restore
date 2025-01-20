@interface PXPhotosGridUnnamedPersonBannerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSShadow)buttonShadow;
- (NSString)actionString;
- (PXFeatureSpec)spec;
- (PXPhotosGridUnnamedPersonBannerDelegate)delegate;
- (PXPhotosGridUnnamedPersonBannerView)initWithType:(int64_t)a3;
- (UIButton)primaryActionButton;
- (int64_t)type;
- (void)_handlePrimaryAction;
- (void)_updateButtonConfiguration;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSpec:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PXPhotosGridUnnamedPersonBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryActionButton, 0);
  objc_storeStrong((id *)&self->_buttonShadow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (UIButton)primaryActionButton
{
  return self->_primaryActionButton;
}

- (NSShadow)buttonShadow
{
  return self->_buttonShadow;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosGridUnnamedPersonBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosGridUnnamedPersonBannerDelegate *)WeakRetained;
}

- (PXFeatureSpec)spec
{
  return self->_spec;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setSpec:(id)a3
{
  v5 = (PXFeatureSpec *)a3;
  spec = self->_spec;
  if (spec != v5)
  {
    v9 = v5;
    uint64_t v7 = [(PXFeatureSpec *)spec contentSizeCategory];
    objc_storeStrong((id *)&self->_spec, a3);
    int64_t v8 = [(PXFeatureSpec *)self->_spec contentSizeCategory];
    v5 = v9;
    if (v7 != v8)
    {
      [(PXPhotosGridUnnamedPersonBannerView *)self _updateButtonConfiguration];
      v5 = v9;
    }
  }
}

- (void)_handlePrimaryAction
{
  id v3 = [(PXPhotosGridUnnamedPersonBannerView *)self delegate];
  [v3 didTapUnnamedPersonBanner:self];
}

- (void)_updateButtonConfiguration
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = MEMORY[0x1AD10AAF0](3, 32770, 0);
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v17[0] = v3;
  uint64_t v5 = *MEMORY[0x1E4FB0758];
  v16[0] = v4;
  v16[1] = v5;
  v6 = [(PXPhotosGridUnnamedPersonBannerView *)self buttonShadow];
  v17[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  v9 = [(PXPhotosGridUnnamedPersonBannerView *)self actionString];
  v10 = (void *)[v8 initWithString:v9 attributes:v7];

  v11 = [(PXPhotosGridUnnamedPersonBannerView *)self primaryActionButton];
  v12 = [v11 configuration];
  v13 = (void *)[v12 copy];

  [v13 setAttributedTitle:v10];
  v14 = [MEMORY[0x1E4FB1830] configurationWithFont:v3];
  [v13 setPreferredSymbolConfigurationForImage:v14];

  v15 = [(PXPhotosGridUnnamedPersonBannerView *)self primaryActionButton];
  [v15 setConfiguration:v13];
}

- (NSString)actionString
{
  int64_t v4 = [(PXPhotosGridUnnamedPersonBannerView *)self type];
  if (v4)
  {
    if (v4 != 1)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXPhotosGridUnnamedPersonBannerView.m" lineNumber:80 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v5 = @"PXPeopleBannerNameThisPet";
  }
  else
  {
    uint64_t v5 = @"PXPeopleBannerNameThisPerson";
  }
  v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  return (NSString *)v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridUnnamedPersonBannerView;
  [(PXPhotosGridUnnamedPersonBannerView *)&v3 layoutSubviews];
  [(PXPhotosGridUnnamedPersonBannerView *)self bounds];
  PXEdgeInsetsMake();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  CGFloat v4 = a3.height + -20.0;
  uint64_t v5 = [(PXPhotosGridUnnamedPersonBannerView *)self primaryActionButton];
  objc_msgSend(v5, "sizeThatFits:", width, v4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v9 + 20.0;
  double v11 = v7;
  result.height = v10;
  result.double width = v11;
  return result;
}

- (PXPhotosGridUnnamedPersonBannerView)initWithType:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PXPhotosGridUnnamedPersonBannerView;
  CGFloat v4 = -[PXPhotosGridUnnamedPersonBannerView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    double v6 = (NSShadow *)objc_alloc_init(MEMORY[0x1E4FB0858]);
    buttonShadow = v5->_buttonShadow;
    v5->_buttonShadow = v6;

    [(NSShadow *)v5->_buttonShadow setShadowBlurRadius:10.0];
    double v8 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v8 setTitleAlignment:1];
    double v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle"];
    [v8 setImage:v9];

    double v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [v8 setBaseForegroundColor:v10];

    [v8 setImagePadding:10.0];
    objc_initWeak(&location, v5);
    double v11 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __52__PXPhotosGridUnnamedPersonBannerView_initWithType___block_invoke;
    v19 = &unk_1E5DD2930;
    objc_copyWeak(&v20, &location);
    v12 = [v11 actionWithHandler:&v16];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v8, v12, v16, v17, v18, v19);
    primaryActionButton = v5->_primaryActionButton;
    v5->_primaryActionButton = (UIButton *)v13;

    [(PXPhotosGridUnnamedPersonBannerView *)v5 _updateButtonConfiguration];
    [(PXPhotosGridUnnamedPersonBannerView *)v5 addSubview:v5->_primaryActionButton];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __52__PXPhotosGridUnnamedPersonBannerView_initWithType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePrimaryAction];
}

@end