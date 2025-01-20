@interface BKLibraryBookshelfFinishedBookCell
+ (double)bookCellHeightFor:(id)a3 assetReview:(id)a4 storeID:(id)a5 editMode:(BOOL)a6 metrics:(id)a7 storageProvider:(id)a8 clearCache:(BOOL)a9;
+ (id)heightCache;
+ (int)finishedStateForAsset:(id)a3 assetReview:(id)a4 storeID:(id)a5 storageProvider:(id)a6;
- (AEAssetAudiobookStatus)audiobookStatus;
- (BCAssetReview)assetReview;
- (BCLibraryButton)markAsFinishedButton;
- (BCLibraryButton)writeReviewButton;
- (BCUCoverEffectsEnvironment)coverEffectsEnvironment;
- (BKLibraryActionHandler)actionHandler;
- (BKLibraryAsset)libraryAsset;
- (BKLibraryBookshelfCellMetrics)metrics;
- (BKLibraryBookshelfCellMetrics_Finished)finishedMetrics;
- (BKLibraryBookshelfColumnMetrics)columnMetrics;
- (BKLibraryBookshelfCoverView)coverView;
- (BKLibraryBookshelfFinishedBookCell)initWithFrame:(CGRect)a3;
- (BKLibraryBookshelfLayoutManager)layoutManager;
- (BKLibraryBookshelfStorageProvider)storageProvider;
- (BKLibraryBookshelfSupplementaryDataSource)dataSource;
- (BKLibraryDownloadStatus)libraryDownloadStatus;
- (BKLibraryStarRating)starRating;
- (BOOL)firstItem;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isDownloading;
- (BOOL)isRTL;
- (BOOL)lastItem;
- (BOOL)shouldDragWithTouch:(id)a3;
- (BOOL)shouldShowCloud;
- (BOOL)shouldShowDownloadProgressButton;
- (BOOL)shouldShowMoreButton;
- (BOOL)showFullReviewText;
- (BUCoalescingCallBlock)coalescedPropertyChange;
- (CALayer)reviewBackground;
- (CAShapeLayer)dateIndicator;
- (CGPath)pathForDateIndicator:(CGRect)a3;
- (CGRect)coverArea;
- (CGRect)coverFrame;
- (CGSize)bookCoverSize;
- (IMExpandingLabel)reviewComments;
- (IMRadialProgressButton)downloadProgressButton;
- (IMTouchInsetsButton)moreButton;
- (NSIndexPath)indexPath;
- (UIImageView)checkmarkView;
- (UIImageView)cloudView;
- (UILabel)authorLabel;
- (UILabel)combinedDateLabel;
- (UILabel)reviewTitle;
- (UILabel)titleLabel;
- (double)_desiredAlphaFromRawAlpha:(double)a3;
- (double)bookCoverLeftMargin;
- (id)coverImage;
- (id)coverLayer;
- (id)dragPreview;
- (id)dragPreviewParametersForDrop:(BOOL)a3;
- (int)finishedState;
- (int)layoutDebugMode;
- (void)_cancelDownload:(id)a3;
- (void)_updateLibraryAsset;
- (void)_updateTintedImages;
- (void)applyLayoutAttributes:(id)a3;
- (void)cleanupCell;
- (void)configureCombinedDate:(id)a3;
- (void)configureViewsBasedOnState;
- (void)dealloc;
- (void)handleTapWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)markAsFinishedPressed;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)reviewMorePressed;
- (void)setActionHandler:(id)a3;
- (void)setAssetReview:(id)a3;
- (void)setAudiobookStatus:(id)a3;
- (void)setAuthorLabel:(id)a3;
- (void)setBookCoverLeftMargin:(double)a3;
- (void)setBookCoverSize:(CGSize)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setCloudView:(id)a3;
- (void)setCoalescedPropertyChange:(id)a3;
- (void)setColumnMetrics:(id)a3;
- (void)setCombinedDateLabel:(id)a3;
- (void)setCoverEffectsEnvironment:(id)a3;
- (void)setCoverHidden:(BOOL)a3;
- (void)setCoverView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateIndicator:(id)a3;
- (void)setDownloadProgressButton:(id)a3;
- (void)setFinishedMetrics:(id)a3;
- (void)setFinishedState:(int)a3;
- (void)setFirstItem:(BOOL)a3;
- (void)setIndexPath:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setLastItem:(BOOL)a3;
- (void)setLayoutDebugMode:(int)a3;
- (void)setLayoutManager:(id)a3;
- (void)setLibraryAsset:(id)a3;
- (void)setLibraryDownloadStatus:(id)a3;
- (void)setMarkAsFinishedButton:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setReviewBackground:(id)a3;
- (void)setReviewComments:(id)a3;
- (void)setReviewTitle:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowFullReviewText:(BOOL)a3;
- (void)setStarRating:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setWriteReviewButton:(id)a3;
- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4;
- (void)starRatingDidChange:(id)a3 rating:(double)a4;
- (void)togglePlayPause:(id)a3;
- (void)updateFinishedState;
- (void)updateRatingAndReview;
- (void)writeReviewPressed;
@end

@implementation BKLibraryBookshelfFinishedBookCell

+ (int)finishedStateForAsset:(id)a3 assetReview:(id)a4 storeID:(id)a5 storageProvider:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_opt_class();
  v12 = [v9 permanentOrTemporaryAssetID];
  v13 = [v11 retrieveValueForKey:@"kExpandReviewText" forConsumer:v12];
  v14 = BUDynamicCast();

  objc_opt_class();
  v15 = [v9 permanentOrTemporaryAssetID];
  v16 = [v11 retrieveValueForKey:@"kStarRatedThisSession" forConsumer:v15];

  v17 = BUDynamicCast();
  unsigned int v33 = [v17 BOOLValue];

  unsigned int v34 = [v14 BOOLValue];
  unsigned int v18 = [v9 isFinished];
  unsigned int v19 = [v9 notFinished];
  unsigned int v20 = [v10 starRating];
  if (a5)
  {
    if ([v9 isStoreItem]) {
      LODWORD(a5) = 0;
    }
    else {
      LODWORD(a5) = [v9 isStore];
    }
  }
  v21 = [v9 purchaseDate];
  if (v21)
  {
    v22 = [v9 purchaseDate];
    +[NSDate distantPast];
    id v23 = v10;
    unsigned int v24 = v18;
    int v25 = (int)a5;
    a5 = v14;
    v27 = unsigned int v26 = v20;
    unsigned int v35 = [v22 isEqual:v27] ^ 1;

    unsigned int v20 = v26;
    v14 = a5;
    LODWORD(a5) = v25;
    unsigned int v18 = v24;
    id v10 = v23;
  }
  else
  {
    unsigned int v35 = 0;
  }

  v28 = [v10 reviewTitle];
  v29 = [v10 reviewBody];
  if ((v19 | v18 ^ 1))
  {
    int v30 = v19 ^ 1;
  }
  else
  {
    unsigned int v31 = a5 & v35;
    if ((a5 & v35) != 0) {
      int v30 = 2;
    }
    else {
      int v30 = 3;
    }
    if (v31 && v20)
    {
      if ([v28 length] || (v33 ? (int v30 = 4) : (int v30 = 5), objc_msgSend(v29, "length")))
      {
        if (v34) {
          int v30 = 7;
        }
        else {
          int v30 = 6;
        }
      }
    }
  }

  return v30;
}

+ (id)heightCache
{
  if (qword_100B4A360 != -1) {
    dispatch_once(&qword_100B4A360, &stru_100A47458);
  }
  v2 = (void *)qword_100B4A368;

  return v2;
}

