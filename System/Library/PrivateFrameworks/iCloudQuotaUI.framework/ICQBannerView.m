@interface ICQBannerView
+ (BOOL)shouldShowForDismissibleOffer:(id)a3;
+ (BOOL)shouldShowForOffer:(id)a3;
- (BOOL)_launchFlowManagerWithLink:(id)a3;
- (BOOL)isDismissible;
- (BOOL)isLegacy;
- (BOOL)performActionWith:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ICQBannerView)initWithDismissibleOffer:(id)a3;
- (ICQBannerView)initWithFrame:(CGRect)a3;
- (ICQBannerView)initWithOffer:(id)a3;
- (ICQBannerViewDelegate)delegate;
- (ICQLegacyBannerView)legacyBanner;
- (ICQOffer)offer;
- (ICQPurchase)purchase;
- (ICQUpgradeFlowManager)localFlowManager;
- (ICQUpgradeFlowOptions)flowOptions;
- (NSDirectionalEdgeInsets)textMargins;
- (UIColor)detailMessageColor;
- (UIColor)linkMessageColor;
- (UIColor)linkTextColor;
- (UIColor)textColor;
- (UIColor)titleColor;
- (UIFont)detailMessageFont;
- (UIFont)font;
- (UIFont)linkMessageFont;
- (UIFont)linkTextFont;
- (UIFont)titleFont;
- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)bubbleBanner;
- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)dismissibleBubbleBanner;
- (double)textLineSpacing;
- (id)_initWithFrame:(CGRect)a3 offer:(id)a4 dismissibility:(BOOL)a5;
- (int64_t)textAlignment;
- (void)_handlePushReceivedDarwinNotification;
- (void)_registerForDarwinNotifications;
- (void)handleBannerDismiss:(id)a3;
- (void)setBubbleBanner:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailMessageColor:(id)a3;
- (void)setDetailMessageFont:(id)a3;
- (void)setDismissibleBubbleBanner:(id)a3;
- (void)setFlowOptions:(id)a3;
- (void)setFont:(id)a3;
- (void)setIsDismissible:(BOOL)a3;
- (void)setIsLegacy:(BOOL)a3;
- (void)setLegacyBanner:(id)a3;
- (void)setLinkMessageColor:(id)a3;
- (void)setLinkMessageFont:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setLinkTextFont:(id)a3;
- (void)setLocalFlowManager:(id)a3;
- (void)setOffer:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLineSpacing:(double)a3;
- (void)setTextMargins:(NSDirectionalEdgeInsets)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)updateBannerView;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation ICQBannerView

+ (BOOL)shouldShowForDismissibleOffer:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 level];
  v5 = [v3 recommendationSpecification];

  v6 = [MEMORY[0x263EFF910] now];
  v7 = [v3 recommendationSpecification];
  v8 = [v7 reason];

  v9 = [MEMORY[0x263F88928] sharedOfferManager];
  v10 = [v3 bundleIdentifier];
  uint64_t v11 = [v9 didDismissRecommendationForBundleId:v10];

  v12 = [v3 recommendationSpecification];

  v13 = [v12 supressUntil];
  [v13 doubleValue];
  double v15 = v14;

  int v16 = [MEMORY[0x263F88978] shouldDisplay:v6 forReason:v8 dismissedInSession:v11 supressUntil:v15];
  v17 = _ICQBannerLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67110658;
    v21[1] = v16;
    __int16 v22 = 1024;
    BOOL v23 = v4 != 0;
    __int16 v24 = 1024;
    BOOL v25 = v5 != 0;
    __int16 v26 = 2112;
    v27 = v8;
    __int16 v28 = 1024;
    int v29 = v11;
    __int16 v30 = 2112;
    v31 = v6;
    __int16 v32 = 2048;
    double v33 = v15;
    _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "shouldShowBanner: %d considering needsBanner: %d hasBanner: %d specReason: %@ didDismissInSession: %d currentDate: %@ supressInterval: %f", (uint8_t *)v21, 0x38u);
  }

  if (v4) {
    BOOL v18 = v5 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v16;
  }

  return v19;
}

+ (BOOL)shouldShowForOffer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 level];
  v5 = [v3 bannerSpecification];

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

