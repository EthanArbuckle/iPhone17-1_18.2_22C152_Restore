@interface MTEpisodeLockup
+ (BOOL)showsArtworkForStyle:(unint64_t)a3;
+ (BOOL)useLayoutForSkinnyPhones;
+ (BOOL)useSelfSizingCells;
+ (CGRect)frameForContentViewSize:(CGSize)a3 style:(unint64_t)a4;
+ (CGSize)artworkSizeForStyle:(unint64_t)a3;
+ (double)artworkHeightForStyle:(unint64_t)a3 sizeType:(unint64_t)a4;
+ (double)descriptionMaxHeightForCurrentOrientation;
+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4;
+ (double)leadingMarginForViewWidth:(double)a3;
+ (double)maximumContentWidthForStyle:(unint64_t)a3;
+ (double)maximumContentWidthForStyle:(unint64_t)a3 showsPlayState:(BOOL)a4;
+ (id)defaultArtworkForStyle:(unint64_t)a3;
+ (id)defaultArtworkWithSize:(CGSize)a3;
+ (id)dependentPropertyKeys;
+ (id)descriptionFont;
+ (id)descriptionTextStyle;
+ (id)footerTextStyle;
+ (id)metadataFooterFont;
+ (id)metadataHeaderFont;
+ (id)mockEpisode;
+ (id)titleFont;
+ (id)titleTextStyle;
+ (unint64_t)descriptionNumberOfLinesForStyle:(unint64_t)a3 isTitleMultipleLines:(BOOL)a4;
+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4;
+ (unint64_t)titleNumberOfLinesForStyle:(unint64_t)a3;
- (BOOL)_isRTL;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isEditing;
- (BOOL)isExpanded;
- (BOOL)isLabelMultipleLinesWithFrame:(CGRect)a3 font:(id)a4;
- (BOOL)shouldShowNowPlaying;
- (BOOL)showsAirplaneModeIcon;
- (BOOL)showsArtwork;
- (BOOL)showsDescriptionButton;
- (BOOL)showsDocumentIcon;
- (BOOL)showsErrorIcon;
- (BOOL)showsExplicitIcon;
- (BOOL)showsFooterTextView;
- (BOOL)showsMoreButton;
- (BOOL)showsPlayState;
- (BOOL)showsPubDate;
- (BOOL)showsStreamingIcon;
- (BOOL)updateDisabledReason;
- (BOOL)updateIsCurrentPlayerItemState;
- (BOOL)updateTitleFontIfNeeded;
- (CGRect)actionButtonFrameForViewWidth:(double)a3 titleOriginY:(double)a4;
- (CGRect)artworkFrameForStyle:(unint64_t)a3 forViewWidth:(double)a4;
- (CGRect)buttonsFrameForActionButtonFrame:(CGRect)a3 downloadButtonFrame:(CGRect)a4;
- (CGRect)descriptionButtonFrameForDescriptionFrame:(CGRect)a3;
- (CGRect)downloadButtonFrameForActionButtonFrame:(CGRect)a3 titleOriginY:(double)a4;
- (CGRect)explicitIconFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4;
- (CGRect)footerFrameForDescriptionButtonFrame:(CGRect)a3 descriptionFrame:(CGRect)a4;
- (CGRect)iconsViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 metadataFrame:(CGRect *)a5 style:(unint64_t)a6;
- (CGRect)metadataFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5;
- (CGRect)moreButtonFrameForDescriptionFrame:(CGRect)a3;
- (CGRect)playStatusViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 artworkFrame:(CGRect)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)titleSizeForViewWidth:(double)a3 titleOrigin:(CGPoint)a4 artworkFrame:(CGRect)a5 buttonViewFrame:(CGRect)a6 style:(unint64_t)a7;
- (IMActionSheetAction)moreAction;
- (MTColorTheme)colorTheme;
- (MTEpisode)episode;
- (MTEpisodeActionController)actionController;
- (MTEpisodeArtworkView)artworkView;
- (MTEpisodeLockup)initWithFrame:(CGRect)a3;
- (MTEpisodeLockupDelegate)delegate;
- (MTEpisodeStateView)buttonView;
- (MTEpisodeStateView)iconView;
- (MTNowPlayingIndicatorView)barsView;
- (MTTouchInsetsButton)descriptionButton;
- (MTTouchInsetsButton)moreButton;
- (NSOperation)imageLoadingOperation;
- (UIButton)actionButton;
- (UIEdgeInsets)_layoutMargins;
- (UIEdgeInsets)_layoutMarginsForViewWidth:(double)a3;
- (UIImage)titleImage;
- (UIImageView)explicitIconView;
- (UIImageView)playStatusView;
- (UILabel)metadataLabel;
- (UITextView)descriptionTextView;
- (UITextView)footerTextView;
- (UITextView)titleTextView;
- (double)descriptionOriginForViewWidth:(CGFloat)a3 artworkFrame:(CGFloat)a4 buttonViewFrame:(CGFloat)a5 titleFrame:(CGFloat)a6 metadataFrame:(uint64_t)a7 iconViewFrame:(unint64_t)a8 style:(double)a9;
- (double)descriptionWidthForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5;
- (double)exactDescriptionSizeForOrigin:(double)a3 viewWidth:(double)a4 titleFrame:(double)a5 actionButtonFrame:(double)a6 downloadButtonFrame:(double)a7 style:(double)a8;
- (double)heightForWidth:(double)a3 style:(unint64_t)a4;
- (double)titleOriginXForViewWidth:(double)result artworkFrame:(CGRect)a4 buttonFrame:(CGRect)a5 style:(unint64_t)a6;
- (double)titleOriginYForArtworkFrame:(CGRect)a3 style:(unint64_t)a4;
- (id)_currentDescriptionColor;
- (id)_currentDescriptionFont;
- (id)_currentTitleColor;
- (id)_currentTitleFont;
- (id)descriptionExclusionPathsForOrigin:(CGPoint)a3 descriptionWidth:(double)a4 buttonsFrame:(CGRect)a5 titleFrame:(CGRect)a6;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)titleExclusionPathsForButtonViewFrame:(CGRect)a3;
- (id)titleExclusionPathsForExplicitIconFrame:(CGRect)a3 viewWidth:(double)a4;
- (int64_t)disabledReason;
- (unint64_t)style;
- (void)_setNumberOfLinesForDescription:(unint64_t)a3;
- (void)airplaneModeChanged:(id)a3;
- (void)beginLoadingArtwork;
- (void)configureSubviews;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)dismissActionSheetsAndPopovers;
- (void)fixEmptyTextContainers;
- (void)invalidateLayoutMargins;
- (void)invalidateSizeMetrics;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)moreButtonTapped:(id)a3;
- (void)playbackStateDidChange;
- (void)prepareForReuse;
- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4;
- (void)setActionController:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonView:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionButton:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDisabledReason:(int64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEpisode:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExplicitIconView:(id)a3;
- (void)setFooterTextView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIconView:(id)a3;
- (void)setImageLoadingOperation:(id)a3;
- (void)setMetadataLabel:(id)a3;
- (void)setMoreAction:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setPlayStatusView:(id)a3;
- (void)setShouldShowNowPlaying:(BOOL)a3;
- (void)setShowsAirplaneModeIcon:(BOOL)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setShowsDescriptionButton:(BOOL)a3;
- (void)setShowsDocumentIcon:(BOOL)a3;
- (void)setShowsErrorIcon:(BOOL)a3;
- (void)setShowsExplicitIcon:(BOOL)a3;
- (void)setShowsFooterTextView:(BOOL)a3;
- (void)setShowsMoreButton:(BOOL)a3;
- (void)setShowsPlayState:(BOOL)a3;
- (void)setShowsPubDate:(BOOL)a3;
- (void)setShowsStreamingIcon:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTitleImage:(id)a3;
- (void)setTitleTextView:(id)a3;
- (void)set_layoutMargins:(UIEdgeInsets)a3;
- (void)startObservingPlaybackState;
- (void)stopObservingPlaybackState;
- (void)update;
- (void)updateActionSheetsAndPopovers;
- (void)updateAssetStatusIcons;
- (void)updateColors;
- (void)updateColorsForBarsView:(id)a3;
- (void)updateDescriptionText;
- (void)updateFooterText;
- (void)updateFooterTextViewVisbility;
- (void)updateIconView;
- (void)updateIcons;
- (void)updateMetadataText;
- (void)updateMoreButtonVisibility;
- (void)updatePlayStatusIcons;
- (void)updateStateForBarsView:(id)a3;
- (void)updateTitleIncludingIcons;
@end

@implementation MTEpisodeLockup

+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  unint64_t v4 = 2;
  if (a3 > 472.0) {
    unint64_t v4 = 3;
  }
  if (a4) {
    return v4;
  }
  else {
    return a3 > 472.0;
  }
}

+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  id v6 = [a1 styleForWidth:a4];

  _[a1 estimatedHeightForWidth:v6 style:a3];
  return result;
}

+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  v7 = objc_opt_new();
  [v7 setStyle:a4];
  v8 = [a1 mockEpisode];
  [v7 setEpisode:v8];

  [v7 sizeThatFits:a3];
  double v10 = v9;

  return v10;
}

+ (unint64_t)titleNumberOfLinesForStyle:(unint64_t)a3
{
  if (a3 == 2)
  {
    if ([a1 useLayoutForSkinnyPhones]) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else if (a3)
  {
    return 2;
  }
  else if (+[MTEpisodeLockup useSelfSizingCells])
  {
    return 5;
  }
  else
  {
    return 2;
  }
}

+ (unint64_t)descriptionNumberOfLinesForStyle:(unint64_t)a3 isTitleMultipleLines:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 3)
  {
    BOOL v8 = !a4;
    unint64_t v9 = 1;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    BOOL v8 = !a4;
    unint64_t v9 = 2;
LABEL_11:
    if (v8) {
      return v9 + 1;
    }
    else {
      return v9;
    }
  }
  if (a3) {
    return 3;
  }
  unsigned int v5 = +[MTEpisodeLockup useSelfSizingCells];
  unint64_t v6 = 2;
  if (!v4) {
    unint64_t v6 = 3;
  }
  if (v5) {
    return 4;
  }
  else {
    return v6;
  }
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3 showsPlayState:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[MTEpisodeLockup descriptionFont];
  [v7 readableWidth];
  IMRoundToPixel();
  double v9 = v8;

  [a1 artworkSizeForStyle:a3];
  double v11 = v10 + 8.0;
  BOOL v12 = v10 <= 0.0;
  double v13 = 0.0;
  if (v12) {
    double v11 = 0.0;
  }
  if (v4) {
    double v13 = 24.0;
  }
  return v9 + v13 + v11;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3
{
  _[a1 maximumContentWidthForStyle:a3 showsPlayState:1];
  return result;
}

+ (CGRect)frameForContentViewSize:(CGSize)a3 style:(unint64_t)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  double x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
  +[MTEpisodeLockup maximumContentWidthForStyle:a4];
  if (width > v8)
  {
    double v9 = width - v8;
    IMRoundToPixel();
    double x = CGPointZero.x + v10;
    double width = width - v9;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.double x = v11;
  return result;
}

+ (double)artworkHeightForStyle:(unint64_t)a3 sizeType:(unint64_t)a4
{
  double v7 = 0.0;
  if (!objc_msgSend(a1, "showsArtworkForStyle:")) {
    return v7;
  }
  if (a4 == 1)
  {
    double v8 = [a1 titleTextStyle];
    double v9 = &UIContentSizeCategoryExtraExtraLarge;
  }
  else
  {
    if (a4 != 2)
    {
      double v11 = [a1 titleFont];
      double v13 = [a1 descriptionFont];
      goto LABEL_8;
    }
    double v8 = [a1 titleTextStyle];
    double v9 = &UIContentSizeCategorySmall;
  }
  UIContentSizeCategory v10 = *v9;
  double v11 = +[UIFont mt_fontForTextStyle:v8 contentSizeCategoryName:*v9];

  double v12 = [a1 descriptionTextStyle];
  double v13 = +[UIFont mt_fontForTextStyle:v12 contentSizeCategoryName:v10];

LABEL_8:
  id v14 = [a1 titleNumberOfLinesForStyle:a3];
  double v15 = 1.0;
  if (a3 == 3) {
    double v15 = (double)((unint64_t)[a1 descriptionNumberOfLinesForStyle:3 isTitleMultipleLines:1]+ 2);
  }
  [v11 lineHeight];
  double v17 = (double)(unint64_t)v14 * v16 + 2.0;
  [v13 lineHeight];
  double v19 = v17 + v15 * v18;
  if (a3 != 3)
  {
    [v11 mt_offsetFromCapHeightToAscent];
    double v19 = v19 + v20;
  }
  double v7 = v19 + 2.0 + -1.0;

  return v7;
}

+ (CGSize)artworkSizeForStyle:(unint64_t)a3
{
  [a1 artworkHeightForStyle:a3 sizeType:0];
  double v6 = v5;
  if (a3 == 3)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000C1924;
    v15[3] = &unk_1005506D0;
    v15[4] = a1;
    v15[5] = 3;
    if (qword_10060A778 != -1) {
      dispatch_once(&qword_10060A778, v15);
    }
    double v9 = &qword_10060A770;
    UIContentSizeCategory v10 = &qword_1005F4AA8;
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    if (a3 != 2) {
      goto LABEL_10;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C18D8;
    block[3] = &unk_1005506D0;
    block[4] = a1;
    block[5] = 2;
    if (qword_10060A768 != -1) {
      dispatch_once(&qword_10060A768, block);
    }
    double v9 = &qword_10060A760;
    UIContentSizeCategory v10 = &qword_1005F4AA0;
  }
  double v8 = *(double *)v10;
  double v7 = *(double *)v9;
LABEL_10:
  if (v6 >= v7) {
    double v7 = v6;
  }
  if (v7 >= v8) {
    double v11 = v8;
  }
  else {
    double v11 = v7;
  }
  if (qword_10060A780 != -1) {
    dispatch_once(&qword_10060A780, &stru_100550740);
  }
  double v12 = ceil(v11 * *(double *)&qword_1005F4AB0) / *(double *)&qword_1005F4AB0;
  double v13 = ceil(v11);
  if (*(double *)&qword_1005F4AB0 == 1.0) {
    double v12 = v13;
  }
  double v14 = v12;
  result.CGFloat height = v14;
  result.double width = v12;
  return result;
}

