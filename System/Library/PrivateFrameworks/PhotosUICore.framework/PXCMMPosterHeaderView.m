@interface PXCMMPosterHeaderView
+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5;
+ (void)preheatSharedValuesForPresentationStyle:(int64_t)a3;
- (BOOL)test_showStatusCheckmark;
- (PXCMMPosterHeaderView)init;
- (PXCMMPosterHeaderView)initWithCoder:(id)a3;
- (PXCMMPosterHeaderView)initWithFrame:(CGRect)a3;
- (PXCMMPosterHeaderView)initWithPresentationStyle:(int64_t)a3;
- (PXCMMPosterHeaderViewModel)viewModel;
- (id)test_statusString;
- (id)test_subtitle;
- (id)test_title;
- (int64_t)presentationStyle;
- (void)_performLayoutWithSize:(CGSize)a3;
- (void)_updateFonts;
- (void)_updateStatusString;
- (void)_updateSubtitle;
- (void)_updateTitle;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setViewModel:(id)a3;
@end

@implementation PXCMMPosterHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusCheckmark, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomGradientView, 0);
  objc_storeStrong((id *)&self->_topGradientView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (PXCMMPosterHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXCMMPosterHeaderViewModelObservationContext != a5) {
    goto LABEL_9;
  }
  if (v6)
  {
    [(PXCMMPosterHeaderView *)self _updateTitle];
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  [(PXCMMPosterHeaderView *)self _updateSubtitle];
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_12:
  [(PXCMMPosterHeaderView *)self _updateStatusString];
  if ((v6 & 8) != 0) {
LABEL_6:
  }
    [(PXCMMPosterHeaderView *)self setNeedsLayout];
LABEL_7:
  if ((v6 & 0x70) != 0)
  {
    v9 = [(PXCMMImageView *)self->_imageView viewModel];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PXCMMPosterHeaderView_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5DB8E68;
    v10[4] = self;
    [v9 performChanges:v10];
  }
LABEL_9:
}

void __54__PXCMMPosterHeaderView_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 472);
  id v6 = a2;
  v4 = [v3 asset];
  [v6 setAsset:v4];

  v5 = [*(id *)(*(void *)(a1 + 32) + 472) mediaProvider];
  [v6 setMediaProvider:v5];

  objc_msgSend(v6, "setHighlighted:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "isHighlighted"));
}

- (BOOL)test_showStatusCheckmark
{
  [(UIImageView *)self->_statusCheckmark frame];
  return !CGRectEqualToRect(v3, *MEMORY[0x1E4F1DB28]);
}

- (id)test_statusString
{
  return [(UILabel *)self->_statusLabel text];
}

- (id)test_subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (id)test_title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)_updateFonts
{
  id v6 = [(PXCMMPosterHeaderViewSpec *)self->_spec preferredTitleFont];
  -[UILabel setFont:](self->_titleLabel, "setFont:");
  CGRect v3 = [(PXCMMPosterHeaderViewSpec *)self->_spec preferredSubtitleFont];
  [(UILabel *)self->_subtitleLabel setFont:v3];
  if ([(PXCMMPosterHeaderViewSpec *)self->_spec canShowStatus])
  {
    v4 = [(PXCMMPosterHeaderViewSpec *)self->_spec preferredStatusFont];
    [(UILabel *)self->_statusLabel setFont:v4];
    v5 = [MEMORY[0x1E4FB1830] configurationWithFont:v4];
    [(UIImageView *)self->_statusCheckmark setSymbolConfiguration:v5];
  }
  [(PXCMMPosterHeaderView *)self setNeedsLayout];
}

- (void)_updateStatusString
{
  CGRect v3 = [(PXCMMPosterHeaderViewModel *)self->_viewModel statusString];
  [(UILabel *)self->_statusLabel setText:v3];

  [(PXCMMPosterHeaderView *)self setNeedsLayout];
}

- (void)_updateSubtitle
{
  CGRect v3 = [(PXCMMPosterHeaderViewModel *)self->_viewModel subtitle];
  [(UILabel *)self->_subtitleLabel setText:v3];

  [(PXCMMPosterHeaderView *)self setNeedsLayout];
}

- (void)_updateTitle
{
  CGRect v3 = [(PXCMMPosterHeaderViewModel *)self->_viewModel title];
  [(UILabel *)self->_titleLabel setText:v3];

  [(PXCMMPosterHeaderView *)self setNeedsLayout];
}

- (void)_performLayoutWithSize:(CGSize)a3
{
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterHeaderView;
  [(PXCMMPosterHeaderView *)&v5 layoutSubviews];
  [(PXCMMPosterHeaderView *)self bounds];
  -[PXCMMPosterHeaderView _performLayoutWithSize:](self, "_performLayoutWithSize:", v3, v4);
}