+ (double)bookCellHeightFor:(id)a3 assetReview:(id)a4 storeID:(id)a5 editMode:(BOOL)a6 metrics:(id)a7 storageProvider:(id)a8 clearCache:(BOOL)a9
{
  int v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  unsigned int v20 = [a1 heightCache];
  v21 = v20;
  if (a9 || byte_100B4A370 != v11)
  {
    [v20 removeAllObjects];
    byte_100B4A370 = v11;
    if (v15)
    {
LABEL_4:
      id v205 = v17;
      objc_opt_class();
      v22 = BUDynamicCast();
      [v22 bookCoverSize];
      double v24 = v23;
      [v22 cellSpacing];
      double v26 = v25;
      v27 = [v15 permanentOrTemporaryAssetID];
      v28 = [v21 objectForKeyedSubscript:v27];

      if (v28)
      {
        [v28 doubleValue];
        double v30 = v29;
        id v17 = v205;
LABEL_53:

        goto LABEL_54;
      }
      id v200 = v18;
      double v195 = v26;
      double v196 = v24;
      unsigned int v197 = [v22 reviewBottomLayout];
      [v22 cellWidth];
      double v32 = v31;
      [v22 lockupMargin];
      double v34 = v32 - v33;
      [v22 cellSpacing];
      double v199 = v35;
      [v22 ratingHeight];
      double v187 = v36;
      [v22 moreHeight];
      double v188 = v37;
      [v22 bookCoverSize];
      double v39 = v38;
      [v22 bookCoverLeftMargin];
      double v192 = v40;
      [v22 cellWidth];
      double v190 = v41;
      [v22 lockupBottomSpacing];
      double v201 = v39 + v42;
      [v22 smallLayoutSpaceNeeded];
      double v189 = v43;
      id v44 = objc_alloc((Class)UILabel);
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      id v48 = [v44 initWithFrame:CGRectZero.origin.x, y, width, height];
      [v15 title];
      v49 = id v203 = v16;
      [v22 titleFontAttributes];
      v50 = v204 = v19;
      v51 = +[TUIFontSpec attributedStringWith:v49 attributes:v50];
      [v48 setAttributedText:v51];

      [v22 titleMaxLines];
      [v48 setNumberOfLines:(uint64_t)v52];
      [v48 sizeThatFits:v34];
      double v54 = v53;
      double v185 = y;
      double v55 = y;
      double v56 = v34;
      double v184 = width;
      double v57 = width;
      double v58 = height;
      double v59 = v39;
      [v48 setFrame:CGRectZero.origin.x, v55, v57, v58];
      v60 = [v15 displayAuthor];
      v61 = [v22 authorFontAttributes];
      v62 = +[TUIFontSpec attributedStringWith:v60 attributes:v61];
      [v48 setAttributedText:v62];

      [v22 authorMaxLines];
      [v48 setNumberOfLines:(uint64_t)v63];
      [v48 sizeThatFits:v34];
      double v65 = v64;
      double v66 = v54 + v64;
      [v22 authorSpacing];
      double v68 = v67 + v66;
      objc_opt_class();
      v69 = [v15 permanentOrTemporaryAssetID];
      v70 = [v204 retrieveValueForKey:@"kExpandReviewText" forConsumer:v69];
      v71 = BUDynamicCast();

      id v16 = v203;
      id v19 = v204;
      unsigned int v186 = [v71 BOOLValue];
      unsigned int v72 = [a1 finishedStateForAsset:v15 assetReview:v203 storeID:v205 storageProvider:v204];
      v202 = v71;
      unsigned int v194 = v72;
      if (v68 <= v39)
      {
        double v85 = v201;
        int v84 = v197;
        double v86 = 0.0;
        if (v59 - v68 >= v189)
        {
          if ((v11 & 1) == 0)
          {
            if (v72 == 4)
            {
              id v172 = objc_alloc_init((Class)BCLibraryButton);
              [v172 setClipsToBounds:1];
              [v22 writeReviewTitleInset];
              double v174 = v173;
              [v22 writeReviewTitleInset];
              [v172 setTitleEdgeInsets:0.0, v174, 0.0, v175];
              v176 = +[NSBundle mainBundle];
              v177 = [v176 localizedStringForKey:@"Write a Review" value:&stru_100A70340 table:0];

              v178 = [v22 writeReviewFontAttributes];
              v179 = +[TUIFontSpec attributedStringWith:v177 attributes:v178];
              [v172 setAttributedTitle:v179 forState:0];

              id v16 = v203;
              [v172 sizeThatFits:1.79769313e308, 1.79769313e308];
              double v181 = v180;
              [v22 writeReviewTitleInset];
              double v183 = v181 + v182 * 2.0;

              id v19 = v204;
              id v18 = v200;
              if (v183 > v56)
              {
                BOOL v83 = 1;
                goto LABEL_14;
              }
            }
            else if (v72 == 1)
            {
              id v193 = objc_alloc_init((Class)BCLibraryButton);
              [v193 setClipsToBounds:1];
              [v22 finishedTitleInset];
              double v93 = v92;
              [v22 finishedTitleInset];
              [v193 setTitleEdgeInsets:0.0, v93, 0.0, v94];
              unsigned int v95 = [v22 finishedShortText];
              v96 = +[NSBundle mainBundle];
              v97 = v96;
              if (v95) {
                CFStringRef v98 = @"FINISHED";
              }
              else {
                CFStringRef v98 = @"MARK FINISHED";
              }
              v191 = [v96 localizedStringForKey:v98 value:&stru_100A70340 table:0];

              v99 = [v22 finishedFontAttributes];
              v100 = +[TUIFontSpec attributedStringWith:v191 attributes:v99];
              [v193 setAttributedTitle:v100 forState:0];

              [v193 sizeThatFits:1.79769313e308, 1.79769313e308];
              double v102 = v101;
              [v22 finishedTitleInset];
              double v104 = v102 + v103 * 2.0;

              BOOL v83 = v104 > v56;
              id v16 = v203;
              id v19 = v204;
              goto LABEL_14;
            }
            BOOL v83 = 0;
            goto LABEL_14;
          }
          BOOL v83 = 0;
        }
        else
        {
          int v84 = 1;
          BOOL v83 = 1;
        }
      }
      else
      {
        v73 = [v15 title];
        v74 = [v22 titleFontAttributes];
        v75 = +[TUIFontSpec attributedStringWith:v73 attributes:v74];
        [v48 setAttributedText:v75];

        [v22 titleMaxLines];
        [v48 setNumberOfLines:(uint64_t)v76];
        [v48 sizeThatFits:v190 - v192, 1.79769313e308];
        double v54 = v77;
        v78 = [v15 displayAuthor];
        v79 = [v22 authorFontAttributes];
        v80 = +[TUIFontSpec attributedStringWith:v78 attributes:v79];
        [v48 setAttributedText:v80];

        id v19 = v204;
        [v22 authorMaxLines];
        [v48 setNumberOfLines:(uint64_t)v81];
        [v48 sizeThatFits:v190 - v192, 1.79769313e308];
        double v65 = v82;
        BOOL v83 = 0;
        int v84 = 1;
        double v85 = v201;
        double v86 = v201;
      }
LABEL_14:
      [v22 authorSpacing];
      double v88 = v65 + v54 + v86 + v87;
      if (!v83) {
        double v85 = v88;
      }
      if (v11)
      {
        if (v85 >= v59) {
          double v89 = v85;
        }
        else {
          double v89 = v59;
        }
        double v30 = v199 + v89;
      }
      else
      {
        double v30 = v196 + v195;
        switch(v194)
        {
          case 1u:
            id v110 = objc_alloc_init((Class)BCLibraryButton);
            v111 = [v22 finishedFontAttributes];
            v112 = +[TUIFontSpec attributedStringWith:@"FIN" attributes:v111];
            [v110 setAttributedTitle:v112 forState:0];

            id v19 = v204;
            [v110 sizeThatFits:1.79769313e308, 1.79769313e308];
            double v114 = v113;
            [v22 finishedSpacing];
            double v116 = v85 + v115;
            goto LABEL_36;
          case 2u:
            [v22 finishedSpacing];
            double v118 = v187 + v85 + v117;
            [v22 moreSpacing];
            double v91 = v119 + v118;
            goto LABEL_32;
          case 3u:
          case 9u:
            [v22 moreSpacing];
            double v91 = v85 + v90;
            goto LABEL_32;
          case 4u:
            id v110 = objc_alloc_init((Class)BCLibraryButton);
            v121 = [v22 writeReviewFontAttributes];
            v122 = +[TUIFontSpec attributedStringWith:@"Write" attributes:v121];
            [v110 setAttributedTitle:v122 forState:0];

            id v19 = v204;
            [v110 sizeThatFits:1.79769313e308, 1.79769313e308];
            double v114 = v123;
            [v22 ratingSpacing];
            double v125 = v85 + v124;
            [v22 ratingHeight];
            double v127 = v125 + v126;
            [v22 writeReviewSpacing];
            double v116 = v127 + v128;
LABEL_36:
            double v129 = v114 + v116;
            [v22 moreSpacing];
            double v131 = v199 + v188 + v130 + v129;
            if (v30 < v131) {
              double v30 = v131;
            }
            goto LABEL_51;
          case 5u:
          case 8u:
            [v22 ratingSpacing];
            double v106 = v85 + v105;
            [v22 ratingHeight];
            double v108 = v106 + v107;
            [v22 moreSpacing];
            double v91 = v108 + v109;
LABEL_32:
            double v120 = v199 + v188 + v91;
            if (v30 < v120) {
              double v30 = v120;
            }
            break;
          case 6u:
            unsigned int v186 = 0;
            goto LABEL_40;
          case 7u:
LABEL_40:
            [v16 reviewBody];
            int v132 = v84;
            id v110 = (id)objc_claimAutoreleasedReturnValue();
            [v22 bookCoverSize];
            double v134 = v133;
            int v198 = v132;
            if (v132)
            {
              [v22 cellWidth];
              double v136 = v135;
              [v22 bookCoverLeftMargin];
              double v56 = v136 - v137;
            }
            [v22 reviewLeftMargin];
            double v139 = v56 - v138;
            [v22 reviewRightMargin];
            double v141 = v139 - v140;
            if (v186)
            {
              id v142 = [v22 reviewContentFontAttributes];
              v143 = [v142 attributes];
              [v110 boundingRectWithSize:1 options:v143 attributes:0 context:v141];
              double v144 = CGRectGetHeight(v206);
            }
            else
            {
              id v142 = [objc_alloc((Class)IMExpandingLabel) initWithFrame:CGRectZero.origin.x, v185, v184, v58];
              [v142 setTextAlignment:0];
              v145 = [v22 reviewContentFontAttributes];
              v146 = +[TUIFontSpec attributedStringWith:v110 attributes:v145];
              [v142 setAttributedText:v146];

              [v142 sizeThatFits:v141];
              double v144 = v147;
            }

            v148 = [v22 reviewTitleFontAttributes];
            v149 = [v148 font];
            [v149 lineHeight];
            double v151 = v150;

            [v22 reviewTopMargin];
            double v153 = v144 + v151 + v152;
            [v22 reviewBottomMargin];
            double v155 = v153 + v154;
            [v22 ratingSpacing];
            double v157 = v187 + v85 + v156;
            if (v198)
            {
              [v22 moreSpacing];
              double v159 = v188 + v158 + v157;
              [v22 moreSpacing];
              double v161 = v160 + v159;
              if (v134 < v161) {
                double v134 = v161;
              }
              [v22 reviewSpacing];
              double v163 = v155 + v162 + v134;
            }
            else
            {
              [v22 reviewSpacing];
              double v165 = v155 + v164 + v157;
              [v22 moreSpacing];
              double v163 = v188 + v166 + v165;
            }
            id v19 = v204;
            double v30 = v199 + v163;
LABEL_51:

            break;
          default:
            break;
        }
      }
      v167 = +[NSNumber numberWithDouble:v30];
      v168 = [v15 permanentOrTemporaryAssetID];
      [v21 setObject:v167 forKeyedSubscript:v168];

      id v17 = v205;
      v28 = 0;
      goto LABEL_53;
    }
  }
  else if (v15)
  {
    goto LABEL_4;
  }
  double v30 = 0.0;
LABEL_54:
  float v169 = v30;
  double v170 = ceilf(v169);

  return v170;
}

- (BKLibraryBookshelfFinishedBookCell)initWithFrame:(CGRect)a3
{
  v76.receiver = self;
  v76.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  v3 = -[BKLibraryBookshelfCollectionViewCell initWithFrame:](&v76, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    id v4 = objc_alloc((Class)BUCoalescingCallBlock);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10010BC54;
    v73[3] = &unk_100A451B8;
    objc_copyWeak(&v74, &location);
    v5 = (BUCoalescingCallBlock *)[v4 initWithNotifyBlock:v73 blockDescription:@"Finished book cell"];
    coalescedPropertyChange = v3->_coalescedPropertyChange;
    v3->_coalescedPropertyChange = v5;

    [(BUCoalescingCallBlock *)v3->_coalescedPropertyChange setCoalescingDelay:0.1];
    v3->_finishedState = 10;
    v7 = +[UIApplication sharedApplication];
    v3->_isRTL = [v7 userInterfaceLayoutDirection] == (id)1;

    v8 = objc_alloc_init(BKLibraryBookshelfCoverView);
    coverView = v3->_coverView;
    v3->_coverView = v8;

    id v10 = [(BKLibraryBookshelfCoverView *)v3->_coverView coverLayer];
    [v10 setBottomAligned:0];

    int v11 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v11 addSubview:v3->_coverView];

    id v12 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v16 = [v12 initWithFrame:CGRectZero.origin.x, y, width, height];
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v16;

    id v18 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v18 addSubview:v3->_checkmarkView];

    id v19 = -[BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize initWithFrame:]([BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    unsigned int v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"Not downloaded" value:&stru_100A70340 table:0];
    [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v19 setAccessibilityLabel:v21];

    unint64_t v22 = (unint64_t)[(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v19 accessibilityTraits];
    [(BKLibraryBookshelfImageViewWithMinimumAccessibilityFrameSize *)v19 setAccessibilityTraits:v22 & ~UIAccessibilityTraitImage];
    objc_storeStrong((id *)&v3->_cloudView, v19);
    double v23 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v23 addSubview:v3->_cloudView];

    double v24 = [objc_alloc((Class)IMRadialProgressButton) initWithFrame:0.0, 0.0, 17.0, 17.0];
    downloadProgressButton = v3->_downloadProgressButton;
    v3->_downloadProgressButton = v24;

    [(IMRadialProgressButton *)v3->_downloadProgressButton setCenterImageNormal:0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setCenterImageSelected:0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setInscribeProgress:0];
    double v26 = +[UIColor bc_booksKeyColor];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressColor:v26];

    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressLineCap:1];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgressThickness:2.0];
    v27 = +[UIColor bc_booksTableSelectionColor];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackColor:v27];

    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackDiameter:17.0];
    [(IMRadialProgressButton *)v3->_downloadProgressButton setTrackThickness:2.0];
    -[IMRadialProgressButton setTouchInsets:](v3->_downloadProgressButton, "setTouchInsets:", -13.5, -13.5, -13.5, -13.5);
    [(IMRadialProgressButton *)v3->_downloadProgressButton addTarget:v3 action:"_cancelDownload:" forControlEvents:64];
    [(BKLibraryDownloadStatus *)v3->_libraryDownloadStatus progressValue];
    *(float *)&double v28 = v28;
    [(IMRadialProgressButton *)v3->_downloadProgressButton setProgress:v28];
    double v29 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v29 addSubview:v3->_downloadProgressButton];

    double v30 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height]];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v30;

    double v32 = v3->_titleLabel;
    unint64_t v33 = (unint64_t)[(UILabel *)v32 accessibilityTraits];
    [(UILabel *)v32 setAccessibilityTraits:UIAccessibilityTraitButton | UIAccessibilityTraitHeader | v33];
    double v34 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height]];
    authorLabel = v3->_authorLabel;
    v3->_authorLabel = v34;

    double v36 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v36 addSubview:v3->_titleLabel];

    double v37 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v37 addSubview:v3->_authorLabel];

    double v38 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    combinedDateLabel = v3->_combinedDateLabel;
    v3->_combinedDateLabel = v38;

    if ([(BKLibraryBookshelfFinishedBookCell *)v3 isRTL]) {
      uint64_t v40 = 0;
    }
    else {
      uint64_t v40 = 2;
    }
    [(UILabel *)v3->_combinedDateLabel setTextAlignment:v40];
    [(UILabel *)v3->_combinedDateLabel setMinimumScaleFactor:0.5];
    double v41 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v41 addSubview:v3->_combinedDateLabel];

    uint64_t v42 = +[CAShapeLayer layer];
    dateIndicator = v3->_dateIndicator;
    v3->_dateIndicator = (CAShapeLayer *)v42;

    id v44 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    v45 = [v44 layer];
    [v45 addSublayer:v3->_dateIndicator];

    v46 = -[BKLibraryStarRating initWithFrame:]([BKLibraryStarRating alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    starRating = v3->_starRating;
    v3->_starRating = v46;

    [(BKLibraryStarRating *)v3->_starRating setDelegate:v3];
    [(BKLibraryStarRating *)v3->_starRating setIsRTL:v3->_isRTL];
    [(BKLibraryStarRating *)v3->_starRating setAllowHalfStars:0];
    id v48 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v48 addSubview:v3->_starRating];

    v49 = (BCLibraryButton *)objc_alloc_init((Class)BCLibraryButton);
    markAsFinishedButton = v3->_markAsFinishedButton;
    v3->_markAsFinishedButton = v49;

    [(BCLibraryButton *)v3->_markAsFinishedButton setClipsToBounds:1];
    [(BCLibraryButton *)v3->_markAsFinishedButton addTarget:v3 action:"markAsFinishedPressed" forControlEvents:64];
    v51 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v51 addSubview:v3->_markAsFinishedButton];

    uint64_t v52 = +[IMTouchInsetsButton buttonWithType:0];
    moreButton = v3->_moreButton;
    v3->_moreButton = (IMTouchInsetsButton *)v52;

    double v54 = +[NSBundle mainBundle];
    double v55 = [v54 localizedStringForKey:@"More Actions" value:&stru_100A70340 table:0];
    [(IMTouchInsetsButton *)v3->_moreButton setAccessibilityLabel:v55];

    -[IMTouchInsetsButton setTouchInsets:](v3->_moreButton, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    double v56 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v56 addSubview:v3->_moreButton];

    double v57 = (BCLibraryButton *)objc_alloc_init((Class)BCLibraryButton);
    writeReviewButton = v3->_writeReviewButton;
    v3->_writeReviewButton = v57;

    [(BCLibraryButton *)v3->_writeReviewButton setClipsToBounds:1];
    [(BCLibraryButton *)v3->_writeReviewButton addTarget:v3 action:"writeReviewPressed" forControlEvents:64];
    double v59 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v59 addSubview:v3->_writeReviewButton];

    uint64_t v60 = +[CALayer layer];
    reviewBackground = v3->_reviewBackground;
    v3->_reviewBackground = (CALayer *)v60;

    [(CALayer *)v3->_reviewBackground setZPosition:-1.0];
    v62 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    double v63 = [v62 layer];
    [v63 addSublayer:v3->_reviewBackground];

    double v64 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height]];
    reviewTitle = v3->_reviewTitle;
    v3->_reviewTitle = v64;

    double v66 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v66 addSubview:v3->_reviewTitle];

    double v67 = [(IMExpandingLabel *)[objc_alloc((Class)IMExpandingLabel) initWithFrame:CGRectZero.origin.x, y, width, height]];
    reviewComments = v3->_reviewComments;
    v3->_reviewComments = v67;

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10010BD70;
    v71[3] = &unk_100A43F68;
    objc_copyWeak(&v72, &location);
    [(IMExpandingLabel *)v3->_reviewComments setLabelResizedBlock:v71];
    v69 = [(BKLibraryBookshelfFinishedBookCell *)v3 contentView];
    [v69 addSubview:v3->_reviewComments];

    objc_destroyWeak(&v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1EA40];
  [(BKLibraryDownloadStatus *)self->_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1EA48];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"isFinished" context:off_100B1EA50];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"notFinished" context:off_100B1EA50];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"dateFinished" context:off_100B1EA50];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1EA50];
  [(BKLibraryAsset *)self->_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1EA50];
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1EA58];
  [(AEAssetAudiobookStatus *)self->_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1EA60];
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v3 dealloc];
}

