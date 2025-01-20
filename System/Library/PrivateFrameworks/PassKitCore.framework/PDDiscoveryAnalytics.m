@interface PDDiscoveryAnalytics
- (NSSet)identifiersOfCompletedDiscoveryItems;
- (NSSet)identifiersOfDismissedDiscoveryItems;
- (NSSet)identifiersOfExpandedDiscoveryItems;
- (NSSet)identifiersOfTappedDiscoveryItems;
- (NSString)lastTappedCTAItemIdentifier;
- (id)_countForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (id)_createOrRotateVisitorIDIfNecessary;
- (id)_createVisitorID;
- (id)_initalizeCountForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (id)_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:(double)a3;
- (void)_incrementCountForCountsDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4;
- (void)beginReporingDiscoveryAnalytics;
- (void)clearVisitorIDAndRelatedData;
- (void)completedDiscoveryItemCTA;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5;
- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 cardCount:(unint64_t)a5;
- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5;
- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8;
- (void)displayedEngagementMessage:(id)a3;
- (void)endReporingDiscoveryAnalytics;
- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7;
- (void)performedAction:(int64_t)a3 onDiscoveryItem:(id)a4;
- (void)performedAction:(int64_t)a3 onEngagementMessage:(id)a4;
- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5;
@end

@implementation PDDiscoveryAnalytics

- (void)beginReporingDiscoveryAnalytics
{
}

- (void)performedAction:(int64_t)a3 onEngagementMessage:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    if ([v5 canReportIdentifierToAggd])
    {
      CFStringRef v11 = @"identifier";
      v7 = [v6 identifier];
      v12 = v7;
      v8 = &v12;
      v9 = &v11;
      goto LABEL_7;
    }
LABEL_8:
    PKAnalyticsSendEvent();
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    if ([v5 canReportIdentifierToAggd])
    {
      CFStringRef v13 = @"identifier";
      v7 = [v6 identifier];
      v14 = v7;
      v8 = &v14;
      v9 = &v13;
LABEL_7:
      v10 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:1];
      PKAnalyticsSendEvent();

      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)performedAction:(int64_t)a3 onDiscoveryItem:(id)a4
{
  id v5 = a4;
  if (a3 == 2)
  {
    id v6 = v5;
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    id v6 = v5;
  }
  PKAnalyticsSendEvent();
  id v5 = v6;
LABEL_6:
}

- (void)displayedEngagementMessage:(id)a3
{
  id v3 = a3;
  if ([v3 canReportIdentifierToAggd])
  {
    CFStringRef v6 = @"identifier";
    v4 = [v3 identifier];
    v7 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    PKAnalyticsSendEvent();
  }
  else
  {
    PKAnalyticsSendEvent();
  }
}

- (void)displayedDiscoveryItemWithIdentifier:(id)a3 isWelcomeCard:(BOOL)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 callToAction:(int64_t)a7 cardSize:(int64_t)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  v14 = (__CFString *)a3;
  if (!a4) {
    PKAnalyticsSendEvent();
  }
  if ((unint64_t)(a7 - 1) > 0xA) {
    CFStringRef v15 = @"unknownCTA";
  }
  else {
    CFStringRef v15 = *(&off_10074D3B8 + a7 - 1);
  }
  v16 = [(PDDiscoveryAnalytics *)self _createOrRotateVisitorIDIfNecessary];
  [(PDDiscoveryAnalytics *)self _incrementCountForCountsDictionaryWithKey:@"PDDiscoverySwipedCountDict" forItemIdentifier:v14];
  v17 = [(PDDiscoveryAnalytics *)self _countForDictionaryWithKey:@"PDDiscoverySwipedCountDict" forItemIdentifier:v14];
  if (![v17 integerValue])
  {
    uint64_t v18 = [(PDDiscoveryAnalytics *)self _initalizeCountForDictionaryWithKey:@"PDDiscoverySwipedCountDict" forItemIdentifier:v14];

    v17 = (void *)v18;
  }
  v28[0] = PKAnalyticsReportEventTypeDiscoveryCardSwiped;
  v27[0] = PKAnalyticsReportEventKey;
  v27[1] = PKAnalyticsReportDiscoveryCardSwipedCountKey;
  uint64_t v19 = [v17 stringValue];
  v20 = (void *)v19;
  CFStringRef v21 = @"null";
  if (v14) {
    CFStringRef v22 = v14;
  }
  else {
    CFStringRef v22 = @"null";
  }
  v28[1] = v19;
  v28[2] = v22;
  v27[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v27[3] = PKAnalyticsReportEventTypeCallToActionType;
  CFStringRef v23 = @"false";
  if (v11) {
    CFStringRef v24 = @"true";
  }
  else {
    CFStringRef v24 = @"false";
  }
  v28[3] = v15;
  v28[4] = v24;
  v27[4] = PKAnalyticsReportDiscoveryCardSwipedRequiredKey;
  v27[5] = PKAnalyticsReportDiscoveryCardMultipleStoryCardsAvailabledKey;
  if (v10) {
    CFStringRef v23 = @"true";
  }
  if (v16) {
    CFStringRef v21 = v16;
  }
  v28[5] = v23;
  v28[6] = v21;
  v27[6] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  v27[7] = PKAnalyticsReportDiscoveryCardSizeKey;
  if ((unint64_t)a8 > 2) {
    CFStringRef v25 = @"unknownCardSizeType";
  }
  else {
    CFStringRef v25 = *(&off_10074D380 + a8);
  }
  v28[7] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:8];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v26];
}

