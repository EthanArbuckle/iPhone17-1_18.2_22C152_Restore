@interface TPSBaseTipCollectionViewCell
+ (id)attributedStringOperationQueue;
- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4;
- (BOOL)canShowMedia;
- (BOOL)contentFinishedLoading;
- (BOOL)handleTipsURL:(id)a3;
- (BOOL)hasBodyContent;
- (BOOL)hasNotifiedDelegateContentLoaded;
- (BOOL)heroImageUpdated;
- (BOOL)imageLoadingFinished;
- (BOOL)isSharedVariant;
- (BOOL)needsTextView;
- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4;
- (BOOL)shouldLogAnimationFinished;
- (BOOL)showImageOnLoadFail;
- (BOOL)videoAssetViewCanDisplayAssets:(id)a3;
- (BOOL)videoHasFinished;
- (BOOL)videoLoadingFinished;
- (CGPoint)parallaxOffset;
- (CGSize)cacheCellSize;
- (NSArray)contentLabelConstraints;
- (NSArray)contentTextViewConstraints;
- (NSBlockOperation)contentTextOperation;
- (NSDate)animationInitialLoadTime;
- (NSLayoutConstraint)actionButtonBottomConstraint;
- (NSLayoutConstraint)assetViewHeightConstraint;
- (NSLayoutConstraint)assetViewLayoutGuideCenterXConstraint;
- (NSString)animationSource;
- (NSString)contentTextOperationID;
- (NSURL)imageURL;
- (TPSAssetsConfiguration)assetsConfiguration;
- (TPSBaseTipCollectionViewCell)initWithFrame:(CGRect)a3;
- (TPSBaseTipCollectionViewCellDelegate)delegate;
- (TPSConstellationContentParser)contentParser;
- (TPSKVOManager)KVOManager;
- (TPSTip)tip;
- (TPSTipCellAppearance)cellAppearance;
- (TPSTipContentLabel)contentLabel;
- (TPSTipContentTextView)contentTextView;
- (TPSUIAppController)appController;
- (TPSVideoAssetView)heroAssetView;
- (UIButton)actionButton;
- (UIColor)noImageBackgroundColorOverride;
- (UIEdgeInsets)contentSafeAreaInsets;
- (UIFont)titleFont;
- (UILabel)titleLabel;
- (UIScrollView)contentScrollView;
- (double)additionalBottomOffset;
- (double)bottomPadding;
- (double)imageParallaxMultiplier;
- (float)labelHyphenationFactor;
- (id)constellationContentParserBoldFont:(id)a3;
- (id)constellationContentParserItalicFont:(id)a3;
- (id)imagePath;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (id)uniqueIdentifierForCurrentTip;
- (int64_t)bodyContentProcessingCount;
- (void)actionButtonTapped;
- (void)applyLayoutAttributes:(id)a3;
- (void)commonInit;
- (void)constellationContentParserAttributedStringUpdated:(id)a3;
- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)continuePlayVideo;
- (void)dealloc;
- (void)handleTripleTapInternalGesture:(id)a3;
- (void)handleURL:(id)a3;
- (void)imageAssetViewImageUpdated:(id)a3;
- (void)loadBodyContentIfNeeded;
- (void)loadContentIfNeeded;
- (void)logAnimationFinished;
- (void)playVideo;
- (void)prepareForReuse;
- (void)removeContentParser;
- (void)replayButtonTapped;
- (void)replayVideo;
- (void)resetVideoPlayer;
- (void)scrollToTop;
- (void)scrubVideoToFirstFrame;
- (void)setActionButton:(id)a3;
- (void)setActionButtonBottomConstraint:(id)a3;
- (void)setAdditionalBottomOffset:(double)a3;
- (void)setAnimationInitialLoadTime:(id)a3;
- (void)setAnimationSource:(id)a3;
- (void)setAppController:(id)a3;
- (void)setAssetViewHeightConstraint:(id)a3;
- (void)setAssetViewLayoutGuideCenterXConstraint:(id)a3;
- (void)setAssetsConfiguration:(id)a3;
- (void)setBodyContentProcessingCount:(int64_t)a3;
- (void)setBottomPadding:(double)a3;
- (void)setCacheCellSize:(CGSize)a3;
- (void)setCanShowMedia:(BOOL)a3;
- (void)setCellAppearance:(id)a3;
- (void)setContentFinishedLoading:(BOOL)a3;
- (void)setContentLabel:(id)a3;
- (void)setContentLabelConstraints:(id)a3;
- (void)setContentParser:(id)a3;
- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setContentScrollView:(id)a3;
- (void)setContentTextOperation:(id)a3;
- (void)setContentTextOperationID:(id)a3;
- (void)setContentTextView:(id)a3;
- (void)setContentTextViewConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasBodyContent:(BOOL)a3;
- (void)setHasNotifiedDelegateContentLoaded:(BOOL)a3;
- (void)setHeroAssetView:(id)a3;
- (void)setHeroImageUpdated:(BOOL)a3;
- (void)setImageLoadingFinished:(BOOL)a3;
- (void)setImageParallaxMultiplier:(double)a3;
- (void)setImageURL:(id)a3;
- (void)setIsSharedVariant:(BOOL)a3;
- (void)setKVOManager:(id)a3;
- (void)setLabelHyphenationFactor:(float)a3;
- (void)setNeedsTextView:(BOOL)a3;
- (void)setNoImageBackgroundColorOverride:(id)a3;
- (void)setParallaxOffset:(CGPoint)a3;
- (void)setShouldLogAnimationFinished:(BOOL)a3;
- (void)setShowImageOnLoadFail:(BOOL)a3;
- (void)setTip:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVideoLoadingFinished:(BOOL)a3;
- (void)setupActionButtonConfiguration;
- (void)stopVideoPlayer;
- (void)updateActionButton;
- (void)updateAssetIfAllowed;
- (void)updateAssetPaths;
- (void)updateAssetViewBackground;
- (void)updateAssetsConfiguration;
- (void)updateAttributedStringWithCache;
- (void)updateConstraints;
- (void)updateContentLabel;
- (void)updateFonts;
- (void)updateHeroHeightConstraint;
- (void)updateImageReadyStatus;
- (void)updateImageView;
- (void)updateLoadingStatus;
- (void)updateVideoPath;
- (void)videoAssetViewUpdateAssetLoadingFinished:(id)a3 error:(id)a4;
@end

@implementation TPSBaseTipCollectionViewCell

+ (id)attributedStringOperationQueue
{
  if (qword_1000CAC90 != -1) {
    dispatch_once(&qword_1000CAC90, &stru_1000B7508);
  }
  v2 = (void *)qword_1000CAC98;

  return v2;
}

- (void)dealloc
{
  [(TPSBaseTipCollectionViewCell *)self removeContentParser];
  [(NSBlockOperation *)self->_contentTextOperation cancel];
  contentTextOperation = self->_contentTextOperation;
  self->_contentTextOperation = 0;

  contentTextOperationID = self->_contentTextOperationID;
  self->_contentTextOperationID = 0;

  [(TPSKVOManager *)self->_KVOManager removeAllKVOObjects];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:self];

  v6.receiver = self;
  v6.super_class = (Class)TPSBaseTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v6 dealloc];
}

- (void)commonInit
{
  self->_hasBodyContent = 1;
  self->_imageParallaxMultiplier = 1.0;
}

