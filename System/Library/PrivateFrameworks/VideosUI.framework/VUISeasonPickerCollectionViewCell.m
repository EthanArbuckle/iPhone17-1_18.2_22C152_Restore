@interface VUISeasonPickerCollectionViewCell
+ (void)configureSeasonPickerCell:(id)a3 withMedia:(id)a4 traitCollection:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIImageView)seasonImageView;
- (VUILabel)secondSubtitleLabel;
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (VUISeasonPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (VUISeparatorView)bottomSeparatorView;
- (VUISeparatorView)topSeparatorView;
- (void)layoutSubviews;
- (void)setBottomSeparatorView:(id)a3;
- (void)setSeasonImageView:(id)a3;
- (void)setSecondSubtitleLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopSeparatorView:(id)a3;
@end

@implementation VUISeasonPickerCollectionViewCell

+ (void)configureSeasonPickerCell:(id)a3 withMedia:(id)a4 traitCollection:(id)a5
{
  id v55 = a3;
  id v7 = a4;
  id v8 = a5;
  v54 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v7 imageType:0];
  v9 = [v55 seasonImageView];
  if (v9)
  {
    id v10 = [v55 seasonImageView];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
  }
  v11 = v10;

  [v11 setUserInteractionEnabled:0];
  v12 = +[VUILibraryViewFactory tvPlaceholderImage];
  [v11 setPlaceholderImage:v12];

  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v14 * 102.0;

  v16 = (void *)MEMORY[0x1E4FB3CC8];
  v17 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
  v18 = objc_msgSend(v16, "decoratorWithOutlineColor:outlineWidths:", v17, 1.0, 1.0, 1.0, 1.0);

  objc_msgSend(v18, "setScaleToSize:", v15, v15);
  +[VUIUtilities imageCornerRadiusWithStyle:0];
  double v20 = v19;
  objc_msgSend(MEMORY[0x1E4FB3C70], "radiiFromRadius:");
  objc_msgSend(v18, "setCornerRadii:");
  SEL v21 = NSSelectorFromString(&cfstr_Artworkurl.isa);
  if (objc_opt_respondsToSelector())
  {
    v22 = ((void (*)(id, SEL))[v7 methodForSelector:v21])(v7, v21);
    if ([v22 length])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D10]), "initWithSrc:size:", v22, v15, v15);
      v24 = +[VUIUtilities placeholderImageResourceName:0];
      [v23 setPlaceholderSrc:v24];

      [MEMORY[0x1E4FB3C70] radiiFromRadius:v20];
      objc_msgSend(v23, "setBorderRadii:");
      [v23 setExtension:@"jpeg"];
      v25 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
      [v23 setBackgroundColor:v25];

      v26 = (void *)MEMORY[0x1E4FB3CC0];
      v27 = [v55 seasonImageView];
      v28 = [v26 makeImageViewWithDescriptor:v23 existingView:v27];

      [v28 setCornerRadius:4.0];
      [v28 setImageContainsCornerRadius:1];

      v11 = v28;
    }
  }
  else
  {
    if (!v54) {
      goto LABEL_10;
    }
    id v29 = objc_alloc(MEMORY[0x1E4FB3CD0]);
    v30 = [v7 mediaLibrary];
    v22 = (void *)[v29 initWithObject:v54 imageLoader:v30 groupType:0];

    [v22 setDecorator:v18];
    [v11 setImageProxy:v22];
    [v11 setCornerRadius:4.0];
    [v11 setImageContainsCornerRadius:1];
  }

