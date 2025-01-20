@interface VUILibraryEpisodeListCell
+ (id)_metadataLabelWithString:(id)a3 existingLabel:(id)a4;
+ (void)configureVUILibraryEpisodeListCell:(id)a3 withMedia:(id)a4 andAssetController:(id)a5;
- (BOOL)_contentSizeCategoryIsAccessibility;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)duration;
- (NSString)releaseDate;
- (NSString)title;
- (UIStackView)episodeInfoStackView;
- (VUIDownloadButton)downloadButton;
- (VUILabel)dotSeparatorLabel;
- (VUILabel)durationLabel;
- (VUILabel)releaseDateLabel;
- (VUILabel)titleLabel;
- (VUILibraryEpisodeFrameView)imageFrameView;
- (VUILibraryEpisodeListCell)initWithFrame:(CGRect)a3;
- (VUIMediaEntityAssetController)assetController;
- (VUIMediaItem)mediaItem;
- (VUISeparatorView)separatorView;
- (double)_metadataHeightToBaselineNonAXContentSizeCategory;
- (double)_metadataScaledTopMarginForNonAXContentSizeCategory;
- (void)_addDownloadButtonIfRequired:(id)a3;
- (void)_configureDotSeparator;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAssetController:(id)a3;
- (void)setDotSeparatorLabel:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)setDuration:(id)a3;
- (void)setDurationLabel:(id)a3;
- (void)setEpisodeInfoStackView:(id)a3;
- (void)setImageFrameView:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setReleaseDateLabel:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation VUILibraryEpisodeListCell

+ (void)configureVUILibraryEpisodeListCell:(id)a3 withMedia:(id)a4 andAssetController:(id)a5
{
  v26 = (id *)a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v26 imageFrameView];
  if (v9)
  {
    uint64_t v10 = [v26 imageFrameView];
  }
  else
  {
    v11 = [VUILibraryEpisodeFrameView alloc];
    uint64_t v10 = -[VUILibraryEpisodeFrameView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v12 = (void *)v10;

  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
  +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v12, v7, 0);
  [v26 setImageFrameView:v12];
  objc_storeStrong(v26 + 95, a4);
  objc_storeStrong(v26 + 94, a5);
  [v26 _addDownloadButtonIfRequired:v7];
  v13 = [v7 episodeNumber];
  v14 = objc_msgSend(v13, "vui_languageAwareDescription");

  v15 = [v7 title];
  v16 = objc_msgSend(v15, "vui_stringWithFirstStrongDirectionalIsolates");

  v17 = NSString;
  v18 = +[VUILocalizationManager sharedInstance];
  v19 = [v18 localizedStringForKey:@"EPISODE_NUMBER_INDICATOR_FOLLOWED_BY_TITLE"];
  v20 = [v17 stringWithValidatedFormat:v19, @"%@ %@", 0, v14, v16 validFormatSpecifiers error];
  [v26 setTitle:v20];

  v21 = [v7 releaseDate];
  v22 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v21 dateStyle:2 timeStyle:0];
  [v26 setReleaseDate:v22];

  v23 = [v7 duration];
  if (v23)
  {
    v24 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
    v25 = [v24 transformedValue:v23];
  }
  else
  {
    v25 = &stru_1F3E921E0;
  }
  [v26 setDuration:v25];
  [v26 setNeedsLayout];
}

