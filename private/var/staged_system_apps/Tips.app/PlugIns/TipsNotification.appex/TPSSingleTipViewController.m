@interface TPSSingleTipViewController
- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4;
- (BOOL)hasPlayerInProgress;
- (BOOL)isOneLinerForText:(id)a3 maxWidth:(double)a4 font:(id)a5;
- (BOOL)supportInlineLinks;
- (BOOL)translucentBackground;
- (NSBlockOperation)contentTextOperation;
- (NSString)collectionID;
- (TPSAssetSizes)assetSizes;
- (TPSAssetsConfiguration)assetsConfiguration;
- (TPSSingleTipViewController)initWithAppController:(id)a3;
- (TPSSingleTipViewController)initWithAppController:(id)a3 translucentBackground:(BOOL)a4;
- (TPSSingleTipViewControllerDelegate)delegate;
- (TPSTip)tip;
- (TPSUIAppController)appController;
- (UITextView)bodyTextView;
- (double)maxWidth;
- (id)constellationContentParserBoldFont:(id)a3;
- (id)constellationContentParserItalicFont:(id)a3;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)analyticsIncreaseCountForCurrentTip;
- (void)cancelConstellationContentParserOperation;
- (void)cancelScheduledIncreaseViewCount;
- (void)constellationContentParser:(id)a3 identifier:(id)a4 attributedStringUpdated:(id)a5;
- (void)createViews;
- (void)dealloc;
- (void)imageAssetViewImageUpdated:(id)a3;
- (void)playVideo;
- (void)replayVideo;
- (void)scheduleIncreaseViewCount;
- (void)scrubVideoToFirstFrame;
- (void)setAppController:(id)a3;
- (void)setAssetSizes:(id)a3;
- (void)setAssetsConfiguration:(id)a3;
- (void)setBodyTextView:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setContentTextOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSupportInlineLinks:(BOOL)a3;
- (void)setTip:(id)a3;
- (void)setTip:(id)a3 visible:(BOOL)a4;
- (void)setTip:(id)a3 visible:(BOOL)a4 completionHandler:(id)a5;
- (void)setTranslucentBackground:(BOOL)a3;
- (void)setupForSnapshot;
- (void)updateAssetsConfiguration;
- (void)updateBodyText;
- (void)updateImageWithCompletionHandler:(id)a3;
- (void)updateVideoAndPlayImmediately:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TPSSingleTipViewController

- (void)dealloc
{
  [(NSOperationQueue *)self->_attributedStringOperationQueue cancelAllOperations];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"analyticsIncreaseCountForCurrentTip" object:0];
  v3.receiver = self;
  v3.super_class = (Class)TPSSingleTipViewController;
  [(TPSSingleTipViewController *)&v3 dealloc];
}

- (TPSSingleTipViewController)initWithAppController:(id)a3
{
  return [(TPSSingleTipViewController *)self initWithAppController:a3 translucentBackground:0];
}