- (void)cleanupCell
{
  self->_finishedState = 10;
}

- (void)prepareForReuse
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  [(BKLibraryBookshelfCollectionViewCell *)&v5 prepareForReuse];
  [(BKLibraryBookshelfFinishedBookCell *)self cleanupCell];
  objc_super v3 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  unsigned int v4 = [v3 isHidden];

  if (v4) {
    [(BKLibraryBookshelfFinishedBookCell *)self setCoverHidden:0];
  }
  +[CATransaction commit];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    BOOL v6 = 1;
  }
  else
  {
    [(BKLibraryBookshelfFinishedBookCell *)self coverFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v5 locationInView:self];
    v18.x = v15;
    v18.double y = v16;
    v19.origin.x = v8;
    v19.origin.double y = v10;
    v19.size.double width = v12;
    v19.size.double height = v14;
    BOOL v6 = CGRectContainsPoint(v19, v18);
  }

  return v6;
}

- (void)markAsFinishedPressed
{
  id v4 = [(BKLibraryBookshelfFinishedBookCell *)self actionHandler];
  objc_super v3 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  [v4 bookMarkedFinished:v3];
}

- (void)writeReviewPressed
{
  objc_super v3 = [(BKLibraryBookshelfFinishedBookCell *)self storageProvider];
  id v4 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  id v5 = [v4 permanentOrTemporaryAssetID];
  [v3 storeValue:&__kCFBooleanFalse forKey:@"kStarRatedThisSession" forConsumer:v5];

  id v7 = [(BKLibraryBookshelfFinishedBookCell *)self actionHandler];
  BOOL v6 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  [v7 bookWriteReview:v6];
}

- (void)reviewMorePressed
{
  [(BKLibraryBookshelfFinishedBookCell *)self setShowFullReviewText:1];
  objc_super v3 = [(BKLibraryBookshelfFinishedBookCell *)self storageProvider];
  id v4 = +[NSNumber numberWithBool:[(BKLibraryBookshelfFinishedBookCell *)self showFullReviewText]];
  id v5 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  BOOL v6 = [v5 permanentOrTemporaryAssetID];
  [v3 storeValue:v4 forKey:@"kExpandReviewText" forConsumer:v6];

  id v7 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  id v11 = [v7 permanentOrTemporaryAssetID];

  if (v11)
  {
    CGFloat v8 = [(id)objc_opt_class() heightCache];
    [v8 removeObjectForKey:v11];

    double v9 = [(BKLibraryBookshelfFinishedBookCell *)self layoutManager];
    CGFloat v10 = [(BKLibraryBookshelfFinishedBookCell *)self indexPath];
    [v9 invalidateLayoutFor:v10];
  }
}

- (id)coverLayer
{
  v2 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
  objc_super v3 = [v2 coverLayer];

  return v3;
}

- (void)handleTapWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BKLibraryBookshelfFinishedBookCell *)self actionHandler];
  id v5 = [(BKLibraryBookshelfFinishedBookCell *)self indexPath];
  [v6 bookTapped:v5 completion:v4];
}

- (BCUCoverEffectsEnvironment)coverEffectsEnvironment
{
  v2 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  objc_super v3 = [v2 coverEffectsEnvironment];

  return (BCUCoverEffectsEnvironment *)v3;
}

- (void)setCoverEffectsEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  [v5 setCoverEffectsEnvironment:v4];
}

- (id)dragPreview
{
  id v3 = objc_alloc((Class)UIDragPreview);
  id v4 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
  id v5 = [v3 initWithView:v4];

  return v5;
}

- (id)dragPreviewParametersForDrop:(BOOL)a3
{
  id v4 = objc_alloc_init((Class)UIDragPreviewParameters);
  id v5 = [(BKLibraryBookshelfFinishedBookCell *)self traitCollection];
  id v6 = [v5 traitCollectionByModifyingTraits:&stru_100A47478];

  id v7 = +[UIColor bc_booksBackground];
  CGFloat v8 = [v7 resolvedColorWithTraitCollection:v6];
  [v4 setBackgroundColor:v8];

  return v4;
}

- (double)_desiredAlphaFromRawAlpha:(double)a3
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    a3 = 1.0;
    if (([(BKLibraryBookshelfFinishedBookCell *)self isSelected] & 1) == 0)
    {
      id v5 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      [v5 shrinkAlpha];
      a3 = v6;
    }
  }
  return a3;
}

- (void)setCoverHidden:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v5 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
  [v5 setHidden:v3];

  +[CATransaction commit];
}

- (id)coverImage
{
  v2 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  BOOL v3 = [v2 image];

  return v3;
}

- (BKLibraryBookshelfCoverView)coverView
{
  return self->_coverView;
}

- (CGRect)coverFrame
{
  BOOL v3 = [(BKLibraryBookshelfFinishedBookCell *)self layer];
  id v4 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  [v4 coverBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  [v3 convertRect:v13 fromLayer:v6, v8, v10, v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)coverArea
{
  [(BKLibraryBookshelfFinishedBookCell *)self bounds];
  BOOL v3 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
  [v3 margins];
  [(BKLibraryBookshelfFinishedBookCell *)self bookCoverLeftMargin];

  [(BKLibraryBookshelfFinishedBookCell *)self bookCoverSize];
  [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
  [(BKLibraryBookshelfFinishedBookCell *)self bounds];

  IMRectFlippedForRTL();
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.x = v4;
  return result;
}

- (void)configureViewsBasedOnState
{
  double v3 = (double)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
  double v4 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
  [v4 setAlpha:v3];

  *(float *)&double v3 = (float)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
  double v5 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
  LODWORD(v6) = LODWORD(v3);
  [v5 setOpacity:v6];

  double v7 = (double)[(BKLibraryBookshelfCollectionViewCell *)self isInEditMode];
  double v8 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
  [v8 setAlpha:v7];

  if ([(BKLibraryBookshelfFinishedBookCell *)self shouldShowCloud]) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
  [v10 setAlpha:v9];

  BOOL v11 = [(BKLibraryBookshelfFinishedBookCell *)self shouldShowCloud];
  double v12 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
  [v12 setIsAccessibilityElement:v11];

  if ([(BKLibraryBookshelfFinishedBookCell *)self shouldShowDownloadProgressButton]) {
    double v13 = 1.0;
  }
  else {
    double v13 = 0.0;
  }
  double v14 = [(BKLibraryBookshelfFinishedBookCell *)self downloadProgressButton];
  [v14 setAlpha:v13];

  if ([(BKLibraryBookshelfFinishedBookCell *)self shouldShowMoreButton]) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  double v16 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  [v16 setAlpha:v15];

  switch(self->_finishedState)
  {
    case 1:
      double v30 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v30 setOpacity:0.0];

      double v31 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v31 setAlpha:0.0];

      double v32 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v32 setAlpha:0.0];

      unint64_t v33 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      [v33 setAlpha:0.0];

      double v34 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v34 setAlpha:0.0];

      double v35 = (double)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
      double v36 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      goto LABEL_16;
    case 2:
    case 8:
      double v17 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v17 setOpacity:0.0];

      double v18 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v18 setAlpha:0.0];

      double v19 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v19 setAlpha:0.0];

      double v20 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v20 setAlpha:0.0];

      double v21 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      goto LABEL_18;
    case 3:
      double v37 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v37 setOpacity:0.0];

      double v38 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v38 setAlpha:0.0];

      double v39 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v39 setAlpha:0.0];

      uint64_t v40 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v40 setAlpha:0.0];

      double v41 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v41 setAlpha:0.0];

      double v36 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      goto LABEL_20;
    case 4:
      uint64_t v42 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v42 setOpacity:0.0];

      double v43 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v43 setAlpha:0.0];

      id v44 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v44 setAlpha:0.0];

      v45 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v45 setAlpha:0.0];

      v46 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      [v46 setAlpha:1.0];

      double v35 = (double)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
      double v36 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
LABEL_16:
      id v58 = v36;
      double v47 = v35;
      goto LABEL_22;
    case 5:
      id v48 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v48 setOpacity:0.0];

      v49 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v49 setAlpha:0.0];

      v50 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v50 setAlpha:0.0];

      v51 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v51 setAlpha:0.0];

      double v21 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
LABEL_18:
      uint64_t v52 = v21;
      [v21 setAlpha:0.0];

      double v36 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      double v47 = 1.0;
      goto LABEL_21;
    case 6:
    case 7:
      double v22 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v22 setAlpha:0.0];

      double v23 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v23 setAlpha:0.0];

      double v24 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      [v24 setAlpha:1.0];

      double v25 = (double)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
      double v26 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v26 setAlpha:v25];

      double v27 = (double)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
      double v28 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v28 setAlpha:v27];

      *(float *)&double v27 = (float)([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode] ^ 1);
      id v58 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      LODWORD(v29) = LODWORD(v27);
      [v58 setOpacity:v29];
      goto LABEL_23;
    case 9:
      double v53 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v53 setOpacity:0.0];

      double v54 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v54 setAlpha:0.0];

      double v55 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v55 setAlpha:0.0];

      double v56 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
      [v56 setAlpha:0.0];

      double v57 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v57 setAlpha:0.0];

      double v36 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
LABEL_20:
      double v47 = 0.0;
LABEL_21:
      id v58 = v36;
LABEL_22:
      [v36 setAlpha:v47];
LABEL_23:

      break;
    default:
      return;
  }
}

- (void)setFinishedState:(int)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  int finishedState = self->_finishedState;
  if (finishedState == 10 || finishedState != a3)
  {
    self->_int finishedState = a3;
    if (finishedState != 10)
    {
      double v7 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
      double v8 = [v7 permanentOrTemporaryAssetID];

      if (v8)
      {
        double v9 = [(id)objc_opt_class() heightCache];
        [v9 removeObjectForKey:v8];

        double v10 = [(BKLibraryBookshelfFinishedBookCell *)self layoutManager];
        BOOL v11 = [(BKLibraryBookshelfFinishedBookCell *)self indexPath];
        [v10 invalidateLayoutFor:v11];
      }
    }
    [(BKLibraryBookshelfFinishedBookCell *)self setNeedsLayout];
  }

  [(BKLibraryBookshelfFinishedBookCell *)self configureViewsBasedOnState];
}