+ (id)defaultArtworkForStyle:(unint64_t)a3
{
  [a1 artworkSizeForStyle:a3];

  return [a1 defaultArtworkWithSize:];
}

+ (id)defaultArtworkWithSize:(CGSize)a3
{
  double width = a3.width;
  if (a3.width < 1.0 || a3.height < 1.0)
  {
    double v7 = 0;
  }
  else
  {
    double height = a3.height;
    double v6 = +[MTImageStore defaultStore];
    double v7 = [v6 imageForKey:kMTLibraryDefaultImageKey size:width, height];
  }

  return v7;
}

+ (BOOL)showsArtworkForStyle:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)mockEpisode
{
  v2 = +[MTDB sharedInstance];
  v3 = [v2 managedObjectModel];

  BOOL v4 = [v3 entitiesByName];
  double v5 = [v4 objectForKeyedSubscript:kMTEpisodeEntityName];

  id v6 = [objc_alloc((Class)MTEpisode) initWithEntity:v5 insertIntoManagedObjectContext:0];
  [v6 setTitle:@"This is a really long title that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... "];
  double v7 = [@"This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... " stringByAppendingString:@"This is a really long description that will always reach the maximum number of lines even when the maximum number of lines is really large and when the text size is really small. Really... we promise it will be long enough to always reach the maximum. We promise... "];
  uint64_t v8 = kEpisodeDescription;
  [v6 willChangeValueForKey:kEpisodeDescription];
  [v6 setPrimitiveValue:v7 forKey:v8];
  [v6 didChangeValueForKey:v8];
  [v6 setUuid:@"mockEpisodeUuid"];
  double v9 = [v6 title];
  UIContentSizeCategory v10 = [v6 title];
  double v11 = [v9 stringByAppendingString:v10];
  [v6 setTitle:v11];

  double v12 = [v6 title];
  [v6 setCleanedTitle:v12];

  double v13 = +[NSDate date];
  [v13 timeIntervalSinceReferenceDate];
  [v6 setPubDate:];

  [v6 setDuration:3600.0];
  [v6 setByteSize:52428800];
  [v6 setExternalType:0];
  [v6 setVideo:0];
  [v6 setAudio:1];
  [v6 setExplicit:1];
  uint64_t v14 = kEpisodePlayState;
  [v6 willChangeValueForKey:kEpisodePlayState];
  [v6 setPrimitiveValue:&off_100579650 forKey:v14];
  [v6 didChangeValueForKey:v14];

  return v6;
}

+ (id)dependentPropertyKeys
{
  v4[0] = kEpisodeUuid;
  v4[1] = kEpisodeGuid;
  v4[2] = kEpisodeTitle;
  v4[3] = kEpisodeCleanedTitle;
  v4[4] = kEpisodeDescription;
  v4[5] = kEpisodeEnclosureUrl;
  v4[6] = kEpisodeFeedDeleted;
  v4[7] = kEpisodeAssetURL;
  v4[8] = kEpisodeSuppressAutoDownload;
  v4[9] = kEpisodePubDate;
  v4[10] = kEpisodeDuration;
  v4[11] = kEpisodeAudio;
  v4[12] = kEpisodeVideo;
  v4[13] = kEpisodeExternalType;
  v4[14] = kEpisodeUti;
  v4[15] = kEpisodeExplicit;
  v4[16] = kEpisodeIsFromiTunesSync;
  v4[17] = kEpisodePlayState;
  v4[18] = kEpisodePlayStateManuallySet;
  v4[19] = kEpisodeBackCatalog;
  v2 = +[NSArray arrayWithObjects:v4 count:20];

  return v2;
}

+ (BOOL)useLayoutForSkinnyPhones
{
  v2 = +[UIScreen mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;

  return v4 < 375.0;
}

+ (BOOL)useSelfSizingCells
{
  return 1;
}

+ (double)leadingMarginForViewWidth:(double)a3
{
  unsigned int v3 = +[UIView mt_areMarginsGenerousForWidth:a3];
  double result = 32.0;
  if (!v3) {
    return 28.0;
  }
  return result;
}

+ (double)descriptionMaxHeightForCurrentOrientation
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;

  double v5 = 0.4;
  if (v4 < 737.0) {
    double v5 = 0.5;
  }
  return v4 * v5;
}

+ (id)titleTextStyle
{
  return UIFontTextStyleHeadline1;
}

+ (id)descriptionTextStyle
{
  return UIFontTextStyleSubheadline2;
}

+ (id)footerTextStyle
{
  return UIFontTextStyleFootnote;
}

+ (id)titleFont
{
  v2 = [a1 titleTextStyle];
  double v3 = +[UIFont mt_preferredFontForTextStyle:v2];

  return v3;
}

+ (id)metadataHeaderFont
{
  v2 = [a1 descriptionTextStyle];
  double v3 = +[UIFont mt_preferredFontForTextStyle:v2 addingSymbolicTraits:2];

  return v3;
}

+ (id)descriptionFont
{
  v2 = [a1 descriptionTextStyle];
  double v3 = +[UIFont mt_preferredFontForTextStyle:v2];

  return v3;
}

+ (id)metadataFooterFont
{
  v2 = [a1 footerTextStyle];
  double v3 = +[UIFont mt_preferredFontForTextStyle:v2];

  return v3;
}

- (MTEpisodeLockup)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTEpisodeLockup;
  double v3 = -[MTEpisodeLockup initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    sizeCache = v3->_sizeCache;
    v3->_sizeCache = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    actionController = v3->_actionController;
    v3->_actionController = (MTEpisodeActionController *)v6;

    v3->_showsPubDate = 1;
    v3->_showsPlayState = 1;
    [(MTEpisodeLockup *)v3 configureSubviews];
    v3->_initialized = 1;
    v3->_shouldShowNowPlaying = 1;
    uint64_t v8 = +[MTReachability sharedInstance];
    [v8 addObserver:v3];

    double v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"airplaneModeChanged:" name:@"MTAirplaneModeChangedNotification" object:0];

    UIContentSizeCategory v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  double v3 = +[MTReachability sharedInstance];
  [v3 removeObserver:self];

  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MTEpisodeLockup;
  [(MTEpisodeLockup *)&v5 dealloc];
}

- (void)configureSubviews
{
  double v3 = [(MTEpisodeLockup *)self layer];
  [v3 setAllowsGroupOpacity:0];

  if ([(MTEpisodeLockup *)self showsPlayState])
  {
    uint64_t v4 = [(MTEpisodeLockup *)self playStatusView];
    [(MTEpisodeLockup *)self addSubview:v4];
  }
  objc_super v5 = [(MTEpisodeLockup *)self titleTextView];
  [(MTEpisodeLockup *)self addSubview:v5];

  uint64_t v6 = [(MTEpisodeLockup *)self metadataLabel];
  [(MTEpisodeLockup *)self addSubview:v6];

  double v7 = [(MTEpisodeLockup *)self descriptionTextView];
  [(MTEpisodeLockup *)self addSubview:v7];

  if ([(MTEpisodeLockup *)self isExpanded])
  {
    uint64_t v8 = [(MTEpisodeLockup *)self footerTextView];
    [(MTEpisodeLockup *)self addSubview:v8];
  }
  double v9 = [(MTEpisodeLockup *)self actionButton];
  [(MTEpisodeLockup *)self addSubview:v9];

  if (![(MTEpisodeLockup *)self isExpanded])
  {
    UIContentSizeCategory v10 = [(MTEpisodeLockup *)self moreButton];
    [(MTEpisodeLockup *)self addSubview:v10];
  }
  [(MTEpisodeLockup *)self updateColors];
  [(MTEpisodeLockup *)self setStyle:0];

  [(MTEpisodeLockup *)self setShowsMoreButton:1];
}

- (MTEpisodeArtworkView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    uint64_t v4 = (MTEpisodeArtworkView *)objc_opt_new();
    objc_super v5 = self->_artworkView;
    self->_artworkView = v4;

    [(MTEpisodeArtworkView *)self->_artworkView setCurrentPlayerItem:[(MTEpisodeLockup *)self isCurrentPlayerItem]];
    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (UIImageView)playStatusView
{
  playStatusView = self->_playStatusView;
  if (!playStatusView)
  {
    uint64_t v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    objc_super v5 = self->_playStatusView;
    self->_playStatusView = v4;

    playStatusView = self->_playStatusView;
  }

  return playStatusView;
}

- (UIImageView)explicitIconView
{
  explicitIconView = self->_explicitIconView;
  if (!explicitIconView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    objc_super v5 = +[MTEpisodeStateView explicitIcon];
    uint64_t v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_explicitIconView;
    self->_explicitIconView = v6;

    [(UIImageView *)self->_explicitIconView sizeToFit];
    explicitIconView = self->_explicitIconView;
  }

  return explicitIconView;
}

- (MTEpisodeStateView)iconView
{
  iconView = self->_iconView;
  if (!iconView)
  {
    id v4 = (MTEpisodeStateView *)objc_opt_new();
    objc_super v5 = self->_iconView;
    self->_iconView = v4;

    [(MTEpisodeStateView *)self->_iconView setVerticalLayout:0];
    iconView = self->_iconView;
  }

  return iconView;
}

- (MTTouchInsetsButton)moreButton
{
  moreButton = self->_moreButton;
  if (!moreButton)
  {
    id v4 = +[MTTouchInsetsButton buttonWithType:1];
    objc_super v5 = self->_moreButton;
    self->_moreButton = v4;

    uint64_t v6 = self->_moreButton;
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"more..." value:&stru_10056A8A0 table:0];
    [(MTTouchInsetsButton *)v6 setTitle:v8 forState:0];

    double v9 = [(MTTouchInsetsButton *)self->_moreButton titleLabel];
    UIContentSizeCategory v10 = +[MTEpisodeLockup descriptionFont];
    [v9 setFont:v10];

    [(MTTouchInsetsButton *)self->_moreButton addTarget:self action:"moreButtonTapped:" forControlEvents:64];
    -[MTTouchInsetsButton setTouchInsets:](self->_moreButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    double v11 = [(MTTouchInsetsButton *)self->_moreButton titleLabel];
    [v11 sizeToFit];

    objc_super v12 = self->_moreButton;
    double v13 = [(MTTouchInsetsButton *)v12 titleLabel];
    [v13 bounds];
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    moreButton = self->_moreButton;
  }

  return moreButton;
}

- (MTTouchInsetsButton)descriptionButton
{
  descriptionButton = self->_descriptionButton;
  if (!descriptionButton)
  {
    id v4 = +[MTTouchInsetsButton buttonWithType:1];
    objc_super v5 = self->_descriptionButton;
    self->_descriptionButton = v4;

    uint64_t v6 = self->_descriptionButton;
    double v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"show full description" value:&stru_10056A8A0 table:0];
    [(MTTouchInsetsButton *)v6 setTitle:v8 forState:0];

    double v9 = [(MTTouchInsetsButton *)self->_descriptionButton titleLabel];
    UIContentSizeCategory v10 = +[MTEpisodeLockup descriptionFont];
    [v9 setFont:v10];

    -[MTTouchInsetsButton setTouchInsets:](self->_descriptionButton, "setTouchInsets:", -16.0, -8.0, -8.0, -12.0);
    double v11 = [(MTTouchInsetsButton *)self->_descriptionButton titleLabel];
    [v11 sizeToFit];

    objc_super v12 = self->_descriptionButton;
    double v13 = [(MTTouchInsetsButton *)v12 titleLabel];
    [v13 bounds];
    -[MTTouchInsetsButton setFrame:](v12, "setFrame:");

    descriptionButton = self->_descriptionButton;
  }

  return descriptionButton;
}

- (UIButton)actionButton
{
  v2 = [(MTEpisodeLockup *)self moreAction];
  double v3 = [v2 button];

  return (UIButton *)v3;
}

- (IMActionSheetAction)moreAction
{
  moreAction = self->_moreAction;
  if (!moreAction)
  {
    id v4 = +[MTMoreActionSheetAction action];
    objc_super v5 = self->_moreAction;
    self->_moreAction = v4;

    objc_initWeak(&location, self);
    uint64_t v6 = self->_moreAction;
    double v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    double v11 = sub_1000C29F8;
    objc_super v12 = &unk_10054D478;
    objc_copyWeak(&v13, &location);
    [(IMAction *)v6 setActionBlock:&v9];
    double v7 = [(MTEpisodeLockup *)self actionController];
    [(IMAction *)self->_moreAction setController:v7];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    moreAction = self->_moreAction;
  }

  return moreAction;
}

- (UITextView)titleTextView
{
  titleTextView = self->_titleTextView;
  if (!titleTextView)
  {
    id v4 = (UITextView *)objc_opt_new();
    objc_super v5 = self->_titleTextView;
    self->_titleTextView = v4;

    [(UITextView *)self->_titleTextView setEditable:0];
    [(UITextView *)self->_titleTextView setScrollEnabled:0];
    [(UITextView *)self->_titleTextView setUserInteractionEnabled:0];
    uint64_t v6 = +[UIColor clearColor];
    [(UITextView *)self->_titleTextView setBackgroundColor:v6];

    [(UITextView *)self->_titleTextView setDataDetectorTypes:0];
    double v7 = [(id)objc_opt_class() titleFont];
    [(UITextView *)self->_titleTextView setFont:v7];

    -[UITextView setTextContainerInset:](self->_titleTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    uint64_t v8 = [(UITextView *)self->_titleTextView textContainer];
    [v8 setLineFragmentPadding:0.0];

    double v9 = [(UITextView *)self->_titleTextView textContainer];
    [v9 setWidthTracksTextView:1];

    uint64_t v10 = [(UITextView *)self->_titleTextView textContainer];
    [v10 setHeightTracksTextView:1];

    double v11 = [(UITextView *)self->_titleTextView textContainer];
    [v11 setLineBreakMode:4];

    titleTextView = self->_titleTextView;
  }

  return titleTextView;
}

- (UITextView)descriptionTextView
{
  descriptionTextView = self->_descriptionTextView;
  if (!descriptionTextView)
  {
    id v4 = (UITextView *)objc_opt_new();
    objc_super v5 = self->_descriptionTextView;
    self->_descriptionTextView = v4;

    [(UITextView *)self->_descriptionTextView setEditable:0];
    [(UITextView *)self->_descriptionTextView setScrollEnabled:0];
    [(UITextView *)self->_descriptionTextView setClipsToBounds:0];
    [(UITextView *)self->_descriptionTextView setUserInteractionEnabled:0];
    uint64_t v6 = +[UIColor clearColor];
    [(UITextView *)self->_descriptionTextView setBackgroundColor:v6];

    double v7 = [(UITextView *)self->_descriptionTextView textContainer];
    [v7 setLineBreakMode:4];

    uint64_t v8 = [(UITextView *)self->_descriptionTextView textContainer];
    [v8 setLineFragmentPadding:0.0];

    double v9 = [(UITextView *)self->_descriptionTextView textContainer];
    [v9 setHeightTracksTextView:1];

    uint64_t v10 = [(UITextView *)self->_descriptionTextView textContainer];
    [v10 setWidthTracksTextView:1];

    -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(UITextView *)self->_descriptionTextView setDataDetectorTypes:0];
    double v11 = self->_descriptionTextView;
    objc_super v12 = +[MTEpisodeLockup descriptionFont];
    [(UITextView *)v11 setFont:v12];

    descriptionTextView = self->_descriptionTextView;
  }

  return descriptionTextView;
}

