@interface VUIDownloadEntityTableViewCell
+ (id)_generateMetaDataHeaderFirstLabelForDownloadEntity:(id)a3;
+ (void)configureVUIDownloadEntityTableViewCell:(id)a3 withDownloadEntity:(id)a4 forMetrics:(BOOL)a5;
- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIDownloadButton)downloadButton;
- (VUIDownloadEntity)downloadEntity;
- (VUIDownloadEntityTableViewCell)initWithFrame:(CGRect)a3;
- (VUIDownloadEntityTableViewCellDelegate)delegate;
- (VUIImageView)posterImageView;
- (VUILabel)dotSeparatorLabel;
- (VUILabel)metaDataHeaderFirstLabel;
- (VUILabel)metaDataHeaderSecondLabel;
- (VUILabel)titleLabel;
- (VUILibraryEpisodeFrameView)episodeImageView;
- (VUISeparatorView)bottomSeparatorView;
- (VUISeparatorView)topSeparatorView;
- (VUIVideosImageView)rightImageView;
- (double)_imageHeightForCurrentSizeClass;
- (double)_verticalPaddingForCurrentSizeClass;
- (id)_episodePlaceholderImage;
- (unint64_t)previousDownloadState;
- (void)_addDownloadButtonIfRequired:(id)a3;
- (void)_addMetaDataLabelsIfRequired:(id)a3;
- (void)_configureViewElementsForAX;
- (void)_removeDownloadButtonIfRequired;
- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4;
- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomSeparatorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDotSeparatorLabel:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)setDownloadEntity:(id)a3;
- (void)setEpisodeImageView:(id)a3;
- (void)setMetaDataHeaderFirstLabel:(id)a3;
- (void)setMetaDataHeaderSecondLabel:(id)a3;
- (void)setPosterImageView:(id)a3;
- (void)setPreviousDownloadState:(unint64_t)a3;
- (void)setRightImageView:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
- (void)setTopSeparatorView:(id)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation VUIDownloadEntityTableViewCell

+ (void)configureVUIDownloadEntityTableViewCell:(id)a3 withDownloadEntity:(id)a4 forMetrics:(BOOL)a5
{
  id v73 = a3;
  id v7 = a4;
  [v73 setDownloadEntity:v7];
  +[VUIUtilities imageCornerRadiusWithStyle:1];
  double v9 = v8;
  double v10 = 0.0;
  if (!a5)
  {
    [v7 setDelegate:v73];
    [v73 _imageHeightForCurrentSizeClass];
    double v10 = v11;
  }
  v12 = [v7 title];

  if (v12)
  {
    v13 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v13 setTextStyle:20];
    [(VUITextLayout *)v13 setFontWeight:0];
    v14 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(VUITextLayout *)v13 setColor:v14];

    [(VUITextLayout *)v13 setAllowsTextAlignmentOverride:1];
    [(VUITextLayout *)v13 setNumberOfLines:2];
    uint64_t v15 = [v7 title];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_1F3E921E0;
    }
    v18 = [v73 titleLabel];
    v12 = +[VUILabel labelWithString:v17 textLayout:v13 existingLabel:v18];
  }
  [v73 setTitleLabel:v12];
  v19 = [v7 mediaEntities];
  v20 = [v19 firstObject];

  if ([v7 downloadType])
  {
    if ([v7 downloadType] == 1)
    {
      if (!a5)
      {
        v21 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v20 imageType:0];
        v22 = [v73 posterImageView];
        if (v22)
        {
          id v23 = [v73 posterImageView];
        }
        else
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
        }
        v41 = v23;

        [v41 setUserInteractionEnabled:0];
        v42 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageHighlightColor");
        [v41 _setFocusedColor:v42];

        v43 = [v73 _episodePlaceholderImage];
        [v41 setPlaceholderImage:v43];

        if (v21)
        {
          v44 = (void *)MEMORY[0x1E4FB3CC8];
          v45 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
          v46 = objc_msgSend(v44, "decoratorWithOutlineColor:outlineWidths:", v45, 1.0, 1.0, 1.0, 1.0);

          id v47 = objc_alloc(MEMORY[0x1E4FB3CD0]);
          v48 = [v20 mediaLibrary];
          v49 = (void *)[v47 initWithObject:v21 imageLoader:v48 groupType:0];

          objc_msgSend(v46, "setScaleToSize:", v10 * 1.77777778, v10);
          [MEMORY[0x1E4FB3C70] radiiFromRadius:v9];
          objc_msgSend(v46, "setCornerRadii:");
          [v49 setDecorator:v46];
          [v41 setImageProxy:v49];
          +[VUIUtilities imageCornerRadiusWithStyle:1];
          objc_msgSend(v41, "setCornerRadius:");
        }
        [v73 setPosterImageView:v41];
      }
      [v73 _addMetaDataLabelsIfRequired:v7];
      v50 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
      v51 = [VUIVideosImageView alloc];
      v52 = -[VUIVideosImageView initWithFrame:](v51, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v53 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      v54 = [v50 imageWithTintColor:v53 renderingMode:1];
      [(VUIVideosImageView *)v52 setImage:v54];

      v55 = [MEMORY[0x1E4FB1618] whiteColor];
      v56 = [v50 imageWithTintColor:v55 renderingMode:1];
      [(VUIVideosImageView *)v52 setHighlightOrSelectedImage:v56];

      [v73 setRightImageView:v52];
LABEL_33:

      goto LABEL_37;
    }
    if ([v7 downloadType] != 3)
    {
      if ([v7 downloadType] != 2) {
        goto LABEL_37;
      }
      if (!a5)
      {
        v29 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v20 imageType:0];
        v30 = [v73 posterImageView];
        if (v30)
        {
          id v31 = [v73 posterImageView];
        }
        else
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
        }
        v58 = v31;

        [v58 setUserInteractionEnabled:0];
        v59 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageHighlightColor");
        [v58 _setFocusedColor:v59];

        v60 = [v73 _episodePlaceholderImage];
        [v58 setPlaceholderImage:v60];

        if (v29)
        {
          v61 = (void *)MEMORY[0x1E4FB3CC8];
          v62 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
          v63 = objc_msgSend(v61, "decoratorWithOutlineColor:outlineWidths:", v62, 1.0, 1.0, 1.0, 1.0);

          id v64 = objc_alloc(MEMORY[0x1E4FB3CD0]);
          v65 = [v20 mediaLibrary];
          v66 = (void *)[v64 initWithObject:v29 imageLoader:v65 groupType:0];

          objc_msgSend(v63, "setScaleToSize:", v10 * 1.77777778, v10);
          [MEMORY[0x1E4FB3C70] radiiFromRadius:v9];
          objc_msgSend(v63, "setCornerRadii:");
          [v66 setDecorator:v63];
          [v58 setImageProxy:v66];
          +[VUIUtilities imageCornerRadiusWithStyle:1];
          objc_msgSend(v58, "setCornerRadius:");
        }
        [v73 setPosterImageView:v58];
      }
      v50 = +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:v7];
      v52 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
      v67 = [VUIVideosImageView alloc];
      v68 = -[VUIVideosImageView initWithFrame:](v67, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v69 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      v70 = [(VUIVideosImageView *)v52 imageWithTintColor:v69 renderingMode:1];
      [(VUIVideosImageView *)v68 setImage:v70];

      v71 = [MEMORY[0x1E4FB1618] whiteColor];
      v72 = [(VUIVideosImageView *)v52 imageWithTintColor:v71 renderingMode:1];
      [(VUIVideosImageView *)v68 setHighlightOrSelectedImage:v72];

      [v73 setRightImageView:v68];
      [v73 setMetaDataHeaderFirstLabel:v50];
      [v73 setMetaDataHeaderSecondLabel:0];
      [v73 setDotSeparatorLabel:0];

      goto LABEL_33;
    }
    if (!a5)
    {
      v27 = [v73 episodeImageView];
      if (v27)
      {
        v28 = [v73 episodeImageView];
      }
      else
      {
        v28 = -[VUILibraryEpisodeFrameView initWithFrame:]([VUILibraryEpisodeFrameView alloc], "initWithFrame:", 0.0, 0.0, v10 * 1.77777778, v10);
      }
      v57 = v28;

      +[VUILibraryEpisodeFrameView configureEpisodeFrameView:withMedia:layout:imageSize:](VUILibraryEpisodeFrameView, "configureEpisodeFrameView:withMedia:layout:imageSize:", v57, v20, 0, v10 * 1.77777778, v10);
      [v73 setEpisodeImageView:v57];
    }
  }
  else if (!a5)
  {
    v24 = +[VUIMediaEntityImageLoadParamsFactory imageLoadParamsWithMediaEntity:v20 imageType:0];
    v25 = [v73 posterImageView];
    if (v25)
    {
      id v26 = [v73 posterImageView];
    }
    else
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4FB3CE0]);
    }
    v32 = v26;

    [v32 setUserInteractionEnabled:0];
    v33 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageHighlightColor");
    [v32 _setFocusedColor:v33];

    v34 = [v73 _episodePlaceholderImage];
    [v32 setPlaceholderImage:v34];

    if (v24)
    {
      v35 = (void *)MEMORY[0x1E4FB3CC8];
      v36 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_imageBorderColor");
      v37 = objc_msgSend(v35, "decoratorWithOutlineColor:outlineWidths:", v36, 1.0, 1.0, 1.0, 1.0);

      id v38 = objc_alloc(MEMORY[0x1E4FB3CD0]);
      v39 = [v20 mediaLibrary];
      v40 = (void *)[v38 initWithObject:v24 imageLoader:v39 groupType:0];

      objc_msgSend(v37, "setScaleToSize:", v10 * 1.77777778, v10);
      [MEMORY[0x1E4FB3C70] radiiFromRadius:v9];
      objc_msgSend(v37, "setCornerRadii:");
      [v40 setDecorator:v37];
      [v32 setImageProxy:v40];
      +[VUIUtilities imageCornerRadiusWithStyle:1];
      objc_msgSend(v32, "setCornerRadius:");
    }
    [v73 setPosterImageView:v32];
  }
  [v73 _addMetaDataLabelsIfRequired:v7];
  [v73 _addDownloadButtonIfRequired:v20];