- (VUILibraryEpisodeListCell)initWithFrame:(CGRect)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VUILibraryEpisodeListCell;
  v3 = -[VUILibraryEpisodeListCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    uint64_t v5 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (VUISeparatorView *)v5;

    id v7 = [(VUILibraryEpisodeListCell *)v3 contentView];
    [v7 addSubview:v3->_separatorView];

    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__VUILibraryEpisodeListCell_initWithFrame___block_invoke;
    v11[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[(VUILibraryEpisodeListCell *)v3 registerForTraitChanges:v8 withHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__VUILibraryEpisodeListCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained dotSeparatorLabel];
  objc_msgSend(v1, "setHidden:", objc_msgSend(WeakRetained, "_contentSizeCategoryIsAccessibility"));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryEpisodeListCell;
  [(VUIListCollectionViewCell *)&v3 prepareForReuse];
  [(VUILibraryEpisodeListCell *)self setImageFrameView:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v5 = (void *)MEMORY[0x1E4FB3C70];
  v6 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3.width, a3.height);
  id v7 = [v6 preferredContentSizeCategory];
  uint64_t v8 = [v5 vuiContentSizeCategoryFor:v7];

  if (![MEMORY[0x1E4FB3C20] contentSizeCategoryIsAccessibility:v8])
  {
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
    double v12 = width - (v11 + 16.0);
    downloadButton = self->_downloadButton;
    if (downloadButton)
    {
      [(VUIDownloadButton *)downloadButton sizeToFit];
      [(VUIDownloadButton *)self->_downloadButton frame];
      double v12 = v12 - (CGRectGetWidth(v25) + 16.0);
    }
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v12, 1.79769313e308);
    double v15 = v14;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v12, 1.79769313e308);
    double v17 = v16;
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
    -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v12, 1.79769313e308);
    double v19 = v18;
    [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:32.0];
    if (self->_dotSeparatorLabel && v17 + v15 + 4.0 + v19 + 4.0 > v12)
    {
      [(VUILabel *)self->_releaseDateLabel topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    }
    else
    {
      releaseDateLabel = self->_releaseDateLabel;
      if (releaseDateLabel)
      {
        [(VUILabel *)releaseDateLabel topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
        goto LABEL_14;
      }
    }
    [(VUILabel *)self->_durationLabel topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    goto LABEL_14;
  }
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
  -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", width, 1.79769313e308);
  -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", width, 1.79769313e308);
  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778, 0.0, 48.0);
  id v9 = [(VUILibraryEpisodeListCell *)self assetController];
  if (v9) {
    uint64_t v10 = [[VUIDownloadButton alloc] initWithAssetController:v9 type:8];
  }
  else {
    uint64_t v10 = 0;
  }
  [(VUIDownloadButton *)v10 setUsesDefaultConfiguration:1];
  [(VUIDownloadButton *)v10 sizeToFit];
  [(VUIDownloadButton *)v10 frame];
  CGRectGetHeight(v26);
  [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:32.0];

LABEL_14:
  VUIRoundValue();
  double v22 = v21;
  double v23 = width;
  result.height = v22;
  result.double width = v23;
  return result;
}

- (void)setImageFrameView:(id)a3
{
  uint64_t v5 = (VUILibraryEpisodeFrameView *)a3;
  imageFrameView = self->_imageFrameView;
  if (imageFrameView != v5)
  {
    id v7 = v5;
    [(VUILibraryEpisodeFrameView *)imageFrameView removeFromSuperview];
    objc_storeStrong((id *)&self->_imageFrameView, a3);
    if (self->_imageFrameView) {
      -[VUILibraryEpisodeListCell addSubview:](self, "addSubview:");
    }
    [(VUILibraryEpisodeListCell *)self setNeedsLayout];
    uint64_t v5 = v7;
  }
}

- (void)setDownloadButton:(id)a3
{
  uint64_t v5 = (VUIDownloadButton *)a3;
  downloadButton = self->_downloadButton;
  if (downloadButton != v5)
  {
    id v7 = v5;
    [(VUIDownloadButton *)downloadButton removeFromSuperview];
    objc_storeStrong((id *)&self->_downloadButton, a3);
    if (self->_downloadButton) {
      -[VUILibraryEpisodeListCell addSubview:](self, "addSubview:");
    }
    [(VUILibraryEpisodeListCell *)self setNeedsLayout];
    uint64_t v5 = v7;
  }
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  id v11 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    v6 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v6 setTextStyle:20];
    id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(VUITextLayout *)v6 setColor:v7];

    [(VUITextLayout *)v6 setNumberOfLines:2];
    [(VUITextLayout *)v6 setAlignment:2* ([(VUILibraryEpisodeListCell *)self effectiveUserInterfaceLayoutDirection] == 1)];
    [(VUITextLayout *)v6 setLineBreakMode:4];
    uint64_t v8 = +[VUILabel labelWithString:*p_title textLayout:v6 existingLabel:self->_titleLabel];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    uint64_t v10 = [(VUILibraryEpisodeListCell *)self contentView];
    [v10 addSubview:self->_titleLabel];
  }
}

