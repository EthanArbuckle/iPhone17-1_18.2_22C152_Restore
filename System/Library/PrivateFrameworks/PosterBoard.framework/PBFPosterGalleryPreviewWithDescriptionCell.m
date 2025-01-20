@interface PBFPosterGalleryPreviewWithDescriptionCell
- ($91384402D6A983DE6D4FF1F0AF3B9FB7)metrics;
- (BOOL)supportsPosterDescription;
- (BOOL)supportsPosterTitle;
- (CGSize)intrinsicContentSize;
- (NSString)posterDescription;
- (PBFPosterGalleryPreviewView)posterPreviewView;
- (id)pbf_displayContext;
- (id)posterDescriptionLabel;
- (id)spec;
- (void)didMoveToWindow;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setPosterDescription:(id)a3;
- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7;
@end

@implementation PBFPosterGalleryPreviewWithDescriptionCell

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  [(PBFPosterGalleryPreviewWithDescriptionCell *)&v7 prepareForReuse];
  CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGSize v5 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_metrics.posterDescriptionLabelFrame.size = v3;
  self->_metrics.intrinsicContentSize = v5;
  self->_metrics.posterViewFrame.size = v3;
  self->_metrics.posterDescriptionLabelFrame.origin = v4;
  self->_metrics.posterViewFrame.origin = v4;
  v6 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterPreviewView];
  [v6 prepareForReuse];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  [(PBFPosterGalleryPreviewWithDescriptionCell *)&v4 didMoveToWindow];
  spec = self->_spec;
  self->_spec = 0;
}

- (BOOL)supportsPosterTitle
{
  return 1;
}

- (BOOL)supportsPosterDescription
{
  return 1;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  id v15 = a3;
  id v13 = a5;
  v14 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterPreviewView];
  [v14 updatePreviewType:v15 scale:v13 posterPreviewView:a6 layoutOrientation:a7 index:a4];

  if (*(_OWORD *)&self->_layoutOrientation != __PAIR128__((unint64_t)v15, a6))
  {
    self->_layoutOrientation = a6;
    objc_storeStrong((id *)&self->_previewType, a3);
    [(PBFPosterGalleryPreviewWithDescriptionCell *)self invalidateIntrinsicContentSize];
    [(PBFPosterGalleryPreviewWithDescriptionCell *)self setNeedsLayout];
  }
}

- (NSString)posterDescription
{
  v2 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterDescriptionLabel];
  CGSize v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setPosterDescription:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterDescriptionLabel];
  char v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    v6 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterDescriptionLabel];
    [v6 setText:v10];

    CGPoint v8 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGSize v9 = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_metrics.posterDescriptionLabelFrame.size = v7;
    self->_metrics.intrinsicContentSize = v9;
    self->_metrics.posterViewFrame.size = v7;
    self->_metrics.posterDescriptionLabelFrame.origin = v8;
    self->_metrics.posterViewFrame.origin = v8;
    [(PBFPosterGalleryPreviewWithDescriptionCell *)self setNeedsLayout];
  }
}

- (id)posterDescriptionLabel
{
  posterDescriptionLabel = self->_posterDescriptionLabel;
  if (!posterDescriptionLabel)
  {
    objc_super v4 = (UILabel *)objc_opt_new();
    char v5 = self->_posterDescriptionLabel;
    self->_posterDescriptionLabel = v4;

    [(UILabel *)self->_posterDescriptionLabel setNumberOfLines:0];
    v6 = self->_posterDescriptionLabel;
    CGSize v7 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self spec];
    CGPoint v8 = [v7 previewCellDescriptionLabelFont];
    [(UILabel *)v6 setFont:v8];

    CGSize v9 = self->_posterDescriptionLabel;
    id v10 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self spec];
    v11 = [v10 previewCellDescriptionLabelColor];
    [(UILabel *)v9 setTextColor:v11];

    [(UILabel *)self->_posterDescriptionLabel setTextAlignment:4];
    v12 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self contentView];
    [v12 addSubview:self->_posterDescriptionLabel];

    [(PBFPosterGalleryPreviewWithDescriptionCell *)self setNeedsLayout];
    posterDescriptionLabel = self->_posterDescriptionLabel;
  }
  id v13 = posterDescriptionLabel;
  return v13;
}

- (id)pbf_displayContext
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  CGSize v3 = [(UIView *)&v6 pbf_displayContext];
  objc_super v4 = [v3 displayContextWithUpdatedInterfaceOrientation:self->_layoutOrientation];

  return v4;
}

- (PBFPosterGalleryPreviewView)posterPreviewView
{
  posterPreviewView = self->_posterPreviewView;
  if (!posterPreviewView)
  {
    objc_super v4 = (PBFPosterGalleryPreviewView *)objc_opt_new();
    char v5 = self->_posterPreviewView;
    self->_posterPreviewView = v4;

    [(PBFPosterGalleryPreviewView *)self->_posterPreviewView sizeToFit];
    objc_super v6 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self contentView];
    [v6 addSubview:self->_posterPreviewView];

    CGSize v7 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self contentView];
    [v7 sendSubviewToBack:self->_posterPreviewView];

    posterPreviewView = self->_posterPreviewView;
  }
  CGPoint v8 = posterPreviewView;
  return v8;
}

