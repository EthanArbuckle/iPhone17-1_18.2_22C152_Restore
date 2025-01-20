@interface UIPrintPreviewPageCell
- (BOOL)locationInTapTargetOfPageLabelBadge:(CGPoint)a3;
- (CGSize)thumbnailSize;
- (UIActivityIndicatorView)spinner;
- (UIImageView)thumbnailView;
- (UILabel)pageLabel;
- (UIPrintPreviewDelegate)printPreviewDelegate;
- (UIPrintPreviewPageCell)initWithFrame:(CGRect)a3;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)checkmarkBackgroundImageView;
- (UIView)checkmarkImageView;
- (UIView)dimmingView;
- (UIView)loadingProgressView;
- (UIView)pageLabelAndChekmarkView;
- (UIView)pageLabelBackgroundBlurView;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (id)pageLabelText:(int64_t)a3;
- (int64_t)pageCount;
- (int64_t)pageIndex;
- (int64_t)pageLabelFormat;
- (void)addPageLabelAndImageView:(BOOL)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)pageBadgeTapped:(id)a3;
- (void)prepareForReuse;
- (void)setCheckmarkBackgroundImageView:(id)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setInRange:(BOOL)a3 animated:(BOOL)a4;
- (void)setLoadingProgressView:(id)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageIndex:(int64_t)a3;
- (void)setPageLabel:(id)a3;
- (void)setPageLabelAndChekmarkView:(id)a3;
- (void)setPageLabelBackgroundBlurView:(id)a3;
- (void)setPrintPreviewDelegate:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setThumbnailView:(id)a3;
- (void)showThumbnailProgressSpinner;
@end

@implementation UIPrintPreviewPageCell