- (void)setViewModel:(id)a3
{
  v11 = (PXCMMPosterHeaderViewModel *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMPosterHeaderView.m", 113, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  p_viewModel = &self->_viewModel;
  v7 = self->_viewModel;
  if (v7 == v11)
  {
  }
  else
  {
    id v8 = v11;
    char v9 = [(PXCMMPosterHeaderViewModel *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      [(PXCMMPosterHeaderViewModel *)*p_viewModel unregisterChangeObserver:self context:PXCMMPosterHeaderViewModelObservationContext];
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(PXCMMPosterHeaderViewModel *)*p_viewModel registerChangeObserver:self context:PXCMMPosterHeaderViewModelObservationContext];
      [(PXCMMPosterHeaderView *)self _updateTitle];
      [(PXCMMPosterHeaderView *)self _updateSubtitle];
      [(PXCMMPosterHeaderView *)self _updateStatusString];
    }
  }
}

- (PXCMMPosterHeaderView)initWithPresentationStyle:(int64_t)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PXCMMPosterHeaderView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v8 = -[PXCMMPosterHeaderView initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  char v9 = v8;
  if (v8)
  {
    v8->_presentationStyle = a3;
    v10 = [[PXCMMPosterHeaderViewSpec alloc] initWithPresentationStyle:v8->_presentationStyle];
    spec = v9->_spec;
    v9->_spec = v10;

    v12 = -[PXCMMImageView initWithFrame:]([PXCMMImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    imageView = v9->_imageView;
    v9->_imageView = v12;

    [(PXCMMImageView *)v9->_imageView setAutoresizingMask:18];
    [(PXCMMPosterHeaderView *)v9 addSubview:v9->_imageView];
    v14 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    topGradientView = v9->_topGradientView;
    v9->_topGradientView = v14;

    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v42[0] = v16;
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    v42[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    [(PXGradientView *)v9->_topGradientView setColors:v18];

    [(PXCMMPosterHeaderView *)v9 addSubview:v9->_topGradientView];
    v19 = -[PXGradientView initWithFrame:]([PXGradientView alloc], "initWithFrame:", v4, v5, v6, v7);
    bottomGradientView = v9->_bottomGradientView;
    v9->_bottomGradientView = v19;

    v21 = [MEMORY[0x1E4FB1618] clearColor];
    v41[0] = v21;
    v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v41[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [(PXGradientView *)v9->_bottomGradientView setColors:v23];

    [(PXCMMPosterHeaderView *)v9 addSubview:v9->_bottomGradientView];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v24;

    v26 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v9->_titleLabel setTextColor:v26];

    [(UILabel *)v9->_titleLabel setNumberOfLines:2];
    [(PXCMMPosterHeaderView *)v9 addSubview:v9->_titleLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = (UILabel *)v27;

    v29 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v9->_subtitleLabel setTextColor:v29];

    [(PXCMMPosterHeaderView *)v9 addSubview:v9->_subtitleLabel];
    if ([(PXCMMPosterHeaderViewSpec *)v9->_spec canShowStatus])
    {
      uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
      statusLabel = v9->_statusLabel;
      v9->_statusLabel = (UILabel *)v30;

      v32 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)v9->_statusLabel setTextColor:v32];

      [(PXCMMPosterHeaderView *)v9 addSubview:v9->_statusLabel];
      uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v4, v5, v6, v7);
      statusCheckmark = v9->_statusCheckmark;
      v9->_statusCheckmark = (UIImageView *)v33;

      v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
      [(UIImageView *)v9->_statusCheckmark setImage:v35];
      v36 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIImageView *)v9->_statusCheckmark setTintColor:v36];

      [(PXCMMPosterHeaderView *)v9 addSubview:v9->_statusCheckmark];
    }
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v9 selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    [(PXCMMPosterHeaderView *)v9 _updateFonts];
    v38 = objc_alloc_init(PXCMMPosterHeaderViewModel);
    [(PXCMMPosterHeaderView *)v9 setViewModel:v38];

    [(PXCMMPosterHeaderView *)v9 setAccessibilityIgnoresInvertColors:1];
  }
  return v9;
}

- (PXCMMPosterHeaderView)initWithCoder:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPosterHeaderView.m", 56, @"%s is not available as initializer", "-[PXCMMPosterHeaderView initWithCoder:]");

  abort();
}

- (PXCMMPosterHeaderView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPosterHeaderView.m", 52, @"%s is not available as initializer", "-[PXCMMPosterHeaderView initWithFrame:]");

  abort();
}

- (PXCMMPosterHeaderView)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMPosterHeaderView.m", 48, @"%s is not available as initializer", "-[PXCMMPosterHeaderView init]");

  abort();
}

+ (void)preheatSharedValuesForPresentationStyle:(int64_t)a3
{
  if (!a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_3;
    v6[3] = &unk_1E5DD3128;
    double v3 = &v7;
    double v7 = &__block_literal_global_94652;
    if (preheatSharedValuesForPresentationStyle__onceToken_28 == -1) {
      goto LABEL_6;
    }
    double v4 = &preheatSharedValuesForPresentationStyle__onceToken_28;
    id v5 = v6;
LABEL_10:
    dispatch_once(v4, v5);
    goto LABEL_6;
  }
  if (a3 != 1) {
    return;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_2;
  v8[3] = &unk_1E5DD3128;
  double v3 = &v9;
  char v9 = &__block_literal_global_94652;
  if (preheatSharedValuesForPresentationStyle__onceToken != -1)
  {
    double v4 = &preheatSharedValuesForPresentationStyle__onceToken;
    id v5 = v8;
    goto LABEL_10;
  }
LABEL_6:
}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_2(uint64_t a1)
{
  v2 = [[PXCMMPosterHeaderViewSpec alloc] initWithPresentationStyle:1];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke_3(uint64_t a1)
{
  v2 = [[PXCMMPosterHeaderViewSpec alloc] initWithPresentationStyle:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__PXCMMPosterHeaderView_preheatSharedValuesForPresentationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 scaledTitleBaselineOffset];
  [v2 scaledSubtitleBaselineOffset];
  [v2 scaledTopGradientBaselineOffset];
  [v2 scaledStatusBaselineOffset];
  [v2 scaledBottomGradientBaselineOffset];
}

+ (double)preferredHeightForWidth:(double)a3 traitCollection:(id)a4 screen:(id)a5
{
  id v7 = a5;
  [a4 displayScale];
  v9.size.height = 1.79769313e308;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = a3;
  +[PXPhotosDetailsHeaderTileWidget preferredHeaderContentHeightForWidth:v7 screen:CGRectGetWidth(v9)];

  PXSizeRoundToPixel();
}

@end