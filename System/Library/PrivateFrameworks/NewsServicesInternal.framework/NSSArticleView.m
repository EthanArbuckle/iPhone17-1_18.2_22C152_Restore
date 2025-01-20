@interface NSSArticleView
- (CGSize)preferredSize;
- (NSSArticleInternal)article;
- (NSSArticleView)init;
- (NSSArticleView)initWithCoder:(id)a3;
- (NSSArticleView)initWithFrame:(CGRect)a3;
- (UIImageView)publisherLogoImageView;
- (UIImageView)thumbnailImageView;
- (UILabel)dateLabel;
- (UILabel)excerptLabel;
- (UILabel)publisherLabel;
- (UILabel)titleLabel;
- (UIView)thumbnailContainerView;
- (double)calculateHeightForWidth:(double)a3;
- (void)_commonInit;
- (void)_updateFonts;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setArticle:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setExcerptLabel:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setPublisherLabel:(id)a3;
- (void)setPublisherLogoImageView:(id)a3;
- (void)setThumbnailContainerView:(id)a3;
- (void)setThumbnailImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NSSArticleView

- (NSSArticleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSArticleView;
  v3 = -[NSSArticleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NSSArticleView *)v3 _commonInit];
  }
  return v4;
}

- (NSSArticleView)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSSArticleView;
  v2 = [(NSSArticleView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NSSArticleView *)v2 _commonInit];
  }
  return v3;
}

- (void)setArticle:(id)a3
{
  objc_super v5 = (NSSArticleInternal *)a3;
  if (self->_article != v5)
  {
    objc_storeStrong((id *)&self->_article, a3);
    objc_super v6 = [(NSSArticleInternal *)v5 thumbnailImage];
    v7 = [(NSSArticleView *)self thumbnailImageView];
    [v7 setImage:v6];

    v8 = [(NSSArticleInternal *)v5 title];
    v9 = [(NSSArticleView *)self titleLabel];
    [v9 setText:v8];

    v10 = [(NSSArticleInternal *)v5 shortExcerpt];
    v11 = [(NSSArticleView *)self excerptLabel];
    [v11 setText:v10];

    v12 = [(NSSArticleInternal *)v5 publisherName];
    v13 = [(NSSArticleView *)self publisherLabel];
    [v13 setText:v12];

    v14 = [(NSSArticleView *)self traitCollection];
    uint64_t v15 = [v14 userInterfaceStyle];

    if (v15 == 2) {
      [(NSSArticleInternal *)v5 publisherLogoMaskImage];
    }
    else {
    v16 = [(NSSArticleInternal *)v5 publisherLogoImage];
    }
    v17 = [(NSSArticleView *)self publisherLogoImageView];
    [v17 setImage:v16];

    v18 = [(NSSArticleInternal *)v5 publishDate];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __29__NSSArticleView_setArticle___block_invoke;
    v21[3] = &unk_1E6D3F5B0;
    v21[4] = self;
    objc_msgSend(v18, "nss_gregorianDescriptionWithFlags:options:completion:", 1, 0, v21);

    [(NSSArticleView *)self bounds];
    CGFloat v19 = CGRectGetWidth(v22) + -32.0;
    [(NSSArticleView *)self calculateHeightForWidth:v19];
    -[NSSArticleView setPreferredSize:](self, "setPreferredSize:", v19, round(v20));
    [(NSSArticleView *)self setNeedsLayout];
  }
}

void __29__NSSArticleView_setArticle___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dateLabel];
  [v4 setText:v3];
}