- (UIPrintPreviewPageCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v49[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)UIPrintPreviewPageCell;
  v5 = -[UIPrintPreviewPageCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v6 setContentMode:1];
    v47 = v6;
    [v6 setClipsToBounds:1];
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [v6 setBackgroundColor:v7];

    objc_msgSend(v6, "setFrame:", 0.0, 0.0, width, height);
    [(UIPrintPreviewPageCell *)v5 setThumbnailView:v6];
    v8 = [(UIPrintPreviewPageCell *)v5 contentView];
    [v8 addSubview:v6];

    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v9 setClipsToBounds:1];
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, width, height);
    v10 = [MEMORY[0x1E4FB1618] systemGray2Color];
    [v9 setBackgroundColor:v10];

    [v9 setAlpha:0.0];
    [(UIPrintPreviewPageCell *)v5 setDimmingView:v9];
    v11 = [(UIPrintPreviewPageCell *)v5 contentView];
    [v11 addSubview:v9];

    id v12 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIPrintPreviewPageCell *)v5 setLoadingProgressView:v12];

    v13 = [MEMORY[0x1E4FB1618] whiteColor];
    v14 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    [v14 setBackgroundColor:v13];

    v15 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    [v15 setClipsToBounds:1];

    v16 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    objc_msgSend(v16, "setFrame:", 0.0, 0.0, width, height);

    v17 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    [v17 setHidden:1];

    v18 = [(UIPrintPreviewPageCell *)v5 contentView];
    v19 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    [v18 addSubview:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [(UIPrintPreviewPageCell *)v5 setSpinner:v20];

    v21 = [MEMORY[0x1E4FB1618] systemGrayColor];
    v22 = [(UIPrintPreviewPageCell *)v5 spinner];
    [v22 setColor:v21];

    v23 = [(UIPrintPreviewPageCell *)v5 spinner];
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

    v24 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    v25 = [(UIPrintPreviewPageCell *)v5 spinner];
    [v24 addSubview:v25];

    v26 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UIPrintPreviewPageCell *)v5 spinner];
    v29 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    v30 = [v27 constraintWithItem:v28 attribute:9 relatedBy:0 toItem:v29 attribute:9 multiplier:1.0 constant:0.0];
    v49[0] = v30;
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UIPrintPreviewPageCell *)v5 spinner];
    v33 = [(UIPrintPreviewPageCell *)v5 loadingProgressView];
    v34 = [v31 constraintWithItem:v32 attribute:10 relatedBy:0 toItem:v33 attribute:10 multiplier:1.0 constant:0.0];
    v49[1] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    [v26 addConstraints:v35];

    v36 = [(UIPrintPreviewPageCell *)v5 contentView];
    v37 = [v36 layer];
    LODWORD(v38) = 1036831949;
    [v37 setShadowOpacity:v38];

    v39 = [(UIPrintPreviewPageCell *)v5 contentView];
    v40 = [v39 layer];
    [v40 setShadowRadius:4.0];

    v41 = [(UIPrintPreviewPageCell *)v5 contentView];
    v42 = [v41 layer];
    objc_msgSend(v42, "setShadowOffset:", 0.0, 2.0);

    v43 = [(UIPrintPreviewPageCell *)v5 contentView];
    v44 = [v43 layer];
    id v45 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    objc_msgSend(v44, "setShadowColor:", objc_msgSend(v45, "CGColor"));
  }
  return v5;
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)UIPrintPreviewPageCell;
  [(UIPrintPreviewPageCell *)&v40 layoutSubviews];
  [(UIPrintPreviewPageCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UIPrintPreviewPageCell *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(UIPrintPreviewPageCell *)self thumbnailSize];
  double v13 = v12;
  v14 = [(UIPrintPreviewPageCell *)self contentView];
  [v14 bounds];
  double v16 = v15;

  double v17 = 0.0;
  BOOL v18 = v13 < v16;
  double v19 = 0.0;
  if (v18)
  {
    v20 = [(UIPrintPreviewPageCell *)self contentView];
    [v20 bounds];
    double v22 = v21;
    [(UIPrintPreviewPageCell *)self thumbnailSize];
    double v19 = (v22 - v23) * 0.5;
  }
  [(UIPrintPreviewPageCell *)self thumbnailSize];
  double v25 = v24;
  v26 = [(UIPrintPreviewPageCell *)self contentView];
  [v26 bounds];
  double v28 = v27;

  if (v25 < v28)
  {
    v29 = [(UIPrintPreviewPageCell *)self contentView];
    [v29 bounds];
    double v31 = v30;
    [(UIPrintPreviewPageCell *)self thumbnailSize];
    double v17 = (v31 - v32) * 0.5;
  }
  [(UIPrintPreviewPageCell *)self thumbnailSize];
  double v34 = v33;
  [(UIPrintPreviewPageCell *)self thumbnailSize];
  double v36 = v35;
  v37 = [(UIPrintPreviewPageCell *)self thumbnailView];
  objc_msgSend(v37, "setFrame:", v17, v19, v34, v36);

  double v38 = [(UIPrintPreviewPageCell *)self dimmingView];
  objc_msgSend(v38, "setFrame:", v17, v19, v34, v36);

  v39 = [(UIPrintPreviewPageCell *)self loadingProgressView];
  objc_msgSend(v39, "setFrame:", v17, v19, v34, v36);
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrintPreviewPageCell;
  [(UIPrintPreviewPageCell *)&v7 prepareForReuse];
  double v3 = [(UIPrintPreviewPageCell *)self thumbnailView];
  [v3 setImage:0];

  double v4 = [(UIPrintPreviewPageCell *)self thumbnailView];
  [v4 setHidden:0];

  double v5 = [(UIPrintPreviewPageCell *)self loadingProgressView];
  [v5 setHidden:1];

  double v6 = [(UIPrintPreviewPageCell *)self spinner];
  [v6 stopAnimating];
}

- (void)setThumbnailImage:(id)a3
{
  id v4 = a3;
  double v5 = [(UIPrintPreviewPageCell *)self thumbnailView];
  [v5 setImage:v4];

  if (v4)
  {
    double v6 = [(UIPrintPreviewPageCell *)self thumbnailView];
    [v6 setHidden:0];

    objc_super v7 = [(UIPrintPreviewPageCell *)self loadingProgressView];
    [v7 setHidden:1];

    id v8 = [(UIPrintPreviewPageCell *)self spinner];
    [v8 stopAnimating];
  }
  else
  {
    [(UIPrintPreviewPageCell *)self performSelector:sel_showThumbnailProgressSpinner withObject:0 afterDelay:0.25];
  }
}