- (TPSBaseTipCollectionViewCell)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)TPSBaseTipCollectionViewCell;
  v3 = -[TPSBaseTipCollectionViewCell initWithFrame:](&v47, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TPSBaseTipCollectionViewCell *)v3 commonInit];
    v5 = (TPSKVOManager *)[objc_alloc((Class)TPSKVOManager) initWithObserver:v4];
    KVOManager = v4->_KVOManager;
    v4->_KVOManager = v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v8 = [(TPSBaseTipCollectionViewCell *)v4 contentView];
    [v8 setClipsToBounds:1];
    long long v9 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v4->_contentSafeAreaInsets.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v4->_contentSafeAreaInsets.bottom = v9;
    v4->_contentFinishedLoading = 0;
    v10 = (TPSVideoAssetView *)objc_alloc_init((Class)TPSVideoAssetView);
    heroAssetView = v4->_heroAssetView;
    v4->_heroAssetView = v10;

    [(TPSVideoAssetView *)v4->_heroAssetView setVideoDelegate:v4];
    [(TPSVideoAssetView *)v4->_heroAssetView setDelegate:v4];
    [(TPSVideoAssetView *)v4->_heroAssetView setTranslatesAutoresizingMaskIntoConstraints:0];
    if ((+[TPSCommonDefines isPhoneUI] & 1) == 0) {
      [(TPSVideoAssetView *)v4->_heroAssetView setAspectFillAsset:1];
    }
    [(TPSBaseTipCollectionViewCell *)v4 updateAssetViewBackground];
    v12 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setOpaque:1];
    [(UILabel *)v4->_titleLabel setTextAlignment:4];
    v14 = +[UIColor clearColor];
    [(UILabel *)v4->_titleLabel setBackgroundColor:v14];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v15 = [(TPSBaseTipCollectionViewCell *)v4 titleFont];
    [(UILabel *)v4->_titleLabel setFont:v15];

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v16 = +[TPSAppearance defaultLabelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v16];

    [(UILabel *)v4->_titleLabel setLineBreakStrategy:0];
    v17 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
    contentScrollView = v4->_contentScrollView;
    v4->_contentScrollView = v17;

    v19 = +[UIColor clearColor];
    [(UIScrollView *)v4->_contentScrollView setBackgroundColor:v19];

    [(UIScrollView *)v4->_contentScrollView setContentInsetAdjustmentBehavior:3];
    [(UIScrollView *)v4->_contentScrollView setDirectionalLockEnabled:1];
    [(UIScrollView *)v4->_contentScrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v4->_contentScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v4->_contentScrollView];
    [(UIScrollView *)v4->_contentScrollView addSubview:v4->_heroAssetView];
    [(UIScrollView *)v4->_contentScrollView addSubview:v4->_titleLabel];
    [(TPSKVOManager *)v4->_KVOManager addKVOObject:v4->_contentScrollView forKeyPath:@"contentSize" options:3 context:"contentLayoutChanged:userInfo:"];
    [(TPSKVOManager *)v4->_KVOManager addKVOObject:v4->_contentScrollView forKeyPath:@"contentOffset" options:3 context:"contentLayoutChanged:userInfo:"];
    v20 = [(UIScrollView *)v4->_contentScrollView topAnchor];
    v21 = [v8 topAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [(UIScrollView *)v4->_contentScrollView leadingAnchor];
    v24 = [v8 leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = [(UIScrollView *)v4->_contentScrollView trailingAnchor];
    v27 = [v8 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v28 setActive:1];

    v29 = [(UIScrollView *)v4->_contentScrollView bottomAnchor];
    v30 = [v8 bottomAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    if (v4->_hasBodyContent)
    {
      v32 = objc_alloc_init(TPSTipContentLabel);
      contentLabel = v4->_contentLabel;
      v4->_contentLabel = v32;

      [(TPSTipContentLabel *)v4->_contentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TPSTipContentLabel *)v4->_contentLabel setAdjustsFontForContentSizeCategory:1];
      v34 = +[TPSAppearance defaultLabelColor];
      [(TPSTipContentLabel *)v4->_contentLabel setTextColor:v34];

      v35 = +[TPSAppearance defaultTextLabelFont];
      [(TPSTipContentLabel *)v4->_contentLabel setFont:v35];

      v36 = +[UIColor clearColor];
      [(TPSTipContentLabel *)v4->_contentLabel setBackgroundColor:v36];

      [(TPSTipContentLabel *)v4->_contentLabel setNumberOfLines:0];
      [(TPSTipContentLabel *)v4->_contentLabel setLineBreakMode:0];
      v37 = +[TPSAppearance defaultLabelColor];
      [(TPSTipContentLabel *)v4->_contentLabel setTextColor:v37];

      [(UIScrollView *)v4->_contentScrollView addSubview:v4->_contentLabel];
      v38 = objc_alloc_init(TPSTipContentTextView);
      contentTextView = v4->_contentTextView;
      v4->_contentTextView = v38;

      [(TPSTipContentTextView *)v4->_contentTextView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TPSTipContentTextView *)v4->_contentTextView setScrollEnabled:0];
      [(TPSTipContentTextView *)v4->_contentTextView _setInteractiveTextSelectionDisabled:1];
      v40 = +[UIColor clearColor];
      [(TPSTipContentTextView *)v4->_contentTextView setBackgroundColor:v40];

      [(TPSTipContentTextView *)v4->_contentTextView setEditable:0];
      v41 = +[TPSAppearance defaultTextLabelFont];
      [(TPSTipContentTextView *)v4->_contentTextView setFont:v41];

      [(TPSTipContentTextView *)v4->_contentTextView setDataDetectorTypes:0];
      v42 = [(TPSTipContentTextView *)v4->_contentTextView textContainer];
      [v42 setHeightTracksTextView:1];

      [(TPSTipContentTextView *)v4->_contentTextView setDelegate:v4];
      [(TPSTipContentTextView *)v4->_contentTextView setOpaque:1];
      [(TPSTipContentTextView *)v4->_contentTextView setHidden:1];
      -[TPSTipContentTextView setTextContainerInset:](v4->_contentTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      v43 = [(TPSTipContentTextView *)v4->_contentTextView textContainer];
      [v43 setLineFragmentPadding:0.0];

      [(UIScrollView *)v4->_contentScrollView addSubview:v4->_contentTextView];
    }
  }
  if (+[TPSCommonDefines isInternalBuild])
  {
    [(UIScrollView *)v4->_contentScrollView setUserInteractionEnabled:1];
    id v44 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"handleTripleTapInternalGesture:"];
    [v44 setNumberOfTapsRequired:3];
    [(TPSTipContentLabel *)v4->_contentLabel setUserInteractionEnabled:1];
    [(TPSTipContentLabel *)v4->_contentLabel addGestureRecognizer:v44];
    id v45 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"handleTripleTapInternalGesture:"];
    [v45 setNumberOfTapsRequired:3];
    [(TPSTipContentTextView *)v4->_contentTextView setUserInteractionEnabled:1];
    [(TPSTipContentTextView *)v4->_contentTextView addGestureRecognizer:v45];
  }
  return v4;
}

- (void)prepareForReuse
{
  [(TPSBaseTipCollectionViewCell *)self resetVideoPlayer];
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](self, "setParallaxOffset:", CGPointZero.x, CGPointZero.y);
  v3.receiver = self;
  v3.super_class = (Class)TPSBaseTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v3 prepareForReuse];
}

- (void)scrollToTop
{
  contentScrollView = self->_contentScrollView;
  if (contentScrollView
    && (id)[(UIScrollView *)contentScrollView contentInsetAdjustmentBehavior] != (id)2)
  {
    [(TPSBaseTipCollectionViewCell *)self contentSafeAreaInsets];
    v5 = self->_contentScrollView;
    -[UIScrollView setContentOffset:](v5, "setContentOffset:", 0.0, -v4);
  }
}