- (ICQBannerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [MEMORY[0x263F88928] sharedOfferManager];
  v9 = [v8 currentOffer];

  v10 = -[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", v9, 0, x, y, width, height);
  return v10;
}

- (ICQBannerView)initWithOffer:(id)a3
{
  return (ICQBannerView *)-[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", a3, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (ICQBannerView)initWithDismissibleOffer:(id)a3
{
  return (ICQBannerView *)-[ICQBannerView _initWithFrame:offer:dismissibility:](self, "_initWithFrame:offer:dismissibility:", a3, 1, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (id)_initWithFrame:(CGRect)a3 offer:(id)a4 dismissibility:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v80[1] = *MEMORY[0x263EF8340];
  id v12 = a4;
  v77.receiver = self;
  v77.super_class = (Class)ICQBannerView;
  v13 = -[ICQBannerView initWithFrame:](&v77, sel_initWithFrame_, x, y, width, height);
  double v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_offer, a4);
    v14->_isDismissible = a5;
    [(ICQBannerView *)v14 _registerForDarwinNotifications];
    if (!v14->_isDismissible) {
      goto LABEL_6;
    }
    double v15 = [v12 recommendationSpecification];

    if (v15)
    {
      v14->_isLegacdouble y = 0;
      int v16 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

      v17 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      [(ICQBannerView *)v14 addSubview:v17];

      BOOL v18 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      BOOL v19 = [v18 topAnchor];
      v20 = [(ICQBannerView *)v14 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      __int16 v22 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      BOOL v23 = [v22 bottomAnchor];
      __int16 v24 = [(ICQBannerView *)v14 bottomAnchor];
      BOOL v25 = [v23 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      __int16 v26 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      v27 = [v26 leadingAnchor];
      __int16 v28 = [(ICQBannerView *)v14 leadingAnchor];
      int v29 = [v27 constraintEqualToAnchor:v28];
      [v29 setActive:1];

      __int16 v30 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      v31 = [v30 trailingAnchor];
      __int16 v32 = [(ICQBannerView *)v14 trailingAnchor];
      double v33 = [v31 constraintEqualToAnchor:v32];
      [v33 setActive:1];

      uint64_t v34 = [(ICQBannerView *)v14 dismissibleBubbleBanner];
      v80[0] = v34;
      v35 = (void **)v80;
LABEL_9:
      v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
      [(ICQBannerView *)v14 setAccessibilityElements:v75];

      [(ICQBannerView *)v14 setIsAccessibilityElement:0];
      [(ICQBannerView *)v14 sizeToFit];
      goto LABEL_10;
    }
    if (!v14->_isDismissible)
    {
LABEL_6:
      v36 = [v12 bannerSpecification];
      v37 = [v36 bannerSource];
      v38 = (void *)*MEMORY[0x263F88828];

      if (v37 == v38)
      {
        v14->_isLegacdouble y = 0;
        v57 = [(ICQBannerView *)v14 bubbleBanner];
        [v57 setTranslatesAutoresizingMaskIntoConstraints:0];

        v58 = [(ICQBannerView *)v14 bubbleBanner];
        [(ICQBannerView *)v14 addSubview:v58];

        v59 = [(ICQBannerView *)v14 bubbleBanner];
        v60 = [v59 topAnchor];
        v61 = [(ICQBannerView *)v14 topAnchor];
        v62 = [v60 constraintEqualToAnchor:v61];
        [v62 setActive:1];

        v63 = [(ICQBannerView *)v14 bubbleBanner];
        v64 = [v63 bottomAnchor];
        v65 = [(ICQBannerView *)v14 bottomAnchor];
        v66 = [v64 constraintEqualToAnchor:v65];
        [v66 setActive:1];

        v67 = [(ICQBannerView *)v14 bubbleBanner];
        v68 = [v67 leadingAnchor];
        v69 = [(ICQBannerView *)v14 leadingAnchor];
        v70 = [v68 constraintEqualToAnchor:v69];
        [v70 setActive:1];

        v71 = [(ICQBannerView *)v14 bubbleBanner];
        v72 = [v71 trailingAnchor];
        v73 = [(ICQBannerView *)v14 trailingAnchor];
        v74 = [v72 constraintEqualToAnchor:v73];
        [v74 setActive:1];

        uint64_t v34 = [(ICQBannerView *)v14 bubbleBanner];
        v79 = v34;
        v35 = &v79;
        goto LABEL_9;
      }
    }
    v14->_isLegacdouble y = 1;
    v39 = [(ICQBannerView *)v14 legacyBanner];
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

    v40 = [(ICQBannerView *)v14 legacyBanner];
    [(ICQBannerView *)v14 addSubview:v40];

    v41 = [(ICQBannerView *)v14 legacyBanner];
    v42 = [v41 topAnchor];
    v43 = [(ICQBannerView *)v14 topAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    v45 = [(ICQBannerView *)v14 legacyBanner];
    v46 = [v45 bottomAnchor];
    v47 = [(ICQBannerView *)v14 bottomAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = [(ICQBannerView *)v14 legacyBanner];
    v50 = [v49 leadingAnchor];
    v51 = [(ICQBannerView *)v14 leadingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v52 setActive:1];

    v53 = [(ICQBannerView *)v14 legacyBanner];
    v54 = [v53 trailingAnchor];
    v55 = [(ICQBannerView *)v14 trailingAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    [v56 setActive:1];

    uint64_t v34 = [(ICQBannerView *)v14 legacyBanner];
    v78 = v34;
    v35 = &v78;
    goto LABEL_9;
  }
LABEL_10:

  return v14;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(ICQBannerView *)self isLegacy])
  {
    v8 = [(ICQBannerView *)self legacyBanner];
    objc_msgSend(v8, "sizeThatFits:", width, height);
    double v10 = v9;
    double v12 = v11;

    double v13 = v10;
    double v14 = v12;
  }
  else
  {
    LODWORD(v6) = 1148846080;
    LODWORD(v7) = 1112014848;
    -[ICQBannerView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v6, v7);
    double v13 = width;
  }
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (ICQLegacyBannerView)legacyBanner
{
  legacyBanner = self->_legacyBanner;
  if (!legacyBanner)
  {
    uint64_t v4 = [ICQLegacyBannerView alloc];
    v5 = [(ICQBannerView *)self offer];
    double v6 = [(ICQLegacyBannerView *)v4 initWithOffer:v5];
    double v7 = self->_legacyBanner;
    self->_legacyBanner = v6;

    [(ICQLegacyBannerView *)self->_legacyBanner setDelegate:self];
    legacyBanner = self->_legacyBanner;
  }
  return legacyBanner;
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)bubbleBanner
{
  bubbleBanner = self->_bubbleBanner;
  if (!bubbleBanner)
  {
    uint64_t v4 = [_TtC13iCloudQuotaUI19ICQBubbleBannerView alloc];
    v5 = [(ICQBannerView *)self offer];
    double v6 = [(ICQBannerView *)self offer];
    double v7 = [v6 bannerSpecification];
    v8 = [(ICQBubbleBannerView *)v4 initWithOffer:v5 bannerSpecification:v7];
    double v9 = self->_bubbleBanner;
    self->_bubbleBanner = v8;

    [(ICQBubbleBannerView *)self->_bubbleBanner setDelegate:self];
    [(ICQBubbleBannerView *)self->_bubbleBanner setTranslatesAutoresizingMaskIntoConstraints:0];
    bubbleBanner = self->_bubbleBanner;
  }
  return bubbleBanner;
}

- (_TtC13iCloudQuotaUI19ICQBubbleBannerView)dismissibleBubbleBanner
{
  dismissibleBubbleBanner = self->_dismissibleBubbleBanner;
  if (!dismissibleBubbleBanner)
  {
    uint64_t v4 = [_TtC13iCloudQuotaUI19ICQBubbleBannerView alloc];
    v5 = [(ICQBannerView *)self offer];
    double v6 = [(ICQBannerView *)self offer];
    double v7 = [v6 recommendationSpecification];
    v8 = [(ICQBubbleBannerView *)v4 initWithOffer:v5 bannerSpecification:v7];
    double v9 = self->_dismissibleBubbleBanner;
    self->_dismissibleBubbleBanner = v8;

    [(ICQBubbleBannerView *)self->_dismissibleBubbleBanner setDelegate:self];
    [(ICQBubbleBannerView *)self->_dismissibleBubbleBanner setTranslatesAutoresizingMaskIntoConstraints:0];
    dismissibleBubbleBanner = self->_dismissibleBubbleBanner;
  }
  return dismissibleBubbleBanner;
}

- (BOOL)performActionWith:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 action];
  switch(v5)
  {
    case 'd':
    case 'h':
    case 'm':
    case '{':
    case '|':
      goto LABEL_10;
    case 'e':
    case 'g':
    case 'o':
    case 'q':
    case 'r':
    case 'w':
    case 'z':
    case '~':
      goto LABEL_5;
    case 'f':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'n':
    case 'p':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'x':
    case 'y':
    case '\x7F':
      goto LABEL_2;
    case '}':
      [(ICQBannerView *)self handleBannerDismiss:v4];
      goto LABEL_8;
    default:
      if (v5 > 6) {
        goto LABEL_8;
      }
      if (((1 << v5) & 0x37) != 0)
      {
LABEL_5:
        double v7 = _ICQGetLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          [v4 action];
          v8 = _ICQStringForAction();
          int v13 = 138543362;
          double v14 = v8;
          _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "ICQ Banner: unimplemented action %{public}@", (uint8_t *)&v13, 0xCu);
        }
LABEL_8:
        BOOL v9 = 0;
      }
      else
      {
        if (v5 == 3)
        {
LABEL_2:
          char v6 = [(ICQBannerView *)self _launchFlowManagerWithLink:v4];
        }
        else
        {
LABEL_10:
          double v10 = _ICQGetLogSystem();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            [v4 action];
            double v11 = _ICQStringForAction();
            int v13 = 138543362;
            double v14 = v11;
            _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", (uint8_t *)&v13, 0xCu);
          }
          char v6 = [v4 performAction];
        }
        BOOL v9 = v6;
      }

      return v9;
  }
}

- (BOOL)_launchFlowManagerWithLink:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(ICQBannerView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v4 action];
      double v14 = _ICQStringForAction();
      int v24 = 138543362;
      BOOL v25 = v14;
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "ICQ Banner: not performing action %{public}@ since ICQBannerViewDelegate did not provide presentingViewController", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_12;
  }
  double v7 = [(ICQBannerView *)self delegate];
  v8 = [v7 presentingViewControllerForBannerView:self];

  if (!v8)
  {
    double v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v4 action];
      double v12 = _ICQStringForAction();
      int v24 = 138543362;
      BOOL v25 = v12;
      int v13 = "ICQ Banner: not performing action %{public}@ since ICQBannerViewDelegate did not provide presentingViewController";
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  localFlowManager = self->_localFlowManager;
  double v10 = _ICQGetLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager)
  {
    if (v11)
    {
      [v4 action];
      double v12 = _ICQStringForAction();
      int v24 = 138543362;
      BOOL v25 = v12;
      int v13 = "ICQ Banner: existing _localFlowManager not completed or cancelled yet, skipping action %{public}@";
LABEL_10:
      _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0xCu);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    [v4 action];
    v17 = _ICQStringForAction();
    int v24 = 138543362;
    BOOL v25 = v17;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", (uint8_t *)&v24, 0xCu);
  }
  BOOL v18 = [(ICQBannerView *)self offer];
  objc_msgSend(v18, "updateOfferWithAction:", objc_msgSend(v4, "action"));

  BOOL v19 = [ICQUpgradeFlowManager alloc];
  v20 = [(ICQBannerView *)self offer];
  v21 = [(ICQUpgradeFlowManager *)v19 initWithOffer:v20];
  __int16 v22 = self->_localFlowManager;
  self->_localFlowManager = v21;

  [(ICQUpgradeFlowManager *)self->_localFlowManager setIcqLink:v4];
  [(ICQUpgradeFlowManager *)self->_localFlowManager setDelegate:self];
  BOOL v23 = [(ICQBannerView *)self flowOptions];
  [(ICQUpgradeFlowManager *)self->_localFlowManager setFlowOptions:v23];

  [(ICQUpgradeFlowManager *)self->_localFlowManager beginFlowWithPresentingViewController:v8];
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (ICQUpgradeFlowManager *)a3;
  localFlowManager = self->_localFlowManager;
  p_super = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager == v4)
  {
    if (v7)
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_impl(&dword_22C821000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel", (uint8_t *)&v12, 0xCu);
    }
    [(ICQUpgradeFlowManager *)self->_localFlowManager setDelegate:0];
    p_super = &self->_localFlowManager->super;
    self->_localFlowManager = 0;
  }
  else if (v7)
  {
    v8 = objc_opt_class();
    BOOL v9 = self->_localFlowManager;
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2112;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    v17 = v9;
    id v10 = v8;
    _os_log_impl(&dword_22C821000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did cancel for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (ICQUpgradeFlowManager *)a3;
  localFlowManager = self->_localFlowManager;
  p_super = _ICQGetLogSystem();
  BOOL v7 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
  if (localFlowManager == v4)
  {
    if (v7)
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v11 = v13;
      _os_log_impl(&dword_22C821000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete", (uint8_t *)&v12, 0xCu);
    }
    p_super = &self->_localFlowManager->super;
    self->_localFlowManager = 0;
  }
  else if (v7)
  {
    v8 = objc_opt_class();
    BOOL v9 = self->_localFlowManager;
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2112;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    v17 = v9;
    id v10 = v8;
    _os_log_impl(&dword_22C821000, p_super, OS_LOG_TYPE_DEFAULT, "%{public}@ UpgradeFlowManager did complete for manager %@ instead of %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)_handlePushReceivedDarwinNotification
{
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "push received updating count", buf, 2u);
  }

  id v4 = (void *)MEMORY[0x263F88968];
  unint64_t v5 = [(ICQBannerView *)self offer];
  char v6 = [v5 bundleIdentifier];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke;
  v7[3] = &unk_264922428;
  v7[4] = self;
  [v4 getInfoWithBundleId:v6 completion:v7];
}

void __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = a2;
      char v6 = [v4 offer];
      [v6 setDeviceInfo:v5];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke_2;
      block[3] = &unk_264921C80;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __54__ICQBannerView__handlePushReceivedDarwinNotification__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBannerView];
}