- (void)showThumbnailProgressSpinner
{
  double v3 = [(UIPrintPreviewPageCell *)self thumbnailView];
  id v4 = [v3 image];

  if (!v4)
  {
    double v5 = [(UIPrintPreviewPageCell *)self loadingProgressView];
    [v5 setHidden:0];

    double v6 = [(UIPrintPreviewPageCell *)self spinner];
    [v6 startAnimating];

    id v7 = [(UIPrintPreviewPageCell *)self thumbnailView];
    [v7 setHidden:1];
  }
}

- (void)setPageIndex:(int64_t)a3
{
  self->_pageIndex = a3;
  double v5 = [(UIPrintPreviewPageCell *)self pageLabel];

  if (v5)
  {
    id v7 = [(UIPrintPreviewPageCell *)self pageLabelText:a3];
    double v6 = [(UIPrintPreviewPageCell *)self pageLabel];
    [v6 setText:v7];
  }
}

- (id)pageLabelText:(int64_t)a3
{
  double v5 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  int v6 = [v5 showingPageView];

  int64_t v7 = [(UIPrintPreviewPageCell *)self pageLabelFormat];
  if (v7 == 2)
  {
    double v12 = NSString;
    double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v10 = v13;
    if (v6) {
      v14 = @"Page %ld";
    }
    else {
      v14 = @"Sheet %ld";
    }
    goto LABEL_11;
  }
  if (v7 != 1)
  {
    if (!v7)
    {
      id v8 = NSString;
      double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v10 = v9;
      if (v6) {
        v11 = @"Page %ld of %ld";
      }
      else {
        v11 = @"Sheet %ld of %ld";
      }
      goto LABEL_13;
    }
    double v12 = NSString;
    double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v10 = v13;
    v14 = @"%ld";
LABEL_11:
    double v15 = [v13 localizedStringForKey:v14 value:v14 table:@"Localizable"];
    objc_msgSend(v12, "localizedStringWithFormat:", v15, a3 + 1, v18);
    goto LABEL_14;
  }
  id v8 = NSString;
  double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v10 = v9;
  v11 = @"%ld of %ld";
LABEL_13:
  double v15 = [v9 localizedStringForKey:v11 value:v11 table:@"Localizable"];
  objc_msgSend(v8, "localizedStringWithFormat:", v15, a3 + 1, -[UIPrintPreviewPageCell pageCount](self, "pageCount"));
  double v16 = LABEL_14:;

  return v16;
}

- (int64_t)pageLabelFormat
{
  double v3 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  int v4 = [v3 showingPageView];

  double v5 = NSString;
  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int64_t v7 = v6;
  if (v4)
  {
    id v8 = [v6 localizedStringForKey:@"Page %ld of %ld" value:@"Page %ld of %ld" table:@"Localizable"];
    double v9 = 25.0;
  }
  else
  {
    id v8 = [v6 localizedStringForKey:@"Sheet %ld of %ld" value:@"Sheet %ld of %ld" table:@"Localizable"];
    double v9 = 0.0;
  }
  double v10 = objc_msgSend(v5, "localizedStringWithFormat:", v8, -[UIPrintPreviewPageCell pageCount](self, "pageCount"), -[UIPrintPreviewPageCell pageCount](self, "pageCount"));

  v11 = (void *)MEMORY[0x1E4F1C9E8];
  double v12 = [(UIPrintPreviewPageCell *)self pageLabel];
  double v13 = [v12 font];
  uint64_t v14 = *MEMORY[0x1E4FB12B0];
  double v15 = [v11 dictionaryWithObject:v13 forKey:*MEMORY[0x1E4FB12B0]];
  [v10 sizeWithAttributes:v15];
  double v17 = v16;
  double v19 = v18;

  double v20 = v19 + 16.0;
  double v21 = (v19 + 16.0) / 3.0;
  double v22 = (v20 + -22.0) * 0.5;
  if (v4) {
    double v23 = v22;
  }
  else {
    double v23 = v21;
  }
  [(UIPrintPreviewPageCell *)self thumbnailSize];
  double v25 = v24 - v9 - v23 - v21;
  if (v17 <= v25)
  {
    int64_t v40 = 0;
  }
  else
  {
    v26 = NSString;
    double v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v28 = [v27 localizedStringForKey:@"%ld of %ld" value:@"%ld of %ld" table:@"Localizable"];
    v29 = objc_msgSend(v26, "localizedStringWithFormat:", v28, -[UIPrintPreviewPageCell pageCount](self, "pageCount"), -[UIPrintPreviewPageCell pageCount](self, "pageCount"));

    double v30 = (void *)MEMORY[0x1E4F1C9E8];
    double v31 = [(UIPrintPreviewPageCell *)self pageLabel];
    double v32 = [v31 font];
    double v33 = [v30 dictionaryWithObject:v32 forKey:v14];
    [v29 sizeWithAttributes:v33];
    double v35 = v34;

    if (v35 <= v25)
    {
      int64_t v40 = 1;
      double v10 = v29;
    }
    else
    {
      double v36 = NSString;
      v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v38 = v37;
      if (v4) {
        v39 = @"Page %ld";
      }
      else {
        v39 = @"Sheet %ld";
      }
      v41 = [v37 localizedStringForKey:v39 value:v39 table:@"Localizable"];
      double v10 = objc_msgSend(v36, "localizedStringWithFormat:", v41, -[UIPrintPreviewPageCell pageCount](self, "pageCount"));

      v42 = (void *)MEMORY[0x1E4F1C9E8];
      v43 = [(UIPrintPreviewPageCell *)self pageLabel];
      v44 = [v43 font];
      id v45 = [v42 dictionaryWithObject:v44 forKey:v14];
      [v10 sizeWithAttributes:v45];
      double v47 = v46;

      if (v47 <= v25) {
        int64_t v40 = 2;
      }
      else {
        int64_t v40 = 3;
      }
    }
  }

  return v40;
}

