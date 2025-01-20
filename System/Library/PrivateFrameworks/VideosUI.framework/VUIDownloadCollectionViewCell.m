@interface VUIDownloadCollectionViewCell
+ (id)_generateMetaDataHeaderFirstLabelForDownloadEntity:(id)a3;
+ (void)_movieConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4;
+ (void)_showConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4;
+ (void)configureVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4 width:(double)a5 forMetrics:(BOOL)a6;
- (BOOL)_hasSecondaryLabel;
- (BOOL)editing;
- (CGSize)_layoutForAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)editImageView;
- (VUIDownloadButton)downloadButton;
- (VUIDownloadCollectionViewCellDelegate)delegate;
- (VUIDownloadEntity)downloadEntity;
- (VUILabel)dotSeparatorLabel;
- (VUILabel)metaDataHeaderFirstLabel;
- (VUILabel)metaDataHeaderSecondLabel;
- (unint64_t)previousDownloadState;
- (void)_addDownloadButtonIfRequired:(id)a3;
- (void)_addMetaDataLabelsIfRequired:(id)a3;
- (void)_configureViewElementsForAX;
- (void)_updateViewForEditState;
- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4;
- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setDotSeparatorLabel:(id)a3;
- (void)setDownloadButton:(id)a3;
- (void)setDownloadEntity:(id)a3;
- (void)setEditImageView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setMetaDataHeaderFirstLabel:(id)a3;
- (void)setMetaDataHeaderSecondLabel:(id)a3;
- (void)setPreviousDownloadState:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VUIDownloadCollectionViewCell

+ (void)configureVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4 width:(double)a5 forMetrics:(BOOL)a6
{
  id v20 = a3;
  id v9 = a4;
  [v20 setDownloadEntity:v9];
  v10 = [v9 mediaEntities];
  v11 = [v10 firstObject];

  [v20 setImageAspectRatio:0.5625];
  if (!a6)
  {
    +[VUILibraryLockupViewCell configureImageViewArtworkForLockupCell:v20 withMedia:v11 width:a5];
    [v9 setDelegate:v20];
  }
  v12 = [v9 title];

  if (v12)
  {
    v13 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v13 setTextStyle:14];
    [(VUITextLayout *)v13 setFontWeight:0];
    v14 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
    [(VUITextLayout *)v13 setColor:v14];

    [(VUITextLayout *)v13 setNumberOfLines:2];
    uint64_t v15 = [v9 title];
    v16 = (void *)v15;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    else {
      v17 = &stru_1F3E921E0;
    }
    v18 = [v20 titleLabel];
    v19 = +[VUILabel labelWithString:v17 textLayout:v13 existingLabel:v18];
  }
  else
  {
    v19 = 0;
  }
  [v20 setTitleLabel:v19];
  if ([v9 downloadType])
  {
    if ([v9 downloadType] == 1 || objc_msgSend(v9, "downloadType") == 2) {
      +[VUIDownloadCollectionViewCell _showConfigurationForVUIDownloadEntityCollectionViewCell:v20 withDownloadEntity:v9];
    }
  }
  else
  {
    +[VUIDownloadCollectionViewCell _movieConfigurationForVUIDownloadEntityCollectionViewCell:v20 withDownloadEntity:v9];
  }
}

+ (void)_movieConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 _addMetaDataLabelsIfRequired:v5];
  v7 = [v5 mediaEntities];

  id v8 = [v7 firstObject];

  [v6 _addDownloadButtonIfRequired:v8];
}

+ (void)_showConfigurationForVUIDownloadEntityCollectionViewCell:(id)a3 withDownloadEntity:(id)a4
{
  id v5 = a3;
  id v6 = +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:a4];
  [v5 setMetaDataHeaderFirstLabel:v6];
}