LABEL_37:
}

- (VUIDownloadEntityTableViewCell)initWithFrame:(CGRect)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VUIDownloadEntityTableViewCell;
  v3 = -[VUIDownloadEntityTableViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v11[0] = objc_opt_class();
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__VUIDownloadEntityTableViewCell_initWithFrame___block_invoke;
    v7[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v8, &location);
    id v5 = (id)[(VUIDownloadEntityTableViewCell *)v3 registerForTraitChanges:v4 withHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __48__VUIDownloadEntityTableViewCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained rightImageView];
  v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
  [v1 setImage:v2];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadEntityTableViewCell;
  [(VUIDownloadEntityTableViewCell *)&v5 prepareForReuse];
  [(VUIDownloadEntityTableViewCell *)self setRightImageView:0];
  [(VUIDownloadEntityTableViewCell *)self _removeDownloadButtonIfRequired];
  [(VUIDownloadEntityTableViewCell *)self setEpisodeImageView:0];
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:0];
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:0];
  [(VUIDownloadEntityTableViewCell *)self setDotSeparatorLabel:0];
  v3 = [(VUIDownloadEntityTableViewCell *)self downloadEntity];
  [v3 setDelegate:0];

  downloadEntity = self->_downloadEntity;
  self->_downloadEntity = 0;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadEntityTableViewCell;
  [(VUIDownloadEntityTableViewCell *)&v9 setSelected:a3 animated:a4];
  if ([(VUIDownloadEntityTableViewCell *)self isEditing])
  {
    objc_super v5 = [(VUIDownloadEntityTableViewCell *)self topSeparatorView];
    v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
    [v5 setBackgroundColor:v6];

    id v7 = [(VUIDownloadEntityTableViewCell *)self bottomSeparatorView];
    id v8 = [MEMORY[0x1E4FB1618] colorWithRed:0.78 green:0.78 blue:0.8 alpha:1.0];
    [v7 setBackgroundColor:v8];
  }
}