- (void)layoutSubviews
{
  v655.receiver = self;
  v655.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  [(BKLibraryBookshelfFinishedBookCell *)&v655 layoutSubviews];
  double v3 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  [(BKLibraryBookshelfFinishedBookCell *)self bounds];
  CGFloat rect = v656.size.width;
  CGFloat height = v656.size.height;
  CGFloat x = v656.origin.x;
  CGFloat y = v656.origin.y;
  CGFloat MaxX = CGRectGetMaxX(v656);
  double v6 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
  [v6 margins];
  double v8 = v7;

  [(BKLibraryBookshelfFinishedBookCell *)self coverArea];
  double v9 = v657.origin.x;
  double v10 = v657.origin.y;
  double width = v657.size.width;
  double v630 = v657.size.height;
  CGRectGetMidY(v657);
  double v12 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
  [v12 bounds];
  BOOL v15 = v14 == CGSizeZero.width && v13 == CGSizeZero.height;
  CGFloat v631 = CGSizeZero.height;
  double v610 = v8;
  double v611 = MaxX;
  if (v15)
  {
  }
  else
  {
    +[UIView inheritedAnimationDuration];
    double v17 = v16;

    if (v17 != 0.0)
    {
      double v18 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
      goto LABEL_9;
    }
  }
  double v18 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
LABEL_9:
  double v19 = v18;
  [v18 setFrame:v9, v10, width, v630];

  unsigned int v20 = [v3 reviewBottomLayout];
  double v21 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
  [v21 margins];
  double v23 = v22;
  [v3 lockupMargin];
  double v25 = v23 + v24;

  v658.origin.CGFloat x = x;
  v658.origin.CGFloat y = y;
  v658.size.double width = rect;
  v658.size.CGFloat height = height;
  double v637 = v25;
  CGFloat v26 = CGRectGetWidth(v658) - v25;
  double v27 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
  [v27 margins];
  double v29 = v26 - v28;

  v659.origin.CGFloat x = v9;
  v659.origin.CGFloat y = v10;
  v659.size.double width = width;
  v659.size.CGFloat height = v630;
  double MaxY = CGRectGetMaxY(v659);
  v660.origin.CGFloat x = v9;
  v660.origin.CGFloat y = v10;
  v660.size.double width = width;
  v660.size.CGFloat height = v630;
  double MinY = CGRectGetMinY(v660);
  double v622 = MaxY - MinY;
  double v627 = width;
  double v628 = v10;
  double v629 = v9;
  v661.origin.CGFloat x = v9;
  v661.origin.CGFloat y = v10;
  v661.size.double width = width;
  v661.size.CGFloat height = v630;
  double MinX = CGRectGetMinX(v661);
  v662.origin.CGFloat x = x;
  v662.origin.CGFloat y = y;
  v662.size.double width = rect;
  CGFloat v643 = height;
  v662.size.CGFloat height = height;
  double v620 = CGRectGetWidth(v662);
  double v31 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
  [v31 margins];
  double v613 = v32;

  [v3 lockupBottomSpacing];
  double v645 = MaxY + v33;
  [v3 smallLayoutSpaceNeeded];
  double v35 = v34;
  CGFloat v36 = CGRectZero.origin.y;
  double v37 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
  [v37 sizeThatFits:v29, 1.79769313e308];
  double v39 = v38;
  double v41 = v40;

  if (v39 >= v29) {
    double v42 = v29;
  }
  else {
    double v42 = v39;
  }
  double v43 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
  [v43 sizeThatFits:v29];
  double v45 = v44;
  double v47 = v46;

  double v616 = v29;
  if (v45 < v29) {
    double v29 = v45;
  }
  [v3 authorSpacing];
  double v49 = v41 + v47 + v48;
  CGFloat v615 = v36;
  if (v49 <= v622)
  {
    double v609 = v42;
    CGFloat v618 = v47;
    CGFloat v621 = v29;
    double v614 = v41;
    if (v622 - v49 < v35)
    {
      int v66 = 0;
      unsigned int v20 = 1;
      CGFloat v623 = v637;
      char v65 = 1;
LABEL_36:
      double v67 = MinY;
      CGFloat v55 = v614;
      CGFloat v63 = v42;
      goto LABEL_37;
    }
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
      goto LABEL_24;
    }
    double v68 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v68 alpha];
    double v70 = v69;

    if (v70 == 0.0)
    {
      v80 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v80 alpha];
      double v82 = v81;

      if (v82 == 0.0)
      {
LABEL_24:
        char v65 = 0;
        int v66 = 1;
LABEL_35:
        CGFloat v623 = v637;
        goto LABEL_36;
      }
      BOOL v83 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v83 titleEdgeInsets];
      double v85 = v84;
      double v87 = v86;

      double v88 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v88 sizeThatFits:1.79769313e308, 1.79769313e308];
      double v90 = v89;

      BOOL v79 = v85 + v87 + v90 <= v616;
    }
    else
    {
      v71 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v71 titleEdgeInsets];
      double v73 = v72;
      double v75 = v74;

      objc_super v76 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v76 sizeThatFits:1.79769313e308, 1.79769313e308];
      double v78 = v77;

      BOOL v79 = v73 + v75 + v78 <= v616;
    }
    char v65 = !v79;
    int v66 = v79;
    goto LABEL_35;
  }
  double v50 = v620 - MinX - v613;
  v51 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
  [v51 sizeThatFits:v50];
  CGFloat v53 = v52;
  CGFloat v55 = v54;

  v663.origin.CGFloat x = CGRectZero.origin.x;
  v663.origin.CGFloat y = v36;
  v663.size.double width = v53;
  v663.size.CGFloat height = v55;
  double v56 = CGRectGetWidth(v663);
  if (v56 >= v50) {
    double v57 = v620 - MinX - v613;
  }
  else {
    double v57 = v56;
  }
  id v58 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
  [v58 sizeThatFits:v50];
  CGFloat v60 = v59;
  CGFloat v62 = v61;

  v664.origin.CGFloat x = CGRectZero.origin.x;
  v664.origin.CGFloat y = v36;
  v664.size.double width = v60;
  CGFloat v63 = v57;
  CGFloat v618 = v62;
  v664.size.CGFloat height = v62;
  double v64 = CGRectGetWidth(v664);
  char v65 = 0;
  int v66 = 0;
  if (v64 >= v50) {
    double v64 = v620 - MinX - v613;
  }
  CGFloat v621 = v64;
  CGFloat v623 = MinX;
  unsigned int v20 = 1;
  double v67 = v645;