+ (id)_generateMetaDataHeaderFirstLabelForDownloadEntity:(id)a3
{
  id v3 = a3;
  v4 = [v3 numberOfMediaItemsDownloading];
  int v5 = [v4 intValue];

  id v6 = NSString;
  v7 = +[VUILocalizationManager sharedInstance];
  id v8 = v7;
  if (v5 < 1)
  {
    v13 = [v7 localizedStringForKey:@"NUMBER_OF_EPISODES"];
    v14 = [v3 numberOfMediaItems];

    v11 = objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v13, @"%d", 0, objc_msgSend(v14, "intValue"));

    v12 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v12 setTextStyle:16];
    [(VUITextLayout *)v12 setFontWeight:10];
    [(VUITextLayout *)v12 setNumberOfLines:0];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  }
  else
  {
    id v9 = [v7 localizedStringForKey:@"DOWNLOADING_NUMBER_OF_EPISODES"];
    v10 = [v3 numberOfMediaItemsDownloading];

    v11 = objc_msgSend(v6, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d", 0, objc_msgSend(v10, "intValue"));

    v12 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v12 setTextStyle:16];
    [(VUITextLayout *)v12 setFontWeight:10];
    [(VUITextLayout *)v12 setNumberOfLines:0];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  uint64_t v15 = };
  [(VUITextLayout *)v12 setColor:v15];

  v16 = +[VUILabel labelWithString:v11 textLayout:v12 existingLabel:0];

  return v16;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  [(VUIDownloadCollectionViewCell *)self _updateViewForEditState];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  [(VUIDownloadCollectionViewCell *)&v4 setSelected:a3];
  if (self->_editing) {
    [(VUIDownloadCollectionViewCell *)self _updateViewForEditState];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VUIDownloadCollectionViewCell;
  [(VUIDownloadCollectionViewCell *)&v5 setSelected:a3 animated:a4];
  if (self->_editing) {
    [(VUIDownloadCollectionViewCell *)self _updateViewForEditState];
  }
}

- (void)setMetaDataHeaderFirstLabel:(id)a3
{
  objc_super v5 = (VUILabel *)a3;
  p_metaDataHeaderFirstLabel = &self->_metaDataHeaderFirstLabel;
  metaDataHeaderFirstLabel = self->_metaDataHeaderFirstLabel;
  if (metaDataHeaderFirstLabel != v5)
  {
    id v9 = v5;
    [(VUILabel *)metaDataHeaderFirstLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, a3);
    if (*p_metaDataHeaderFirstLabel)
    {
      id v8 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v8 addSubview:*p_metaDataHeaderFirstLabel];
    }
    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
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
    id v9 = v5;
    [(VUILabel *)metaDataHeaderSecondLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, a3);
    if (*p_metaDataHeaderSecondLabel)
    {
      id v8 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v8 addSubview:*p_metaDataHeaderSecondLabel];
    }
    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
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
    id v9 = v5;
    [(VUILabel *)dotSeparatorLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_dotSeparatorLabel, a3);
    if (*p_dotSeparatorLabel)
    {
      id v8 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v8 addSubview:*p_dotSeparatorLabel];
    }
    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setEditImageView:(id)a3
{
  objc_super v5 = (UIImageView *)a3;
  p_editImageView = &self->_editImageView;
  editImageView = self->_editImageView;
  if (editImageView != v5)
  {
    id v9 = v5;
    [(UIImageView *)editImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_editImageView, a3);
    if (*p_editImageView)
    {
      id v8 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v8 addSubview:*p_editImageView];
    }
    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
    objc_super v5 = v9;
  }
}

- (void)setDownloadButton:(id)a3
{
  objc_super v5 = (VUIDownloadButton *)a3;
  downloadButton = self->_downloadButton;
  if (downloadButton != v5)
  {
    id v8 = v5;
    if (downloadButton) {
      [(VUIDownloadButton *)downloadButton removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_downloadButton, a3);
    if (v8)
    {
      v7 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v7 addSubview:v8];
    }
    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
    objc_super v5 = v8;
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  [(VUILibraryLockupViewCell *)&v4 prepareForReuse];
  id v3 = [(VUIDownloadCollectionViewCell *)self downloadEntity];
  [v3 setDelegate:0];

  [(VUIDownloadCollectionViewCell *)self setDownloadEntity:0];
  [(VUIDownloadCollectionViewCell *)self setEditImageView:0];
  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderFirstLabel:0];
  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderSecondLabel:0];
  [(VUIDownloadCollectionViewCell *)self setDotSeparatorLabel:0];
  [(VUILibraryLockupViewCell *)self setTitleLabel:0];
  [(VUIDownloadCollectionViewCell *)self setDownloadButton:0];
  [(VUIDownloadCollectionViewCell *)self setPreviousDownloadState:0];
  [(VUIDownloadCollectionViewCell *)self setEditing:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIDownloadCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadCollectionViewCell;
  [(VUILibraryLockupViewCell *)&v4 layoutSubviews];
  [(VUIDownloadCollectionViewCell *)self bounds];
  double Width = CGRectGetWidth(v5);
  [(VUIDownloadCollectionViewCell *)self bounds];
  -[VUIDownloadCollectionViewCell _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, Width, CGRectGetHeight(v6));
}

