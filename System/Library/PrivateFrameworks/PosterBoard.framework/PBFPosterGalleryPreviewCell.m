@interface PBFPosterGalleryPreviewCell
+ (CGSize)contentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (CGSize)contentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (CGSize)contentSizeForSmartAlbumCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (CGSize)contentSizeForSmartAlbumCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (CGSize)heroContentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (CGSize)heroContentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5;
+ (double)maximumTitleHeightForFont:(id)a3;
- (BOOL)supportsPosterDescription;
- (BOOL)supportsPosterTitle;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSAttributedString)attributedPosterTitle;
- (NSString)posterDescription;
- (NSString)posterTitle;
- (PBFPosterGalleryPreviewView)posterPreviewView;
- (id)pbf_displayContext;
- (id)titleLabel;
- (void)_setMutableAttributedPosterTitle:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAttributedPosterTitle:(id)a3;
- (void)setPosterTitle:(id)a3;
- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7;
@end

@implementation PBFPosterGalleryPreviewCell

+ (CGSize)contentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [v8 posterContentSizeForOrientation:a4];
  double v10 = v9;
  double v12 = v11;
  if (v6)
  {
    [a1 maximumTitleHeightForFont:0];
    double v14 = v13;
    [v8 previewCellLabelToImageVerticalSpacing];
    double v12 = v12 + v14 + v15;
  }

  double v16 = v10;
  double v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)contentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height = a3.height;
  id v7 = a5;
  [v7 posterContentSizeForOrientation:a4];
  double v9 = v8;
  double v11 = v10;
  if (height > 0.0)
  {
    [v7 previewCellLabelToImageVerticalSpacing];
    double v11 = v11 + height + v12;
  }

  double v13 = v9;
  double v14 = v11;
  result.double height = v14;
  result.width = v13;
  return result;
}

+ (CGSize)contentSizeForSmartAlbumCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  [a1 contentSizeForCellWithTitle:v6 interfaceOrientation:a4 spec:v8];
  double v10 = v9;
  double v12 = v11;
  [v8 previewSmartAlbumCellAdditionalTopMargin];
  double v14 = v13;

  double v15 = v12 + v14;
  double v16 = v10;
  result.double height = v15;
  result.width = v16;
  return result;
}

+ (CGSize)contentSizeForSmartAlbumCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  objc_msgSend(a1, "contentSizeForCellWithTitleSize:interfaceOrientation:spec:", a4, v9, width, height);
  double v11 = v10;
  double v13 = v12;
  [v9 previewSmartAlbumCellAdditionalTopMargin];
  double v15 = v14;

  double v16 = v13 + v15;
  double v17 = v11;
  result.double height = v16;
  result.double width = v17;
  return result;
}

+ (CGSize)heroContentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  [v7 posterHeroContentSize];
  double v9 = v8;
  double v11 = v10;
  if (v5)
  {
    [a1 maximumTitleHeightForFont:0];
    double v13 = v12;
    [v7 previewCellLabelToImageVerticalSpacing];
    double v11 = v11 + v13 + v14;
  }

  double v15 = v9;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

+ (CGSize)heroContentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height = a3.height;
  id v6 = a5;
  [v6 posterHeroContentSize];
  double v8 = v7;
  double v10 = v9;
  if (height > 0.0)
  {
    [v6 previewCellLabelToImageVerticalSpacing];
    double v10 = v10 + height + v11;
  }

  double v12 = v8;
  double v13 = v10;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (double)maximumTitleHeightForFont:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = +[PBFPosterGalleryViewSpec specForScreen:0];
    id v3 = [v4 previewCellLabelFont];
  }
  [v3 lineHeight];
  double v6 = v5;

  return v6;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewCell;
  [(PBFPosterGalleryPreviewCell *)&v4 prepareForReuse];
  [(PBFPosterGalleryPreviewCell *)self setPosterTitle:0];
  [(PBFPosterGalleryPreviewCell *)self setAttributedPosterTitle:0];
  id v3 = [(PBFPosterGalleryPreviewCell *)self posterPreviewView];
  [v3 prepareForReuse];
}

- (BOOL)supportsPosterTitle
{
  return 1;
}

- (BOOL)supportsPosterDescription
{
  return 0;
}