- (id)spec
{
  spec = self->_spec;
  if (!spec)
  {
    objc_super v4 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self window];
    char v5 = [v4 screen];
    objc_super v6 = +[PBFPosterGalleryViewSpec specForScreen:v5];
    CGSize v7 = self->_spec;
    self->_spec = v6;

    spec = self->_spec;
  }
  return spec;
}

- ($91384402D6A983DE6D4FF1F0AF3B9FB7)metrics
{
  p_y = (char *)&self[8].var0.origin.y;
  if (self[8].var2.height == *MEMORY[0x1E4F1DB30] && self[9].var0.origin.x == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    CGPoint v8 = self;
    id v33 = [($91384402D6A983DE6D4FF1F0AF3B9FB7 *)self spec];
    [($91384402D6A983DE6D4FF1F0AF3B9FB7 *)v8 bounds];
    double v10 = v9;
    v11 = [($91384402D6A983DE6D4FF1F0AF3B9FB7 *)v8 traitCollection];
    [v11 displayScale];

    uint64_t v12 = [($91384402D6A983DE6D4FF1F0AF3B9FB7 *)v8 effectiveUserInterfaceLayoutDirection];
    [v33 standardSpacing];
    double v14 = v13;
    [v33 posterContentSizeForOrientation:*(void *)&v8[9].var0.size.width];
    double v16 = v15;
    double v18 = v17;
    double v19 = v10 - v15;
    if (v12) {
      double v20 = v10 - v15;
    }
    else {
      double v20 = 0.0;
    }
    double v32 = v20;
    objc_msgSend(*(id *)&v8[8].var0.origin.x, "sizeThatFits:", v10 - (v14 + v16), 1000.0);
    double v23 = v22;
    if (v21 >= v18) {
      double v24 = v18;
    }
    else {
      double v24 = v21;
    }
    if (v12)
    {
      v35.origin.y = 0.0;
      v35.origin.x = v19;
      v35.size.width = v16;
      v35.size.height = v18;
      double v25 = CGRectGetMinX(v35) - v14 - v23;
    }
    else
    {
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      v36.size.width = v16;
      v36.size.height = v18;
      double v25 = v14 + CGRectGetMaxX(v36);
    }
    *(double *)p_y = v32;
    *((void *)p_y + 1) = 0;
    *((double *)p_y + 2) = v16;
    *((double *)p_y + 3) = v18;
    *((double *)p_y + 6) = v23;
    *((double *)p_y + 7) = v24;
    *((double *)p_y + 4) = v25;
    UIRectCenteredYInRectScale();
    *((void *)p_y + 4) = v26;
    *((void *)p_y + 5) = v27;
    *((void *)p_y + 6) = v28;
    *((void *)p_y + 7) = v29;
    *((double *)p_y + 8) = v14 + v16 + v23;
    *((double *)p_y + 9) = v18;
    CGSize v30 = (CGSize)*((_OWORD *)p_y + 1);
    retstr->var0.origin = *(CGPoint *)p_y;
    retstr->var0.size = v30;
    CGSize v31 = (CGSize)*((_OWORD *)p_y + 3);
    retstr->var1.origin = (CGPoint)*((_OWORD *)p_y + 2);
    retstr->var1.size = v31;
    retstr->var2 = (CGSize)*((_OWORD *)p_y + 4);
  }
  else
  {
    CGSize v6 = *(CGSize *)&self[8].var1.size.height;
    retstr->var1.origin = *(CGPoint *)&self[8].var1.origin.y;
    retstr->var1.size = v6;
    retstr->var2 = *(CGSize *)&self[8].var2.height;
    CGSize v7 = *(CGSize *)&self[8].var0.size.height;
    retstr->var0.origin = *(CGPoint *)p_y;
    retstr->var0.size = v7;
  }
  return self;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  [(PBFPosterGalleryPreviewWithDescriptionCell *)&v5 layoutSubviews];
  [(PBFPosterGalleryPreviewWithDescriptionCell *)self metrics];
  CGSize v3 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterDescriptionLabel];
  objc_super v4 = [(PBFPosterGalleryPreviewWithDescriptionCell *)self posterPreviewView];
  [v4 frame];
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 0.0;
  v8.size.height = 0.0;
  if (!CGRectEqualToRect(v6, v8)) {
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0, 0.0);
  }
  [v3 frame];
  v9.origin = 0u;
  v9.size = 0u;
  if (!CGRectEqualToRect(v7, v9)) {
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 0.0, 0.0);
  }
}

- (CGSize)intrinsicContentSize
{
  [(PBFPosterGalleryPreviewWithDescriptionCell *)self metrics];
  double v2 = v4;
  double v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGSize v4 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_metrics.posterDescriptionLabelFrame.size = v3;
  self->_metrics.intrinsicContentSize = v4;
  self->_metrics.posterViewFrame.size = v3;
  self->_metrics.posterDescriptionLabelFrame.origin = v2;
  self->_metrics.posterViewFrame.origin = v2;
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  [(PBFPosterGalleryPreviewWithDescriptionCell *)&v5 invalidateIntrinsicContentSize];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterDescription, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_posterDescriptionLabel, 0);
}

@end