- (void)addPageLabelAndImageView:(BOOL)a3
{
  BOOL v3 = a3;
  v125[1] = *MEMORY[0x1E4F143B8];
  double v5 = NSString;
  int v6 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  char v7 = [v6 showingPageView];
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = v8;
  if (v7) {
    double v10 = @"Page %ld of %ld";
  }
  else {
    double v10 = @"Sheet %ld of %ld";
  }
  v11 = [v8 localizedStringForKey:v10 value:v10 table:@"Localizable"];
  double v12 = objc_msgSend(v5, "localizedStringWithFormat:", v11, 1, 1);

  double v13 = (void *)MEMORY[0x1E4FB1798];
  uint64_t v14 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  [v14 _scaledValueForValue:15.0];
  uint64_t v15 = objc_msgSend(v13, "boldSystemFontOfSize:");

  uint64_t v124 = *MEMORY[0x1E4FB12B0];
  v125[0] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:&v124 count:1];
  [v12 sizeWithAttributes:v16];
  double v18 = v17;
  double v20 = v19;

  double v21 = v20 + 16.0;
  double v22 = v21 / 3.0;
  if (v3) {
    double v23 = (v21 + -22.0) * 0.5;
  }
  else {
    double v23 = v21 / 3.0;
  }
  if (!self->_pageLabelBackgroundBlurView)
  {
    double v24 = 0.0;
    if (v3) {
      double v24 = 25.0;
    }
    double v25 = v22 + v24 + v18 + v23;
    id v26 = objc_alloc(MEMORY[0x1E4FB1F00]);
    double v27 = [MEMORY[0x1E4FB14C8] effectWithStyle:6];
    double v28 = (UIView *)[v26 initWithEffect:v27];

    -[UIView setFrame:](v28, "setFrame:", 0.0, 0.0, v25, v21);
    [(UIView *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [(UIView *)v28 layer];
    [v29 setCornerRadius:v21 * 0.5];

    [(UIView *)v28 setClipsToBounds:1];
    [(UIView *)v28 setUserInteractionEnabled:0];
    pageLabelBackgroundBlurView = self->_pageLabelBackgroundBlurView;
    self->_pageLabelBackgroundBlurView = v28;
    double v31 = v28;

    double v32 = [(UIPrintPreviewPageCell *)self contentView];
    [v32 addSubview:v31];

    double v33 = [(UIPrintPreviewPageCell *)self contentView];
    [v33 bringSubviewToFront:v31];
  }
  if (!self->_pageLabel)
  {
    double v34 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v34 setText:v12];
    [(UILabel *)v34 setTextAlignment:1];
    double v35 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v34 setTextColor:v35];

    [(UILabel *)v34 setFont:v15];
    double v36 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v34 setBackgroundColor:v36];

    [(UILabel *)v34 setAlpha:0.6];
    [(UILabel *)v34 setOpaque:0];
    [(UILabel *)v34 setIsAccessibilityElement:0];
    [(UILabel *)v34 setUserInteractionEnabled:0];
    v37 = [(UILabel *)v34 layer];
    double v38 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v37 setCompositingFilter:v38];

    [(UILabel *)v34 sizeToFit];
    pageLabel = self->_pageLabel;
    self->_pageLabel = v34;
  }
  v118 = (void *)v15;
  v119 = v12;
  if (!v3)
  {
    pageLabelAndChekmarkView = self->_pageLabelAndChekmarkView;
    if (pageLabelAndChekmarkView)
    {
      if ([(UIView *)pageLabelAndChekmarkView tag] != 1) {
        goto LABEL_30;
      }
      v79 = self->_pageLabelAndChekmarkView;
      if (v79)
      {
        v80 = [(UIView *)v79 subviews];
        [v80 makeObjectsPerformSelector:sel_removeFromSuperview];

        [(UIView *)self->_pageLabelAndChekmarkView removeFromSuperview];
      }
    }
    id v81 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UILabel *)self->_pageLabel bounds];
    double v83 = v82;
    [(UILabel *)self->_pageLabel bounds];
    v85 = (UIView *)objc_msgSend(v81, "initWithFrame:", 0.0, 0.0, v83, v84);
    v86 = self->_pageLabelAndChekmarkView;
    self->_pageLabelAndChekmarkView = v85;

    v87 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)self->_pageLabelAndChekmarkView setBackgroundColor:v87];

    [(UIView *)self->_pageLabelAndChekmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_pageLabelAndChekmarkView setUserInteractionEnabled:0];
    [(UIView *)self->_pageLabelAndChekmarkView addSubview:self->_pageLabel];
    v88 = [(UIPrintPreviewPageCell *)self contentView];
    [v88 addSubview:self->_pageLabelAndChekmarkView];

    v89 = [(UIPrintPreviewPageCell *)self contentView];
    [v89 bringSubviewToFront:self->_pageLabelAndChekmarkView];

    [(UIView *)self->_pageLabelAndChekmarkView setTag:0];
    v90 = [(UIPrintPreviewPageCell *)self contentView];
    v91 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelAndChekmarkView attribute:9 relatedBy:0 toItem:self->_pageLabelBackgroundBlurView attribute:9 multiplier:1.0 constant:0.0];
    v121[0] = v91;
    v92 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:3 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:3 multiplier:1.0 constant:0.0];
    v121[1] = v92;
    v93 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:5 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:5 multiplier:1.0 constant:0.0];
    v121[2] = v93;
    v94 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:4 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:4 multiplier:1.0 constant:0.0];
    v121[3] = v94;
    v95 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:6 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:6 multiplier:1.0 constant:0.0];
    v121[4] = v95;
    v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:5];
    [v90 addConstraints:v96];