- (void)downloadEntity:(id)a3 numberOfItemsDownloadingDidChange:(id)a4
{
  +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadCollectionViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderFirstLabel:v5];
  [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
}

- (void)downloadEntity:(id)a3 numberOfItemsDidChange:(unint64_t)a4
{
  +[VUIDownloadCollectionViewCell _generateMetaDataHeaderFirstLabelForDownloadEntity:](VUIDownloadCollectionViewCell, "_generateMetaDataHeaderFirstLabelForDownloadEntity:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderFirstLabel:v5];
  [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  [(VUIDownloadCollectionViewCell *)self _configureViewElementsForAX];
  id v8 = [(VUIDownloadCollectionViewCell *)self traitCollection];
  int v9 = [v8 isAXEnabled];

  if (v9)
  {
    -[VUIDownloadCollectionViewCell _layoutForAccessibility:metricsOnly:](self, "_layoutForAccessibility:metricsOnly:", v4, width, height);
  }
  else
  {
    -[VUIDownloadCollectionViewCell _layoutForCompact:metricsOnly:](self, "_layoutForCompact:metricsOnly:", v4, width, height);
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)_layoutForCompact:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = [(VUIDownloadCollectionViewCell *)self downloadButton];

  if (v8)
  {
    [(VUIDownloadButton *)self->_downloadButton sizeToFit];
    int v9 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    [v9 frame];
    double v10 = CGRectGetWidth(v167);

    double v11 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    [v11 frame];
    double v140 = CGRectGetHeight(v168);

    double v12 = v10;
  }
  else
  {
    v13 = [(VUIDownloadCollectionViewCell *)self editImageView];

    double v140 = 0.0;
    if (v13) {
      double v10 = 22.0;
    }
    else {
      double v10 = 0.0;
    }
    double v12 = 0.0;
  }
  v14 = [(VUILibraryLockupViewCell *)self titleLabel];
  objc_msgSend(v14, "sizeThatFits:", width - v10, height);
  double v163 = v15;
  double v17 = v16;

  v18 = [(VUILibraryLockupViewCell *)self titleLabel];
  [v18 topMarginWithBaselineMargin:24.0];
  double v20 = v19;

  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", width, height);
  double v157 = v21;
  double rect = v22;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", width, height);
  double v159 = v23;
  double v145 = v24;
  -[VUILabel sizeThatFits:](self->_dotSeparatorLabel, "sizeThatFits:", width, height);
  double v149 = v25;
  double v138 = v26;
  [(VUILabel *)self->_metaDataHeaderFirstLabel topMarginWithBaselineMargin:20.0];
  double v28 = v27;
  [(VUILabel *)self->_metaDataHeaderSecondLabel topMarginWithBaselineMargin:20.0];
  double v30 = v29;
  v31 = [(VUILibraryLockupViewCell *)self titleLabel];

  if (v31)
  {
    v32 = [(VUILibraryLockupViewCell *)self titleLabel];
    v33 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];
    [v32 topMarginToLabel:v33 withBaselineMargin:20.0];
    double v154 = v34;

    v35 = [(VUILibraryLockupViewCell *)self titleLabel];
    v36 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];
    [v35 topMarginToLabel:v36 withBaselineMargin:20.0];
    double v161 = v37;
  }
  else
  {
    double v154 = v28;
    double v161 = v30;
  }
  double v38 = v12 + v157 + v159;
  uint64_t v39 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];

    double v42 = v149 + 12.0;
    if (!v41) {
      double v42 = -0.0;
    }
    double v38 = v38 + v42;
  }
  double v43 = ceil(width * 0.5625);
  v44 = [(VUIDownloadCollectionViewCell *)self dotSeparatorLabel];
  [v44 setHidden:v38 > width];

  BOOL v45 = [(VUIDownloadCollectionViewCell *)self _hasSecondaryLabel];
  double v46 = v43;
  if (v45)
  {
    double v47 = rect + v154;
    if (rect + v154 < v145 + v161) {
      double v47 = v145 + v161;
    }
    if (v38 > width) {
      double v47 = v145 + v161 + rect + v154;
    }
    double v46 = v43 + v47;
  }
  double v151 = v46;
  v48 = [(VUILibraryLockupViewCell *)self titleLabel];

  if (!a4)
  {
    double v128 = v12;
    double v130 = v38;
    double v132 = v20;
    CGFloat v133 = v17;
    double v49 = *MEMORY[0x1E4F1DB28];
    double v50 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v164 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v165 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v169.origin.x = 0.0;
    v169.origin.double y = 0.0;
    v169.size.double width = width;
    v169.size.double height = v43;
    double MaxY = CGRectGetMaxY(v169);
    v52 = [(VUILibraryLockupViewCell *)self titleLabel];

    if (v52)
    {
      v170.origin.double y = v20 + MaxY;
      v170.origin.x = 0.0;
      double v144 = v20 + MaxY;
      v170.size.double width = v163;
      v170.size.double height = v133;
      double v126 = CGRectGetMaxY(v170);
      double v143 = v133;
      double v142 = 0.0;
    }
    else
    {
      double v126 = MaxY;
      double v143 = v165;
      double v163 = v50;
      double v144 = v164;
      double v142 = v49;
    }
    BOOL v53 = [(VUIDownloadCollectionViewCell *)self _hasSecondaryLabel];
    double v54 = v165;
    double v55 = v50;
    double v56 = v164;
    double v57 = v49;
    double v58 = v165;
    double v59 = v50;
    double v60 = v164;
    double y = v164;
    double v148 = v49;
    double v61 = v165;
    double v62 = v50;
    double v63 = v49;
    if (v53)
    {
      v64 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];

      if (v64)
      {
        v171.origin.double y = v154 + v126;
        v171.origin.x = 0.0;
        CGFloat v155 = 0.0;
        double y = v171.origin.y;
        v171.size.double width = v157;
        v171.size.double height = rect;
        double MaxX = CGRectGetMaxX(v171);
      }
      else
      {
        double MaxX = 0.0;
        double rect = v165;
        double v157 = v50;
        double y = v164;
        CGFloat v155 = v49;
      }
      double v66 = v130;
      uint64_t v67 = [(VUIDownloadCollectionViewCell *)self dotSeparatorLabel];
      if (v67
        && (v68 = (void *)v67,
            [(VUIDownloadCollectionViewCell *)self dotSeparatorLabel],
            v69 = objc_claimAutoreleasedReturnValue(),
            char v70 = [v69 isHidden],
            v69,
            v68,
            (v70 & 1) == 0))
      {
        double v57 = MaxX + 6.0;
        v172.origin.x = v155;
        v172.size.double width = v157;
        v172.origin.double y = y;
        v172.size.double height = rect;
        v173.origin.double y = CGRectGetMidY(v172) + v138 * -0.5;
        v173.origin.x = v57;
        CGFloat v136 = v173.origin.y;
        v173.size.double width = v149;
        v173.size.double height = v138;
        double v148 = CGRectGetMaxX(v173) + 6.0;
        double v134 = v138;
        double v66 = v130;
      }
      else
      {
        double v148 = MaxX;
        double v134 = v165;
        double v149 = v50;
        CGFloat v136 = v164;
        double v57 = v49;
      }
      v71 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];

      if (v71)
      {
        if (v66 <= width)
        {
          double v61 = rect;
          double v63 = v155;
          double v62 = v157;
          double v54 = v134;
          double v56 = v136;
          double v55 = v149;
          double v74 = v126;
        }
        else
        {
          v72 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];

          if (v72)
          {
            double v61 = rect;
            double v63 = v155;
            v174.origin.x = v155;
            v174.origin.double y = y;
            v174.size.double width = v157;
            v174.size.double height = rect;
            CGFloat v73 = CGRectGetMaxY(v174);
            double v62 = v157;
            double v74 = v73;
            double v148 = 0.0;
          }
          else
          {
            double v74 = v161 + v126;
            double v148 = 0.0;
            double v61 = rect;
            double v63 = v155;
            double v62 = v157;
          }
          double v54 = v134;
          double v56 = v136;
          double v55 = v149;
        }
        double v59 = v159;
        double v60 = v161 + v74;
        double v58 = v145;
      }
      else
      {
        double v60 = v164;
        double v58 = v165;
        double v59 = v50;
        double v148 = v49;
        double v61 = rect;
        double v63 = v155;
        double v62 = v157;
        double v54 = v134;
        double v56 = v136;
        double v55 = v149;
      }
    }
    double v146 = v59;
    double v160 = v60;
    double v162 = v58;
    double v150 = v55;
    double v135 = v54;
    double v137 = v56;
    double v156 = v63;
    double v158 = v62;
    double recta = v61;
    v75 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    double v76 = v164;
    double v77 = v165;
    double v78 = v50;
    double v79 = v49;
    if (v75)
    {
      BOOL editing = self->_editing;

      double v79 = width - v128;
      double v76 = v43 + ceil((height - v43) * 0.5) - v140 * 0.5;
      double v77 = editing ? v165 : v140;
      double v78 = editing ? v50 : v128;
      if (editing)
      {
        double v76 = v164;
        double v79 = v49;
      }
    }
    double v139 = v79;
    double v141 = v76;
    v81 = [(VUIDownloadCollectionViewCell *)self editImageView];
    if (v81)
    {
      BOOL v82 = self->_editing;

      double v83 = v43 + ceil((height - v43) * 0.5) + -11.0;
      double v84 = v165;
      if (v82)
      {
        double v84 = 22.0;
        double v50 = 22.0;
      }
      double v85 = v164;
      if (v82) {
        double v85 = v83;
      }
      double v164 = v85;
      double v165 = v84;
      if (v82) {
        double v49 = width + -22.0;
      }
    }
    double v86 = 0.0;
    if ([(VUIDownloadCollectionViewCell *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      v87 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v87 bounds];

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v129 = v88;
      double v131 = v89;
      double v91 = v90;
      double v124 = v92;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v142 = v93;
      double v144 = v94;
      double v163 = v95;
      double v143 = v96;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v156 = v97;
      double v158 = v98;
      double y = v99;
      double recta = v100;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v148 = v101;
      double v160 = v102;
      double v146 = v103;
      double v162 = v104;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v139 = v105;
      double v141 = v106;
      double v125 = v108;
      double v127 = v107;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v110 = v109;
      double v150 = v111;
      double v113 = v112;
      double v86 = v91;
      double v57 = v114;
      double v43 = v124;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v49 = v115;
      double v164 = v116;
      double v165 = v117;
      double v50 = v118;
    }
    else
    {
      double v129 = 0.0;
      double v131 = width;
      double v125 = v77;
      double v127 = v78;
      double v113 = v135;
      double v110 = v137;
    }
    v119 = [(VUILibraryLockupViewCell *)self imageView];
    objc_msgSend(v119, "setFrame:", v129, v86, v131, v43);

    v120 = [(VUILibraryLockupViewCell *)self titleLabel];
    objc_msgSend(v120, "setFrame:", v142, v144, v163, v143);

    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v156, y, v158, recta);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v148, v160, v146, v162);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v139, v141, v127, v125);
    -[VUILabel setFrame:](self->_dotSeparatorLabel, "setFrame:", v57, v110, v150, v113);
    -[UIImageView setFrame:](self->_editImageView, "setFrame:", v49, v164, v50, v165);
    double v20 = v132;
    double v17 = v133;
  }
  double v121 = v17 + v20;
  if (!v48) {
    double v121 = -0.0;
  }
  double v122 = v151 + v121;
  double v123 = width;
  result.double height = v122;
  result.double width = v123;
  return result;
}