- (void)_registerForDarwinNotifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = [(ICQBannerView *)self offer];
  int v4 = [v3 showsPhotoVideoCounts];

  if (v4)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = @"com.apple.mobileslideshow.cpl.currenttransferprogresschange";
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "registering for darwin notification %@", (uint8_t *)&v7, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handlePushReceivedDarwinNotification, @"com.apple.mobileslideshow.cpl.currenttransferprogresschange", 0, (CFNotificationSuspensionBehavior)1024);
  }
}

- (void)updateBannerView
{
  if ([(ICQBannerView *)self isLegacy]) {
    [(ICQBannerView *)self legacyBanner];
  }
  else {
  id v3 = [(ICQBannerView *)self bubbleBanner];
  }
  [v3 updateBannerView];
}

- (void)handleBannerDismiss:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 action];
    char v6 = _ICQStringForAction();
    *(_DWORD *)buf = 138543362;
    int v29 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "ICQ Banner: perform action %{public}@", buf, 0xCu);
  }
  int v7 = (void *)MEMORY[0x263F88978];
  v8 = [MEMORY[0x263EFF910] now];
  uint64_t v9 = [(ICQBannerView *)self offer];
  id v10 = [v9 recommendationSpecification];
  id v11 = [v10 reason];
  [v7 bubbleBannerTrackLastDismissed:v8 forReason:v11];

  int v12 = [MEMORY[0x263F88928] sharedOfferManager];
  id v13 = [(ICQBannerView *)self offer];
  __int16 v14 = [v13 bundleIdentifier];
  [v12 dismissRecommendationForBundleId:v14];

  BOOL v15 = [v4 parameters];
  __int16 v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F88808]];

  if (v16)
  {
    v17 = (void *)[objc_alloc(NSURL) initWithString:v16];
    id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v27 = @"com.apple.mobileslideshow-iCloudInAppRecommendations";
    BOOL v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    [v18 setObject:v19 forKeyedSubscript:@"recommendations"];

    [v18 setObject:@"dismissed" forKeyedSubscript:@"action"];
    v20 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__ICQBannerView_handleBannerDismiss___block_invoke;
    block[3] = &unk_264921B68;
    id v25 = v17;
    id v26 = v18;
    id v21 = v18;
    __int16 v22 = v17;
    dispatch_async(v20, block);
  }
  else
  {
    __int16 v22 = _ICQGetLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v22, OS_LOG_TYPE_DEFAULT, "ICQLink: performAction: ICQActionDismiss not handled", buf, 2u);
    }
  }

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __37__ICQBannerView_handleBannerDismiss___block_invoke_57;
  v23[3] = &unk_264921C80;
  v23[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v23);
}

