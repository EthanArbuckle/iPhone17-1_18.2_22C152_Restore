@interface PBFPosterGallerySectionHeaderView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)subtitle;
- (NSString)text;
- (PBFPosterGallerySectionHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (UILabel)subtitleLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setSubtitle:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PBFPosterGallerySectionHeaderView

- (PBFPosterGallerySectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGallerySectionHeaderView;
  v3 = -[PBFPosterGallerySectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[PBFPosterGallerySectionHeaderView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  return v4;
}

- (void)setText:(id)a3
{
  id v7 = a3;
  v4 = [(PBFPosterGallerySectionHeaderView *)self label];
  v5 = [v4 text];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(UILabel *)self->_label setText:v7];
    [(PBFPosterGallerySectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setSubtitle:(id)a3
{
  id v7 = a3;
  v4 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
  v5 = [v4 text];
  char v6 = [v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
    [(UILabel *)self->_subtitleLabel setText:v7];
    [(PBFPosterGallerySectionHeaderView *)self setNeedsLayout];
  }
}

- (UILabel)label
{
  label = self->_label;
  if (label)
  {
    v3 = label;
  }
  else
  {
    v5 = (UILabel *)objc_opt_new();
    char v6 = self->_label;
    self->_label = v5;

    id v7 = [(PBFPosterGallerySectionHeaderView *)self window];
    v8 = [v7 screen];
    v9 = +[PBFPosterGalleryViewSpec specForScreen:v8];

    [(UILabel *)self->_label setNumberOfLines:0];
    v10 = self->_label;
    v11 = [v9 sectionHeaderTitleFont];
    [(UILabel *)v10 setFont:v11];

    v12 = self->_label;
    v13 = [v9 sectionHeaderTitleColor];
    [(UILabel *)v12 setTextColor:v13];

    [(PBFPosterGallerySectionHeaderView *)self addSubview:self->_label];
    v3 = self->_label;
  }
  return v3;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v3 = subtitleLabel;
  }
  else
  {
    v5 = [(PBFPosterGallerySectionHeaderView *)self window];
    char v6 = [v5 screen];
    id v7 = +[PBFPosterGalleryViewSpec specForScreen:v6];

    v8 = (UILabel *)objc_opt_new();
    v9 = self->_subtitleLabel;
    self->_subtitleLabel = v8;

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    v10 = self->_subtitleLabel;
    v11 = [v7 sectionHeaderSubtitleFont];
    [(UILabel *)v10 setFont:v11];

    v12 = self->_subtitleLabel;
    v13 = [v7 sectionHeaderSubtitleColor];
    [(UILabel *)v12 setTextColor:v13];

    [(PBFPosterGallerySectionHeaderView *)self addSubview:self->_subtitleLabel];
    v3 = self->_subtitleLabel;
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGallerySectionHeaderView;
  [(PBFPosterGallerySectionHeaderView *)&v3 prepareForReuse];
  [(UILabel *)self->_label setText:0];
  [(UILabel *)self->_subtitleLabel setText:0];
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)PBFPosterGallerySectionHeaderView;
  [(PBFPosterGallerySectionHeaderView *)&v43 layoutSubviews];
  objc_super v3 = [(PBFPosterGallerySectionHeaderView *)self window];
  v4 = [v3 screen];
  v5 = +[PBFPosterGalleryViewSpec specForScreen:v4];

  uint64_t v6 = [(PBFPosterGallerySectionHeaderView *)self effectiveUserInterfaceLayoutDirection];
  [(PBFPosterGallerySectionHeaderView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  v11 = [(PBFPosterGallerySectionHeaderView *)self label];
  objc_msgSend(v11, "systemLayoutSizeFittingSize:", v8, v10);
  double v13 = v12;
  double v15 = v14;

  if (v6) {
    double v16 = v8 - v13;
  }
  else {
    double v16 = 0.0;
  }
  [v5 sectionHeaderTopSpacing];
  double v18 = v17;
  v19 = [(PBFPosterGallerySectionHeaderView *)self label];
  objc_msgSend(v19, "setFrame:", v16, v18, v13, v15);

  v20 = NSString;
  v21 = [(PBFPosterGallerySectionHeaderView *)self label];
  v22 = [v21 text];
  v23 = [v20 stringWithFormat:@"header-%@", v22];

  v24 = [(PBFPosterGallerySectionHeaderView *)self label];
  [v24 setAccessibilityIdentifier:v23];

  v25 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
  v26 = [v25 text];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    v28 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
    objc_msgSend(v28, "systemLayoutSizeFittingSize:", v8, v10);
    double v30 = v29;
    double v32 = v31;

    if (v6) {
      double v33 = v8 - v30;
    }
    else {
      double v33 = 0.0;
    }
    v44.origin.x = v16;
    v44.origin.y = v18;
    v44.size.width = v13;
    v44.size.height = v15;
    double MaxY = CGRectGetMaxY(v44);
    [v5 sectionHeaderSubtitleTopMargin];
    double v36 = MaxY + v35;
    v37 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
    objc_msgSend(v37, "setFrame:", v33, v36, v30, v32);

    v38 = NSString;
    v39 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
    v40 = [v39 text];
    v41 = [v38 stringWithFormat:@"subtitle-%@", v40];

    v42 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
    [v42 setAccessibilityIdentifier:v41];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v10 = [(PBFPosterGallerySectionHeaderView *)self window];
  v11 = [v10 screen];
  double v12 = +[PBFPosterGalleryViewSpec specForScreen:v11];

  [v12 sectionHeaderTopSpacing];
  double v14 = v13;
  [v12 sectionHeaderBottomSpacing];
  double v16 = v14 + v15;
  double v17 = [(PBFPosterGallerySectionHeaderView *)self label];
  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  objc_msgSend(v17, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v18, v19);
  double v21 = v20;

  double v22 = v16 + v21;
  v23 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    v25 = [(PBFPosterGallerySectionHeaderView *)self subtitleLabel];
    *(float *)&double v26 = a4;
    *(float *)&double v27 = a5;
    objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v26, v27);
    double v29 = v28;

    [v12 sectionHeaderSubtitleTopMargin];
    double v22 = v29 + v22 + v30;
  }

  double v31 = width;
  double v32 = v22;
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end