LABEL_37:
  [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
  IMRectFlippedForRTL();
  CGFloat v91 = v67;
  CGFloat v92 = v55;
  double v94 = v93;
  double v96 = v95;
  double v98 = v97;
  double v100 = v99;
  double v101 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
  [v101 setFrame:v94, v96, v98, v100];

  v665.origin.CGFloat x = v623;
  v665.origin.CGFloat y = v91;
  v665.size.double width = v63;
  v665.size.CGFloat height = v92;
  double v102 = CGRectGetMaxY(v665);
  [v3 authorSpacing];
  double v104 = v102 + v103;
  [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
  IMRectFlippedForRTL();
  double v106 = v105;
  double v108 = v107;
  double v110 = v109;
  double v112 = v111;
  double v113 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
  [v113 setFrame:v106, v108, v110, v112];

  if ((v65 & 1) == 0)
  {
    v666.origin.CGFloat x = v623;
    v666.origin.CGFloat y = v104;
    v666.size.double width = v621;
    v666.size.CGFloat height = v618;
    double v645 = CGRectGetMaxY(v666);
  }
  BOOL v114 = [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
  double v115 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
  [v115 setIsRTL:v114];

  double v116 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
  [v116 alpha];
  double v118 = v117;

  if (v66) {
    CGFloat v119 = v637;
  }
  else {
    CGFloat v119 = MinX;
  }
  [v3 ratingSpacing];
  CGFloat v120 = v645;
  double v122 = v645 + v121;
  CGFloat v641 = v119;
  if (v118 == 0.0)
  {
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v124 = v123;
    double v126 = v125;
    double v128 = v127;
    double v130 = v129;
    double v131 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v131 setFrame:v124, v126, v128, v130];
  }
  else
  {
    [v3 ratingWidth];
    CGFloat v133 = v132;
    [v3 ratingHeight];
    CGFloat v646 = v134;
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v136 = v135;
    double v138 = v137;
    double v140 = v139;
    double v142 = v141;
    v143 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v143 setFrame:v136, v138, v140, v142];

    v667.origin.CGFloat x = v119;
    v667.origin.CGFloat y = v122;
    v667.size.double width = v133;
    v667.size.CGFloat height = v646;
    CGFloat v120 = CGRectGetMaxY(v667);
  }
  double v647 = v120;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    double v144 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
    v145 = [v144 image];
    [v145 size];
    double v147 = v146;
    double v149 = v148;

    double v150 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
    [v150 margins];
    double v152 = v151;
    [(BKLibraryBookshelfFinishedBookCell *)self bookCoverLeftMargin];
    double v154 = v152 + v153;
    [v3 checkMarkSpacing];
    double v156 = v154 - (v147 + v155);

    v668.origin.CGFloat y = v628;
    v668.origin.CGFloat x = v629;
    v668.size.double width = v627;
    v668.size.CGFloat height = v630;
    v654[1] = 3221225472;
    v654[0] = _NSConcreteStackBlock;
    v654[2] = sub_10010F2C8;
    v654[3] = &unk_100A44EF0;
    v654[4] = self;
    *(double *)&v654[5] = v156;
    *(double *)&v654[6] = CGRectGetMidY(v668) + v149 * -0.5;
    *(double *)&v654[7] = v147;
    *(double *)&v654[8] = v149;
    *(CGFloat *)&v654[9] = x;
    *(CGFloat *)&v654[10] = y;
    *(CGFloat *)&v654[11] = rect;
    *(CGFloat *)&v654[12] = v643;
    +[UIView performWithoutAnimation:v654];
    [v3 finishedSpacing];
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v158 = v157;
    double v160 = v159;
    double v162 = v161;
    double v164 = v163;
    double v165 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v165 setFrame:v158, v160, v162, v164];

    [v3 writeReviewSpacing];
    CGFloat v648 = v647 + v166;
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v168 = v167;
    double v170 = v169;
    double v172 = v171;
    double v174 = v173;
    double v175 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
    double v176 = v168;
    double v177 = v637;
    [v175 setFrame:v176, v170, v172, v174];

    v669.origin.CGFloat x = v641;
    v669.origin.CGFloat y = v648;
    v669.size.double width = CGSizeZero.width;
    v669.size.CGFloat height = v631;
    double v178 = CGRectGetMaxY(v669);
    double v649 = v178;
    if (v20)
    {
      [v3 bookCoverLeftMargin];
      double v180 = v179;
      double v181 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
      [v181 margins];
      double v177 = v180 + v182;

      [v3 bookCoverSize];
      double v178 = v183;
    }
    [v3 reviewSpacing];
    double v624 = v178 + v184;
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v186 = v185;
    double v188 = v187;
    double v190 = v189;
    double v192 = v191;
    id v193 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
    [v193 setFrame:v186, v188, v190, v192];

    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    CGFloat v194 = v177;
    IMRectFlippedForRTL();
    double v196 = v195;
    double v198 = v197;
    double v200 = v199;
    double v202 = v201;
    id v203 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
    [v203 setFrame:v196, v198, v200, v202];

    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v205 = v204;
    double v207 = v206;
    double v209 = v208;
    double v211 = v210;
    v212 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    [v212 setFrame:v205, v207, v209, v211];

    v213 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    [v213 setExpanded:1];

    double v214 = v649;
    if ([(BKLibraryBookshelfFinishedBookCell *)self finishedState] == 7
      || [(BKLibraryBookshelfFinishedBookCell *)self finishedState] == 6)
    {
      v670.size.double width = CGSizeZero.width;
      v670.origin.CGFloat x = v194;
      v670.origin.CGFloat y = v624;
      v670.size.CGFloat height = v631;
      double v214 = CGRectGetMaxY(v670);
    }
    double v650 = v214;
    v215 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
    [v215 sizeThatFits:1.79769313e308, 1.79769313e308];
    CGFloat v638 = v216;

    [v3 moreHeight];
    CGFloat v634 = v217;
    [v3 moreSpacing];
    CGFloat v632 = v214 + v218;
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v220 = v219;
    double v222 = v221;
    double v224 = v223;
    double v226 = v225;
    v227 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
    [v227 setFrame:v220, v222, v224, v226];

    [v3 moreSpacing];
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v229 = v228;
    double v231 = v230;
    double v233 = v232;
    double v235 = v234;
    v236 = [(BKLibraryBookshelfFinishedBookCell *)self downloadProgressButton];
    [v236 setFrame:v229, v231, v233, v235];

    v237 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
    v238 = [v237 image];
    [v238 size];

    v671.origin.CGFloat x = v641;
    v671.origin.CGFloat y = v632;
    v671.size.double width = v638;
    v671.size.CGFloat height = v634;
    CGRectGetMaxX(v671);
    [v3 cloudSpacing];
    v672.origin.CGFloat x = v641;
    v672.origin.CGFloat y = v632;
    v672.size.double width = v638;
    v672.size.CGFloat height = v634;
    CGRectGetMinY(v672);
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v240 = v239;
    double v242 = v241;
    double v244 = v243;
    double v246 = v245;
    v247 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
    double v248 = v240;
    double v249 = v650;
    [v247 setFrame:v248, v242, v244, v246];
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    v250 = -[BKLibraryBookshelfFinishedBookCell pathForDateIndicator:](self, "pathForDateIndicator:", v629, v628, v627, v630);
    v251 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
    [v251 setPath:v250];

    unsigned int v252 = [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    [v3 datelineMargin];
    double v254 = v253;
    if (v252)
    {
      [v3 datelineWidth];
      double v256 = v611 - v610 - v254 + v255 * -0.5;
    }
    else
    {
      v251 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
      [v251 margins];
      double v256 = v254 + v257;
    }
    v258 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
    [v258 setPosition:v256];

    if ((v252 & 1) == 0) {
    +[CATransaction commit];
    }
    objc_opt_class();
    v259 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    v260 = [v259 dateFontAttributes];
    v261 = [v260 font];
    v247 = BUDynamicCast();

    if (v247)
    {
      v262 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
      [v262 setFont:v247];
    }
    objc_opt_class();
    v263 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    v264 = [v263 dateFontAttributes];
    v265 = [v264 foregroundColor];
    v266 = BUDynamicCast();

    if (v266)
    {
      v267 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
      [v267 setTextColor:v266];
    }
    v268 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    [v268 setAdjustsFontSizeToFitWidth:0];

    v269 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
    [v269 margins];
    double v271 = v270;
    [v3 datelineMargin];
    double v273 = v271 + v272;
    [v3 dateSpace];
    double v275 = v273 - v274;
    [v3 datelineCircleSize];
    double v277 = v275 - v276 + -4.0;

    v278 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    [v278 sizeThatFits:1.79769313e308, 1.79769313e308];
    CGFloat v280 = v279;
    CGFloat v282 = v281;

    v283 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
    [v283 margins];
    double v285 = v284;
    [v3 datelineMargin];
    double v287 = v285 + v286;
    v673.origin.CGFloat x = CGRectZero.origin.x;
    v673.origin.CGFloat y = v615;
    v673.size.double width = v280;
    v673.size.CGFloat height = v282;
    double v288 = v287 - CGRectGetWidth(v673);
    [v3 dateSpace];
    double v290 = v288 - v289;
    [v3 datelineCircleSize];
    double v292 = v290 - v291;

    v674.origin.CGFloat x = v292;
    v674.origin.CGFloat y = v615;
    v674.size.double width = v280;
    v674.size.CGFloat height = v282;
    if (CGRectGetWidth(v674) <= v277)
    {
      double v277 = v280;
    }
    else
    {
      v293 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
      [v293 setAdjustsFontSizeToFitWidth:1];

      v294 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
      [v294 margins];
      double v296 = v295;
      [v3 datelineMargin];
      double v298 = v296 + v297;
      v675.origin.CGFloat x = v292;
      v675.origin.CGFloat y = v615;
      v675.size.double width = v277;
      v675.size.CGFloat height = v282;
      double v299 = v298 - CGRectGetWidth(v675);
      [v3 dateSpace];
      double v301 = v299 - v300;
      [v3 datelineCircleSize];
      double v292 = v301 - v302;

      CGFloat v280 = v277;
    }
    v676.origin.CGFloat x = v292;
    v676.origin.CGFloat y = v615;
    v676.size.double width = v280;
    v676.size.CGFloat height = v282;
    v677.origin.CGFloat y = CGRectGetMaxY(v676);
    v677.origin.CGFloat x = v292;
    v677.size.double width = v277;
    v677.size.CGFloat height = v282;
    CGRectGetHeight(v677);
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v304 = v303;
    double v306 = v305;
    double v308 = v307;
    double v310 = v309;
    v311 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    [v311 setFrame:v304, v306, v308, v310];

    v312 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v312 alpha];
    double v314 = v313;

    if (v314 == 0.0)
    {
      [v3 finishedSpacing];
      double v315 = v647;
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v317 = v316;
      double v319 = v318;
      double v321 = v320;
      double v323 = v322;
      v324 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v324 setFrame:v317, v319, v321, v323];
    }
    else
    {
      v325 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v325 titleEdgeInsets];
      double v327 = v326;
      double v329 = v328;

      v330 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v330 sizeThatFits:1.79769313e308, 1.79769313e308];
      double v332 = v331;
      CGFloat v625 = v333;

      CGFloat v334 = v327 + v329 + v332;
      [v3 finishedSpacing];
      CGFloat v336 = v647 + v335;
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v338 = v337;
      double v340 = v339;
      double v342 = v341;
      double v344 = v343;
      v345 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v345 setFrame:v338, v340, v342, v344];

      v678.origin.CGFloat x = v641;
      v678.origin.CGFloat y = v336;
      v678.size.double width = v334;
      v678.size.CGFloat height = v625;
      CGFloat v346 = CGRectGetHeight(v678) * 0.5;
      v347 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      v348 = [v347 layer];
      [v348 setCornerRadius:v346];

      v679.origin.CGFloat x = v641;
      v679.origin.CGFloat y = v336;
      v679.size.double width = v334;
      v679.size.CGFloat height = v625;
      double v315 = CGRectGetMaxY(v679);
    }
    v349 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
    [v349 alpha];
    double v351 = v350;

    if (v351 == 0.0)
    {
      [v3 writeReviewSpacing];
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v353 = v352;
      double v355 = v354;
      double v357 = v356;
      double v359 = v358;
      v360 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v360 setFrame:v353, v355, v357, v359];
    }
    else
    {
      v361 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v361 titleEdgeInsets];
      double v363 = v362;
      double v365 = v364;

      v366 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v366 sizeThatFits:1.79769313e308, 1.79769313e308];
      double v368 = v367;
      CGFloat v370 = v369;

      double v371 = v363 + v365 + v368;
      [v3 writeReviewSpacing];
      double v373 = v315 + v372;
      v680.origin.CGFloat x = v641;
      v680.origin.CGFloat y = v373;
      v680.size.double width = v371;
      v680.size.CGFloat height = v370;
      double v374 = CGRectGetMaxX(v680);
      v681.origin.CGFloat x = x;
      v681.size.CGFloat height = v643;
      v681.origin.CGFloat y = y;
      v681.size.double width = rect;
      if (v374 <= CGRectGetMaxX(v681)
        || (v682.origin.CGFloat x = v641,
            v682.origin.CGFloat y = v373,
            v682.size.double width = v371,
            v682.size.CGFloat height = v370,
            double v375 = CGRectGetMinY(v682),
            [v3 bookCoverSize],
            v375 <= v376))
      {
        double v381 = v641;
      }
      else
      {
        v683.size.CGFloat height = v643;
        v683.origin.CGFloat x = x;
        v683.origin.CGFloat y = y;
        v683.size.double width = rect;
        double v377 = CGRectGetMaxX(v683);
        v684.origin.CGFloat x = v641;
        v684.origin.CGFloat y = v373;
        v684.size.double width = v371;
        v684.size.CGFloat height = v370;
        double v378 = v377 - CGRectGetWidth(v684);
        v379 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
        [v379 margins];
        double v381 = v378 - v380;
      }
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v383 = v382;
      double v385 = v384;
      double v387 = v386;
      double v389 = v388;
      v390 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v390 setFrame:v383, v385, v387, v389];

      v685.origin.CGFloat x = v381;
      v685.origin.CGFloat y = v373;
      v685.size.double width = v371;
      v685.size.CGFloat height = v370;
      CGFloat v391 = CGRectGetHeight(v685) * 0.5;
      v392 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      v393 = [v392 layer];
      [v393 setCornerRadius:v391];

      v686.origin.CGFloat x = v381;
      v686.origin.CGFloat y = v373;
      v686.size.double width = v371;
      v686.size.CGFloat height = v370;
      double v315 = CGRectGetMaxY(v686);
    }
    v394 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    [v394 alpha];
    double v396 = v395;

    double v651 = v315;
    if (v396 == 0.0)
    {
      if (v20)
      {
        [v3 bookCoverLeftMargin];
        v397 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
        [v397 margins];

        [v3 bookCoverSize];
      }
      [v3 reviewSpacing];
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v399 = v398;
      double v401 = v400;
      double v403 = v402;
      double v405 = v404;
      v406 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v406 setFrame:v399, v401, v403, v405];

      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v408 = v407;
      double v410 = v409;
      double v412 = v411;
      double v414 = v413;
      v415 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v415 setFrame:v408, v410, v412, v414];

      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v417 = v416;
      double v419 = v418;
      double v421 = v420;
      double v423 = v422;
      v424 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v424 setFrame:v417, v419, v421, v423];

      double v425 = v315;
    }
    else
    {
      double v426 = v616;
      if (v20)
      {
        v687.origin.CGFloat x = x;
        v687.size.CGFloat height = v643;
        v687.origin.CGFloat y = y;
        v687.size.double width = rect;
        double v427 = CGRectGetWidth(v687);
        [v3 bookCoverLeftMargin];
        double v429 = v427 - v428;
        v430 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
        [v430 margins];
        double v426 = v429 + v431 * -2.0;
      }
      [v3 reviewLeftMargin];
      CGFloat v617 = v426;
      double v433 = v426 - v432;
      [v3 reviewRightMargin];
      double v435 = v433 - v434;
      unsigned int v436 = [(BKLibraryBookshelfFinishedBookCell *)self finishedState];
      v437 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      v438 = v437;
      if (v436 == 7)
      {
        [v437 setExpanded:1];

        v439 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
        v440 = [v439 text];
        v441 = [v3 reviewContentFontAttributes];
        v442 = [v441 attributes];
        [v440 boundingRectWithSize:1 options:v442 attributes:0 context:v435];
        double v443 = CGRectGetHeight(v688);
      }
      else
      {
        [v437 setExpanded:0];

        v439 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
        [v439 sizeThatFits:v435];
        double v443 = v444;
      }

      v445 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v445 sizeThatFits:v435, 1.79769313e308];
      double v447 = v446;

      CGFloat v635 = v435;
      if (v20)
      {
        [v3 bookCoverLeftMargin];
        double v449 = v448;
        v450 = [(BKLibraryBookshelfFinishedBookCell *)self columnMetrics];
        [v450 margins];
        double v637 = v449 + v451;

        [v3 bookCoverSize];
        double v453 = v452;
        [v3 moreHeight];
        double v455 = v315 + v454;
        [v3 moreSpacing];
        double v457 = v455 + v456;
        if (v453 >= v457) {
          double v315 = v453;
        }
        else {
          double v315 = v457;
        }
      }
      [v3 reviewSpacing];
      double v459 = v315 + v458;
      [v3 reviewTopMargin];
      double v461 = v443 + v460;
      [v3 reviewBottomMargin];
      CGFloat v463 = v447 + v461 + v462;
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      CGFloat v626 = v447;
      IMRectFlippedForRTL();
      double v465 = v464;
      double v467 = v466;
      double v469 = v468;
      double v471 = v470;
      v472 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v472 setFrame:v465, v467, v469, v471];

      v689.origin.CGFloat x = v637;
      v689.origin.CGFloat y = v459;
      v689.size.double width = v617;
      v689.size.CGFloat height = v463;
      double v473 = CGRectGetMinX(v689);
      [v3 reviewLeftMargin];
      CGFloat v475 = v473 + v474;
      v690.origin.CGFloat x = v637;
      CGFloat v619 = v463;
      v690.origin.CGFloat y = v459;
      v690.size.double width = v617;
      v690.size.CGFloat height = v463;
      double v476 = CGRectGetMinY(v690);
      [v3 reviewTopMargin];
      CGFloat v478 = v476 + v477;
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v480 = v479;
      double v482 = v481;
      double v484 = v483;
      double v486 = v485;
      v487 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
      [v487 setFrame:v480, v482, v484, v486];

      v691.origin.CGFloat x = v475;
      v691.origin.CGFloat y = v478;
      v691.size.double width = v635;
      v691.size.CGFloat height = v626;
      CGRectGetMaxY(v691);
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      double v489 = v488;
      double v491 = v490;
      double v493 = v492;
      double v495 = v494;
      v496 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
      [v496 setFrame:v489, v491, v493, v495];

      double v425 = v651;
      if ((v20 & 1) == 0)
      {
        v692.origin.CGFloat x = v637;
        v692.size.CGFloat height = v619;
        v692.origin.CGFloat y = v459;
        v692.size.double width = v617;
        double v425 = CGRectGetMaxY(v692);
      }
    }
    double v652 = v425;
    v497 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
    [v497 sizeThatFits:1.79769313e308, 1.79769313e308];
    CGFloat v636 = v498;

    [v3 moreHeight];
    CGFloat v639 = v499;
    [v3 moreSpacing];
    CGFloat v633 = v425 + v500;
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v502 = v501;
    double v504 = v503;
    double v506 = v505;
    double v508 = v507;
    v509 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
    [v509 setFrame:v502, v504, v506, v508];

    [v3 moreSpacing];
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v511 = v510;
    double v513 = v512;
    double v515 = v514;
    double v517 = v516;
    v518 = [(BKLibraryBookshelfFinishedBookCell *)self downloadProgressButton];
    [v518 setFrame:v511, v513, v515, v517];

    v519 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
    v520 = [v519 image];
    [v520 size];

    v693.origin.CGFloat x = v641;
    v693.origin.CGFloat y = v633;
    v693.size.double width = v636;
    v693.size.CGFloat height = v639;
    CGRectGetMaxX(v693);
    [v3 cloudSpacing];
    v694.origin.CGFloat x = v641;
    v694.origin.CGFloat y = v633;
    v694.size.double width = v636;
    v694.size.CGFloat height = v639;
    CGRectGetMinY(v694);
    [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
    IMRectFlippedForRTL();
    double v522 = v521;
    double v524 = v523;
    double v526 = v525;
    double v528 = v527;
    v529 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
    double v530 = v522;
    double v249 = v652;
    [v529 setFrame:v530, v524, v526, v528];
  }
  v695.origin.CGFloat y = v628;
  v695.origin.CGFloat x = v629;
  v695.size.double width = v627;
  v695.size.CGFloat height = v630;
  float v531 = (CGRectGetHeight(v695) - v249) * 0.5;
  float v532 = floorf(v531);
  if (v532 > 1.0)
  {
    double v533 = v532;
    v534 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    [v534 frame];
    CGRect v697 = CGRectOffset(v696, 0.0, v533);
    double v535 = v697.origin.x;
    double v536 = v697.origin.y;
    double v537 = v697.size.width;
    double v538 = v697.size.height;
    v539 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    [v539 setFrame:v535, v536, v537, v538];

    v540 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    [v540 frame];
    CGRect v699 = CGRectOffset(v698, 0.0, v533);
    double v541 = v699.origin.x;
    double v542 = v699.origin.y;
    double v543 = v699.size.width;
    double v544 = v699.size.height;
    v545 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    [v545 setFrame:v541, v542, v543, v544];

    v546 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v546 frame];
    CGRect v701 = CGRectOffset(v700, 0.0, v533);
    double v547 = v701.origin.x;
    double v548 = v701.origin.y;
    double v549 = v701.size.width;
    double v550 = v701.size.height;
    v551 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v551 setFrame:v547, v548, v549, v550];

    if (![(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
    {
      v552 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v552 frame];
      CGRect v703 = CGRectOffset(v702, 0.0, v533);
      double v553 = v703.origin.x;
      double v554 = v703.origin.y;
      double v555 = v703.size.width;
      double v556 = v703.size.height;
      v557 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      [v557 setFrame:v553, v554, v555, v556];

      v558 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v558 frame];
      CGRect v705 = CGRectOffset(v704, 0.0, v533);
      double v559 = v705.origin.x;
      double v560 = v705.origin.y;
      double v561 = v705.size.width;
      double v562 = v705.size.height;
      v563 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      [v563 setFrame:v559, v560, v561, v562];

      v564 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
      [v564 frame];
      CGRect v707 = CGRectOffset(v706, 0.0, v533);
      double v565 = v707.origin.x;
      double v566 = v707.origin.y;
      double v567 = v707.size.width;
      double v568 = v707.size.height;
      v569 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
      [v569 setFrame:v565, v566, v567, v568];

      v570 = [(BKLibraryBookshelfFinishedBookCell *)self downloadProgressButton];
      [v570 frame];
      CGRect v709 = CGRectOffset(v708, 0.0, v533);
      double v571 = v709.origin.x;
      double v572 = v709.origin.y;
      double v573 = v709.size.width;
      double v574 = v709.size.height;
      v575 = [(BKLibraryBookshelfFinishedBookCell *)self downloadProgressButton];
      [v575 setFrame:v571, v572, v573, v574];

      v576 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
      [v576 frame];
      CGRect v711 = CGRectOffset(v710, 0.0, v533);
      double v577 = v711.origin.x;
      double v578 = v711.origin.y;
      double v579 = v711.size.width;
      double v580 = v711.size.height;
      v581 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
      [v581 setFrame:v577, v578, v579, v580];

      if ((v20 & 1) == 0)
      {
        v582 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
        [v582 frame];
        CGRect v713 = CGRectOffset(v712, 0.0, v533);
        double v583 = v713.origin.x;
        double v584 = v713.origin.y;
        double v585 = v713.size.width;
        double v586 = v713.size.height;
        v587 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
        [v587 setFrame:v583, v584, v585, v586];

        v588 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
        [v588 frame];
        CGRect v715 = CGRectOffset(v714, 0.0, v533);
        double v589 = v715.origin.x;
        double v590 = v715.origin.y;
        double v591 = v715.size.width;
        double v592 = v715.size.height;
        v593 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
        [v593 setFrame:v589, v590, v591, v592];

        v594 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
        [v594 frame];
        CGRect v717 = CGRectOffset(v716, 0.0, v533);
        double v595 = v717.origin.x;
        double v596 = v717.origin.y;
        double v597 = v717.size.width;
        double v598 = v717.size.height;
        v599 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
        [v599 setFrame:v595, v596, v597, v598];
      }
    }
  }
  v600 = [(BKLibraryBookshelfCollectionViewCell *)self audiobookControl];
  if (v600)
  {
    [v3 audiobookControlMargin];
    double v602 = v601;
    [v600 frame];
    CGFloat v604 = v603;
    double v606 = v605;
    [(BKLibraryBookshelfFinishedBookCell *)self coverContainerFrame];
    CGFloat v607 = v602 + v718.origin.x;
    CGFloat v608 = v718.origin.y + CGRectGetHeight(v718) - v606 - v602;
    [v600 frame];
    v720.origin.CGFloat x = v607;
    v720.origin.CGFloat y = v608;
    v720.size.double width = v604;
    v720.size.CGFloat height = v606;
    if (!CGRectEqualToRect(v719, v720))
    {
      [(BKLibraryBookshelfFinishedBookCell *)self isRTL];
      IMRectFlippedForRTL();
      [v600 setFrame:];
    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v126.receiver = self;
  v126.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  id v4 = a3;
  [(BKLibraryBookshelfCollectionViewCell *)&v126 applyLayoutAttributes:v4];
  objc_opt_class();
  double v5 = BUDynamicCast();
  double v6 = [v4 indexPath];

  [(BKLibraryBookshelfFinishedBookCell *)self setIndexPath:v6];
  double v7 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfFinishedBookCell setIsRTL:](self, "setIsRTL:", [v7 userInterfaceLayoutDirection] == (id)1);

  double v8 = [v5 columnMetrics];
  [(BKLibraryBookshelfFinishedBookCell *)self setColumnMetrics:v8];

  -[BKLibraryBookshelfFinishedBookCell setLayoutDebugMode:](self, "setLayoutDebugMode:", [v5 layoutDebugMode]);
  if ([(BKLibraryBookshelfFinishedBookCell *)self layoutDebugMode])
  {
    double v9 = +[UIColor redColor];
    id v10 = [v9 colorWithAlphaComponent:0.2];
    id v11 = [v10 CGColor];
    double v12 = [(BKLibraryBookshelfFinishedBookCell *)self layer];
    [v12 setBorderColor:v11];

    double v13 = [(BKLibraryBookshelfFinishedBookCell *)self layer];
    [v13 setBorderWidth:0.5];

    double v14 = +[UIColor redColor];
    id v15 = [v14 colorWithAlphaComponent:0.2];
    id v16 = [v15 CGColor];
    double v17 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    double v18 = [v17 layer];
    [v18 setBorderColor:v16];

    double v19 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    unsigned int v20 = [v19 layer];
    [v20 setBorderWidth:0.5];

    double v21 = +[UIColor redColor];
    id v22 = [v21 colorWithAlphaComponent:0.2];
    id v23 = [v22 CGColor];
    double v24 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    double v25 = [v24 layer];
    [v25 setBorderColor:v23];

    CGFloat v26 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    double v27 = [v26 layer];
    [v27 setBorderWidth:0.5];

    double v28 = +[UIColor redColor];
    id v29 = [v28 colorWithAlphaComponent:0.2];
    id v30 = [v29 CGColor];
    double v31 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
    [v31 setBorderColor:v30];

    double v32 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
    [v32 setBorderWidth:0.5];

    double v33 = +[UIColor redColor];
    id v34 = [v33 colorWithAlphaComponent:0.2];
    id v35 = [v34 CGColor];
    CGFloat v36 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    double v37 = [v36 layer];
    [v37 setBorderColor:v35];

    double v38 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    double v39 = [v38 layer];
    [v39 setBorderWidth:0.5];
  }
  else
  {
    double v40 = [(BKLibraryBookshelfFinishedBookCell *)self layer];
    [v40 setBorderWidth:0.0];

    double v41 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    double v42 = [v41 layer];
    [v42 setBorderWidth:0.0];

    double v43 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    double v44 = [v43 layer];
    [v44 setBorderWidth:0.0];

    double v38 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
    [v38 setBorderWidth:0.0];
  }

  -[BKLibraryBookshelfFinishedBookCell setFirstItem:](self, "setFirstItem:", [v5 firstItem]);
  -[BKLibraryBookshelfFinishedBookCell setLastItem:](self, "setLastItem:", [v5 lastItem]);
  double v45 = 1.0;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    if ([(BKLibraryBookshelfFinishedBookCell *)self isSelected]) {
      double v45 = 1.0;
    }
    else {
      double v45 = 0.6;
    }
  }
  double v46 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
  [v46 setAlpha:v45];

  objc_opt_class();
  double v47 = [v5 cellMetrics];
  double v48 = BUDynamicCast();

  double v49 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];

  if (v48 != v49)
  {
    [(BKLibraryBookshelfFinishedBookCell *)self setFinishedMetrics:v48];
    [(BKLibraryBookshelfFinishedBookCell *)self setMetrics:v48];
    [v48 bookCoverSize];
    -[BKLibraryBookshelfFinishedBookCell setBookCoverSize:](self, "setBookCoverSize:");
    [v48 bookCoverLeftMargin];
    -[BKLibraryBookshelfFinishedBookCell setBookCoverLeftMargin:](self, "setBookCoverLeftMargin:");
    [v48 titleMaxLines];
    uint64_t v51 = (uint64_t)v50;
    double v52 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    [v52 setNumberOfLines:v51];

    [v48 authorMaxLines];
    uint64_t v54 = (uint64_t)v53;
    CGFloat v55 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    [v55 setNumberOfLines:v54];

    double v56 = [v48 finishedFillColor];
    double v57 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v57 setNormalBackgroundColor:v56];

    id v58 = [v48 finishedFillHilightColor];
    double v59 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v59 setHighlightBackgroundColor:v58];

    uint64_t v60 = [v48 finishedFrameColor];
    if (v60)
    {
      double v61 = (void *)v60;
      [v48 finishedFrameWidth];
      double v63 = v62;

      if (v63 != 0.0)
      {
        id v64 = [v48 finishedFrameColor];
        id v65 = [v64 CGColor];
        int v66 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
        double v67 = [v66 layer];
        [v67 setBorderColor:v65];

        [v48 finishedFrameWidth];
        double v69 = v68;
        double v70 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
        v71 = [v70 layer];
        [v71 setBorderWidth:v69];
      }
    }
    [v48 finishedTitleInset];
    double v73 = v72;
    [v48 finishedTitleInset];
    double v75 = v74;
    objc_super v76 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
    [v76 setTitleEdgeInsets:0.0, v73, 0.0, v75];

    double v77 = [v48 writeReviewFillColor];
    double v78 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
    [v78 setNormalBackgroundColor:v77];

    BOOL v79 = [v48 writeReviewFillHilightColor];
    v80 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
    [v80 setHighlightBackgroundColor:v79];

    uint64_t v81 = [v48 writeReviewFrameColor];
    if (v81)
    {
      double v82 = (void *)v81;
      [v48 writeReviewFrameWidth];
      double v84 = v83;

      if (v84 != 0.0)
      {
        id v85 = [v48 writeReviewFrameColor];
        id v86 = [v85 CGColor];
        double v87 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
        double v88 = [v87 layer];
        [v88 setBorderColor:v86];

        [v48 writeReviewFrameWidth];
        double v90 = v89;
        CGFloat v91 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
        CGFloat v92 = [v91 layer];
        [v92 setBorderWidth:v90];
      }
    }
    [v48 writeReviewTitleInset];
    double v94 = v93;
    [v48 writeReviewTitleInset];
    double v96 = v95;
    double v97 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
    [v97 setTitleEdgeInsets:0.0, v94, 0.0, v96];

    double v98 = [v48 ratingFrameColor];
    double v99 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v99 setFrameColor:v98];

    double v100 = [v48 ratingFillColor];
    double v101 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v101 setFillColor:v100];

    double v102 = [v48 ratingEmptyColor];
    double v103 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v103 setEmptyColor:v102];

    double v104 = +[UIColor bc_booksTableSelectionColor];
    [(BKLibraryBookshelfCollectionViewCell *)self setHighlightBackgroundColor:v104];

    double v105 = +[NSBundle mainBundle];
    double v106 = [v105 localizedStringForKey:@"More" value:&stru_100A70340 table:0];

    double v107 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    double v108 = [v107 reviewMoreFontAttributes];
    double v109 = +[TUIFontSpec attributedStringWith:v106 attributes:v108];
    double v110 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    [v110 setShowMoreAttributedText:v109];

    [(BKLibraryBookshelfFinishedBookCell *)self _updateTintedImages];
    [(BKLibraryBookshelfFinishedBookCell *)self _updateLibraryAsset];
  }
  [(BKLibraryBookshelfFinishedBookCell *)self updateFinishedState];
  [(BKLibraryBookshelfFinishedBookCell *)self setNeedsLayout];
  double v111 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];

  if (v111)
  {
    +[UIView inheritedAnimationDuration];
    double v113 = v112;
    BOOL v114 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
    double v115 = [v114 coverLayer];
    if (v113 == 0.0)
    {
      libraryAsset = self->_libraryAsset;
      [(BKLibraryBookshelfFinishedBookCell *)self coverArea];
      [v115 setLibraryAsset:libraryAsset size:v121 v122];
    }
    else
    {
      [(BKLibraryBookshelfFinishedBookCell *)self coverArea];
      [v115 preloadCoverImageAtSize:v116, v117];

      +[UIView inheritedAnimationDuration];
      dispatch_time_t v119 = dispatch_time(0, (uint64_t)(v118 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010FE4C;
      block[3] = &unk_100A43D60;
      block[4] = self;
      dispatch_after(v119, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    double v123 = [(BKLibraryBookshelfFinishedBookCell *)self coverView];
    double v124 = [v123 coverLayer];
    [v124 setAnimateFrameChange:1];

    [(BKLibraryBookshelfFinishedBookCell *)self layoutIfNeeded];
  }
}

- (void)_updateTintedImages
{
  uint64_t v3 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  if (v3)
  {
    id v4 = (void *)v3;
    double v5 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];

    if (v5)
    {
      double v6 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
      double v7 = [v6 reviewBackgroundName];
      id v69 = +[UIImage imageNamed:v7];

      if ([(BKLibraryBookshelfFinishedBookCell *)self isRTL])
      {
        uint64_t v8 = [v69 imageWithHorizontallyFlippedOrientation];

        id v69 = (id)v8;
      }
      double v9 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v9 setContentsGravity:kCAGravityResize];

      id v10 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      id v11 = [v10 reviewBGColor];
      double v12 = [(BKLibraryBookshelfFinishedBookCell *)self traitCollection];
      id v13 = [v69 imageMaskWithColor:v11 forTraitCollection:v12];
      id v14 = [v13 CGImage];
      id v15 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v15 setContents:v14];

      id v16 = [(BKLibraryBookshelfFinishedBookCell *)self reviewBackground];
      [v16 setContentsCenter:0.4, 0.4, 0.2, 0.2];

      double v17 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
      double v18 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v19 = [v18 moreTintColor];
      uint64_t v20 = [v17 actionMenuImageWithTintColor:v19];

      double v21 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
      double v68 = (void *)v20;
      [v21 setImage:v20 forState:0];

      id v22 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
      id v23 = [v22 templateCloudImageForCloudState:1];
      double v24 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
      [v24 setImage:v23];

      double v25 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      CGFloat v26 = [v25 moreTintColor];
      double v27 = [(BKLibraryBookshelfFinishedBookCell *)self cloudView];
      [v27 setTintColor:v26];

      double v28 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
      id v29 = [v28 selectedCheckmarkImageForSelectedState:[self isSelected]];
      id v30 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
      [v30 setImage:v29];

      if ([(BKLibraryBookshelfFinishedBookCell *)self isSelected]) {
        +[UIColor bc_booksKeyColor];
      }
      else {
      double v31 = +[UIColor bc_booksTertiaryLabelColor];
      }
      double v32 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
      [v32 setTintColor:v31];

      double v33 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      LODWORD(v31) = [v33 finishedShortText];
      id v34 = +[NSBundle mainBundle];
      id v35 = v34;
      if (v31) {
        CFStringRef v36 = @"FINISHED";
      }
      else {
        CFStringRef v36 = @"MARK FINISHED";
      }
      double v37 = [v34 localizedStringForKey:v36 value:&stru_100A70340 table:0];

      double v38 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      double v39 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v40 = [v39 finishedFontAttributes];
      double v41 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v42 = [v41 finishedTextColor];
      double v43 = [v40 attributesWithForegroundColor:v42];
      double v44 = +[TUIFontSpec attributedStringWith:v37 attributes:v43];
      [v38 setAttributedTitle:v44 forState:0];

      double v45 = [(BKLibraryBookshelfFinishedBookCell *)self markAsFinishedButton];
      double v46 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v47 = [v46 finishedFontAttributes];
      double v48 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v49 = [v48 finishedTextHilightColor];
      double v50 = [v47 attributesWithForegroundColor:v49];
      uint64_t v51 = +[TUIFontSpec attributedStringWith:v37 attributes:v50];
      [v45 setAttributedTitle:v51 forState:1];

      double v52 = +[NSBundle mainBundle];
      double v53 = [v52 localizedStringForKey:@"Write a Review" value:&stru_100A70340 table:0];

      uint64_t v54 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      CGFloat v55 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v56 = [v55 writeReviewFontAttributes];
      double v57 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      id v58 = [v57 writeReviewTextColor];
      double v59 = [v56 attributesWithForegroundColor:v58];
      uint64_t v60 = +[TUIFontSpec attributedStringWith:v53 attributes:v59];
      [v54 setAttributedTitle:v60 forState:0];

      double v61 = [(BKLibraryBookshelfFinishedBookCell *)self writeReviewButton];
      double v62 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      double v63 = [v62 writeReviewFontAttributes];
      id v64 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      id v65 = [v64 writeReviewTextHilightColor];
      int v66 = [v63 attributesWithForegroundColor:v65];
      double v67 = +[TUIFontSpec attributedStringWith:v53 attributes:v66];
      [v61 setAttributedTitle:v67 forState:1];

      [(BKLibraryBookshelfFinishedBookCell *)self setNeedsLayout];
    }
  }
}

