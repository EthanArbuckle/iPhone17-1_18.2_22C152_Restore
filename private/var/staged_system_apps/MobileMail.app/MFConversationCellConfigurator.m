@interface MFConversationCellConfigurator
+ (id)log;
- (BOOL)animatePendingHeightChangesIfNecessary;
- (BOOL)animatingHeightChange;
- (BOOL)isMessageItemAtIndexPath:(id)a3;
- (BOOL)isSummaryItemAtIndexPath:(id)a3;
- (BOOL)messageAtIndexPathIsExpanded:(id)a3;
- (BOOL)messageAtIndexPathIsExpandedOrSemiExpanded:(id)a3;
- (BOOL)updateSemiExpandedToFullyExpandedIfNecessaryAtIndexPath:(id)a3 renderedHeight:(double)a4;
- (CGSize)sizeForItemAtIndexPath:(id)a3;
- (EMCachingContactStore)contactStore;
- (MFConversationCellConfigurator)initWithCollectionView:(id)a3;
- (MFConversationCellConfiguratorDelegate)delegate;
- (MFConversationViewCellExpansionTracker)expansionTracker;
- (MFConversationViewCellSizeTracker)sizeTracker;
- (MFMessageDisplayMetrics)displayMetrics;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (NSDate)lastAnimatedExpansionTimestamp;
- (UICollectionView)collectionView;
- (UIViewPropertyAnimator)heightChangeAnimator;
- (id)unconfiguredCellForItemAtIndexPath:(id)a3;
- (int64_t)expansionStatusForMessageAtIndexPath:(id)a3;
- (void)_setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 manualSummaryContext:(id)a6;
- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 messageFuture:(id)a6 contentRequest:(id)a7;
- (void)enumerateCollapsedCellsWithBlock:(id)a3;
- (void)enumerateExpandedCellsWithBlock:(id)a3;
- (void)enumeratePreparedCellsWithBlock:(id)a3;
- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5;
- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5 expansionStatus:(int64_t)a6;
- (void)expansionTracker:(id)a3 didChangeCollapsingAllowed:(BOOL)a4;
- (void)resetCaches;
- (void)setAnimatingHeightChange:(BOOL)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5;
- (void)setCollectionView:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setExpansionTracker:(id)a3;
- (void)setHeightChangeAnimator:(id)a3;
- (void)setLastAnimatedExpansionTimestamp:(id)a3;
- (void)setSizeTracker:(id)a3;
@end

@implementation MFConversationCellConfigurator

- (MFConversationCellConfigurator)initWithCollectionView:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFConversationCellConfigurator;
  v6 = [(MFConversationCellConfigurator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collectionView, a3);
    v8 = [[MFConversationViewCellExpansionTracker alloc] initWithDelegate:v7];
    expansionTracker = v7->_expansionTracker;
    v7->_expansionTracker = v8;

    v10 = objc_alloc_init(MFConversationViewCellSizeTracker);
    sizeTracker = v7->_sizeTracker;
    v7->_sizeTracker = v10;

    [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kExpandedMessageCell"];
    [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kCollapsedMessageCell"];
    [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kCollapsedSubjectMessageCell"];
    [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kSummaryMessageCell"];
  }

  return v7;
}

- (MFConversationViewCellSizeTracker)sizeTracker
{
  return self->_sizeTracker;
}

- (void)setDelegate:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100184FF8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699A48 != -1) {
    dispatch_once(&qword_100699A48, block);
  }
  v2 = (void *)qword_100699A40;

  return v2;
}

- (id)unconfiguredCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(MFConversationCellConfigurator *)self isSummaryItemAtIndexPath:v4])
  {
    CFStringRef v5 = @"kSummaryMessageCell";
  }
  else if ([(MFConversationCellConfigurator *)self messageAtIndexPathIsExpandedOrSemiExpanded:v4])
  {
    CFStringRef v5 = @"kExpandedMessageCell";
  }
  else
  {
    v6 = [(MFConversationCellConfigurator *)self delegate];
    unsigned int v7 = [v6 collapsedCellsShowsSubjectForCellConfigurator:self];

    if (v7) {
      CFStringRef v5 = @"kCollapsedSubjectMessageCell";
    }
    else {
      CFStringRef v5 = @"kCollapsedMessageCell";
    }
  }
  v8 = [(MFConversationCellConfigurator *)self collectionView];
  v9 = [v8 dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:v4];

  return v9;
}

- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 messageFuture:(id)a6 contentRequest:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [v12 setItemID:v14];
  v17 = [(MFConversationCellConfigurator *)self displayMetrics];
  [v12 setDisplayMetrics:v17];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v12;
    v19 = [(MFConversationCellConfigurator *)self contactStore];
    [v18 setContactStore:v19];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v20 = +[EFScheduler mainThreadScheduler];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100185474;
    v25[3] = &unk_10060B0E0;
    objc_copyWeak(&v29, &location);
    id v21 = v18;
    id v26 = v21;
    id v22 = v16;
    id v27 = v22;
    id v28 = v13;
    [v15 onScheduler:v20 addSuccessBlock:v25];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100185AD4;
    v23[3] = &unk_100604F70;
    id v24 = v22;
    [v15 addFailureBlock:v23];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (void)configureCell:(id)a3 forItemAtIndexPath:(id)a4 itemID:(id)a5 manualSummaryContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 setItemID:v12];
  id v14 = [(MFConversationCellConfigurator *)self displayMetrics];
  [v10 setDisplayMetrics:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [ConversationCellViewModel alloc];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100185D2C;
    v18[3] = &unk_10060B108;
    id v19 = v13;
    id v16 = [(ConversationCellViewModel *)v15 initWithBuilder:v18];
    [v10 setViewModel:v16];

    v17 = [(MFConversationCellConfigurator *)self delegate];
    [v17 cellConfigurator:self didConfigureCell:v10 atIndexPath:v11];
  }
}

- (int64_t)expansionStatusForMessageAtIndexPath:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MFConversationCellConfigurator *)self delegate];
  v6 = [v5 cellConfigurator:self messageItemIDAtIndexPath:v4];
  if (!v6)
  {
    id v11 = +[MFConversationCellConfigurator log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10045C668((uint64_t)v4, v11);
    }
    goto LABEL_7;
  }
  unsigned int v7 = [(MFConversationCellConfigurator *)self expansionTracker];
  id v8 = [v7 expansionStatusForCellWithItemID:v6];

  if (!v8)
  {
    id v9 = [v5 cellConfigurator:self expansionStatusForMessageAtIndexPath:v4];
    id v10 = [(MFConversationCellConfigurator *)self expansionTracker];
    [v10 setMessageWithItemID:v6 expansionStatus:v9];

    id v11 = +[MFConversationCellConfigurator log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      uint64_t v14 = 0;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Determined expansion status:%ld itemID:%{public}@ indexPath:%{public}@", (uint8_t *)&v13, 0x20u);
    }
LABEL_7:

    id v8 = 0;
  }

  return (int64_t)v8;
}

- (BOOL)messageAtIndexPathIsExpanded:(id)a3
{
  return (id)[(MFConversationCellConfigurator *)self expansionStatusForMessageAtIndexPath:a3] == (id)3;
}

- (BOOL)messageAtIndexPathIsExpandedOrSemiExpanded:(id)a3
{
  return ([(MFConversationCellConfigurator *)self expansionStatusForMessageAtIndexPath:a3] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isMessageItemAtIndexPath:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MFConversationCellConfigurator *)self delegate];
  v6 = [v5 cellConfigurator:self messageItemIDAtIndexPath:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isSummaryItemAtIndexPath:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(MFConversationCellConfigurator *)self delegate];
  v6 = [v5 cellConfigurator:self messageItemIDAtIndexPath:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGSize)sizeForItemAtIndexPath:(id)a3
{
  id v5 = a3;
  v6 = [(MFConversationCellConfigurator *)self delegate];
  unsigned int v7 = v6;
  CGFloat width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v6)
  {
    id v10 = [v6 cellConfigurator:self messageItemIDAtIndexPath:v5];
    if (!v10)
    {
      id v29 = +[NSAssertionHandler currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"MFConversationCellConfigurator.m" lineNumber:201 description:@"messageItemID cannot be nil."];
    }
    id v11 = [(MFConversationCellConfigurator *)self sizeTracker];
    [v11 displaySizeForCellWithItemID:v10];
    double v13 = v12;
    double v15 = v14;

    if ([(MFConversationCellConfigurator *)self isSummaryItemAtIndexPath:v5])
    {
      id v16 = [(MFConversationCellConfigurator *)self sizeTracker];
      [v16 intrinsicSizeForCellWithItemID:v10];
      double v18 = v17;
      double v20 = v19;

      if (v20 == height && v18 == CGSizeZero.width) {
        double v15 = 0.0;
      }
    }
    else
    {
      id v22 = [(MFConversationCellConfigurator *)self expansionTracker];
      id v23 = [v22 expansionStatusForCellWithItemID:v10];

      if (!v23)
      {
        id v23 = [v7 cellConfigurator:self expansionStatusForMessageAtIndexPath:v5];
        id v24 = [(MFConversationCellConfigurator *)self expansionTracker];
        [v24 setMessageWithItemID:v10 expansionStatus:v23];
      }
      if (v23 == (id)1)
      {
        v25 = [(MFConversationCellConfigurator *)self displayMetrics];
        +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:v25];
        double v15 = v26;
      }
    }

    CGFloat width = v13;
    double height = v15;
  }

  double v27 = width;
  double v28 = height;
  result.double height = v28;
  result.CGFloat width = v27;
  return result;
}