- (CGSize)_layoutForAccessibility:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = [(VUILibraryLockupViewCell *)self titleLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  CGFloat v114 = v9;
  double v11 = v10;

  double v12 = [(VUILibraryLockupViewCell *)self titleLabel];
  [v12 topMarginWithBaselineMargin:24.0];
  double v14 = v13;

  -[VUILabel sizeThatFits:](self->_metaDataHeaderFirstLabel, "sizeThatFits:", width, height);
  double v116 = v15;
  double v17 = v16;
  -[VUILabel sizeThatFits:](self->_metaDataHeaderSecondLabel, "sizeThatFits:", width, height);
  double v117 = v18;
  double v20 = v19;
  [(VUILabel *)self->_metaDataHeaderFirstLabel topMarginWithBaselineMargin:20.0];
  double v22 = v21;
  [(VUILabel *)self->_metaDataHeaderSecondLabel topMarginWithBaselineMargin:20.0];
  double v24 = v23;
  double v25 = [(VUIDownloadCollectionViewCell *)self downloadButton];

  if (v25) {
    [(VUIDownloadButton *)self->_downloadButton sizeToFit];
  }
  double v26 = ceil(width * 0.5625);
  if (!a4)
  {
    double v92 = v22;
    double v93 = v24;
    CGFloat v94 = v17;
    CGFloat v95 = v20;
    double v96 = v14;
    double v27 = *MEMORY[0x1E4F1DB28];
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v119.origin.x = 0.0;
    v119.origin.double y = 0.0;
    v119.size.double width = width;
    v119.size.double height = v26;
    double MaxY = CGRectGetMaxY(v119);
    v32 = [(VUILibraryLockupViewCell *)self titleLabel];

    double v112 = v26;
    double v105 = v27;
    if (v32)
    {
      double v33 = v96 + MaxY;
      v120.origin.x = 0.0;
      v120.origin.double y = v96 + MaxY;
      CGFloat v34 = v114;
      v120.size.double width = v114;
      v120.size.double height = v11;
      double MaxY = CGRectGetMaxY(v120);
      double v104 = v11;
      double v35 = 0.0;
    }
    else
    {
      double v104 = v29;
      CGFloat v34 = v30;
      double v35 = v27;
      double v33 = v28;
    }
    double v103 = v35;
    v36 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];

    double v111 = v33;
    if (v36)
    {
      v121.origin.double y = v92 + MaxY;
      v121.origin.x = 0.0;
      double v101 = 0.0;
      double v102 = v92 + MaxY;
      v121.size.double width = v116;
      v121.size.double height = v94;
      double MaxY = CGRectGetMaxY(v121);
      double v100 = v94;
    }
    else
    {
      double v100 = v29;
      double v116 = v30;
      double v101 = v105;
      double v102 = v28;
    }
    double v37 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];

    if (v37)
    {
      v122.origin.double y = v93 + MaxY;
      v122.origin.x = 0.0;
      double v98 = 0.0;
      double v99 = v93 + MaxY;
      v122.size.double width = v117;
      v122.size.double height = v95;
      double MaxY = CGRectGetMaxY(v122);
      double v97 = v95;
    }
    else
    {
      double v97 = v29;
      double v117 = v30;
      double v98 = v105;
      double v99 = v28;
    }
    double v91 = v11;
    double v38 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    double v39 = v29;
    double v113 = v30;
    double v40 = v28;
    double v41 = v105;
    if (v38)
    {
      BOOL editing = self->_editing;

      double v39 = v29;
      double v113 = v30;
      double v40 = v28;
      double v41 = v105;
      if (!editing)
      {
        [(VUIDownloadButton *)self->_downloadButton frame];
        double v113 = CGRectGetWidth(v123);
        [(VUIDownloadButton *)self->_downloadButton frame];
        double v39 = CGRectGetHeight(v124);
        double v41 = 0.0;
        double v40 = MaxY;
      }
    }
    double v109 = v40;
    double v110 = v41;
    double v90 = v39;
    double v43 = [(VUIDownloadCollectionViewCell *)self editImageView];

    double v44 = 0.0;
    if (v43)
    {
      double v29 = 22.0;
      double v45 = 22.0;
    }
    else
    {
      double v45 = v30;
    }
    if (v43) {
      double v46 = MaxY;
    }
    else {
      double v46 = v28;
    }
    double v107 = v46;
    double v108 = v45;
    if (v43) {
      double v47 = 0.0;
    }
    else {
      double v47 = v105;
    }
    double v106 = v47;
    if ([(VUIDownloadCollectionViewCell *)self effectiveUserInterfaceLayoutDirection] == 1)
    {
      v48 = [(VUIDownloadCollectionViewCell *)self contentView];
      [v48 bounds];

      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v87 = v49;
      double v88 = v50;
      double v44 = v51;
      double v89 = v52;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v103 = v53;
      double v111 = v54;
      double v115 = v55;
      double v104 = v56;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v101 = v57;
      double v102 = v58;
      double v116 = v59;
      double v100 = v60;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v98 = v61;
      double v99 = v62;
      double v117 = v63;
      double v97 = v64;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v109 = v66;
      double v110 = v65;
      double v113 = v67;
      double v69 = v68;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v106 = v70;
      double v107 = v71;
      double v108 = v72;
      double v20 = v95;
      double v14 = v96;
      double v24 = v93;
      double v17 = v94;
      double v22 = v92;
      [(VUILibraryLockupViewCell *)self imageView];
    }
    else
    {
      double v88 = width;
      double v89 = v112;
      double v86 = v29;
      double v87 = 0.0;
      double v20 = v95;
      double v14 = v96;
      double v24 = v93;
      double v17 = v94;
      double v22 = v92;
      double v115 = v34;
      double v69 = v90;
      [(VUILibraryLockupViewCell *)self imageView];
    double v74 = };
    objc_msgSend(v74, "setFrame:", v87, v44, v88, v89);

    v75 = [(VUILibraryLockupViewCell *)self titleLabel];
    objc_msgSend(v75, "setFrame:", v103, v111, v115, v104);

    -[VUILabel setFrame:](self->_metaDataHeaderFirstLabel, "setFrame:", v101, v102, v116, v100);
    -[VUILabel setFrame:](self->_metaDataHeaderSecondLabel, "setFrame:", v98, v99, v117, v97);
    -[VUIDownloadButton setFrame:](self->_downloadButton, "setFrame:", v110, v109, v113, v69);
    -[UIImageView setFrame:](self->_editImageView, "setFrame:", v106, v107, v108, v85);
    double v11 = v91;
    double v26 = v112;
  }
  double v76 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];

  if (v76) {
    double v77 = v17 + v26 + v22;
  }
  else {
    double v77 = v26;
  }
  double v78 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];

  if (v78) {
    double v77 = v20 + v24 + v77;
  }
  double v79 = [(VUILibraryLockupViewCell *)self titleLabel];

  if (v79) {
    double v77 = v11 + v14 + v77;
  }
  v80 = [(VUIDownloadCollectionViewCell *)self downloadButton];
  if (v80)
  {
    BOOL v81 = self->_editing;

    if (!v81)
    {
      BOOL v82 = [(VUIDownloadCollectionViewCell *)self downloadButton];
      [v82 frame];
      double v77 = v77 + CGRectGetHeight(v125);
    }
  }
  double v83 = width;
  double v84 = v77;
  result.double height = v84;
  result.double width = v83;
  return result;
}