- (void)_cancelDownload:(id)a3
{
  if ([(BKLibraryBookshelfFinishedBookCell *)self isDownloading])
  {
    id v6 = [(BKLibraryBookshelfFinishedBookCell *)self actionHandler];
    id v4 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
    [v6 bookCancelDownload:v4];
  }
  else
  {
    double v5 = BKLibraryUILog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1007EB37C(v5);
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
  {
    v11.receiver = self;
    v11.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
    [(BKLibraryBookshelfFinishedBookCell *)&v11 setSelected:v3];
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]
      && ![(BKLibraryBookshelfFinishedBookCell *)self isSelected])
    {
      double v5 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
      [v5 shrinkAlpha];
      -[BKLibraryBookshelfCollectionViewCell setAlpha:](self, "setAlpha:");
    }
    else
    {
      [(BKLibraryBookshelfCollectionViewCell *)self setAlpha:1.0];
    }
    id v6 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
    double v7 = [v6 selectedCheckmarkImageForSelectedState:v3];
    uint64_t v8 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
    [v8 setImage:v7];

    if (v3) {
      +[UIColor bc_booksKeyColor];
    }
    else {
    double v9 = +[UIColor bc_booksTertiaryLabelColor];
    }
    id v10 = [(BKLibraryBookshelfFinishedBookCell *)self checkmarkView];
    [v10 setTintColor:v9];
  }
}