- (void)setReleaseDate:(id)a3
{
  p_releaseDate = &self->_releaseDate;
  id v9 = a3;
  if (!-[NSString isEqualToString:](*p_releaseDate, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_releaseDate, a3);
    if (*p_releaseDate)
    {
      v6 = [(id)objc_opt_class() _metadataLabelWithString:*p_releaseDate existingLabel:self->_releaseDateLabel];
      releaseDateLabel = self->_releaseDateLabel;
      self->_releaseDateLabel = v6;

      uint64_t v8 = [(VUILibraryEpisodeListCell *)self contentView];
      [v8 addSubview:self->_releaseDateLabel];
    }
    else
    {
      [(VUILabel *)self->_releaseDateLabel removeFromSuperview];
      uint64_t v8 = self->_releaseDateLabel;
      self->_releaseDateLabel = 0;
    }

    [(VUILibraryEpisodeListCell *)self _configureDotSeparator];
  }
}

- (void)setDuration:(id)a3
{
  p_duration = &self->_duration;
  id v9 = a3;
  if (!-[NSString isEqualToString:](*p_duration, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_duration, a3);
    if (*p_duration)
    {
      v6 = [(id)objc_opt_class() _metadataLabelWithString:*p_duration existingLabel:self->_durationLabel];
      durationLabel = self->_durationLabel;
      self->_durationLabel = v6;

      uint64_t v8 = [(VUILibraryEpisodeListCell *)self contentView];
      [v8 addSubview:self->_durationLabel];
    }
    else
    {
      [(VUILabel *)self->_durationLabel removeFromSuperview];
      uint64_t v8 = self->_durationLabel;
      self->_durationLabel = 0;
    }

    [(VUILibraryEpisodeListCell *)self _configureDotSeparator];
  }
}