uint64_t __37__ICQBannerView_handleBannerDismiss___block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F88908] performAsyncHTTPPostCallWithURL:*(void *)(a1 + 32) parameters:*(void *)(a1 + 40)];
}

void __37__ICQBannerView_handleBannerDismiss___block_invoke_57(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F88840] object:*(void *)(a1 + 32)];
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setFont:v5];
  }
}

- (void)setTitleFont:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setTitleFont:v5];
  }
}

- (void)setDetailMessageFont:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setDetailMessageFont:v5];
  }
}

- (void)setLinkMessageFont:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setLinkMessageFont:v5];
  }
}

- (void)setTitleColor:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setTitleColor:v5];
  }
}

- (void)setDetailMessageColor:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setDetailMessageColor:v5];
  }
}

- (void)setLinkMessageColor:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setLinkMessageColor:v5];
  }
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setTextColor:v5];
  }
}

- (void)setTextMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v8 = [(ICQBannerView *)self legacyBanner];
    objc_msgSend(v8, "setTextMargins:", top, leading, bottom, trailing);
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(ICQBannerView *)self isLegacy])
  {
    id v5 = [(ICQBannerView *)self legacyBanner];
    [v5 setTextAlignment:a3];
  }
}

- (void)setTextLineSpacing:(double)a3
{
  if ([(ICQBannerView *)self isLegacy])
  {
    id v5 = [(ICQBannerView *)self legacyBanner];
    [v5 setTextLineSpacing:a3];
  }
}