- (void)setContentSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_contentSafeAreaInsets = a3;
  if (a3.bottom == 0.0) {
    double v3 = -30.0 - self->_additionalBottomOffset;
  }
  else {
    double v3 = -20.0 - a3.bottom;
  }
  if (self->_bottomPadding != v3)
  {
    self->_bottomPadding = v3;
    [(TPSBaseTipCollectionViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(TPSTipContentTextView *)self->_contentTextView setTipID:0];
  [(TPSTipContentLabel *)self->_contentLabel setTipID:0];
  [(TPSTipContentLabel *)self->_contentLabel setAttributedText:0];
  [(TPSTipContentTextView *)self->_contentTextView setAttributedText:0];
  double v4 = [(TPSBaseTipCollectionViewCell *)self appController];
  v5 = [(TPSBaseTipCollectionViewCell *)self tip];
  objc_super v6 = [v5 identifier];
  [v4 updateAttributedString:0 forIdentifier:v6];

  [(TPSBaseTipCollectionViewCell *)self updateFonts];
  [(TPSBaseTipCollectionViewCell *)self updateContentLabel];

  [(TPSBaseTipCollectionViewCell *)self setNeedsUpdateConstraints];
}

- (void)setParallaxOffset:(CGPoint)a3
{
  if (self->_parallaxOffset.x != a3.x || self->_parallaxOffset.y != a3.y)
  {
    self->_parallaxOffset = a3;
    [(NSLayoutConstraint *)self->_assetViewLayoutGuideCenterXConstraint setConstant:a3.x * self->_imageParallaxMultiplier];
  }
}

- (BOOL)setTip:(id)a3 withCellAppearance:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_tip = &self->_tip;
  unsigned int v10 = [(TPSTip *)self->_tip isEqual:v7];
  [v8 size];
  double v12 = v11;
  double v14 = v13;
  double width = self->_cacheCellSize.width;
  double height = self->_cacheCellSize.height;
  objc_storeStrong((id *)&self->_cellAppearance, a4);
  objc_storeStrong((id *)&self->_tip, a3);
  if ([(TPSTip *)self->_tip hasImage])
  {
    v17 = [(TPSVideoAssetView *)self->_heroAssetView imageView];
    v18 = [v17 image];
    [(TPSBaseTipCollectionViewCell *)self setHeroImageUpdated:v18 != 0];
  }
  else
  {
    [(TPSBaseTipCollectionViewCell *)self setHeroImageUpdated:1];
  }
  [(TPSBaseTipCollectionViewCell *)self setBodyContentProcessingCount:0];
  v19 = [(TPSTip *)*p_tip bodyText];

  if (!v19)
  {
    id v45 = v8;
    id v20 = v7;
    v21 = [(TPSBaseTipCollectionViewCell *)self appController];
    v22 = [(TPSBaseTipCollectionViewCell *)self tip];
    v23 = [v22 identifier];
    v24 = [v21 attributedStringForIdentifier:v23];

    if (!v24)
    {
      v25 = [(TPSTip *)*p_tip bodyContent];

      if (v25) {
        [(TPSBaseTipCollectionViewCell *)self setBodyContentProcessingCount:1];
      }
    }

    id v7 = v20;
    id v8 = v45;
  }
  [(TPSBaseTipCollectionViewCell *)self updateAssetsConfiguration];
  [(TPSBaseTipCollectionViewCell *)self updateVideoPath];
  [(TPSBaseTipCollectionViewCell *)self updateAssetViewBackground];
  if (v12 == width) {
    int v26 = v10 ^ 1;
  }
  else {
    int v26 = 1;
  }
  if (v14 == height) {
    BOOL v27 = v26;
  }
  else {
    BOOL v27 = 1;
  }
  if (v27)
  {
    [(TPSBaseTipCollectionViewCell *)self scrollToTop];
    v28 = [(TPSTip *)*p_tip title];
    [(UILabel *)self->_titleLabel setText:v28];

    self->_hasNotifiedDelegateContentLoaded = 0;
    self->_contentFinishedLoading = 0;
    v29 = +[NSDate date];
    animationInitialLoadTime = self->_animationInitialLoadTime;
    self->_animationInitialLoadTime = v29;

    [(NSBlockOperation *)self->_contentTextOperation cancel];
    contentTextOperation = self->_contentTextOperation;
    self->_contentTextOperation = 0;

    contentTextOperationID = self->_contentTextOperationID;
    self->_contentTextOperationID = 0;

    [v8 size];
    self->_cacheCellSize.double width = v33;
    self->_cacheCellSize.double height = v34;
    [(TPSBaseTipCollectionViewCell *)self updateAssetIfAllowed];
    if ((v10 & 1) == 0 && self->_hasBodyContent)
    {
      [(TPSTipContentTextView *)self->_contentTextView setTipID:0];
      [(TPSTipContentTextView *)self->_contentTextView setHidden:1];
      [(TPSTipContentTextView *)self->_contentTextView setAttributedText:0];
      [(UIButton *)self->_actionButton setHidden:1];
      -[TPSBaseTipCollectionViewCell setNeedsTextView:](self, "setNeedsTextView:", [v7 containsLinks]);
      v35 = [(TPSBaseTipCollectionViewCell *)self tip];
      v36 = [v35 bodyText];

      if (v36)
      {
        [(TPSBaseTipCollectionViewCell *)self updateContentLabel];
      }
      else
      {
        v37 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
        [v37 setTipID:0];

        v38 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
        [v38 setText:0];

        v39 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
        [v39 setAttributedText:0];

        v40 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
        [v40 setHidden:1];
      }
    }
  }
  if ([(TPSBaseTipCollectionViewCell *)self bodyContentProcessingCount]) {
    BOOL v41 = 0;
  }
  else {
    BOOL v41 = [(TPSBaseTipCollectionViewCell *)self heroImageUpdated];
  }
  [(TPSBaseTipCollectionViewCell *)self setImageLoadingFinished:v41];
  if (([(TPSTip *)*p_tip hasVideo] & 1) == 0)
  {
    [(TPSBaseTipCollectionViewCell *)self setVideoLoadingFinished:1];
    if (!v27) {
      goto LABEL_26;
    }
LABEL_28:
    id v43 = [(TPSTip *)*p_tip hasVideo];
    goto LABEL_29;
  }
  v42 = [(TPSVideoAssetView *)self->_heroAssetView downloadedVideoPath];
  [(TPSBaseTipCollectionViewCell *)self setVideoLoadingFinished:v42 != 0];

  if (v27) {
    goto LABEL_28;
  }
LABEL_26:
  id v43 = 0;
LABEL_29:
  [(TPSBaseTipCollectionViewCell *)self setShouldLogAnimationFinished:v43];

  return v27;
}

- (id)imagePath
{
  v2 = [(TPSBaseTipCollectionViewCell *)self assetsConfiguration];
  double v3 = +[TPSContentURLController assetPathFromAssetConfiguration:v2 type:0];

  return v3;
}

- (void)updateVideoPath
{
  double v3 = [(TPSBaseTipCollectionViewCell *)self assetsConfiguration];
  double v4 = [v3 cacheIdentifierForType:1];
  [(TPSVideoAssetView *)self->_heroAssetView setCacheVideoIdentifier:v4];

  id v6 = [(TPSBaseTipCollectionViewCell *)self assetsConfiguration];
  v5 = +[TPSContentURLController assetPathFromAssetConfiguration:v6 type:1];
  [(TPSVideoAssetView *)self->_heroAssetView setVideoPath:v5];
}

- (void)updateAssetViewBackground
{
  id v6 = +[TPSAppearance defaultBackgroundColor];
  noImageBackgroundColorOverride = self->_noImageBackgroundColorOverride;
  if (noImageBackgroundColorOverride)
  {
    double v4 = noImageBackgroundColorOverride;
  }
  else
  {
    double v4 = +[TPSAppearance secondaryBackgroundColor];
  }
  v5 = v4;
  [(TPSVideoAssetView *)self->_heroAssetView setDefaultBackgroundColor:v6];
  [(TPSVideoAssetView *)self->_heroAssetView setNoImageBackgroundColor:v5];
}