- (void)expandedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 afterSwipingToCard:(BOOL)a5 multipleStoryCardsAvailable:(BOOL)a6 cardSize:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v12 = (__CFString *)a3;
  PKAnalyticsSendEvent();
  if ((unint64_t)(a4 - 1) > 0xA) {
    CFStringRef v13 = @"unknownCTA";
  }
  else {
    CFStringRef v13 = *(&off_10074D3B8 + a4 - 1);
  }
  v14 = [(PDDiscoveryAnalytics *)self _createOrRotateVisitorIDIfNecessary];
  CFStringRef v15 = +[NSUserDefaults standardUserDefaults];
  v16 = [v15 dictionaryForKey:@"PDDiscoveryExpandedSet"];
  id v17 = [v16 mutableCopy];

  if (!v17) {
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
  }
  [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:v12];
  [v15 setObject:v17 forKey:@"PDDiscoveryExpandedSet"];
  [(PDDiscoveryAnalytics *)self _incrementCountForCountsDictionaryWithKey:@"PDDiscoveryExpansionCountDict" forItemIdentifier:v12];
  uint64_t v18 = [(PDDiscoveryAnalytics *)self _countForDictionaryWithKey:@"PDDiscoveryExpansionCountDict" forItemIdentifier:v12];
  if (![v18 integerValue])
  {
    uint64_t v19 = [(PDDiscoveryAnalytics *)self _initalizeCountForDictionaryWithKey:@"PDDiscoveryExpansionCountDict" forItemIdentifier:v12];

    uint64_t v18 = (void *)v19;
  }
  v29[0] = PKAnalyticsReportEventTypeDiscoveryCardExpanded;
  v28[0] = PKAnalyticsReportEventKey;
  v28[1] = PKAnalyticsReportDiscoveryCardExpansionCountKey;
  uint64_t v20 = [v18 stringValue];
  CFStringRef v21 = (void *)v20;
  CFStringRef v22 = @"null";
  if (v12) {
    CFStringRef v23 = v12;
  }
  else {
    CFStringRef v23 = @"null";
  }
  v29[1] = v20;
  v29[2] = v23;
  v28[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v28[3] = PKAnalyticsReportEventTypeCallToActionType;
  if (v9) {
    CFStringRef v24 = @"true";
  }
  else {
    CFStringRef v24 = @"false";
  }
  v29[3] = v13;
  v29[4] = v24;
  v28[4] = PKAnalyticsReportDiscoveryCardExpandedAfterSwipingToCardKey;
  v28[5] = PKAnalyticsReportDiscoveryCardMultipleStoryCardsAvailabledKey;
  if (v8) {
    CFStringRef v25 = @"true";
  }
  else {
    CFStringRef v25 = @"false";
  }
  v29[5] = v25;
  v28[6] = PKAnalyticsReportDiscoveryCardSizeKey;
  if ((unint64_t)a7 > 2) {
    CFStringRef v26 = @"unknownCardSizeType";
  }
  else {
    CFStringRef v26 = *(&off_10074D380 + a7);
  }
  v28[7] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v14) {
    CFStringRef v22 = v14;
  }
  v29[6] = v26;
  v29[7] = v22;
  v27 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:8];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v27];
}

