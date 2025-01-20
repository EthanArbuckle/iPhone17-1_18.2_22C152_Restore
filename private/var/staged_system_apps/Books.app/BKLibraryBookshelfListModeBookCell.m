@interface BKLibraryBookshelfListModeBookCell
- (BKLibraryBookshelfListModeBookCell)initWithFrame:(CGRect)a3;
- (BOOL)isSupplementalContentPDFPicker;
- (BOOL)shouldDragWithTouch:(id)a3;
- (BOOL)shrinkInEditMode;
- (CAShapeLayer)separatorline;
- (CGRect)coverArea;
- (CGRect)infoFrame;
- (UIImageView)dragBarView;
- (UILabel)authorLabel;
- (UILabel)titleLabel;
- (double)editModeMargin;
- (id)_checkmarkImageForSelectedState:(BOOL)a3;
- (id)cellListMetrics;
- (id)dragPreview;
- (id)dragPreviewParametersForDrop:(BOOL)a3;
- (void)_updateDragBarImage;
- (void)_updateLibraryAssetText;
- (void)_updateSeriesSequenceLabel:(BOOL)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAuthorLabel:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDragBarView:(id)a3;
- (void)setEditModeMargin:(double)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeparatorline:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation BKLibraryBookshelfListModeBookCell

- (BKLibraryBookshelfListModeBookCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  v3 = -[BKLibraryBookshelfGridBookCell initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(BKLibraryBookshelfGridBookCell *)v3 coverLayer];
    [v5 setBottomAligned:0];

    v6 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 10.0, 10.0];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    v8 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 10.0, 10.0];
    authorLabel = v4->_authorLabel;
    v4->_authorLabel = v8;

    uint64_t v10 = +[CAShapeLayer layer];
    separatorline = v4->_separatorline;
    v4->_separatorline = (CAShapeLayer *)v10;

    v12 = +[UIScreen mainScreen];
    [v12 scale];
    [(CAShapeLayer *)v4->_separatorline setLineWidth:1.0 / v13];

    [(CAShapeLayer *)v4->_separatorline setHidden:1];
    v14 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    dragBarView = v4->_dragBarView;
    v4->_dragBarView = v14;

    v16 = [(BKLibraryBookshelfGridBookCell *)v4 infoCell];
    [v16 setLeftAlignedCloudIcon:1];

    v17 = [(BKLibraryBookshelfListModeBookCell *)v4 layer];
    [v17 addSublayer:v4->_separatorline];

    v18 = [(BKLibraryBookshelfListModeBookCell *)v4 contentView];
    [v18 addSubview:v4->_titleLabel];

    v19 = [(BKLibraryBookshelfListModeBookCell *)v4 contentView];
    [v19 addSubview:v4->_authorLabel];

    v20 = [(BKLibraryBookshelfListModeBookCell *)v4 contentView];
    [v20 addSubview:v4->_dragBarView];

    v21 = +[UIColor bc_booksTableSelectionColor];
    [(BKLibraryBookshelfCollectionViewCell *)v4 setHighlightBackgroundColor:v21];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
  [v3 removeObserver:self forKeyPath:@"author" context:off_100B1E530];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v4 dealloc];
}

- (id)cellListMetrics
{
  objc_opt_class();
  v3 = [(BKLibraryBookshelfGridBookCell *)self metrics];
  objc_super v4 = BUDynamicCast();

  return v4;
}

- (id)dragPreview
{
  id v3 = objc_alloc((Class)UIDragPreview);
  objc_super v4 = [(BKLibraryBookshelfGridBookCell *)self coverView];
  id v5 = [v3 initWithView:v4];

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  id v5 = [(BKLibraryBookshelfListModeBookCell *)self traitCollection];
  v6 = [v5 traitCollectionByModifyingTraits:&stru_100A46BA8];

  v7 = +[UIColor bc_booksBackground];
  v8 = [v7 resolvedColorWithTraitCollection:v6];
  [v4 setBackgroundColor:v8];

  return v4;
}