- (void)setTitleLabel:(id)a3
{
  objc_super v5 = (VUILabel *)a3;
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  if (titleLabel != v5)
  {
    objc_super v9 = v5;
    [(VUILabel *)titleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (*p_titleLabel)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_titleLabel];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setPosterImageView:(id)a3
{
  objc_super v5 = (VUIImageView *)a3;
  p_posterImageView = &self->_posterImageView;
  posterImageView = self->_posterImageView;
  if (posterImageView != v5)
  {
    objc_super v9 = v5;
    [(VUIImageView *)posterImageView removeFromSuperview];
    [(VUIImageView *)v9 setUserInteractionEnabled:0];
    objc_storeStrong((id *)&self->_posterImageView, a3);
    if (*p_posterImageView)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_posterImageView];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setMetaDataHeaderFirstLabel:(id)a3
{
  objc_super v5 = (VUILabel *)a3;
  p_metaDataHeaderFirstLabel = &self->_metaDataHeaderFirstLabel;
  metaDataHeaderFirstLabel = self->_metaDataHeaderFirstLabel;
  if (metaDataHeaderFirstLabel != v5)
  {
    objc_super v9 = v5;
    [(VUILabel *)metaDataHeaderFirstLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, a3);
    if (*p_metaDataHeaderFirstLabel)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_metaDataHeaderFirstLabel];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setMetaDataHeaderSecondLabel:(id)a3
{
  objc_super v5 = (VUILabel *)a3;
  p_metaDataHeaderSecondLabel = &self->_metaDataHeaderSecondLabel;
  metaDataHeaderSecondLabel = self->_metaDataHeaderSecondLabel;
  if (metaDataHeaderSecondLabel != v5)
  {
    objc_super v9 = v5;
    [(VUILabel *)metaDataHeaderSecondLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, a3);
    if (*p_metaDataHeaderSecondLabel)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_metaDataHeaderSecondLabel];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setEpisodeImageView:(id)a3
{
  objc_super v5 = (VUILibraryEpisodeFrameView *)a3;
  p_episodeImageView = &self->_episodeImageView;
  episodeImageView = self->_episodeImageView;
  if (episodeImageView != v5)
  {
    objc_super v9 = v5;
    [(VUILibraryEpisodeFrameView *)episodeImageView removeFromSuperview];
    [(VUILibraryEpisodeFrameView *)v9 setUserInteractionEnabled:0];
    objc_storeStrong((id *)&self->_episodeImageView, a3);
    if (*p_episodeImageView)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_episodeImageView];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setDotSeparatorLabel:(id)a3
{
  objc_super v5 = (VUILabel *)a3;
  p_dotSeparatorLabel = &self->_dotSeparatorLabel;
  dotSeparatorLabel = self->_dotSeparatorLabel;
  if (dotSeparatorLabel != v5)
  {
    objc_super v9 = v5;
    [(VUILabel *)dotSeparatorLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_dotSeparatorLabel, a3);
    if (*p_dotSeparatorLabel)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_dotSeparatorLabel];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setRightImageView:(id)a3
{
  objc_super v5 = (VUIVideosImageView *)a3;
  p_rightImageView = &self->_rightImageView;
  rightImageView = self->_rightImageView;
  if (rightImageView != v5)
  {
    objc_super v9 = v5;
    [(VUIVideosImageView *)rightImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_rightImageView, a3);
    if (*p_rightImageView)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_rightImageView];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setTopSeparatorView:(id)a3
{
  objc_super v5 = (VUISeparatorView *)a3;
  p_topSeparatorView = &self->_topSeparatorView;
  topSeparatorView = self->_topSeparatorView;
  if (topSeparatorView != v5)
  {
    objc_super v9 = v5;
    [(VUISeparatorView *)topSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_topSeparatorView, a3);
    if (*p_topSeparatorView)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_topSeparatorView];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setBottomSeparatorView:(id)a3
{
  objc_super v5 = (VUISeparatorView *)a3;
  p_bottomSeparatorView = &self->_bottomSeparatorView;
  bottomSeparatorView = self->_bottomSeparatorView;
  if (bottomSeparatorView != v5)
  {
    objc_super v9 = v5;
    [(VUISeparatorView *)bottomSeparatorView removeFromSuperview];
    objc_storeStrong((id *)&self->_bottomSeparatorView, a3);
    if (*p_bottomSeparatorView)
    {
      id v8 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v8 addSubview:*p_bottomSeparatorView];
    }
    [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setDownloadEntity:(id)a3
{
  objc_super v5 = (VUIDownloadEntity *)a3;
  p_downloadEntity = &self->_downloadEntity;
  if (*p_downloadEntity != v5)
  {
    id v7 = v5;
    [(VUIDownloadEntity *)*p_downloadEntity setDelegate:0];
    objc_storeStrong((id *)p_downloadEntity, a3);
    objc_super v5 = v7;
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadEntityTableViewCell;
  -[VUIDownloadEntityTableViewCell willTransitionToState:](&v12, sel_willTransitionToState_);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __56__VUIDownloadEntityTableViewCell_willTransitionToState___block_invoke;
  objc_super v9 = &unk_1E6DF51F0;
  objc_super v10 = self;
  BOOL v11 = a3 == 1;
  objc_super v5 = _Block_copy(&v6);
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:animations:completion:", v5, 0, 0.300000012, v6, v7, v8, v9);
}

void __56__VUIDownloadEntityTableViewCell_willTransitionToState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) rightImageView];
  [v2 setHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIDownloadEntityTableViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadEntityTableViewCell;
  [(VUIDownloadEntityTableViewCell *)&v4 layoutSubviews];
  [(VUIDownloadEntityTableViewCell *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(VUIDownloadEntityTableViewCell *)self bounds];
  -[VUIDownloadEntityTableViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4
{
  +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadEntityTableViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v5];
  [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
}

- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4
{
  +[VUIDownloadEntityTableViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadEntityTableViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v5];
  [(VUIDownloadEntityTableViewCell *)self setNeedsLayout];
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(VUIDownloadEntityTableViewCell *)self _configureViewElementsForAX];
  id v8 = [(VUIDownloadEntityTableViewCell *)self traitCollection];
  int v9 = [v8 isAXEnabled];

  if (v9)
  {
    -[VUIDownloadEntityTableViewCell _layoutForCategoryAccessibility:metricsOnly:](self, "_layoutForCategoryAccessibility:metricsOnly:", v4, width, height);
  }
  else
  {
    -[VUIDownloadEntityTableViewCell _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_layoutForCategoryAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:");
  double v176 = v8;
  double v10 = v9;
  [(VUIDownloadEntityTableViewCell *)self _imageHeightForCurrentSizeClass];
  double v174 = v11;
  objc_super v12 = [(VUIVideosImageView *)self->_rightImageView image];
  [v12 size];
  double v14 = v13;
  double v16 = v15;

  if (![(VUIDownloadEntity *)self->_downloadEntity downloadType]
    || [(VUIDownloadEntity *)self->_downloadEntity downloadType] == 3)
  {
    double v16 = 28.0;
    double v14 = 16.0;
  }
  v17 = (double *)MEMORY[0x1E4F1DB30];
  double v18 = width - (v176 + v10 + 10.0 + v14);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v18, height);
  CGFloat v171 = v19;
  double v21 = v20;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", v18, height);
  double v170 = v22;
  CGFloat v168 = v23;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", v18, height);
  double v25 = v24;
  double v169 = v26;
  [(VUIDownloadButton *)self->_downloadButton sizeToFit];
  v27 = [(VUIDownloadEntityTableViewCell *)self traitCollection];
  +[VUIUtilities scaleContentSizeValue:v27 forTraitCollection:8.0];
  double v175 = v28;

  v29 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];

  if (v29)
  {
    uint64_t v30 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];
  }
  else
  {
    id v31 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];

    if (!v31) {
      goto LABEL_9;
    }
    uint64_t v30 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];
  }
  id v31 = (void *)v30;
LABEL_9:
  double v165 = *v17;
  [(VUILabel *)self->_titleLabel topMarginToLabel:v31 withBaselineMargin:21.0];
  double v167 = v32;
  if (!a4)
  {
    double v163 = v25;
    double v152 = v16;
    double v154 = v14;
    double v159 = v10;
    CGFloat v141 = v21;
    double v33 = *MEMORY[0x1E4F1DB28];
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    topSeparatorView = self->_topSeparatorView;
    id v38 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v38 bounds];
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v178) - v176, 1.79769313e308);
    double v40 = v39;
    double v156 = v41;

    [(VUIDownloadEntityTableViewCell *)self posterImageView];
    v179.origin.x = v176;
    v179.origin.y = v175;
    double v173 = v174 * 1.77777778;
    v179.size.double width = v174 * 1.77777778;
    v179.size.double height = v174;
    double MaxY = CGRectGetMaxY(v179);
    v43 = [(VUIDownloadEntityTableViewCell *)self titleLabel];

    double v161 = v34;
    double v162 = v33;
    if (v43)
    {
      double v34 = v167 + MaxY;
      double v44 = v176;
      v180.origin.x = v176;
      v180.origin.y = v34;
      CGFloat v45 = v171;
      v180.size.double width = v171;
      v180.size.double height = v141;
      double v166 = CGRectGetMaxY(v180);
      double v143 = v141;
    }
    else
    {
      double v166 = MaxY;
      double v143 = v35;
      CGFloat v45 = v36;
      double v44 = v33;
    }
    v46 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];

    double v172 = v45;
    double v158 = v34;
    double v149 = v40;
    if (v46)
    {
      v181.origin.x = v176;
      v181.origin.y = v166;
      v181.size.double width = v170;
      v181.size.double height = v168;
      CGFloat v47 = CGRectGetMaxY(v181);
      CGFloat v48 = v168;
      double v142 = v176;
      double v50 = v161;
      double v49 = v162;
    }
    else
    {
      CGFloat v47 = v166;
      CGFloat v48 = v35;
      double v170 = v36;
      double v50 = v161;
      double v166 = v161;
      double v49 = v162;
      double v142 = v162;
    }
    v51 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];

    double v52 = v35;
    double v53 = v36;
    CGFloat v54 = v50;
    double v55 = v49;
    double v56 = v50;
    if (v51)
    {
      double v52 = v169;
      double v53 = v163;
      CGFloat v54 = v47;
      double v55 = v176;
    }
    double v146 = v55;
    double v147 = v54;
    double v148 = v53;
    double v151 = v52;
    double v57 = v35;
    double v58 = v36;
    double v164 = v49;
    double v59 = v156;
    if (self->_rightImageView)
    {
      v60 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v60 bounds];
      double v58 = v154;
      double v61 = CGRectGetMaxX(v182) - (v159 + v154);

      if ([(VUIDownloadEntity *)self->_downloadEntity downloadType]
        && [(VUIDownloadEntity *)self->_downloadEntity downloadType] != 3)
      {
        double v61 = v61 + (16.0 - v154) * -0.5;
      }
      double v164 = v61;
      v183.origin.y = v175;
      v183.origin.x = v176;
      v183.size.double width = v174 * 1.77777778;
      v183.size.double height = v174;
      double v56 = CGRectGetMidY(v183) + v152 * -0.5;
      double v57 = v152;
      double v59 = v156;
      double v49 = v162;
    }
    double v138 = v56;
    double v139 = v58;
    double v140 = v57;
    downloadButton = self->_downloadButton;
    if (downloadButton)
    {
      [(VUIDownloadButton *)downloadButton frame];
      double v36 = CGRectGetWidth(v184);
      [(VUIDownloadButton *)self->_downloadButton frame];
      double v35 = CGRectGetHeight(v185);
      v63 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v63 bounds];
      double v49 = CGRectGetMaxX(v186) - (v159 + v36);
      v187.origin.y = v175;
      v187.origin.x = v176;
      v187.size.double width = v174 * 1.77777778;
      v187.size.double height = v174;
      double v161 = CGRectGetMidY(v187) + v35 * -0.5;
    }
    double v153 = v48;
    double v155 = v44;
    double v160 = v36;
    bottomSeparatorView = self->_bottomSeparatorView;
    v65 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v65 bounds];
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v188) - v176, 1.79769313e308);
    double v131 = v66;
    double v68 = v67;

    v189.origin.x = v176;
    v189.size.double height = v174;
    v189.origin.y = v175;
    v189.size.double width = v174 * 1.77777778;
    double v145 = CGRectGetMaxX(v189) + 16.0;
    v69 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v69 bounds];
    double v144 = CGRectGetHeight(v190) - v68;

    uint64_t v70 = [(VUIDownloadEntityTableViewCell *)self effectiveUserInterfaceLayoutDirection];
    double v71 = 0.0;
    if (v70 == 1)
    {
      v72 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v72 bounds];
      double v128 = v35;

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v129 = v73;
      double v130 = v74;
      double v150 = v75;
      double v157 = v76;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v137 = v77;
      double v134 = v79;
      double v135 = v78;
      double v132 = v80;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v176 = v81;
      double v136 = v82;
      double v173 = v83;
      double v133 = v84;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v142 = v85;
      double v166 = v86;
      double v170 = v87;
      double v153 = v88;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v146 = v89;
      double v147 = v90;
      double v148 = v91;
      double v151 = v92;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v155 = v93;
      double v158 = v94;
      double v172 = v95;
      double v143 = v96;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v164 = v97;
      double v99 = v98;
      double v101 = v100;
      double v103 = v102;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v105 = v104;
      double v160 = v106;
      double v49 = v107;
      double v35 = v108;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v144 = v110;
      double v145 = v109;
      double v111 = v129;
      double v113 = v112;
      double v114 = v150;
      double v68 = v115;
      double v116 = v157;
      double v71 = v130;
    }
    else
    {
      double v136 = v175;
      double v133 = v174;
      double v137 = v176;
      double v135 = v175;
      double v134 = v174 * 1.77777778;
      double v132 = v174;
      double v111 = v176;
      double v105 = v161;
      double v116 = v59;
      double v114 = v149;
      double v101 = v139;
      double v103 = v140;
      double v99 = v138;
      double v113 = v131;
    }
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v111, v71, v114, v116, *(void *)&v128);
    -[VUIImageView setFrame:](self->_posterImageView, "setFrame:", v137, v135, v134, v132);
    -[VUILibraryEpisodeFrameView setFrame:](self->_episodeImageView, "setFrame:", v176, v136, v173, v133);
    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v142, v166, v170, v153);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v146, v147, v148, v151);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v155, v158, v172, v143);
    -[VUIVideosImageView setFrame:](self->_rightImageView, "setFrame:", v164, v99, v101, v103);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v49, v105, v160, v35);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v145, v144, v113, v68);
    double v21 = v141;
  }
  v117 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];

  double v118 = v168;
  if (!v117) {
    double v118 = -0.0;
  }
  double v119 = v174 + 0.0 + v118;
  v120 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];

  double v121 = v169;
  if (!v120) {
    double v121 = -0.0;
  }
  double v122 = v119 + v121;
  v123 = [(VUIDownloadEntityTableViewCell *)self titleLabel];

  double v124 = v21 + v167 + v122;
  if (!v123) {
    double v124 = v122;
  }
  double v125 = v124 + v175 * 2.0;

  double v126 = v165;
  double v127 = v125;
  result.double height = v127;
  result.double width = v126;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_paddingForWindowWidth:");
  double v9 = v8;
  double v11 = v10;
  [(VUIDownloadEntityTableViewCell *)self _imageHeightForCurrentSizeClass];
  double v13 = v12;
  [(VUIDownloadEntityTableViewCell *)self _verticalPaddingForCurrentSizeClass];
  double v190 = v14;
  double v15 = [(VUIVideosImageView *)self->_rightImageView image];
  [v15 size];
  double v17 = v16;
  double v19 = v18;

  if ([(VUIDownloadEntity *)self->_downloadEntity downloadType]
    && [(VUIDownloadEntity *)self->_downloadEntity downloadType] != 3)
  {
    double v168 = v19;
  }
  else
  {
    double v168 = 28.0;
    double v17 = 16.0;
  }
  double v201 = v13 * 1.77777778;
  double v183 = v11;
  downloadButton = self->_downloadButton;
  double v21 = v17;
  if (downloadButton)
  {
    [(VUIDownloadButton *)downloadButton sizeToFit];
    [(VUIDownloadButton *)self->_downloadButton frame];
    double v21 = CGRectGetWidth(v204);
  }
  double v185 = v17;
  double v22 = width - (v11 + v9 + v13 * 1.77777778 + 32.0 + 10.0 + v21);
  if ([(VUIDownloadEntityTableViewCell *)self isEditing]) {
    double v23 = v22 + -10.0;
  }
  else {
    double v23 = v22;
  }
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23, height);
  double v25 = v24;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", v23, height);
  double v193 = v26;
  double v194 = v27;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", v23, height);
  double v29 = v28;
  double v174 = v30;
  -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", v23, height);
  CGFloat v188 = v31;
  double v189 = v32;
  metaDataHeaderFirstLabel = self->_metaDataHeaderFirstLabel;
  if (metaDataHeaderFirstLabel || (metaDataHeaderFirstLabel = self->_metaDataHeaderSecondLabel) != 0)
  {
    double v34 = metaDataHeaderFirstLabel;
    -[VUILabel sizeThatFits:](v34, "sizeThatFits:", v23, height);
    double v36 = v35;
    [(VUILabel *)self->_titleLabel topMarginToLabel:v34 withBaselineMargin:21.0];
    double v38 = v37;
  }
  else
  {
    double v34 = 0;
    double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v38 = 0.0;
  }
  double v39 = v25 + v38 + v36;
  if (!a4)
  {
    double v172 = v29;
    CGFloat v191 = v23;
    double v187 = v25;
    double v156 = v25 + v38 + v36;
    double v157 = width;
    double v179 = (v13 - v39) * 0.5;
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v199 = *MEMORY[0x1E4F1DB28];
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v158 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    topSeparatorView = self->_topSeparatorView;
    v43 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v43 bounds];
    -[VUIBaseView sizeThatFits:](topSeparatorView, "sizeThatFits:", CGRectGetWidth(v205) - v9, 1.79769313e308);
    double v159 = v44;
    double v161 = v45;

    v46 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v46 bounds];
    double v47 = CGRectGetMidY(v206) - v13 * 0.5;

    CGFloat v48 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v48 bounds];
    double v49 = CGRectGetMidY(v207) - v13 * 0.5;

    double v50 = [(VUIDownloadEntityTableViewCell *)self posterImageView];
    double v181 = v49;
    double v182 = v47;
    if (v50) {
      CGFloat v51 = v47;
    }
    else {
      CGFloat v51 = v49;
    }

    v208.origin.x = v9;
    v208.origin.y = v51;
    v208.size.double width = v13 * 1.77777778;
    v208.size.double height = v13;
    double v52 = v179 + CGRectGetMinY(v208);
    double v53 = [(VUIDownloadEntityTableViewCell *)self titleLabel];

    double v195 = v40;
    double v197 = v41;
    double v202 = v9;
    if (v53)
    {
      v209.origin.x = v9;
      v209.origin.y = v51;
      v209.size.double width = v13 * 1.77777778;
      v209.size.double height = v13;
      double v54 = CGRectGetMaxX(v209) + 16.0;
      v210.origin.x = v54;
      double v180 = v52;
      v210.origin.y = v52;
      CGFloat v55 = v191;
      v210.size.double width = v191;
      v210.size.double height = v187;
      double v56 = v38 + CGRectGetMaxY(v210);
      double v57 = v158;
    }
    else
    {
      double v56 = v52;
      double v187 = v41;
      double v57 = v158;
      CGFloat v55 = v158;
      double v180 = v40;
      double v54 = v199;
    }
    v211.origin.x = v9;
    v211.origin.y = v51;
    v211.size.double width = v13 * 1.77777778;
    v211.size.double height = v13;
    CGFloat MaxX = CGRectGetMaxX(v211);
    double v60 = v51;
    double v61 = MaxX + 16.0;
    double v192 = v55;
    double v178 = v54;
    CGFloat rect = v60;
    if (self->_metaDataHeaderFirstLabel)
    {
      double v62 = v9;
      double v63 = v13;
      double v59 = v13 * 1.77777778;
      double v64 = CGRectGetMaxX(*(CGRect *)(&v60 - 1));
      double v65 = v64 + 16.0;
      double v177 = v64 + 16.0;
      if (self->_dotSeparatorLabel)
      {
        v212.origin.x = v64 + 16.0;
        v212.origin.y = v56;
        v212.size.double width = v193;
        v212.size.double height = v194;
        CGFloat v66 = CGRectGetMaxX(v212) + 6.0;
        v213.origin.x = v65;
        v213.origin.y = v56;
        v213.size.double width = v193;
        v213.size.double height = v194;
        CGFloat MidY = CGRectGetMidY(v213);
        v214.size.double height = v189;
        CGFloat v68 = MidY + v189 * -0.5;
        CGFloat v155 = v66;
        v214.origin.x = v66;
        v214.origin.y = v68;
        v214.size.double width = v188;
        CGFloat v69 = CGRectGetMaxX(v214);
        CGFloat v70 = v68;
        double v61 = v69 + 6.0;
        double v71 = v56;
        double v72 = v197;
        double v73 = v199;
        double v74 = v195;
      }
      else
      {
        double v74 = v195;
        double v72 = v197;
        CGFloat v188 = v57;
        double v189 = v197;
        CGFloat v70 = v195;
        double v73 = v199;
        CGFloat v155 = v199;
        double v71 = v56;
      }
    }
    else
    {
      double v74 = v195;
      double v72 = v197;
      CGFloat v188 = v57;
      double v189 = v197;
      CGFloat v70 = v195;
      CGFloat v155 = v199;
      double v73 = v199;
      double v193 = v57;
      double v194 = v197;
      double v71 = v195;
      double v177 = v199;
    }
    double v176 = v71;
    CGFloat v154 = v70;
    double v75 = v72;
    double v76 = v57;
    double v77 = v74;
    double v78 = v73;
    if (self->_metaDataHeaderSecondLabel)
    {
      double v76 = v172;
      double v75 = v174;
      double v77 = v56;
      double v78 = v61;
    }
    double v170 = v78;
    double v171 = v77;
    double v173 = v76;
    double v175 = v75;
    double v79 = v72;
    double v80 = v57;
    double v81 = v74;
    double v82 = v73;
    if (self->_rightImageView)
    {
      double v83 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v83 bounds];
      double v82 = CGRectGetMaxX(v215) - (v183 + v185);

      if ([(VUIDownloadEntity *)self->_downloadEntity downloadType]
        && [(VUIDownloadEntity *)self->_downloadEntity downloadType] != 3)
      {
        double v82 = v82 + (16.0 - v185) * -0.5;
      }
      double v84 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v84 bounds];
      double v81 = CGRectGetMidY(v216) + v168 * -0.5;

      double v79 = v168;
      double v80 = v185;
    }
    double v169 = v79;
    double v85 = self->_downloadButton;
    if (v85)
    {
      [(VUIDownloadButton *)v85 frame];
      double v57 = CGRectGetWidth(v217);
      [(VUIDownloadButton *)self->_downloadButton frame];
      double v72 = CGRectGetHeight(v218);
      double v86 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v86 bounds];
      double v73 = CGRectGetMaxX(v219) - (v183 + v57);
      double v87 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v87 bounds];
      double v74 = CGRectGetMidY(v220) + v72 * -0.5;
    }
    double v200 = v73;
    double v184 = v81;
    double v186 = v82;
    double v196 = v74;
    double v198 = v72;
    bottomSeparatorView = self->_bottomSeparatorView;
    double v89 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v89 bounds];
    -[VUIBaseView sizeThatFits:](bottomSeparatorView, "sizeThatFits:", CGRectGetWidth(v221) - v202, 1.79769313e308);
    double v165 = v90;
    double v92 = v91;

    v222.origin.x = v202;
    v222.origin.y = rect;
    v222.size.double width = v13 * 1.77777778;
    v222.size.double height = v13;
    double v164 = CGRectGetMaxX(v222) + 16.0;
    double v93 = [(VUIDownloadEntityTableViewCell *)self contentView];
    [v93 bounds];
    double recta = v92;
    double v163 = CGRectGetHeight(v223) - v92;

    uint64_t v94 = [(VUIDownloadEntityTableViewCell *)self effectiveUserInterfaceLayoutDirection];
    double v95 = 0.0;
    if (v94 == 1)
    {
      double v96 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v96 bounds];

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v148 = v97;
      double v149 = v98;
      double v160 = v99;
      double v162 = v100;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v152 = v102;
      double v153 = v101;
      double v182 = v103;
      double v151 = v104;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v202 = v105;
      double v181 = v106;
      double v201 = v107;
      double v150 = v108;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v176 = v110;
      double v177 = v109;
      double v193 = v111;
      double v194 = v112;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v170 = v113;
      double v171 = v114;
      double v173 = v115;
      double v175 = v116;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v178 = v117;
      double v180 = v118;
      double v192 = v119;
      double v187 = v120;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v184 = v122;
      double v186 = v121;
      double v80 = v123;
      double v169 = v124;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v198 = v126;
      double v200 = v125;
      double v196 = v127;
      double v129 = v128;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v163 = v131;
      double v164 = v130;
      double v165 = v132;
      double recta = v133;
      double v57 = v129;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v135 = v134;
      double v137 = v136;
      double v138 = v148;
      double v95 = v149;
      double v140 = v139;
      double v142 = v141;
      double v143 = v160;
      double v144 = v162;
      double width = v157;
    }
    else
    {
      double v138 = v202;
      double v152 = v13;
      double v153 = v202;
      double v150 = v13;
      double v151 = v13 * 1.77777778;
      double width = v157;
      double v140 = v188;
      double v142 = v189;
      double v143 = v159;
      double v144 = v161;
      double v137 = v154;
      double v135 = v155;
    }
    -[VUISeparatorView setFrame:](self->_topSeparatorView, "setFrame:", v138, v95, v143, v144);
    -[VUIImageView setFrame:](self->_posterImageView, "setFrame:", v153, v182, v151, v152);
    -[VUILibraryEpisodeFrameView setFrame:](self->_episodeImageView, "setFrame:", v202, v181, v201, v150);
    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v177, v176, v193, v194);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v170, v171, v173, v175);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v178, v180, v192, v187);
    -[VUIVideosImageView setFrame:](self->_rightImageView, "setFrame:", v186, v184, v80, v169);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v200, v196, v57, v198);
    -[VUISeparatorView setFrame:](self->_bottomSeparatorView, "setFrame:", v164, v163, v165, recta);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v135, v137, v140, v142);
    double v39 = v156;
  }
  if (v39 < v13) {
    double v39 = v13;
  }
  double v145 = v39 + 0.0 + v190 * 2.0;

  double v146 = width;
  double v147 = v145;
  result.double height = v147;
  result.double width = v146;
  return result;
}