LABEL_10:
  [v55 setSeasonImageView:v11];
  v31 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v31 setTextStyle:13];
  [(VUITextLayout *)v31 setFontWeight:0];
  v32 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
  [(VUITextLayout *)v31 setColor:v32];

  [(VUITextLayout *)v31 setNumberOfLines:1];
  v33 = [v7 title];
  v34 = [v55 titleLabel];
  v35 = +[VUILabel labelWithString:v33 textLayout:v31 existingLabel:v34];
  [v55 setTitleLabel:v35];

  LODWORD(v35) = [v8 isAXEnabled];
  v36 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v36 setTextStyle:21];
  [(VUITextLayout *)v36 setFontWeight:0];
  v37 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [(VUITextLayout *)v36 setColor:v37];

  v53 = v18;
  if (v35)
  {
    [(VUITextLayout *)v36 setNumberOfLines:0];
    uint64_t v38 = [v7 genreTitle];
    v39 = (void *)v38;
    if (v38) {
      v40 = (__CFString *)v38;
    }
    else {
      v40 = &stru_1F3E921E0;
    }
    v41 = [v55 subtitleLabel];
    v42 = +[VUILabel labelWithString:v40 textLayout:v36 existingLabel:v41];
    [v55 setSubtitleLabel:v42];

    v43 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v43 setTextStyle:21];
    [(VUITextLayout *)v43 setFontWeight:0];
    v44 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(VUITextLayout *)v43 setColor:v44];

    [(VUITextLayout *)v43 setNumberOfLines:0];
    v45 = [v7 releaseYear];
    uint64_t v46 = [v45 stringValue];
    v47 = (void *)v46;
    if (v46) {
      v48 = (__CFString *)v46;
    }
    else {
      v48 = &stru_1F3E921E0;
    }
    v49 = [v55 secondSubtitleLabel];
    v50 = +[VUILabel labelWithString:v48 textLayout:v43 existingLabel:v49];
    [v55 setSecondSubtitleLabel:v50];
LABEL_27:

    goto LABEL_28;
  }
  [(VUITextLayout *)v36 setNumberOfLines:1];
  v45 = [v7 genreTitle];
  v47 = [v7 releaseYear];
  uint64_t v51 = [v45 length];
  if (v51 && v47)
  {
    v52 = [NSString stringWithFormat:@"%@ %@ %@", v45, @"·", v47];
LABEL_25:
    v43 = v52;
    if (!v52) {
      goto LABEL_28;
    }
    v49 = [v55 subtitleLabel];
    v50 = +[VUILabel labelWithString:v43 textLayout:v36 existingLabel:v49];
    [v55 setSubtitleLabel:v50];
    goto LABEL_27;
  }
  if (v51)
  {
    v52 = v45;
    goto LABEL_25;
  }
  if (v47)
  {
    v52 = [v47 stringValue];
    goto LABEL_25;
  }
  v43 = 0;
LABEL_28:
}