- (id)pbf_displayContext
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewCell;
  id v3 = [(UIView *)&v6 pbf_displayContext];
  objc_super v4 = [v3 displayContextWithUpdatedInterfaceOrientation:self->_layoutOrientation];

  return v4;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  double v12 = (NSString *)a3;
  id v13 = a5;
  double v14 = [(PBFPosterGalleryPreviewCell *)self posterPreviewView];
  [v14 updatePreviewType:v12 scale:v13 posterPreviewView:a6 layoutOrientation:a7 index:a4];

  self->_layoutOrientation = a6;
  previewType = self->_previewType;
  self->_previewType = v12;

  [(PBFPosterGalleryPreviewCell *)self invalidateIntrinsicContentSize];
  [(PBFPosterGalleryPreviewCell *)self setNeedsLayout];
}

- (NSString)posterTitle
{
  v2 = [(PBFPosterGalleryPreviewCell *)self titleLabel];
  id v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPosterTitle:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(PBFPosterGalleryPreviewCell *)self posterTitle];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7) {
      objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7];
    }
    else {
      objc_super v6 = 0;
    }
    [(PBFPosterGalleryPreviewCell *)self _setMutableAttributedPosterTitle:v6];
  }
}

- (NSAttributedString)attributedPosterTitle
{
  v2 = [(PBFPosterGalleryPreviewCell *)self titleLabel];
  id v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setAttributedPosterTitle:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(PBFPosterGalleryPreviewCell *)self attributedPosterTitle];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    objc_super v6 = (void *)[v7 mutableCopy];
    [(PBFPosterGalleryPreviewCell *)self _setMutableAttributedPosterTitle:v6];
  }
}

- (void)_setMutableAttributedPosterTitle:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    objc_super v4 = objc_opt_new();
    LODWORD(v5) = 1036831949;
    [v4 setHyphenationFactor:v5];
    [v4 setAllowsDefaultTighteningForTruncation:1];
    [v4 setLineBreakMode:4];
    [v4 setAlignment:1];
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v4, 0, objc_msgSend(v7, "length"));
  }
  objc_super v6 = [(PBFPosterGalleryPreviewCell *)self titleLabel];
  [v6 setAttributedText:v7];

  self->_titleLabelSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(PBFPosterGalleryPreviewCell *)self setNeedsLayout];
}

- (NSString)posterDescription
{
  return 0;
}