- (void)setDisplayMetrics:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_displayMetrics] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001863D4;
    v6[3] = &unk_100605C98;
    id v7 = v5;
    [(MFConversationCellConfigurator *)self enumeratePreparedCellsWithBlock:v6];
  }
}

- (void)enumeratePreparedCellsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MFConversationCellConfigurator *)self collectionView];
  if ([v5 numberOfSections])
  {
    id v6 = [v5 numberOfItemsInSection:0];
    if (v6)
    {
      id v7 = [v5 preparedCells];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100186510;
      v8[3] = &unk_10060B130;
      id v9 = v5;
      id v11 = v6;
      id v10 = v4;
      [v7 enumerateObjectsUsingBlock:v8];
    }
  }
}

- (void)enumerateExpandedCellsWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10018670C;
  v5[3] = &unk_10060B158;
  id v6 = a3;
  id v4 = v6;
  [(MFConversationCellConfigurator *)self enumeratePreparedCellsWithBlock:v5];
}

- (void)enumerateCollapsedCellsWithBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100186864;
  v5[3] = &unk_10060B158;
  id v6 = a3;
  id v4 = v6;
  [(MFConversationCellConfigurator *)self enumeratePreparedCellsWithBlock:v5];
}

- (void)resetCaches
{
  v3 = [(MFConversationCellConfigurator *)self expansionTracker];
  [v3 resetRecord];

  id v4 = [(MFConversationCellConfigurator *)self sizeTracker];
  [v4 resetAllCellSizes];

  [(MFConversationCellConfigurator *)self setLastAnimatedExpansionTimestamp:0];
}

- (UIViewPropertyAnimator)heightChangeAnimator
{
  heightChangeAnimator = self->_heightChangeAnimator;
  if (!heightChangeAnimator)
  {
    id v4 = (UIViewPropertyAnimator *)[objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:0 dampingRatio:0.5 animations:1.0];
    id v5 = self->_heightChangeAnimator;
    self->_heightChangeAnimator = v4;

    heightChangeAnimator = self->_heightChangeAnimator;
  }

  return heightChangeAnimator;
}

- (void)setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)_setCellAtIndexPath:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, uint64_t))a6;
  double v12 = [(MFConversationCellConfigurator *)self collectionView];
  double v13 = [v12 cellForItemAtIndexPath:v10];

  if (v13 && ([v13 disallowsHighlighting] & 1) == 0)
  {
    double v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    double v19 = sub_100186BA0;
    double v20 = &unk_1006058A8;
    BOOL v22 = v8;
    id v21 = v13;
    double v14 = objc_retainBlock(&v17);
    double v15 = v14;
    if (v7)
    {
      double v16 = 0.4;
      if (v8) {
        double v16 = 0.45;
      }
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v14, v11, v16, 0.0, 1.0, 0.0, v17, v18, v19, v20);
    }
    else
    {
      ((void (*)(void ***))v14[2])(v14);
      if (v11) {
        v11[2](v11, 1);
      }
    }
  }
}

- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5
{
}

