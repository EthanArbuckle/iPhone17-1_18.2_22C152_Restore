@interface BCCardStackCoverSourceController
+ (BOOL)canUseCoverTransitionForDismissingCardSetViewController:(id)a3 dataSource:(id)a4 coverHost:(id)a5 coverYOffset:(double *)a6 inCoordinatesOfView:(id)a7;
+ (id)coverHostFromPresentingViewController:(id)a3 previousCardSetViewController:(id)a4;
+ (void)revealCoverSourceAtIndex:(int64_t)a3 dataSource:(id)a4 coverHost:(id)a5;
- (BCCardSetViewController)cardSetViewController;
- (BCCardSetViewController)underlyingCardSetViewController;
- (BCCardStackCoverSourceController)initWithCardStackViewController:(id)a3 isDismiss:(BOOL)a4 cardSetViewController:(id)a5 focusedIndex:(int64_t)a6 coverHost:(id)a7 dataSource:(id)a8;
- (BCCardStackTransitioningCoverHost)coverHost;
- (BCCardStackViewController)cardStackViewController;
- (BCCardStackViewControllerDataSource)dataSource;
- (BOOL)_hasHiddenCoverSourcesForCardSet:(id)a3;
- (BOOL)_isRTL;
- (BOOL)canUseCoverTransition;
- (BOOL)coversAreInNonHorizontalLayout;
- (BOOL)coversNeedClipping;
- (BOOL)isDismiss;
- (BOOL)isDismissingCardStack;
- (BOOL)preferSlideForDismiss;
- (NSArray)cardMoveItems;
- (NSArray)cardSlideItems;
- (NSArray)clippedCoverFlyItems;
- (NSArray)coverFadeItems;
- (NSArray)coverMoveItems;
- (NSDictionary)cardByIndex;
- (NSDictionary)cardCoverSourceByIndex;
- (NSDictionary)cardCoverSourceUnhideBlocksByIndex;
- (NSDictionary)fakeCoverSourceByIndex;
- (NSDictionary)visibleCoverSourceByIndex;
- (NSIndexSet)clippedCoverIndexes;
- (NSIndexSet)visibleCardIndexesWithAdjustedCoverSource;
- (_NSRange)_rangeOfIndexesInRange:(_NSRange)a3 passingTest:(id)a4 aroundInnerRange:(_NSRange)a5;
- (_NSRange)_trimRange:(_NSRange)a3 withTest:(id)a4;
- (_NSRange)horizontalRange;
- (_NSRange)horizontalRangeIncludingFake;
- (_NSRange)visibleCardRange;
- (_NSRange)visibleRange;
- (id)_coverFadeItemsExcludingRange:(_NSRange)a3;
- (id)_coverSourceAtIndex:(int64_t)a3;
- (id)_placeholderCoverSourceForRelativeCoverFrame:(CGRect)a3 inCardView:(id)a4;
- (int64_t)focusedIndex;
- (int64_t)totalCoverCount;
- (void)_createImaginaryCovers;
- (void)_findHorizontalRange;
- (void)_findVisibleCoverSources;
- (void)_generateAnimationItems;
- (void)_generateDismissSlideAnimationItems;
- (void)_handlePartiallyVisibleCovers;
- (void)_hideVisibleCoverSources;
- (void)_obtainCardCoverSources;
- (void)_preserveNeededCoverSourceFramesWithNewReferenceView:(id)a3;
- (void)_refreshNeededCoverSources;
- (void)_unhideAllCoverSources;
- (void)_unhideCardCoverSources;
- (void)_unhideCoverSourcesForCardSet:(id)a3;
- (void)finalizeForAnimation;
- (void)hideCardCoverSources;
- (void)performFirstHalfOfProcessing;
- (void)performSecondHalfOfProcessing;
- (void)prepareForAnimation:(BOOL)a3;
- (void)prepareForCoverSourceCapturingWithToViewController:(id)a3 toViewTransform:(CGAffineTransform *)a4 revealCoverBlock:(id)a5 captureCoverFrameBlock:(id)a6;
- (void)setCardByIndex:(id)a3;
- (void)setCardCoverSourceByIndex:(id)a3;
- (void)setCardCoverSourceUnhideBlocksByIndex:(id)a3;
- (void)setCardMoveItems:(id)a3;
- (void)setCardSlideItems:(id)a3;
- (void)setCardStackViewController:(id)a3;
- (void)setClippedCoverFlyItems:(id)a3;
- (void)setClippedCoverIndexes:(id)a3;
- (void)setCoverFadeItems:(id)a3;
- (void)setCoverMoveItems:(id)a3;
- (void)setCoversAreInNonHorizontalLayout:(BOOL)a3;
- (void)setCoversNeedClipping:(BOOL)a3;
- (void)setFakeCoverSourceByIndex:(id)a3;
- (void)setHorizontalRange:(_NSRange)a3;
- (void)setHorizontalRangeIncludingFake:(_NSRange)a3;
- (void)setIsDismissingCardStack:(BOOL)a3;
- (void)setPreferSlideForDismiss:(BOOL)a3;
- (void)setTotalCoverCount:(int64_t)a3;
- (void)setUnderlyingCardSetViewController:(id)a3;
- (void)setVisibleCardIndexesWithAdjustedCoverSource:(id)a3;
- (void)setVisibleCardRange:(_NSRange)a3;
- (void)setVisibleCoverSourceByIndex:(id)a3;
- (void)setVisibleRange:(_NSRange)a3;
@end