- (void)dismissedDiscoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 cardSize:(int64_t)a5
{
  BOOL v8 = (__CFString *)a3;
  if ((unint64_t)(a4 - 1) > 0xA) {
    CFStringRef v9 = @"unknownCTA";
  }
  else {
    CFStringRef v9 = *(&off_10074D3B8 + a4 - 1);
  }
  BOOL v10 = [(PDDiscoveryAnalytics *)self _createOrRotateVisitorIDIfNecessary];
  BOOL v11 = +[NSUserDefaults standardUserDefaults];
  v12 = [v11 dictionaryForKey:@"PDDiscoveryDismissedSet"];
  id v13 = [v12 mutableCopy];

  if (!v13) {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (v8)
  {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v8];
    [(PDDiscoveryAnalytics *)self _incrementCountForCountsDictionaryWithKey:@"PDDiscoveryDismissalCountDict" forItemIdentifier:v8];
    v14 = [(PDDiscoveryAnalytics *)self _countForDictionaryWithKey:@"PDDiscoveryDismissalCountDict" forItemIdentifier:v8];
    if ([v14 integerValue])
    {
      CFStringRef v15 = v8;
    }
    else
    {
      uint64_t v16 = [(PDDiscoveryAnalytics *)self _initalizeCountForDictionaryWithKey:@"PDDiscoveryDismissalCountDict" forItemIdentifier:v8];

      CFStringRef v15 = v8;
      v14 = (_UNKNOWN **)v16;
    }
  }
  else
  {
    v14 = &off_10078B868;
    CFStringRef v15 = @"null";
  }
  [v11 setObject:v13 forKey:@"PDDiscoveryDismissedSet"];
  v22[0] = PKAnalyticsReportEventTypeDiscoveryCardDismissed;
  v21[0] = PKAnalyticsReportEventKey;
  v21[1] = PKAnalyticsReportDiscoveryCardDismissalCountKey;
  id v17 = [v14 stringValue];
  v22[1] = v17;
  v22[2] = v15;
  v21[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v21[3] = PKAnalyticsReportEventTypeCallToActionType;
  v22[3] = v9;
  v21[4] = PKAnalyticsReportDiscoveryCardSizeKey;
  if ((unint64_t)a5 > 2) {
    CFStringRef v18 = @"unknownCardSizeType";
  }
  else {
    CFStringRef v18 = *(&off_10074D380 + a5);
  }
  v21[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v10) {
    CFStringRef v19 = v10;
  }
  else {
    CFStringRef v19 = @"null";
  }
  v22[4] = v18;
  v22[5] = v19;
  uint64_t v20 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v20];
}