- (void)expandCellAtIndexPath:(id)a3 animated:(BOOL)a4 highlightFirst:(BOOL)a5 expansionStatus:(int64_t)a6
{
  BOOL v26 = a5;
  BOOL v7 = a4;
  id v10 = a3;
  id v11 = +[MFConversationCellConfigurator log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "cellConfigurator expandCellAtIndexPath:%@", buf, 0xCu);
  }

  id val = [(MFConversationCellConfigurator *)self delegate];
  id v29 = [(MFConversationCellConfigurator *)self collectionView];
  uint64_t v12 = [val cellConfigurator:self messageItemIDAtIndexPath:v10];
  double v27 = (void *)v12;
  if (!v12)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MFConversationCellConfigurator.m" lineNumber:346 description:@"messageItemID cannot be nil."];

    uint64_t v12 = 0;
  }
  double v28 = [val cellConfigurator:self targetHeightForExpandingCellAtIndexPath:v10];
  if (v28)
  {
    double v13 = [(MFConversationCellConfigurator *)self sizeTracker];
    [v29 frame];
    double v15 = v14;
    [v28 floatValue];
    [v13 setIntrinsicSize:v12 forCellWithItemID:v15, v16];
  }
  double v17 = [(MFConversationCellConfigurator *)self expansionTracker];
  [v17 setMessageWithItemID:v12 expansionStatus:a6];

  uint64_t v18 = [v29 collectionViewLayout];
  [v18 setExpandingIndexPath:v10];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  double v19 = [(MFConversationCellConfigurator *)self heightChangeAnimator];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001871C4;
  v40[3] = &unk_10060B180;
  objc_copyWeak(&v42, (id *)buf);
  id v20 = v18;
  id v41 = v20;
  [v19 addCompletion:v40];

  [(MFConversationCellConfigurator *)self setAnimatingHeightChange:1];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  id v21 = [(MFConversationCellConfigurator *)self heightChangeAnimator];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100187240;
  v33[3] = &unk_10060B1A8;
  objc_copyWeak(&v36, (id *)buf);
  objc_copyWeak(&v37, &location);
  id v22 = v20;
  id v34 = v22;
  id v23 = v10;
  id v35 = v23;
  BOOL v38 = v7;
  [v21 addAnimations:v33];

  if (v7 && v26)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100187358;
    v31[3] = &unk_1006057A8;
    objc_copyWeak(&v32, (id *)buf);
    [(MFConversationCellConfigurator *)self _setCellAtIndexPath:v23 highlighted:1 animated:1 completion:v31];
    objc_destroyWeak(&v32);
  }
  else
  {
    id v24 = [(MFConversationCellConfigurator *)self heightChangeAnimator];
    [v24 startAnimation];
  }
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);
}

- (BOOL)updateSemiExpandedToFullyExpandedIfNecessaryAtIndexPath:(id)a3 renderedHeight:(double)a4
{
  id v6 = a3;
  BOOL v7 = [(MFConversationCellConfigurator *)self delegate];
  BOOL v8 = [(MFConversationCellConfigurator *)self sizeTracker];
  id v9 = [v8 delegate];
  BOOL v10 = 0;
  if ((id)[(MFConversationCellConfigurator *)self expansionStatusForMessageAtIndexPath:v6] == (id)2&& v7&& v9)
  {
    id v11 = [v7 cellConfigurator:self messageItemIDAtIndexPath:v6];
    if (v11 && ([v9 defaultSemiExpandedHeightForTracker:v8], v12 >= a4))
    {
      double v13 = [(MFConversationCellConfigurator *)self expansionTracker];
      [v13 setMessageWithItemID:v11 expansionStatus:3];

      double v14 = +[MFConversationCellConfigurator log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        double v17 = v11;
        __int16 v18 = 2048;
        double v19 = a4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "updating SemiExpanded to Expanded for itemID:%{public}@ based on renderedHeight:%f", (uint8_t *)&v16, 0x16u);
      }

      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (BOOL)animatePendingHeightChangesIfNecessary
{
  v3 = [(MFConversationCellConfigurator *)self lastAnimatedExpansionTimestamp];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (![(MFConversationCellConfigurator *)self animatingHeightChange]
    && (v5 >= 0.0 || v5 <= -1.0))
  {
    return 0;
  }
  BOOL v8 = [(MFConversationCellConfigurator *)self collectionView];
  id v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v10 = [(MFConversationCellConfigurator *)self heightChangeAnimator];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100187750;
  v11[3] = &unk_100604FE8;
  objc_copyWeak(&v12, &location);
  [v10 addAnimations:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

- (void)expansionTracker:(id)a3 didChangeCollapsingAllowed:(BOOL)a4
{
  id v5 = [(MFConversationCellConfigurator *)self delegate];
  [v5 cellConfigurator:self didInvalidateConfigurationForCellsAtIndexPaths:0];
}

- (MFConversationCellConfiguratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFConversationCellConfiguratorDelegate *)WeakRetained;
}

- (MFConversationViewCellExpansionTracker)expansionTracker
{
  return self->_expansionTracker;
}

- (void)setExpansionTracker:(id)a3
{
}

- (void)setSizeTracker:(id)a3
{
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setHeightChangeAnimator:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSDate)lastAnimatedExpansionTimestamp
{
  return self->_lastAnimatedExpansionTimestamp;
}

- (void)setLastAnimatedExpansionTimestamp:(id)a3
{
}

- (BOOL)animatingHeightChange
{
  return self->_animatingHeightChange;
}

- (void)setAnimatingHeightChange:(BOOL)a3
{
  self->_animatingHeightChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnimatedExpansionTimestamp, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_heightChangeAnimator, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_sizeTracker, 0);
  objc_storeStrong((id *)&self->_expansionTracker, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end