- (void)_addMetaDataLabelsIfRequired:(id)a3
{
  id v29 = a3;
  BOOL v4 = [v29 mediaEntities];
  id v5 = [v4 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 rentalExpirationDate];
    id v8 = [v6 downloadExpirationDate];
    double v9 = [v6 availabilityEndDate];
    double v10 = [v6 assetController];

    double v11 = [v10 state];
    double v12 = +[VUIRentalExpirationLabel labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:](VUIRentalExpirationLabel, "labelForRentalExpirationDate:downloadExpirationDate:contentAvailabilityDate:downloadStatus:", v7, v8, v9, [v11 status]);

    if (v12)
    {
      [v12 setDelegate:self];
      [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderFirstLabel:v12];
      [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderSecondLabel:0];
      [(VUIDownloadCollectionViewCell *)self setDotSeparatorLabel:0];
      goto LABEL_13;
    }
  }
  double v13 = [v29 releaseYear];
  double v12 = [v13 stringValue];

  if (v12)
  {
    double v14 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v14 setTextStyle:16];
    [(VUITextLayout *)v14 setFontWeight:10];
    [(VUITextLayout *)v14 setNumberOfLines:1];
    double v15 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    [(VUITextLayout *)v14 setColor:v15];

    double v16 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];
    double v17 = +[VUILabel labelWithString:v12 textLayout:v14 existingLabel:v16];
  }
  else
  {
    double v17 = 0;
  }
  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderFirstLabel:v17];
  double v18 = [v29 duration];
  if (!v18)
  {
    [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderSecondLabel:0];
    double v24 = 0;
    goto LABEL_11;
  }
  double v19 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
  double v20 = [v19 transformedValue:v18];

  double v21 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v21 setTextStyle:16];
  [(VUITextLayout *)v21 setFontWeight:10];
  [(VUITextLayout *)v21 setNumberOfLines:1];
  double v22 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v21 setColor:v22];

  double v23 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];
  double v24 = +[VUILabel labelWithString:v20 textLayout:v21 existingLabel:v23];

  [(VUIDownloadCollectionViewCell *)self setMetaDataHeaderSecondLabel:v24];
  if (!v12)
  {
LABEL_11:
    double v28 = 0;
    goto LABEL_12;
  }
  double v25 = objc_alloc_init(VUITextLayout);
  [(VUITextLayout *)v25 setTextStyle:22];
  double v26 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
  [(VUITextLayout *)v25 setColor:v26];

  [(VUITextLayout *)v25 setNumberOfLines:1];
  double v27 = [(VUIDownloadCollectionViewCell *)self dotSeparatorLabel];
  double v28 = +[VUILabel labelWithString:@"·" textLayout:v25 existingLabel:v27];