LABEL_30:
    v97 = [(UIPrintPreviewPageCell *)self tapGestureRecognizer];

    if (v97)
    {
      v98 = [(UIPrintPreviewPageCell *)self tapGestureRecognizer];
      [(UIPrintPreviewPageCell *)self removeGestureRecognizer:v98];

      [(UIPrintPreviewPageCell *)self setTapGestureRecognizer:0];
    }
    goto LABEL_32;
  }
  if (!self->_checkmarkImageView)
  {
    int64_t v40 = [MEMORY[0x1E4FB1818] checkmarkImage];
    v41 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v40];
    checkmarkImageView = self->_checkmarkImageView;
    self->_checkmarkImageView = v41;

    v43 = [MEMORY[0x1E4FB1618] colorWithRed:0.00392156863 green:0.478431373 blue:0.996078431 alpha:1.0];
    [(UIView *)self->_checkmarkImageView setTintColor:v43];

    [(UIView *)self->_checkmarkImageView setContentMode:2];
    [(UIView *)self->_checkmarkImageView setUserInteractionEnabled:0];
    [(UIView *)self->_checkmarkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  if (!self->_checkmarkBackgroundImageView)
  {
    id v44 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v45 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
    double v46 = (UIView *)[v44 initWithImage:v45];
    checkmarkBackgroundImageView = self->_checkmarkBackgroundImageView;
    self->_checkmarkBackgroundImageView = v46;

    objc_super v48 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v49 = [v48 colorWithAlphaComponent:0.45];
    [(UIView *)self->_checkmarkBackgroundImageView setTintColor:v49];

    [(UIView *)self->_checkmarkBackgroundImageView setContentMode:2];
    v50 = [(UIView *)self->_checkmarkBackgroundImageView layer];
    v51 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    [v50 setCompositingFilter:v51];

    [(UIView *)self->_checkmarkBackgroundImageView setUserInteractionEnabled:0];
    [(UIView *)self->_checkmarkBackgroundImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v52 = self->_pageLabelAndChekmarkView;
  if (v52)
  {
    if ([(UIView *)v52 tag]) {
      goto LABEL_32;
    }
    v53 = self->_pageLabelAndChekmarkView;
    if (v53)
    {
      v54 = [(UIView *)v53 subviews];
      [v54 makeObjectsPerformSelector:sel_removeFromSuperview];

      [(UIView *)self->_pageLabelAndChekmarkView removeFromSuperview];
    }
  }
  [(UILabel *)self->_pageLabel bounds];
  double v56 = v55 + 22.0 + 6.0;
  [(UILabel *)self->_pageLabel bounds];
  v58 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v56, v57);
  v59 = self->_pageLabelAndChekmarkView;
  self->_pageLabelAndChekmarkView = v58;

  v60 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIView *)self->_pageLabelAndChekmarkView setBackgroundColor:v60];

  [(UIView *)self->_pageLabelAndChekmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_pageLabelAndChekmarkView setUserInteractionEnabled:0];
  [(UIView *)self->_pageLabelAndChekmarkView setTag:1];
  [(UIView *)self->_pageLabelAndChekmarkView addSubview:self->_pageLabel];
  [(UIView *)self->_pageLabelAndChekmarkView addSubview:self->_checkmarkImageView];
  [(UIView *)self->_pageLabelAndChekmarkView addSubview:self->_checkmarkBackgroundImageView];
  v61 = [(UIPrintPreviewPageCell *)self contentView];
  [v61 addSubview:self->_pageLabelAndChekmarkView];

  v62 = [(UIPrintPreviewPageCell *)self contentView];
  [v62 bringSubviewToFront:self->_pageLabelAndChekmarkView];

  v117 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkBackgroundImageView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:22.0];
  v123[0] = v117;
  v116 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkBackgroundImageView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:22.0];
  v123[1] = v116;
  v115 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkBackgroundImageView attribute:10 relatedBy:0 toItem:self->_pageLabel attribute:10 multiplier:1.0 constant:0.0];
  v123[2] = v115;
  v114 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkBackgroundImageView attribute:5 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:5 multiplier:1.0 constant:0.0];
  v123[3] = v114;
  v113 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkImageView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:22.0];
  v123[4] = v113;
  v112 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkImageView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:22.0];
  v123[5] = v112;
  v63 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkImageView attribute:9 relatedBy:0 toItem:self->_checkmarkBackgroundImageView attribute:9 multiplier:1.0 constant:0.0];
  v123[6] = v63;
  v64 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_checkmarkImageView attribute:10 relatedBy:0 toItem:self->_pageLabel attribute:10 multiplier:1.0 constant:0.0];
  v123[7] = v64;
  v65 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:6 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:6 multiplier:1.0 constant:0.0];
  v123[8] = v65;
  v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelAndChekmarkView attribute:7 relatedBy:0 toItem:self->_pageLabel attribute:7 multiplier:1.0 constant:28.0];
  v123[9] = v66;
  v67 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:10 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:10 multiplier:1.0 constant:0.0];
  v123[10] = v67;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:11];

  [(UIView *)self->_pageLabelAndChekmarkView addConstraints:v68];
  v69 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelAndChekmarkView attribute:8 relatedBy:0 toItem:self->_pageLabel attribute:8 multiplier:1.0 constant:0.0];
  v122[0] = v69;
  v70 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabel attribute:10 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:10 multiplier:1.0 constant:0.0];
  v122[1] = v70;
  v71 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelAndChekmarkView attribute:5 relatedBy:0 toItem:self->_pageLabelBackgroundBlurView attribute:5 multiplier:1.0 constant:(v21 + -22.0) * 0.5];
  v122[2] = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:3];

  v73 = [(UIPrintPreviewPageCell *)self contentView];
  [v73 addConstraints:v72];

  v74 = [(UIPrintPreviewPageCell *)self tapGestureRecognizer];

  if (!v74)
  {
    v75 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTap_];
    [(UIPrintPreviewPageCell *)self setTapGestureRecognizer:v75];

    v76 = [(UIPrintPreviewPageCell *)self tapGestureRecognizer];
    [v76 setDelegate:self];
  }
  v77 = [(UIPrintPreviewPageCell *)self tapGestureRecognizer];
  [(UIPrintPreviewPageCell *)self addGestureRecognizer:v77];