- (UILabel)metadataLabel
{
  metadataLabel = self->_metadataLabel;
  if (!metadataLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    objc_super v5 = self->_metadataLabel;
    self->_metadataLabel = v4;

    uint64_t v6 = +[UIColor clearColor];
    [(UILabel *)self->_metadataLabel setBackgroundColor:v6];

    double v7 = self->_metadataLabel;
    uint64_t v8 = +[MTEpisodeLockup metadataHeaderFont];
    [(UILabel *)v7 setFont:v8];

    metadataLabel = self->_metadataLabel;
  }

  return metadataLabel;
}

- (UITextView)footerTextView
{
  footerTextView = self->_footerTextView;
  if (!footerTextView)
  {
    id v4 = (UITextView *)objc_opt_new();
    objc_super v5 = self->_footerTextView;
    self->_footerTextView = v4;

    [(UITextView *)self->_footerTextView setEditable:0];
    [(UITextView *)self->_footerTextView setScrollEnabled:0];
    [(UITextView *)self->_footerTextView setClipsToBounds:0];
    [(UITextView *)self->_footerTextView setUserInteractionEnabled:0];
    uint64_t v6 = +[UIColor clearColor];
    [(UITextView *)self->_footerTextView setBackgroundColor:v6];

    double v7 = [(UITextView *)self->_footerTextView textContainer];
    [v7 setLineBreakMode:4];

    uint64_t v8 = [(UITextView *)self->_footerTextView textContainer];
    [v8 setLineFragmentPadding:0.0];

    double v9 = [(UITextView *)self->_footerTextView textContainer];
    [v9 setHeightTracksTextView:1];

    uint64_t v10 = [(UITextView *)self->_footerTextView textContainer];
    [v10 setWidthTracksTextView:1];

    -[UITextView setTextContainerInset:](self->_footerTextView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(UITextView *)self->_footerTextView setDataDetectorTypes:0];
    double v11 = self->_footerTextView;
    objc_super v12 = +[MTEpisodeLockup metadataFooterFont];
    [(UITextView *)v11 setFont:v12];

    footerTextView = self->_footerTextView;
  }

  return footerTextView;
}

- (MTNowPlayingIndicatorView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    id v4 = (MTNowPlayingIndicatorView *)objc_opt_new();
    objc_super v5 = self->_barsView;
    self->_barsView = v4;

    [(MTNowPlayingIndicatorView *)self->_barsView setBounceStyle:1];
    [(MTNowPlayingIndicatorView *)self->_barsView setNumberOfLevels:4];
    uint64_t v6 = +[UIScreen mainScreen];
    [v6 scale];
    double v8 = v7;

    [(MTNowPlayingIndicatorView *)self->_barsView setLevelCornerRadius:1.0 / v8];
    [(MTEpisodeLockup *)self updateColorsForBarsView:self->_barsView];
    barsView = self->_barsView;
  }

  return barsView;
}

- (void)setColorTheme:(id)a3
{
  objc_super v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5)
  {
    double v7 = v5;
    colorTheme = (MTColorTheme *)[(MTColorTheme *)colorTheme isEqual:v5];
    objc_super v5 = v7;
    if ((colorTheme & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorTheme, a3);
      colorTheme = (MTColorTheme *)[(MTEpisodeLockup *)self updateColors];
      objc_super v5 = v7;
    }
  }

  _objc_release_x1(colorTheme, v5);
}

- (void)updateColors
{
  double v3 = [(MTEpisodeLockup *)self colorTheme];
  id v20 = +[UIColor tintColorForTheme:v3];

  id v4 = [(MTEpisodeLockup *)self colorTheme];
  objc_super v5 = +[UIColor primaryTextColorForTheme:v4];

  uint64_t v6 = [(MTEpisodeLockup *)self colorTheme];
  double v7 = +[UIColor secondaryTextColorForTheme:v6];

  double v8 = [(MTEpisodeLockup *)self titleTextView];
  [v8 setTextColor:v5];

  double v9 = [(MTEpisodeLockup *)self descriptionTextView];
  [v9 setTextColor:v7];

  uint64_t v10 = [(MTEpisodeLockup *)self footerTextView];
  [v10 setTextColor:v7];

  double v11 = [(MTEpisodeLockup *)self metadataLabel];
  [v11 setTextColor:v7];

  objc_super v12 = [(MTEpisodeLockup *)self iconView];
  id v13 = [(MTEpisodeLockup *)self colorTheme];
  [v12 setColorTheme:v13];

  uint64_t v14 = [(MTEpisodeLockup *)self actionController];
  double v15 = [(MTEpisodeLockup *)self colorTheme];
  [v14 setColorTheme:v15];

  double v16 = [(MTEpisodeLockup *)self actionButton];
  [v16 setTintColor:v20];

  double v17 = [(MTEpisodeLockup *)self descriptionTextView];
  [v17 setTintColor:v20];

  double v18 = [(MTEpisodeLockup *)self moreButton];
  [v18 setTintColor:v20];

  double v19 = [(MTEpisodeLockup *)self descriptionButton];
  [v19 setTintColor:v20];

  [(MTEpisodeLockup *)self updateColorsForBarsView:self->_barsView];
  [(MTEpisodeLockup *)self updatePlayStatusIcons];
}

- (void)updateColorsForBarsView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(MTEpisodeLockup *)self colorTheme];
    objc_super v5 = +[UIColor barsTintColorForTheme:v6];
    [v4 setTintColor:v5];
  }
}

- (void)moreButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEpisodeLockup *)self delegate];
  [v5 lockup:self moreButtonTapped:v4];
}

- (void)airplaneModeChanged:(id)a3
{
  if (![(MTEpisodeLockup *)self updateDisabledReason])
  {
    id v4 = [(MTEpisodeLockup *)self episode];

    if (v4)
    {
      [(MTEpisodeLockup *)self updateIcons];
    }
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(MTTouchInsetsButton *)self->_moreButton removeFromSuperview];
  moreButton = self->_moreButton;
  self->_moreButton = 0;

  if ([(MTEpisodeLockup *)self showsMoreButton])
  {
    self->_showsMoreButton = 0;
    [(MTEpisodeLockup *)self setShowsMoreButton:1];
  }
}

- (void)reachabilityChangedFrom:(BOOL)a3 to:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C35C8;
  v4[3] = &unk_10054E8E0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setEpisode:(id)a3
{
  objc_storeStrong((id *)&self->_episode, a3);
  if (a3)
  {
    [(MTEpisodeLockup *)self update];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(MTEpisodeLockup *)self updateMoreButtonVisibility];
  }
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    BOOL v3 = a3;
    self->_currentPlayerItem = a3;
    -[MTEpisodeArtworkView setCurrentPlayerItem:](self->_artworkView, "setCurrentPlayerItem:");
    [(MTEpisodeLockup *)self updatePlayStatusIcons];
    [(MTEpisodeLockup *)self updateIconView];
    if (v3)
    {
      [(MTEpisodeLockup *)self startObservingPlaybackState];
    }
    else
    {
      [(MTEpisodeLockup *)self stopObservingPlaybackState];
    }
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(MTEpisodeLockup *)self updateMoreButtonVisibility];
    if (a3) {
      id v5 = 0;
    }
    else {
      id v5 = [objc_opt_class() descriptionNumberOfLinesForStyle:[self style] isTitleMultipleLines:1];
    }
    [(MTEpisodeLockup *)self _setNumberOfLinesForDescription:v5];
    id v6 = [(MTEpisodeLockup *)self episode];

    if (v6) {
      [(MTEpisodeLockup *)self updateDescriptionText];
    }
    [(MTEpisodeLockup *)self updateFooterTextViewVisbility];
    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3 || !self->_initialized)
  {
    self->_style = a3;
    [(MTEpisodeLockup *)self setShowsArtwork:+[MTEpisodeLockup showsArtworkForStyle:a3]];
    id v5 = [(id)objc_opt_class() titleNumberOfLinesForStyle:a3];
    id v6 = [(MTEpisodeLockup *)self titleTextView];
    double v7 = [v6 textContainer];
    [v7 setMaximumNumberOfLines:v5];

    [(MTEpisodeLockup *)self updateTitleFontIfNeeded];
    [(MTEpisodeLockup *)self invalidateSizeMetrics];
    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)setShowsPubDate:(BOOL)a3
{
  if (self->_showsPubDate != a3)
  {
    self->_showsPubDate = a3;
    [(MTEpisodeLockup *)self updateDescriptionText];
  }
}

- (void)setShowsPlayState:(BOOL)a3
{
  if (self->_showsPlayState == a3) {
    return;
  }
  BOOL v3 = a3;
  self->_showsPlayState = a3;
  id v5 = [(MTEpisodeLockup *)self playStatusView];
  id v6 = [v5 superview];

  if (v3)
  {
    if (v6 != self)
    {
      double v7 = [(MTEpisodeLockup *)self playStatusView];
      [(MTEpisodeLockup *)self addSubview:v7];
LABEL_7:
    }
  }
  else if (v6)
  {
    double v7 = [(MTEpisodeLockup *)self playStatusView];
    [v7 removeFromSuperview];
    goto LABEL_7;
  }

  [(MTEpisodeLockup *)self updateIcons];
}

- (void)prepareForReuse
{
  [(MTEpisodeLockup *)self setEpisode:0];
  [(MTEpisodeLockup *)self setExpanded:0];
  [(MTEpisodeLockup *)self setDelegate:0];
  BOOL v3 = [(MTEpisodeLockup *)self actionController];
  [v3 prepareForReuse];

  [(MTEpisodeLockup *)self setDisabledReason:0];
  [(MTEpisodeLockup *)self invalidateSizeMetrics];
  [(MTEpisodeLockup *)self invalidateLayoutMargins];
  self->_shouldShowNowPlaying = 1;
  [(MTEpisodeLockup *)self setCurrentPlayerItem:0];
  id v4 = [(MTEpisodeLockup *)self artworkView];
  id v5 = [v4 artwork];

  if (v5)
  {
    [objc_opt_class() defaultArtworkForStyle:[self style]];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [(MTEpisodeLockup *)self artworkView];
    [v6 setArtwork:v7];
  }
}

- (void)invalidateSizeMetrics
{
  self->_descriptionSize = CGSizeZero;
}

- (void)invalidateLayoutMargins
{
  long long v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *(_OWORD *)&self->__layoutMargins.top = *(_OWORD *)&UIEdgeInsetsZero.top;
  *(_OWORD *)&self->__layoutMargins.bottom = v2;
}

- (void)updateActionSheetsAndPopovers
{
  BOOL v3 = [(MTEpisodeLockup *)self moreAction];
  sub_1000C3BF8((uint64_t)v3, v3);

  id v4 = [(MTEpisodeLockup *)self actionController];
  [v4 updateActionSheetsAndPopovers];
}