- (VUISeasonPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUISeasonPickerCollectionViewCell;
  v3 = -[VUISeasonPickerCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(VUIListCollectionViewCell *)v3 setBackgroundColor:v4];

    v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryFillColor");
    [(VUIListCollectionViewCell *)v3 setHighlightedBackgroundColor:v5];
  }
  return v3;
}

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    v9 = v5;
    [(VUILabel *)titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (*p_titleLabel)
    {
      id v8 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v8 addSubview:*p_titleLabel];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setSubtitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel != v5)
  {
    v9 = v5;
    [(VUILabel *)subtitleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      id v8 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v8 addSubview:*p_subtitleLabel];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setSecondSubtitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  p_secondSubtitleLabel = &self->_secondSubtitleLabel;
  secondSubtitleLabel = self->_secondSubtitleLabel;
  if (secondSubtitleLabel != v5)
  {
    v9 = v5;
    [(VUILabel *)secondSubtitleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_secondSubtitleLabel, a3);
    if (*p_secondSubtitleLabel)
    {
      id v8 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v8 addSubview:*p_secondSubtitleLabel];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setSeasonImageView:(id)a3
{
  v5 = (VUIImageView *)a3;
  p_seasonImageView = &self->_seasonImageView;
  if (self->_seasonImageView != v5)
  {
    id v8 = v5;
    [(VUIImageView *)v5 removeFromSuperview];
    objc_storeStrong((id *)&self->_seasonImageView, a3);
    if (*p_seasonImageView)
    {
      objc_super v7 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v7 addSubview:*p_seasonImageView];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v8;
  }
}

- (void)setTopSeparatorView:(id)a3
{
  v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    v9 = v5;
    [(VUISeparatorView *)topSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      id v8 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v8 addSubview:*p_topSeparatorView];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (void)setBottomSeparatorView:(id)a3
{
  v5 = (VUISeparatorView *)a3;
  p_bottomSeparatorView = &self->_bottomSeparatorView;
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView != v5)
  {
    v9 = v5;
    [(VUISeparatorView *)bottomSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
    if (*p_bottomSeparatorView)
    {
      id v8 = [(VUISeasonPickerCollectionViewCell *)self contentView];
      [v8 addSubview:*p_bottomSeparatorView];
    }
    [(VUISeasonPickerCollectionViewCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding", a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v10 = [v9 preferredContentSizeCategory];

  int v11 = objc_msgSend(MEMORY[0x1E4FB3C20], "contentSizeCategoryIsAccessibility:", objc_msgSend(MEMORY[0x1E4FB3C70], "vuiContentSizeCategoryFor:", v10));
  if (v11) {
    double v12 = 102.0;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = width - (v6 + v8);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v13, 1.79769313e308);
  double v15 = v14;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  double v17 = v16;
  -[VUILabel sizeThatFits:](self->_secondSubtitleLabel, "sizeThatFits:", v13, 1.79769313e308);
  double v19 = v18;
  double v20 = [(VUISeasonPickerCollectionViewCell *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v20 forTraitCollection:18.0];
  double v22 = v21;
  [(UILabel *)self->_subtitleLabel vui_heightToBaseline];
  double v24 = v22 - v23;

  [(UILabel *)self->_titleLabel vui_heightToBaseline];
  double v26 = v12 + v25;
  [(UILabel *)self->_subtitleLabel vui_heightToBaseline];
  double v28 = v24 + v26 + v27;
  secondSubtitleLabel = self->_secondSubtitleLabel;
  if (secondSubtitleLabel)
  {
    [(UILabel *)secondSubtitleLabel vui_heightToBaseline];
    double v31 = v28 + v30;
    v32 = [(VUISeasonPickerCollectionViewCell *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v32 forTraitCollection:18.0];
    double v34 = v33;
    [(UILabel *)self->_secondSubtitleLabel vui_heightToBaseline];
    double v28 = v31 + v34 - v35;

    v36 = [(VUILabel *)self->_secondSubtitleLabel font];
    [v36 lineHeight];
    unint64_t v38 = vcvtad_u64_f64(v19 / v37);

    if (v38 >= 2)
    {
      v39 = [(VUILabel *)self->_secondSubtitleLabel font];
      [v39 lineHeight];
      double v28 = v28 + v40 * (double)(v38 - 1);
    }
  }
  v41 = [(VUILabel *)self->_titleLabel font];
  [v41 lineHeight];
  unint64_t v43 = vcvtad_u64_f64(v15 / v42);

  if (v43 >= 2)
  {
    v44 = [(VUILabel *)self->_titleLabel font];
    [v44 lineHeight];
    double v28 = v28 + v45 * (double)(v43 - 1);
  }
  uint64_t v46 = [(VUILabel *)self->_subtitleLabel font];
  [v46 lineHeight];
  unint64_t v48 = vcvtad_u64_f64(v17 / v47);

  if (v48 >= 2)
  {
    v49 = [(VUILabel *)self->_subtitleLabel font];
    [v49 lineHeight];
    double v28 = v28 + v50 * (double)(v48 - 1);
  }
  double v51 = v28 + 20.0;
  if (!v11) {
    double v51 = v28;
  }
  double v52 = fmax(v51, 118.0);

  double v53 = width;
  double v54 = v52;
  result.height = v54;
  result.double width = v53;
  return result;
}

- (void)layoutSubviews
{
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v4 = v3;
  double v6 = v5;
  topSeparatorView = self->_topSeparatorView;
  [(VUISeasonPickerCollectionViewCell *)self bounds];
  -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", v8, 1.79769313e308);
  double v109 = v9;
  double v110 = v10;
  bottomSeparatorView = self->_bottomSeparatorView;
  [(VUISeasonPickerCollectionViewCell *)self bounds];
  -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", v12, 1.79769313e308);
  double v111 = v13;
  double v112 = v14;
  double v15 = [(VUISeasonPickerCollectionViewCell *)self contentView];
  [v15 bounds];
  double MaxY = CGRectGetMaxY(v120);

  titleLabel = self->_titleLabel;
  double v18 = [(VUISeasonPickerCollectionViewCell *)self contentView];
  [v18 bounds];
  double v19 = v4 + v6;
  -[VUILabel sizeThatFits:](titleLabel, "sizeThatFits:", v20 - v19, 1.79769313e308);
  double v113 = v21;
  double v23 = v22;

  subtitleLabel = self->_subtitleLabel;
  double v25 = [(VUISeasonPickerCollectionViewCell *)self contentView];
  [v25 bounds];
  -[VUILabel sizeThatFits:](subtitleLabel, "sizeThatFits:", v26 - v19, 1.79769313e308);
  double v115 = v27;
  double v118 = v28;

  secondSubtitleLabel = self->_secondSubtitleLabel;
  double v30 = [(VUISeasonPickerCollectionViewCell *)self contentView];
  [v30 bounds];
  -[VUILabel sizeThatFits:](secondSubtitleLabel, "sizeThatFits:", v31 - v19, 1.79769313e308);
  double v33 = v32;
  double v117 = v34;

  [(UILabel *)self->_titleLabel vui_heightToBaseline];
  double v36 = v35;
  [(UILabel *)self->_subtitleLabel vui_heightToBaseline];
  double v38 = v37;
  v39 = [(VUISeasonPickerCollectionViewCell *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v39 forTraitCollection:18.0];
  double v41 = v40 - v38;

  double v42 = v36 + v41;
  unint64_t v43 = [(VUISeasonPickerCollectionViewCell *)self traitCollection];
  LODWORD(v39) = [v43 isAXEnabled];

  double v114 = v23;
  if (v39)
  {
    double v44 = v33;
    double v45 = [(VUISeasonPickerCollectionViewCell *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v45 forTraitCollection:18.0];
    double v47 = v46;
    [(UILabel *)self->_secondSubtitleLabel vui_heightToBaseline];
    double v49 = v38 + v42 + v47 - v48;

    double v50 = [(VUILabel *)self->_titleLabel font];
    [v50 lineHeight];
    unint64_t v52 = vcvtad_u64_f64(v23 / v51);

    if (v52 >= 2)
    {
      double v53 = [(VUILabel *)self->_titleLabel font];
      [v53 lineHeight];
      double v54 = (double)(v52 - 1);
      double v42 = v42 + v55 * v54;

      v56 = [(VUILabel *)self->_titleLabel font];
      [v56 lineHeight];
      double v49 = v49 + v57 * v54;
    }
    v58 = [(VUILabel *)self->_subtitleLabel font];
    [v58 lineHeight];
    unint64_t v60 = vcvtad_u64_f64(v118 / v59);

    double v61 = v44;
    if (v60 >= 2)
    {
      v62 = [(VUILabel *)self->_subtitleLabel font];
      [v62 lineHeight];
      double v49 = v49 + v63 * (double)(v60 - 1);
    }
    v121.size.double width = 102.0;
    double v116 = 10.0;
    v121.origin.y = 10.0;
    v121.origin.x = v4;
    v121.size.height = 102.0;
    double v64 = CGRectGetMaxY(v121);
    double v107 = v42 + v64;
    double v108 = v4;
    double v65 = v49 + v64;
    double v66 = v4;
    double v106 = v4;
  }
  else
  {
    v67 = [(VUISeasonPickerCollectionViewCell *)self contentView];
    [v67 bounds];
    double MidY = CGRectGetMidY(v122);

    double v69 = v36 + 0.0 + v38 + v41;
    v70 = [(VUILabel *)self->_titleLabel font];
    [v70 lineHeight];
    unint64_t v72 = vcvtad_u64_f64(v23 / v71);

    if (v72 >= 2)
    {
      v73 = [(VUILabel *)self->_titleLabel font];
      [v73 lineHeight];
      double v75 = v74;
      double v76 = (double)(v72 - 1);
      v77 = [(VUILabel *)self->_titleLabel font];
      [v77 descender];
      double v69 = v69 + v78 + v75 * v76;

      v79 = [(VUILabel *)self->_titleLabel font];
      [v79 lineHeight];
      double v81 = v80;
      v82 = [(VUILabel *)self->_titleLabel font];
      [v82 descender];
      double v42 = v42 + v83 + v81 * v76;
    }
    v84 = (double *)MEMORY[0x1E4F1DB28];
    double v116 = MidY + -51.0;
    v85 = [(VUILabel *)self->_titleLabel font];
    [v85 lineHeight];
    unint64_t v87 = vcvtad_u64_f64(v118 / v86);

    if (v87 >= 2)
    {
      v88 = [(VUILabel *)self->_subtitleLabel font];
      [v88 lineHeight];
      double v90 = v89;
      double v91 = (double)(v87 - 1);
      v92 = [(VUILabel *)self->_subtitleLabel font];
      [v92 descender];
      double v69 = v69 + v93 + v90 * v91;
    }
    double v65 = v84[1];
    double v108 = *v84;
    double v61 = v84[2];
    double v117 = v84[3];
    v94 = [(VUISeasonPickerCollectionViewCell *)self contentView];
    [v94 bounds];
    double v64 = CGRectGetMidY(v123) + v69 * -0.5;

    double v107 = v42 + v64;
    v124.origin.x = v4;
    v124.origin.y = v116;
    v124.size.double width = 102.0;
    v124.size.height = 102.0;
    double v106 = CGRectGetMaxX(v124) + 16.0;
    v125.origin.x = v4;
    v125.origin.y = v116;
    v125.size.double width = 102.0;
    v125.size.height = 102.0;
    double v66 = CGRectGetMaxX(v125) + 16.0;
  }
  double v95 = MaxY - v112;
  if ([(VUISeasonPickerCollectionViewCell *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    [(VUISeasonPickerCollectionViewCell *)self bounds];
    v96 = self->_topSeparatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v96, "setFrame:");
    v97 = self->_bottomSeparatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v97, "setFrame:");
    seasonImageView = self->_seasonImageView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUIImageView setFrame:](seasonImageView, "setFrame:");
    v99 = self->_titleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v99, "setFrame:");
    v100 = self->_subtitleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v100, "setFrame:");
    v101 = self->_secondSubtitleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    double v65 = v104;
    double v61 = v105;
  }
  else
  {
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v4, 0.0, v109, v110);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v4, v95, v111, v112);
    -[VUIImageView setFrame:](self->_seasonImageView, "setFrame:", v4, v116, 102.0, 102.0);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v106, v64, v113, v114);
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v66, v107, v115, v118);
    v101 = self->_secondSubtitleLabel;
    double v103 = v117;
    double v102 = v108;
  }
  -[VUILabel setFrame:](v101, "setFrame:", v102, v65, v61, v103);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)secondSubtitleLabel
{
  return self->_secondSubtitleLabel;
}

- (VUIImageView)seasonImageView
{
  return self->_seasonImageView;
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_seasonImageView, 0);
  objc_storeStrong((id *)&self->_secondSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end