LABEL_32:
  v99 = (void *)MEMORY[0x1E4F28DC8];
  v100 = self->_pageLabelBackgroundBlurView;
  v101 = [(UIPrintPreviewPageCell *)self contentView];
  v102 = [v99 constraintWithItem:v100 attribute:9 relatedBy:0 toItem:v101 attribute:9 multiplier:1.0 constant:0.0];
  v120[0] = v102;
  v103 = (void *)MEMORY[0x1E4F28DC8];
  v104 = self->_pageLabelBackgroundBlurView;
  v105 = [(UIPrintPreviewPageCell *)self contentView];
  v106 = [v103 constraintWithItem:v104 attribute:4 relatedBy:0 toItem:v105 attribute:4 multiplier:1.0 constant:-15.0];
  v120[1] = v106;
  v107 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelBackgroundBlurView attribute:7 relatedBy:0 toItem:self->_pageLabelAndChekmarkView attribute:7 multiplier:1.0 constant:v22 + v23];
  v120[2] = v107;
  v108 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelBackgroundBlurView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v21];
  v120[3] = v108;
  v109 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pageLabelAndChekmarkView attribute:10 relatedBy:0 toItem:self->_pageLabelBackgroundBlurView attribute:10 multiplier:1.0 constant:0.0];
  v120[4] = v109;
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:5];

  v111 = [(UIPrintPreviewPageCell *)self contentView];
  [v111 addConstraints:v110];
}

