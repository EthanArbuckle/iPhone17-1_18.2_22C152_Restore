@interface BKDebugViewController
+ (id)resolver;
+ (id)serviceCenter;
- (BKDebugViewSection)yearInReviewSection;
- (DebugViewControllerPriceTracking)priceTracking;
- (DebugViewControllerRemoteConfig)remoteConfig;
- (NSArray)lightLevelTitles;
- (NSArray)miscSectionEntries;
- (NSArray)sections;
- (NSArray)sessionStartOffsets;
- (NSDictionary)reiModes;
- (NSString)bootUrl;
- (NSString)coverCacheHashOrAdamID;
- (UISwitch)allowUnsignedJetpackSwitch;
- (UISwitch)alwaysParseEpubSwitch;
- (UISwitch)appAnalyticsDebugProcessorModeSwitch;
- (UISwitch)bookAnalyticsOverlayImpressionsEnabledSwitch;
- (UISwitch)booksUIDebugModifiersEnabledSwitch;
- (UISwitch)booksUIShelfGridDebugUIEnabledSwitch;
- (UISwitch)curlAnimationSwitch;
- (UISwitch)debugODPClusteringSwitch;
- (UISwitch)disableREI;
- (UISwitch)dontShowDisabledSwitch;
- (UISwitch)enableChapterAnimationSwitch;
- (UISwitch)enablePageTurnDebugging;
- (UISwitch)endOfBookDebugMenuSwitch;
- (UISwitch)fakePlayerSwitch;
- (UISwitch)hotReloadModeSwitch;
- (UISwitch)launchWithBundleJSSwitch;
- (UISwitch)layoutDebugSwitch;
- (UISwitch)loadBundledJetPackFromJSRootSwitch;
- (UISwitch)localSignalCollectionEnabledSwitch;
- (UISwitch)localSignalSyncEnabledSwitch;
- (UISwitch)nightModeDelaySwitch;
- (UISwitch)nightModeSwitch;
- (UISwitch)oldFontStepsAndSpacingSwitch;
- (UISwitch)productPageSampleFeedbackShownSwitch;
- (UISwitch)productPageSlideSwitch;
- (UISwitch)productPageSlowModeSwitch;
- (UISwitch)reiAllowScrollMacOSSwitch;
- (UISwitch)reiContentSizeLogging;
- (UISwitch)reiDisableAutoFontDownloadSwitch;
- (UISwitch)reiEnableCellularFontDownloadSwitch;
- (UISwitch)reiIgnoreCacheSwitch;
- (UISwitch)reiLayoutGuidesSwitch;
- (UISwitch)reiLogContentSizeSwitch;
- (UISwitch)reiShowPaginatingWebViewSwitch;
- (UISwitch)reiUseNewTextStylingSwitch;
- (UISwitch)slowModeSwitch;
- (UISwitch)uipBookViewFallback;
- (UISwitch)webSetAcceleratedDrawingDisabledSwitch;
- (UISwitch)webSetDrawBordersSwitch;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)readingSessionCurrentStartOffset;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)_clearTodaysReadingTime;
- (unint64_t)currentLightLevel;
- (unint64_t)currentREIMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)_close:(id)a3;
- (void)_emulateCurrentLightLevelChange:(int64_t)a3;
- (void)_handleAppRemoval;
- (void)_loadDefaults;
- (void)_moveEligibleLocalBooksToUbiquity;
- (void)_moveUbiquityBooksBackToLocal;
- (void)_presentAddReadingSessionPickerFromIndexPath:(id)a3 duration:(double)a4;
- (void)_presentCoverCacheDumpingAdamIDCoversAlert;
- (void)_presentLightLevelChangeAlert;
- (void)_presentProductPageAlsoAvailableAsAlert;
- (void)_presentREIChromeEditingMenu;
- (void)_presentSessionStartOffsetChangeAlert;
- (void)_presentTeaDebugViewController:(id)a3;
- (void)_presentWantToReadSamplesBehaviorAlert;
- (void)setAllowUnsignedJetpackSwitch:(id)a3;
- (void)setAlwaysParseEpubSwitch:(id)a3;
- (void)setAppAnalyticsDebugProcessorModeSwitch:(id)a3;
- (void)setBookAnalyticsOverlayImpressionsEnabledSwitch:(id)a3;
- (void)setBooksUIDebugModifiersEnabledSwitch:(id)a3;
- (void)setBooksUIShelfGridDebugUIEnabledSwitch:(id)a3;
- (void)setBootUrl:(id)a3;
- (void)setCoverCacheHashOrAdamID:(id)a3;
- (void)setCurlAnimationSwitch:(id)a3;
- (void)setCurrentLightLevel:(unint64_t)a3;
- (void)setCurrentREIMode:(unint64_t)a3;
- (void)setDebugODPClusteringSwitch:(id)a3;
- (void)setDisableREI:(id)a3;
- (void)setDontShowDisabledSwitch:(id)a3;
- (void)setEnableChapterAnimationSwitch:(id)a3;
- (void)setEnablePageTurnDebugging:(id)a3;
- (void)setEndOfBookDebugMenuSwitch:(id)a3;
- (void)setFakePlayerSwitch:(id)a3;
- (void)setHotReloadModeSwitch:(id)a3;
- (void)setLaunchWithBundleJSSwitch:(id)a3;
- (void)setLayoutDebugSwitch:(id)a3;
- (void)setLightLevelTitles:(id)a3;
- (void)setLoadBundledJetPackFromJSRootSwitch:(id)a3;
- (void)setLocalSignalCollectionEnabledSwitch:(id)a3;
- (void)setLocalSignalSyncEnabledSwitch:(id)a3;
- (void)setMiscSectionEntries:(id)a3;
- (void)setNightModeDelaySwitch:(id)a3;
- (void)setNightModeSwitch:(id)a3;
- (void)setOldFontStepsAndSpacingSwitch:(id)a3;
- (void)setProductPageSampleFeedbackShownSwitch:(id)a3;
- (void)setProductPageSlideSwitch:(id)a3;
- (void)setProductPageSlowModeSwitch:(id)a3;
- (void)setReadingSessionCurrentStartOffset:(int64_t)a3;
- (void)setReiAllowScrollMacOSSwitch:(id)a3;
- (void)setReiContentSizeLogging:(id)a3;
- (void)setReiDisableAutoFontDownloadSwitch:(id)a3;
- (void)setReiEnableCellularFontDownloadSwitch:(id)a3;
- (void)setReiIgnoreCacheSwitch:(id)a3;
- (void)setReiLayoutGuidesSwitch:(id)a3;
- (void)setReiLogContentSizeSwitch:(id)a3;
- (void)setReiModes:(id)a3;
- (void)setReiShowPaginatingWebViewSwitch:(id)a3;
- (void)setReiUseNewTextStylingSwitch:(id)a3;
- (void)setSections:(id)a3;
- (void)setSessionStartOffsets:(id)a3;
- (void)setSlowModeSwitch:(id)a3;
- (void)setUipBookViewFallback:(id)a3;
- (void)setWebSetAcceleratedDrawingDisabledSwitch:(id)a3;
- (void)setWebSetDrawBordersSwitch:(id)a3;
- (void)setupForTableView;
- (void)setupNavigationBar;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation BKDebugViewController

+ (id)serviceCenter
{
  v2 = +[BKAppDelegate delegate];
  v3 = [v2 serviceCenter];

  return v3;
}