- (TPSSingleTipViewController)initWithAppController:(id)a3 translucentBackground:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSingleTipViewController;
  v8 = [(TPSSingleTipViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appController, a3);
    v9->_translucentBackground = a4;
  }

  return v9;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSingleTipViewController;
  [(TPSSingleTipViewController *)&v7 viewDidLoad];
  objc_super v3 = +[AVAudioSession sharedInstance];
  [v3 setCategory:AVAudioSessionCategoryAmbient error:0];

  [(TPSSingleTipViewController *)self createViews];
  pendingTip = self->_pendingTip;
  if (pendingTip)
  {
    objc_storeStrong((id *)&self->_tip, pendingTip);
    [(TPSSingleTipViewController *)self updateAssetsConfiguration];
  }
  if (self->_translucentBackground)
  {
    v5 = +[UIColor clearColor];
    [(TPSVideoAssetView *)self->_heroAssetView setDefaultBackgroundColor:v5];

    v6 = +[UIColor clearColor];
    [(TPSVideoAssetView *)self->_heroAssetView setNoImageBackgroundColor:v6];
  }
  else
  {
    v6 = +[TPSAppearance defaultBackgroundColor];
    [(TPSVideoAssetView *)self->_heroAssetView setDefaultBackgroundColor:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSSingleTipViewController;
  [(TPSSingleTipViewController *)&v8 viewWillAppear:a3];
  v4 = [(TPSSingleTipViewController *)self assetsConfiguration];
  v5 = [v4 cacheIdentifierForType:0];

  if (v5)
  {
    v6 = +[TPSImageAssetController dataCacheForIdentifier:v5];

    if (v6)
    {
      objc_super v7 = +[TPSImageAssetController getImageForIdentifier:v5];
      [(TPSVideoAssetView *)self->_heroAssetView setImage:v7];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSSingleTipViewController;
  [(TPSSingleTipViewController *)&v4 viewDidAppear:a3];
  self->_viewDidAppeared = 1;
  [(TPSSingleTipViewController *)self playVideo];
}

- (void)cancelConstellationContentParserOperation
{
  [(NSBlockOperation *)self->_contentTextOperation cancel];
  contentTextOperation = self->_contentTextOperation;
  self->_contentTextOperation = 0;
}

- (BOOL)hasPlayerInProgress
{
  return [(TPSVideoAssetView *)self->_heroAssetView videoInProgress];
}

- (void)playVideo
{
  if (self->_viewDidAppeared) {
    [(TPSSingleTipViewController *)self updateVideoAndPlayImmediately:1];
  }
}

- (void)setupForSnapshot
{
  [(TPSVideoAssetView *)self->_heroAssetView removeVideoPlayerLayer];
  heroAssetView = self->_heroAssetView;

  [(TPSVideoAssetView *)heroAssetView setImage:0];
}

- (void)createViews
{
  if (!self->_heroAssetView)
  {
    objc_super v3 = (TPSVideoAssetView *)objc_alloc_init((Class)TPSVideoAssetView);
    heroAssetView = self->_heroAssetView;
    self->_heroAssetView = v3;

    [(TPSVideoAssetView *)self->_heroAssetView setDelegate:self];
    [(TPSVideoAssetView *)self->_heroAssetView setVideoDelegate:self];
    [(TPSVideoAssetView *)self->_heroAssetView setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(TPSSingleTipViewController *)self view];
    [v5 addSubview:self->_heroAssetView];

    v6 = [(TPSVideoAssetView *)self->_heroAssetView leadingAnchor];
    objc_super v7 = [(TPSSingleTipViewController *)self view];
    objc_super v8 = [v7 leadingAnchor];
    v9 = [v6 constraintEqualToAnchor:v8];
    [v9 setActive:1];

    v10 = [(TPSVideoAssetView *)self->_heroAssetView trailingAnchor];
    objc_super v11 = [(TPSSingleTipViewController *)self view];
    v12 = [v11 trailingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(TPSVideoAssetView *)self->_heroAssetView topAnchor];
    v15 = [(TPSSingleTipViewController *)self view];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(TPSVideoAssetView *)self->_heroAssetView heightAnchor];
    v19 = [(TPSVideoAssetView *)self->_heroAssetView widthAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    heroAssetViewHeightConstraint = self->_heroAssetViewHeightConstraint;
    self->_heroAssetViewHeightConstraint = v20;

    LODWORD(v22) = 1148829696;
    [(NSLayoutConstraint *)self->_heroAssetViewHeightConstraint setPriority:v22];
    [(NSLayoutConstraint *)self->_heroAssetViewHeightConstraint setActive:1];
  }
  if (!self->_titleLabel)
  {
    v23 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v23;

    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    v25 = +[TPSAppearance titleLabelFont];
    [(UILabel *)self->_titleLabel setFont:v25];

    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    LODWORD(v26) = 1144750080;
    [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v26];
    v27 = [(TPSSingleTipViewController *)self view];
    [v27 insertSubview:self->_titleLabel belowSubview:self->_heroAssetView];

    v28 = [(UILabel *)self->_titleLabel leadingAnchor];
    v29 = [(TPSSingleTipViewController *)self view];
    v30 = [v29 leadingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    titleLabelLeadingConstraint = self->_titleLabelLeadingConstraint;
    self->_titleLabelLeadingConstraint = v31;

    [(NSLayoutConstraint *)self->_titleLabelLeadingConstraint setActive:1];
    v33 = [(UILabel *)self->_titleLabel trailingAnchor];
    v34 = [(TPSVideoAssetView *)self->_heroAssetView trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:-30.0];
    [v35 setActive:1];

    v36 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v37 = [(TPSVideoAssetView *)self->_heroAssetView bottomAnchor];
    v38 = [v36 constraintEqualToSystemSpacingBelowAnchor:v37 multiplier:1.2];
    [v38 setActive:1];
  }
  if (!self->_bodyTextView)
  {
    v39 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    bodyTextView = self->_bodyTextView;
    self->_bodyTextView = v39;

    [(UITextView *)self->_bodyTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)self->_bodyTextView setScrollEnabled:0];
    [(UITextView *)self->_bodyTextView _setInteractiveTextSelectionDisabled:1];
    v41 = +[UIColor clearColor];
    [(UITextView *)self->_bodyTextView setBackgroundColor:v41];

    [(UITextView *)self->_bodyTextView setEditable:0];
    [(UITextView *)self->_bodyTextView setDataDetectorTypes:0];
    v42 = [(UITextView *)self->_bodyTextView textContainer];
    [v42 setHeightTracksTextView:1];

    [(UITextView *)self->_bodyTextView setDelegate:self];
    v43 = [(UITextView *)self->_bodyTextView textContainer];
    [v43 setLineBreakMode:4];

    -[UITextView setTextContainerInset:](self->_bodyTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v44 = [(UITextView *)self->_bodyTextView textContainer];
    [v44 setLineFragmentPadding:0.0];

    v45 = +[TPSAppearance defaultLabelColor];
    [(UITextView *)self->_bodyTextView setTextColor:v45];

    if (self->_supportInlineLinks)
    {
      NSAttributedStringKey v63 = NSForegroundColorAttributeName;
      v46 = +[UIColor systemBlueColor];
      v64 = v46;
      v47 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      [(UITextView *)self->_bodyTextView setLinkTextAttributes:v47];
    }
    v48 = [(TPSSingleTipViewController *)self view];
    [v48 insertSubview:self->_bodyTextView belowSubview:self->_heroAssetView];

    v49 = [(UITextView *)self->_bodyTextView leadingAnchor];
    v50 = [(TPSSingleTipViewController *)self view];
    v51 = [v50 leadingAnchor];
    v52 = [v49 constraintEqualToAnchor:v51 constant:30.0];
    [v52 setActive:1];

    v53 = [(UITextView *)self->_bodyTextView trailingAnchor];
    v54 = [(UILabel *)self->_titleLabel trailingAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v55 setActive:1];

    v56 = [(UITextView *)self->_bodyTextView bottomAnchor];
    v57 = [(TPSSingleTipViewController *)self view];
    v58 = [v57 bottomAnchor];
    v59 = [v56 constraintEqualToAnchor:v58 constant:-12.0];
    [v59 setActive:1];

    v60 = [(UITextView *)self->_bodyTextView firstBaselineAnchor];
    v61 = [(UILabel *)self->_titleLabel lastBaselineAnchor];
    v62 = [v60 constraintEqualToSystemSpacingBelowAnchor:v61 multiplier:1.2];
    [v62 setActive:1];
  }
}

- (void)analyticsIncreaseCountForCurrentTip
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"analyticsIncreaseCountForCurrentTip" object:0];
  tip = self->_tip;
  if (tip)
  {
    id v12 = [(TPSTip *)tip identifier];
    objc_super v4 = [(TPSSingleTipViewController *)self collectionID];
    v5 = [(TPSTip *)self->_tip correlationID];
    v6 = [(TPSTip *)self->_tip clientConditionID];
    uint64_t v7 = TPSAnalyticsViewMethodNotification;
    objc_super v8 = [(TPSSingleTipViewController *)self traitCollection];
    v9 = +[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:v8];
    v10 = +[TPSAnalyticsEventContentViewed eventWithContentID:v12 collectionID:v4 correlationID:v5 clientConditionID:v6 viewMethod:v7 viewMode:v9];
    [v10 log];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained singleTipViewController:self tipViewed:self->_tip];
  }
}

- (void)setTip:(id)a3
{
}

- (void)setTip:(id)a3 visible:(BOOL)a4
{
}

- (void)setTip:(id)a3 visible:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [v9 language];
  id v12 = +[TPSCommonDefines sharedInstance];
  [v12 setLanguage:v11];

  if (self->_titleLabel)
  {
    BOOL v39 = v6;
    v13 = [v9 identifier];
    v14 = [(TPSTip *)self->_tip identifier];
    unsigned __int8 v15 = [v13 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      v16 = [(TPSSingleTipViewController *)self assetSizes];
      v17 = [v16 tip];

      v18 = (int *)&unk_100011000;
      if (!v17) {
        goto LABEL_8;
      }
      uint64_t v19 = +[TPSCommonDefines isPhoneUI] ^ 1;
      v20 = [(TPSSingleTipViewController *)self assetSizes];
      v21 = [v20 tip];
      [v21 heightToWidthRatioForViewMode:v19];
      double v23 = v22;

      v18 = (_DWORD *)&unk_100011000;
      if (v23 > 0.0)
      {
        double v24 = 0.0;
      }
      else
      {
LABEL_8:
        v25 = +[TPSCommonDefines sharedInstance];
        id v26 = [v25 assetRatioType];
        if (+[TPSCommonDefines isPhoneUI])
        {
          double v23 = dbl_1000095C0[v26 == (id)1];
          double v24 = 0.0;
        }
        else
        {
          [*(id *)((char *)&self->super.super.super.isa + v18[489]) setAspectFillAsset:1];
          double v23 = 0.9644;
          double v24 = 110.05;
        }
      }
      [(NSLayoutConstraint *)self->_heroAssetViewHeightConstraint setActive:0];
      [(NSLayoutConstraint *)self->_heroAssetViewHeightRatioConstraint setActive:0];
      uint64_t v27 = v18[489];
      v28 = [*(id *)((char *)&self->super.super.super.isa + v27) heightAnchor];
      v29 = [(TPSSingleTipViewController *)self view];
      v30 = [v29 widthAnchor];
      v31 = [v28 constraintEqualToAnchor:v30 multiplier:v23 constant:-v24];
      heroAssetViewHeightRatioConstraint = self->_heroAssetViewHeightRatioConstraint;
      self->_heroAssetViewHeightRatioConstraint = v31;

      [(NSLayoutConstraint *)self->_heroAssetViewHeightRatioConstraint setActive:1];
      objc_storeStrong((id *)&self->_tip, a3);
      [(TPSSingleTipViewController *)self updateAssetsConfiguration];
      v33 = [v9 language];
      v34 = +[TPSAssetCacheController sharedInstance];
      [v34 setLanguageCode:v33];

      [*(id *)((char *)&self->super.super.super.isa + v27) cancel];
      id heroAssetFetchCompletionHandler = self->_heroAssetFetchCompletionHandler;
      self->_id heroAssetFetchCompletionHandler = 0;

      [(NSLayoutConstraint *)self->_titleLabelLeadingConstraint constant];
      if (v36 == 0.0) {
        [(NSLayoutConstraint *)self->_titleLabelLeadingConstraint setConstant:30.0];
      }
      v37 = [(TPSTip *)self->_tip title];
      [(UILabel *)self->_titleLabel setText:v37];

      [(TPSSingleTipViewController *)self updateBodyText];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100005E80;
      v40[3] = &unk_10000C308;
      id v41 = v10;
      [(TPSSingleTipViewController *)self updateImageWithCompletionHandler:v40];
      [*(id *)((char *)&self->super.super.super.isa + v27) stopVideoPlayer];
      if (v39)
      {
        [(TPSSingleTipViewController *)self updateVideoAndPlayImmediately:0];
        [(TPSSingleTipViewController *)self scheduleIncreaseViewCount];
      }
      pendingTip = self->_pendingTip;
      self->_pendingTip = 0;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingTip, a3);
    if (v10) {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)updateAssetsConfiguration
{
  id v15 = [(TPSSingleTipViewController *)self appController];
  v14 = [(TPSSingleTipViewController *)self tip];
  v13 = [v14 fullContent];
  objc_super v3 = [v13 assets];
  objc_super v4 = [(TPSSingleTipViewController *)self tip];
  v5 = [v4 language];
  if (+[TPSCommonDefines isPhoneUI]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  uint64_t v7 = [(TPSSingleTipViewController *)self view];
  objc_super v8 = [v7 traitCollection];
  id v9 = [v8 userInterfaceStyle];
  id v10 = [(TPSSingleTipViewController *)self tip];
  objc_super v11 = [v10 assetFileInfoManager];
  id v12 = [v15 assetConfigurationForAssets:v3 language:v5 sizeClass:v6 style:v9 assetFileInfoManager:v11];
  [(TPSSingleTipViewController *)self setAssetsConfiguration:v12];
}

- (void)scheduleIncreaseViewCount
{
  [(TPSSingleTipViewController *)self cancelScheduledIncreaseViewCount];
  if (self->_tip)
  {
    double v3 = kTipsAnalyticsDelayedEventInterval;
    [(TPSSingleTipViewController *)self performSelector:"analyticsIncreaseCountForCurrentTip" withObject:0 afterDelay:v3];
  }
}

- (void)cancelScheduledIncreaseViewCount
{
}

- (BOOL)isOneLinerForText:(id)a3 maxWidth:(double)a4 font:(id)a5
{
  if (!a5) {
    return 0;
  }
  NSAttributedStringKey v22 = NSFontAttributeName;
  id v23 = a5;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v8 boundingRectWithSize:1 options:v9 attributes:0 context:1.79769313e308];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  double Height = CGRectGetHeight(v24);
  [v7 lineHeight];
  double v20 = v19;

  return Height == v20;
}

- (double)maxWidth
{
  v2 = [(TPSSingleTipViewController *)self view];
  [v2 bounds];
  double Width = CGRectGetWidth(v5);

  return Width;
}

- (void)updateBodyText
{
  [(TPSSingleTipViewController *)self cancelConstellationContentParserOperation];
  v33 = +[TPSAppearance defaultTextLabelFont];
  v32 = +[TPSAppearance defaultLabelColor];
  v46[0] = NSFontAttributeName;
  v46[1] = NSForegroundColorAttributeName;
  v47[0] = v33;
  v47[1] = v32;
  v31 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  double v3 = [(TPSSingleTipViewController *)self tip];
  objc_super v4 = [v3 bodyText];

  if (v4)
  {
    id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v4 attributes:v31];
    id v6 = [(TPSSingleTipViewController *)self bodyTextView];
    [v6 setAttributedText:v5];
LABEL_7:

    goto LABEL_8;
  }
  id v7 = [(TPSSingleTipViewController *)self tip];
  id v5 = [v7 bodyContent];

  if (v5)
  {
    id v8 = objc_alloc_init((Class)TPSConstellationContentParser);
    [v8 setDelegate:self];
    id v9 = [(TPSSingleTipViewController *)self view];
    double v10 = [v9 traitCollection];
    [v8 setTraitCollection:v10];

    [v8 setIgnoreLinks:!self->_supportInlineLinks];
    if (!self->_attributedStringOperationQueue)
    {
      CGFloat v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
      attributedStringOperationQueue = self->_attributedStringOperationQueue;
      self->_attributedStringOperationQueue = v11;

      [(NSOperationQueue *)self->_attributedStringOperationQueue setMaxConcurrentOperationCount:4];
    }
    objc_initWeak(&location, self);
    CGFloat v13 = [(TPSSingleTipViewController *)self tip];
    double v14 = [v13 identifier];
    objc_initWeak(&from, v14);

    CGFloat v15 = [(TPSSingleTipViewController *)self tip];
    v29 = [v15 identifier];

    double v16 = [(TPSSingleTipViewController *)self tip];
    CGFloat v17 = [v16 language];

    v18 = [(TPSSingleTipViewController *)self tip];
    double v19 = [v18 fullContentAssets];
    double v20 = [v19 baseURL];

    v21 = [(TPSSingleTipViewController *)self tip];
    NSAttributedStringKey v22 = [v21 assetFileInfoManager];

    id v23 = (NSBlockOperation *)objc_alloc_init((Class)NSBlockOperation);
    contentTextOperation = self->_contentTextOperation;
    self->_contentTextOperation = v23;

    v25 = self->_contentTextOperation;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000066C0;
    v34[3] = &unk_10000C358;
    id v6 = v8;
    id v35 = v6;
    id v5 = v5;
    id v36 = v5;
    id v37 = v31;
    id v28 = v29;
    id v38 = v28;
    id v30 = v17;
    id v39 = v30;
    id v26 = v20;
    id v40 = v26;
    id v27 = v22;
    id v41 = v27;
    objc_copyWeak(&v42, &location);
    objc_copyWeak(&v43, &from);
    [(NSBlockOperation *)v25 addExecutionBlock:v34];
    [(NSOperationQueue *)self->_attributedStringOperationQueue addOperation:self->_contentTextOperation];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v42);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateImageWithCompletionHandler:(id)a3
{
  id v13 = a3;
  objc_super v4 = [(TPSSingleTipViewController *)self assetsConfiguration];
  id v5 = +[TPSContentURLController assetPathFromAssetConfiguration:v4 type:0];

  heroAssetView = self->_heroAssetView;
  if (v5)
  {
    id v7 = [(TPSVideoAssetView *)heroAssetView currentImagePath];
    unsigned __int8 v8 = [v5 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [(TPSSingleTipViewController *)self assetsConfiguration];
      double v10 = [v9 cacheIdentifierForType:0];

      id v11 = [v13 copy];
      id heroAssetFetchCompletionHandler = self->_heroAssetFetchCompletionHandler;
      self->_id heroAssetFetchCompletionHandler = v11;

      [(TPSVideoAssetView *)self->_heroAssetView fetchImageWithIdentifier:v10 path:v5];
      goto LABEL_6;
    }
  }
  else
  {
    [(TPSVideoAssetView *)heroAssetView cancel];
    [(TPSVideoAssetView *)self->_heroAssetView setImage:0];
  }
  (*((void (**)(id, void))v13 + 2))(v13, 0);
LABEL_6:
}

- (void)scrubVideoToFirstFrame
{
}

- (void)replayVideo
{
}

- (void)updateVideoAndPlayImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TPSSingleTipViewController *)self assetsConfiguration];
  id v10 = [v5 cacheIdentifierForType:1];

  id v6 = [(TPSSingleTipViewController *)self assetsConfiguration];
  id v7 = +[TPSContentURLController assetPathFromAssetConfiguration:v6 type:1];

  unsigned __int8 v8 = [(TPSVideoAssetView *)self->_heroAssetView videoPath];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    [(TPSVideoAssetView *)self->_heroAssetView setCacheVideoIdentifier:v10];
    [(TPSVideoAssetView *)self->_heroAssetView setVideoPath:v7];
    goto LABEL_5;
  }
  if (v3) {
LABEL_5:
  }
    [(TPSVideoAssetView *)self->_heroAssetView playVideo];
}