- (double)calculateHeightForWidth:(double)a3
{
  objc_super v5 = [(NSSArticleView *)self thumbnailImageView];
  objc_super v6 = [v5 image];

  v7 = [(NSSArticleView *)self publisherLogoImageView];
  v8 = [v7 image];

  v9 = [(NSSArticleView *)self publisherLabel];
  v10 = [v9 text];

  v11 = [(NSSArticleView *)self titleLabel];
  v12 = [v11 text];

  v13 = [(NSSArticleView *)self excerptLabel];
  v14 = [v13 text];

  uint64_t v15 = [(NSSArticleView *)self dateLabel];
  v16 = [v15 text];

  double v17 = 16.0;
  double v18 = a3 * 3.0 * 0.25 + 16.0;
  if (v6) {
    double v19 = 18.0;
  }
  else {
    double v19 = 0.0;
  }
  if (v6) {
    double v20 = a3 * 3.0 * 0.25 + 16.0;
  }
  else {
    double v20 = 16.0;
  }
  if (v8)
  {
    double v17 = v19 + 16.0;
    double v20 = v20 + v19 + 16.0;
  }
  else
  {
    if (!v10) {
      goto LABEL_12;
    }
    v21 = [(NSSArticleView *)self publisherLabel];
    [v21 sizeToFit];

    CGRect v22 = [(NSSArticleView *)self publisherLabel];
    [v22 frame];
    double v20 = v20 + v19 + CGRectGetHeight(v33);
  }
  double v19 = 8.0;
LABEL_12:
  if (v12)
  {
    v23 = [(NSSArticleView *)self titleLabel];
    [v23 sizeToFit];

    v24 = [(NSSArticleView *)self titleLabel];
    [v24 frame];
    double v20 = v20 + v19 + CGRectGetHeight(v34);

    double v19 = 5.0;
  }
  if (v14)
  {
    if (v6) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 8;
    }
    v26 = [(NSSArticleView *)self excerptLabel];
    [v26 setNumberOfLines:v25];

    v27 = [(NSSArticleView *)self excerptLabel];
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, a3, 0.0);

    v28 = [(NSSArticleView *)self excerptLabel];
    [v28 sizeToFit];

    v29 = [(NSSArticleView *)self excerptLabel];
    [v29 frame];
    double v20 = v20 + v19 + CGRectGetHeight(v35);

    double v19 = 8.0;
  }
  if (v16)
  {
    v30 = [(NSSArticleView *)self dateLabel];
    [v30 sizeToFit];

    v31 = [(NSSArticleView *)self dateLabel];
    [v31 frame];
    double v20 = v20 + v19 + CGRectGetHeight(v36);
  }
  return v20 + 16.0;
}