- (void)layoutSubviews
{
  v133.receiver = self;
  v133.super_class = (Class)VUILibraryEpisodeListCell;
  [(VUILibraryEpisodeListCell *)&v133 layoutSubviews];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v132 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v131 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  if ([(VUILibraryEpisodeListCell *)self _contentSizeCategoryIsAccessibility])
  {
    double v5 = v4;
    titleLabel = self->_titleLabel;
    id v7 = [(VUILibraryEpisodeListCell *)self contentView];
    [v7 bounds];
    -[VUILabel sizeThatFits:](titleLabel, "sizeThatFits:", CGRectGetWidth(v134), 1.79769313e308);
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    double rect = 0.0;
    +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    separatorView = self->_separatorView;
    double v17 = [(VUILibraryEpisodeListCell *)self contentView];
    [v17 bounds];
    -[VUIBaseView sizeThatFits:](separatorView, "sizeThatFits:", CGRectGetWidth(v135), 1.79769313e308);
    double v19 = v18;
    double v114 = v20;

    v136.origin.y = 32.0;
    v136.origin.x = 0.0;
    double v120 = v13;
    double v121 = v15;
    v136.size.double width = v13;
    v136.size.height = v15;
    CGFloat MaxY = CGRectGetMaxY(v136);
    v137.origin.x = 0.0;
    v137.origin.y = MaxY;
    double v129 = v11;
    double v130 = v9;
    v137.size.double width = v9;
    v137.size.height = v11;
    double v22 = CGRectGetMaxY(v137);
    CGFloat v23 = v22;
    releaseDateLabel = self->_releaseDateLabel;
    double v122 = MaxY;
    if (releaseDateLabel)
    {
      CGRect v25 = [(VUILibraryEpisodeListCell *)self contentView];
      [v25 bounds];
      -[VUILabel sizeThatFits:](releaseDateLabel, "sizeThatFits:", CGRectGetWidth(v138), 1.79769313e308);
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      v139.origin.x = 0.0;
      v139.origin.y = v23;
      double rect_16 = v27;
      double rect_24 = v29;
      v139.size.double width = v27;
      v139.size.height = v29;
      CGFloat v30 = CGRectGetMaxY(v139);
    }
    else
    {
      CGFloat v30 = v22;
      CGFloat v23 = v132;
      double rect_16 = v131;
      double rect_24 = v5;
      double rect = v3;
    }
    durationLabel = self->_durationLabel;
    double v115 = v19;
    double v128 = v23;
    if (durationLabel)
    {
      v86 = [(VUILibraryEpisodeListCell *)self contentView];
      [v86 bounds];
      -[VUILabel sizeThatFits:](durationLabel, "sizeThatFits:", CGRectGetWidth(v152), 1.79769313e308);
      double v87 = v132;
      CGFloat v89 = v88;
      double v72 = v90;

      v153.origin.x = 0.0;
      double v112 = 0.0;
      v153.origin.y = v30;
      v153.size.double width = v89;
      v153.size.height = v72;
      CGFloat v113 = CGRectGetMaxY(v153);
      double v84 = v5;
      double v73 = v131;
    }
    else
    {
      double v112 = v3;
      CGFloat v113 = v30;
      double v84 = v5;
      double v72 = v5;
      double v73 = v131;
      double v87 = v132;
      CGFloat v89 = v131;
      CGFloat v30 = v132;
    }
    [(VUIDownloadButton *)self->_downloadButton sizeToFit];
    [(VUIDownloadButton *)self->_downloadButton frame];
    CGFloat rect_8 = v91;
    CGFloat v116 = 0.0;
    CGFloat v117 = v92;
    double v119 = 32.0;
    double v111 = v87;
    double v71 = v3;
    double v64 = 0.0;
    double v131 = v89;
    double v132 = v30;
    goto LABEL_35;
  }
  double v112 = v3;
  [(VUIDownloadButton *)self->_downloadButton sizeToFit];
  [(VUIDownloadButton *)self->_downloadButton frame];
  CGFloat rect_8 = v31;
  CGFloat v33 = v32;
  v34 = [(VUILibraryEpisodeListCell *)self contentView];
  [v34 bounds];
  double MaxX = CGRectGetMaxX(v140);
  [(VUIDownloadButton *)self->_downloadButton frame];
  CGFloat v36 = MaxX - CGRectGetWidth(v141);
  v37 = [(VUILibraryEpisodeListCell *)self contentView];
  [v37 bounds];
  double MidY = CGRectGetMidY(v142);
  [(VUIDownloadButton *)self->_downloadButton frame];
  CGFloat v39 = MidY - CGRectGetHeight(v143) * 0.5;

  +[VUIUtilities imageSizeWithAspectRatio:scaleToSize:](VUIUtilities, "imageSizeWithAspectRatio:scaleToSize:", 1.77777778);
  double v41 = v40;
  double v43 = v42;
  v44 = [(VUILibraryEpisodeListCell *)self contentView];
  [v44 bounds];
  CGFloat v45 = CGRectGetMidY(v144) - v43 * 0.5;

  v145.origin.x = 0.0;
  double v119 = v45;
  v145.origin.y = v45;
  v145.size.double width = v41;
  double v121 = v43;
  v145.size.height = v43;
  double v127 = CGRectGetMaxX(v145);
  v46 = [(VUILibraryEpisodeListCell *)self contentView];
  [v46 bounds];
  double Width = CGRectGetWidth(v146);
  CGFloat v116 = v36;
  CGFloat v117 = v33;
  v147.origin.x = v36;
  v147.size.double width = rect_8;
  CGFloat v113 = v39;
  v147.origin.y = v39;
  v147.size.height = v33;
  double v48 = Width - (v41 + CGRectGetWidth(v147) + 16.0);

  if (self->_downloadButton) {
    double v48 = v48 + -16.0;
  }
  v49 = self->_separatorView;
  v50 = [(VUILibraryEpisodeListCell *)self contentView];
  [v50 bounds];
  double v120 = v41;
  -[VUIBaseView sizeThatFits:](v49, "sizeThatFits:", CGRectGetWidth(v148) - (v41 + 16.0), 1.79769313e308);
  double v115 = v51;
  double v53 = v52;

  double v130 = v48;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v48, 1.79769313e308);
  double v129 = v54;
  v55 = self->_releaseDateLabel;
  double v118 = v4;
  double v114 = v53;
  if (v55 && self->_durationLabel)
  {
    -[VUILabel sizeThatFits:](v55, "sizeThatFits:", v48, 1.79769313e308);
    double v57 = v56;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
    double v59 = v58;
    -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v130, 1.79769313e308);
    BOOL v61 = v59 + v57 + 4.0 + v60 + 4.0 > v130;
  }
  else
  {
    BOOL v61 = 0;
  }
  [(VUILabel *)self->_titleLabel baselineHeight];
  v62 = [(VUILabel *)self->_titleLabel font];
  [v62 capHeight];

  v63 = self->_releaseDateLabel;
  if (v63)
  {
    [(VUILabel *)v63 topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v130, 1.79769313e308);
    [(VUILabel *)self->_releaseDateLabel _baselineOffsetFromBottom];
  }
  double v64 = v127 + 16.0;
  v65 = self->_durationLabel;
  if (v65)
  {
    if (!self->_releaseDateLabel || v61)
    {
      [(VUILabel *)v65 topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
      -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
      [(VUILabel *)self->_durationLabel _baselineOffsetFromBottom];
    }
  }
  v67 = [(VUILibraryEpisodeListCell *)self contentView];
  [v67 bounds];
  CGRectGetHeight(v149);
  VUIRoundValue();
  CGFloat v69 = v68;

  v70 = self->_releaseDateLabel;
  double v71 = v127 + 16.0;
  double v72 = v118;
  double v73 = v131;
  double rect_16 = v131;
  double rect_24 = v118;
  double v128 = v132;
  double v74 = v112;
  if (v70)
  {
    [(VUILabel *)v70 topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    double v76 = v75;
    -[VUILabel sizeThatFits:](self->_releaseDateLabel, "sizeThatFits:", v130, 1.79769313e308);
    double v78 = v77;
    double rect_24 = v79;
    v150.origin.x = v64;
    v150.origin.y = v69;
    v150.size.double width = v130;
    v150.size.height = v129;
    double v128 = v76 + CGRectGetMaxY(v150);
    double rect_16 = v78;
    double v71 = v64 + v78 + 4.0;
    double v74 = v64;
  }
  double v122 = v69;
  double rect = v74;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  if (!dotSeparatorLabel)
  {
    double v83 = v71;
    double v84 = v118;
    goto LABEL_27;
  }
  -[VUILabel sizeThatFits:](dotSeparatorLabel, "sizeThatFits:", v130, 1.79769313e308);
  if (v61)
  {
    [(VUILabel *)self->_dotSeparatorLabel setHidden:1];
    v151.origin.x = 0.0;
    v151.origin.y = v119;
    v151.size.double width = v120;
    v151.size.height = v121;
    double v83 = CGRectGetMaxX(v151) + 16.0;
    double v84 = v118;
    double v73 = v131;
LABEL_27:
    double v111 = v132;
    double v71 = v112;
    goto LABEL_31;
  }
  double v73 = v81;
  double v84 = v82;
  [(VUILabel *)self->_dotSeparatorLabel setHidden:0];
  v154.origin.x = rect;
  v154.size.height = rect_24;
  v154.origin.y = v128;
  v154.size.double width = rect_16;
  double v111 = CGRectGetMidY(v154) + v84 * -0.5;
  double v83 = v71 + v73 + 4.0;
LABEL_31:
  v93 = self->_durationLabel;
  if (v93)
  {
    double v112 = v83;
    [(VUILabel *)v93 topMarginToLabel:self->_titleLabel withBaselineMargin:20.0];
    double v95 = v94;
    v155.origin.x = v64;
    v155.origin.y = v69;
    v155.size.height = v129;
    v155.size.double width = v130;
    double v96 = CGRectGetMaxY(v155);
    if (v61)
    {
      v156.origin.x = rect;
      v156.size.height = rect_24;
      v156.origin.y = v128;
      v156.size.double width = rect_16;
      double v96 = CGRectGetMaxY(v156);
    }
    double v132 = v95 + v96;
    -[VUILabel sizeThatFits:](self->_durationLabel, "sizeThatFits:", v130, 1.79769313e308);
    double v131 = v97;
    double v72 = v98;
  }
LABEL_35:
  if ([(VUILibraryEpisodeListCell *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v99 = [(VUILibraryEpisodeListCell *)self contentView];
    [v99 bounds];

    v100 = self->_separatorView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUISeparatorView setFrame:](v100, "setFrame:");
    v101 = self->_dotSeparatorLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v101, "setFrame:");
    imageFrameView = self->_imageFrameView;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILibraryEpisodeFrameView setFrame:](imageFrameView, "setFrame:");
    v103 = self->_titleLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v103, "setFrame:");
    v104 = self->_releaseDateLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v104, "setFrame:");
    v105 = self->_durationLabel;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    -[VUILabel setFrame:](v105, "setFrame:");
    downloadButton = self->_downloadButton;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
  }
  else
  {
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v64, 0.0, v115, v114);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v71, v111, v73, v84);
    -[VUILibraryEpisodeFrameView setFrame:](self->_imageFrameView, "setFrame:", 0.0, v119, v120, v121);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v64, v122, v130, v129);
    -[VUILabel setFrame:](self->_releaseDateLabel, "setFrame:", rect, v128, rect_16, rect_24);
    -[VUILabel setFrame:](self->_durationLabel, "setFrame:", v112, v132, v131, v72);
    downloadButton = self->_downloadButton;
    double v109 = rect_8;
    double v107 = v116;
    double v110 = v117;
    double v108 = v113;
  }
  -[VUIDownloadButton setFrame:](downloadButton, "setFrame:", v107, v108, v109, v110);
}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  id v8 = a3;
  double v4 = [v8 assetController];

  if (v4)
  {
    double v5 = [(VUILibraryEpisodeListCell *)self downloadButton];
    if (v5)
    {
      v6 = v5;
      [(VUIDownloadButton *)v5 updateWithAssetController:self->_assetController];
    }
    else
    {
      v6 = [[VUIDownloadButton alloc] initWithMediaEntity:v8 type:8];
      [(VUIDownloadButton *)v6 setUsesDefaultConfiguration:1];
      id v7 = [(VUILibraryEpisodeListCell *)self contentView];
      [v7 addSubview:v6];

      [(VUILibraryEpisodeListCell *)self setDownloadButton:v6];
    }
  }
  else
  {
    [(VUILibraryEpisodeListCell *)self setDownloadButton:0];
  }
}