- (void)setInRange:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    id v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    int v6 = (void *)MEMORY[0x1E4F28ED0];
    char v7 = [(UIPrintPreviewPageCell *)self dimmingView];
    [v7 alpha];
    *(float *)&double v8 = v8;
    double v9 = [v6 numberWithFloat:v8];
    [v25 setFromValue:v9];

    if (v4) {
      float v10 = 0.0;
    }
    else {
      float v10 = 0.7;
    }
    if (v4) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    if (v4) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    double v13 = [MEMORY[0x1E4F28ED0] numberWithFloat:COERCE_DOUBLE((unint64_t)LODWORD(v10))];
    [v25 setToValue:v13];

    [v25 setAdditive:0];
    [v25 setDuration:0.100000001];
    [MEMORY[0x1E4F39CF8] begin];
    uint64_t v14 = [(UIPrintPreviewPageCell *)self dimmingView];
    uint64_t v15 = [v14 layer];
    [v15 addAnimation:v25 forKey:@"opacity"];

    double v16 = [(UIPrintPreviewPageCell *)self dimmingView];
    [v16 setAlpha:v10];

    double v17 = [(UIPrintPreviewPageCell *)self checkmarkImageView];
    [v17 setAlpha:v11];

    double v18 = [(UIPrintPreviewPageCell *)self checkmarkBackgroundImageView];
    [v18 setAlpha:v12];

    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    double v19 = [(UIPrintPreviewPageCell *)self dimmingView];
    double v20 = v19;
    double v21 = 0.699999988;
    if (v4)
    {
      double v21 = 0.0;
      double v22 = 1.0;
    }
    else
    {
      double v22 = 0.0;
    }
    if (v4) {
      double v23 = 0.0;
    }
    else {
      double v23 = 1.0;
    }
    [v19 setAlpha:v21];

    double v24 = [(UIPrintPreviewPageCell *)self checkmarkImageView];
    [v24 setAlpha:v22];

    id v25 = [(UIPrintPreviewPageCell *)self checkmarkBackgroundImageView];
    [v25 setAlpha:v23];
  }
}