- (void)dismissActionSheetsAndPopovers
{
  BOOL v3 = [(MTEpisodeLockup *)self moreAction];
  sub_1000C3CD0((uint64_t)v3, v3);

  id v4 = [(MTEpisodeLockup *)self actionController];
  [v4 dismissActionSheetsAndPopovers];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTEpisodeLockup;
  double v8 = -[MTEpisodeLockup hitTest:withEvent:](&v15, "hitTest:withEvent:", v7, x, y);
  double v9 = [(MTEpisodeLockup *)self moreButton];

  if (v8 == v9)
  {
    uint64_t v10 = [(MTEpisodeLockup *)self actionButton];
    double v11 = [(MTEpisodeLockup *)self actionButton];
    -[MTEpisodeLockup convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
    objc_super v12 = [v10 hitTest:v7];

    if (v12)
    {
      id v13 = v12;

      double v8 = v13;
    }
  }

  return v8;
}

- (void)layoutSubviews
{
  v135.receiver = self;
  v135.super_class = (Class)MTEpisodeLockup;
  [(MTEpisodeLockup *)&v135 layoutSubviews];
  [(MTEpisodeLockup *)self bounds];
  double v4 = v3;
  if ([(MTEpisodeLockup *)self showsArtwork])
  {
    [(MTEpisodeLockup *)self artworkFrameForStyle:[(MTEpisodeLockup *)self style] forViewWidth:v4];
    double x = v5;
    double y = v7;
    double width = v9;
    double height = v11;
    id v13 = [(MTEpisodeLockup *)self artworkView];
    [v13 setFrame:CGRectMake(x, y, width, height)];
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  double v125 = width;
  double v127 = x;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:](self, "titleOriginYForArtworkFrame:style:", [(MTEpisodeLockup *)self style], x, y, width, height);
  double v126 = y;
  double v15 = v14;
  double v16 = v4;
  double v17 = v4;
  double v18 = v15;
  double v113 = v15;
  -[MTEpisodeLockup actionButtonFrameForViewWidth:titleOriginY:](self, "actionButtonFrameForViewWidth:titleOriginY:", v17);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  v27 = [(MTEpisodeLockup *)self actionButton];
  [v27 setFrame:v20, v22, v24, v26];

  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:](self, "downloadButtonFrameForActionButtonFrame:titleOriginY:", v20, v22, v24, v26, v18);
  double v123 = v22;
  double v124 = v20;
  uint64_t v121 = v28;
  double v122 = v24;
  double v115 = v26;
  uint64_t v119 = v30;
  uint64_t v120 = v29;
  uint64_t v118 = v31;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:](self, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", v20, v22, v24, v26);
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:](self, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:", [(MTEpisodeLockup *)self style], v16, v127, y, v125, height, v32, v34, v36, v38);
  double v128 = v40;
  double v129 = v16;
  uint64_t v114 = v39;
  uint64_t v116 = v35;
  uint64_t v117 = v33;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:](self, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:", [(MTEpisodeLockup *)self style], v16, v40, v113, v127, y, v125, height, v33, v35, v37, v39);
  double v42 = v41;
  double v44 = v43;
  v45 = [(MTEpisodeLockup *)self titleTextView];
  [v45 setFrame:v128, v113, v42, v44];

  double v46 = v44;
  double v47 = v42;
  -[MTEpisodeLockup playStatusViewFrameForViewWidth:titleFrame:artworkFrame:](self, "playStatusViewFrameForViewWidth:titleFrame:artworkFrame:", v16, v128, v113, v42, v46, *(void *)&v127, *(void *)&y, *(void *)&v125, *(void *)&height);
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  v56 = [(MTEpisodeLockup *)self playStatusView];
  [v56 setFrame:v49, v51, v53, v55];

  v57 = [(MTEpisodeLockup *)self barsView];
  v58 = [v57 superview];

  if (v58)
  {
    v59 = [(MTEpisodeLockup *)self barsView];
    [v59 setFrame:v49, v51, v53, v55];
  }
  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:](self, "metadataFrameForViewWidth:titleFrame:style:", [(MTEpisodeLockup *)self style], v129, v128, v113, v47, v46);
  double v132 = v60;
  *(void *)&long long v133 = v61;
  *((void *)&v133 + 1) = v62;
  double v134 = v63;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:](self, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:", &v132, [(MTEpisodeLockup *)self style], v129, v128, v113, v47, v46);
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  v72 = [(MTEpisodeLockup *)self iconView];
  v73 = [v72 superview];

  if (v73)
  {
    v74 = [(MTEpisodeLockup *)self iconView];
    [v74 setFrame:v65, v67, v69, v71];
  }
  v75 = [(MTEpisodeLockup *)self metadataLabel];
  [v75 setFrame:v132, v133, v134];

  unint64_t v76 = [(MTEpisodeLockup *)self style];
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:](self, "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:", v76, v129, v127, v126, v125, height, v117, v116, v37, v114, *(void *)&v128, *(void *)&v113, *(void *)&v47, *(void *)&v46, *(void *)&v132, v133, *(void *)&v134,
    *(void *)&v65,
    *(void *)&v67,
    *(void *)&v69,
    *(void *)&v71);
  double v78 = v77;
  double v80 = v79;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:](self, "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:", [(MTEpisodeLockup *)self style], v77, v79, v129, v128, v113, v47, v46, *(void *)&v124, *(void *)&v123, *(void *)&v122, *(void *)&v115, v121, v120, v119, v118);
  double v82 = v81;
  double v84 = v83;
  v85 = [(MTEpisodeLockup *)self descriptionTextView];
  [v85 frame];
  v137.origin.double x = v86;
  v137.origin.double y = v87;
  v137.size.double width = v88;
  v137.size.double height = v89;
  v136.origin.double x = v78;
  v136.origin.double y = v80;
  v136.size.double width = v82;
  v136.size.double height = v84;
  BOOL v90 = CGRectEqualToRect(v136, v137);

  if (!v90)
  {
    v91 = [(MTEpisodeLockup *)self descriptionTextView];
    [v91 setFrame:v78, v80, v82, v84];
  }
  [(MTEpisodeLockup *)self fixEmptyTextContainers];
  if ([(MTEpisodeLockup *)self showsMoreButton])
  {
    -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:](self, "moreButtonFrameForDescriptionFrame:", v78, v80, v82, v84);
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_1000C4554;
    v131[3] = &unk_1005506F8;
    v131[4] = self;
    v131[5] = v92;
    v131[6] = v93;
    v131[7] = v94;
    v131[8] = v95;
    +[UIView performWithoutAnimation:v131];
  }
  -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:](self, "descriptionButtonFrameForDescriptionFrame:", v78, v80, v82, v84);
  double v97 = v96;
  double v99 = v98;
  double v101 = v100;
  double v103 = v102;
  if ([(MTEpisodeLockup *)self showsDescriptionButton])
  {
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_1000C45C0;
    v130[3] = &unk_1005506F8;
    v130[4] = self;
    *(double *)&v130[5] = v97;
    *(double *)&v130[6] = v99;
    *(double *)&v130[7] = v101;
    *(double *)&v130[8] = v103;
    +[UIView performWithoutAnimation:v130];
  }
  if ([(MTEpisodeLockup *)self showsFooterTextView])
  {
    -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:](self, "footerFrameForDescriptionButtonFrame:descriptionFrame:", v97, v99, v101, v103, v78, v80, v82, v84);
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;
    double v111 = v110;
    v112 = [(MTEpisodeLockup *)self footerTextView];
    [v112 setFrame:v105, v107, v109, v111];
  }
}

- (CGRect)explicitIconFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v10 = +[MTEpisodeLockup titleFont];
  double v11 = [(MTEpisodeLockup *)self explicitIconView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  unsigned int v16 = [(MTEpisodeLockup *)self _isRTL];
  double v62 = a3;
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;
  if (v16)
  {
    double v21 = CGRectGetMinX(*(CGRect *)&v17) - v13;
    [(MTEpisodeLockup *)self _layoutMargins];
    if (v21 >= v22) {
      double v23 = v21;
    }
    else {
      double v23 = v22;
    }
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v17);
    [(MTEpisodeLockup *)self _layoutMargins];
    if (MaxX >= a3 - v25 - v13) {
      double v23 = a3 - v25 - v13;
    }
    else {
      double v23 = MaxX;
    }
  }
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v63);
  [v10 im_distanceFromLastBaselineToBottom];
  double v28 = v27;
  [v10 lineHeight];
  double v30 = (v29 - v15) * 0.5;
  if (qword_10060A780 != -1) {
    dispatch_once(&qword_10060A780, &stru_100550740);
  }
  double v31 = ceil(v30 * *(double *)&qword_1005F4AB0) / *(double *)&qword_1005F4AB0;
  double v32 = ceil(v30);
  if (*(double *)&qword_1005F4AB0 == 1.0) {
    double v33 = v32;
  }
  else {
    double v33 = v31;
  }
  uint64_t v34 = [(MTEpisodeLockup *)self titleTextView];
  uint64_t v35 = [v34 layoutManager];
  uint64_t v36 = (char *)[v35 numberOfGlyphs] - 1;

  if (v36)
  {
    double v61 = v28;
    double v37 = MaxY;
    uint64_t v38 = [(MTEpisodeLockup *)self titleTextView];
    uint64_t v39 = [v38 layoutManager];
    [v39 lineFragmentRectForGlyphAtIndex:v36 effectiveRange:0];
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;

    unsigned int v48 = [(MTEpisodeLockup *)self _isRTL];
    uint64_t v49 = v41;
    uint64_t v50 = v43;
    uint64_t v51 = v45;
    uint64_t v52 = v47;
    if (v48)
    {
      double v53 = CGRectGetMinX(*(CGRect *)&v49) + -5.0 - v13;
      [(MTEpisodeLockup *)self _layoutMargins];
      if (v53 >= v54) {
        double v23 = v53;
      }
      else {
        double v23 = v54;
      }
    }
    else
    {
      double v55 = CGRectGetMaxX(*(CGRect *)&v49) + 5.0;
      [(MTEpisodeLockup *)self _layoutMargins];
      if (v55 >= v62 - v56 - v13) {
        double v23 = v62 - v56 - v13;
      }
      else {
        double v23 = v55;
      }
    }
    double MaxY = v37;
    double v28 = v61;
  }

  double v57 = v23;
  double v58 = MaxY - v28 - v33;
  double v59 = v13;
  double v60 = v15;
  result.size.CGFloat height = v60;
  result.size.CGFloat width = v59;
  result.origin.CGFloat y = v58;
  result.origin.CGFloat x = v57;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(MTEpisodeLockup *)self style];
  if ([(MTEpisodeLockup *)self isExpanded]) {
    CFStringRef v7 = @"e";
  }
  else {
    CFStringRef v7 = @"c";
  }
  v19.double width = width;
  v19.CGFloat height = height;
  double v8 = NSStringFromCGSize(v19);
  double v9 = +[NSString stringWithFormat:@"%lu-%@-%@", v6, v7, v8];

  uint64_t v10 = [(NSMutableDictionary *)self->_sizeCache objectForKeyedSubscript:v9];
  double v11 = v10;
  if (v10)
  {
    [v10 CGSizeValue];
    double width = v12;
    double v14 = v13;
  }
  else
  {
    [(MTEpisodeLockup *)self _layoutMarginsForViewWidth:width];
    [(MTEpisodeLockup *)self set_layoutMargins:"set_layoutMargins:"];
    [(MTEpisodeLockup *)self heightForWidth:[(MTEpisodeLockup *)self style] style:width];
    double v14 = v15;
    unsigned int v16 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, v15);
    [(NSMutableDictionary *)self->_sizeCache setObject:v16 forKeyedSubscript:v9];
  }
  double v17 = width;
  double v18 = v14;
  result.CGFloat height = v18;
  result.double width = v17;
  return result;
}

- (void)fixEmptyTextContainers
{
  double v3 = [(MTEpisodeLockup *)self descriptionTextView];
  double v4 = [v3 textContainer];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(MTEpisodeLockup *)self descriptionTextView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;

  if (v6 != v11 || v8 != v13)
  {
    double v15 = [(MTEpisodeLockup *)self descriptionTextView];
    unsigned int v16 = [v15 textContainer];
    [v16 setSize:v11, v13];
  }
  double v17 = [(MTEpisodeLockup *)self titleTextView];
  double v18 = [v17 textContainer];
  [v18 size];
  double v20 = v19;
  double v22 = v21;

  double v23 = [(MTEpisodeLockup *)self titleTextView];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  if (v20 != v25 || v22 != v27)
  {
    id v29 = [(MTEpisodeLockup *)self titleTextView];
    double v28 = [v29 textContainer];
    [v28 setSize:v25, v27];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTEpisodeLockup *)self frame];
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    [(MTEpisodeLockup *)self invalidateLayoutMargins];
  }
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup setFrame:](&v9, "setFrame:", x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MTEpisodeLockup *)self bounds];
  if (v8 != width)
  {
    self->_descriptionSize = CGSizeZero;
    [(MTEpisodeLockup *)self invalidateLayoutMargins];
  }
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeLockup;
  -[MTEpisodeLockup setBounds:](&v9, "setBounds:", x, y, width, height);
}

- (void)layoutMarginsDidChange
{
  [(MTEpisodeLockup *)self invalidateLayoutMargins];

  [(MTEpisodeLockup *)self setNeedsLayout];
}

- (UIEdgeInsets)_layoutMargins
{
  p_layoutMargins = &self->__layoutMargins;
  float64x2_t v3 = *(float64x2_t *)&self->__layoutMargins.top;
  float64x2_t v4 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v3, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v4, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))))
  {
    [(MTEpisodeLockup *)self bounds];
    [(MTEpisodeLockup *)self _layoutMarginsForViewWidth:v8];
    p_layoutMargins->top = v3.f64[0];
    p_layoutMargins->double left = left;
    p_layoutMargins->bottom = v4.f64[0];
    p_layoutMargins->double right = right;
  }
  else
  {
    double left = self->__layoutMargins.left;
    double right = self->__layoutMargins.right;
  }
  result.bottom = v4.f64[0];
  result.top = v3.f64[0];
  result.double right = right;
  result.double left = left;
  return result;
}

- (UIEdgeInsets)_layoutMarginsForViewWidth:(double)a3
{
  [(id)objc_opt_class() leadingMarginForViewWidth:a3];
  double v6 = v5;
  float64x2_t v7 = *(float64x2_t *)&self->__layoutMargins.top;
  float64x2_t v8 = *(float64x2_t *)&self->__layoutMargins.bottom;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v7, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v8, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))))
  {
    +[MTEpisodeLockup maximumContentWidthForStyle:[(MTEpisodeLockup *)self style]];
    double v12 = v11;
    [(MTEpisodeLockup *)self mt_layoutMarginsForWidth:a3];
    CGFloat v20 = v14;
    CGFloat v21 = v13;
    double v16 = v15;
    double right = v17;
    if ([(MTEpisodeLockup *)self showsPlayState] && v15 < v6) {
      double left = v6;
    }
    else {
      double left = v16;
    }
    if (a3 - left - right > v12)
    {
      IMRoundToPixel();
      double left = v18;
      double right = v18;
    }
    v8.f64[0] = v20;
    v7.f64[0] = v21;
    self->__layoutMargins.top = v21;
    self->__layoutMargins.double left = left;
    self->__layoutMargins.bottom = v20;
    self->__layoutMargins.double right = right;
  }
  else
  {
    double left = self->__layoutMargins.left;
    double right = self->__layoutMargins.right;
  }
  double v19 = right;
  result.bottom = v8.f64[0];
  result.top = v7.f64[0];
  result.double right = v19;
  result.double left = left;
  return result;
}