- (void)updateAssetIfAllowed
{
  [(TPSVideoAssetView *)self->_heroAssetView cancel];
  [(TPSVideoAssetView *)self->_heroAssetView setImage:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v4 = [WeakRetained tipCollectionViewCellCanDisplayAssets:self];

  if ((v4 & 1) == 0)
  {
    v5 = [(TPSBaseTipCollectionViewCell *)self assetsConfiguration];
    id v6 = [v5 cacheIdentifierForType:0];

    id v7 = +[TPSImageAssetController imageFromMemoryCacheForIdentifier:v6];
    if (v7)
    {
    }
    else
    {
      id v8 = +[TPSImageAssetController dataCacheForIdentifier:v6];

      if (!v8) {
        return;
      }
    }
  }

  [(TPSBaseTipCollectionViewCell *)self updateImageView];
}

- (void)updateImageView
{
  id v5 = [(TPSBaseTipCollectionViewCell *)self imagePath];
  double v3 = [(TPSBaseTipCollectionViewCell *)self assetsConfiguration];
  unsigned __int8 v4 = [v3 cacheIdentifierForType:0];

  [(TPSVideoAssetView *)self->_heroAssetView fetchImageWithIdentifier:v4 path:v5];
}

- (void)updateAssetsConfiguration
{
  unsigned int v3 = [(TPSTip *)self->_tip isTip];
  cellAppearance = self->_cellAppearance;
  if (v3) {
    unsigned int v5 = [(TPSTipCellAppearance *)cellAppearance isCompactLayout];
  }
  else {
    unsigned int v5 = [(TPSTipCellAppearance *)cellAppearance isBookendsCompactLayout];
  }
  if (v5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v15 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v7 = +[TPSUIAppController sharedInstance];
  id v8 = [v15 fullContentAssets];
  long long v9 = [v15 language];
  unsigned int v10 = [(TPSBaseTipCollectionViewCell *)self cellAppearance];
  id v11 = [v10 userInterfaceStyle];
  double v12 = [(TPSBaseTipCollectionViewCell *)self tip];
  double v13 = [v12 assetFileInfoManager];
  double v14 = [v7 assetConfigurationForAssets:v8 language:v9 sizeClass:v6 style:v11 assetFileInfoManager:v13];

  [(TPSBaseTipCollectionViewCell *)self setAssetsConfiguration:v14];
}

- (void)updateFonts
{
  unsigned int v3 = +[UIApplication sharedApplication];
  category = [v3 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  unsigned int v5 = (float *)&kTPSHyphenationFactorAccessibility;
  if (!IsAccessibilityCategory) {
    unsigned int v5 = (float *)&kTPSHyphenationFactorDefault;
  }
  self->_labelHyphenationFactor = *v5;
  [(TPSBaseTipCollectionViewCell *)self labelHyphenationFactor];
  -[UILabel _setHyphenationFactor:](self->_titleLabel, "_setHyphenationFactor:");
}

- (UIFont)titleFont
{
  return (UIFont *)+[TPSAppearance titleLabelFont];
}

- (void)updateLoadingStatus
{
  if (!self->_hasNotifiedDelegateContentLoaded)
  {
    if (self->_imageLoadingFinished && self->_videoLoadingFinished)
    {
      self->_contentFinishedLoading = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained cellContentLoaded:self];

      self->_hasNotifiedDelegateContentLoaded = 1;
    }
    [(TPSBaseTipCollectionViewCell *)self updateHeroHeightConstraint];
  }
}

- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  id v7 = [v5 objectForKeyedSubscript:NSKeyValueChangeNewKey];

  if (v6 != v7)
  {
    id v8 = [(TPSBaseTipCollectionViewCell *)self delegate];
    [v8 tipCollectionViewCellContentLayoutChanged:self];
  }
}

- (void)setNeedsTextView:(BOOL)a3
{
  if (self->_hasBodyContent)
  {
    BOOL v4 = a3;
    self->_needsTextView = a3;
    [(NSLayoutConstraint *)self->_actionButtonTextLabelTopConstraint setActive:!a3];
    [(NSLayoutConstraint *)self->_actionButtonTextViewTopConstraint setActive:v4];
    id v5 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentTextViewConstraints;
    if (v4) {
      uint64_t v6 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentLabelConstraints;
    }
    else {
      uint64_t v6 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentTextViewConstraints;
    }
    id v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v6);
    if (!v4) {
      id v5 = &OBJC_IVAR___TPSBaseTipCollectionViewCell__contentLabelConstraints;
    }
    id v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v5);
    id v9 = v7;
    +[NSLayoutConstraint deactivateConstraints:v9];
    +[NSLayoutConstraint activateConstraints:v8];
  }
  else
  {
    self->_needsTextView = 0;
  }
}

- (void)loadContentIfNeeded
{
  unsigned int v3 = [(TPSVideoAssetView *)self->_heroAssetView image];

  if (!v3) {
    [(TPSBaseTipCollectionViewCell *)self updateImageView];
  }

  [(TPSBaseTipCollectionViewCell *)self playVideo];
}

- (void)logAnimationFinished
{
  if ([(TPSBaseTipCollectionViewCell *)self shouldLogAnimationFinished]
    && self->_contentFinishedLoading)
  {
    double v12 = [(TPSBaseTipCollectionViewCell *)self tip];
    unsigned int v3 = [v12 identifier];
    BOOL v4 = [(TPSBaseTipCollectionViewCell *)self videoHasFinished];
    id v5 = [(TPSBaseTipCollectionViewCell *)self animationSource];
    uint64_t v6 = [(TPSBaseTipCollectionViewCell *)self tip];
    id v7 = [v6 collectionIdentifiers];
    id v8 = [v7 firstObject];
    id v9 = [(TPSBaseTipCollectionViewCell *)self tip];
    unsigned int v10 = [v9 correlationID];
    id v11 = +[TPSAnalyticsEventAnimationFinished eventWithTipID:v3 animationFinished:v4 animationSource:v5 collectionID:v8 correlationID:v10];
    [v11 log];

    [(TPSBaseTipCollectionViewCell *)self setShouldLogAnimationFinished:0];
  }
}

