@interface PXFilterFooterView
- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsCaption:(CGSize)a3;
- (PXContentFilterState)contentFilterState;
- (PXFilterFooterView)initWithFrame:(CGRect)a3;
- (PXFilterFooterViewDelegate)delegate;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (UIColor)captionColor;
- (void)_showFilterUI:(id)a3;
- (void)_updateDisplay;
- (void)layoutSubviews;
- (void)setCaptionColor:(id)a3;
- (void)setContentFilterState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setSharedLibraryStatusProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXFilterFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionColor, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
}

- (UIColor)captionColor
{
  return self->_captionColor;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (void)setDelegate:(id)a3
{
}

- (PXFilterFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFilterFooterViewDelegate *)WeakRetained;
}

- (void)setCaptionColor:(id)a3
{
}

- (void)setContentFilterState:(id)a3
{
  v9 = (PXContentFilterState *)a3;
  v4 = self->_contentFilterState;
  contentFilterState = v9;
  if (v4 != v9)
  {
    v6 = v4;
    BOOL v7 = [(PXContentFilterState *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    v8 = v9;
    contentFilterState = self->_contentFilterState;
    self->_contentFilterState = v8;
  }

LABEL_5:
  [(PXFilterFooterView *)self _updateDisplay];
}

- (void)setLibraryFilterState:(id)a3
{
  v9 = (PXLibraryFilterState *)a3;
  v4 = self->_libraryFilterState;
  libraryFilterState = v9;
  if (v4 != v9)
  {
    v6 = v4;
    BOOL v7 = [(PXLibraryFilterState *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    v8 = v9;
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v8;
  }

LABEL_5:
  [(PXFilterFooterView *)self _updateDisplay];
}

- (void)setSharedLibraryStatusProvider:(id)a3
{
  v10 = (PXSharedLibraryStatusProvider *)a3;
  v5 = self->_sharedLibraryStatusProvider;
  libraryFilterState = (PXLibraryFilterState *)v10;
  if (v5 != v10)
  {
    BOOL v7 = v5;
    char v8 = [(PXSharedLibraryStatusProvider *)v5 isEqual:v10];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, a3);
    v9 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v10];
    libraryFilterState = self->_libraryFilterState;
    self->_libraryFilterState = v9;
  }

LABEL_5:
  [(PXFilterFooterView *)self _updateDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXFilterFooterView;
  id v4 = a3;
  [(PXFilterFooterView *)&v8 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  v6 = [(PXFilterFooterView *)self traitCollection];
  BOOL v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(PXFilterFooterView *)self _updateDisplay];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXFilterFooterView;
  [(PXFilterFooterView *)&v3 layoutSubviews];
  [(PXFilterFooterView *)self bounds];
  -[PXFilterFooterView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFitsCaption:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_captionLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXFilterFooterView _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PXFilterFooterView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PXFilterFooterView;
  double v3 = -[PXFilterFooterView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = MEMORY[0x1AD10AAF0](10, 0x8000, 9);
    [(UILabel *)v5 setFont:v6];

    [(UILabel *)v5 setLineBreakMode:4];
    BOOL v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v7];

    [(PXFilterFooterView *)v3 addSubview:v5];
    captionLabel = v3->_captionLabel;
    v3->_captionLabel = v5;
    v9 = v5;

    v10 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIButton *)v10 setBackgroundColor:v11];

    [(UIButton *)v10 setContentHorizontalAlignment:1];
    [(UIButton *)v10 addTarget:v3 action:sel__showFilterUI_ forControlEvents:64];
    [(PXFilterFooterView *)v3 addSubview:v10];
    filterButton = v3->_filterButton;
    v3->_filterButton = v10;
  }
  return v3;
}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  objc_super v8 = self->_captionLabel;
  v9 = self->_filterButton;
  -[UILabel sizeThatFits:](v8, "sizeThatFits:", width, height);
  UISizeRoundToViewScale();
  double v11 = v10;
  double v13 = v12;
  -[UIButton sizeThatFits:](v9, "sizeThatFits:", width, height);
  UISizeRoundToViewScale();
  objc_super v14 = [(UIButton *)v9 titleLabel];
  [v14 sizeToFit];
  [v14 frame];
  double v16 = v15;
  [v14 frame];
  if (v13 >= v17) {
    double v18 = v13;
  }
  else {
    double v18 = v17;
  }
  if (v4)
  {
    double v19 = v17;
    if (v16 >= width - v11 + -2.0) {
      double v16 = width - v11 + -2.0;
    }
    double v27 = (v18 - v17) * 0.5;
    double v20 = (width - (v11 + 2.0 + v16)) * 0.5;
    uint64_t v21 = [(PXFilterFooterView *)self effectiveUserInterfaceLayoutDirection];
    double v22 = v16 + v20 + 2.0;
    if (v21 == 1) {
      double v23 = (width - (v11 + 2.0 + v16)) * 0.5;
    }
    else {
      double v23 = v11 + v20 + 2.0;
    }
    if (v21 != 1) {
      double v22 = (width - (v11 + 2.0 + v16)) * 0.5;
    }
    -[UILabel setFrame:](v8, "setFrame:", v22, v26, v11, v13);
    -[UIButton setFrame:](v9, "setFrame:", v23, v27, v16, v19);
  }

  double v24 = width;
  double v25 = v18;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (void)_updateDisplay
{
  v22[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXContentFilterState *)self->_contentFilterState isFiltering];
  BOOL v4 = [(PXFilterFooterView *)self libraryFilterState];
  if ([v4 isFiltering])
  {
    v5 = [v4 localizedFooterDescription];
    v6 = [(PXFilterFooterView *)self sharedLibraryStatusProvider];
    if ((([v6 hasPreview] ^ 1 | v3) & 1) == 0)
    {
      uint64_t v7 = [v4 viewMode];

      if (v7 != 2) {
        goto LABEL_7;
      }
      PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterFooter_Previewing");
      v5 = v6 = v5;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_7:
  [(UILabel *)self->_captionLabel setText:0];
  if (v5) {
    BOOL v8 = v3;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = PXLocalizedStringFromTable(@"PXContentFilterFooterCaptionFilteredBy_Lowercase", @"PhotosUICore");
    double v10 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterFooterFormat");
    double v11 = PXStringWithValidatedFormat();
    -[UILabel setText:](self->_captionLabel, "setText:", v11, v5, v9);

    if (!v3) {
      goto LABEL_19;
    }
  }
  else if (v5)
  {
    [(UILabel *)self->_captionLabel setText:v5];
    if (!v3) {
      goto LABEL_19;
    }
  }
  else
  {
    if (!v3)
    {
LABEL_19:
      [(UIButton *)self->_filterButton setAttributedTitle:0 forState:0];
      double v13 = [(UIButton *)self->_filterButton titleLabel];
      [v13 setText:0];
      goto LABEL_20;
    }
    double v12 = PXLocalizedStringFromTable(@"PXContentFilterFooterCaptionFilteredBy", @"PhotosUICore");
    [(UILabel *)self->_captionLabel setText:v12];
  }
  double v13 = [(PXContentFilterState *)self->_contentFilterState localizedFooterDescription];
  id v14 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v14 setLineBreakMode:4];
  v21[0] = *MEMORY[0x1E4FB06F8];
  double v15 = MEMORY[0x1AD10AAF0](10, 0x8000, 9);
  uint64_t v16 = *MEMORY[0x1E4FB0738];
  v22[0] = v15;
  v22[1] = v14;
  uint64_t v17 = *MEMORY[0x1E4FB0700];
  v21[1] = v16;
  v21[2] = v17;
  double v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v22[2] = v18;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  double v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v19];
  [(UIButton *)self->_filterButton setAttributedTitle:v20 forState:0];

LABEL_20:
  [(PXFilterFooterView *)self setNeedsLayout];
}

- (void)_showFilterUI:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(PXFilterFooterView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 filterFooterViewDidTapShowFilter:self sender:v5];
  }
}

@end