@implementation BCCardStackCoverSourceController

- (BCCardStackCoverSourceController)initWithCardStackViewController:(id)a3 isDismiss:(BOOL)a4 cardSetViewController:(id)a5 focusedIndex:(int64_t)a6 coverHost:(id)a7 dataSource:(id)a8
{
  id v21 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BCCardStackCoverSourceController;
  v18 = [(BCCardStackCoverSourceController *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cardStackViewController, a3);
    v19->_isDismiss = a4;
    objc_storeStrong((id *)&v19->_cardSetViewController, a5);
    v19->_focusedIndex = a6;
    objc_storeStrong((id *)&v19->_coverHost, a7);
    objc_storeStrong((id *)&v19->_dataSource, a8);
  }

  return v19;
}

+ (void)revealCoverSourceAtIndex:(int64_t)a3 dataSource:(id)a4 coverHost:(id)a5
{
  id v7 = a5;
  id v8 = [a4 representedObjectForCardAtIndex:a3];
  [v7 revealCoverForRepresentedObject:v8];
}

+ (BOOL)canUseCoverTransitionForDismissingCardSetViewController:(id)a3 dataSource:(id)a4 coverHost:(id)a5 coverYOffset:(double *)a6 inCoordinatesOfView:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [v11 currentCardViewController];
  id v16 = [v15 transitioningCardContent];
  id v17 = [v16 cardStackTransitioningCardContentCoverSource];
  if (v17 && ![v16 visibilityOfCoverSource:v17 ignoringYAxis:0])
  {
    v43 = [v12 representedObjectForCardAtIndex:[v11 focusedIndex]];
    uint64_t v20 = [v13 coverSourceForRepresentedObject:];
    id v21 = (void *)v20;
    BOOL v18 = v20 != 0;
    double v19 = NAN;
    if (a6 && v20)
    {
      [v17 cardStackTransitioningCoverSourceReferenceView];
      objc_super v22 = v41 = v21;
      [v17 cardStackTransitioningCoverSourceFrame];
      [v22 convertRect:v14 toView:];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;

      id v21 = v41;
      v42 = [v41 cardStackTransitioningCoverSourceReferenceView];
      [v41 cardStackTransitioningCoverSourceFrame];
      [v42 convertRect:v14 toView:];
      CGFloat v32 = v31;
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      CGFloat v38 = v37;

      v44.origin.x = v32;
      v44.origin.y = v34;
      v44.size.width = v36;
      v44.size.height = v38;
      double MidY = CGRectGetMidY(v44);
      v45.origin.x = v24;
      v45.origin.y = v26;
      v45.size.width = v28;
      v45.size.height = v30;
      double v19 = MidY - CGRectGetMidY(v45);
    }
  }
  else
  {
    BOOL v18 = 0;
    double v19 = NAN;
  }

  if (a6) {
    *a6 = v19;
  }

  return v18;
}

+ (id)coverHostFromPresentingViewController:(id)a3 previousCardSetViewController:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 currentCardViewController];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  uint64_t v10 = [v9 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCardStackTransitioningCoverHost includePresented:0];
  if (v10)
  {
    id v11 = (void *)v10;
  }
  else
  {
    while (1)
    {
      id v11 = [v9 presentingViewController];

      if (!v11) {
        break;
      }
      id v12 = [v9 presentingViewController];

      uint64_t v13 = [v12 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCardStackTransitioningCoverHost includePresented:0];
      id v9 = v12;
      if (v13)
      {
        id v11 = (void *)v13;
        id v9 = v12;
        break;
      }
    }
  }

  return v11;
}