- (void)layoutSubviews
{
  v85.receiver = self;
  v85.super_class = (Class)NSSArticleView;
  [(NSSArticleView *)&v85 layoutSubviews];
  [(NSSArticleView *)self bounds];
  double v3 = CGRectGetWidth(v86) + -32.0;
  id v4 = [(NSSArticleView *)self thumbnailImageView];
  objc_super v5 = [v4 image];

  objc_super v6 = [(NSSArticleView *)self publisherLogoImageView];
  v7 = [v6 image];

  v8 = [(NSSArticleView *)self thumbnailContainerView];
  v9 = v8;
  if (v5)
  {
    [v8 setHidden:0];

    v10 = [(NSSArticleView *)self thumbnailContainerView];
    objc_msgSend(v10, "setFrame:", 16.0, 16.0, v3, v3 * 3.0 * 0.25);

    v11 = [(NSSArticleView *)self thumbnailContainerView];
    [v11 frame];
    CGRect v88 = CGRectIntegral(v87);
    double x = v88.origin.x;
    double y = v88.origin.y;
    double width = v88.size.width;
    double height = v88.size.height;
    v16 = [(NSSArticleView *)self thumbnailContainerView];
    objc_msgSend(v16, "setFrame:", x, y, width, height);

    double v17 = v3 * 3.0 * 0.25 + 16.0;
    double v18 = 18.0;
  }
  else
  {
    [v8 setHidden:1];

    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v23 = [(NSSArticleView *)self thumbnailContainerView];
    objc_msgSend(v23, "setFrame:", v19, v20, v21, v22);

    double v17 = 16.0;
    double v18 = 0.0;
  }
  if (v7)
  {
    v24 = [(NSSArticleView *)self publisherLogoImageView];
    [v24 setHidden:0];

    uint64_t v25 = [(NSSArticleView *)self publisherLabel];
    [v25 setHidden:1];

    v26 = [(NSSArticleView *)self publisherLogoImageView];
    v27 = [v26 image];
    [v27 size];
    double v29 = v28;
    double v31 = v30;

    double v32 = 16.0;
    CGRect v33 = [(NSSArticleView *)self publisherLogoImageView];
    CGRect v34 = v33;
    double v35 = 16.0;
    double v36 = 16.0;
    double v37 = v18 + v17;
    double v38 = v29 * 16.0 / v31;
  }
  else
  {
    v39 = [(NSSArticleView *)self publisherLabel];
    [v39 setHidden:0];

    v40 = [(NSSArticleView *)self publisherLogoImageView];
    [v40 setHidden:1];

    v41 = [(NSSArticleView *)self publisherLabel];
    objc_msgSend(v41, "setFrame:", 0.0, 0.0, v3, 0.0);

    v42 = [(NSSArticleView *)self publisherLabel];
    [v42 sizeToFit];

    v43 = [(NSSArticleView *)self publisherLabel];
    [v43 frame];
    double v32 = CGRectGetHeight(v89);

    v90.origin.double y = v18 + v17;
    v90.origin.double x = 16.0;
    v90.size.double width = v3;
    v90.size.double height = v32;
    CGRect v91 = CGRectIntegral(v90);
    CGFloat v44 = v91.origin.x;
    CGFloat v45 = v91.origin.y;
    CGFloat v46 = v91.size.width;
    CGFloat v47 = v91.size.height;
    CGRect v33 = [(NSSArticleView *)self publisherLabel];
    CGRect v34 = v33;
    double v35 = v44;
    double v37 = v45;
    double v38 = v46;
    double v36 = v47;
  }
  objc_msgSend(v33, "setFrame:", v35, v37, v38, v36);

  double v48 = v17 + v18 + v32;
  v49 = [(NSSArticleView *)self titleLabel];
  v50 = [v49 text];

  if (v50)
  {
    v51 = [(NSSArticleView *)self titleLabel];
    objc_msgSend(v51, "setFrame:", 0.0, 0.0, v3, 0.0);

    v52 = [(NSSArticleView *)self titleLabel];
    [v52 sizeToFit];

    v53 = [(NSSArticleView *)self titleLabel];
    [v53 frame];
    double v54 = CGRectGetHeight(v92);

    v93.origin.double y = v48 + 8.0;
    v93.origin.double x = 16.0;
    v93.size.double width = v3;
    v93.size.double height = v54;
    CGRect v94 = CGRectIntegral(v93);
    double v55 = v94.origin.x;
    double v56 = v94.origin.y;
    double v57 = v94.size.width;
    double v58 = v94.size.height;
    v59 = [(NSSArticleView *)self titleLabel];
    objc_msgSend(v59, "setFrame:", v55, v56, v57, v58);

    double v48 = v48 + v54 + 8.0;
    double v60 = 5.0;
  }
  else
  {
    double v60 = 8.0;
  }
  v61 = [(NSSArticleView *)self excerptLabel];
  v62 = [v61 text];

  if (v62)
  {
    if (v5) {
      uint64_t v63 = 2;
    }
    else {
      uint64_t v63 = 8;
    }
    v64 = [(NSSArticleView *)self excerptLabel];
    [v64 setNumberOfLines:v63];

    v65 = [(NSSArticleView *)self excerptLabel];
    objc_msgSend(v65, "setFrame:", 0.0, 0.0, v3, 0.0);

    v66 = [(NSSArticleView *)self excerptLabel];
    [v66 sizeToFit];

    v67 = [(NSSArticleView *)self excerptLabel];
    [v67 frame];
    double v68 = CGRectGetHeight(v95);

    v96.origin.double y = v60 + v48;
    v96.origin.double x = 16.0;
    v96.size.double width = v3;
    v96.size.double height = v68;
    CGRect v97 = CGRectIntegral(v96);
    double v69 = v97.origin.x;
    double v70 = v97.origin.y;
    double v71 = v97.size.width;
    double v72 = v97.size.height;
    v73 = [(NSSArticleView *)self excerptLabel];
    objc_msgSend(v73, "setFrame:", v69, v70, v71, v72);

    double v48 = v48 + v60 + v68;
    double v60 = 8.0;
  }
  v74 = [(NSSArticleView *)self dateLabel];
  v75 = [v74 text];

  if (v75)
  {
    v76 = [(NSSArticleView *)self dateLabel];
    objc_msgSend(v76, "setFrame:", 0.0, 0.0, v3, 0.0);

    v77 = [(NSSArticleView *)self dateLabel];
    [v77 sizeToFit];

    v78 = [(NSSArticleView *)self dateLabel];
    [v78 frame];
    CGFloat v79 = CGRectGetHeight(v98);

    v99.origin.double y = v60 + v48;
    v99.origin.double x = 16.0;
    v99.size.double width = v3;
    v99.size.double height = v79;
    CGRect v100 = CGRectIntegral(v99);
    double v80 = v100.origin.x;
    double v81 = v100.origin.y;
    double v82 = v100.size.width;
    double v83 = v100.size.height;
    v84 = [(NSSArticleView *)self dateLabel];
    objc_msgSend(v84, "setFrame:", v80, v81, v82, v83);
  }
  [(NSSArticleView *)self preferredSize];
  -[NSSArticleView setPreferredSize:](self, "setPreferredSize:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NSSArticleView;
  [(NSSArticleView *)&v7 encodeWithCoder:v4];
  objc_super v5 = [(NSSArticleView *)self article];

  if (v5)
  {
    objc_super v6 = [(NSSArticleView *)self article];
    [v4 encodeObject:v6 forKey:@"article"];
  }
}

- (NSSArticleView)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSArticleView;
  objc_super v5 = [(NSSArticleView *)&v9 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(NSSArticleView *)v5 _commonInit];
    objc_super v7 = [v4 decodeObjectForKey:@"article"];
    [(NSSArticleView *)v6 setArticle:v7];
  }
  return v6;
}