- (void)_configureViewElementsForAX
{
  double v3 = [(VUIDownloadEntityTableViewCell *)self traitCollection];
  uint64_t v4 = [v3 isAXEnabled];

  id v5 = [(VUIDownloadEntityTableViewCell *)self dotSeparatorLabel];
  [v5 setHidden:v4];
}

- (void)_addMetaDataLabelsIfRequired:(id)a3
{
  id v64 = a3;
  uint64_t v4 = [v64 mediaEntities];
  id v5 = [v4 firstObject];

  if (![v64 downloadType])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v5;
      double v16 = [v15 rentalExpirationDate];
      double v17 = [v15 downloadExpirationDate];
      double v18 = [v15 availabilityEndDate];
      double v19 = [v15 assetController];

      double v20 = [v19 state];
      double v10 = +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v16, v17, v18, [v20 status]);

      if (v10) {
        goto LABEL_11;
      }
    }
    double v11 = [v64 duration];
    if (v11)
    {
      double v21 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
      double v22 = [v21 transformedValue:v11];

      double v23 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v23 setTextStyle:21];
      [(VUITextLayout *)v23 setFontWeight:0];
      [(VUITextLayout *)v23 setNumberOfLines:1];
      double v24 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      [(VUITextLayout *)v23 setColor:v24];

      double v25 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];
      double v10 = +[VUILabel labelWithString:v22 textLayout:v23 existingLabel:v25];
    }
    else
    {
      double v10 = 0;
    }
    [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v10];
    double v35 = [v64 releaseYear];
    double v14 = [v35 stringValue];

    if (v14)
    {
      double v36 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v36 setTextStyle:21];
      [(VUITextLayout *)v36 setFontWeight:0];
      [(VUITextLayout *)v36 setNumberOfLines:1];
      double v37 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      [(VUITextLayout *)v36 setColor:v37];

      double v38 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];
      double v39 = +[VUILabel labelWithString:v14 textLayout:v36 existingLabel:v38];

      [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:v39];
      if (v11)
      {
        double v40 = objc_alloc_init(VUITextLayout);
        [(VUITextLayout *)v40 setTextStyle:22];
        double v41 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        [(VUITextLayout *)v40 setColor:v41];

        [(VUITextLayout *)v40 setNumberOfLines:1];
        v42 = [(VUIDownloadEntityTableViewCell *)self dotSeparatorLabel];
        v43 = +[VUILabel labelWithString:@"·" textLayout:v40 existingLabel:v42];

LABEL_20:
        [(VUIDownloadEntityTableViewCell *)self setDotSeparatorLabel:v43];

        goto LABEL_21;
      }
    }
    else
    {
      [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:0];
      double v39 = 0;
    }
    v43 = 0;
    goto LABEL_20;
  }
  if ([v64 downloadType] == 1)
  {
    CGRect v6 = NSString;
    uint64_t v7 = +[VUILocalizationManager sharedInstance];
    double v8 = [v7 localizedStringForKey:@"NUMBER_OF_EPISODES"];
    double v9 = [v64 numberOfMediaItems];
    double v10 = objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%d", 0, objc_msgSend(v9, "intValue"));

    double v11 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v11 setTextStyle:21];
    [(VUITextLayout *)v11 setFontWeight:0];
    [(VUITextLayout *)v11 setNumberOfLines:0];
    double v12 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    [(VUITextLayout *)v11 setColor:v12];

    double v13 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];
    double v14 = +[VUILabel labelWithString:v10 textLayout:v11 existingLabel:v13];

    [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v14];