- (void)performFirstHalfOfProcessing
{
  v3 = [(BCCardStackCoverSourceController *)self dataSource];
  v4 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  -[BCCardStackCoverSourceController setTotalCoverCount:](self, "setTotalCoverCount:", [v3 numberOfCards:v4]);

  id v5 = [(BCCardStackCoverSourceController *)self cardSetViewController];
  id v6 = [v5 visibleCardRange];
  -[BCCardStackCoverSourceController setVisibleCardRange:](self, "setVisibleCardRange:", v6, v7);

  if ([(BCCardStackCoverSourceController *)self isDismiss]
    && [(BCCardStackCoverSourceController *)self preferSlideForDismiss]
    && ([(BCCardStackCoverSourceController *)self cardSetViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [(BCCardStackCoverSourceController *)self _hasHiddenCoverSourcesForCardSet:v8], v8, (v9 & 1) == 0))
  {
    -[BCCardStackCoverSourceController setVisibleRange:](self, "setVisibleRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(BCCardStackCoverSourceController *)self setVisibleCoverSourceByIndex:&__NSDictionary0__struct];
  }
  else
  {
    [(BCCardStackCoverSourceController *)self _findVisibleCoverSources];
  }
  if ([(BCCardStackCoverSourceController *)self canUseCoverTransition]
    && (![(BCCardStackCoverSourceController *)self isDismiss]
     || ![(BCCardStackCoverSourceController *)self preferSlideForDismiss]))
  {
    if ([(BCCardStackCoverSourceController *)self coversAreInNonHorizontalLayout]) {
      -[BCCardStackCoverSourceController setHorizontalRange:](self, "setHorizontalRange:", [(BCCardStackCoverSourceController *)self focusedIndex], 1);
    }
    else {
      [(BCCardStackCoverSourceController *)self _findHorizontalRange];
    }
    [(BCCardStackCoverSourceController *)self _createImaginaryCovers];
    if ([(BCCardStackCoverSourceController *)self coversNeedClipping])
    {
      [(BCCardStackCoverSourceController *)self _handlePartiallyVisibleCovers];
    }
  }
}

- (BOOL)canUseCoverTransition
{
  if ([(BCCardStackCoverSourceController *)self visibleRange] == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  [(BCCardStackCoverSourceController *)self visibleRange];
  return v4 != 0;
}

- (_NSRange)_rangeOfIndexesInRange:(_NSRange)a3 passingTest:(id)a4 aroundInnerRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a3.length;
  int64_t v8 = a3.location;
  unsigned __int8 v9 = (uint64_t (**)(id, void))a4;
  if (v7)
  {
    uint64_t v10 = v7 + v8 - 1;
    int64_t v11 = location;
    while (v11 > v8)
    {
      if ((v9[2](v9, --v11) & 1) == 0)
      {
        uint64_t v12 = v11 + 1;
        goto LABEL_8;
      }
    }
    uint64_t v12 = v8;
LABEL_8:
    uint64_t v13 = location + length;
    if (v13 <= v10)
    {
      NSUInteger v14 = v7 + v8;
      while ((v9[2](v9, v13) & 1) != 0)
      {
        if (v14 == ++v13) {
          goto LABEL_14;
        }
      }
      uint64_t v10 = v13 - 1;
    }
LABEL_14:
    NSUInteger v7 = v10 - v12 + 1;
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v15 = v12;
  NSUInteger v16 = v7;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (void)_findVisibleCoverSources
{
  int64_t v3 = [(BCCardStackCoverSourceController *)self totalCoverCount];
  int64_t v4 = [(BCCardStackCoverSourceController *)self focusedIndex];
  +[NSMutableDictionary dictionaryWithCapacity:v3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_4D9C0;
  v16[3] = &unk_2C5720;
  v16[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v5;
  id v6 = objc_retainBlock(v16);
  if (((unsigned int (*)(void *, int64_t, void))v6[2])(v6, v4, 0))
  {
    uint64_t v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_4DAD8;
    uint64_t v13 = &unk_2C5748;
    NSUInteger v14 = self;
    NSUInteger v15 = v6;
    uint64_t v7 = (uint64_t)-[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", 0, v3, &v10, v4, 1);
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[BCCardStackCoverSourceController setVisibleRange:](self, "setVisibleRange:", v7, v9, v10, v11, v12, v13, v14);
  [(BCCardStackCoverSourceController *)self setVisibleCoverSourceByIndex:v5];
}

- (void)_findHorizontalRange
{
  int64_t v3 = [(BCCardStackCoverSourceController *)self visibleCoverSourceByIndex];
  int64_t v4 = +[NSNumber numberWithInteger:[(BCCardStackCoverSourceController *)self focusedIndex]];
  id v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [v5 cardStackTransitioningCoverSourceReferenceView];
  [v5 cardStackTransitioningCoverSourceFrame];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4DC88;
  v13[3] = &unk_2C5770;
  v13[4] = self;
  id v14 = v6;
  CGFloat MaxY = CGRectGetMaxY(v16);
  id v7 = v6;
  uint64_t v8 = objc_retainBlock(v13);
  id v9 = [(BCCardStackCoverSourceController *)self visibleRange];
  id v11 = -[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", v9, v10, v8, [(BCCardStackCoverSourceController *)self focusedIndex], 1);
  -[BCCardStackCoverSourceController setHorizontalRange:](self, "setHorizontalRange:", v11, v12);
}

- (BOOL)_isRTL
{
  return [UIApp userInterfaceLayoutDirection] == (char *)&def_7D91C + 1;
}

- (void)_createImaginaryCovers
{
  id v3 = [(BCCardStackCoverSourceController *)self visibleRange];
  unint64_t v5 = v4;
  id v6 = [(BCCardStackCoverSourceController *)self horizontalRange];
  uint64_t v8 = v7;
  id v9 = [(BCCardStackCoverSourceController *)self visibleCoverSourceByIndex];
  id v10 = [(BCCardStackCoverSourceController *)self visibleCardRange];
  unint64_t v12 = (unint64_t)v10 + v11;
  id v13 = [(BCCardStackCoverSourceController *)self visibleRange];
  if (v12 > (unint64_t)v13 + v14
    && v12 <= [(BCCardStackCoverSourceController *)self totalCoverCount])
  {
    unint64_t v5 = v12;
  }
  +[NSMutableDictionary dictionaryWithCapacity:v5 - v8];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_4DF30;
  v19[3] = &unk_2C5798;
  id v23 = v6;
  uint64_t v24 = (uint64_t)v6 + v8 - 1;
  id v20 = v9;
  id v21 = self;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v22;
  id v16 = v9;
  id v17 = -[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", v3, v5, v19, v6, v8);
  -[BCCardStackCoverSourceController setHorizontalRangeIncludingFake:](self, "setHorizontalRangeIncludingFake:", v17, v18);
  [(BCCardStackCoverSourceController *)self setFakeCoverSourceByIndex:v15];
}

- (_NSRange)_trimRange:(_NSRange)a3 withTest:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  id v6 = (unsigned int (**)(id, int64_t))a4;
  if (length)
  {
    uint64_t v7 = length + location - 1;
    if (location > v7) {
      goto LABEL_8;
    }
    while (v6[2](v6, location))
    {
      ++location;
      if (!--length) {
        goto LABEL_8;
      }
    }
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      uint64_t v8 = 0;
      int64_t location = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      int64_t v11 = location;
      if (v7 > location)
      {
        while (v6[2](v6, v7))
        {
          if (--v7 <= location)
          {
            int64_t v11 = location;
            goto LABEL_15;
          }
        }
        int64_t v11 = v7;
      }
LABEL_15:
      uint64_t v8 = v11 - location + 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  NSUInteger v9 = location;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.int64_t location = v9;
  return result;
}

- (id)_coverSourceAtIndex:(int64_t)a3
{
  id v5 = [(BCCardStackCoverSourceController *)self horizontalRange];
  if (a3 < (unint64_t)v5 || a3 - (uint64_t)v5 >= v6)
  {
    uint64_t v7 = [(BCCardStackCoverSourceController *)self fakeCoverSourceByIndex];
  }
  else
  {
    uint64_t v7 = [(BCCardStackCoverSourceController *)self visibleCoverSourceByIndex];
  }
  uint64_t v8 = (void *)v7;
  NSUInteger v9 = +[NSNumber numberWithInteger:a3];
  NSUInteger v10 = [v8 objectForKeyedSubscript:v9];

  return v10;
}

- (void)_handlePartiallyVisibleCovers
{
  id v3 = [(BCCardStackCoverSourceController *)self horizontalRangeIncludingFake];
  uint64_t v5 = v4;
  id v6 = [(BCCardStackCoverSourceController *)self horizontalRange];
  NSUInteger v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_4E380;
  v14[3] = &unk_2C57C0;
  v14[5] = [(BCCardStackCoverSourceController *)self visibleCardRange];
  v14[6] = v9;
  v14[4] = self;
  v15.NSUInteger location = (NSUInteger)-[BCCardStackCoverSourceController _trimRange:withTest:](self, "_trimRange:withTest:", v3, v5, v14);
  NSUInteger location = v15.location;
  NSUInteger length = v15.length;
  v16.NSUInteger location = (NSUInteger)v6;
  v16.NSUInteger length = v8;
  NSRange v12 = NSUnionRange(v15, v16);
  -[BCCardStackCoverSourceController setHorizontalRangeIncludingFake:](self, "setHorizontalRangeIncludingFake:", v12.location, v12.length);
  id v13 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v6, v8);
  [v13 removeIndexesInRange:location, length];
  [(BCCardStackCoverSourceController *)self setClippedCoverIndexes:v13];
}

- (void)prepareForCoverSourceCapturingWithToViewController:(id)a3 toViewTransform:(CGAffineTransform *)a4 revealCoverBlock:(id)a5 captureCoverFrameBlock:(id)a6
{
  id v10 = a3;
  int64_t v11 = (void (**)(void))a6;
  (*((void (**)(id))a5 + 2))(a5);
  if ([(BCCardStackCoverSourceController *)self preferSlideForDismiss])
  {
    v11[2](v11);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    NSRange v12 = [v10 view];
    id v13 = v12;
    if (v12)
    {
      [v12 transform];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
    }

    long long v14 = *(_OWORD *)&a4->c;
    long long v24 = *(_OWORD *)&a4->a;
    long long v25 = v14;
    long long v26 = *(_OWORD *)&a4->tx;
    NSRange v15 = [v10 view];
    v23[0] = v24;
    v23[1] = v25;
    v23[2] = v26;
    [v15 setTransform:v23];

    v11[2](v11);
    if ([(BCCardStackCoverSourceController *)self canUseCoverTransition])
    {
      NSRange v16 = [(BCCardStackCoverSourceController *)self cardStackViewController];
      id v17 = [v16 view];
      [(BCCardStackCoverSourceController *)self _preserveNeededCoverSourceFramesWithNewReferenceView:v17];
    }
    long long v20 = v27;
    long long v21 = v28;
    long long v22 = v29;
    uint64_t v18 = [v10 view];
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    [v18 setTransform:v19];

    [(BCCardStackCoverSourceController *)self _refreshNeededCoverSources];
  }
}

- (void)_preserveNeededCoverSourceFramesWithNewReferenceView:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCardStackCoverSourceController *)self horizontalRangeIncludingFake];
  NSUInteger v7 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v5, v6);
  NSUInteger v8 = [(BCCardStackCoverSourceController *)self clippedCoverIndexes];
  [v7 removeIndexes:v8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4E68C;
  v10[3] = &unk_2C57E8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v7 enumerateIndexesUsingBlock:v10];
}

- (void)_refreshNeededCoverSources
{
  id v3 = [(BCCardStackCoverSourceController *)self visibleRange];
  id v5 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v3, v4);
  id v6 = [(BCCardStackCoverSourceController *)self horizontalRange];
  [v5 removeIndexesInRange:v6, v7];
  NSUInteger v8 = [(BCCardStackCoverSourceController *)self clippedCoverIndexes];
  [v5 addIndexes:v8];

  id v9 = [(BCCardStackCoverSourceController *)self visibleCoverSourceByIndex];
  id v10 = [v9 mutableCopy];

  NSRange v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_4E804;
  NSRange v15 = &unk_2C57E8;
  NSRange v16 = self;
  id v17 = v10;
  id v11 = v10;
  [v5 enumerateIndexesUsingBlock:&v12];
  -[BCCardStackCoverSourceController setVisibleCoverSourceByIndex:](self, "setVisibleCoverSourceByIndex:", v11, v12, v13, v14, v15, v16);
}

- (void)performSecondHalfOfProcessing
{
  if ([(BCCardStackCoverSourceController *)self isDismiss]
    && (![(BCCardStackCoverSourceController *)self canUseCoverTransition]
     || [(BCCardStackCoverSourceController *)self preferSlideForDismiss]))
  {
    [(BCCardStackCoverSourceController *)self _generateDismissSlideAnimationItems];
  }
  else
  {
    [(BCCardStackCoverSourceController *)self _obtainCardCoverSources];
    [(BCCardStackCoverSourceController *)self _generateAnimationItems];
  }
}

- (id)_placeholderCoverSourceForRelativeCoverFrame:(CGRect)a3 inCardView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v6 = a4;
  [v6 bounds];
  CGPointAdd();
  id v9 = -[BCCardStackTransitioningPlaceholderCoverSource initWithCoverFrame:referenceView:]([BCCardStackTransitioningPlaceholderCoverSource alloc], "initWithCoverFrame:referenceView:", v6, v7, v8, width, height);

  return v9;
}

- (void)_obtainCardCoverSources
{
  int64_t v3 = [(BCCardStackCoverSourceController *)self focusedIndex];
  id v56 = [(BCCardStackCoverSourceController *)self cardSetViewController];
  int64_t v55 = v3;
  uint64_t v4 = [v56 cardViewControllerAtIndex:v3];
  id v5 = [v4 view];
  [v5 layoutIfNeeded];

  v52 = [v4 transitioningCardContent];
  id v6 = [v52 cardStackTransitioningCardContentCoverSource];
  v54 = v4;
  double v7 = [v4 view];
  [v6 cardStackTransitioningCoverSourceFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  NSRange v16 = [v6 cardStackTransitioningCoverSourceReferenceView];
  [v7 convertRect:v16 fromView:v9];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  long long v25 = (char *)[(BCCardStackCoverSourceController *)self _rangeForCoverMove];
  uint64_t v27 = v26;
  long long v28 = (char *)[(BCCardStackCoverSourceController *)self _rangeForCardMove];
  uint64_t v30 = v29;
  double v31 = +[NSMutableDictionary dictionaryWithCapacity:v27];
  CGFloat v32 = +[NSMutableDictionary dictionaryWithCapacity:v30];
  id v53 = objc_alloc_init((Class)NSMutableIndexSet);
  if ((uint64_t)v28 < (uint64_t)&v28[v30])
  {
    do
    {
      double v33 = [v56 cardViewControllerAtIndex:v28];
      CGFloat v34 = +[NSNumber numberWithInteger:v28];
      [v32 setObject:v33 forKeyedSubscript:v34];

      ++v28;
      --v30;
    }
    while (v30);
  }
  double v35 = (char *)v55;
  if ((uint64_t)v25 < (uint64_t)&v25[v27])
  {
    while (v35 == v25)
    {
      id v36 = v6;
LABEL_19:
      v51 = +[NSNumber numberWithInteger:v25];
      [v31 setObject:v36 forKeyedSubscript:v51];

      ++v25;
      if (!--v27) {
        goto LABEL_20;
      }
    }
    double v37 = +[NSNumber numberWithInteger:v25];
    CGFloat v38 = [v32 objectForKeyedSubscript:v37];

    v39 = [v38 transitioningCardContent];
    uint64_t v40 = [v39 cardStackTransitioningCardContentCoverSource];
    if (v40)
    {
      id v36 = (id)v40;
      if (![(BCCardStackCoverSourceController *)self isDismiss]
        || ![v39 visibilityOfCoverSource:v36 ignoringYAxis:0])
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    if ([(BCCardStackCoverSourceController *)self isDismiss])
    {
      v41 = (char *)[(BCCardStackCoverSourceController *)self visibleCardRange];
      if (v25 >= v41 && v25 - v41 < v42) {
        [v53 addIndex:v25];
      }
    }
    if (v38)
    {
      v43 = [v38 view];
      CGRect v44 = self;
      double v45 = v18;
      double v46 = v20;
    }
    else
    {
      [v56 frameForCardAtIndex:v25 inCoordinatesOfCardAtIndex:v35];
      CGPointAdd();
      double v48 = v47;
      double v50 = v49;
      v43 = [v54 view];
      CGRect v44 = self;
      double v45 = v48;
      double v46 = v50;
    }
    -[BCCardStackCoverSourceController _placeholderCoverSourceForRelativeCoverFrame:inCardView:](v44, "_placeholderCoverSourceForRelativeCoverFrame:inCardView:", v43, v45, v46, v22, v24);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    double v35 = (char *)v55;
    goto LABEL_18;
  }
LABEL_20:
  [(BCCardStackCoverSourceController *)self setCardByIndex:v32];
  [(BCCardStackCoverSourceController *)self setCardCoverSourceByIndex:v31];
  [(BCCardStackCoverSourceController *)self setVisibleCardIndexesWithAdjustedCoverSource:v53];
}

- (void)_generateAnimationItems
{
  id v3 = [(BCCardStackCoverSourceController *)self _rangeForCoverMove];
  id v5 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v3, v4);
  id v6 = +[NSMutableArray array];
  double v7 = +[NSMutableArray array];
  int64_t v8 = [(BCCardStackCoverSourceController *)self focusedIndex];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_4EFA4;
  v24[3] = &unk_2C5810;
  id v25 = v6;
  int64_t v26 = v8;
  v24[4] = self;
  id v9 = v6;
  [v5 enumerateIndexesUsingBlock:v24];
  id v10 = [(BCCardStackCoverSourceController *)self _rangeForCardMove];
  double v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v10, v11);
  double v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  double v19 = sub_4F164;
  double v20 = &unk_2C5810;
  id v22 = v7;
  int64_t v23 = v8;
  double v21 = self;
  id v13 = v7;
  [v12 enumerateIndexesUsingBlock:&v17];
  id v14 = [(BCCardStackCoverSourceController *)self _rangeForCoverMove];
  NSRange v16 = -[BCCardStackCoverSourceController _coverFadeItemsExcludingRange:](self, "_coverFadeItemsExcludingRange:", v14, v15);
  [(BCCardStackCoverSourceController *)self setCoverMoveItems:v9];
  [(BCCardStackCoverSourceController *)self setCardMoveItems:v13];
  [(BCCardStackCoverSourceController *)self setCoverFadeItems:v16];
}

- (id)_coverFadeItemsExcludingRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(BCCardStackCoverSourceController *)self visibleRange];
  int64_t v8 = +[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v6, v7);
  [v8 removeIndexesInRange:location, length];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_4F584;
  uint64_t v15 = &unk_2C57E8;
  NSRange v16 = self;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v17;
  [v8 enumerateIndexesUsingBlock:&v12];
  id v10 = [v9 copy:v12, v13, v14, v15, v16];

  return v10;
}

- (void)_generateDismissSlideAnimationItems
{
  id v3 = (char *)[(BCCardStackCoverSourceController *)self visibleCardRange];
  uint64_t v5 = v4;
  id v18 = +[NSMutableArray arrayWithCapacity:v4];
  if ((uint64_t)v3 < (uint64_t)&v3[v5])
  {
    do
    {
      id v6 = +[NSString stringWithFormat:@"%ld-slide", v3];
      uint64_t v7 = [(BCCardStackTransitionAnimationItem *)[BCCardStackTransitionCardSlideAnimationItem alloc] initWithKey:v6];
      [(BCCardStackTransitionCardSlideAnimationItem *)v7 setIsFocusedCard:v3 == (char *)[(BCCardStackCoverSourceController *)self focusedIndex]];
      int64_t v8 = [(BCCardStackCoverSourceController *)self cardSetViewController];
      id v9 = [v8 cardViewControllerAtIndex:v3];
      [(BCCardStackTransitionCardSlideAnimationItem *)v7 setCard:v9];

      [v18 addObject:v7];
      ++v3;
      --v5;
    }
    while (v5);
  }
  id v10 = [(BCCardStackCoverSourceController *)self underlyingCardSetViewController];

  if (v10)
  {
    uint64_t v11 = [(BCCardStackCoverSourceController *)self underlyingCardSetViewController];
    id v12 = [v11 focusedIndex];

    uint64_t v13 = +[NSString stringWithFormat:@"%ld-slide", v12];
    id v14 = [(BCCardStackTransitionAnimationItem *)[BCCardStackTransitionCardSlideAnimationItem alloc] initWithKey:v13];
    uint64_t v15 = [(BCCardStackCoverSourceController *)self underlyingCardSetViewController];
    NSRange v16 = [v15 cardViewControllerAtIndex:v12];
    [(BCCardStackTransitionCardSlideAnimationItem *)v14 setCard:v16];

    [v18 addObject:v14];
  }
  id v17 = -[BCCardStackCoverSourceController _coverFadeItemsExcludingRange:](self, "_coverFadeItemsExcludingRange:", 0, 0);
  [(BCCardStackCoverSourceController *)self setCardSlideItems:v18];
  [(BCCardStackCoverSourceController *)self setCoverFadeItems:v17];
}

- (void)prepareForAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(BCCardStackCoverSourceController *)self _hideVisibleCoverSources];
  if (v3) {
    [(BCCardStackCoverSourceController *)self hideCardCoverSources];
  }
  int64_t v5 = [(BCCardStackCoverSourceController *)self focusedIndex];
  id v6 = [(BCCardStackCoverSourceController *)self cardByIndex];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4F940;
  v7[3] = &unk_2C5838;
  v7[4] = self;
  v7[5] = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_hideVisibleCoverSources
{
  BOOL v3 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  uint64_t v4 = [v3 unhideBlocksByCardSet];
  int64_t v5 = [(BCCardStackCoverSourceController *)self cardSetViewController];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = +[NSMutableDictionary dictionary];
    uint64_t v7 = [(BCCardStackCoverSourceController *)self cardStackViewController];
    int64_t v8 = [v7 unhideBlocksByCardSet];
    id v9 = [(BCCardStackCoverSourceController *)self cardSetViewController];
    [v8 setObject:v6 forKeyedSubscript:v9];
  }
  id v10 = [(BCCardStackCoverSourceController *)self visibleCoverSourceByIndex];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_4FB3C;
  v12[3] = &unk_2C5860;
  id v13 = v6;
  id v11 = v6;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];
}