+ (id)resolver
{
  v2 = +[BKAppDelegate delegate];
  v3 = [v2 containerHost];
  v4 = [v3 bridgedResolver];

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKDebugViewController;
  [(BKDebugViewController *)&v3 viewDidLoad];
  [(BKDebugViewController *)self setupNavigationBar];
  [(BKDebugViewController *)self setupForTableView];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad()) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setupNavigationBar
{
  objc_super v3 = [(BKDebugViewController *)self navigationItem];
  [v3 setTitle:@"iBooks Debugging (Release Build)"];

  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Close" style:2 target:self action:"_close:"];
  v5 = [(BKDebugViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  v6 = +[NSBundle internalExtrasBundle];

  if (v6)
  {
    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Tea" style:2 target:self action:"_presentTeaDebugViewController:"];
    v7 = [(BKDebugViewController *)self navigationItem];
    [v7 setRightBarButtonItem:v8];
  }
}

- (void)setupForTableView
{
  objc_super v3 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"kREIChapterAnimationEnabled"];
  enableChapterAnimationSwitch = self->_enableChapterAnimationSwitch;
  self->_enableChapterAnimationSwitch = &v3->super;

  v5 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"kPageTurnSnapshotDebug" action:&stru_100A47050];
  enablePageTurnDebugging = self->_enablePageTurnDebugging;
  val = self;
  self->_enablePageTurnDebugging = &v5->super;

  v7 = +[NSUserDefaults standardUserDefaults];
  self->_currentLightLevel = (unint64_t)[v7 integerForKey:kOverrideLightLevel];

  lightLevelTitles = self->_lightLevelTitles;
  self->_lightLevelTitles = (NSArray *)&off_100A83588;

  v9 = [BKDebugBoolDefaultSwitch alloc];
  v363[0] = _NSConcreteStackBlock;
  v363[1] = 3221225472;
  v363[2] = sub_100102BA8;
  v363[3] = &unk_100A44268;
  v363[4] = self;
  v10 = [(BKDebugBoolDefaultSwitch *)v9 initWithDefaultsKey:kOverrideNightMode action:v363];
  nightModeSwitch = self->_nightModeSwitch;
  self->_nightModeSwitch = v10;

  v12 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BCShouldOverrideNightModeDelay"];
  nightModeDelaySwitch = self->_nightModeDelaySwitch;
  self->_nightModeDelaySwitch = &v12->super;

  v14 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BKAllowEndOfBookDebugMenu"];
  endOfBookDebugMenuSwitch = self->_endOfBookDebugMenuSwitch;
  self->_endOfBookDebugMenuSwitch = &v14->super;

  v16 = [BKDebugBoolDefaultSwitch alloc];
  v17 = [(BKDebugBoolDefaultSwitch *)v16 initWithDefaultsKey:BKUseOldFontStepsAndSpacing];
  oldFontStepsAndSpacingSwitch = self->_oldFontStepsAndSpacingSwitch;
  self->_oldFontStepsAndSpacingSwitch = v17;

  v19 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"kREILayoutGuides"];
  reiLayoutGuidesSwitch = self->_reiLayoutGuidesSwitch;
  self->_reiLayoutGuidesSwitch = &v19->super;

  v21 = [BKDebugBoolDefaultSwitch alloc];
  v22 = [(BKDebugBoolDefaultSwitch *)v21 initWithDefaultsKey:BKUseLegacyCurlAnimation];
  curlAnimationSwitch = self->_curlAnimationSwitch;
  self->_curlAnimationSwitch = v22;

  v24 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.ShowPaginatingWebView"];
  reiShowPaginatingWebViewSwitch = self->_reiShowPaginatingWebViewSwitch;
  self->_reiShowPaginatingWebViewSwitch = &v24->super;

  v26 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.IgnoreCache"];
  reiIgnoreCacheSwitch = self->_reiIgnoreCacheSwitch;
  self->_reiIgnoreCacheSwitch = &v26->super;

  v28 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"_BEAlwaysFullParse"];
  alwaysParseEpubSwitch = self->_alwaysParseEpubSwitch;
  self->_alwaysParseEpubSwitch = &v28->super;

  v30 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.LogContentSize"];
  reiLogContentSizeSwitch = self->_reiLogContentSizeSwitch;
  self->_reiLogContentSizeSwitch = &v30->super;

  v32 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.AllowMacOSScroll"];
  reiAllowScrollMacOSSwitch = self->_reiAllowScrollMacOSSwitch;
  self->_reiAllowScrollMacOSSwitch = &v32->super;

  v34 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.DisableAutoFontDownload"];
  reiDisableAutoFontDownloadSwitch = self->_reiDisableAutoFontDownloadSwitch;
  self->_reiDisableAutoFontDownloadSwitch = &v34->super;

  v36 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REIUseOldTextStyling"];
  reiUseNewTextStylingSwitch = self->_reiUseNewTextStylingSwitch;
  self->_reiUseNewTextStylingSwitch = &v36->super;

  v38 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"REI.LogContentSize"];
  reiContentSizeLogging = self->_reiContentSizeLogging;
  self->_reiContentSizeLogging = &v38->super;

  v40 = +[JSABridge sharedInstance];
  v41 = [v40 environment];
  v42 = [v41 bootURL];
  bootUrl = self->_bootUrl;
  self->_bootUrl = v42;

  v44 = +[NSUserDefaults standardUserDefaults];
  v45 = [v44 stringForKey:kAllowsCoverCacheImagesLoggingUserDefaultsKey];
  coverCacheHashOrAdamID = self->_coverCacheHashOrAdamID;
  self->_coverCacheHashOrAdamID = v45;

  v47 = [BKDebugBoolDefaultSwitch alloc];
  v48 = [(BKDebugBoolDefaultSwitch *)v47 initWithDefaultsKey:BCCardStackTransitionAnimatorSlowModeEnabledUserDefaultsKey];
  productPageSlowModeSwitch = self->_productPageSlowModeSwitch;
  self->_productPageSlowModeSwitch = v48;

  v50 = [BKDebugBoolDefaultSwitch alloc];
  v51 = [(BKDebugBoolDefaultSwitch *)v50 initWithDefaultsKey:BCCardStackTransitionForceSlideAnimationUserDefaultsKey];
  productPageSlideSwitch = self->_productPageSlideSwitch;
  self->_productPageSlideSwitch = v51;

  v53 = +[BRCConfigurationManager sharedInstance];
  v54 = +[BCRCDataContainer defaultContainer];
  v291 = [v54 configs];

  v55 = [BKDebugBoolDefaultSwitch alloc];
  v56 = [v291 valueForKeyPath:BRCBooksDefaultsKeyPersonalizationLocalSignalCollectionEnabled];
  id v57 = [v56 BOOLValue];
  v361[0] = _NSConcreteStackBlock;
  v361[1] = 3221225472;
  v361[2] = sub_100102BC8;
  v361[3] = &unk_100A44268;
  id v58 = v53;
  id v362 = v58;
  v59 = [(BKDebugBoolDefaultSwitch *)v55 initWithInitialValue:v57 synchronize:v361];
  localSignalCollectionEnabledSwitch = self->_localSignalCollectionEnabledSwitch;
  self->_localSignalCollectionEnabledSwitch = v59;

  v61 = [BKDebugBoolDefaultSwitch alloc];
  v62 = [v291 valueForKeyPath:BRCBooksDefaultsKeyPersonalizationLocalSignalSyncEnabled];
  id v63 = [v62 BOOLValue];
  v359[0] = _NSConcreteStackBlock;
  v359[1] = 3221225472;
  v359[2] = sub_100102C80;
  v359[3] = &unk_100A44268;
  id v197 = v58;
  id v360 = v197;
  v64 = [(BKDebugBoolDefaultSwitch *)v61 initWithInitialValue:v63 synchronize:v359];
  localSignalSyncEnabledSwitch = self->_localSignalSyncEnabledSwitch;
  self->_localSignalSyncEnabledSwitch = v64;

  v66 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BKDebugODPClusteringEnabled"];
  debugODPClusteringSwitch = self->_debugODPClusteringSwitch;
  self->_debugODPClusteringSwitch = &v66->super;

  v68 = (objc_class *)objc_alloc_init((Class)UISwitch);
  self = (BKDebugViewController *)((char *)self + 392);
  Class isa = self->super.super.super.super.isa;
  self->super.super.super.super.Class isa = v68;

  v70 = +[UICommand commandWithTitle:@"Toggle Fake Player" image:0 action:"books_internal_toggleFakePlayer:" propertyList:0];
  objc_opt_class();
  v71 = +[BKAppDelegate delegate];
  v72 = [v71 targetForAction:[v70 action] withSender:v70];
  v73 = BUDynamicCast();

  [v73 validateCommand:v70];
  -[objc_class setOn:](self->super.super.super.super.isa, "setOn:", [v70 state] == (id)1);
  Class v74 = self->super.super.super.super.isa;
  v356[0] = _NSConcreteStackBlock;
  v356[1] = 3221225472;
  v356[2] = sub_100102D38;
  v356[3] = &unk_100A47078;
  id v196 = v73;
  id v357 = v196;
  id v195 = v70;
  id v358 = v195;
  v75 = +[UIAction actionWithHandler:v356];
  [(objc_class *)v74 addAction:v75 forControlEvents:4096];

  v76 = [BKDebugBoolDefaultSwitch alloc];
  v77 = [(BKDebugBoolDefaultSwitch *)v76 initWithDefaultsKey:BAAppAnalyticsUseDebugProcessor];
  appAnalyticsDebugProcessorModeSwitch = val->_appAnalyticsDebugProcessorModeSwitch;
  val->_appAnalyticsDebugProcessorModeSwitch = &v77->super;

  objc_initWeak(&location, val);
  v79 = [BKDebugBoolDefaultSwitch alloc];
  v80 = [(BKDebugBoolDefaultSwitch *)v79 initWithDefaultsKey:BKDisableAccleratedWebRendering action:&stru_100A47098];
  webSetAcceleratedDrawingDisabledSwitch = val->_webSetAcceleratedDrawingDisabledSwitch;
  val->_webSetAcceleratedDrawingDisabledSwitch = &v80->super;

  v82 = [BKDebugBoolDefaultSwitch alloc];
  v83 = [(BKDebugBoolDefaultSwitch *)v82 initWithDefaultsKey:BKWebDrawBorders];
  webSetDrawBordersSwitch = val->_webSetDrawBordersSwitch;
  val->_webSetDrawBordersSwitch = &v83->super;

  v85 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BKBookOpenAnimatorRedViewFallbackEnabled"];
  uipBookViewFallback = val->_uipBookViewFallback;
  val->_uipBookViewFallback = &v85->super;

  v87 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BKBookOpenAnimatorSlowModeEnabled"];
  slowModeSwitch = val->_slowModeSwitch;
  val->_slowModeSwitch = &v87->super;

  v89 = [BKDebugBoolDefaultSwitch alloc];
  v90 = +[NSUserDefaults standardUserDefaults];
  v91 = -[BKDebugBoolDefaultSwitch initWithInitialValue:synchronize:action:](v89, "initWithInitialValue:synchronize:action:", [v90 BOOLForKey:@"BKLibraryBookshelfLayoutDebugEnabledUserDefaultsKey"], 0, &stru_100A470B8);
  layoutDebugSwitch = val->_layoutDebugSwitch;
  val->_layoutDebugSwitch = &v91->super;

  sessionStartOffsets = val->_sessionStartOffsets;
  val->_sessionStartOffsets = (NSArray *)&off_100A835A0;

  v94 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BooksUIEnableDebugModifiers"];
  booksUIDebugModifiersEnabledSwitch = val->_booksUIDebugModifiersEnabledSwitch;
  val->_booksUIDebugModifiersEnabledSwitch = &v94->super;

  v96 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BookAnalyticsOverlayImpressions"];
  bookAnalyticsOverlayImpressionsEnabledSwitch = val->_bookAnalyticsOverlayImpressionsEnabledSwitch;
  val->_bookAnalyticsOverlayImpressionsEnabledSwitch = &v96->super;

  v98 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:@"BooksUIShelfGridDebugUIEnabled"];
  booksUIShelfGridDebugUIEnabledSwitch = val->_booksUIShelfGridDebugUIEnabledSwitch;
  val->_booksUIShelfGridDebugUIEnabledSwitch = &v98->super;

  [(BKDebugViewController *)val _loadDefaults];
  v100 = +[JSABridge sharedInstance];
  v101 = [v100 environment];
  v204 = [v101 appVersion];

  v353[0] = _NSConcreteStackBlock;
  v353[1] = 3221225472;
  v353[2] = sub_100102E1C;
  v353[3] = &unk_100A470E0;
  objc_copyWeak(&v354, &location);
  v292 = +[BKDebugViewEntry entryWithTitle:@"REI: Edit Chrome" action:v353];
  v376[0] = v292;
  v285 = +[BKDebugViewCellModel modelWithAccessoryView:val->_enableChapterAnimationSwitch];
  v280 = +[BKDebugViewEntry entryWithTitle:@"REI: Use chapter scrubbing animation" model:v285];
  v376[1] = v280;
  v275 = +[BKDebugViewCellModel modelWithAccessoryView:val->_enablePageTurnDebugging];
  v271 = +[BKDebugViewEntry entryWithTitle:@"REI: Page Turn Debug Layers (Quits Immediately)" model:v275];
  v376[2] = v271;
  uint64_t v102 = +[BKDebugViewCellModel modelWithAccessoryView:val->_nightModeSwitch];
  +[BKDebugViewEntry entryWithTitle:@"Light Level: Override" model:v102];
  v200 = v198 = (void *)v102;
  v376[3] = v200;
  v351[0] = _NSConcreteStackBlock;
  v351[1] = 3221225472;
  v351[2] = sub_100102E5C;
  v351[3] = &unk_100A47108;
  objc_copyWeak(&v352, &location);
  v103 = +[BKDebugViewCellModel modelWithDetailLineBreakMode:4 detailTextBlock:v351];
  v349[0] = _NSConcreteStackBlock;
  v349[1] = 3221225472;
  v349[2] = sub_100102EE0;
  v349[3] = &unk_100A470E0;
  objc_copyWeak(&v350, &location);
  v267 = +[BKDebugViewEntry entryWithTitle:@"Light Level: Set" model:v103 action:v349];
  v376[4] = v267;
  v262 = +[NSString stringWithFormat:@"Light Level: Delay %d sec before update", 5];
  v257 = +[BKDebugViewCellModel modelWithAccessoryView:val->_nightModeDelaySwitch];
  v252 = +[BKDebugViewEntry entryWithTitle:v262 model:v257];
  v376[5] = v252;
  v248 = +[BKDebugViewCellModel modelWithAccessoryView:val->_oldFontStepsAndSpacingSwitch];
  v244 = +[BKDebugViewEntry entryWithTitle:@"Use Old Font Sizes & Spacing" model:v248];
  v376[6] = v244;
  v241 = +[BKDebugViewCellModel modelWithAccessoryView:val->_endOfBookDebugMenuSwitch];
  v238 = +[BKDebugViewEntry entryWithTitle:@"Allow End of Book Debug menu" model:v241];
  v376[7] = v238;
  v235 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiLayoutGuidesSwitch];
  v233 = +[BKDebugViewEntry entryWithTitle:@"Show REI Layout guides" model:v235];
  v376[8] = v233;
  v231 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiShowPaginatingWebViewSwitch];
  v229 = +[BKDebugViewEntry entryWithTitle:@"Show paginating web view" model:v231];
  v376[9] = v229;
  v227 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiLogContentSizeSwitch];
  v225 = +[BKDebugViewEntry entryWithTitle:@"Log webView.scrollView.contentSize results (Log has #sizeResult:)" model:v227];
  v376[10] = v225;
  v223 = +[BKDebugViewCellModel modelWithAccessoryView:val->_alwaysParseEpubSwitch];
  v221 = +[BKDebugViewEntry entryWithTitle:@"Always Paginate in REI Reader (Ignore pagination cache)" model:v223];
  v376[11] = v221;
  v219 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiIgnoreCacheSwitch];
  v217 = +[BKDebugViewEntry entryWithTitle:@"Always Parse EPUBs" model:v219];
  v376[12] = v217;
  v215 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiAllowScrollMacOSSwitch];
  v213 = +[BKDebugViewEntry entryWithTitle:@"Allow scroll mode on macOS" model:v215];
  v376[13] = v213;
  v211 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiDisableAutoFontDownloadSwitch];
  v209 = +[BKDebugViewEntry entryWithTitle:@"Disable Auto Font Download" model:v211];
  v376[14] = v209;
  v207 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiUseNewTextStylingSwitch];
  v205 = +[BKDebugViewEntry entryWithTitle:@"Use Old Text Styling (Must Reopen Book)" model:v207];
  v376[15] = v205;
  v104 = +[BKDebugViewCellModel modelWithAccessoryView:val->_reiContentSizeLogging];
  v105 = +[BKDebugViewEntry entryWithTitle:@"Enable Content Size logging" model:v104];
  v376[16] = v105;
  v106 = +[BKDebugViewCellModel modelWithAccessoryView:val->_curlAnimationSwitch];
  v107 = +[BKDebugViewEntry entryWithTitle:@"Use Legacy Page Curl animation" model:v106];
  v376[17] = v107;
  v108 = +[BKDebugViewCellModel modelWithAccessoryView:val->_webSetDrawBordersSwitch];
  v109 = +[BKDebugViewEntry entryWithTitle:@"WebKit Draw Borders" model:v108];
  v376[18] = v109;
  v110 = +[BKDebugViewCellModel modelWithAccessoryView:val->_webSetAcceleratedDrawingDisabledSwitch];
  v111 = +[BKDebugViewEntry entryWithTitle:@"Disable WebKit Accelerated Drawing (Quits Immediately)" model:v110];
  v376[19] = v111;
  v203 = +[NSArray arrayWithObjects:v376 count:20];

  v293 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v347[0] = _NSConcreteStackBlock;
  v347[1] = 3221225472;
  v347[2] = sub_100102F20;
  v347[3] = &unk_100A470E0;
  objc_copyWeak(&v348, &location);
  uint64_t v112 = +[BKDebugViewEntry entryWithTitle:@"Widgets Showroom" model:v293 action:v347];
  v375[0] = v112;
  v286 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v201 = (void *)v112;
  v345[0] = _NSConcreteStackBlock;
  v345[1] = 3221225472;
  v345[2] = sub_100102FA4;
  v345[3] = &unk_100A470E0;
  objc_copyWeak(&v346, &location);
  v199 = +[BKDebugViewEntry entryWithTitle:@"Figaro Metrics" model:v286 action:v345];
  v375[1] = v199;
  v343[0] = _NSConcreteStackBlock;
  v343[1] = 3221225472;
  v343[2] = sub_10010301C;
  v343[3] = &unk_100A47108;
  objc_copyWeak(&v344, &location);
  v281 = +[BKDebugViewCellModel modelWithDetailLineBreakMode:5 detailTextBlock:v343];
  v276 = +[BKDebugViewEntry entryWithTitle:@"JS App URL" model:v281];
  v375[2] = v276;
  v272 = +[BKDebugViewCellModel modelWithAccessoryView:val->_hotReloadModeSwitch];
  v268 = +[BKDebugViewEntry entryWithTitle:@"Hot Reload Mode (Requires Debug Build)" model:v272];
  v375[3] = v268;
  v263 = +[BKDebugViewCellModel modelWithAccessoryView:val->_launchWithBundleJSSwitch];
  v258 = +[BKDebugViewEntry entryWithTitle:@"Launch with bundle JS" model:v263];
  v375[4] = v258;
  v253 = +[BKDebugViewCellModel modelWithAccessoryView:val->_allowUnsignedJetpackSwitch];
  v249 = +[BKDebugViewEntry entryWithTitle:@"Allow Unsigned Jetpack" model:v253];
  v375[5] = v249;
  v245 = +[BKDebugViewCellModel modelWithAccessoryView:val->_loadBundledJetPackFromJSRootSwitch];
  v242 = +[BKDebugViewEntry entryWithTitle:@"Load Bundled JetPack from JSRoot" model:v245];
  v375[6] = v242;
  v239 = +[BKDebugViewCellModel modelWithAccessoryView:val->_productPageSlowModeSwitch];
  v236 = +[BKDebugViewEntry entryWithTitle:@"Product Page: Slow Mode" model:v239];
  v375[7] = v236;
  v234 = +[BKDebugViewCellModel modelWithAccessoryView:val->_productPageSlideSwitch];
  v232 = +[BKDebugViewEntry entryWithTitle:@"Product Page: Always Use Slide Animation" model:v234];
  v375[8] = v232;
  v113 = +[BKDebugViewCellModel modelWithAccessoryView:val->_productPageSampleFeedbackShownSwitch];
  v202 = +[BKDebugViewEntry entryWithTitle:@"Product Page: Sample Feedback Shown" model:v113];
  v375[9] = v202;
  v341[0] = _NSConcreteStackBlock;
  v341[1] = 3221225472;
  v341[2] = sub_100103068;
  v341[3] = &unk_100A470E0;
  objc_copyWeak(&v342, &location);
  v230 = +[BKDebugViewEntry entryWithTitle:@"Product Page: Remote Configuration" action:v341];
  v375[10] = v230;
  v228 = +[BKDebugViewCellModel modelWithAccessoryView:val->_localSignalCollectionEnabledSwitch];
  v226 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Local Signal Collection" model:v228];
  v375[11] = v226;
  v224 = +[BKDebugViewCellModel modelWithAccessoryView:val->_localSignalSyncEnabledSwitch];
  v222 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Local Signal Sync" model:v224];
  v375[12] = v222;
  v220 = +[BKDebugViewCellModel modelWithAccessoryView:val->_dontShowDisabledSwitch];
  v218 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Disable Don't Show" model:v220];
  v375[13] = v218;
  v216 = +[BKDebugViewCellModel modelWithAccessoryType:0];
  v214 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Trigger Sync from Cloud" model:v216 action:&stru_100A47148];
  v375[14] = v214;
  v212 = +[BKDebugViewCellModel modelWithAccessoryType:0];
  v114 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Trigger Sync to Cloud" model:v212 action:&stru_100A47168];
  v375[15] = v114;
  v210 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v339[0] = _NSConcreteStackBlock;
  v339[1] = 3221225472;
  v339[2] = sub_1001031F0;
  v339[3] = &unk_100A470E0;
  objc_copyWeak(&v340, &location);
  v208 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Stress Test Local Signals" model:v210 action:v339];
  v375[16] = v208;
  v115 = +[BKDebugViewCellModel modelWithAccessoryView:val->_debugODPClusteringSwitch];
  v116 = +[BKDebugViewEntry entryWithTitle:@"Personalization: Debug ODP Clustering" model:v115];
  v375[17] = v116;
  v117 = +[BKDebugViewCellModel modelWithAccessoryView:val->_booksUIDebugModifiersEnabledSwitch];
  v118 = +[BKDebugViewEntry entryWithTitle:@"BooksUI: Debug Modifiers Enabled" model:v117];
  v375[18] = v118;
  v119 = +[BKDebugViewCellModel modelWithAccessoryView:val->_booksUIShelfGridDebugUIEnabledSwitch];
  v120 = +[BKDebugViewEntry entryWithTitle:@"BooksUI: Debug ShelfGrid UI Enabled" model:v119];
  v375[19] = v120;
  v121 = +[BKDebugViewCellModel modelWithAccessoryView:val->_bookAnalyticsOverlayImpressionsEnabledSwitch];
  v122 = +[BKDebugViewEntry entryWithTitle:@"Book Analytics: Overlay Impressions Enabled" model:v121];
  v375[20] = v122;
  v206 = +[NSArray arrayWithObjects:v375 count:21];

  id v277 = objc_alloc((Class)NSMutableArray);
  v123 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v337[0] = _NSConcreteStackBlock;
  v337[1] = 3221225472;
  v337[2] = sub_100103268;
  v337[3] = &unk_100A470E0;
  objc_copyWeak(&v338, &location);
  v124 = +[BKDebugViewEntry entryWithTitle:@"Book Messages Local Data" model:v123 action:v337];
  v374[0] = v124;
  v294 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v287 = +[BKDebugViewEntry entryWithTitle:@"Reset Local Storage" model:v294 action:&stru_100A47188];
  v374[1] = v287;
  v282 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v125 = +[BKDebugViewEntry entryWithTitle:@"Kill Books" model:v282 action:&stru_100A471A8];
  v374[2] = v125;
  v126 = [BKDebugBoolDefaultSwitch alloc];
  v127 = +[BKMessagesDebugProvider enabled];
  v128 = [(BKDebugBoolDefaultSwitch *)v126 initWithDefaultsKey:v127];
  v129 = +[BKDebugViewCellModel modelWithAccessoryView:v128];
  v130 = +[BKDebugViewEntry entryWithTitle:@"Enable Debug Messages Provider" model:v129];
  v374[3] = v130;
  v131 = +[NSArray arrayWithObjects:v374 count:4];
  id v132 = [v277 initWithArray:v131];

  id v133 = objc_alloc((Class)NSMutableArray);
  v134 = +[BKDebugViewCellModel modelWithAccessoryType:1];
  v335[0] = _NSConcreteStackBlock;
  v335[1] = 3221225472;
  v335[2] = sub_10010339C;
  v335[3] = &unk_100A470E0;
  objc_copyWeak(&v336, &location);
  v135 = +[BKDebugViewEntry entryWithTitle:@"Analytics Settings" model:v134 action:v335];
  v373 = v135;
  v136 = +[NSArray arrayWithObjects:&v373 count:1];
  id v243 = [v133 initWithArray:v136];

  v137 = +[BKMessagesDebugProvider signIntoItunes];
  v371[0] = v137;
  v372[0] = @"Enable Sign into iTunes";
  v138 = +[BKMessagesDebugProvider signIntoItunesCatalyst];
  v371[1] = v138;
  v372[1] = @"Enable Sign into iTunes Catalyst";
  v295 = +[BKMessagesDebugProvider readSample];
  v371[2] = v295;
  v372[2] = @"Enable Read a free sample";
  v288 = +[BKMessagesDebugProvider listenPreview];
  v371[3] = v288;
  v372[3] = @"Enable Listen a free preview";
  v283 = +[BKMessagesDebugProvider addToWTR];
  v371[4] = v283;
  v372[4] = @"Enable Add to WTR";
  v278 = +[BKMessagesDebugProvider listenOnCarplay];
  v371[5] = v278;
  v372[5] = @"Enable Listen on Carplay";
  v273 = +[BKMessagesDebugProvider appleWatchMessage];
  v371[6] = v273;
  v372[6] = @"Enable Apple Watch Message";
  v269 = +[BKMessagesDebugProvider supplementalContent];
  v371[7] = v269;
  v372[7] = @"Enable Sup Content Tip";
  v264 = +[BKMessagesDebugProvider enableCoaching];
  v371[8] = v264;
  v372[8] = @"Enable Reading Coaching Onboarding";
  v259 = +[BKMessagesDebugProvider wtrGenericNotification];
  v371[9] = v259;
  v372[9] = @"Enable Generic Notification Below WTR";
  v254 = +[BKMessagesDebugProvider wtrPriceDropSettings];
  v371[10] = v254;
  v372[10] = @"Enable Price Drop (TCC-disabled) Notification Below WTR";
  v250 = +[BKMessagesDebugProvider wtrPriceDropNotify];
  v371[11] = v250;
  v372[11] = @"Enable Price Drop Notification Below WTR";
  v246 = +[BKMessagesDebugProvider sgIntro];
  v371[12] = v246;
  v372[12] = @"Enable SG Product page tip";
  v139 = +[BKMessagesDebugProvider sgReportAConcern];
  v371[13] = v139;
  v372[13] = @"Enable SG Report a Concern";
  v140 = +[BKMessagesDebugProvider readerThemeMessage];
  v371[14] = v140;
  v372[14] = @"Enable Reading Theme Tip";
  v141 = +[BKMessagesDebugProvider easyNavigationMessage];
  v371[15] = v141;
  v372[15] = @"Enable Easy Navigation Tip";
  v142 = +[BKMessagesDebugProvider lockingBookOrientationMessage];
  v371[16] = v142;
  v372[16] = @"Enable Locking Book Orientation Tip";
  v143 = +[BKMessagesDebugProvider bookmarkShortcutMessage];
  v371[17] = v143;
  v372[17] = @"Enable Bookmark Shortcut Tip";
  v144 = +[BKMessagesDebugProvider readingGoalMessage];
  v371[18] = v144;
  v372[18] = @"Enable Reading Goal Message";
  v145 = +[NSDictionary dictionaryWithObjects:v372 forKeys:v371 count:19];

  long long v334 = 0u;
  long long v333 = 0u;
  long long v332 = 0u;
  long long v331 = 0u;
  v146 = [v145 allKeys];
  id v147 = [v146 countByEnumeratingWithState:&v331 objects:v370 count:16];
  if (v147)
  {
    uint64_t v148 = *(void *)v332;
    do
    {
      for (i = 0; i != v147; i = (char *)i + 1)
      {
        if (*(void *)v332 != v148) {
          objc_enumerationMutation(v146);
        }
        uint64_t v150 = *(void *)(*((void *)&v331 + 1) + 8 * i);
        v151 = [v145 objectForKeyedSubscript:v150];
        v152 = [[BKDebugBoolDefaultSwitch alloc] initWithDefaultsKey:v150];
        v153 = +[BKDebugViewCellModel modelWithAccessoryView:v152];
        v154 = +[BKDebugViewEntry entryWithTitle:v151 model:v153];
        [v132 addObject:v154];
      }
      id v147 = [v146 countByEnumeratingWithState:&v331 objects:v370 count:16];
    }
    while (v147);
  }

  v155 = +[BKDebugViewCellModel modelWithAccessoryView:val->_uipBookViewFallback];
  v156 = +[BKDebugViewEntry entryWithTitle:@"UIP: Book View Cover Fallback" model:v155];
  v369[0] = v156;
  v157 = +[BKDebugViewCellModel modelWithAccessoryView:val->_slowModeSwitch];
  v158 = +[BKDebugViewEntry entryWithTitle:@"Slow Mode" model:v157];
  v369[1] = v158;
  v284 = +[NSArray arrayWithObjects:v369 count:2];

  v159 = +[BKDebugViewCellModel modelWithAccessoryView:val->_layoutDebugSwitch];
  v160 = +[BKDebugViewEntry entryWithTitle:@"Layout Debugging" model:v159];
  v368 = v160;
  v279 = +[NSArray arrayWithObjects:&v368 count:1];

  v161 = +[BKDebugViewEntry entryWithTitle:@"Clear ResourceLoader Cache" action:&stru_100A471C8];
  v367 = v161;
  v274 = +[NSArray arrayWithObjects:&v367 count:1];

  v329[0] = _NSConcreteStackBlock;
  v329[1] = 3221225472;
  v329[2] = sub_100103474;
  v329[3] = &unk_100A47108;
  objc_copyWeak(&v330, &location);
  v162 = +[BKDebugViewCellModel modelWithDetailLineBreakMode:0 detailTextBlock:v329];
  v327[0] = _NSConcreteStackBlock;
  v327[1] = 3221225472;
  v327[2] = sub_100103524;
  v327[3] = &unk_100A470E0;
  objc_copyWeak(&v328, &location);
  v163 = +[BKDebugViewEntry entryWithTitle:@"Reading session start offset" model:v162 action:v327];
  v366[0] = v163;
  v325[0] = _NSConcreteStackBlock;
  v325[1] = 3221225472;
  v325[2] = sub_100103564;
  v325[3] = &unk_100A470E0;
  objc_copyWeak(&v326, &location);
  v164 = +[BKDebugViewEntry entryWithTitle:@"Add a 2-min session to a date" action:v325];
  v366[1] = v164;
  v323[0] = _NSConcreteStackBlock;
  v323[1] = 3221225472;
  v323[2] = sub_1001035C8;
  v323[3] = &unk_100A470E0;
  objc_copyWeak(&v324, &location);
  v165 = +[BKDebugViewEntry entryWithTitle:@"Add a 30-min session to a date" action:v323];
  v366[2] = v165;
  v321[0] = _NSConcreteStackBlock;
  v321[1] = 3221225472;
  v321[2] = sub_10010362C;
  v321[3] = &unk_100A470E0;
  objc_copyWeak(&v322, &location);
  v166 = +[BKDebugViewEntry entryWithTitle:@"Add a 60-min session to a date" action:v321];
  v366[3] = v166;
  v319[0] = _NSConcreteStackBlock;
  v319[1] = 3221225472;
  v319[2] = sub_100103690;
  v319[3] = &unk_100A470E0;
  objc_copyWeak(&v320, &location);
  v167 = +[BKDebugViewEntry entryWithTitle:@"Add a 360-min session to a date" action:v319];
  v366[4] = v167;
  v317[0] = _NSConcreteStackBlock;
  v317[1] = 3221225472;
  v317[2] = sub_1001036F4;
  v317[3] = &unk_100A470E0;
  objc_copyWeak(&v318, &location);
  v168 = +[BKDebugViewEntry entryWithTitle:@"Clear today's reading time" action:v317];
  v366[5] = v168;
  v270 = +[NSArray arrayWithObjects:v366 count:6];

  v315[0] = _NSConcreteStackBlock;
  v315[1] = 3221225472;
  v315[2] = sub_100103734;
  v315[3] = &unk_100A470E0;
  objc_copyWeak(&v316, &location);
  v296 = +[BKDebugViewEntry entryWithTitle:@"Clear AppStore review cache" action:v315];
  v365[0] = v296;
  uint64_t v169 = +[BKDebugViewCellModel modelWithAccessoryView:val->_fakePlayerSwitch];
  +[BKDebugViewEntry entryWithTitle:@"Toggle Fake Player" model:v169];
  v265 = v255 = (void *)v169;
  v365[1] = v265;
  v313[0] = _NSConcreteStackBlock;
  v313[1] = 3221225472;
  v313[2] = sub_100103774;
  v313[3] = &unk_100A470E0;
  objc_copyWeak(&v314, &location);
  v260 = +[BKDebugViewEntry entryWithTitle:@"Move All Eligible Local Books to iCloud" action:v313];
  v365[2] = v260;
  v311[0] = _NSConcreteStackBlock;
  v311[1] = 3221225472;
  v311[2] = sub_1001037B4;
  v311[3] = &unk_100A470E0;
  objc_copyWeak(&v312, &location);
  v289 = +[BKDebugViewEntry entryWithTitle:@"Move All iCloud Books back to Local" action:v311];
  v365[3] = v289;
  v170 = +[BKDebugViewCellModel modelWithAccessoryView:val->_appAnalyticsDebugProcessorModeSwitch];
  v171 = +[BKDebugViewEntry entryWithTitle:@"AppAnalytics: Debug Processor" model:v170];
  v365[4] = v171;
  v309[0] = _NSConcreteStackBlock;
  v309[1] = 3221225472;
  v309[2] = sub_1001037F4;
  v309[3] = &unk_100A470E0;
  objc_copyWeak(&v310, &location);
  v172 = +[BKDebugViewEntry entryWithTitle:@"Delete app" action:v309];
  v365[5] = v172;
  v307[0] = _NSConcreteStackBlock;
  v307[1] = 3221225472;
  v307[2] = sub_100103834;
  v307[3] = &unk_100A47108;
  objc_copyWeak(&v308, &location);
  v173 = +[BKDebugViewCellModel modelWithDetailLineBreakMode:3 detailTextBlock:v307];
  v305[0] = _NSConcreteStackBlock;
  v305[1] = 3221225472;
  v305[2] = sub_100103894;
  v305[3] = &unk_100A470E0;
  objc_copyWeak(&v306, &location);
  v174 = +[BKDebugViewEntry entryWithTitle:@"CoverCache: Dump particular cover cache images to disk" model:v173 action:v305];
  v365[6] = v174;
  v303[0] = _NSConcreteStackBlock;
  v303[1] = 3221225472;
  v303[2] = sub_1001038D4;
  v303[3] = &unk_100A470E0;
  objc_copyWeak(&v304, &location);
  v175 = +[BKDebugViewEntry entryWithTitle:@"Sim: Family Content Deletion" action:v303];
  v365[7] = v175;
  v301[0] = _NSConcreteStackBlock;
  v301[1] = 3221225472;
  v301[2] = sub_100103948;
  v301[3] = &unk_100A470E0;
  objc_copyWeak(&v302, &location);
  v176 = +[BKDebugViewEntry entryWithTitle:@"Sim: Managed Books Changed" action:v301];
  v365[8] = v176;
  v299[0] = _NSConcreteStackBlock;
  v299[1] = 3221225472;
  v299[2] = sub_1001039AC;
  v299[3] = &unk_100A470E0;
  objc_copyWeak(&v300, &location);
  v177 = +[BKDebugViewEntry entryWithTitle:@"Sim: Triggering Local Notification in 1 second" action:v299];
  v365[9] = v177;
  v247 = +[NSArray arrayWithObjects:v365 count:10];

  v178 = [[DebugViewControllerPriceTracking alloc] initWithOwner:val];
  priceTracking = val->_priceTracking;
  val->_priceTracking = v178;

  v180 = [[DebugViewControllerRemoteConfig alloc] initWithOwner:val];
  remoteConfig = val->_remoteConfig;
  val->_remoteConfig = v180;

  v297 = +[NSMutableArray array];
  v290 = [(BKDebugViewController *)val remoteConfig];
  v266 = [v290 section];
  v364[0] = v266;
  v261 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Reading Experience" entries:v203 footerTitle:0];
  v364[1] = v261;
  v182 = [BKDebugViewSection alloc];
  v256 = +[NSString stringWithFormat:@"Store: JS %@", v204];
  v251 = [(BKDebugViewSection *)v182 initWithHeaderTitle:v256 entries:v206 footerTitle:@"Note: You must enable \"Enable Remote Config Monitoring\" in Internal Settings for configuration to work"];
  v364[2] = v251;
  v240 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Book Messages" entries:v132 footerTitle:&stru_100A70340];
  v364[3] = v240;
  v237 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Open Book Animation" entries:v284 footerTitle:0];
  v364[4] = v237;
  v183 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Bookshelf" entries:v279 footerTitle:0];
  v364[5] = v183;
  v184 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"TUIAnimation" entries:v274 footerTitle:0];
  v364[6] = v184;
  v185 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Reading Goals" entries:v270 footerTitle:0];
  v364[7] = v185;
  v186 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Miscellaneous" entries:v247 footerTitle:0];
  v364[8] = v186;
  v187 = [[BKDebugViewSection alloc] initWithHeaderTitle:@"Analytics" entries:v243 footerTitle:0];
  v364[9] = v187;
  v188 = [(BKDebugViewController *)val yearInReviewSection];
  v364[10] = v188;
  v189 = +[NSArray arrayWithObjects:v364 count:11];
  [v297 addObjectsFromArray:v189];

  v190 = [(BKDebugViewController *)val priceTracking];
  v191 = [v190 section];

  if (v191) {
    [v297 addObject:v191];
  }
  v192 = (NSArray *)[v297 copy];
  sections = val->_sections;
  val->_sections = v192;

  v194 = [(BKDebugViewController *)val tableView];
  [v194 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellIdentifier"];

  objc_destroyWeak(&v300);
  objc_destroyWeak(&v302);
  objc_destroyWeak(&v304);
  objc_destroyWeak(&v306);
  objc_destroyWeak(&v308);
  objc_destroyWeak(&v310);
  objc_destroyWeak(&v312);
  objc_destroyWeak(&v314);
  objc_destroyWeak(&v316);

  objc_destroyWeak(&v318);
  objc_destroyWeak(&v320);
  objc_destroyWeak(&v322);
  objc_destroyWeak(&v324);
  objc_destroyWeak(&v326);
  objc_destroyWeak(&v328);
  objc_destroyWeak(&v330);

  objc_destroyWeak(&v336);
  objc_destroyWeak(&v338);

  objc_destroyWeak(&v340);
  objc_destroyWeak(&v342);
  objc_destroyWeak(&v344);
  objc_destroyWeak(&v346);
  objc_destroyWeak(&v348);

  objc_destroyWeak(&v350);
  objc_destroyWeak(&v352);
  objc_destroyWeak(&v354);

  objc_destroyWeak(&location);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(BKDebugViewController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(BKDebugViewController *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];

  v7 = [v6 entries];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(BKDebugViewController *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];

  v7 = [v6 headerTitle];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = [(BKDebugViewController *)self sections];
  v6 = [v5 objectAtIndexedSubscript:a4];

  v7 = [v6 footerTitle];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v8 = a4;
  v9 = [a3 dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:v8];
  v10 = [(BKDebugViewController *)self sections];
  v11 = [v10 objectAtIndexedSubscript:[v8 section]];

  v12 = [v11 entries];
  id v13 = [v8 row];

  v14 = [v12 objectAtIndexedSubscript:v13];

  v15 = [v14 title];
  v16 = [v9 textLabel];
  [v16 setText:v15];

  v17 = [v14 model];
  v18 = [v17 detailTextBlock];
  if (v18)
  {
    id v4 = [v14 model];
    v5 = [v4 detailTextBlock];
    v19 = v5[2]();
  }
  else
  {
    v19 = 0;
  }
  v20 = [v9 detailTextLabel];
  [v20 setText:v19];

  if (v18)
  {
  }
  v21 = [v14 model];
  id v22 = [v21 detailLineBreakMode];
  v23 = [v9 detailTextLabel];
  [v23 setLineBreakMode:v22];

  v24 = [v14 model];
  [v9 setAccessoryType:[v24 accessoryType]];

  v25 = [v14 model];
  v26 = [v25 accessoryView];
  [v9 setAccessoryView:v26];

  v27 = [v14 model];
  v28 = [v27 userInteractionEnabledBlock];
  if (v28)
  {
    v29 = [v14 model];
    v30 = [v29 userInteractionEnabledBlock];
    [v9 setUserInteractionEnabled:v30[2]()];
  }
  else
  {
    [v9 setUserInteractionEnabled:1];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v6 = a3;
  v7 = [(BKDebugViewController *)self sections];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));

  v9 = [v8 entries];
  v10 = [v9 objectAtIndexedSubscript:[v13 row]];

  uint64_t v11 = [v10 action];
  v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v13);
  }

  [v6 deselectRowAtIndexPath:v13 animated:1];
}