- (void)updateAttributedStringWithCache
{
  unsigned int v3 = [(TPSBaseTipCollectionViewCell *)self appController];
  BOOL v4 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v5 = [v4 identifier];
  id v15 = [v3 attributedStringForIdentifier:v5];

  if (v15)
  {
    uint64_t v6 = [(TPSBaseTipCollectionViewCell *)self uniqueIdentifierForCurrentTip];
    if ([(TPSTip *)self->_tip containsLinks])
    {
      p_contentTextView = (id *)&self->_contentTextView;
      id v8 = [(TPSTipContentTextView *)self->_contentTextView tipID];
      unsigned __int8 v9 = [v8 isEqualToString:v6];

      if ((v9 & 1) == 0)
      {
        unsigned int v10 = [(TPSBaseTipCollectionViewCell *)self contentTextView];
        [v10 setAttributedText:v15];

        [*p_contentTextView setTipID:v6];
      }
      if (([*p_contentTextView isHidden] & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
      p_contentTextView = (id *)&self->_contentLabel;
      id v11 = [(TPSTipContentLabel *)self->_contentLabel tipID];
      unsigned __int8 v12 = [v11 isEqualToString:v6];

      if ((v12 & 1) == 0)
      {
        [*p_contentTextView setAttributedText:v15];
        [*p_contentTextView setTipID:v6];
      }
      if (![*p_contentTextView isHidden]) {
        goto LABEL_12;
      }
    }
    id v13 = *p_contentTextView;
    if (v13)
    {
      double v14 = v13;
      [(TPSBaseTipCollectionViewCell *)self setNeedsUpdateConstraints];
      [v14 setHidden:0];
      [v14 setAlpha:1.0];
    }
LABEL_12:
  }
  [(TPSBaseTipCollectionViewCell *)self updateActionButton];
  [(TPSBaseTipCollectionViewCell *)self updateImageReadyStatus];
}

- (void)updateActionButton
{
  if (self->_hasBodyContent)
  {
    unsigned int v3 = [(TPSTip *)self->_tip actions];
    id v4 = [v3 count];

    actionButton = self->_actionButton;
    if (v4)
    {
      if (!actionButton)
      {
        uint64_t v6 = +[UIButton buttonWithType:0];
        id v7 = self->_actionButton;
        self->_actionButton = v6;

        [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
        [(UIButton *)self->_actionButton addTarget:self action:"actionButtonTapped" forControlEvents:64];
        actionButton = self->_actionButton;
      }
      if ([(UIButton *)actionButton isHidden]) {
        [(UIButton *)self->_actionButton setHidden:0];
      }
      [(UIButton *)self->_actionButton setEnabled:!self->_isSharedVariant];
      id v8 = [(UIButton *)self->_actionButton configuration];
      unsigned __int8 v9 = [v8 title];
      unsigned int v10 = [(TPSTip *)self->_tip actions];
      id v11 = [v10 firstObject];
      unsigned __int8 v12 = [v11 text];
      unsigned __int8 v13 = [v9 isEqualToString:v12];

      if ((v13 & 1) == 0) {
        [(TPSBaseTipCollectionViewCell *)self setupActionButtonConfiguration];
      }
      double v14 = [(UIButton *)self->_actionButton superview];

      id v15 = &selRef_contentSizeCategoryDidChange_;
      if (!v14)
      {
        [(UIScrollView *)self->_contentScrollView addSubview:self->_actionButton];
        v16 = [(UIScrollView *)self->_contentScrollView frameLayoutGuide];
        v17 = [(UIButton *)self->_actionButton centerXAnchor];
        v18 = [v16 centerXAnchor];
        v19 = [v17 constraintEqualToAnchor:v18];
        [v19 setActive:1];

        id v20 = [(UIButton *)self->_actionButton widthAnchor];
        v21 = [v16 widthAnchor];
        v22 = [v20 constraintLessThanOrEqualToAnchor:v21 multiplier:1.0 constant:0.0];
        actionButtonWidthConstraint = self->_actionButtonWidthConstraint;
        self->_actionButtonWidthConstraint = v22;

        LODWORD(v24) = 1148846080;
        [(UIButton *)self->_actionButton setContentCompressionResistancePriority:1 forAxis:v24];
        v25 = [(UIButton *)self->_actionButton heightAnchor];
        int v26 = [v25 constraintGreaterThanOrEqualToConstant:20.0];
        actionButtonHeightConstraint = self->_actionButtonHeightConstraint;
        self->_actionButtonHeightConstraint = v26;

        v28 = [(UIButton *)self->_actionButton topAnchor];
        v29 = [(TPSTipContentLabel *)self->_contentLabel bottomAnchor];
        v30 = [v28 constraintEqualToAnchor:v29 constant:16.0];
        actionButtonTextLabelTopConstraint = self->_actionButtonTextLabelTopConstraint;
        self->_actionButtonTextLabelTopConstraint = v30;

        LODWORD(v32) = 1148829696;
        [(NSLayoutConstraint *)self->_actionButtonTextLabelTopConstraint setPriority:v32];
        CGFloat v33 = [(UIButton *)self->_actionButton bottomAnchor];
        id v15 = &selRef_contentSizeCategoryDidChange_;
        CGFloat v34 = [(UIScrollView *)self->_contentScrollView bottomAnchor];
        v35 = [v33 constraintEqualToAnchor:v34 constant:self->_bottomPadding];
        actionButtonBottomConstraint = self->_actionButtonBottomConstraint;
        self->_actionButtonBottomConstraint = v35;

        LODWORD(v37) = 1148846080;
        [(NSLayoutConstraint *)self->_actionButtonBottomConstraint setPriority:v37];
      }
      if (self->_contentTextView && !self->_actionButtonTextViewTopConstraint)
      {
        v38 = [(UIButton *)self->_actionButton topAnchor];
        v39 = [(TPSTipContentTextView *)self->_contentTextView bottomAnchor];
        v40 = [v38 constraintEqualToAnchor:v39 constant:16.0];
        actionButtonTextViewTopConstraint = self->_actionButtonTextViewTopConstraint;
        self->_actionButtonTextViewTopConstraint = v40;

        LODWORD(v42) = 1148846080;
        [(NSLayoutConstraint *)self->_actionButtonTextViewTopConstraint setPriority:v42];
      }
      [(NSLayoutConstraint *)self->_actionButtonWidthConstraint setActive:1];
      [(NSLayoutConstraint *)self->_actionButtonHeightConstraint setActive:1];
      id v43 = [(TPSBaseTipCollectionViewCell *)self tip];
      id v44 = [v43 footnoteContent];
      if (v44) {
        BOOL v45 = 0;
      }
      else {
        BOOL v45 = !self->_isSharedVariant;
      }
      [(NSLayoutConstraint *)self->_actionButtonBottomConstraint setActive:v45];

      [(NSLayoutConstraint *)self->_actionButtonTextLabelTopConstraint setActive:[(TPSTipContentLabel *)self->_contentLabel isHidden] ^ 1];
      [(NSLayoutConstraint *)self->_actionButtonTextViewTopConstraint setActive:[(NSLayoutConstraint *)self->_actionButtonTextLabelTopConstraint isActive] ^ 1];
      objc_super v47 = *(Class *)((char *)&self->super.super.super.super.super.isa + *((int *)v15 + 338));
      [v47 setNeedsLayout];
    }
    else
    {
      [(UIButton *)actionButton setHidden:1];
      [(NSLayoutConstraint *)self->_actionButtonTextLabelTopConstraint setActive:0];
      [(NSLayoutConstraint *)self->_actionButtonTextViewTopConstraint setActive:0];
      [(NSLayoutConstraint *)self->_actionButtonWidthConstraint setActive:0];
      [(NSLayoutConstraint *)self->_actionButtonBottomConstraint setActive:0];
      v46 = self->_actionButtonHeightConstraint;
      [(NSLayoutConstraint *)v46 setActive:0];
    }
  }
}

- (void)actionButtonTapped
{
  unsigned int v3 = [(TPSTip *)self->_tip actions];
  id v5 = [v3 firstObject];

  id v4 = [v5 URL];
  [(TPSBaseTipCollectionViewCell *)self handleTipsURL:v4];
}

- (BOOL)handleTipsURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[TPSLogger default];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Links tapped inside content %@", (uint8_t *)&v19, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tipCollectionViewCell:self linkTappedForURL:v4];

    id v7 = +[TPSURLActionComponents componentsWithURL:v4];
    id v8 = [v7 actionType];
    unsigned __int8 v9 = [v7 URL];
    uint64_t v10 = [v7 bundleID];
    id v11 = (void *)v10;
    switch((unint64_t)v8)
    {
      case 1uLL:
        if (v10)
        {
          double v14 = +[LSApplicationWorkspace defaultWorkspace];
          [v14 openApplicationWithBundleID:v11];
          goto LABEL_19;
        }
        break;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        if (v9)
        {
          unsigned __int8 v12 = +[TPSLogger default];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412290;
            id v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Open url with %@", (uint8_t *)&v19, 0xCu);
          }

          [(TPSBaseTipCollectionViewCell *)self handleURL:v9];
        }
        break;
      case 5uLL:
      case 6uLL:
        if (v9)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_delegate);
          [v13 tipCollectionViewCell:self showSafariViewForURL:v9];
          goto LABEL_21;
        }
        break;
      case 7uLL:
        if (v9)
        {
          id v13 = objc_loadWeakRetained((id *)&self->_delegate);
          [v13 tipCollectionViewCell:self showVideoForURL:v9];
          goto LABEL_21;
        }
        break;
      case 9uLL:
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        id v15 = [v7 bundleID];
        v16 = [v7 identifier];
        [v13 tipCollectionViewCell:self showUserGuideWithIdentifier:v15 topicId:v16];

        goto LABEL_21;
      case 0xBuLL:
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 tipCollectionViewCell:self showTryItModeForURL:v4];
LABEL_21:

        break;
      default:
        v17 = +[TPSLogger default];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v4;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Open safari for URL %@", (uint8_t *)&v19, 0xCu);
        }

        double v14 = +[UIApplication sharedApplication];
        [v14 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
LABEL_19:

        break;
    }
  }
  return 0;
}