- (CGRect)coverArea
{
  id v3 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
  if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
  {
    [v3 smallCoverMargins];
    id v4 = [(BKLibraryBookshelfGridBookCell *)self columnMetrics];
    [v4 smallMargins];

    [v3 smallCoverMargins];
    [v3 smallCoverSize];
  }
  else
  {
    [v3 coverMargins];
    id v5 = [(BKLibraryBookshelfGridBookCell *)self columnMetrics];
    [v5 margins];

    [v3 coverMargins];
    [v3 coverSize];
  }
  [(BKLibraryBookshelfListModeBookCell *)self bounds];
  [(BKLibraryBookshelfListModeBookCell *)self editModeMargin];
  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)shrinkInEditMode
{
  v2 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
  unsigned __int8 v3 = [v2 shrinkInEditMode];

  return v3;
}

- (CGRect)infoFrame
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isSupplementalContentPDFPicker
{
  v2 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
  unsigned __int8 v3 = [v2 supplementalContentPDFPicker];

  return v3;
}

- (void)layoutSubviews
{
  v227.receiver = self;
  v227.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v227 layoutSubviews];
  unsigned __int8 v3 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]
    && ([(BKLibraryBookshelfListModeBookCell *)self isSelected] & 1) == 0)
  {
    memset(&v226, 0, sizeof(v226));
    [v3 shrinkAmount];
    CGFloat v10 = v9;
    [v3 shrinkAmount];
    CGAffineTransformMakeScale(&v226, v10, v11);
    CGAffineTransform v225 = v226;
    double v12 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    CGAffineTransform v224 = v225;
    [v12 setAffineTransform:&v224];

    [v3 shrinkAlpha];
    *(float *)&CGFloat v10 = v13;
    double v6 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    double v7 = v6;
    LODWORD(v8) = LODWORD(v10);
  }
  else
  {
    id v4 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v223[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v223[1] = v5;
    v223[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v4 setAffineTransform:v223];

    double v6 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    double v7 = v6;
    LODWORD(v8) = 1.0;
  }
  [v6 setOpacity:v8];

  [(BKLibraryBookshelfListModeBookCell *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v22 = [(BKLibraryBookshelfGridBookCell *)self columnMetrics];
  [v22 margins];
  CGFloat v24 = v23;
  v228.origin.CGFloat x = v15;
  v228.origin.CGFloat y = v17;
  v228.size.CGFloat width = v19;
  v228.size.CGFloat height = v21;
  CGRect v229 = CGRectInset(v228, v24, 0.0);
  CGFloat x = v229.origin.x;
  CGFloat y = v229.origin.y;
  CGFloat width = v229.size.width;
  CGFloat height = v229.size.height;

  if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
  {
    [(BKLibraryBookshelfListModeBookCell *)self bounds];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    v37 = [(BKLibraryBookshelfGridBookCell *)self columnMetrics];
    [v37 smallMargins];
    CGFloat v39 = v38;
    v230.origin.CGFloat x = v30;
    v230.origin.CGFloat y = v32;
    v230.size.CGFloat width = v34;
    v230.size.CGFloat height = v36;
    CGRect v231 = CGRectInset(v230, v39, 0.0);
    CGFloat x = v231.origin.x;
    CGFloat y = v231.origin.y;
    CGFloat width = v231.size.width;
    CGFloat height = v231.size.height;
  }
  v232.origin.CGFloat x = x;
  v232.origin.CGFloat y = y;
  CGFloat rect = width;
  v232.size.CGFloat width = width;
  v232.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v232);
  [v3 coverSize];
  double v214 = v41;
  [v3 coverSize];
  double v43 = v42;
  [(BKLibraryBookshelfListModeBookCell *)self editModeMargin];
  double v45 = v44;
  [v3 coverMargins];
  double v47 = v46;
  [v3 coverMargins];
  double v49 = v48;
  if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
  {
    [v3 smallCoverSize];
    double v214 = v50;
    [v3 smallCoverSize];
    double v52 = MinX + v51;
    [v3 smallCoverMargins];
    double v54 = v52 + v53;
    [v3 coverMargins];
    double v56 = v54 + v55;
  }
  else
  {
    double v56 = v45 + MinX + v43 + v47 + v49;
  }
  v233.origin.CGFloat x = x;
  CGFloat v219 = y;
  v233.origin.CGFloat y = y;
  v233.size.CGFloat width = rect;
  v233.size.CGFloat height = height;
  double v57 = CGRectGetMaxX(v233) - v56;
  v58 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
  unsigned __int8 v59 = [v58 isHidden];

  double v60 = v57;
  if ((v59 & 1) == 0)
  {
    v61 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
    v62 = [v61 image];
    [v62 size];
    double v60 = v57 - v63;
  }
  v64 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  unsigned int v65 = [v64 isHidden];

  if (v65)
  {
    double v66 = 0.0;
  }
  else
  {
    v67 = [v3 seriesSequenceLabelFontAttributes];
    v68 = [v67 font];

    v69 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    [v69 sizeThatFits:v60];
    CGFloat v71 = v70;

    v234.origin.CGFloat y = 0.0;
    v234.origin.CGFloat x = v56;
    v234.size.CGFloat width = v60;
    v234.size.CGFloat height = v71;
    double MaxY = CGRectGetMaxY(v234);
    [v68 descender];
    double v74 = MaxY + v73;
    [v3 seriesSequenceLabelBottomMargin];
    double v66 = v74 + v75;
  }
  v76 = [v3 titleFontAttributes];
  v77 = [v76 font];

  v78 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
  [v78 sizeThatFits:v60 3.40282347e38];
  CGFloat v80 = v79;

  v81 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
  double v212 = v57;
  if ([v81 numberOfLines] == (id)1)
  {
    unsigned __int8 v82 = [(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker];

    if ((v82 & 1) == 0)
    {
      v235.origin.CGFloat x = v56;
      v235.origin.CGFloat y = v66;
      v235.size.CGFloat width = v60;
      v235.size.CGFloat height = v80;
      double v83 = height;
      double v84 = x;
      double v85 = v66;
      double v86 = CGRectGetHeight(v235);
      [v77 bk_heightFromCapLineToDescender];
      double v88 = v86 - v87;
      double v89 = v85;
      CGFloat x = v84;
      CGFloat height = v83;
      double v57 = v212;
      double v66 = v89 - v88;
    }
  }
  else
  {
  }
  v90 = [v3 authorFontAttributes];
  v91 = [v90 font];

  v236.origin.CGFloat x = v56;
  double v211 = v66;
  v236.origin.CGFloat y = v66;
  v236.size.CGFloat width = v60;
  CGFloat v213 = v80;
  v236.size.CGFloat height = v80;
  double v92 = CGRectGetMaxY(v236);
  [v77 descender];
  double v94 = v92 + v93;
  [v3 titleSpacing];
  double v96 = v94 + v95;
  v97 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
  [v97 sizeThatFits:v60, 3.40282347e38];
  CGFloat v99 = v98;
  CGFloat v101 = v100;

  v102 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
  id v103 = [v102 numberOfLines];

  if (v103 == (id)1)
  {
    v237.origin.CGFloat x = v56;
    v237.origin.CGFloat y = v96;
    v237.size.CGFloat width = v99;
    v237.size.CGFloat height = v101;
    double v104 = CGRectGetHeight(v237);
    [v91 bk_heightFromCapLineToDescender];
    double v96 = v96 - (v104 - v105);
  }
  v238.origin.CGFloat x = v56;
  v238.origin.CGFloat y = v96;
  CGFloat v216 = v60;
  v238.size.CGFloat width = v60;
  v238.size.CGFloat height = v101;
  double v106 = CGRectGetMaxY(v238);
  [v91 descender];
  double v108 = v106 + v107;
  [v3 authorSpacing];
  CGFloat v110 = v108 + v109;
  [v3 infoBarHeight];
  double v112 = v111;
  [v3 infoBarDateSpacing];
  double v114 = v112 + v113;
  [v3 infoBarExpectedDateHeight];
  v239.size.CGFloat height = v114 + v115;
  v239.origin.CGFloat x = v56;
  v239.origin.CGFloat y = v110;
  v239.size.CGFloat width = v57;
  double v116 = CGRectGetMaxY(v239);
  v117 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  unsigned __int8 v118 = [v117 showsDateBadge];

  if ((v118 & 1) == 0)
  {
    [v3 infoBarExpectedDateHeight];
    double v120 = v119;
    [v3 infoBarDateSpacing];
    double v116 = v116 - (v120 + v121);
  }
  CGFloat v221 = height;
  double v122 = x;
  [v3 coverMargins];
  double v124 = v123;
  if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
  {
    [v3 smallCoverMargins];
    double v126 = round(v214 * 0.5) + v125;
  }
  else
  {
    double v126 = v124 + round((v214 - v116) * 0.5);
  }
  v127 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  unsigned __int8 v128 = [v127 isHidden];

  if ((v128 & 1) == 0)
  {
    [(BKLibraryBookshelfGridBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v130 = v129;
    double v132 = v131;
    double v134 = v133;
    double v136 = v135;
    v137 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
    [v137 setFrame:v130, v132, v134, v136];
  }
  if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
  {
    v240.origin.CGFloat x = v56;
    v240.origin.CGFloat y = v211 + v126;
    v240.size.CGFloat width = v216;
    v240.size.CGFloat height = v213;
    CGRectGetHeight(v240);
    [v77 bk_heightFromCapLineToDescender];
  }
  CGFloat v220 = v122;
  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v139 = v138;
  double v141 = v140;
  double v143 = v142;
  double v145 = v144;
  v146 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
  [v146 setFrame:v139, v141, v143, v145];

  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v148 = v147;
  double v150 = v149;
  double v152 = v151;
  double v154 = v153;
  v155 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
  [v155 setFrame:v148, v150, v152, v154];

  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v157 = v156;
  double v159 = v158;
  double v161 = v160;
  double v163 = v162;
  v164 = [(BKLibraryBookshelfGridBookCell *)self infoCell];
  [v164 setFrame:v157, v159, v161, v163];

  if (*(double *)&qword_100B4A320 == 0.0)
  {
    v165 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
    v166 = [v165 selectedCheckmarkImageForSelectedState:1];
    [v166 size];
    qword_100B4A318 = v167;
    qword_100B4A320 = v168;
  }
  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v170 = v169;
  double v172 = v171;
  double v174 = v173;
  double v176 = v175;
  v177 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
  [v177 setFrame:v170, v172, v174, v176];

  v178 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
  v179 = [v178 image];
  [v179 size];

  v241.origin.CGFloat x = v220;
  v241.origin.CGFloat y = v219;
  v241.size.CGFloat width = rect;
  v241.size.CGFloat height = v221;
  CGRectGetHeight(v241);
  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v181 = v180;
  double v183 = v182;
  double v185 = v184;
  double v187 = v186;
  v188 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
  [v188 setFrame:v181, v183, v185, v187];

  v189 = +[UIBezierPath bezierPath];
  v190 = [(BKLibraryBookshelfListModeBookCell *)self separatorline];
  [v190 lineWidth];
  double v215 = 1.0 - v191 * 0.5;

  if (![(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker]) {
    [(BKLibraryBookshelfListModeBookCell *)self editModeMargin];
  }
  [(BKLibraryBookshelfGridBookCell *)self isRTL];
  v242.origin.CGFloat x = v220;
  v242.origin.CGFloat y = v219;
  v242.size.CGFloat width = rect;
  v242.size.CGFloat height = v221;
  CGRectGetMaxY(v242);
  v243.origin.CGFloat x = v220;
  v243.origin.CGFloat y = v219;
  v243.size.CGFloat width = rect;
  v243.size.CGFloat height = v221;
  CGRectGetWidth(v243);
  [(BKLibraryBookshelfListModeBookCell *)self editModeMargin];
  IMRectFlippedForRTL();
  CGFloat v218 = v244.origin.x;
  CGFloat v192 = v244.origin.y;
  CGFloat v193 = v244.size.width;
  CGFloat v194 = v244.size.height;
  double v217 = CGRectGetMinX(v244);
  v245.origin.CGFloat x = v220;
  v245.origin.CGFloat y = v219;
  v245.size.CGFloat width = rect;
  v245.size.CGFloat height = v221;
  [v189 moveToPoint:v217, CGRectGetMaxY(v245) - v215];
  v246.origin.CGFloat x = v218;
  v246.origin.CGFloat y = v192;
  v246.size.CGFloat width = v193;
  v246.size.CGFloat height = v194;
  double MaxX = CGRectGetMaxX(v246);
  v247.origin.CGFloat x = v220;
  v247.origin.CGFloat y = v219;
  v247.size.CGFloat width = rect;
  v247.size.CGFloat height = v221;
  [v189 addLineToPoint:MaxX, CGRectGetMaxY(v247) - v215];
  id v196 = v189;
  id v197 = [v196 CGPath];
  v198 = [(BKLibraryBookshelfListModeBookCell *)self separatorline];
  [v198 setPath:v197];

  v199 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  v200 = v199;
  if (v199)
  {
    [v199 frame];
    v201 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
    [v201 frame];
    CGRectCenterRectInRect();
    CGFloat v203 = v202;
    CGFloat v205 = v204;
    CGFloat v207 = v206;
    CGFloat v209 = v208;

    [v200 frame];
    v249.origin.CGFloat x = v203;
    v249.origin.CGFloat y = v205;
    v249.size.CGFloat width = v207;
    v249.size.CGFloat height = v209;
    if (!CGRectEqualToRect(v248, v249))
    {
      [(BKLibraryBookshelfListModeBookCell *)self effectiveUserInterfaceLayoutDirection];
      v210 = [(BKLibraryBookshelfGridBookCell *)self coverLayer];
      [v210 frame];
      IMRectFlippedForRTL();
      [v200 setFrame:];
    }
  }
}

- (void)_updateSeriesSequenceLabel:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v7 _updateSeriesSequenceLabel:a3];
  id v4 = [(BKLibraryBookshelfGridBookCell *)self seriesSequenceLabel];
  if ([v4 isHidden])
  {
    if ([(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
  double v6 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
  [v6 setNumberOfLines:v5];
}

- (void)_updateLibraryAssetText
{
  unsigned __int8 v3 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

  if (v3)
  {
    id v4 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
    uint64_t v5 = [v4 titleFontAttributes];
    id v17 = [v5 attributesWithTruncated:1];

    double v6 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    objc_super v7 = [v6 title];
    double v8 = +[TUIFontSpec attributedStringWith:v7 attributes:v17];
    double v9 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
    [v9 setAttributedText:v8];

    if (![(BKLibraryBookshelfListModeBookCell *)self isSupplementalContentPDFPicker])
    {
      CGFloat v10 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
      CGFloat v11 = [v10 authorFontAttributes];
      double v12 = [v11 attributesWithTruncated:1];

      double v13 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
      double v14 = [v13 displayAuthor];
      CGFloat v15 = +[TUIFontSpec attributedStringWith:v14 attributes:v12];
      double v16 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
      [v16 setAttributedText:v15];
    }
    [(BKLibraryBookshelfListModeBookCell *)self setNeedsLayout];
  }
}

- (void)setLibraryAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

  if (v5 != v4)
  {
    double v6 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    [v6 removeObserver:self forKeyPath:@"author" context:off_100B1E530];
  }
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v9 setLibraryAsset:v4];
  objc_super v7 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

  if (v7)
  {
    double v8 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    [v8 addObserver:self forKeyPath:@"author" options:0 context:off_100B1E530];
  }
  [(BKLibraryBookshelfListModeBookCell *)self _updateLibraryAssetText];
}

- (void)_updateDragBarImage
{
  uint64_t v3 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(BKLibraryBookshelfGridBookCell *)self dataSource];

    if (v5)
    {
      double v6 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
      id obj = [v6 dragBarTintColor];

      if (!qword_100B4A330 || ([obj isEqual:qword_100B4A328] & 1) == 0)
      {
        objc_storeStrong((id *)&qword_100B4A328, obj);
        objc_super v7 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:2 scale:20.0];
        double v8 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
        objc_super v9 = [v8 dragBarName];
        CGFloat v10 = +[UIImage systemImageNamed:v9];
        CGFloat v11 = [v10 imageWithConfiguration:v7];
        uint64_t v12 = [v11 imageMaskWithColor:qword_100B4A328];
        double v13 = (void *)qword_100B4A330;
        qword_100B4A330 = v12;
      }
      [(UIImageView *)self->_dragBarView setImage:qword_100B4A330];
    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();
  unsigned int v6 = [v5 layoutDebugMode];
  unsigned int v7 = [(BKLibraryBookshelfGridBookCell *)self layoutDebugMode];
  v45.receiver = self;
  v45.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v45 applyLayoutAttributes:v4];

  if (v7 != v6)
  {
    if ([v5 layoutDebugMode])
    {
      double v8 = +[UIColor redColor];
      id v9 = [v8 colorWithAlphaComponent:0.2];
      id v10 = [v9 CGColor];
      CGFloat v11 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
      uint64_t v12 = [v11 layer];
      [v12 setBorderColor:v10];

      double v13 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
      double v14 = [v13 layer];
      [v14 setBorderWidth:0.5];

      CGFloat v15 = +[UIColor redColor];
      id v16 = [v15 colorWithAlphaComponent:0.2];
      id v17 = [v16 CGColor];
      double v18 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
      CGFloat v19 = [v18 layer];
      [v19 setBorderColor:v17];

      double v20 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
      CGFloat v21 = [v20 layer];
      v22 = v21;
      double v23 = 0.5;
    }
    else
    {
      CGFloat v24 = [(BKLibraryBookshelfListModeBookCell *)self authorLabel];
      v25 = [v24 layer];
      [v25 setBorderWidth:0.0];

      double v20 = [(BKLibraryBookshelfListModeBookCell *)self titleLabel];
      CGFloat v21 = [v20 layer];
      v22 = v21;
      double v23 = 0.0;
    }
    [v21 setBorderWidth:v23];
  }
  v26 = [(BKLibraryBookshelfListModeBookCell *)self cellListMetrics];
  unsigned int v27 = [v5 editMode];
  double v28 = 0.0;
  if (v27) {
    [v26 editModeMargin];
  }
  [(BKLibraryBookshelfListModeBookCell *)self setEditModeMargin:v28];
  [(BKLibraryBookshelfListModeBookCell *)self _updateDragBarImage];
  double v29 = [(BKLibraryBookshelfListModeBookCell *)self separatorline];
  unsigned int v30 = [v29 isHidden];
  unsigned int v31 = [v5 lastItem];

  if (v30 != v31)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    id v32 = [v5 lastItem];
    double v33 = [(BKLibraryBookshelfListModeBookCell *)self separatorline];
    [v33 setHidden:v32];

    +[CATransaction commit];
  }
  if ([v5 editMode]) {
    uint64_t v34 = [v5 editable] ^ 1;
  }
  else {
    uint64_t v34 = 1;
  }
  double v35 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
  [v35 setHidden:v34];

  id v36 = [v26 separatorColor];
  id v37 = [v36 CGColor];
  double v38 = [(BKLibraryBookshelfListModeBookCell *)self separatorline];
  [v38 setStrokeColor:v37];

  CGFloat v39 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];

  if (v39)
  {
    [(BKLibraryBookshelfListModeBookCell *)self _updateLibraryAssetText];
    [(BKLibraryBookshelfListModeBookCell *)self layoutIfNeeded];
    v40 = [(BKLibraryBookshelfGridBookCell *)self coverView];
    double v41 = [v40 coverLayer];
    double v42 = [(BKLibraryBookshelfGridBookCell *)self libraryAsset];
    [(BKLibraryBookshelfListModeBookCell *)self coverArea];
    [v41 setLibraryAsset:v42 size:v43];
  }
}

- (id)_checkmarkImageForSelectedState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKLibraryBookshelfGridBookCell *)self dataSource];
  id v5 = [v4 selectedCheckmarkImageForSelectedState:v3];

  return v5;
}