- (void)tappedDiscoveryItemCTA:(int64_t)a3 itemIdentifier:(id)a4 cardSize:(int64_t)a5
{
  BOOL v8 = (__CFString *)a4;
  if ((unint64_t)(a3 - 1) > 0xA) {
    CFStringRef v9 = @"unknownCTA";
  }
  else {
    CFStringRef v9 = *(&off_10074D3B8 + a3 - 1);
  }
  BOOL v10 = [(PDDiscoveryAnalytics *)self _createOrRotateVisitorIDIfNecessary];
  BOOL v11 = +[NSUserDefaults standardUserDefaults];
  v12 = [v11 dictionaryForKey:@"PDDiscoveryCTABegunSet"];
  id v13 = [v12 mutableCopy];

  if (!v13) {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
  }
  [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v8];
  [v11 setObject:v13 forKey:@"PDDiscoveryCTABegunSet"];
  [v11 setObject:v9 forKey:@"PDDiscoveryCTALastTappedAction"];
  if (v8) {
    v14 = v8;
  }
  else {
    v14 = 0;
  }
  [v11 setObject:v14 forKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
  [v11 setInteger:a5 forKey:@"PDDiscoveryCTALastTappedItemSize"];
  [(PDDiscoveryAnalytics *)self _incrementCountForCountsDictionaryWithKey:@"PDDiscoveryCTABegunCountDict" forItemIdentifier:v8];
  CFStringRef v15 = [(PDDiscoveryAnalytics *)self _countForDictionaryWithKey:@"PDDiscoveryCTABegunCountDict" forItemIdentifier:v9];
  if (![v15 integerValue])
  {
    uint64_t v16 = [(PDDiscoveryAnalytics *)self _initalizeCountForDictionaryWithKey:@"PDDiscoveryCTABegunCountDict" forItemIdentifier:v9];

    CFStringRef v15 = (void *)v16;
  }
  v23[0] = PKAnalyticsReportEventKey;
  v23[1] = PKAnalyticsReportEventTypeCallToActionType;
  v24[0] = PKAnalyticsReportEventTypeCallToActionBegan;
  v24[1] = v9;
  v23[2] = PKAnalyticsReportDiscoveryCardCTABeganCountKey;
  uint64_t v17 = [v15 stringValue];
  CFStringRef v18 = (void *)v17;
  CFStringRef v19 = @"null";
  if (v8) {
    CFStringRef v20 = v8;
  }
  else {
    CFStringRef v20 = @"null";
  }
  v24[2] = v17;
  v24[3] = v20;
  v23[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v23[4] = PKAnalyticsReportDiscoveryCardSizeKey;
  if ((unint64_t)a5 > 2) {
    CFStringRef v21 = @"unknownCardSizeType";
  }
  else {
    CFStringRef v21 = *(&off_10074D380 + a5);
  }
  v23[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
  if (v10) {
    CFStringRef v19 = v10;
  }
  v24[4] = v21;
  v24[5] = v19;
  CFStringRef v22 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v22];
}

- (void)completedDiscoveryItemCTA
{
  id v3 = [(PDDiscoveryAnalytics *)self _createOrRotateVisitorIDIfNecessary];
  v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 objectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
  if (v5)
  {
    CFStringRef v6 = [v4 dictionaryForKey:@"PDDiscoveryCTACompletedSet"];
    id v7 = [v6 mutableCopy];

    if (!v7) {
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:v5];
    [v4 setObject:v7 forKey:@"PDDiscoveryCTACompletedSet"];
    [(PDDiscoveryAnalytics *)self _incrementCountForCountsDictionaryWithKey:@"PDDiscoveryCTACompletedCountDict" forItemIdentifier:v5];
    BOOL v8 = [(PDDiscoveryAnalytics *)self _countForDictionaryWithKey:@"PDDiscoveryCTACompletedCountDict" forItemIdentifier:v5];
    if (![v8 integerValue])
    {
      uint64_t v9 = [(PDDiscoveryAnalytics *)self _initalizeCountForDictionaryWithKey:@"PDDiscoveryCTACompletedCountDict" forItemIdentifier:v5];

      BOOL v8 = (void *)v9;
    }
    BOOL v10 = [v4 objectForKey:@"PDDiscoveryCTALastTappedAction"];
    if (v10)
    {
      id v11 = [v4 integerForKey:@"PDDiscoveryCTALastTappedItemSize"];
      v16[0] = PKAnalyticsReportEventKey;
      v16[1] = PKAnalyticsReportEventTypeCallToActionType;
      v17[0] = PKAnalyticsReportEventTypeCallToActionCompleted;
      v17[1] = v10;
      v16[2] = PKAnalyticsReportDiscoveryCardCTACompletedCountKey;
      v12 = [v8 stringValue];
      v17[2] = v12;
      v17[3] = v5;
      v16[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
      v16[4] = PKAnalyticsReportDiscoveryCardSizeKey;
      if ((unint64_t)v11 > 2) {
        CFStringRef v13 = @"unknownCardSizeType";
      }
      else {
        CFStringRef v13 = *(&off_10074D380 + (void)v11);
      }
      v16[5] = PKAnalyticsReportDiscoveryCardVistorIDKey;
      CFStringRef v14 = @"null";
      if (v3) {
        CFStringRef v14 = v3;
      }
      v17[4] = v13;
      v17[5] = v14;
      CFStringRef v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];

      +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v15];
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedAction"];
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
      [v4 setObject:0 forKey:@"PDDiscoveryCTALastTappedItemSize"];
    }
  }
}

- (void)discoveryItemWithIdentifier:(id)a3 launchedWithReferralSource:(unint64_t)a4 cardCount:(unint64_t)a5
{
  id v7 = (__CFString *)a3;
  if (a4 > 3) {
    CFStringRef v8 = @"unknownReferralSource";
  }
  else {
    CFStringRef v8 = *(&off_10074D398 + a4);
  }
  if (a5 > 4)
  {
    uint64_t v9 = @"More than 4";
  }
  else
  {
    uint64_t v9 = +[NSString pk_stringWithInteger:a5];
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v21[0] = PKAnalyticsReportEventTypeReferralSource;
    v21[1] = PKAnalyticsReportDiscoveryCardWalletBadged;
    CFStringRef v10 = @"false";
    if (a4 == 2) {
      CFStringRef v10 = @"true";
    }
    v22[0] = v8;
    v22[1] = v10;
    v21[2] = PKAnalyticsReportDiscoveryCardTotalCardCount;
    v21[3] = PKAnalyticsReportDiscoveryCardIdentifierKey;
    CFStringRef v11 = @"null";
    if (v7) {
      CFStringRef v11 = v7;
    }
    v22[2] = v9;
    v22[3] = v11;
    v12 = v22;
    CFStringRef v13 = v21;
    uint64_t v14 = 4;
  }
  else
  {
    v19[0] = PKAnalyticsReportEventTypeReferralSource;
    v19[1] = PKAnalyticsReportDiscoveryCardTotalCardCount;
    v20[0] = v8;
    v20[1] = v9;
    v19[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
    if (v7) {
      CFStringRef v15 = v7;
    }
    else {
      CFStringRef v15 = @"null";
    }
    v20[2] = v15;
    v12 = v20;
    CFStringRef v13 = v19;
    uint64_t v14 = 3;
  }
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v13 count:v14];
  uint64_t v18 = PKAnalyticsSubjectDiscoveryCard;
  uint64_t v17 = +[NSArray arrayWithObjects:&v18 count:1];
  +[PKAnalyticsReporter subjects:v17 sendEvent:v16];
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 isScrollable:(BOOL)a5
{
  if ((unint64_t)(a4 - 1) > 0xA) {
    CFStringRef v5 = @"unknownCTA";
  }
  else {
    CFStringRef v5 = *(&off_10074D3B8 + a4 - 1);
  }
  CFStringRef v6 = @"false";
  if (a5) {
    CFStringRef v6 = @"true";
  }
  v9[0] = PKAnalyticsReportDiscoveryCardScrollableKey;
  v9[1] = PKAnalyticsReportEventTypeCallToActionType;
  v10[0] = v6;
  v10[1] = v5;
  v9[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v10[2] = a3;
  id v7 = a3;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v8];
}

- (void)discoveryItemWithIdentifier:(id)a3 callToAction:(int64_t)a4 wasScrolledToTheBottom:(BOOL)a5
{
  if ((unint64_t)(a4 - 1) > 0xA) {
    CFStringRef v5 = @"unknownCTA";
  }
  else {
    CFStringRef v5 = *(&off_10074D3B8 + a4 - 1);
  }
  CFStringRef v6 = @"false";
  if (a5) {
    CFStringRef v6 = @"true";
  }
  v9[0] = PKAnalyticsReportDiscoveryCardScrolledToBottomKey;
  v9[1] = PKAnalyticsReportEventTypeCallToActionType;
  v10[0] = v6;
  v10[1] = v5;
  v9[2] = PKAnalyticsReportDiscoveryCardIdentifierKey;
  v10[2] = a3;
  id v7 = a3;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  +[PKAnalyticsReporter subject:PKAnalyticsSubjectDiscoveryCard sendEvent:v8];
}

- (void)endReporingDiscoveryAnalytics
{
}

- (NSString)lastTappedCTAItemIdentifier
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"];

  return (NSString *)v3;
}

- (NSSet)identifiersOfExpandedDiscoveryItems
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"PDDiscoveryExpandedSet"];
  v4 = [v3 keysOfEntriesPassingTest:&stru_10074D300];

  return (NSSet *)v4;
}