- (void)setupActionButtonConfiguration
{
  unsigned int v3 = [(TPSTip *)self->_tip actions];
  id v18 = [v3 firstObject];

  if ([(TPSTip *)self->_tip isChecklistTip]
    && ([(TPSTip *)self->_tip isCompleted] & 1) == 0)
  {
    actionButton = self->_actionButton;
    uint64_t v6 = [(TPSTip *)self->_tip actions];
    id v7 = [v6 firstObject];
    id v8 = [v7 text];
    v16 = +[UIColor whiteColor];
    v17 = +[UIColor systemBlueColor];
    [(UIButton *)actionButton setupActionButtonConfigurationWithTitle:v8 foregroundColor:v16 backgroundColor:v17];

    goto LABEL_8;
  }
  id v4 = [v18 type];
  id v5 = self->_actionButton;
  if (v4 == (id)11)
  {
    uint64_t v6 = [v18 text];
    id v7 = +[UIColor whiteColor];
    id v8 = +[UIColor systemBlueColor];
    [(UIButton *)v5 setupActionButtonConfigurationWithTitle:v6 foregroundColor:v7 backgroundColor:v8 symbolName:@"hand.draw.fill" fontWeight:UIFontWeightSemibold];
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v9 = [(UIButton *)self->_actionButton configuration];
  uint64_t v10 = [v9 title];
  id v11 = [v18 text];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  id v13 = v18;
  if (v12) {
    goto LABEL_10;
  }
  double v14 = self->_actionButton;
  uint64_t v6 = [v18 text];
  [(UIButton *)v14 setupActionButtonConfigurationWithTitle:v6 isEnabled:[(UIButton *)self->_actionButton isEnabled]];
LABEL_9:

  id v13 = v18;
LABEL_10:
}

- (id)uniqueIdentifierForCurrentTip
{
  unsigned int v3 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v4 = [v3 identifier];

  id v5 = [(TPSBaseTipCollectionViewCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (v6 == (id)2)
  {
    uint64_t v7 = [v4 stringByAppendingString:@"-Dark"];

    id v4 = (void *)v7;
  }

  return v4;
}

- (void)removeContentParser
{
  unsigned int v3 = [(TPSBaseTipCollectionViewCell *)self contentParser];
  [v3 setDelegate:0];

  id v4 = [(TPSBaseTipCollectionViewCell *)self contentParser];
  [v4 cancelAssetFetches];

  [(TPSBaseTipCollectionViewCell *)self setContentParser:0];
}

- (void)updateContentLabel
{
  if (self->_hasBodyContent)
  {
    unsigned int v3 = [(TPSBaseTipCollectionViewCell *)self appController];
    id v4 = [(TPSBaseTipCollectionViewCell *)self tip];
    id v5 = [v4 identifier];
    id v6 = [v3 attributedStringForIdentifier:v5];

    if (v6)
    {
      [(TPSBaseTipCollectionViewCell *)self updateAttributedStringWithCache];
    }
    else
    {
      uint64_t v7 = [(TPSBaseTipCollectionViewCell *)self uniqueIdentifierForCurrentTip];
      id v8 = [(TPSBaseTipCollectionViewCell *)self tip];
      unsigned __int8 v9 = [v8 bodyContent];

      if (v9)
      {
        if (([v7 isEqualToString:self->_contentTextOperationID] & 1) == 0)
        {
          contentTextOperation = self->_contentTextOperation;
          if (contentTextOperation)
          {
            [(NSBlockOperation *)contentTextOperation cancel];
            id v11 = self->_contentTextOperation;
            self->_contentTextOperation = 0;
          }
          unsigned __int8 v12 = [(TPSBaseTipCollectionViewCell *)self tip];
          unsigned int v13 = [v12 containsLinks];

          if (v13)
          {
            id v14 = [(TPSBaseTipCollectionViewCell *)self contentTextView];
            [(TPSBaseTipCollectionViewCell *)self setNeedsUpdateConstraints];
          }
          id v15 = (NSBlockOperation *)objc_alloc_init((Class)NSBlockOperation);
          v16 = self->_contentTextOperation;
          self->_contentTextOperation = v15;

          objc_storeStrong((id *)&self->_contentTextOperationID, v7);
          objc_initWeak(&location, self);
          objc_initWeak(&from, v7);
          v39[0] = NSFontAttributeName;
          v17 = +[TPSAppearance defaultTextLabelFont];
          v40[0] = v17;
          v39[1] = NSForegroundColorAttributeName;
          id v18 = +[TPSAppearance defaultLabelColor];
          v40[1] = v18;
          int v19 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

          [(TPSBaseTipCollectionViewCell *)self removeContentParser];
          id v20 = objc_alloc_init((Class)TPSConstellationContentParser);
          [(TPSBaseTipCollectionViewCell *)self setContentParser:v20];

          v21 = [(TPSBaseTipCollectionViewCell *)self traitCollection];
          v22 = [(TPSBaseTipCollectionViewCell *)self contentParser];
          [v22 setTraitCollection:v21];

          v23 = self->_contentTextOperation;
          v30 = _NSConcreteStackBlock;
          uint64_t v31 = 3221225472;
          double v32 = sub_1000218F0;
          CGFloat v33 = &unk_1000B7558;
          objc_copyWeak(&v35, &location);
          id v24 = v19;
          id v34 = v24;
          objc_copyWeak(&v36, &from);
          [(NSBlockOperation *)v23 addExecutionBlock:&v30];
          v25 = +[TPSBaseTipCollectionViewCell attributedStringOperationQueue];
          [v25 addOperation:self->_contentTextOperation];

          objc_destroyWeak(&v36);
          objc_destroyWeak(&v35);

          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        int v26 = [(TPSTip *)self->_tip bodyText];

        if (v26)
        {
          BOOL v27 = [(TPSTipContentLabel *)self->_contentLabel tipID];
          unsigned __int8 v28 = [v27 isEqualToString:v7];

          if ((v28 & 1) == 0)
          {
            [(TPSTipContentLabel *)self->_contentLabel setTipID:v7];
            v29 = [(TPSTip *)self->_tip bodyText];
            [(TPSTipContentLabel *)self->_contentLabel setText:v29];
          }
          if ([(TPSTipContentLabel *)self->_contentLabel isHidden]) {
            [(TPSTipContentLabel *)self->_contentLabel setHidden:0];
          }
          [(TPSBaseTipCollectionViewCell *)self updateActionButton];
        }
      }
    }
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSBaseTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v7 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 parallaxOffset];
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  -[TPSBaseTipCollectionViewCell setParallaxOffset:](self, "setParallaxOffset:", x, y);
}

- (void)updateConstraints
{
  [(TPSTipCellAppearance *)self->_cellAppearance contentSidePadding];
  [(NSLayoutConstraint *)self->_actionButtonWidthConstraint setConstant:v3 * -2.0];
  if (![(TPSBaseTipCollectionViewCell *)self isSharedVariant]) {
    [(NSLayoutConstraint *)self->_actionButtonBottomConstraint setConstant:self->_bottomPadding];
  }
  [(TPSBaseTipCollectionViewCell *)self updateHeroHeightConstraint];
  v4.receiver = self;
  v4.super_class = (Class)TPSBaseTipCollectionViewCell;
  [(TPSBaseTipCollectionViewCell *)&v4 updateConstraints];
}

- (void)updateHeroHeightConstraint
{
  [(TPSTipCellAppearance *)self->_cellAppearance assetHeight];
  double v4 = v3;
  if (self->_cellAppearance)
  {
    heroAssetView = self->_heroAssetView;
    if (heroAssetView)
    {
      id v6 = [(TPSVideoAssetView *)heroAssetView image];
      if (v6)
      {
        BOOL isSharedVariant = self->_isSharedVariant;

        if (isSharedVariant)
        {
          id v8 = [(TPSVideoAssetView *)self->_heroAssetView image];
          [v8 size];
          double v10 = v9;
          double v12 = v11;

          if (v12 > 0.0)
          {
            double v13 = v10 / v12;
            if (+[TPSCommonDefines isPhoneUI])
            {
              [(TPSBaseTipCollectionViewCell *)self bounds];
              BOOL v14 = 0;
              double v4 = v15 / v13;
            }
            else
            {
              BOOL v14 = v13 >= 1.0;
            }
            [(TPSVideoAssetView *)self->_heroAssetView setAspectFillAsset:v14];
          }
        }
      }
    }
  }
  assetViewHeightConstraint = self->_assetViewHeightConstraint;

  [(NSLayoutConstraint *)assetViewHeightConstraint setConstant:v4];
}

- (BOOL)videoHasFinished
{
  return [(TPSVideoAssetView *)self->_heroAssetView videoPlaybackFinished];
}

- (void)scrubVideoToFirstFrame
{
  [(TPSBaseTipCollectionViewCell *)self logAnimationFinished];
  heroAssetView = self->_heroAssetView;

  [(TPSVideoAssetView *)heroAssetView scrubVideoToFirstFrame];
}

- (void)continuePlayVideo
{
  [(TPSVideoAssetView *)self->_heroAssetView continuePlayVideo];

  [(TPSBaseTipCollectionViewCell *)self setShouldLogAnimationFinished:1];
}

- (void)resetVideoPlayer
{
  [(TPSVideoAssetView *)self->_heroAssetView resetVideoPlayer];

  [(TPSBaseTipCollectionViewCell *)self logAnimationFinished];
}

- (void)playVideo
{
  [(TPSBaseTipCollectionViewCell *)self setAnimationSource:TPSAnimationSourceOrganic];
  heroAssetView = self->_heroAssetView;

  [(TPSVideoAssetView *)heroAssetView playVideo];
}

- (void)replayVideo
{
  [(TPSBaseTipCollectionViewCell *)self logAnimationFinished];
  [(TPSBaseTipCollectionViewCell *)self setAnimationSource:TPSAnimationSourceOther];
  [(TPSBaseTipCollectionViewCell *)self setShouldLogAnimationFinished:1];
  heroAssetView = self->_heroAssetView;

  [(TPSVideoAssetView *)heroAssetView replayVideo];
}

- (void)replayButtonTapped
{
  [(TPSBaseTipCollectionViewCell *)self setAnimationSource:TPSAnimationSourceReplay];
  [(TPSBaseTipCollectionViewCell *)self setShouldLogAnimationFinished:1];
  [(TPSVideoAssetView *)self->_heroAssetView replayVideo];
  id v10 = [(TPSBaseTipCollectionViewCell *)self tip];
  double v3 = [v10 identifier];
  double v4 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v5 = [v4 collectionIdentifiers];
  id v6 = [v5 firstObject];
  objc_super v7 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v8 = [v7 correlationID];
  double v9 = +[TPSAnalyticsEventReplayButtonTapped eventWithTipID:v3 collectionID:v6 correlationID:v8];
  [v9 log];
}

- (void)loadBodyContentIfNeeded
{
  id v10 = [(TPSBaseTipCollectionViewCell *)self tip];
  uint64_t v3 = [v10 bodyContent];
  if (!v3)
  {
LABEL_4:

    return;
  }
  double v4 = (void *)v3;
  id v5 = [(TPSBaseTipCollectionViewCell *)self contentLabel];
  id v6 = [v5 attributedText];
  if ([v6 length])
  {

    goto LABEL_4;
  }
  objc_super v7 = [(TPSBaseTipCollectionViewCell *)self contentTextView];
  id v8 = [v7 attributedText];
  id v9 = [v8 length];

  if (!v9)
  {
    [(TPSBaseTipCollectionViewCell *)self updateContentLabel];
  }
}

- (void)stopVideoPlayer
{
}

- (void)updateAssetPaths
{
  [(TPSBaseTipCollectionViewCell *)self stopVideoPlayer];
  [(TPSBaseTipCollectionViewCell *)self updateAssetsConfiguration];
  [(TPSBaseTipCollectionViewCell *)self updateAssetIfAllowed];
  [(TPSBaseTipCollectionViewCell *)self updateVideoPath];

  [(TPSBaseTipCollectionViewCell *)self updateAssetViewBackground];
}

- (void)updateImageReadyStatus
{
  if (![(TPSBaseTipCollectionViewCell *)self bodyContentProcessingCount]
    && [(TPSBaseTipCollectionViewCell *)self heroImageUpdated])
  {
    [(TPSBaseTipCollectionViewCell *)self setImageLoadingFinished:1];
    [(TPSBaseTipCollectionViewCell *)self updateLoadingStatus];
  }
}

- (void)imageAssetViewImageUpdated:(id)a3
{
  if (self->_heroAssetView == a3)
  {
    [(TPSBaseTipCollectionViewCell *)self setHeroImageUpdated:1];
    [(TPSBaseTipCollectionViewCell *)self updateImageReadyStatus];
  }
}

- (BOOL)videoAssetViewCanDisplayAssets:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained tipCollectionViewCellCanDisplayAssets:v3];

  return (char)v3;
}

- (void)videoAssetViewUpdateAssetLoadingFinished:(id)a3 error:(id)a4
{
  [(TPSBaseTipCollectionViewCell *)self setVideoLoadingFinished:1];
  [(TPSBaseTipCollectionViewCell *)self updateLoadingStatus];
  if (!a4)
  {
    id v9 = [(TPSBaseTipCollectionViewCell *)self tip];
    id v6 = [v9 identifier];
    objc_super v7 = +[NSDate now];
    [v7 timeIntervalSinceDate:self->_animationInitialLoadTime];
    id v8 = +[TPSAnalyticsEventAnimationLoadTime eventWithTipID:animationLoadTime:](TPSAnalyticsEventAnimationLoadTime, "eventWithTipID:animationLoadTime:", v6);
    [v8 log];
  }
}

- (void)constellationContentParserAttributedStringUpdated:(id)a3
{
  id v10 = a3;
  double v4 = [v10 identifier];
  id v5 = [(TPSBaseTipCollectionViewCell *)self tip];
  id v6 = [v5 identifier];
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(TPSBaseTipCollectionViewCell *)self appController];
    id v9 = [v10 attributedString];
    [v8 updateAttributedString:v9 forIdentifier:v4];

    [(TPSTipContentTextView *)self->_contentTextView setTipID:0];
    [(TPSTipContentLabel *)self->_contentLabel setTipID:0];
    [(TPSTipContentTextView *)self->_contentTextView setAttributedText:0];
    [(TPSTipContentLabel *)self->_contentLabel setAttributedText:0];
    -[TPSBaseTipCollectionViewCell setBodyContentProcessingCount:](self, "setBodyContentProcessingCount:", [v10 numOfActiveRemoteURLSessions]);
    [(TPSBaseTipCollectionViewCell *)self updateAttributedStringWithCache];
  }
}