LABEL_21:

    goto LABEL_22;
  }
  if ([v64 downloadType] != 3) {
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v26 = v5;
  double v27 = [v26 rentalExpirationDate];
  double v28 = [v26 downloadExpirationDate];
  double v29 = [v26 availabilityEndDate];
  double v30 = [v26 assetController];

  double v31 = [v30 state];
  double v10 = +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v27, v28, v29, [v31 status]);

  if (!v10)
  {
LABEL_12:
    double v32 = +[VUILocalizationManager sharedInstance];
    double v10 = [v32 localizedStringForKey:@"EPISODE_NUMBER"];

    double v33 = [v64 fractionalEpisodeNumber];

    if (v33)
    {
      uint64_t v34 = [v64 fractionalEpisodeNumber];
    }
    else
    {
      double v44 = [v64 episodeNumber];

      if (!v44)
      {
        double v45 = 0;
        goto LABEL_29;
      }
      uint64_t v34 = [v64 episodeNumber];
    }
    double v45 = (void *)v34;
LABEL_29:
    v46 = [NSString stringWithValidatedFormat:v10, @"%@", 0, v45 validFormatSpecifiers error];
    if (v45)
    {
      double v47 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v47 setTextStyle:21];
      [(VUITextLayout *)v47 setFontWeight:0];
      [(VUITextLayout *)v47 setNumberOfLines:0];
      CGFloat v48 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      [(VUITextLayout *)v47 setColor:v48];

      double v49 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderFirstLabel];
      double v50 = +[VUILabel labelWithString:v46 textLayout:v47 existingLabel:v49];
    }
    else
    {
      double v50 = 0;
    }
    [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v50];
    CGFloat v51 = [v64 duration];
    if (v51)
    {
      double v62 = v45;
      double v52 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
      [v52 transformedValue:v51];
      double v53 = v63 = v46;

      double v54 = objc_alloc_init(VUITextLayout);
      [(VUITextLayout *)v54 setTextStyle:21];
      [(VUITextLayout *)v54 setFontWeight:0];
      [(VUITextLayout *)v54 setNumberOfLines:1];
      CGFloat v55 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      [(VUITextLayout *)v54 setColor:v55];

      double v56 = [(VUIDownloadEntityTableViewCell *)self metaDataHeaderSecondLabel];
      double v57 = +[VUILabel labelWithString:v53 textLayout:v54 existingLabel:v56];

      v46 = v63;
      [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:v57];
      if (v63)
      {
        double v58 = objc_alloc_init(VUITextLayout);
        [(VUITextLayout *)v58 setTextStyle:22];
        double v59 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        [(VUITextLayout *)v58 setColor:v59];

        [(VUITextLayout *)v58 setNumberOfLines:1];
        double v60 = [(VUIDownloadEntityTableViewCell *)self dotSeparatorLabel];
        double v61 = +[VUILabel labelWithString:@"·" textLayout:v58 existingLabel:v60];

        v46 = v63;
      }
      else
      {
        double v61 = 0;
      }
      double v45 = v62;
    }
    else
    {
      [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:0];
      double v57 = 0;
      double v61 = 0;
    }
    [(VUIDownloadEntityTableViewCell *)self setDotSeparatorLabel:v61];

    goto LABEL_22;
  }