- (id)titleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    id v3 = titleLabel;
  }
  else
  {
    double v5 = [(PBFPosterGalleryPreviewCell *)self window];
    objc_super v6 = [v5 screen];
    id v7 = +[PBFPosterGalleryViewSpec specForScreen:v6];

    double v8 = (UILabel *)objc_opt_new();
    double v9 = self->_titleLabel;
    self->_titleLabel = v8;

    double v10 = self->_titleLabel;
    double v11 = [v7 previewCellLabelFont];
    [(UILabel *)v10 setFont:v11];

    double v12 = self->_titleLabel;
    id v13 = [v7 previewCellLabelColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    [(UILabel *)self->_titleLabel setMaximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
    double v14 = [(PBFPosterGalleryPreviewCell *)self contentView];
    [v14 addSubview:self->_titleLabel];

    [(PBFPosterGalleryPreviewCell *)self setNeedsLayout];
    id v3 = self->_titleLabel;
  }
  return v3;
}

- (PBFPosterGalleryPreviewView)posterPreviewView
{
  posterPreviewView = self->_posterPreviewView;
  if (!posterPreviewView)
  {
    objc_super v4 = (PBFPosterGalleryPreviewView *)objc_opt_new();
    double v5 = self->_posterPreviewView;
    self->_posterPreviewView = v4;

    [(PBFPosterGalleryPreviewView *)self->_posterPreviewView sizeToFit];
    objc_super v6 = [(PBFPosterGalleryPreviewCell *)self contentView];
    [v6 addSubview:self->_posterPreviewView];

    id v7 = [(PBFPosterGalleryPreviewCell *)self contentView];
    [v7 sendSubviewToBack:self->_posterPreviewView];

    posterPreviewView = self->_posterPreviewView;
  }
  double v8 = posterPreviewView;
  return v8;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)PBFPosterGalleryPreviewCell;
  [(PBFPosterGalleryPreviewCell *)&v41 layoutSubviews];
  id v3 = [(PBFPosterGalleryPreviewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(PBFPosterGalleryPreviewCell *)self titleLabel];
  double v9 = [(PBFPosterGalleryPreviewCell *)self posterPreviewView];
  double v10 = [(PBFPosterGalleryPreviewCell *)self window];
  double v11 = [v10 screen];
  double v12 = +[PBFPosterGalleryViewSpec specForScreen:v11];

  [v9 bounds];
  double v14 = v13;
  if ((__CFString *)self->_previewType == PBFPreviewTypeHero) {
    [v12 posterHeroContentSize];
  }
  else {
    [v12 posterContentSizeForOrientation:self->_layoutOrientation];
  }
  if (v15 <= v5) {
    double v17 = v15;
  }
  else {
    double v17 = v5;
  }
  if (v16 <= v7) {
    CGFloat v18 = v16;
  }
  else {
    CGFloat v18 = v7;
  }
  UIFloorToViewScale();
  double v20 = v19;
  previewType = (__CFString *)self->_previewType;
  if (previewType == PBFPreviewTypeSmartAlbum)
  {
    [v12 previewSmartAlbumCellAdditionalTopMargin];
    double v14 = v14 + v22;
    previewType = (__CFString *)self->_previewType;
  }
  if (previewType == PBFPreviewTypeHero) {
    double v23 = v5 + 14.0;
  }
  else {
    double v23 = v5;
  }
  if (self->_titleLabelSize.width == *MEMORY[0x1E4F1DB30]
    && self->_titleLabelSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v24 = [v8 text];
    if ([v24 length])
    {
      objc_msgSend(v8, "sizeThatFits:", v23, v7);
    }
    else
    {
      CGFloat v25 = 0.0;
      CGFloat v26 = 0.0;
    }
    self->_titleLabelSize.double width = v25;
    self->_titleLabelSize.double height = v26;
  }
  [v8 frame];
  v42.origin.x = v20;
  v42.origin.y = v14;
  v42.size.double width = v17;
  v42.size.double height = v18;
  CGRectGetMaxY(v42);
  [v12 previewCellLabelToImageVerticalSpacing];
  v27 = objc_opt_class();
  v28 = [v8 font];
  [v27 maximumTitleHeightForFont:v28];

  v29 = [(PBFPosterGalleryPreviewCell *)self traitCollection];
  [v29 displayScale];
  uint64_t v40 = v30;
  double v31 = v18;
  UIRectCenteredXInRectScale();
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  objc_msgSend(v9, "frame", v40);
  v45.origin.x = v20;
  v45.origin.y = v14;
  v45.size.double width = v17;
  v45.size.double height = v31;
  if (!CGRectEqualToRect(v43, v45)) {
    objc_msgSend(v9, "setFrame:", v20, v14, v17, v31);
  }
  [v8 frame];
  v46.origin.x = v33;
  v46.origin.y = v35;
  v46.size.double width = v37;
  v46.size.double height = v39;
  if (!CGRectEqualToRect(v44, v46)) {
    objc_msgSend(v8, "setFrame:", v33, v35, v37, v39);
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = [(PBFPosterGalleryPreviewCell *)self titleLabel];
  double v11 = [v10 text];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    *(float *)&double v13 = a4;
    *(float *)&double v14 = a5;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v13, v14);
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  previewType = (__CFString *)self->_previewType;
  if (previewType == PBFPreviewTypeHero)
  {
    v27 = objc_opt_class();
    int64_t layoutOrientation = self->_layoutOrientation;
    double v23 = [(PBFPosterGalleryPreviewCell *)self pbf_displayContext];
    v24 = +[PBFPosterGalleryViewSpec specForDisplayContext:v23];
    objc_msgSend(v27, "heroContentSizeForCellWithTitleSize:interfaceOrientation:spec:", layoutOrientation, v24, v16, v18);
  }
  else
  {
    double v20 = PBFPreviewTypeSmartAlbum;
    v21 = objc_opt_class();
    int64_t v22 = self->_layoutOrientation;
    double v23 = [(PBFPosterGalleryPreviewCell *)self pbf_displayContext];
    v24 = +[PBFPosterGalleryViewSpec specForDisplayContext:v23];
    if (previewType == v20) {
      objc_msgSend(v21, "contentSizeForSmartAlbumCellWithTitleSize:interfaceOrientation:spec:", v22, v24, v16, v18);
    }
    else {
      objc_msgSend(v21, "contentSizeForCellWithTitleSize:interfaceOrientation:spec:", v22, v24, v16, v18);
    }
  }
  double v29 = v25;
  double v30 = v26;

  double v31 = v29;
  double v32 = v30;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedPosterTitle, 0);
  objc_storeStrong((id *)&self->_posterTitle, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end