- (double)heightForWidth:(double)a3 style:(unint64_t)a4
{
  -[MTEpisodeLockup artworkFrameForStyle:forViewWidth:](self, "artworkFrameForStyle:forViewWidth:");
  double v114 = v7;
  double v94 = v8;
  double v109 = v9;
  double v11 = v10;
  -[MTEpisodeLockup titleOriginYForArtworkFrame:style:](self, "titleOriginYForArtworkFrame:style:", a4);
  double v93 = v12;
  [(MTEpisodeLockup *)self actionButtonFrameForViewWidth:a3 titleOriginY:v12];
  double v14 = v13;
  double v105 = v15;
  double v107 = v13;
  double v16 = v15;
  double v18 = v17;
  double v101 = v19;
  double v103 = v17;
  double v20 = v19;
  -[MTEpisodeLockup downloadButtonFrameForActionButtonFrame:titleOriginY:](self, "downloadButtonFrameForActionButtonFrame:titleOriginY:");
  double v99 = v22;
  double v100 = v21;
  double v97 = v24;
  double v98 = v23;
  -[MTEpisodeLockup buttonsFrameForActionButtonFrame:downloadButtonFrame:](self, "buttonsFrameForActionButtonFrame:downloadButtonFrame:", v14, v16, v18, v20, v21, v22, v23, v24);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v111 = v31;
  uint64_t v95 = v29;
  uint64_t v96 = v27;
  double v113 = v11;
  -[MTEpisodeLockup titleOriginXForViewWidth:artworkFrame:buttonFrame:style:](self, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:", a4, a3, v114, v11, v94, v109, v25, v27, v29, v31);
  uint64_t v92 = v30;
  double v33 = v32;
  -[MTEpisodeLockup titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:](self, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:", a4, a3, v26, v28, v92, v111);
  double v35 = v34;
  double v37 = v36;
  -[MTEpisodeLockup metadataFrameForViewWidth:titleFrame:style:](self, "metadataFrameForViewWidth:titleFrame:style:", a4, a3, v33, v93, v34, v36);
  uint64_t v115 = v38;
  *(void *)&long long v116 = v39;
  *((void *)&v116 + 1) = v40;
  uint64_t v117 = v41;
  -[MTEpisodeLockup iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:](self, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:", &v115, a4, a3, v33, v93, v35, v37);
  -[MTEpisodeLockup descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:](self, "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:", a4, a3, v114, v113, v94, v109, v26, v96, v95, v111, *(void *)&v33, *(void *)&v93, *(void *)&v35, *(void *)&v37, v115, v116, v117,
    v42,
    v43,
    v44,
    v45);
  double v47 = v46;
  double v49 = v48;
  -[MTEpisodeLockup exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:](self, "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:", a4, *(void *)&v107, *(void *)&v105, *(void *)&v103, *(void *)&v101, *(void *)&v100, *(void *)&v99, *(void *)&v98, *(void *)&v97);
  double v51 = v50;
  double v112 = v52;
  -[MTEpisodeLockup moreButtonFrameForDescriptionFrame:](self, "moreButtonFrameForDescriptionFrame:", v49, v47);
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  v118.origin.double y = v113;
  v118.origin.CGFloat x = v114;
  v118.size.double width = v94;
  v118.size.double height = v109;
  CGRectGetMaxY(v118);
  v119.origin.CGFloat x = v54;
  v119.origin.double y = v56;
  v119.size.double width = v58;
  v119.size.double height = v60;
  if (!CGRectIsEmpty(v119))
  {
    v120.origin.CGFloat x = v54;
    v120.origin.double y = v56;
    v120.size.double width = v58;
    v120.size.double height = v60;
    CGRectGetMaxY(v120);
  }
  double v61 = v47;
  double v62 = +[MTEpisodeLockup descriptionFont];
  [v62 mt_offsetFromLastBaselineToBottom];

  if ([(MTEpisodeLockup *)self isExpanded])
  {
    CGRect v63 = [(MTEpisodeLockup *)self descriptionTextView];
    [v63 frame];
    v125.origin.CGFloat x = v64;
    v125.origin.double y = v65;
    v125.size.double width = v66;
    v125.size.double height = v67;
    v121.origin.CGFloat x = v49;
    v121.origin.double y = v47;
    v121.size.double width = v112;
    v121.size.double height = v51;
    BOOL v68 = CGRectEqualToRect(v121, v125);

    if (!v68)
    {
      double v69 = [(MTEpisodeLockup *)self descriptionTextView];
      [v69 setFrame:v49, v47, v112, v51];
    }
    -[MTEpisodeLockup descriptionButtonFrameForDescriptionFrame:](self, "descriptionButtonFrameForDescriptionFrame:", v49, v47, v112, v51);
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    CGFloat v106 = v72;
    CGFloat v108 = v70;
    CGFloat v102 = v76;
    CGFloat v104 = v74;
    if ([(MTEpisodeLockup *)self showsFooterTextView])
    {
      -[MTEpisodeLockup footerFrameForDescriptionButtonFrame:descriptionFrame:](self, "footerFrameForDescriptionButtonFrame:descriptionFrame:", v71, v73, v75, v77, v49, v61, v112, v51);
      double v79 = v78;
      double y = v80;
      CGFloat v82 = v61;
      double width = v83;
      double height = v85;
      CGFloat v87 = [(MTEpisodeLockup *)self footerTextView];
      CGFloat x = v79;
      [v87 setFrame:v79 y:width height:height];
    }
    else
    {
      double y = CGRectZero.origin.y;
      CGFloat x = CGRectZero.origin.x;
      CGFloat v82 = v61;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
    }
    v122.origin.CGFloat x = v49;
    v122.origin.double y = v82;
    v122.size.double width = v112;
    v122.size.double height = v51;
    if (CGRectGetHeight(v122) > 0.0)
    {
      v123.origin.double y = v106;
      v123.origin.CGFloat x = v108;
      v123.size.double height = v102;
      v123.size.double width = v104;
      CGRectGetMaxY(v123);
    }
    v124.origin.CGFloat x = x;
    v124.origin.double y = y;
    v124.size.double width = width;
    v124.size.double height = height;
    CGRectGetMaxY(v124);
  }
  CGFloat v88 = [(id)objc_opt_class() titleFont];
  [v88 _scaledValueForValue:8.0];
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      IMRoundToPixel();
      double v89 = v90;
      break;
    default:
      double v89 = 100.0;
      break;
  }

  return v89;
}

- (CGRect)artworkFrameForStyle:(unint64_t)a3 forViewWidth:(double)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(id)objc_opt_class() artworkSizeForStyle:a3];
    double width = v7;
    CGFloat height = v9;
    unsigned int v11 = [(MTEpisodeLockup *)self _isRTL];
    [(MTEpisodeLockup *)self _layoutMargins];
    double x = a4 - v12 - width;
    if (!v11) {
      double x = v12;
    }
    double y = 8.0;
    if (a3 == 2) {
      double y = 16.0;
    }
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)titleOriginXForViewWidth:(double)result artworkFrame:(CGRect)a4 buttonFrame:(CGRect)a5 style:(unint64_t)a6
{
  if (a6 - 2 < 2)
  {
    CGFloat height = a4.size.height;
    CGFloat width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    if (![(MTEpisodeLockup *)self _isRTL])
    {
      CGFloat v13 = x;
      CGFloat v14 = y;
      CGFloat v15 = width;
      CGFloat v16 = height;
      return CGRectGetMaxX(*(CGRect *)&v13) + 8.0;
    }
LABEL_6:
    if (CGRectIsEmpty(a5))
    {
      [(MTEpisodeLockup *)self _layoutMargins];
      return v12;
    }
    CGFloat v13 = a5.origin.x;
    CGFloat v14 = a5.origin.y;
    CGFloat v15 = a5.size.width;
    CGFloat v16 = a5.size.height;
    return CGRectGetMaxX(*(CGRect *)&v13) + 8.0;
  }
  if (a6 <= 1)
  {
    if (![(MTEpisodeLockup *)self _isRTL])
    {
      [(MTEpisodeLockup *)self _layoutMargins];
      return v7;
    }
    goto LABEL_6;
  }
  return result;
}

- (CGSize)titleSizeForViewWidth:(double)a3 titleOrigin:(CGPoint)a4 artworkFrame:(CGRect)a5 buttonViewFrame:(CGRect)a6 style:(unint64_t)a7
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v10 = [(id)objc_opt_class() showsArtworkForStyle:a7];
  unsigned int v11 = [(MTEpisodeLockup *)self titleTextView];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;

  if (x != v13 || y != v15)
  {
    double v17 = [(MTEpisodeLockup *)self titleTextView];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v22 = [(MTEpisodeLockup *)self titleTextView];
    [v22 setFrame:x, y, v19, v21];
  }
  double v23 = -[MTEpisodeLockup titleExclusionPathsForButtonViewFrame:](self, "titleExclusionPathsForButtonViewFrame:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  double v24 = [(MTEpisodeLockup *)self titleTextView];
  uint64_t v25 = [v24 textContainer];
  [v25 setExclusionPaths:v23];

  LODWORD(v24) = CGRectIsEmpty(a6);
  unsigned int v26 = [(MTEpisodeLockup *)self _isRTL];
  if (v24)
  {
    if (!v26)
    {
      [(MTEpisodeLockup *)self _layoutMargins];
      double v32 = a3 - v33;
      goto LABEL_16;
    }
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
    if (!v26)
    {
      CGFloat v27 = a6.origin.x;
      CGFloat v28 = a6.origin.y;
      CGFloat width = a6.size.width;
      CGFloat height = a6.size.height;
      goto LABEL_15;
    }
    if (v10)
    {
LABEL_9:
      CGFloat v27 = a5.origin.x;
      CGFloat v28 = a5.origin.y;
      CGFloat width = a5.size.width;
      CGFloat height = a5.size.height;
LABEL_15:
      double v32 = CGRectGetMinX(*(CGRect *)&v27) + -8.0;
      goto LABEL_16;
    }
  }
  [(MTEpisodeLockup *)self _layoutMargins];
  double v32 = a3 - v31;
LABEL_16:
  double v34 = v32 - x;
  double v35 = [(MTEpisodeLockup *)self titleTextView];
  [v35 sizeThatFits:v34];
  double v37 = v36;

  double v38 = v34;
  double v39 = v37;
  result.CGFloat height = v39;
  result.CGFloat width = v38;
  return result;
}

- (double)titleOriginYForArtworkFrame:(CGRect)a3 style:(unint64_t)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(MTEpisodeLockup *)self _currentTitleFont];
  unsigned int v10 = v9;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      [v9 mt_offsetFromCapHeightToAscent];
      goto LABEL_5;
    case 2uLL:
      [v9 mt_offsetFromCapHeightToAscent];
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.double height = height;
      CGRectGetMinY(v13);
      goto LABEL_5;
    case 3uLL:
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.double height = height;
      CGRectGetMinY(v14);
      [v10 mt_offsetFromCapHeightToAscent];
LABEL_5:
      IMRoundToPixel();
      double height = v11;
      break;
    default:
      break;
  }

  return height;
}

- (double)descriptionOriginForViewWidth:(CGFloat)a3 artworkFrame:(CGFloat)a4 buttonViewFrame:(CGFloat)a5 titleFrame:(CGFloat)a6 metadataFrame:(uint64_t)a7 iconViewFrame:(unint64_t)a8 style:(double)a9
{
  double v31 = [a1 _currentTitleFont];
  double v32 = +[MTEpisodeLockup metadataHeaderFont];
  v58.origin.CGFloat x = a20;
  v58.origin.CGFloat y = a21;
  v58.size.CGFloat width = a22;
  v58.size.double height = a23;
  double Height = CGRectGetHeight(v58);
  v59.origin.CGFloat x = a24;
  v59.origin.CGFloat y = a25;
  v59.size.CGFloat width = a26;
  v59.size.double height = a27;
  double v34 = CGRectGetHeight(v59);
  if (Height >= v34) {
    double v34 = Height;
  }
  if (v34 <= 0.0) {
    double v35 = v31;
  }
  else {
    double v35 = v32;
  }
  id v36 = v35;
  if (a8 < 2)
  {
LABEL_9:
    [v31 lineHeight];
    [v36 mt_offsetFromLastBaselineToBottom];
    [v32 mt_offsetFromFirstBaselineToTop];
    v60.origin.CGFloat x = a16;
    v60.origin.CGFloat y = a17;
    v60.size.CGFloat width = a18;
    v60.size.double height = a19;
    double MaxY = CGRectGetMaxY(v60);
    v61.origin.CGFloat x = a20;
    v61.origin.CGFloat y = a21;
    v61.size.CGFloat width = a22;
    v61.size.double height = a23;
    if (CGRectGetHeight(v61) > 0.0)
    {
      v62.origin.CGFloat x = a20;
      v62.origin.CGFloat y = a21;
      v62.size.CGFloat width = a22;
      v62.size.double height = a23;
      double MaxY = CGRectGetMaxY(v62);
    }
    v63.origin.CGFloat x = a24;
    v63.origin.CGFloat y = a25;
    v63.size.CGFloat width = a26;
    v63.size.double height = a27;
    if (CGRectGetMaxY(v63) > MaxY)
    {
      double v38 = [a1 iconView];
      unsigned int v39 = [v38 isNotEmpty];

      if (v39)
      {
        uint64_t v40 = +[UIScreen mainScreen];
        [v40 scale];

        v64.origin.CGFloat x = a24;
        v64.origin.CGFloat y = a25;
        v64.size.CGFloat width = a26;
        v64.size.double height = a27;
        CGRectGetMaxY(v64);
      }
    }
    IMRoundToPixel();
    if ([a1 _isRTL])
    {
      [a1 descriptionWidthForViewWidth:a8 titleFrame:a2 style:a16 a17 a18 a19];
      double v42 = v41;
      v65.origin.CGFloat x = a16;
      v65.origin.CGFloat y = a17;
      v65.size.CGFloat width = a18;
      v65.size.double height = a19;
      double MinX = CGRectGetMaxX(v65) - v42;
    }
    else
    {
      v66.origin.CGFloat x = a16;
      v66.origin.CGFloat y = a17;
      v66.size.CGFloat width = a18;
      v66.size.double height = a19;
      double MinX = CGRectGetMinX(v66);
    }
    goto LABEL_29;
  }
  if (a8 != 2)
  {
    if (a8 != 3)
    {
      double MinX = CGPointZero.x;
      goto LABEL_29;
    }
    goto LABEL_9;
  }
  unsigned int v44 = [a1 _isRTL];
  CGFloat v45 = a3;
  double v46 = a4;
  if (v44)
  {
    CGFloat v45 = a12;
    double v46 = a13;
  }
  else
  {
    a14 = a5;
  }
  if (!v44) {
    a15 = a6;
  }
  CGFloat v55 = CGRectGetMinX(*(CGRect *)&v45);
  double v49 = [a1 iconView];
  if ([v49 isNotEmpty])
  {
    v67.origin.CGFloat x = a24;
    v67.origin.CGFloat y = a25;
    v67.size.CGFloat width = a26;
    v67.size.double height = a27;
    CGRectGetMaxY(v67);
  }

  v68.origin.CGFloat x = a20;
  v68.origin.CGFloat y = a21;
  v68.size.CGFloat width = a22;
  v68.size.double height = a23;
  if (CGRectGetHeight(v68) > 0.0)
  {
    v69.origin.CGFloat x = a20;
    v69.origin.CGFloat y = a21;
    v69.size.CGFloat width = a22;
    v69.size.double height = a23;
    CGRectGetMaxY(v69);
    [v32 mt_offsetFromLastBaselineToBottom];
  }
  v70.origin.CGFloat x = a16;
  v70.origin.CGFloat y = a17;
  v70.size.CGFloat width = a18;
  v70.size.double height = a19;
  CGRectGetMaxY(v70);
  [v31 mt_offsetFromLastBaselineToBottom];
  v71.origin.CGFloat x = a3;
  v71.origin.CGFloat y = a4;
  v71.size.CGFloat width = a5;
  v71.size.double height = a6;
  CGRectGetMaxY(v71);
  double v50 = +[MTEpisodeLockup metadataFooterFont];
  [v50 mt_offsetFromCapHeightToAscent];
  IMRoundToPixel();

  double MinX = v55;
LABEL_29:

  return MinX;
}