- (BOOL)locationInTapTargetOfPageLabelBadge:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_pageLabelBackgroundBlurView frame];
  CGRect v10 = CGRectInset(v9, -10.0, -10.0);
  CGFloat v5 = x;
  CGFloat v6 = y;
  return CGRectContainsPoint(v10, *(CGPoint *)&v5);
}

- (void)pageBadgeTapped:(id)a3
{
  BOOL v4 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  int v5 = [v4 canModifyPageRange];

  if (v5)
  {
    id v6 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
    objc_msgSend(v6, "pageBadgeTapped:", -[UIPrintPreviewPageCell pageIndex](self, "pageIndex"));
  }
}

- (void)handleTap:(id)a3
{
  [a3 locationInView:self];
  if (-[UIPrintPreviewPageCell locationInTapTargetOfPageLabelBadge:](self, "locationInTapTargetOfPageLabelBadge:"))
  {
    [(UIPrintPreviewPageCell *)self pageBadgeTapped:self];
  }
}

- (id)accessibilityValue
{
  BOOL v3 = NSString;
  BOOL v4 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  int v5 = [v4 showingPageView];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v7 = v6;
  if (v5) {
    double v8 = @"Page %ld";
  }
  else {
    double v8 = @"Sheet %ld";
  }
  CGRect v9 = [v6 localizedStringForKey:v8 value:v8 table:@"Localizable"];
  CGRect v10 = objc_msgSend(v3, "localizedStringWithFormat:", v9, -[UIPrintPreviewPageCell pageIndex](self, "pageIndex") + 1);

  double v11 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  int v12 = [v11 canModifyPageRange];

  if (v12)
  {
    double v13 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
    int v14 = objc_msgSend(v13, "pageIndexIsInRange:", -[UIPrintPreviewPageCell pageIndex](self, "pageIndex"));
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v16 = v15;
    if (v14) {
      double v17 = @"Page is in page range.";
    }
    else {
      double v17 = @"Page is not in page range";
    }
    double v18 = [v15 localizedStringForKey:v17 value:v17 table:@"Localizable"];
    uint64_t v19 = [v10 stringByAppendingFormat:@". %@", v18];

    CGRect v10 = (void *)v19;
  }
  return v10;
}

- (id)accessibilityHint
{
  v2 = [(UIPrintPreviewPageCell *)self printPreviewDelegate];
  if ([v2 canModifyPageRange])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v4 = [v3 localizedStringForKey:@"Modify the page range starting at this page." value:@"Modify the page range starting at this page." table:@"Localizable"];
  }
  else
  {
    BOOL v4 = &stru_1F3C9D3F8;
  }

  return v4;
}

- (UIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (UIPrintPreviewDelegate)printPreviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printPreviewDelegate);
  return (UIPrintPreviewDelegate *)WeakRetained;
}

- (void)setPrintPreviewDelegate:(id)a3
{
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (UIView)loadingProgressView
{
  return self->_loadingProgressView;
}

- (void)setLoadingProgressView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (UIView)checkmarkBackgroundImageView
{
  return self->_checkmarkBackgroundImageView;
}

- (void)setCheckmarkBackgroundImageView:(id)a3
{
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
}

- (UIView)pageLabelAndChekmarkView
{
  return self->_pageLabelAndChekmarkView;
}

- (void)setPageLabelAndChekmarkView:(id)a3
{
}

- (UIView)pageLabelBackgroundBlurView
{
  return self->_pageLabelBackgroundBlurView;
}

- (void)setPageLabelBackgroundBlurView:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageLabelBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_pageLabelAndChekmarkView, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_loadingProgressView, 0);
  objc_destroyWeak((id *)&self->_printPreviewDelegate);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end