- (void)hideCardCoverSources
{
  BOOL v3 = [(BCCardStackCoverSourceController *)self cardCoverSourceByIndex];
  uint64_t v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);

  int64_t v5 = [(BCCardStackCoverSourceController *)self cardCoverSourceByIndex];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4FCCC;
  v7[3] = &unk_2C5860;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];

  [(BCCardStackCoverSourceController *)self setCardCoverSourceUnhideBlocksByIndex:v6];
}

- (void)finalizeForAnimation
{
  if ([(BCCardStackCoverSourceController *)self isDismiss])
  {
    if ([(BCCardStackCoverSourceController *)self isDismissingCardStack])
    {
      [(BCCardStackCoverSourceController *)self _unhideAllCoverSources];
    }
    else
    {
      BOOL v3 = [(BCCardStackCoverSourceController *)self cardSetViewController];
      [(BCCardStackCoverSourceController *)self _unhideCoverSourcesForCardSet:v3];
    }
  }
  [(BCCardStackCoverSourceController *)self _unhideCardCoverSources];
  uint64_t v4 = [(BCCardStackCoverSourceController *)self cardByIndex];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4FE20;
  v5[3] = &unk_2C5888;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (BOOL)_hasHiddenCoverSourcesForCardSet:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  id v6 = [v5 unhideBlocksByCardSet];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  return v7 != 0;
}