- (NSSet)identifiersOfDismissedDiscoveryItems
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"PDDiscoveryDismissedSet"];
  v4 = [v3 keysOfEntriesPassingTest:&stru_10074D320];

  return (NSSet *)v4;
}

- (NSSet)identifiersOfTappedDiscoveryItems
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"PDDiscoveryCTABegunSet"];
  v4 = [v3 keysOfEntriesPassingTest:&stru_10074D340];

  return (NSSet *)v4;
}

- (NSSet)identifiersOfCompletedDiscoveryItems
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 dictionaryForKey:@"PDDiscoveryCTACompletedSet"];
  v4 = [v3 keysOfEntriesPassingTest:&stru_10074D360];

  return (NSSet *)v4;
}

- (id)_createVisitorID
{
  [(PDDiscoveryAnalytics *)self clearVisitorIDAndRelatedData];
  id v2 = objc_alloc_init((Class)NSUUID);
  id v3 = [v2 UUIDString];

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"PDDiscoveryVisitorID"];
  CFStringRef v5 = +[NSDate now];
  [v5 timeIntervalSince1970];
  objc_msgSend(v4, "setDouble:forKey:", @"PDDiscoveryVisitorIDCreationInterval");

  return v3;
}

- (id)_createOrRotateVisitorIDIfNecessary
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 stringForKey:@"PDDiscoveryVisitorID"];
  if (v4)
  {
    CFStringRef v5 = (void *)v4;
    [v3 doubleForKey:@"PDDiscoveryVisitorIDCreationInterval"];
    CFStringRef v6 = -[PDDiscoveryAnalytics _rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:](self, "_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:");
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error fetching visitorID, clearing data and creating a new visitorID", v9, 2u);
    }

    CFStringRef v6 = [(PDDiscoveryAnalytics *)self _createVisitorID];
  }

  return v6;
}