- (void)setDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  [(BKLibraryBookshelfGridBookCell *)&v6 setDataSource:a3];
  if ([(BKLibraryBookshelfListModeBookCell *)self isSelected]) {
    +[UIColor bc_booksKeyColor];
  }
  else {
  id v4 = +[UIColor bc_booksTertiaryLabelColor];
  }
  id v5 = [(BKLibraryBookshelfGridBookCell *)self selectIndicatorView];
  [v5 setTintColor:v4];

  [(BKLibraryBookshelfListModeBookCell *)self _updateDragBarImage];
}

- (void)setSelected:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfListModeBookCell;
  -[BKLibraryBookshelfGridBookCell setSelected:](&v7, "setSelected:");
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000F10A0;
    v5[3] = &unk_100A44E60;
    v5[4] = self;
    BOOL v6 = a3;
    +[UIView animateWithDuration:v5 animations:0.2];
  }
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v8 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
  if ([v8 isHidden])
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = [(BKLibraryBookshelfListModeBookCell *)self dragBarView];
    [v10 frame];
    v12.CGFloat x = v5;
    v12.CGFloat y = v7;
    BOOL v9 = CGRectContainsPoint(v13, v12);
  }
  return v9;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B1E530 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F1268;
    block[3] = &unk_100A43D60;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryBookshelfListModeBookCell;
    -[BKLibraryBookshelfGridBookCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
}

- (UIImageView)dragBarView
{
  return self->_dragBarView;
}

- (void)setDragBarView:(id)a3
{
}

- (CAShapeLayer)separatorline
{
  return self->_separatorline;
}

- (void)setSeparatorline:(id)a3
{
}

- (double)editModeMargin
{
  return self->_editModeMargin;
}

- (void)setEditModeMargin:(double)a3
{
  self->_editModeMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorline, 0);
  objc_storeStrong((id *)&self->_dragBarView, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end