- (void)_unhideAllCoverSources
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v3 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  id v4 = [v3 unhideBlocksByCardSet];
  int64_t v5 = [v4 objectEnumerator];

  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v9);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [v10 allValues];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * (void)v15) + 16))();
              uint64_t v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v13);
        }

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  NSRange v16 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  id v17 = [v16 unhideBlocksByCardSet];
  [v17 removeAllObjects];
}

- (void)_unhideCoverSourcesForCardSet:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  id v6 = [v5 unhideBlocksByCardSet];
  id v7 = [v6 objectForKeyedSubscript:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v12) + 16))();
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  id v13 = [(BCCardStackCoverSourceController *)self cardStackViewController];
  uint64_t v14 = [v13 unhideBlocksByCardSet];
  [v14 setObject:0 forKeyedSubscript:v4];
}

- (void)_unhideCardCoverSources
{
  id v2 = [(BCCardStackCoverSourceController *)self cardCoverSourceUnhideBlocksByIndex];
  [v2 enumerateKeysAndObjectsUsingBlock:&stru_2C58C8];
}

- (BOOL)preferSlideForDismiss
{
  return self->_preferSlideForDismiss;
}

- (void)setPreferSlideForDismiss:(BOOL)a3
{
  self->_preferSlideForDismiss = a3;
}