- (void)_close:(id)a3
{
}

- (void)_presentTeaDebugViewController:(id)a3
{
  id v12 = [(id)objc_opt_class() resolver];
  id v4 = [v12 resolveClass:objc_opt_class() name:@"Debug"];
  v5 = objc_opt_new();
  id v6 = [(BKDebugViewController *)self view];
  v7 = [v6 window];
  id v8 = [v7 windowScene];
  v9 = +[BKAppDelegate delegate];
  v10 = [v9 containerHost];
  [v5 registerWindowScene:v8 containerHost:v10];

  uint64_t v11 = [(BKDebugViewController *)self navigationController];
  [v11 presentViewController:v4 animated:1 completion:0];
}

- (void)_presentLightLevelChangeAlert
{
  objc_super v3 = [(BKDebugViewController *)self tableView];
  id v4 = [v3 indexPathForSelectedRow];

  v5 = [(BKDebugViewController *)self sections];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  v19 = v6;
  v7 = [v6 entries];
  v21 = v4;
  id v8 = [v7 objectAtIndexedSubscript:[v4 row]];

  v9 = [v8 title];
  v10 = +[UIAlertController alertControllerWithTitle:v9 message:0 preferredStyle:1];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = self;
  obj = self->_lightLevelTitles;
  id v12 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1001051A4;
        v22[3] = &unk_100A46200;
        v22[4] = v11;
        id v23 = v21;
        v17 = +[UIAlertAction actionWithTitle:v16 style:0 handler:v22];
        [v10 addAction:v17];
      }
      id v13 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  v18 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v10 addAction:v18];

  [(BKDebugViewController *)v11 presentViewController:v10 animated:1 completion:0];
}