LABEL_11:
  [v10 setDelegate:self];
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderFirstLabel:v10];
  [(VUIDownloadEntityTableViewCell *)self setMetaDataHeaderSecondLabel:0];
  [(VUIDownloadEntityTableViewCell *)self setDotSeparatorLabel:0];
LABEL_22:

LABEL_23:
}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetController];

  if (v5)
  {
    uint64_t v6 = [(VUIDownloadEntityTableViewCell *)self downloadButton];
    if (v6)
    {
      uint64_t v7 = (VUIDownloadButton *)v6;
      double v8 = [v4 assetController];
      [(VUIDownloadButton *)v7 updateWithAssetController:v8];
    }
    else
    {
      uint64_t v7 = [[VUIDownloadButton alloc] initWithMediaEntity:v4 type:8];
      [(VUIDownloadButton *)v7 setUsesDefaultConfiguration:1];
      objc_initWeak(&location, self);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      double v12 = __63__VUIDownloadEntityTableViewCell__addDownloadButtonIfRequired___block_invoke;
      double v13 = &unk_1E6DF5888;
      objc_copyWeak(&v14, &location);
      [(VUIDownloadButton *)v7 setDownloadStateChangeHandler:&v10];
      double v9 = [(VUIDownloadEntityTableViewCell *)self contentView];
      [v9 addSubview:v7];

      [(VUIDownloadEntityTableViewCell *)self setDownloadButton:v7];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __63__VUIDownloadEntityTableViewCell__addDownloadButtonIfRequired___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (a2 || !(a3 | a4))
  {
    if ([WeakRetained previousDownloadState] != a2)
    {
      [v10 setMetaDataHeaderFirstLabel:0];
      double v9 = [v10 downloadEntity];
      [v10 _addMetaDataLabelsIfRequired:v9];

      [v10 setPreviousDownloadState:a2];
    }
  }
  else
  {
    double v8 = [WeakRetained delegate];
    [v8 downloadCellDidRequestCancelDownload:v10];
  }
}

- (void)_removeDownloadButtonIfRequired
{
  double v3 = [(VUIDownloadEntityTableViewCell *)self downloadButton];
  if (v3)
  {
    id v4 = v3;
    [v3 removeFromSuperview];
    [(VUIDownloadEntityTableViewCell *)self setDownloadButton:0];
    [(VUIDownloadEntityTableViewCell *)self setPreviousDownloadState:0];
    double v3 = v4;
  }
}

- (id)_episodePlaceholderImage
{
  id v2 = [(VUIDownloadEntityTableViewCell *)self contentView];
  double v3 = [v2 traitCollection];
  id v4 = +[VUIUtilities placeholderImageResourceName:](VUIUtilities, "placeholderImageResourceName:", [v3 userInterfaceStyle]);
  id v5 = +[VUIImageResourceMap imageForResourceName:v4];

  return v5;
}

- (double)_imageHeightForCurrentSizeClass
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClass");
  double result = 54.0;
  if ((unint64_t)(v2 - 3) < 3) {
    return 72.0;
  }
  return result;
}