- (id)constellationContentParserBoldFont:(id)a3
{
  return +[TPSAppearance boldTextFont];
}

- (id)constellationContentParserItalicFont:(id)a3
{
  return +[TPSAppearance italicTextFont];
}

- (void)constellationContentParser:(id)a3 identifier:(id)a4 attributedStringUpdated:(id)a5
{
  id v12 = a5;
  id v7 = a4;
  unsigned __int8 v8 = [(TPSSingleTipViewController *)self tip];
  unsigned __int8 v9 = [v8 identifier];
  unsigned int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    id v11 = [(TPSSingleTipViewController *)self bodyTextView];
    [v11 setAttributedText:v12];
  }
}

- (void)imageAssetViewImageUpdated:(id)a3
{
  objc_super v4 = (TPSVideoAssetView *)a3;
  id heroAssetFetchCompletionHandler = (void (**)(id, BOOL))self->_heroAssetFetchCompletionHandler;
  if (heroAssetFetchCompletionHandler && self->_heroAssetView == v4)
  {
    unsigned __int8 v8 = v4;
    id v6 = [(TPSVideoAssetView *)v4 image];
    heroAssetFetchCompletionHandler[2](heroAssetFetchCompletionHandler, v6 != 0);

    id v7 = self->_heroAssetFetchCompletionHandler;
    self->_id heroAssetFetchCompletionHandler = 0;

    objc_super v4 = v8;
  }
}