- (id)constellationContentParserBoldFont:(id)a3
{
  return +[TPSAppearance boldTextFont];
}

- (id)constellationContentParserItalicFont:(id)a3
{
  return +[TPSAppearance italicTextFont];
}

- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4
{
  return a4.length > 1;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isSharedVariant
    && ([(TPSBaseTipCollectionViewCell *)self appController],
        double v11 = objc_claimAutoreleasedReturnValue(),
        [(TPSBaseTipCollectionViewCell *)self tip],
        double v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v11 hasLocalVariant:v12],
        v12,
        v11,
        v13))
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100022794;
    v19[3] = &unk_1000B7580;
    v19[4] = self;
    BOOL v14 = +[UIAction actionWithHandler:v19];
    double v15 = v10;
  }
  else
  {
    BOOL v14 = v10;
    if ([v9 contentType]) {
      goto LABEL_7;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100022858;
    v17[3] = &unk_1000B75A8;
    v17[4] = self;
    id v18 = v9;
    BOOL v14 = +[UIAction actionWithHandler:v17];

    double v15 = v18;
  }

LABEL_7:

  return v14;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (void)handleTripleTapInternalGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tipCollectionViewCellHandleTripleTapInternalGesture:self];
}

- (TPSBaseTipCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSBaseTipCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hasBodyContent
{
  return self->_hasBodyContent;
}

- (void)setHasBodyContent:(BOOL)a3
{
  self->_hasBodyContent = a3;
}

- (BOOL)needsTextView
{
  return self->_needsTextView;
}

- (BOOL)hasNotifiedDelegateContentLoaded
{
  return self->_hasNotifiedDelegateContentLoaded;
}

- (void)setHasNotifiedDelegateContentLoaded:(BOOL)a3
{
  self->_hasNotifiedDelegateContentLoaded = a3;
}

- (BOOL)contentFinishedLoading
{
  return self->_contentFinishedLoading;
}

- (void)setContentFinishedLoading:(BOOL)a3
{
  self->_contentFinishedLoading = a3;
}

- (BOOL)showImageOnLoadFail
{
  return self->_showImageOnLoadFail;
}

- (void)setShowImageOnLoadFail:(BOOL)a3
{
  self->_showImageOnLoadFail = a3;
}

- (BOOL)canShowMedia
{
  return self->_canShowMedia;
}

- (void)setCanShowMedia:(BOOL)a3
{
  self->_canShowMedia = a3;
}

- (BOOL)imageLoadingFinished
{
  return self->_imageLoadingFinished;
}

- (void)setImageLoadingFinished:(BOOL)a3
{
  self->_imageLoadingFinished = a3;
}

- (BOOL)videoLoadingFinished
{
  return self->_videoLoadingFinished;
}

- (void)setVideoLoadingFinished:(BOOL)a3
{
  self->_videoLoadingFinished = a3;
}

- (double)imageParallaxMultiplier
{
  return self->_imageParallaxMultiplier;
}

- (void)setImageParallaxMultiplier:(double)a3
{
  self->_imageParallaxMultiplier = a3;
}

- (double)additionalBottomOffset
{
  return self->_additionalBottomOffset;
}

- (void)setAdditionalBottomOffset:(double)a3
{
  self->_additionalBottomOffset = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (float)labelHyphenationFactor
{
  return self->_labelHyphenationFactor;
}

- (void)setLabelHyphenationFactor:(float)a3
{
  self->_labelHyphenationFactor = a3;
}

- (CGSize)cacheCellSize
{
  double width = self->_cacheCellSize.width;
  double height = self->_cacheCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCacheCellSize:(CGSize)a3
{
  self->_cacheCellSize = a3;
}

- (UIEdgeInsets)contentSafeAreaInsets
{
  double top = self->_contentSafeAreaInsets.top;
  double left = self->_contentSafeAreaInsets.left;
  double bottom = self->_contentSafeAreaInsets.bottom;
  double right = self->_contentSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)parallaxOffset
{
  double x = self->_parallaxOffset.x;
  double y = self->_parallaxOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIColor)noImageBackgroundColorOverride
{
  return self->_noImageBackgroundColorOverride;
}

- (void)setNoImageBackgroundColorOverride:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (NSLayoutConstraint)actionButtonBottomConstraint
{
  return self->_actionButtonBottomConstraint;
}

- (void)setActionButtonBottomConstraint:(id)a3
{
}

- (TPSTip)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
}

- (TPSVideoAssetView)heroAssetView
{
  return self->_heroAssetView;
}

- (void)setHeroAssetView:(id)a3
{
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (TPSTipCellAppearance)cellAppearance
{
  return self->_cellAppearance;
}

- (void)setCellAppearance:(id)a3
{
}

- (TPSTipContentLabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
}

- (TPSTipContentTextView)contentTextView
{
  return self->_contentTextView;
}

- (void)setContentTextView:(id)a3
{
}

- (NSLayoutConstraint)assetViewLayoutGuideCenterXConstraint
{
  return self->_assetViewLayoutGuideCenterXConstraint;
}

- (void)setAssetViewLayoutGuideCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)assetViewHeightConstraint
{
  return self->_assetViewHeightConstraint;
}

- (void)setAssetViewHeightConstraint:(id)a3
{
}

- (UIScrollView)contentScrollView
{
  return self->_contentScrollView;
}

- (void)setContentScrollView:(id)a3
{
}

- (NSArray)contentLabelConstraints
{
  return self->_contentLabelConstraints;
}

- (void)setContentLabelConstraints:(id)a3
{
}

- (NSArray)contentTextViewConstraints
{
  return self->_contentTextViewConstraints;
}

- (void)setContentTextViewConstraints:(id)a3
{
}

- (BOOL)isSharedVariant
{
  return self->_isSharedVariant;
}

- (void)setIsSharedVariant:(BOOL)a3
{
  self->_BOOL isSharedVariant = a3;
}

- (BOOL)heroImageUpdated
{
  return self->_heroImageUpdated;
}

- (void)setHeroImageUpdated:(BOOL)a3
{
  self->_heroImageUpdated = a3;
}

- (BOOL)shouldLogAnimationFinished
{
  return self->_shouldLogAnimationFinished;
}

- (void)setShouldLogAnimationFinished:(BOOL)a3
{
  self->_shouldLogAnimationFinished = a3;
}

- (NSString)animationSource
{
  return self->_animationSource;
}

- (void)setAnimationSource:(id)a3
{
  self->_animationSource = (NSString *)a3;
}

- (int64_t)bodyContentProcessingCount
{
  return self->_bodyContentProcessingCount;
}

- (void)setBodyContentProcessingCount:(int64_t)a3
{
  self->_bodyContentProcessingCount = a3;
}

- (NSBlockOperation)contentTextOperation
{
  return self->_contentTextOperation;
}

- (void)setContentTextOperation:(id)a3
{
}

- (NSString)contentTextOperationID
{
  return self->_contentTextOperationID;
}

- (void)setContentTextOperationID:(id)a3
{
}

- (NSDate)animationInitialLoadTime
{
  return self->_animationInitialLoadTime;
}

- (void)setAnimationInitialLoadTime:(id)a3
{
}

- (TPSAssetsConfiguration)assetsConfiguration
{
  return self->_assetsConfiguration;
}

- (void)setAssetsConfiguration:(id)a3
{
}

- (TPSKVOManager)KVOManager
{
  return self->_KVOManager;
}

- (void)setKVOManager:(id)a3
{
}

- (TPSConstellationContentParser)contentParser
{
  return self->_contentParser;
}

- (void)setContentParser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentParser, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_assetsConfiguration, 0);
  objc_storeStrong((id *)&self->_animationInitialLoadTime, 0);
  objc_storeStrong((id *)&self->_contentTextOperationID, 0);
  objc_storeStrong((id *)&self->_contentTextOperation, 0);
  objc_storeStrong((id *)&self->_contentTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_contentLabelConstraints, 0);
  objc_storeStrong((id *)&self->_contentScrollView, 0);
  objc_storeStrong((id *)&self->_assetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assetViewLayoutGuideCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_contentTextView, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_cellAppearance, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_heroAssetView, 0);
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_actionButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_noImageBackgroundColorOverride, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonTextViewTopConstraint, 0);

  objc_storeStrong((id *)&self->_actionButtonTextLabelTopConstraint, 0);
}

- (void)handleURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  static TipsWorkspace.openSensitive(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end