- (void)_commonInit
{
  double v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.62745098 alpha:1.0];
  objc_super v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.37254902 alpha:1.0];
  objc_msgSend(v3, "nss_dynamicColor:withDarkStyleVariant:", v4, v5);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = objc_alloc(MEMORY[0x1E4F42B38]);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
  [v11 setNumberOfLines:3];
  [v11 setTextAlignment:0];
  [v11 setLineBreakMode:4];
  [v11 setAutoresizingMask:2];
  v12 = [MEMORY[0x1E4F428B8] labelColor];
  [v11 setTextColor:v12];

  [(NSSArticleView *)self addSubview:v11];
  [(NSSArticleView *)self setTitleLabel:v11];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
  [v13 setNumberOfLines:2];
  [v13 setTextAlignment:0];
  [v13 setLineBreakMode:4];
  [v13 setAutoresizingMask:2];
  v14 = (void *)MEMORY[0x1E4F428B8];
  uint64_t v15 = [MEMORY[0x1E4F428B8] colorWithWhite:0.431372549 alpha:1.0];
  v16 = [MEMORY[0x1E4F428B8] colorWithWhite:0.568627451 alpha:1.0];
  double v17 = objc_msgSend(v14, "nss_dynamicColor:withDarkStyleVariant:", v15, v16);
  [v13 setTextColor:v17];

  [(NSSArticleView *)self addSubview:v13];
  [(NSSArticleView *)self setExcerptLabel:v13];
  double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
  [v18 setTextAlignment:0];
  [v18 setTextColor:v29];
  [(NSSArticleView *)self addSubview:v18];
  [(NSSArticleView *)self setPublisherLabel:v18];
  double v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v7, v8, v9, v10);
  [v19 setTextAlignment:0];
  [v19 setTextColor:v29];
  [(NSSArticleView *)self addSubview:v19];
  [(NSSArticleView *)self setDateLabel:v19];
  double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
  double v21 = [v20 layer];
  [v21 setMasksToBounds:1];

  double v22 = [v20 layer];
  [v22 setCornerRadius:8.0];

  [(NSSArticleView *)self addSubview:v20];
  [(NSSArticleView *)self setThumbnailContainerView:v20];
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v7, v8, v9, v10);
  [v23 setAutoresizingMask:18];
  [v23 setContentMode:2];
  [v20 addSubview:v23];
  [(NSSArticleView *)self setThumbnailImageView:v23];
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v7, v8, v9, v10);
  uint64_t v25 = *MEMORY[0x1E4F3A340];
  v26 = [v24 layer];
  [v26 setMinificationFilter:v25];

  v27 = [v24 layer];
  [v27 setMagnificationFilter:v25];

  [v24 setAutoresizingMask:18];
  [v24 setContentMode:2];
  double v28 = [MEMORY[0x1E4F428B8] labelColor];
  [v24 setTintColor:v28];

  [(NSSArticleView *)self addSubview:v24];
  [(NSSArticleView *)self setPublisherLogoImageView:v24];
  [(NSSArticleView *)self _updateFonts];
}

- (void)_updateFonts
{
  id v12 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F0] addingSymbolicTraits:64 options:0];
  double v3 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43888] addingSymbolicTraits:2 options:0];
  id v4 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v12 size:0.0];
  objc_super v5 = [(NSSArticleView *)self titleLabel];
  [v5 setFont:v4];

  id v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C0]];
  double v7 = [(NSSArticleView *)self excerptLabel];
  [v7 setFont:v6];

  double v8 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v3 size:0.0];
  double v9 = [(NSSArticleView *)self publisherLabel];
  [v9 setFont:v8];

  double v10 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v3 size:0.0];
  v11 = [(NSSArticleView *)self dateLabel];
  [v11 setFont:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSArticleView;
  [(NSSArticleView *)&v6 traitCollectionDidChange:a3];
  [(NSSArticleView *)self bounds];
  CGFloat v4 = CGRectGetWidth(v7) + -32.0;
  [(NSSArticleView *)self calculateHeightForWidth:v4];
  -[NSSArticleView setPreferredSize:](self, "setPreferredSize:", v4, round(v5));
  [(NSSArticleView *)self setNeedsLayout];
}

- (NSSArticleInternal)article
{
  return self->_article;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)excerptLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_excerptLabel);
  return (UILabel *)WeakRetained;
}

- (void)setExcerptLabel:(id)a3
{
}

- (UIImageView)thumbnailImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setThumbnailImageView:(id)a3
{
}

- (UIView)thumbnailContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailContainerView);
  return (UIView *)WeakRetained;
}

- (void)setThumbnailContainerView:(id)a3
{
}

- (UILabel)publisherLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publisherLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPublisherLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateLabel);
  return (UILabel *)WeakRetained;
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)publisherLogoImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publisherLogoImageView);
  return (UIImageView *)WeakRetained;
}

- (void)setPublisherLogoImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_publisherLogoImageView);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_publisherLabel);
  objc_destroyWeak((id *)&self->_thumbnailContainerView);
  objc_destroyWeak((id *)&self->_thumbnailImageView);
  objc_destroyWeak((id *)&self->_excerptLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_article, 0);
}

@end