- (double)exactDescriptionSizeForOrigin:(double)a3 viewWidth:(double)a4 titleFrame:(double)a5 actionButtonFrame:(double)a6 downloadButtonFrame:(double)a7 style:(double)a8
{
  double v32 = [a1 _currentTitleFont];
  id v33 = [a1 isLabelMultipleLinesWithFrame:v32 font:a5, a6, a7, a8];

  double v62 = a4;
  if ([a1 isExpanded]) {
    id v34 = 0;
  }
  else {
    id v34 = [(id)objc_opt_class() descriptionNumberOfLinesForStyle:a10 isTitleMultipleLines:v33];
  }
  [a1 _setNumberOfLinesForDescription:v34];
  double v35 = a1 + 3;
  double v36 = a1[3];
  if (v36 == CGSizeZero.width && a1[4] == CGSizeZero.height)
  {
    [a1 buttonsFrameForActionButtonFrame:a12 downloadButtonFrame:a13 a14 a15 a16 a17 a18 a19];
    double v39 = v38;
    double v60 = v41;
    double v61 = v40;
    double v59 = v42;
    [a1 descriptionWidthForViewWidth:a10 titleFrame:v62 style:a5, a6, a7, a8];
    double v36 = v43;
    unsigned int v44 = [a1 descriptionExclusionPathsForOrigin:a2 descriptionWidth:a3 buttonsFrame:v43 titleFrame:v61 buttons:a5 title:a6 buttons:a7 title:a8];
    CGFloat v45 = [a1 descriptionTextView];
    double v46 = [v45 textContainer];
    [v46 setExclusionPaths:v44];

    [(id)objc_opt_class() descriptionMaxHeightForCurrentOrientation];
    double v48 = v47;
    double v49 = [a1 descriptionTextView];
    [v49 sizeThatFits:v36, v48];
    double v51 = v50;

    BOOL v52 = v51 > v48;
    if (v51 <= v48) {
      double v48 = v51;
    }
    [a1 setShowsDescriptionButton:v52];
    if (v48 > 0.0)
    {
      double v53 = [a1 descriptionTextView];
      CGFloat v54 = [v53 text];
      if ([v54 length])
      {
      }
      else
      {
        CGFloat v55 = [a1 descriptionTextView];
        CGFloat v56 = [v55 attributedText];
        id v57 = [v56 length];

        if (!v57) {
          double v48 = 0.0;
        }
      }
    }
    *double v35 = v36;
    v35[1] = v48;
  }
  return v36;
}

- (double)descriptionWidthForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  uint64_t v30 = v13;
  uint64_t v31 = v12;
  uint64_t v32 = v11;
  uint64_t v33 = v10;
  uint64_t v34 = v9;
  uint64_t v35 = v5;
  switch(a5)
  {
    case 0uLL:
    case 2uLL:
      [(MTEpisodeLockup *)self _layoutMargins];
      double MaxX = a3 - v17;
      goto LABEL_7;
    case 1uLL:
    case 3uLL:
      CGFloat height = a4.size.height;
      CGFloat width = a4.size.width;
      CGFloat y = a4.origin.y;
      CGFloat x = a4.origin.x;
      unsigned int v23 = [(MTEpisodeLockup *)self _isRTL];
      CGFloat v24 = x;
      CGFloat v25 = y;
      CGFloat v26 = width;
      CGFloat v27 = height;
      if (v23) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v24);
      }
      else {
        double MaxX = a3 - CGRectGetMinX(*(CGRect *)&v24);
      }
LABEL_7:
      [(MTEpisodeLockup *)self _layoutMargins];
      double result = MaxX - v29;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)titleExclusionPathsForButtonViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    uint64_t v8 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v9 = [(MTEpisodeLockup *)self titleTextView];
    [v9 convertRect:self x:y width:height];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    uint64_t v18 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v11 + -5.0, v13, v15 + 5.0, v17);
    double v19 = (void *)v18;
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v8 = +[NSArray arrayWithObjects:&v21 count:1];
    }
    else
    {
      uint64_t v8 = &__NSArray0__struct;
    }
  }

  return v8;
}

- (id)titleExclusionPathsForExplicitIconFrame:(CGRect)a3 viewWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v10 = &__NSArray0__struct;
  }
  else
  {
    double v11 = [(MTEpisodeLockup *)self titleTextView];
    [v11 convertRect:self x y width height];
    double v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    double v19 = v18;

    if ([(MTEpisodeLockup *)self _isRTL])
    {
      v27.origin.double x = v13;
      v27.origin.double y = v15;
      v27.size.double width = v17;
      v27.size.double height = v19;
      double v20 = CGRectGetMaxX(v27) + 5.0;
      double v21 = 0.0;
    }
    else
    {
      double v21 = v13 + -5.0;
      v28.origin.double x = v21;
      v28.origin.double y = v15;
      v28.size.double width = v17;
      v28.size.double height = v19;
      double v20 = a4 - CGRectGetMinX(v28);
    }
    uint64_t v22 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v21, v15, v20, v19);
    unsigned int v23 = (void *)v22;
    if (v22)
    {
      uint64_t v25 = v22;
      double v10 = +[NSArray arrayWithObjects:&v25 count:1];
    }
    else
    {
      double v10 = &__NSArray0__struct;
    }
  }

  return v10;
}

- (id)descriptionExclusionPathsForOrigin:(CGPoint)a3 descriptionWidth:(double)a4 buttonsFrame:(CGRect)a5 titleFrame:(CGRect)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = a3.y;
  double v12 = a3.x;
  if (CGRectIsEmpty(a5)) {
    goto LABEL_4;
  }
  v19.size.CGFloat height = 1.79769313e308;
  v19.origin.CGFloat x = v12;
  v19.origin.CGFloat y = v11;
  v19.size.CGFloat width = a4;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  if (!CGRectIntersectsRect(v19, v22))
  {
LABEL_4:
    double v13 = 0;
  }
  else
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectOffset(v20, -v12, -v11);
    double v13 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  }
  double v14 = +[NSMutableArray array];
  double v15 = v14;
  if (v13) {
    [v14 addObject:v13];
  }
  id v16 = [v15 copy];

  return v16;
}

- (BOOL)isLabelMultipleLinesWithFrame:(CGRect)a3 font:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v16);
  [v8 lineHeight];
  double v11 = v10;

  double v12 = v11 * 1.5;
  if (qword_10060A780 != -1) {
    dispatch_once(&qword_10060A780, &stru_100550740);
  }
  double v13 = floor(v12 * *(double *)&qword_1005F4AB0) / *(double *)&qword_1005F4AB0;
  double v14 = floor(v12);
  if (*(double *)&qword_1005F4AB0 == 1.0) {
    double v13 = v14;
  }
  return v9 >= v13;
}

- (CGRect)metadataFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 style:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MinX = CGRectGetMinX(a4);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v41);
  double v38 = MaxX;
  if (![(MTEpisodeLockup *)self _isRTL]) {
    double MaxX = a3 - MinX;
  }
  double v13 = [(MTEpisodeLockup *)self metadataLabel];
  double v14 = [v13 attributedText];
  CGFloat v40 = height;
  if ([v14 length])
  {

LABEL_6:
    double v18 = [(MTEpisodeLockup *)self metadataLabel];
    [v18 sizeThatFits:MaxX, 1.79769313e308];
    double v20 = v19;
    double v22 = v21;

    goto LABEL_7;
  }
  double v15 = [(MTEpisodeLockup *)self metadataLabel];
  CGRect v16 = [v15 text];
  id v17 = [v16 length];

  if (v17) {
    goto LABEL_6;
  }
  double v20 = CGSizeZero.width;
  double v22 = CGSizeZero.height;
LABEL_7:
  unsigned int v23 = +[MTEpisodeLockup titleFont];
  CGFloat v24 = +[MTEpisodeLockup metadataHeaderFont];
  [v23 lineHeight];
  [v23 mt_offsetFromLastBaselineToBottom];
  [v24 mt_offsetFromFirstBaselineToTop];
  if (qword_10060A780 != -1) {
    dispatch_once(&qword_10060A780, &stru_100550740);
  }
  double v25 = ceil(v20 * *(double *)&qword_1005F4AB0) / *(double *)&qword_1005F4AB0;
  double v26 = ceil(v20);
  if (*(double *)&qword_1005F4AB0 == 1.0) {
    double v27 = v26;
  }
  else {
    double v27 = v25;
  }
  double v28 = ceil(v22 * *(double *)&qword_1005F4AB0) / *(double *)&qword_1005F4AB0;
  double v29 = ceil(v22);
  if (*(double *)&qword_1005F4AB0 == 1.0) {
    double v30 = v29;
  }
  else {
    double v30 = v28;
  }
  if ([(MTEpisodeLockup *)self _isRTL]) {
    double v31 = v39 - v27;
  }
  else {
    double v31 = MinX;
  }
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = v40;
  CGRectGetMaxY(v42);
  IMRoundToPixel();
  double v33 = v32;

  double v34 = v31;
  double v35 = v33;
  double v36 = v27;
  double v37 = v30;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (CGRect)moreButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (![(MTEpisodeLockup *)self showsMoreButton])
  {
    double MinX = CGRectZero.origin.x;
    CGFloat v12 = CGRectZero.origin.y;
    double v13 = CGRectZero.size.width;
    CGFloat v14 = CGRectZero.size.height;
    goto LABEL_11;
  }
  id v8 = +[MTEpisodeLockup metadataHeaderFont];
  [v8 lineHeight];
  [v8 mt_offsetFromLastBaselineToBottom];
  [v8 mt_offsetFromFirstBaselineToTop];
  double v9 = [(MTEpisodeLockup *)self descriptionTextView];
  double v10 = [v9 attributedText];
  if ([v10 length])
  {
  }
  else
  {
    double v15 = [(MTEpisodeLockup *)self descriptionTextView];
    CGRect v16 = [v15 text];
    id v17 = [v16 length];

    if (!v17)
    {
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGRectGetMinY(v32);
      goto LABEL_7;
    }
  }
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRectGetMaxY(v31);
LABEL_7:
  double v18 = [(MTEpisodeLockup *)self moreButton];
  [v18 frame];
  double v13 = v19;
  CGFloat v14 = v20;

  unsigned int v21 = [(MTEpisodeLockup *)self _isRTL];
  CGFloat v22 = x;
  CGFloat v23 = y;
  CGFloat v24 = width;
  CGFloat v25 = height;
  if (v21) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v22) - v13;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
  }
  IMRoundToPixel();
  CGFloat v12 = v26;

LABEL_11:
  double v27 = MinX;
  double v28 = v12;
  double v29 = v13;
  double v30 = v14;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)iconsViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 metadataFrame:(CGRect *)a5 style:(unint64_t)a6
{
  double v9 = +[MTEpisodeLockup titleFont];
  double v10 = +[MTEpisodeLockup metadataHeaderFont];
  double v11 = [(MTEpisodeLockup *)self metadataLabel];
  CGFloat v12 = [v11 attributedText];
  if ([v12 length])
  {

LABEL_4:
    NSAttributedStringKey v49 = NSFontAttributeName;
    double v50 = v10;
    CGRect v16 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [@" " sizeWithAttributes:v16];
    double v18 = v17;

    double MaxY = CGRectGetMaxY(*a5);
    [v10 mt_offsetFromLastBaselineToBottom];
    double v21 = MaxY - v20;
    double v22 = 0.0;
    goto LABEL_5;
  }
  double v13 = [(MTEpisodeLockup *)self metadataLabel];
  CGFloat v14 = [v13 text];
  id v15 = [v14 length];

  if (v15) {
    goto LABEL_4;
  }
  double MinY = CGRectGetMinY(*a5);
  [v10 mt_offsetFromFirstBaselineToTop];
  double v21 = MinY + v47;
  [v9 mt_leftMargin];
  double v22 = v48;
  double v18 = 0.0;
LABEL_5:
  CGFloat v23 = [(MTEpisodeLockup *)self iconView];
  [v23 frame];
  double v25 = v24;
  double v27 = v26;

  unsigned int v28 = [(MTEpisodeLockup *)self _isRTL];
  CGFloat x = a5->origin.x;
  CGFloat y = a5->origin.y;
  CGFloat width = a5->size.width;
  CGFloat height = a5->size.height;
  if (v28) {
    double v33 = CGRectGetMinX(*(CGRect *)&x) - v25 - v18 - v22;
  }
  else {
    double v33 = v22 + v18 + CGRectGetMaxX(*(CGRect *)&x);
  }
  if ([(MTEpisodeLockup *)self _isRTL])
  {
    [(MTEpisodeLockup *)self _layoutMargins];
    double v35 = v34 - v33;
    if (v34 - v33 > 0.0)
    {
      a5->origin.CGFloat x = v35 + a5->origin.x;
LABEL_12:
      a5->size.CGFloat width = a5->size.width - v35;
    }
  }
  else
  {
    v51.origin.CGFloat x = v33;
    v51.origin.CGFloat y = v21 - v27;
    v51.size.CGFloat width = v25;
    v51.size.CGFloat height = v27;
    CGFloat v36 = CGRectGetMaxX(v51) - a3;
    [(MTEpisodeLockup *)self _layoutMargins];
    double v35 = v36 + v37;
    if (v36 + v37 > 0.0) {
      goto LABEL_12;
    }
  }
  UIPointRoundToViewScale();
  double v39 = v38;
  double v41 = v40;

  double v42 = v39;
  double v43 = v41;
  double v44 = v25;
  double v45 = v27;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.CGFloat y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (CGRect)playStatusViewFrameForViewWidth:(double)a3 titleFrame:(CGRect)a4 artworkFrame:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = v12;

  if ([(MTEpisodeLockup *)self showsPlayState])
  {
    [(id)objc_opt_class() leadingMarginForViewWidth:a3];
    IMRoundToPixel();
    double v15 = v14;
    unsigned int v16 = [(MTEpisodeLockup *)self _isRTL];
    unsigned int v17 = [(MTEpisodeLockup *)self showsArtwork];
    if (v17) {
      double v18 = a5.size.height;
    }
    else {
      double v18 = height;
    }
    if (v17) {
      double v19 = a5.size.width;
    }
    else {
      double v19 = width;
    }
    if (v17) {
      double v20 = a5.origin.y;
    }
    else {
      double v20 = y;
    }
    double v21 = a5.origin.x;
    if (!v17) {
      double v21 = x;
    }
    if (v16) {
      double v22 = v15 + CGRectGetMaxX(*(CGRect *)(&v18 - 3));
    }
    else {
      double v22 = CGRectGetMinX(*(CGRect *)(&v18 - 3)) + -14.0 - v15;
    }
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    CGRectGetMinY(v30);
    double v26 = [(MTEpisodeLockup *)self _currentTitleFont];
    [v26 mt_offsetFromCapHeightToAscent];
    IMRoundToPixel();
    double v23 = v27 - (1.0 / v13 + 1.0 / v13);

    double v25 = 14.0;
    double v24 = 14.0;
  }
  else
  {
    double v22 = CGRectZero.origin.x;
    double v23 = CGRectZero.origin.y;
    double v24 = CGRectZero.size.width;
    double v25 = CGRectZero.size.height;
  }
  double v28 = v22;
  double v29 = v23;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)downloadButtonFrameForActionButtonFrame:(CGRect)a3 titleOriginY:(double)a4
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