- (CGPath)pathForDateIndicator:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(BKLibraryBookshelfFinishedBookCell *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  id v16 = +[UIBezierPath bezierPath];
  v41.origin.CGFloat x = v9;
  v41.origin.CGFloat y = v11;
  v41.size.CGFloat width = v13;
  v41.size.CGFloat height = v15;
  double v17 = CGRectGetHeight(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v42);
  double v19 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  [v19 datelineCircleSize];
  double v21 = v20;

  unsigned __int8 v22 = [(BKLibraryBookshelfFinishedBookCell *)self firstItem];
  unsigned __int8 v23 = [(BKLibraryBookshelfFinishedBookCell *)self lastItem];
  unsigned int v24 = [(BKLibraryBookshelfFinishedBookCell *)self finishedState];
  [v16 addArcWithCenter:1, 0.0, MidY, v21, 0.0, 6.28318531];
  if ((v22 & 1) == 0)
  {
    [v16 moveToPoint:0.0, 0.0];
    [v16 addLineToPoint:0.0, MidY - v21];
  }
  if ((v23 & 1) == 0)
  {
    [v16 moveToPoint:0.0, MidY + v21];
    [v16 addLineToPoint:0.0, v17];
  }
  double v25 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  id v26 = [v25 datelineColor];
  id v27 = [v26 CGColor];
  double v28 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
  [v28 setStrokeColor:v27];

  id v29 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  id v30 = v29;
  if (v24 == 1) {
    [v29 datelineCircleHollowColor];
  }
  else {
  id v31 = [v29 datelineCircleFilledColor];
  }
  id v32 = [v31 CGColor];
  double v33 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
  [v33 setFillColor:v32];

  id v34 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
  [v34 datelineWidth];
  double v36 = v35;
  double v37 = [(BKLibraryBookshelfFinishedBookCell *)self dateIndicator];
  [v37 setLineWidth:v36];

  id v38 = v16;
  double v39 = (CGPath *)[v38 CGPath];

  return v39;
}

- (void)setLibraryAsset:(id)a3
{
  CGFloat v15 = (BKLibraryAsset *)a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  p_libraryAsset = &self->_libraryAsset;
  libraryAsset = self->_libraryAsset;
  double v7 = v15;
  if (libraryAsset != v15)
  {
    [(BKLibraryAsset *)libraryAsset removeObserver:self forKeyPath:@"isFinished" context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"notFinished" context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"dateFinished" context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"title" context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset removeObserver:self forKeyPath:@"author" context:off_100B1EA50];
    objc_storeStrong((id *)&self->_libraryAsset, a3);
    double v8 = [(BKLibraryBookshelfFinishedBookCell *)self coverLayer];
    CGFloat v9 = *p_libraryAsset;
    [(BKLibraryBookshelfFinishedBookCell *)self coverArea];
    [v8 setLibraryAsset:v9 size:v10 v11];

    if (*p_libraryAsset)
    {
      double v12 = +[BKLibraryAssetStatusController sharedController];
      CGFloat v13 = [(BKLibraryAsset *)*p_libraryAsset permanentOrTemporaryAssetID];
      double v14 = [v12 statusForAssetID:v13];
      [(BKLibraryBookshelfFinishedBookCell *)self setLibraryDownloadStatus:v14];
    }
    else
    {
      [(BKLibraryBookshelfFinishedBookCell *)self setLibraryDownloadStatus:0];
    }
    [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"isFinished" options:0 context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"notFinished" options:0 context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"dateFinished" options:0 context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"title" options:0 context:off_100B1EA50];
    [(BKLibraryAsset *)*p_libraryAsset addObserver:self forKeyPath:@"author" options:0 context:off_100B1EA50];
    [(BKLibraryBookshelfFinishedBookCell *)self _updateLibraryAsset];
    double v7 = v15;
  }
}

- (void)setLibraryDownloadStatus:(id)a3
{
  double v5 = (BKLibraryDownloadStatus *)a3;
  p_libraryDownloadStatus = &self->_libraryDownloadStatus;
  libraryDownloadStatus = self->_libraryDownloadStatus;
  if (libraryDownloadStatus != v5)
  {
    double v8 = v5;
    [(BKLibraryDownloadStatus *)libraryDownloadStatus removeObserver:self forKeyPath:@"combinedState" context:off_100B1EA40];
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus removeObserver:self forKeyPath:@"progressValue" context:off_100B1EA48];
    objc_storeStrong((id *)&self->_libraryDownloadStatus, a3);
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus addObserver:self forKeyPath:@"combinedState" options:0 context:off_100B1EA40];
    [(BKLibraryDownloadStatus *)*p_libraryDownloadStatus addObserver:self forKeyPath:@"progressValue" options:0 context:off_100B1EA48];
    double v5 = v8;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if (off_100B1EA50 == a6)
  {
    CGFloat v13 = [(BKLibraryBookshelfFinishedBookCell *)self coalescedPropertyChange];
    [v13 signalWithCompletion:&stru_100A47498];

    goto LABEL_14;
  }
  if (off_100B1EA58 == a6)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10011102C;
    v22[3] = &unk_100A43F68;
    double v14 = &v23;
    objc_copyWeak(&v23, &location);
    CGFloat v15 = v22;
LABEL_10:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    objc_destroyWeak(v14);
    goto LABEL_14;
  }
  if (off_100B1EA60 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001110BC;
    block[3] = &unk_100A43F68;
    double v14 = &v21;
    objc_copyWeak(&v21, &location);
    CGFloat v15 = block;
    goto LABEL_10;
  }
  if (off_100B1EA40 == a6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100111154;
    v19[3] = &unk_100A43D60;
    v19[4] = self;
    id v16 = v19;
LABEL_13:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
    goto LABEL_14;
  }
  if (off_100B1EA48 == a6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100111190;
    v18[3] = &unk_100A43D60;
    v18[4] = self;
    id v16 = v18;
    goto LABEL_13;
  }
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfFinishedBookCell;
  [(BKLibraryBookshelfFinishedBookCell *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_14:
  objc_destroyWeak(&location);
}

- (void)configureCombinedDate:(id)a3
{
  id v26 = a3;
  if (qword_100B4A3A8 != -1) {
    dispatch_once(&qword_100B4A3A8, &stru_100A474B8);
  }
  id v4 = +[NSCalendar currentCalendar];
  double v5 = +[NSLocale currentLocale];
  if (![v4 isEqual:qword_100B4A398]
    || ([v5 isEqual:qword_100B4A3A0] & 1) == 0)
  {
    sub_1001114F8();
  }
  id v6 = (void *)qword_100B4A380;
  double v7 = +[NSDate date];
  double v8 = [v6 stringFromDate:v7];

  CGFloat v9 = (void *)qword_100B4A380;
  id v10 = [v26 dateFinished];
  id v11 = [v9 stringFromDate:v10];

  id v12 = (void *)qword_100B4A378;
  CGFloat v13 = [v26 dateFinished];
  double v14 = [v12 stringFromDate:v13];

  unsigned __int8 v15 = [v11 isEqualToString:v8];
  if (_os_feature_enabled_impl() && [v26 finishedDateKind] == 2)
  {
    id v16 = (void *)qword_100B4A388;
    objc_super v17 = [v26 dateFinished];
    uint64_t v18 = [v16 stringFromDate:v17];

    double v19 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    [v19 setNumberOfLines:1];

    double v20 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    [v20 setText:v18];
    id v11 = (void *)v18;
  }
  else
  {
    id v21 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
    unsigned __int8 v22 = v21;
    if (v15)
    {
      [v21 setNumberOfLines:1];

      double v20 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
      [v20 setText:v14];
    }
    else
    {
      [v21 setNumberOfLines:2];

      double v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", qword_100B4A390, v14, v11);
      id v23 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
      [v23 setText:v20];
    }
  }

  if ([(BKLibraryBookshelfFinishedBookCell *)self isRTL]) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = 2;
  }
  double v25 = [(BKLibraryBookshelfFinishedBookCell *)self combinedDateLabel];
  [v25 setTextAlignment:v24];
}