- (void)_emulateCurrentLightLevelChange:(int64_t)a3
{
  v5 = +[NSUserDefaults standardUserDefaults];
  unsigned int v6 = [v5 BOOLForKey:@"BCShouldOverrideNightModeDelay"];

  if (v6) {
    int64_t v7 = 5000000000;
  }
  else {
    int64_t v7 = 0;
  }
  dispatch_time_t v8 = dispatch_time(0, v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001053BC;
  v9[3] = &unk_100A45768;
  v9[4] = self;
  v9[5] = a3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_presentProductPageAlsoAvailableAsAlert
{
  id v7 = +[UIAlertController alertControllerWithTitle:0 message:@"Select product page treatment type" preferredStyle:1];
  objc_super v3 = +[UIAlertAction actionWithTitle:@"None" style:0 handler:&stru_100A472D0];
  [v7 addAction:v3];

  id v4 = +[UIAlertAction actionWithTitle:@"Type 1" style:0 handler:&stru_100A472F0];
  [v7 addAction:v4];

  v5 = +[UIAlertAction actionWithTitle:@"Type 2" style:0 handler:&stru_100A47310];
  [v7 addAction:v5];

  unsigned int v6 = +[UIAlertAction actionWithTitle:@"Cancel" style:2 handler:0];
  [v7 addAction:v6];

  [(BKDebugViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_presentCoverCacheDumpingAdamIDCoversAlert
{
  objc_super v3 = [(BKDebugViewController *)self tableView];
  id v4 = [v3 indexPathForSelectedRow];

  v5 = +[UIAlertController alertControllerWithTitle:@"Dump particular cover cache images in the next app launch" message:@"See BICCacheStates logging for dumped image file path.\n\n Just enter hash (sideload) or adamID (store) you want its covers dumped, and restart Books.app and use it like you normally do. Below text field will be reset when Books.app relaunched.\n\n" preferredStyle:1];
  [(BKDebugViewController *)self coverCacheHashOrAdamID];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100105900;
  v14[3] = &unk_100A47338;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v6;
  [v5 addTextFieldWithConfigurationHandler:v14];
  objc_initWeak(&location, v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100105964;
  v10[3] = &unk_100A47360;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  dispatch_time_t v8 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v10];
  [v5 addAction:v8];

  v9 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v9];

  [(BKDebugViewController *)self presentViewController:v5 animated:1 completion:0];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_moveEligibleLocalBooksToUbiquity
{
  objc_opt_class();
  v2 = +[UIApplication sharedApplication];
  objc_super v3 = [v2 delegate];
  BUDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 ubiquitousDocumentsController];
  [v4 makeAllEligibleLocalBooksUbiquitousWithCompletion:&stru_100A473A0];
}

- (void)_moveUbiquityBooksBackToLocal
{
  objc_opt_class();
  v2 = +[UIApplication sharedApplication];
  objc_super v3 = [v2 delegate];
  BUDynamicCast();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v5 ubiquitousDocumentsController];
  [v4 makeAllUbiquitousBooksLocalWithCompletion:&stru_100A473C0];
}

- (void)_handleAppRemoval
{
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.iBooks.appremoval"];
  id v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LSAppRemovalServiceProtocol];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  id v5 = +[UIAlertController alertControllerWithTitle:@"XPC App Removal Service" message:&stru_100A70340 preferredStyle:1];
  id v6 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
  [v5 addAction:v6];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100105E18;
  v20[3] = &unk_100A46868;
  id v8 = v5;
  id v21 = v8;
  id v22 = self;
  v9 = v7;
  id v23 = v9;
  v10 = [v3 remoteObjectProxyWithErrorHandler:v20];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100105F8C;
  uint64_t v16 = &unk_100A46868;
  id v17 = v8;
  v18 = self;
  v19 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 removeAppWithReply:&v13];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  [v3 invalidate:v13, v14, v15, v16];
}

- (NSString)coverCacheHashOrAdamID
{
  return self->_coverCacheHashOrAdamID;
}

- (void)setCoverCacheHashOrAdamID:(id)a3
{
}

- (DebugViewControllerPriceTracking)priceTracking
{
  return self->_priceTracking;
}

- (DebugViewControllerRemoteConfig)remoteConfig
{
  return self->_remoteConfig;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (unint64_t)currentREIMode
{
  return self->_currentREIMode;
}

- (void)setCurrentREIMode:(unint64_t)a3
{
  self->_currentREIMode = a3;
}

- (UISwitch)enableChapterAnimationSwitch
{
  return self->_enableChapterAnimationSwitch;
}

- (void)setEnableChapterAnimationSwitch:(id)a3
{
}

- (UISwitch)disableREI
{
  return self->_disableREI;
}

- (void)setDisableREI:(id)a3
{
}

- (UISwitch)enablePageTurnDebugging
{
  return self->_enablePageTurnDebugging;
}

- (void)setEnablePageTurnDebugging:(id)a3
{
}

- (NSDictionary)reiModes
{
  return self->_reiModes;
}

- (void)setReiModes:(id)a3
{
}

- (unint64_t)currentLightLevel
{
  return self->_currentLightLevel;
}

- (void)setCurrentLightLevel:(unint64_t)a3
{
  self->_currentLightLevel = a3;
}

- (NSArray)lightLevelTitles
{
  return self->_lightLevelTitles;
}

- (void)setLightLevelTitles:(id)a3
{
}

- (UISwitch)nightModeSwitch
{
  return self->_nightModeSwitch;
}

- (void)setNightModeSwitch:(id)a3
{
}

- (UISwitch)nightModeDelaySwitch
{
  return self->_nightModeDelaySwitch;
}

- (void)setNightModeDelaySwitch:(id)a3
{
}

- (UISwitch)endOfBookDebugMenuSwitch
{
  return self->_endOfBookDebugMenuSwitch;
}

- (void)setEndOfBookDebugMenuSwitch:(id)a3
{
}

- (UISwitch)oldFontStepsAndSpacingSwitch
{
  return self->_oldFontStepsAndSpacingSwitch;
}

- (void)setOldFontStepsAndSpacingSwitch:(id)a3
{
}

- (UISwitch)reiLayoutGuidesSwitch
{
  return self->_reiLayoutGuidesSwitch;
}

- (void)setReiLayoutGuidesSwitch:(id)a3
{
}

- (UISwitch)reiShowPaginatingWebViewSwitch
{
  return self->_reiShowPaginatingWebViewSwitch;
}

- (void)setReiShowPaginatingWebViewSwitch:(id)a3
{
}

- (UISwitch)reiIgnoreCacheSwitch
{
  return self->_reiIgnoreCacheSwitch;
}

- (void)setReiIgnoreCacheSwitch:(id)a3
{
}

- (UISwitch)alwaysParseEpubSwitch
{
  return self->_alwaysParseEpubSwitch;
}

- (void)setAlwaysParseEpubSwitch:(id)a3
{
}

- (UISwitch)reiLogContentSizeSwitch
{
  return self->_reiLogContentSizeSwitch;
}

- (void)setReiLogContentSizeSwitch:(id)a3
{
}

- (UISwitch)reiAllowScrollMacOSSwitch
{
  return self->_reiAllowScrollMacOSSwitch;
}

- (void)setReiAllowScrollMacOSSwitch:(id)a3
{
}

- (UISwitch)reiDisableAutoFontDownloadSwitch
{
  return self->_reiDisableAutoFontDownloadSwitch;
}

- (void)setReiDisableAutoFontDownloadSwitch:(id)a3
{
}

- (UISwitch)reiEnableCellularFontDownloadSwitch
{
  return self->_reiEnableCellularFontDownloadSwitch;
}

- (void)setReiEnableCellularFontDownloadSwitch:(id)a3
{
}

- (UISwitch)reiUseNewTextStylingSwitch
{
  return self->_reiUseNewTextStylingSwitch;
}

- (void)setReiUseNewTextStylingSwitch:(id)a3
{
}

- (UISwitch)reiContentSizeLogging
{
  return self->_reiContentSizeLogging;
}

- (void)setReiContentSizeLogging:(id)a3
{
}

- (UISwitch)curlAnimationSwitch
{
  return self->_curlAnimationSwitch;
}

- (void)setCurlAnimationSwitch:(id)a3
{
}

- (UISwitch)webSetDrawBordersSwitch
{
  return self->_webSetDrawBordersSwitch;
}

- (void)setWebSetDrawBordersSwitch:(id)a3
{
}

- (UISwitch)webSetAcceleratedDrawingDisabledSwitch
{
  return self->_webSetAcceleratedDrawingDisabledSwitch;
}

- (void)setWebSetAcceleratedDrawingDisabledSwitch:(id)a3
{
}

- (NSString)bootUrl
{
  return self->_bootUrl;
}

- (void)setBootUrl:(id)a3
{
}

- (UISwitch)hotReloadModeSwitch
{
  return self->_hotReloadModeSwitch;
}

- (void)setHotReloadModeSwitch:(id)a3
{
}

- (UISwitch)launchWithBundleJSSwitch
{
  return self->_launchWithBundleJSSwitch;
}

- (void)setLaunchWithBundleJSSwitch:(id)a3
{
}

- (UISwitch)productPageSlowModeSwitch
{
  return self->_productPageSlowModeSwitch;
}

- (void)setProductPageSlowModeSwitch:(id)a3
{
}

- (UISwitch)productPageSlideSwitch
{
  return self->_productPageSlideSwitch;
}

- (void)setProductPageSlideSwitch:(id)a3
{
}

- (UISwitch)productPageSampleFeedbackShownSwitch
{
  return self->_productPageSampleFeedbackShownSwitch;
}

- (void)setProductPageSampleFeedbackShownSwitch:(id)a3
{
}

- (UISwitch)localSignalCollectionEnabledSwitch
{
  return self->_localSignalCollectionEnabledSwitch;
}

- (void)setLocalSignalCollectionEnabledSwitch:(id)a3
{
}

- (UISwitch)localSignalSyncEnabledSwitch
{
  return self->_localSignalSyncEnabledSwitch;
}

- (void)setLocalSignalSyncEnabledSwitch:(id)a3
{
}

- (UISwitch)debugODPClusteringSwitch
{
  return self->_debugODPClusteringSwitch;
}

- (void)setDebugODPClusteringSwitch:(id)a3
{
}

- (UISwitch)booksUIDebugModifiersEnabledSwitch
{
  return self->_booksUIDebugModifiersEnabledSwitch;
}

- (void)setBooksUIDebugModifiersEnabledSwitch:(id)a3
{
}

- (UISwitch)bookAnalyticsOverlayImpressionsEnabledSwitch
{
  return self->_bookAnalyticsOverlayImpressionsEnabledSwitch;
}

- (void)setBookAnalyticsOverlayImpressionsEnabledSwitch:(id)a3
{
}

- (UISwitch)allowUnsignedJetpackSwitch
{
  return self->_allowUnsignedJetpackSwitch;
}

- (void)setAllowUnsignedJetpackSwitch:(id)a3
{
}

- (UISwitch)loadBundledJetPackFromJSRootSwitch
{
  return self->_loadBundledJetPackFromJSRootSwitch;
}

- (void)setLoadBundledJetPackFromJSRootSwitch:(id)a3
{
}

- (UISwitch)booksUIShelfGridDebugUIEnabledSwitch
{
  return self->_booksUIShelfGridDebugUIEnabledSwitch;
}

- (void)setBooksUIShelfGridDebugUIEnabledSwitch:(id)a3
{
}

- (UISwitch)uipBookViewFallback
{
  return self->_uipBookViewFallback;
}

- (void)setUipBookViewFallback:(id)a3
{
}

- (UISwitch)slowModeSwitch
{
  return self->_slowModeSwitch;
}

- (void)setSlowModeSwitch:(id)a3
{
}

- (UISwitch)layoutDebugSwitch
{
  return self->_layoutDebugSwitch;
}

- (void)setLayoutDebugSwitch:(id)a3
{
}

- (NSArray)sessionStartOffsets
{
  return self->_sessionStartOffsets;
}

- (void)setSessionStartOffsets:(id)a3
{
}

- (int64_t)readingSessionCurrentStartOffset
{
  return self->_readingSessionCurrentStartOffset;
}

- (void)setReadingSessionCurrentStartOffset:(int64_t)a3
{
  self->_readingSessionCurrentStartOffset = a3;
}

- (NSArray)miscSectionEntries
{
  return self->_miscSectionEntries;
}

- (void)setMiscSectionEntries:(id)a3
{
}

- (UISwitch)fakePlayerSwitch
{
  return self->_fakePlayerSwitch;
}

- (void)setFakePlayerSwitch:(id)a3
{
}

- (UISwitch)appAnalyticsDebugProcessorModeSwitch
{
  return self->_appAnalyticsDebugProcessorModeSwitch;
}

- (void)setAppAnalyticsDebugProcessorModeSwitch:(id)a3
{
}

- (UISwitch)dontShowDisabledSwitch
{
  return self->_dontShowDisabledSwitch;
}

- (void)setDontShowDisabledSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dontShowDisabledSwitch, 0);
  objc_storeStrong((id *)&self->_appAnalyticsDebugProcessorModeSwitch, 0);
  objc_storeStrong((id *)&self->_fakePlayerSwitch, 0);
  objc_storeStrong((id *)&self->_miscSectionEntries, 0);
  objc_storeStrong((id *)&self->_sessionStartOffsets, 0);
  objc_storeStrong((id *)&self->_layoutDebugSwitch, 0);
  objc_storeStrong((id *)&self->_slowModeSwitch, 0);
  objc_storeStrong((id *)&self->_uipBookViewFallback, 0);
  objc_storeStrong((id *)&self->_booksUIShelfGridDebugUIEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_loadBundledJetPackFromJSRootSwitch, 0);
  objc_storeStrong((id *)&self->_allowUnsignedJetpackSwitch, 0);
  objc_storeStrong((id *)&self->_bookAnalyticsOverlayImpressionsEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_booksUIDebugModifiersEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_debugODPClusteringSwitch, 0);
  objc_storeStrong((id *)&self->_localSignalSyncEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_localSignalCollectionEnabledSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSampleFeedbackShownSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSlideSwitch, 0);
  objc_storeStrong((id *)&self->_productPageSlowModeSwitch, 0);
  objc_storeStrong((id *)&self->_launchWithBundleJSSwitch, 0);
  objc_storeStrong((id *)&self->_hotReloadModeSwitch, 0);
  objc_storeStrong((id *)&self->_bootUrl, 0);
  objc_storeStrong((id *)&self->_webSetAcceleratedDrawingDisabledSwitch, 0);
  objc_storeStrong((id *)&self->_webSetDrawBordersSwitch, 0);
  objc_storeStrong((id *)&self->_curlAnimationSwitch, 0);
  objc_storeStrong((id *)&self->_reiContentSizeLogging, 0);
  objc_storeStrong((id *)&self->_reiUseNewTextStylingSwitch, 0);
  objc_storeStrong((id *)&self->_reiEnableCellularFontDownloadSwitch, 0);
  objc_storeStrong((id *)&self->_reiDisableAutoFontDownloadSwitch, 0);
  objc_storeStrong((id *)&self->_reiAllowScrollMacOSSwitch, 0);
  objc_storeStrong((id *)&self->_reiLogContentSizeSwitch, 0);
  objc_storeStrong((id *)&self->_alwaysParseEpubSwitch, 0);
  objc_storeStrong((id *)&self->_reiIgnoreCacheSwitch, 0);
  objc_storeStrong((id *)&self->_reiShowPaginatingWebViewSwitch, 0);
  objc_storeStrong((id *)&self->_reiLayoutGuidesSwitch, 0);
  objc_storeStrong((id *)&self->_oldFontStepsAndSpacingSwitch, 0);
  objc_storeStrong((id *)&self->_endOfBookDebugMenuSwitch, 0);
  objc_storeStrong((id *)&self->_nightModeDelaySwitch, 0);
  objc_storeStrong((id *)&self->_nightModeSwitch, 0);
  objc_storeStrong((id *)&self->_lightLevelTitles, 0);
  objc_storeStrong((id *)&self->_reiModes, 0);
  objc_storeStrong((id *)&self->_enablePageTurnDebugging, 0);
  objc_storeStrong((id *)&self->_disableREI, 0);
  objc_storeStrong((id *)&self->_enableChapterAnimationSwitch, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_remoteConfig, 0);
  objc_storeStrong((id *)&self->_priceTracking, 0);

  objc_storeStrong((id *)&self->_coverCacheHashOrAdamID, 0);
}