- (CGRect)actionButtonFrameForViewWidth:(double)a3 titleOriginY:(double)a4
{
  uint64_t v6 = [(MTEpisodeLockup *)self actionButton];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;

  double v11 = +[MTEpisodeLockup titleFont];
  if ([(MTEpisodeLockup *)self _isRTL])
  {
    [(MTEpisodeLockup *)self _layoutMargins];
    double v13 = v12;
  }
  else
  {
    [(MTEpisodeLockup *)self _layoutMargins];
    double v13 = a3 - v8 - v14;
  }
  [v11 mt_offsetFromCapHeightToAscent];
  [v11 capHeight];
  IMRoundToPixel();
  double v16 = v15;

  double v17 = v13;
  double v18 = v16;
  double v19 = v8;
  double v20 = v10;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)buttonsFrameForActionButtonFrame:(CGRect)a3 downloadButtonFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (!CGRectIsEmpty(a4))
  {
    v16.origin.CGFloat x = v11;
    v16.origin.CGFloat y = v10;
    v16.size.CGFloat width = v9;
    v16.size.CGFloat height = v8;
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRect v17 = CGRectUnion(v16, v19);
    CGFloat v11 = v17.origin.x;
    CGFloat v10 = v17.origin.y;
    CGFloat v9 = v17.size.width;
    CGFloat v8 = v17.size.height;
  }
  double v12 = v11;
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)descriptionButtonFrameForDescriptionFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinY = CGRectGetMinY(a3);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  if (CGRectGetHeight(v45) > 0.0)
  {
    CGFloat v9 = [(MTEpisodeLockup *)self descriptionTextView];
    CGFloat v10 = [(MTEpisodeLockup *)self descriptionTextView];
    CGFloat v11 = [v10 layoutManager];
    [v9 _lastGlyphBaselineRightPointWithLayoutManager:v11];
    double v13 = v12;
    double v15 = v14;

    CGRect v16 = [(MTEpisodeLockup *)self descriptionTextView];
    -[MTEpisodeLockup convertPoint:fromView:](self, "convertPoint:fromView:", v16, v13, v15);
    double v18 = v17;

    double MinY = v18 + 2.0;
  }
  CGRect v19 = +[MTEpisodeLockup metadataHeaderFont];
  [v19 lineHeight];
  double v21 = v20;
  [v19 mt_offsetFromLastBaselineToBottom];
  [v19 mt_offsetFromFirstBaselineToTop];
  if ([(MTEpisodeLockup *)self showsDescriptionButton])
  {
    double v22 = [(MTEpisodeLockup *)self descriptionButton];
    [v22 frame];
    double v24 = v23;
    CGFloat v44 = v25;
  }
  else
  {
    double v24 = CGSizeZero.width;
    CGFloat v44 = CGSizeZero.height;
  }
  unsigned int v26 = [(MTEpisodeLockup *)self _isRTL];
  CGFloat v27 = x;
  CGFloat v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;
  if (v26)
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v27);
    CGFloat v32 = height;
    double v33 = v24;
    double MinX = MaxX - v24;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v27);
    CGFloat v32 = height;
    double v33 = v24;
  }
  CGFloat v35 = x;
  CGFloat v36 = y;
  CGFloat v37 = width;
  CGRectGetMaxY(*(CGRect *)(&v32 - 3));
  IMRoundToPixel();
  [v19 mt_offsetFromFirstBaselineToTop];
  double v39 = MinY + v21 - v38;

  double v40 = MinX;
  double v41 = v39;
  double v42 = v33;
  double v43 = v44;
  result.size.CGFloat height = v43;
  result.size.CGFloat width = v42;
  result.origin.CGFloat y = v41;
  result.origin.CGFloat x = v40;
  return result;
}

- (CGRect)footerFrameForDescriptionButtonFrame:(CGRect)a3 descriptionFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  double v12 = +[MTEpisodeLockup descriptionFont];
  double v13 = +[MTEpisodeLockup metadataFooterFont];
  v32.origin.double x = v10;
  v32.origin.double y = v9;
  v32.size.double width = v8;
  v32.size.double height = v7;
  CGRectGetHeight(v32);
  v33.origin.double x = v10;
  v33.origin.double y = v9;
  v33.size.double width = v8;
  v33.size.double height = v7;
  CGFloat v14 = CGRectGetHeight(v33);
  BOOL v15 = v14 <= 0.0;
  if (v14 <= 0.0) {
    double v16 = x;
  }
  else {
    double v16 = v10;
  }
  if (v15) {
    double v17 = y;
  }
  else {
    double v17 = v9;
  }
  if (v15) {
    double v18 = width;
  }
  else {
    double v18 = v8;
  }
  if (v15) {
    double v19 = height;
  }
  else {
    double v19 = v7;
  }
  CGRectGetMaxY(*(CGRect *)&v16);
  [v13 _scaledValueForValue:26.0];
  [v12 mt_offsetFromLastBaselineToBottom];
  [v13 mt_offsetFromFirstBaselineToTop];
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  CGFloat MinX = CGRectGetMinX(v34);
  IMRoundToPixel();
  double v22 = v21;
  if ([(MTEpisodeLockup *)self showsFooterTextView])
  {
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    double v23 = CGRectGetWidth(v35);
    double v24 = [(MTEpisodeLockup *)self footerTextView];
    [v24 sizeThatFits:v23];
    CGFloat v26 = v25;
  }
  else
  {
    double v23 = CGRectZero.size.width;
    CGFloat v26 = CGRectZero.size.height;
  }

  double v27 = MinX;
  double v28 = v22;
  double v29 = v23;
  double v30 = v26;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)update
{
  [(MTEpisodeLockup *)self invalidateSizeMetrics];
  if (![(MTEpisodeLockup *)self updateTitleFontIfNeeded]
    || ([(MTEpisodeLockup *)self titleImage],
        float64x2_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    [(MTEpisodeLockup *)self updateTitleIncludingIcons];
  }
  if (![(MTEpisodeLockup *)self updateDisabledReason]) {
    [(MTEpisodeLockup *)self updateDescriptionText];
  }
  float64x2_t v4 = [(MTEpisodeLockup *)self artworkView];

  if (v4) {
    [(MTEpisodeLockup *)self beginLoadingArtwork];
  }
  [(MTEpisodeLockup *)self updateIcons];

  [(MTEpisodeLockup *)self setNeedsLayout];
}

- (void)updateMetadataText
{
  if ([(MTEpisodeLockup *)self showsPubDate]) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 5;
  }
  id v7 = +[MTEpisodeDescriptionCache sharedInstance];
  float64x2_t v4 = [(MTEpisodeLockup *)self episode];
  uint64_t v5 = [v7 descriptionForEpisode:v4 options:v3];
  uint64_t v6 = [(MTEpisodeLockup *)self metadataLabel];
  [v6 setAttributedText:v5];
}

- (void)updateFooterText
{
  if ([(MTEpisodeLockup *)self isExpanded])
  {
    uint64_t v3 = [(MTEpisodeLockup *)self episode];
    if ([v3 isPartiallyPlayed])
    {
      float64x2_t v4 = [(MTEpisodeLockup *)self episode];
      [v4 timeRemaining];
      BOOL v6 = v5 > 0.0;
    }
    else
    {
      BOOL v6 = 0;
    }

    id v7 = +[MTEpisodeDescriptionCache sharedInstance];
    double v8 = [(MTEpisodeLockup *)self episode];
    id v13 = [v7 metadataFooterForEpisode:v8 includingDuration:v6];

    if ([v13 length]) {
      id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v13];
    }
    else {
      id v9 = 0;
    }
    double v10 = [(MTEpisodeLockup *)self _currentDescriptionColor];
    [v9 im_addAttribute:NSForegroundColorAttributeName value:v10];

    id v11 = [v9 copy];
    double v12 = [(MTEpisodeLockup *)self footerTextView];
    [v12 setAttributedText:v11];
  }
}