- (BOOL)coversNeedClipping
{
  return self->_coversNeedClipping;
}

- (void)setCoversNeedClipping:(BOOL)a3
{
  self->_coversNeedClipping = a3;
}

- (BOOL)coversAreInNonHorizontalLayout
{
  return self->_coversAreInNonHorizontalLayout;
}

- (void)setCoversAreInNonHorizontalLayout:(BOOL)a3
{
  self->_coversAreInNonHorizontalLayout = a3;
}

- (BCCardSetViewController)underlyingCardSetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingCardSetViewController);

  return (BCCardSetViewController *)WeakRetained;
}

- (void)setUnderlyingCardSetViewController:(id)a3
{
}

- (BOOL)isDismissingCardStack
{
  return self->_isDismissingCardStack;
}

- (void)setIsDismissingCardStack:(BOOL)a3
{
  self->_isDismissingCardStack = a3;
}

- (NSArray)coverMoveItems
{
  return self->_coverMoveItems;
}

- (void)setCoverMoveItems:(id)a3
{
}

- (NSArray)cardMoveItems
{
  return self->_cardMoveItems;
}

- (void)setCardMoveItems:(id)a3
{
}

- (NSArray)coverFadeItems
{
  return self->_coverFadeItems;
}

- (void)setCoverFadeItems:(id)a3
{
}