- (void)setLinkTextFont:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setLinkTextFont:v5];
  }
}

- (void)setLinkTextColor:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setLinkTextColor:v5];
  }
}

- (void)setFlowOptions:(id)a3
{
  id v5 = a3;
  if ([(ICQBannerView *)self isLegacy])
  {
    id v4 = [(ICQBannerView *)self legacyBanner];
    [v4 setFlowOptions:v5];
  }
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
}

- (ICQBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)detailMessageFont
{
  return self->_detailMessageFont;
}

- (UIFont)linkMessageFont
{
  return self->_linkMessageFont;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)detailMessageColor
{
  return self->_detailMessageColor;
}

- (UIColor)linkMessageColor
{
  return self->_linkMessageColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textMargins
{
  double top = self->_textMargins.top;
  double leading = self->_textMargins.leading;
  double bottom = self->_textMargins.bottom;
  double trailing = self->_textMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textLineSpacing
{
  return self->_textLineSpacing;
}

- (UIFont)linkTextFont
{
  return self->_linkTextFont;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setLegacyBanner:(id)a3
{
}

- (void)setBubbleBanner:(id)a3
{
}

- (void)setDismissibleBubbleBanner:(id)a3
{
}

- (BOOL)isLegacy
{
  return self->_isLegacy;
}

- (void)setIsLegacy:(BOOL)a3
{
  self->_isLegacdouble y = a3;
}

- (BOOL)isDismissible
{
  return self->_isDismissible;
}

- (void)setIsDismissible:(BOOL)a3
{
  self->_isDismissible = a3;
}

- (ICQUpgradeFlowManager)localFlowManager
{
  return self->_localFlowManager;
}

- (void)setLocalFlowManager:(id)a3
{
}

- (ICQPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_localFlowManager, 0);
  objc_storeStrong((id *)&self->_dismissibleBubbleBanner, 0);
  objc_storeStrong((id *)&self->_bubbleBanner, 0);
  objc_storeStrong((id *)&self->_legacyBanner, 0);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_linkMessageColor, 0);
  objc_storeStrong((id *)&self->_detailMessageColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_linkMessageFont, 0);
  objc_storeStrong((id *)&self->_detailMessageFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offer, 0);
}

@end