- (void)updateDescriptionText
{
  uint64_t v3 = [(MTEpisodeLockup *)self episode];

  if (v3)
  {
    [(MTEpisodeLockup *)self updateMetadataText];
    float64x2_t v4 = +[MTEpisodeDescriptionCache sharedInstance];
    double v5 = [(MTEpisodeLockup *)self episode];
    id v10 = [v4 descriptionForEpisode:v5 options:16];

    if ([v10 length]) {
      id v6 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v10];
    }
    else {
      id v6 = 0;
    }
    id v7 = [(MTEpisodeLockup *)self _currentDescriptionColor];
    [v6 addAttribute:NSForegroundColorAttributeName value:v7 range:NSMakeRange(0, [v10 length])];

    id v8 = [v6 copy];
    id v9 = [(MTEpisodeLockup *)self descriptionTextView];
    [v9 setAttributedText:v8];

    [(MTEpisodeLockup *)self updateFooterText];
    [(MTEpisodeLockup *)self invalidateSizeMetrics];
    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (BOOL)updateDisabledReason
{
  uint64_t v3 = [(MTEpisodeLockup *)self episode];
  id v4 = [v3 reasonForNotPlayable];

  int64_t v5 = [(MTEpisodeLockup *)self disabledReason];
  if ((id)v5 != v4) {
    [(MTEpisodeLockup *)self setDisabledReason:v4];
  }
  return v5 != (void)v4;
}

- (void)setDisabledReason:(int64_t)a3
{
  if (self->_disabledReason != a3)
  {
    self->_disabledReason = a3;
    if (a3) {
      UIInterfaceGetContentDisabledAlpha();
    }
    else {
      double v4 = 1.0;
    }
    [(MTEpisodeLockup *)self setAlpha:v4];
    int64_t v5 = [(MTEpisodeLockup *)self episode];

    if (v5)
    {
      [(MTEpisodeLockup *)self updateDescriptionText];
      [(MTEpisodeLockup *)self updateIcons];
    }
    if ([(MTEpisodeLockup *)self isExpanded])
    {
      id v6 = [(MTEpisodeLockup *)self delegate];
      [v6 lockupDidChangeSize:self];
    }
  }
}

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      double v4 = [objc_opt_class() defaultArtworkForStyle:[self style]];
      int64_t v5 = [(MTEpisodeLockup *)self artworkView];
      [v5 setArtwork:v4];

      id v6 = [(MTEpisodeLockup *)self artworkView];
      [v6 sizeToFit];

      id v7 = [(MTEpisodeLockup *)self artworkView];
      [(MTEpisodeLockup *)self addSubview:v7];

      [(MTEpisodeLockup *)self beginLoadingArtwork];
    }
    else
    {
      id v8 = [(MTEpisodeLockup *)self artworkView];
      [v8 removeFromSuperview];

      [(MTEpisodeLockup *)self setArtworkView:0];
    }
    [(MTEpisodeLockup *)self updatePlayStatusIcons];
    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)beginLoadingArtwork
{
  uint64_t v3 = [(MTEpisodeArtworkView *)self->_artworkView superview];
  if (v3)
  {
    double v4 = (void *)v3;
    int64_t v5 = [(MTEpisodeLockup *)self episode];
    id v6 = [v5 podcastUuid];
    id v7 = [v6 length];

    if (v7)
    {
      [objc_opt_class() artworkSizeForStyle:[self style]];
      double v10 = v9;
      if (v9 >= 0.100000001)
      {
        double v11 = v8;
        if (v8 >= 0.100000001)
        {
          double v12 = [(MTEpisodeLockup *)self episode];
          id v13 = [v12 podcastUuid];

          CGFloat v14 = +[MTImageStore defaultStore];
          BOOL v15 = [v14 imageInMemoryForKey:v13 size:v10, v11];

          if (v15)
          {
            double v16 = [(MTEpisodeLockup *)self artworkView];
            [v16 setArtwork:v15];
          }
          else
          {
            objc_initWeak(&location, self);
            double v17 = +[MTImageStore defaultStore];
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_1000C7AF4;
            v18[3] = &unk_100550720;
            objc_copyWeak(&v19, &location);
            [v17 asyncImageForKey:v13 size:v18 completionHandler:v10, v11];

            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

- (void)setShowsMoreButton:(BOOL)a3
{
  if (self->_showsMoreButton != a3)
  {
    BOOL v3 = a3;
    self->_showsMoreButton = a3;
    int64_t v5 = [(MTEpisodeLockup *)self moreButton];
    id v6 = v5;
    if (v3) {
      [(MTEpisodeLockup *)self addSubview:v5];
    }
    else {
      [v5 removeFromSuperview];
    }

    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)updateMoreButtonVisibility
{
  if ([(MTEpisodeLockup *)self isExpanded]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(MTEpisodeLockup *)self isEditing] ^ 1;
  }

  [(MTEpisodeLockup *)self setShowsMoreButton:v3];
}

- (void)setShowsDescriptionButton:(BOOL)a3
{
  if (self->_showsDescriptionButton != a3)
  {
    BOOL v3 = a3;
    self->_showsDescriptionButton = a3;
    int64_t v5 = [(MTEpisodeLockup *)self descriptionButton];
    id v6 = v5;
    if (v3) {
      [(MTEpisodeLockup *)self addSubview:v5];
    }
    else {
      [v5 removeFromSuperview];
    }

    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)setShowsFooterTextView:(BOOL)a3
{
  if (self->_showsFooterTextView != a3)
  {
    BOOL v3 = a3;
    self->_showsFooterTextView = a3;
    int64_t v5 = [(MTEpisodeLockup *)self footerTextView];
    id v6 = v5;
    if (v3) {
      [(MTEpisodeLockup *)self addSubview:v5];
    }
    else {
      [v5 removeFromSuperview];
    }

    [(MTEpisodeLockup *)self setNeedsLayout];
  }
}

- (void)updateFooterTextViewVisbility
{
  if ([(MTEpisodeLockup *)self isExpanded])
  {
    id v4 = [(MTEpisodeLockup *)self footerTextView];
    BOOL v3 = [v4 attributedText];
    -[MTEpisodeLockup setShowsFooterTextView:](self, "setShowsFooterTextView:", [v3 length] != 0);
  }
  else
  {
    [(MTEpisodeLockup *)self setShowsFooterTextView:0];
  }
}

- (BOOL)updateTitleFontIfNeeded
{
  BOOL v3 = [(id)objc_opt_class() titleFont];
  id v4 = [(MTEpisodeLockup *)self _currentTitleFont];
  unsigned __int8 v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [(MTEpisodeLockup *)self titleTextView];
    [v6 setFont:v3];

    id v7 = [(MTEpisodeLockup *)self titleImage];

    if (v7) {
      [(MTEpisodeLockup *)self updateTitleIncludingIcons];
    }
  }

  return v5 ^ 1;
}

- (void)setTitleImage:(id)a3
{
  unsigned __int8 v5 = (UIImage *)a3;
  p_titleImage = &self->_titleImage;
  if (self->_titleImage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_titleImage, a3);
    p_titleImage = (UIImage **)[(MTEpisodeLockup *)self updateTitleIncludingIcons];
    unsigned __int8 v5 = v7;
  }

  _objc_release_x1(p_titleImage, v5);
}

- (void)updateTitleIncludingIcons
{
  BOOL v3 = [(MTEpisodeLockup *)self titleImage];

  if (v3)
  {
    id v4 = objc_opt_new();
    unsigned __int8 v5 = [(MTEpisodeLockup *)self titleImage];
    [v4 setImage:v5];

    id v6 = objc_alloc_init((Class)NSMutableAttributedString);
    id v7 = [(MTEpisodeLockup *)self episode];
    double v8 = [v7 bestTitle];

    if (v8)
    {
      id v9 = objc_alloc((Class)NSAttributedString);
      double v10 = [(MTEpisodeLockup *)self episode];
      double v11 = [v10 bestTitle];
      id v12 = [v9 initWithString:v11];
      [v6 appendAttributedString:v12];
    }
    id v13 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
    [v6 appendAttributedString:v13];

    CGFloat v14 = +[NSAttributedString attributedStringWithAttachment:v4];
    [v6 appendAttributedString:v14];

    v20[0] = NSFontAttributeName;
    BOOL v15 = [(MTEpisodeLockup *)self _currentTitleFont];
    v21[0] = v15;
    v20[1] = NSForegroundColorAttributeName;
    double v16 = [(MTEpisodeLockup *)self _currentTitleColor];
    v21[1] = v16;
    double v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    [v6 addAttributes:v17 range:0, [v6 length]];
    id v18 = [objc_alloc((Class)NSAttributedString) initWithAttributedString:v6];
    id v19 = [(MTEpisodeLockup *)self titleTextView];
    [v19 setAttributedText:v18];
  }
  else
  {
    id v4 = [(MTEpisodeLockup *)self episode];
    id v6 = [v4 bestTitle];
    double v17 = [(MTEpisodeLockup *)self titleTextView];
    [v17 setText:v6];
  }

  [(MTEpisodeLockup *)self setNeedsLayout];
}

- (void)startObservingPlaybackState
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"updatePlayStatusIcons" name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)stopObservingPlaybackState
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:IMAVPlayerNotification_StateDidChange object:0];
}

- (void)playbackStateDidChange
{
  if ([(MTEpisodeLockup *)self isCurrentPlayerItem])
  {
    [(MTEpisodeLockup *)self updatePlayStatusIcons];
  }
}

- (void)updateIcons
{
  id v3 = [(MTEpisodeLockup *)self episode];
  -[MTEpisodeLockup setShowsExplicitIcon:](self, "setShowsExplicitIcon:", [v3 isExplicit]);

  if (![(MTEpisodeLockup *)self updateIsCurrentPlayerItemState]) {
    [(MTEpisodeLockup *)self updatePlayStatusIcons];
  }
  [(MTEpisodeLockup *)self updateAssetStatusIcons];
  id v4 = [(MTEpisodeLockup *)self iconView];
  unsigned __int8 v5 = [(MTEpisodeLockup *)self episode];
  [v4 setVideo:[v5 isVideo]];

  [(MTEpisodeLockup *)self updateIconView];
}

- (BOOL)updateIsCurrentPlayerItemState
{
  id v3 = +[MTPlayerController defaultInstance];
  id v4 = [(MTEpisodeLockup *)self episode];
  unsigned __int8 v5 = [v4 uuid];
  id v6 = [v3 isPlayingEpisodeUuid:v5];

  unsigned int v7 = v6 ^ [(MTEpisodeLockup *)self isCurrentPlayerItem];
  if (v7 == 1) {
    [(MTEpisodeLockup *)self setCurrentPlayerItem:v6];
  }
  return v7;
}

- (void)updatePlayStatusIcons
{
  if ([(MTEpisodeLockup *)self showsPlayState]
    && ![(MTEpisodeLockup *)self showsArtwork]
    && [(MTEpisodeLockup *)self shouldShowNowPlaying])
  {
    unsigned int v3 = [(MTEpisodeLockup *)self isCurrentPlayerItem];
  }
  else
  {
    unsigned int v3 = 0;
  }
  id v12 = 0;
  if ([(MTEpisodeLockup *)self showsPlayState] && (v3 & 1) == 0)
  {
    id v4 = [(MTEpisodeLockup *)self episode];
    unsigned __int8 v5 = [(MTEpisodeLockup *)self colorTheme];
    id v12 = [v4 playStatusImageForTheme:v5];
  }
  id v6 = [(MTEpisodeLockup *)self playStatusView];
  [v6 setImage:v12];

  unsigned int v7 = [(MTEpisodeLockup *)self playStatusView];
  [v7 sizeToFit];

  if (v3)
  {
    double v8 = [(MTEpisodeLockup *)self barsView];
    id v9 = [v8 superview];

    if (v9 != self)
    {
      double v10 = [(MTEpisodeLockup *)self barsView];
      [(MTEpisodeLockup *)self addSubview:v10];
    }
    [(MTEpisodeLockup *)self updateStateForBarsView:self->_barsView];
  }
  else
  {
    double v11 = [(MTNowPlayingIndicatorView *)self->_barsView superview];

    if (v11)
    {
      [(MTNowPlayingIndicatorView *)self->_barsView setPlaybackState:0];
      [(MTNowPlayingIndicatorView *)self->_barsView removeFromSuperview];
    }
  }
  [(MTEpisodeLockup *)self setNeedsLayout];
}

- (void)updateStateForBarsView:(id)a3
{
  id v7 = a3;
  if ([(MTEpisodeLockup *)self isCurrentPlayerItem])
  {
    id v4 = +[MTPlayerController defaultInstance];
    unsigned int v5 = [v4 isTargetPlaying];

    if (v5) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v7 setPlaybackState:v6];
}

- (void)updateAssetStatusIcons
{
  unsigned int v3 = [(MTEpisodeLockup *)self episode];
  unsigned __int8 v4 = [v3 isExternalType];

  if (v4)
  {
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  uint64_t v6 = +[MTReachability sharedInstance];
  if ([v6 isReachable])
  {
    id v7 = [(MTEpisodeLockup *)self episode];
    unsigned int v8 = [v7 feedDeleted];

    if (!v8)
    {
      uint64_t v5 = 2;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v5 = 3;
LABEL_8:
  id v9 = [(MTEpisodeLockup *)self iconView];
  [v9 setAssetStatus:v5];
}

- (void)updateIconView
{
  unsigned int v3 = [(MTEpisodeLockup *)self iconView];
  unsigned int v4 = [v3 isNotEmpty];

  uint64_t v5 = [(MTEpisodeLockup *)self iconView];
  uint64_t v6 = v5;
  if (!v4)
  {
    double v10 = [v5 superview];

    if (!v10) {
      return;
    }
    id v9 = [(MTEpisodeLockup *)self iconView];
    [v9 removeFromSuperview];
    goto LABEL_6;
  }
  [v5 updateSizeIfNeeded];

  id v7 = [(MTEpisodeLockup *)self iconView];
  unsigned int v8 = [v7 superview];

  if (v8 != self)
  {
    id v9 = [(MTEpisodeLockup *)self iconView];
    [(MTEpisodeLockup *)self addSubview:v9];
LABEL_6:
  }

  [(MTEpisodeLockup *)self setNeedsLayout];
}

- (void)setShowsExplicitIcon:(BOOL)a3
{
  if (self->_showsExplicitIcon != a3)
  {
    BOOL v3 = a3;
    self->_showsExplicitIcon = a3;
    id v4 = [(MTEpisodeLockup *)self iconView];
    [v4 setExplicit:v3];
  }
}

- (BOOL)_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(MTEpisodeLockup *)self semanticContentAttribute]] == (id)1;
}

- (id)_currentTitleFont
{
  long long v2 = [(MTEpisodeLockup *)self titleTextView];
  BOOL v3 = [v2 font];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() titleFont];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_currentDescriptionFont
{
  long long v2 = [(MTEpisodeLockup *)self descriptionTextView];
  BOOL v3 = [v2 font];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() descriptionFont];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_currentTitleColor
{
  BOOL v3 = [(MTEpisodeLockup *)self titleTextView];
  id v4 = [v3 textColor];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(MTEpisodeLockup *)self colorTheme];
    id v6 = +[UIColor primaryTextColorForTheme:v7];
  }

  return v6;
}

- (id)_currentDescriptionColor
{
  BOOL v3 = [(MTEpisodeLockup *)self descriptionTextView];
  id v4 = [v3 textColor];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(MTEpisodeLockup *)self colorTheme];
    id v6 = +[UIColor secondaryTextColorForTheme:v7];
  }

  return v6;
}

- (void)_setNumberOfLinesForDescription:(unint64_t)a3
{
  id v5 = [(MTEpisodeLockup *)self descriptionTextView];
  id v6 = [v5 textContainer];
  id v7 = [v6 maximumNumberOfLines];

  if (v7 != (id)a3)
  {
    unsigned int v8 = [(MTEpisodeLockup *)self descriptionTextView];
    id v9 = [v8 textContainer];
    [v9 setMaximumNumberOfLines:a3];

    double v10 = [(MTEpisodeLockup *)self descriptionTextView];
    double v11 = [v10 layoutManager];
    id v12 = [(MTEpisodeLockup *)self descriptionTextView];
    id v13 = [v12 textContainer];
    [v11 textContainerChangedGeometry:v13];

    self->_descriptionSize = CGSizeZero;
  }
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (MTEpisodeLockupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTEpisodeLockupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTEpisodeActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (BOOL)shouldShowNowPlaying
{
  return self->_shouldShowNowPlaying;
}

- (void)setShouldShowNowPlaying:(BOOL)a3
{
  self->_shouldShowNowPlaying = a3;
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)showsPubDate
{
  return self->_showsPubDate;
}

- (BOOL)showsPlayState
{
  return self->_showsPlayState;
}

- (void)set_layoutMargins:(UIEdgeInsets)a3
{
  self->__layoutMargins = a3;
}

- (void)setMoreButton:(id)a3
{
}

- (void)setDescriptionButton:(id)a3
{
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (NSOperation)imageLoadingOperation
{
  return self->_imageLoadingOperation;
}

- (void)setImageLoadingOperation:(id)a3
{
}

- (BOOL)showsDescriptionButton
{
  return self->_showsDescriptionButton;
}

- (BOOL)showsFooterTextView
{
  return self->_showsFooterTextView;
}

- (BOOL)showsExplicitIcon
{
  return self->_showsExplicitIcon;
}

- (BOOL)showsStreamingIcon
{
  return self->_showsStreamingIcon;
}

- (void)setShowsStreamingIcon:(BOOL)a3
{
  self->_showsStreamingIcon = a3;
}

- (BOOL)showsDocumentIcon
{
  return self->_showsDocumentIcon;
}

- (void)setShowsDocumentIcon:(BOOL)a3
{
  self->_showsDocumentIcon = a3;
}

- (BOOL)showsErrorIcon
{
  return self->_showsErrorIcon;
}

- (void)setShowsErrorIcon:(BOOL)a3
{
  self->_showsErrorIcon = a3;
}

- (BOOL)showsAirplaneModeIcon
{
  return self->_showsAirplaneModeIcon;
}

- (void)setShowsAirplaneModeIcon:(BOOL)a3
{
  self->_showsAirplaneModeIcon = a3;
}

- (void)setMoreAction:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void)setTitleTextView:(id)a3
{
}

- (void)setMetadataLabel:(id)a3
{
}

- (void)setDescriptionTextView:(id)a3
{
}

- (void)setFooterTextView:(id)a3
{
}

- (void)setArtworkView:(id)a3
{
}

- (void)setPlayStatusView:(id)a3
{
}

- (void)setExplicitIconView:(id)a3
{
}

- (void)setIconView:(id)a3
{
}

- (MTEpisodeStateView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (BOOL)showsMoreButton
{
  return self->_showsMoreButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_explicitIconView, 0);
  objc_storeStrong((id *)&self->_playStatusView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_moreAction, 0);
  objc_storeStrong((id *)&self->_imageLoadingOperation, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_descriptionButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_episode, 0);

  objc_storeStrong((id *)&self->_sizeCache, 0);
}

@end