- (NSArray)cardSlideItems
{
  return self->_cardSlideItems;
}

- (void)setCardSlideItems:(id)a3
{
}

- (BCCardStackViewController)cardStackViewController
{
  return self->_cardStackViewController;
}

- (void)setCardStackViewController:(id)a3
{
}

- (BOOL)isDismiss
{
  return self->_isDismiss;
}

- (BCCardSetViewController)cardSetViewController
{
  return self->_cardSetViewController;
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (BCCardStackViewControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (BCCardStackTransitioningCoverHost)coverHost
{
  return self->_coverHost;
}

- (_NSRange)visibleCardRange
{
  NSUInteger length = self->_visibleCardRange.length;
  NSUInteger location = self->_visibleCardRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setVisibleCardRange:(_NSRange)a3
{
  self->_visibleCardRange = a3;
}

- (int64_t)totalCoverCount
{
  return self->_totalCoverCount;
}

- (void)setTotalCoverCount:(int64_t)a3
{
  self->_totalCoverCount = a3;
}

- (_NSRange)visibleRange
{
  NSUInteger length = self->_visibleRange.length;
  NSUInteger location = self->_visibleRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSDictionary)visibleCoverSourceByIndex
{
  return self->_visibleCoverSourceByIndex;
}

- (void)setVisibleCoverSourceByIndex:(id)a3
{
}

- (_NSRange)horizontalRange
{
  NSUInteger length = self->_horizontalRange.length;
  NSUInteger location = self->_horizontalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setHorizontalRange:(_NSRange)a3
{
  self->_horizontalRange = a3;
}

- (_NSRange)horizontalRangeIncludingFake
{
  NSUInteger length = self->_horizontalRangeIncludingFake.length;
  NSUInteger location = self->_horizontalRangeIncludingFake.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setHorizontalRangeIncludingFake:(_NSRange)a3
{
  self->_horizontalRangeIncludingFake = a3;
}

- (NSDictionary)fakeCoverSourceByIndex
{
  return self->_fakeCoverSourceByIndex;
}

- (void)setFakeCoverSourceByIndex:(id)a3
{
}

- (NSIndexSet)clippedCoverIndexes
{
  return self->_clippedCoverIndexes;
}

- (void)setClippedCoverIndexes:(id)a3
{
}

- (NSDictionary)cardByIndex
{
  return self->_cardByIndex;
}

- (void)setCardByIndex:(id)a3
{
}

- (NSDictionary)cardCoverSourceByIndex
{
  return self->_cardCoverSourceByIndex;
}

- (void)setCardCoverSourceByIndex:(id)a3
{
}

- (NSIndexSet)visibleCardIndexesWithAdjustedCoverSource
{
  return self->_visibleCardIndexesWithAdjustedCoverSource;
}

- (void)setVisibleCardIndexesWithAdjustedCoverSource:(id)a3
{
}

- (NSArray)clippedCoverFlyItems
{
  return self->_clippedCoverFlyItems;
}

- (void)setClippedCoverFlyItems:(id)a3
{
}

- (NSDictionary)cardCoverSourceUnhideBlocksByIndex
{
  return self->_cardCoverSourceUnhideBlocksByIndex;
}

- (void)setCardCoverSourceUnhideBlocksByIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardCoverSourceUnhideBlocksByIndex, 0);
  objc_storeStrong((id *)&self->_clippedCoverFlyItems, 0);
  objc_storeStrong((id *)&self->_visibleCardIndexesWithAdjustedCoverSource, 0);
  objc_storeStrong((id *)&self->_cardCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_cardByIndex, 0);
  objc_storeStrong((id *)&self->_clippedCoverIndexes, 0);
  objc_storeStrong((id *)&self->_fakeCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_visibleCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_coverHost, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cardSetViewController, 0);
  objc_storeStrong((id *)&self->_cardStackViewController, 0);
  objc_storeStrong((id *)&self->_cardSlideItems, 0);
  objc_storeStrong((id *)&self->_coverFadeItems, 0);
  objc_storeStrong((id *)&self->_cardMoveItems, 0);
  objc_storeStrong((id *)&self->_coverMoveItems, 0);

  objc_destroyWeak((id *)&self->_underlyingCardSetViewController);
}

@end