- (id)_rotateVisitorIDIfNecessaryWithVisitorIDCreationInterval:(double)a3
{
  CFStringRef v5 = +[NSDate now];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  CFStringRef v8 = +[NSUserDefaults standardUserDefaults];
  uint64_t v9 = [v8 stringForKey:@"PDDiscoveryVisitorID"];
  CFStringRef v10 = v9;
  double v11 = v7 - a3;
  if (v11 > 6912000.0 || v9 == 0)
  {
    CFStringRef v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      BOOL v18 = v11 > 6912000.0;
      __int16 v19 = 2048;
      BOOL v20 = v10 == 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Clearing discovery data and creating a new visitorID due to elapsed interval:%ld or nil visitorID:%ld", (uint8_t *)&v17, 0x16u);
    }

    id v14 = [(PDDiscoveryAnalytics *)self _createVisitorID];
  }
  else
  {
    id v14 = v9;
  }
  CFStringRef v15 = v14;

  return v15;
}

- (void)_incrementCountForCountsDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  double v6 = +[NSUserDefaults standardUserDefaults];
  double v7 = [v6 dictionaryForKey:v14];
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:v5];
  CFStringRef v10 = v9;
  if (v9) {
    signed int v11 = [v9 intValue] + 1;
  }
  else {
    signed int v11 = 1;
  }
  if (v11 >= 5) {
    uint64_t v12 = 5;
  }
  else {
    uint64_t v12 = v11;
  }
  CFStringRef v13 = +[NSNumber numberWithInt:v12];
  [v8 setObject:v13 forKeyedSubscript:v5];

  [v6 setObject:v8 forKey:v14];
}

- (id)_countForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 dictionaryForKey:v6];

  id v9 = [v8 mutableCopy];
  if (v9)
  {
    CFStringRef v10 = [v9 objectForKey:v5];
  }
  else
  {
    CFStringRef v10 = &off_10078B868;
  }

  return v10;
}

- (id)_initalizeCountForDictionaryWithKey:(id)a3 forItemIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = [v7 dictionaryForKey:v5];
  id v9 = [v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  CFStringRef v10 = [v9 objectForKeyedSubscript:v6];
  if (!v10)
  {
    signed int v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "count was nil for item with identifier:%@ in dictionary for key:%@, setting to 1", (uint8_t *)&v13, 0x16u);
    }

    CFStringRef v10 = &off_10078B880;
  }
  [v9 setObject:v10 forKeyedSubscript:v6];
  [v7 setObject:v9 forKey:v5];

  return v10;
}

- (void)clearVisitorIDAndRelatedData
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"PDDiscoveryVisitorID"];
  [v2 removeObjectForKey:@"PDDiscoveryVisitorIDCreationInterval"];
  [v2 removeObjectForKey:@"PDDiscoveryDismissalCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryExpansionCountDict"];
  [v2 removeObjectForKey:@"PDDiscoverySwipedCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTABegunCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTACompletedCountDict"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedAction"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedItemIdentifier"];
  [v2 removeObjectForKey:@"PDDiscoveryCTALastTappedItemSize"];
}

@end