LABEL_12:
  [(VUIDownloadCollectionViewCell *)self setDotSeparatorLabel:v28];

LABEL_13:
}

- (void)_addDownloadButtonIfRequired:(id)a3
{
  id v4 = a3;
  id v5 = [v4 assetController];

  if (v5)
  {
    uint64_t v6 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    if (v6)
    {
      v7 = (VUIDownloadButton *)v6;
      id v8 = [v4 assetController];
      [(VUIDownloadButton *)v7 updateWithAssetController:v8];
    }
    else
    {
      v7 = [[VUIDownloadButton alloc] initWithMediaEntity:v4 type:8];
      [(VUIDownloadButton *)v7 setUsesDefaultConfiguration:1];
      objc_initWeak(&location, self);
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      double v11 = __62__VUIDownloadCollectionViewCell__addDownloadButtonIfRequired___block_invoke;
      double v12 = &unk_1E6DF5888;
      objc_copyWeak(&v13, &location);
      [(VUIDownloadButton *)v7 setDownloadStateChangeHandler:&v9];
      -[VUIDownloadCollectionViewCell setDownloadButton:](self, "setDownloadButton:", v7, v9, v10, v11, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __62__VUIDownloadCollectionViewCell__addDownloadButtonIfRequired___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (a2 || !(a3 | a4))
  {
    if ([WeakRetained previousDownloadState] != a2)
    {
      [v10 setMetaDataHeaderFirstLabel:0];
      uint64_t v9 = [v10 downloadEntity];
      [v10 _addMetaDataLabelsIfRequired:v9];

      [v10 setPreviousDownloadState:a2];
    }
  }
  else
  {
    id v8 = [WeakRetained delegate];
    [v8 downloadCellDidRequestCancelDownload:v10];
  }
}

- (void)_configureViewElementsForAX
{
  double v3 = [(VUIDownloadCollectionViewCell *)self traitCollection];
  uint64_t v4 = [v3 isAXEnabled];

  id v5 = [(VUIDownloadCollectionViewCell *)self dotSeparatorLabel];
  [v5 setHidden:v4];
}

- (BOOL)_hasSecondaryLabel
{
  double v3 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderFirstLabel];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(VUIDownloadCollectionViewCell *)self metaDataHeaderSecondLabel];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)_updateViewForEditState
{
  if (self->_editing)
  {
    if ([(VUIDownloadCollectionViewCell *)self isSelected])
    {
      double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
      objc_msgSend(v3, "vui_imageWithColor:", v4);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle"];
      BOOL v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
      v7 = objc_msgSend(v3, "vui_imageWithColor:", v4);
      id v10 = [v7 imageWithRenderingMode:1];
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
    [(VUIDownloadCollectionViewCell *)self setEditImageView:v8];
    uint64_t v9 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    [v9 removeFromSuperview];
  }
  else
  {
    [(VUIDownloadCollectionViewCell *)self setEditImageView:0];
    id v5 = [(VUIDownloadCollectionViewCell *)self downloadButton];
    if (!v5) {
      goto LABEL_9;
    }
    id v10 = v5;
    uint64_t v6 = [(VUIDownloadCollectionViewCell *)self contentView];
    [v6 addSubview:v10];

    [(VUIDownloadCollectionViewCell *)self setNeedsLayout];
  }
  id v5 = v10;
LABEL_9:
}

- (VUIDownloadCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIDownloadCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (VUIDownloadButton)downloadButton
{
  return self->_downloadButton;
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

- (UIImageView)editImageView
{
  return self->_editImageView;
}

- (VUIDownloadEntity)downloadEntity
{
  return self->_downloadEntity;
}

- (void)setDownloadEntity:(id)a3
{
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
  objc_storeStrong((id *)&self->_editImageView, 0);
  objc_storeStrong((id *)&self->_dotSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderSecondLabel, 0);
  objc_storeStrong((id *)&self->_metaDataHeaderFirstLabel, 0);
  objc_storeStrong((id *)&self->_downloadButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end