- (void)_updateLibraryAsset
{
  id v15 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  if (v15)
  {
    BOOL v3 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    id v4 = [v3 titleFontAttributes];
    double v5 = [v4 attributesWithTruncated:1];

    id v6 = [(BKLibraryBookshelfFinishedBookCell *)self titleLabel];
    double v7 = [v15 title];
    double v8 = +[TUIFontSpec attributedStringWith:v7 attributes:v5];
    [v6 setAttributedText:v8];

    CGFloat v9 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    id v10 = [v9 authorFontAttributes];
    id v11 = [v10 attributesWithTruncated:1];

    id v12 = [(BKLibraryBookshelfFinishedBookCell *)self authorLabel];
    CGFloat v13 = [v15 displayAuthor];
    double v14 = +[TUIFontSpec attributedStringWith:v13 attributes:v11];
    [v12 setAttributedText:v14];

    [(BKLibraryBookshelfFinishedBookCell *)self configureCombinedDate:v15];
    [(BKLibraryBookshelfFinishedBookCell *)self updateRatingAndReview];
    [(BKLibraryBookshelfFinishedBookCell *)self setNeedsLayout];
  }
}

- (void)setAssetReview:(id)a3
{
  id v6 = (BCAssetReview *)a3;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  double v5 = v6;
  if (self->_assetReview != v6)
  {
    objc_storeStrong((id *)&self->_assetReview, a3);
    [(BKLibraryBookshelfFinishedBookCell *)self updateRatingAndReview];
    double v5 = v6;
  }
}

- (void)updateRatingAndReview
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  BOOL v3 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
  id v19 = v3;
  if (v3)
  {
    [v3 normalizedStarRating];
    double v5 = v4;
    id v6 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v6 setRating:v5];

    double v7 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
    double v8 = [v19 reviewTitle];
    CGFloat v9 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    id v10 = [v9 reviewTitleFontAttributes];
    id v11 = +[TUIFontSpec attributedStringWith:v8 attributes:v10];
    [v7 setAttributedText:v11];

    id v12 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    CGFloat v13 = [v19 reviewBody];
    double v14 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    id v15 = [v14 reviewContentFontAttributes];
    id v16 = +[TUIFontSpec attributedStringWith:v13 attributes:v15];
    [v12 setAttributedText:v16];
  }
  else
  {
    objc_super v17 = [(BKLibraryBookshelfFinishedBookCell *)self starRating];
    [v17 setRating:0.0];

    uint64_t v18 = [(BKLibraryBookshelfFinishedBookCell *)self reviewTitle];
    [v18 setText:0];

    id v12 = [(BKLibraryBookshelfFinishedBookCell *)self reviewComments];
    [v12 setAttributedText:0];
  }

  [(BKLibraryBookshelfFinishedBookCell *)self updateFinishedState];
}

- (void)updateFinishedState
{
  BOOL v3 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];

  if (v3)
  {
    double v4 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
    double v5 = [v4 currentStoreAccountID];
    id v15 = [v5 stringValue];

    id v6 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
    double v7 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
    double v8 = [(BKLibraryBookshelfFinishedBookCell *)self storageProvider];
    uint64_t v9 = +[BKLibraryBookshelfFinishedBookCell finishedStateForAsset:v6 assetReview:v7 storeID:v15 storageProvider:v8];

    objc_opt_class();
    id v10 = [(BKLibraryBookshelfFinishedBookCell *)self storageProvider];
    id v11 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
    id v12 = [v11 permanentOrTemporaryAssetID];
    CGFloat v13 = [v10 retrieveValueForKey:@"kExpandReviewText" forConsumer:v12];
    double v14 = BUDynamicCast();

    -[BKLibraryBookshelfFinishedBookCell setShowFullReviewText:](self, "setShowFullReviewText:", [v14 BOOLValue]);
    if (v9 == 6)
    {
      if ([(BKLibraryBookshelfFinishedBookCell *)self showFullReviewText]) {
        uint64_t v9 = 7;
      }
      else {
        uint64_t v9 = 6;
      }
    }
    if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode])
    {
      if ((v9 - 4) > 3) {
        uint64_t v9 = 9;
      }
      else {
        uint64_t v9 = dword_10085C980[(int)v9 - 4];
      }
    }
    [(BKLibraryBookshelfFinishedBookCell *)self setFinishedState:v9];
  }
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);

  [(BKLibraryBookshelfFinishedBookCell *)self _updateTintedImages];
}

- (void)setAudiobookStatus:(id)a3
{
  double v5 = (AEAssetAudiobookStatus *)a3;
  p_audiobookStatus = &self->_audiobookStatus;
  audiobookStatus = self->_audiobookStatus;
  if (audiobookStatus != v5)
  {
    uint64_t v9 = v5;
    if (audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" context:off_100B1EA58];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus removeObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" context:off_100B1EA60];
    }
    objc_storeStrong((id *)&self->_audiobookStatus, a3);
    if (*p_audiobookStatus)
    {
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusIsPlaying" options:0 context:off_100B1EA58];
      [(AEAssetAudiobookStatus *)*p_audiobookStatus addObserver:self forKeyPath:@"assetAudiobookStatusTrackProgress" options:0 context:off_100B1EA60];
    }
    double v8 = [(BKLibraryBookshelfFinishedBookCell *)self finishedMetrics];
    [v8 audiobookControlDiameter];
    -[BKLibraryBookshelfCollectionViewCell updateAudiobookControlWithStatus:diameter:](self, "updateAudiobookControlWithStatus:diameter:", v9);

    double v5 = v9;
  }
}

- (BOOL)shouldShowCloud
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 0;
  }
  double v4 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  if ([v4 isCloud])
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    double v5 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
    unsigned __int8 v3 = [v5 isNonLocalSample];
  }
  return v3;
}

- (BOOL)shouldShowDownloadProgressButton
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 0;
  }

  return [(BKLibraryBookshelfFinishedBookCell *)self isDownloading];
}

- (BOOL)shouldShowMoreButton
{
  if ([(BKLibraryBookshelfCollectionViewCell *)self isInEditMode]) {
    return 0;
  }
  else {
    return ![(BKLibraryBookshelfFinishedBookCell *)self isDownloading];
  }
}

- (BOOL)isDownloading
{
  unsigned __int8 v3 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
  if ([v3 isDownloading])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    double v5 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
    unsigned __int8 v4 = [v5 isDownloadingSupplementalContent];
  }
  return v4;
}

- (void)starRatingDidChange:(id)a3 rating:(double)a4
{
  id v6 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
  [v6 normalizedStarRating];
  double v8 = v7;

  if (v8 != a4)
  {
    id v24 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
    uint64_t v9 = [v24 currentStoreAccountID];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
      id v12 = [v11 storeID];

      if (!v12) {
        return;
      }
      uint64_t v13 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
      if (v13)
      {
        double v14 = (void *)v13;
        id v15 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
        if ([v15 starRating])
        {
          id v16 = [(BKLibraryBookshelfFinishedBookCell *)self assetReview];
          objc_super v17 = [v16 reviewTitle];
          id v18 = [v17 length];

          if (v18)
          {
LABEL_13:
            unsigned __int8 v22 = [(BKLibraryBookshelfFinishedBookCell *)self actionHandler];
            id v23 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100112208;
            v25[3] = &unk_100A44268;
            v25[4] = self;
            [v22 bookUpdateStarRating:v23 rating:v25 completion:a4];

            return;
          }
        }
        else
        {
        }
      }
      id v19 = [(BKLibraryBookshelfFinishedBookCell *)self storageProvider];
      double v20 = [(BKLibraryBookshelfFinishedBookCell *)self libraryAsset];
      id v21 = [v20 permanentOrTemporaryAssetID];
      [v19 storeValue:&__kCFBooleanTrue forKey:@"kStarRatedThisSession" forConsumer:v21];

      goto LABEL_13;
    }
  }
}

- (BOOL)shouldDragWithTouch:(id)a3
{
  return 0;
}

- (void)setupMenuWithLibraryAsset:(id)a3 withActionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  uint64_t v9 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
  id v10 = [v9 collection];
  id v19 = [v6 analyticsAssetPropertyProviderForLibraryAsset:v7 fromSourceView:v8 inCollection:v10];

  id v11 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  id v12 = [v6 tracker];
  [v11 setupAppAnalyticsReportingUsingTracker:v12 withPropertyProvider:v19];

  uint64_t v13 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  [v13 setShowsMenuAsPrimaryAction:1];

  double v14 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  id v15 = [(BKLibraryBookshelfFinishedBookCell *)self dataSource];
  id v16 = [v15 collection];
  objc_super v17 = [v6 menuWithLibraryAsset:v7 sourceView:v14 collection:v16];

  id v18 = [(BKLibraryBookshelfFinishedBookCell *)self moreButton];
  [v18 setMenu:v17];
}

- (void)togglePlayPause:(id)a3
{
  id v3 = [(BKLibraryBookshelfFinishedBookCell *)self audiobookStatus];
  [v3 assetAudiobookStatusTogglePlayPause];
}

- (void)setCoverView:(id)a3
{
}

- (BKLibraryAsset)libraryAsset
{
  return self->_libraryAsset;
}

- (BKLibraryBookshelfSupplementaryDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BKLibraryBookshelfSupplementaryDataSource *)WeakRetained;
}

- (BKLibraryBookshelfCellMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
}

- (BKLibraryBookshelfStorageProvider)storageProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageProvider);

  return (BKLibraryBookshelfStorageProvider *)WeakRetained;
}

- (void)setStorageProvider:(id)a3
{
}

- (BKLibraryBookshelfLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (BKLibraryBookshelfLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (BKLibraryActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (BKLibraryActionHandler *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (AEAssetAudiobookStatus)audiobookStatus
{
  return self->_audiobookStatus;
}

- (BCAssetReview)assetReview
{
  return self->_assetReview;
}

- (int)layoutDebugMode
{
  return self->_layoutDebugMode;
}

- (void)setLayoutDebugMode:(int)a3
{
  self->_layoutDebugMode = a3;
}

- (CGSize)bookCoverSize
{
  double width = self->_bookCoverSize.width;
  double height = self->_bookCoverSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBookCoverSize:(CGSize)a3
{
  self->_bookCoverSize = a3;
}

- (double)bookCoverLeftMargin
{
  return self->_bookCoverLeftMargin;
}

- (void)setBookCoverLeftMargin:(double)a3
{
  self->_bookCoverLeftMargin = a3;
}

- (BKLibraryBookshelfCellMetrics_Finished)finishedMetrics
{
  return self->_finishedMetrics;
}

- (void)setFinishedMetrics:(id)a3
{
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (UIImageView)cloudView
{
  return self->_cloudView;
}

- (void)setCloudView:(id)a3
{
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

- (IMTouchInsetsButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
}

- (UILabel)combinedDateLabel
{
  return self->_combinedDateLabel;
}

- (void)setCombinedDateLabel:(id)a3
{
}

- (CAShapeLayer)dateIndicator
{
  return self->_dateIndicator;
}

- (void)setDateIndicator:(id)a3
{
}

- (CALayer)reviewBackground
{
  return self->_reviewBackground;
}

- (void)setReviewBackground:(id)a3
{
}

- (UILabel)reviewTitle
{
  return self->_reviewTitle;
}

- (void)setReviewTitle:(id)a3
{
}

- (IMExpandingLabel)reviewComments
{
  return self->_reviewComments;
}

- (void)setReviewComments:(id)a3
{
}

- (BCLibraryButton)markAsFinishedButton
{
  return self->_markAsFinishedButton;
}

- (void)setMarkAsFinishedButton:(id)a3
{
}

- (BKLibraryStarRating)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(id)a3
{
}

- (BCLibraryButton)writeReviewButton
{
  return self->_writeReviewButton;
}

- (void)setWriteReviewButton:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedPropertyChange
{
  return self->_coalescedPropertyChange;
}

- (void)setCoalescedPropertyChange:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (BOOL)firstItem
{
  return self->_firstItem;
}

- (void)setFirstItem:(BOOL)a3
{
  self->_firstItem = a3;
}

- (BOOL)lastItem
{
  return self->_lastItem;
}

- (void)setLastItem:(BOOL)a3
{
  self->_lastItem = a3;
}

- (BOOL)showFullReviewText
{
  return self->_showFullReviewText;
}

- (void)setShowFullReviewText:(BOOL)a3
{
  self->_showFullReviewText = a3;
}

- (int)finishedState
{
  return self->_finishedState;
}

- (IMRadialProgressButton)downloadProgressButton
{
  return self->_downloadProgressButton;
}

- (void)setDownloadProgressButton:(id)a3
{
}

- (BKLibraryDownloadStatus)libraryDownloadStatus
{
  return self->_libraryDownloadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDownloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadProgressButton, 0);
  objc_storeStrong((id *)&self->_coalescedPropertyChange, 0);
  objc_storeStrong((id *)&self->_writeReviewButton, 0);
  objc_storeStrong((id *)&self->_starRating, 0);
  objc_storeStrong((id *)&self->_markAsFinishedButton, 0);
  objc_storeStrong((id *)&self->_reviewComments, 0);
  objc_storeStrong((id *)&self->_reviewTitle, 0);
  objc_storeStrong((id *)&self->_reviewBackground, 0);
  objc_storeStrong((id *)&self->_dateIndicator, 0);
  objc_storeStrong((id *)&self->_combinedDateLabel, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cloudView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_finishedMetrics, 0);
  objc_storeStrong((id *)&self->_assetReview, 0);
  objc_storeStrong((id *)&self->_audiobookStatus, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_storageProvider);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_libraryAsset, 0);

  objc_storeStrong((id *)&self->_coverView, 0);
}

@end