- (void)_loadDefaults
{
  v2 = self;
  sub_1006ABEEC();
}

- (void)_presentSessionStartOffsetChangeAlert
{
  v2 = self;
  sub_1006AC710();
}

- (void)_presentREIChromeEditingMenu
{
  v2 = self;
  sub_10064F45C((uint64_t)&v5);
  id v3 = objc_allocWithZone((Class)sub_100058D18(&qword_100B42BC8));
  id v4 = (void *)sub_1007F8950();
  [(BKDebugViewController *)v2 presentViewController:v4 animated:1 completion:0];
}

- (void)_presentAddReadingSessionPickerFromIndexPath:(id)a3 duration:(double)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  v10 = self;
  sub_1006AD20C(a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)_presentWantToReadSamplesBehaviorAlert
{
  v2 = self;
  sub_1006AD990();
}

- (BKDebugViewSection)yearInReviewSection
{
  v2 = self;
  sub_1006AE76C();
  id v3 = objc_allocWithZone((Class)BKDebugViewSection);
  NSString v4 = sub_1007FDC30();
  sub_10004A860(0, (unint64_t *)&qword_100B2A180);
  Class isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithHeaderTitle:v4 entries:isa footerTitle:0];

  return (BKDebugViewSection *)v6;
}

- (uint64_t)_clearTodaysReadingTime
{
  uint64_t v0 = sub_1007F4650();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100058D18(&qword_100B42BB0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1007F25F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F4640();
  sub_1006AED24(&qword_100B42BB8, (void (*)(uint64_t))&type metadata accessor for ReadingHistory.Notification.ClearToday);
  memset(v14, 0, sizeof(v14));
  sub_1007F50B0();
  sub_10005AFE8((uint64_t)v14, (uint64_t *)&unk_100B269C0);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_10005AFE8((uint64_t)v6, &qword_100B42BB0);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  id v12 = [self defaultCenter];
  Class isa = sub_1007F25B0().super.isa;
  [v12 postNotification:isa];

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end