- (void)_configureDotSeparator
{
  if (self->_releaseDate
    && self->_duration
    && ![(VUILibraryEpisodeListCell *)self _contentSizeCategoryIsAccessibility])
  {
    id v8 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v8 setTextStyle:22];
    double v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    [(VUITextLayout *)v8 setColor:v4];

    [(VUITextLayout *)v8 setNumberOfLines:1];
    double v5 = +[VUILabel labelWithString:@"·" textLayout:v8 existingLabel:self->_dotSeparatorLabel];
    dotSeparatorLabel = self->_dotSeparatorLabel;
    self->_dotSeparatorLabel = v5;

    id v7 = [(VUILibraryEpisodeListCell *)self contentView];
    [v7 addSubview:self->_dotSeparatorLabel];

    double v3 = (VUILabel *)v8;
  }
  else
  {
    [(VUILabel *)self->_dotSeparatorLabel removeFromSuperview];
    double v3 = self->_dotSeparatorLabel;
    self->_dotSeparatorLabel = 0;
  }
}

- (double)_metadataScaledTopMarginForNonAXContentSizeCategory
{
  double v3 = [(VUILibraryEpisodeListCell *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v3 forTraitCollection:20.0];
  double v5 = v4;

  [(VUILibraryEpisodeListCell *)self _metadataHeightToBaselineNonAXContentSizeCategory];
  return v5 - v6;
}

- (double)_metadataHeightToBaselineNonAXContentSizeCategory
{
  releaseDateLabel = self->_releaseDateLabel;
  if (!releaseDateLabel)
  {
    releaseDateLabel = self->_durationLabel;
    if (!releaseDateLabel) {
      return 0.0;
    }
  }
  [(UILabel *)releaseDateLabel vui_heightToBaseline];
  return result;
}

- (BOOL)_contentSizeCategoryIsAccessibility
{
  v2 = [(VUILibraryEpisodeListCell *)self traitCollection];
  char v3 = [v2 isAXEnabled];

  return v3;
}

+ (id)_metadataLabelWithString:(id)a3 existingLabel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v7 setTextStyle:22];
  id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v7 setColor:v8];

  [(VUITextLayout *)v7 setNumberOfLines:1];
  CGFloat v9 = +[VUILabel labelWithString:v6 textLayout:v7 existingLabel:v5];

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)releaseDate
{
  return self->_releaseDate;
}

- (NSString)duration
{
  return self->_duration;
}

- (VUILibraryEpisodeFrameView)imageFrameView
{
  return self->_imageFrameView;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIStackView)episodeInfoStackView
{
  return self->_episodeInfoStackView;
}

- (void)setEpisodeInfoStackView:(id)a3
{
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (VUILabel)releaseDateLabel
{
  return self->_releaseDateLabel;
}

- (void)setReleaseDateLabel:(id)a3
{
}

- (VUILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (void)setDotSeparatorLabel:(id)a3
{
}

- (VUIMediaEntityAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (VUIMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_releaseDateLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_episodeInfoStackView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_imageFrameView, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end