- (double)_verticalPaddingForCurrentSizeClass
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClass");
  double result = 8.0;
  if ((unint64_t)(v2 - 3) < 3) {
    return 12.0;
  }
  return result;
}

+ (id)_generateMetaDataHeaderFirstLabelForDownloadEntity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 numberOfMediaItemsDownloading];
  int v5 = [v4 intValue];

  uint64_t v6 = NSString;
  uint64_t v7 = +[VUILocalizationManager sharedInstance];
  double v8 = v7;
  if (v5 < 1)
  {
    double v13 = [v7 localizedStringForKey:@"NUMBER_OF_EPISODES"];
    id v14 = [v3 numberOfMediaItems];

    uint64_t v11 = objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, @"%d", 0, objc_msgSend(v14, "intValue"));

    double v12 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v12 setTextStyle:21];
    [(VUITextLayout *)v12 setFontWeight:0];
    [(VUITextLayout *)v12 setNumberOfLines:0];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  }
  else
  {
    double v9 = [v7 localizedStringForKey:@"DOWNLOADING_NUMBER_OF_EPISODES"];
    id v10 = [v3 numberOfMediaItemsDownloading];

    uint64_t v11 = objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d", 0, objc_msgSend(v10, "intValue"));

    double v12 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v12 setTextStyle:21];
    [(VUITextLayout *)v12 setFontWeight:0];
    [(VUITextLayout *)v12 setNumberOfLines:0];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  id v15 = };
  [(VUITextLayout *)v12 setColor:v15];

  double v16 = +[VUILabel labelWithString:v11 textLayout:v12 existingLabel:0];

  return v16;
}

- (VUIDownloadEntityTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIDownloadEntityTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
}

- (void)setDownloadButton:(id)a3
{
}

- (VUISeparatorView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (VUISeparatorView)bottomSeparatorView
{
  return self->_bottomSeparatorView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUIImageView)posterImageView
{
  return self->_posterImageView;
}

- (VUILabel)metaDataHeaderFirstLabel
{
  return self->_metaDataHeaderFirstLabel;
}

- (VUILabel)metaDataHeaderSecondLabel
{
  return self->_metaDataHeaderSecondLabel;
}

- (VUILabel)dotSeparatorLabel
{
  return self->_dotSeparatorLabel;
}

- (VUIVideosImageView)rightImageView
{
  return self->_rightImageView;
}

- (VUILibraryEpisodeFrameView)episodeImageView
{
  return self->_episodeImageView;
}

- (VUIDownloadEntity)downloadEntity
{
  return self->_downloadEntity;
}

- (unint64_t)previousDownloadState
{
  return self->_previousDownloadState;
}

- (void)setPreviousDownloadState:(unint64_t)a3
{
  self->_previousDownloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadEntity, 0);
  objc_storeStrong((id *)&self->_episodeImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, 0);
  objc_storeStrong((id *)&self->_posterImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorView, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end