- (BOOL)_textView:(id)a3 shouldHighlightForInteractionInRange:(_NSRange)a4
{
  return 0;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  return 0;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  id v6 = a4;
  if (![v6 contentType])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned int v10 = [v6 link];
      [v9 singleTipViewController:self handleURL:v10];
    }
  }

  return 0;
}

- (TPSSingleTipViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSSingleTipViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)supportInlineLinks
{
  return self->_supportInlineLinks;
}

- (void)setSupportInlineLinks:(BOOL)a3
{
  self->_supportInlineLinks = a3;
}

- (BOOL)translucentBackground
{
  return self->_translucentBackground;
}

- (void)setTranslucentBackground:(BOOL)a3
{
  self->_translucentBackground = a3;
}

- (TPSTip)tip
{
  return self->_tip;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (TPSUIAppController)appController
{
  return self->_appController;
}

- (void)setAppController:(id)a3
{
}

- (TPSAssetSizes)assetSizes
{
  return self->_assetSizes;
}

- (void)setAssetSizes:(id)a3
{
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
}

- (TPSAssetsConfiguration)assetsConfiguration
{
  return self->_assetsConfiguration;
}

- (void)setAssetsConfiguration:(id)a3
{
}

- (NSBlockOperation)contentTextOperation
{
  return self->_contentTextOperation;
}

- (void)setContentTextOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTextOperation, 0);
  objc_storeStrong((id *)&self->_assetsConfiguration, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_assetSizes, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tip, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heroAssetView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_attributedStringOperationQueue, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightRatioConstraint, 0);
  objc_storeStrong((id *)&self->_heroAssetViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_pendingTip, 0);

  objc_storeStrong(&self->_heroAssetFetchCompletionHandler, 0);
}

@end