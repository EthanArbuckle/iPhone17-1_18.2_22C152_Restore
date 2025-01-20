@interface BAXWebPageAccessibilityObjectWrapper
+ (Class)baxBaseSafeCategoryClass;
+ (id)BAXLocalizedNumberForNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5;
+ (id)baxTargetClassName;
- (BOOL)_accessibilityIsRTL;
- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3;
- (BOOL)_bkaxIsInteractiveElement:(id)a3;
- (BOOL)_isElementImage:(id)a3;
- (BOOL)_isElementLink:(id)a3;
- (BOOL)_isElementStaticText:(id)a3;
- (BOOL)_isElementVisible:(id)a3 forRootElement:(id)a4;
- (BOOL)_modifySyntheticElement:(id)a3 withRootElement:(id)a4 forInteractiveElements:(id)a5;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (NSArray)_baxCachedAccessibilityElementTree;
- (NSMutableArray)baxStoredVisibleLinkElements;
- (NSMutableArray)baxStoredVisibleLinkInfos;
- (NSNumber)baxStoredHeadingsRotorIndex;
- (NSNumber)baxStoredHighlightRotorIndex;
- (NSNumber)baxStoredLinkRotorIndex;
- (UIAccessibilityCustomRotor)baxStoredHeadingsRotor;
- (UIAccessibilityCustomRotor)baxStoredHighlightRotor;
- (UIAccessibilityCustomRotor)baxStoredLinkRotor;
- (id)_accessibilityInternalTextLinkCustomRotors;
- (id)_accessibilityScrollStatus;
- (id)_axPageScrollString;
- (id)_baxHeadingsRotor;
- (id)_baxHighlightRotor;
- (id)_previousInteractiveElement:(id)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityElements;
- (id)accessibilityHitTest:(CGPoint)a3;
- (id)bkaxAdditionalAXElementsForCurrentPage;
- (int64_t)_baxIsTurningCounter;
- (int64_t)accessibilityContainerType;
- (void)_addInteractiveDescendantsOfElement:(id)a3 toArray:(id)a4 rootElement:(id)a5;
- (void)_appendPageTurnToLastElementIgnoringImages:(BOOL)a3;
- (void)_baxSetCachedAccessibilityElementTree:(id)a3;
- (void)_baxSetIsTurningCounter:(int64_t)a3;
- (void)_dispatchPageScrolledNotification;
- (void)_handlePageTurnTraitForRootElement:(id)a3;
- (void)_handleSyntheticElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7;
- (void)_handleSyntheticImageElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7;
- (void)_linkSubElementForElement:(id)a3;
- (void)_sanitizeCachedElements;
- (void)baxInvalidateCaches;
- (void)baxSetStoredHeadingsRotor:(id)a3;
- (void)baxSetStoredHeadingsRotorIndex:(id)a3;
- (void)baxSetStoredHighlightRotor:(id)a3;
- (void)baxSetStoredHighlightRotorIndex:(id)a3;
- (void)baxSetStoredLinkRotor:(id)a3;
- (void)baxSetStoredLinkRotorIndex:(id)a3;
- (void)baxSetStoredVisibleLinkElements:(id)a3;
- (void)baxSetStoredVisibleLinkInfos:(id)a3;
- (void)postWebAXNotification:(unsigned int)a3 notificationData:(id)a4;
@end

@implementation BAXWebPageAccessibilityObjectWrapper

+ (id)baxTargetClassName
{
  return @"WKAccessibilityWebPageObject";
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)_baxCachedAccessibilityElementTree
{
  return (NSArray *)__BAXGetAssociatedObject(self, &unk_271D8);
}

- (void)_baxSetCachedAccessibilityElementTree:(id)a3
{
}

- (int64_t)_baxIsTurningCounter
{
  return (int64_t)__BAXGetAssociatedInteger(self, &unk_271D9);
}

- (void)_baxSetIsTurningCounter:(int64_t)a3
{
}

- (UIAccessibilityCustomRotor)baxStoredLinkRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_271DA);
}

- (void)baxSetStoredLinkRotor:(id)a3
{
}

- (NSNumber)baxStoredLinkRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_271DB);
}

- (void)baxSetStoredLinkRotorIndex:(id)a3
{
}

- (UIAccessibilityCustomRotor)baxStoredHeadingsRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_271DC);
}

- (void)baxSetStoredHeadingsRotor:(id)a3
{
}

- (NSNumber)baxStoredHeadingsRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_271DD);
}

- (void)baxSetStoredHeadingsRotorIndex:(id)a3
{
}

- (NSMutableArray)baxStoredVisibleLinkInfos
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_271DE);
}

- (void)baxSetStoredVisibleLinkInfos:(id)a3
{
}

- (UIAccessibilityCustomRotor)baxStoredHighlightRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_271DF);
}

- (void)baxSetStoredHighlightRotor:(id)a3
{
}

- (NSNumber)baxStoredHighlightRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_271E0);
}

- (void)baxSetStoredHighlightRotorIndex:(id)a3
{
}

- (NSMutableArray)baxStoredVisibleLinkElements
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_271E1);
}

- (void)baxSetStoredVisibleLinkElements:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  if (BEBooksWebKitAccessibility()) {
    +[BEAccessibilityReadingState registerBookContentWrapper:self];
  }
  v3 = [(BAXWebPageAccessibilityObjectWrapper *)self _iosAccessibilityAttributeValue:2025];
  unsigned int v4 = [v3 BOOLValue];

  if (!v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  return [(BAXWebPageAccessibilityObjectWrapper *)&v6 isAccessibilityElement];
}

- (id)accessibilityElements
{
  +[BEAccessibilityReadingState registerBookContentWrapper:self];
  v3 = +[NSMutableArray array];
  if ((BEBooksWebKitAccessibility() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    unsigned int v4 = [(BAXWebPageAccessibilityObjectWrapper *)&v9 accessibilityElements];
    uint64_t v5 = +[NSMutableArray arrayWithArray:v4];

    v3 = (void *)v5;
  }
  objc_super v6 = [(BAXWebPageAccessibilityObjectWrapper *)self bkaxAdditionalAXElementsForCurrentPage];
  [v3 addObjectsFromArray:v6];

  [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetIsTurningCounter:0];
  id v7 = [v3 copy];

  return v7;
}

- (int64_t)accessibilityContainerType
{
  v3.receiver = self;
  v3.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  return [(BAXWebPageAccessibilityObjectWrapper *)&v3 accessibilityContainerType];
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (BEBooksWebKitAccessibility())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v6 = [(BAXWebPageAccessibilityObjectWrapper *)self bkaxAdditionalAXElementsForCurrentPage];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v11 accessibilityFrame];
          v21.double x = x;
          v21.double y = y;
          if (CGRectContainsPoint(v22, v21))
          {
            id v12 = v11;

            goto LABEL_13;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    -[BAXWebPageAccessibilityObjectWrapper accessibilityHitTest:](&v14, "accessibilityHitTest:", x, y);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v12;
}

- (id)bkaxAdditionalAXElementsForCurrentPage
{
  objc_super v3 = +[NSMutableArray array];
  unsigned int v4 = objc_opt_class();
  v28.receiver = self;
  v28.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
  uint64_t v5 = [(BAXWebPageAccessibilityObjectWrapper *)&v28 accessibilityElements];
  objc_super v6 = [v5 firstObject];
  id v7 = __BAXCastAsSafeCategory(v4, v6, 0, 0);

  if (!v7)
  {
LABEL_20:
    [(BAXWebPageAccessibilityObjectWrapper *)self _handlePageTurnTraitForRootElement:v7];
    v25 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxCachedAccessibilityElementTree];
    id v26 = [v25 copy];

    goto LABEL_21;
  }
  id v8 = +[BEAccessibilityReadingState currentReadingState];
  if ([v8 isPaginated])
  {

LABEL_6:
    uint64_t v11 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxCachedAccessibilityElementTree];
    if (!v11
      || (id v12 = (void *)v11,
          -[BAXWebPageAccessibilityObjectWrapper _baxCachedAccessibilityElementTree](self, "_baxCachedAccessibilityElementTree"), v13 = objc_claimAutoreleasedReturnValue(), id v14 = [v13 count], v13, v12, !v14))
    {
      if ((BEBooksWebKitAccessibility() & 1) == 0) {
        [(BAXWebPageAccessibilityObjectWrapper *)self _accessibilitySetBoolValue:1 forKey:@"CurrentlyFindingInteractiveDescendants"];
      }
      long long v15 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredVisibleLinkInfos];

      if (!v15)
      {
        long long v16 = +[NSMutableArray array];
        [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredVisibleLinkInfos:v16];
      }
      [(BAXWebPageAccessibilityObjectWrapper *)self _addInteractiveDescendantsOfElement:v7 toArray:v3 rootElement:v7];
      if ((BEBooksWebKitAccessibility() & 1) == 0) {
        [(BAXWebPageAccessibilityObjectWrapper *)self _accessibilitySetBoolValue:0 forKey:@"CurrentlyFindingInteractiveDescendants"];
      }
      [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetCachedAccessibilityElementTree:v3];
      long long v17 = +[BEAccessibilityReadingState currentReadingState];
      if ([v17 isPaginated])
      {
      }
      else
      {
        long long v18 = +[BEAccessibilityReadingState currentReadingState];
        unsigned __int8 v19 = [v18 isFixedLayoutBook];

        if ((v19 & 1) == 0) {
          [(BAXWebPageAccessibilityObjectWrapper *)self _sanitizeCachedElements];
        }
      }
    }
    v20 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxCachedAccessibilityElementTree];
    id v21 = [v20 count];

    if (!v21)
    {
      CGRect v22 = [[BAXTextAccessibilityElement alloc] initWithAccessibilityContainer:v7];
      v23 = BAXLocString(@"swipe.hint");
      [(BAXTextAccessibilityElement *)v22 setAccessibilityHint:v23];

      v29 = v22;
      v24 = +[NSArray arrayWithObjects:&v29 count:1];
      [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetCachedAccessibilityElementTree:v24];
    }
    goto LABEL_20;
  }
  uint64_t v9 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v10 = [v9 isFixedLayoutBook];

  if (v10) {
    goto LABEL_6;
  }
  [v7 accessibilityVisibleContentRect];
  if (CGRectGetMaxY(v31) >= 0.0) {
    goto LABEL_6;
  }
  id v26 = &__NSArray0__struct;
LABEL_21:

  return v26;
}

- (void)_sanitizeCachedElements
{
  objc_super v3 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unsigned int v4 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxCachedAccessibilityElementTree];
  id v5 = [v4 copy];

  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v10 accessibilityFrame];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        unsigned __int8 v19 = +[BEAccessibilityReadingState currentReadingState];
        CGFloat v20 = (double)(uint64_t)[v19 screenHeight];

        id v21 = +[BEAccessibilityReadingState currentReadingState];
        CGFloat v22 = (double)(uint64_t)[v21 screenWidth];

        v28.origin.double x = 0.0;
        v28.origin.double y = 0.0;
        v28.size.width = v22;
        v28.size.height = v20;
        v29.origin.double x = v12;
        v29.origin.double y = v14;
        v29.size.width = v16;
        v29.size.height = v18;
        if (CGRectIntersectsRect(v28, v29)) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetCachedAccessibilityElementTree:v3];
}

- (void)_appendPageTurnToLastElementIgnoringImages:(BOOL)a3
{
  BOOL v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v4 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxCachedAccessibilityElementTree];
  id v5 = [v4 reverseObjectEnumerator];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v3)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        [v10 setAccessibilityTraits:[v10 accessibilityTraits] | UIAccessibilityTraitCausesPageTurn];
        goto LABEL_12;
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)_addInteractiveDescendantsOfElement:(id)a3 toArray:(id)a4 rootElement:(id)a5
{
  id v81 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = (char *)[v81 accessibilityElementCount];
  if (v10)
  {
    long long v11 = v10;
    char v77 = 0;
    long long v12 = 0;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    do
    {
      CGFloat v16 = objc_opt_class();
      double v17 = [v81 accessibilityElementAtIndex:v12];
      CGFloat v18 = __BAXCastAsSafeCategory(v16, v17, 0, 0);

      if (v18)
      {
        if (!BEBooksWebKitAccessibility())
        {
          if ([(BAXWebPageAccessibilityObjectWrapper *)self _bkaxIsInteractiveElement:v18])
          {
            [v9 accessibilityVisibleContentRect];
            CGFloat v28 = v27;
            CGFloat v30 = v29;
            CGFloat v32 = v31;
            CGFloat v34 = v33;
            [v18 accessibilityFrame];
            v83.CGFloat x = v35;
            v83.CGFloat y = v36;
            v84.origin.CGFloat x = v28;
            v84.origin.CGFloat y = v30;
            v84.size.CGFloat width = v32;
            v84.size.CGFloat height = v34;
            if (CGRectContainsPoint(v84, v83))
            {
              if (![(BAXWebPageAccessibilityObjectWrapper *)self _isElementImage:v18])
              {
                v37 = +[BEAccessibilityReadingState currentReadingState];
                unsigned int v38 = [v37 isFixedLayoutBook];

                if (!v38) {
                  goto LABEL_22;
                }
              }
              v39 = [v18 accessibilityAttributedValue];
              [v18 accessibilityFrame];
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v18, v39, v8, v9);
            }
          }
LABEL_43:
          [(BAXWebPageAccessibilityObjectWrapper *)self _addInteractiveDescendantsOfElement:v18 toArray:v8 rootElement:v9];
          goto LABEL_44;
        }
        if (!-[BAXWebPageAccessibilityObjectWrapper _isElementVisible:forRootElement:](self, "_isElementVisible:forRootElement:", v18, v9)|| ![v18 isAccessibilityElement])
        {
          goto LABEL_43;
        }
        [v18 accessibilityFrame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        if ([(BAXWebPageAccessibilityObjectWrapper *)self _isElementLink:v18]) {
          [(BAXWebPageAccessibilityObjectWrapper *)self _linkSubElementForElement:v81];
        }
        if (![(BAXWebPageAccessibilityObjectWrapper *)self _isElementStaticText:v18])
        {
          if (([v8 containsObject:v18] & 1) == 0)
          {
            if ([(BAXWebPageAccessibilityObjectWrapper *)self _isElementImage:v18]
              || (+[BEAccessibilityReadingState currentReadingState](BEAccessibilityReadingState, "currentReadingState"), v40 = objc_claimAutoreleasedReturnValue(), unsigned int v41 = [v40 isFixedLayoutBook], v40, v41))
            {
              v42 = [v18 accessibilityLabel];
              id v43 = objc_alloc((Class)NSAttributedString);
              id v44 = v8;
              if (v42) {
                [v18 accessibilityLabel];
              }
              else {
              v73 = BAXLocString(@"image");
              }
              id v74 = [v43 initWithString:v73];

              [v18 accessibilityFrame];
              id v8 = v44;
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticImageElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v18, v74, v44, v9);

              goto LABEL_43;
            }
LABEL_22:
            [v8 addObject:v18];
          }
          goto LABEL_43;
        }
        if ((v77 & 1) == 0)
        {
          if (v11 == (unsigned char *)&dword_0 + 1)
          {
            v45 = [v8 lastObject];
            if (![(BAXWebPageAccessibilityObjectWrapper *)self _isElementLink:v18]) {
              goto LABEL_39;
            }
            [v18 accessibilityFrame];
            CGFloat v78 = v47;
            CGFloat v79 = v46;
            CGFloat v75 = v49;
            CGFloat v76 = v48;
            [v45 accessibilityFrame];
            v89.origin.CGFloat x = v50;
            v89.origin.CGFloat y = v51;
            v89.size.CGFloat width = v52;
            v89.size.CGFloat height = v53;
            v85.origin.CGFloat y = v78;
            v85.origin.CGFloat x = v79;
            v85.size.CGFloat height = v75;
            v85.size.CGFloat width = v76;
            if (CGRectIntersectsRect(v85, v89))
            {
              [(BAXWebPageAccessibilityObjectWrapper *)self _linkSubElementForElement:v18];
            }
            else
            {
LABEL_39:
              v72 = [v18 accessibilityAttributedValue];
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v18, v72, v8, v9, v20, v22, v24, v26);
            }
            char v77 = 0;
          }
          else
          {
            id v80 = v8;
            v54 = [v18 accessibilityLabel];
            id v55 = [v54 mutableCopy];

            for (uint64_t i = 1; (char *)i != v11; ++i)
            {
              v57 = objc_opt_class();
              v58 = [v81 accessibilityElementAtIndex:i];
              v59 = __BAXCastAsSafeCategory(v57, v58, 0, 0);

              if ([(BAXWebPageAccessibilityObjectWrapper *)self _isElementStaticText:v59])
              {
                v60 = [v59 accessibilityLabel];
                if (v60) {
                  [v55 appendString:v60];
                }
                v86.origin.CGFloat x = v20;
                v86.origin.CGFloat y = v22;
                v86.size.CGFloat width = v24;
                v86.size.CGFloat height = v26;
                v90.origin.CGFloat x = CGRectZero.origin.x;
                v90.origin.CGFloat y = y;
                v90.size.CGFloat width = width;
                v90.size.CGFloat height = height;
                BOOL v61 = CGRectEqualToRect(v86, v90);
                [v59 accessibilityFrame];
                CGFloat x = v62;
                CGFloat v65 = v64;
                CGFloat v67 = v66;
                CGFloat v69 = v68;
                if (!v61)
                {
                  v87.origin.CGFloat x = v20;
                  v87.origin.CGFloat y = v22;
                  v87.size.CGFloat width = v24;
                  v87.size.CGFloat height = v26;
                  CGRect v88 = CGRectUnion(v87, *(CGRect *)&x);
                  CGFloat x = v88.origin.x;
                  CGFloat v65 = v88.origin.y;
                  CGFloat v67 = v88.size.width;
                  CGFloat v69 = v88.size.height;
                }
                double v26 = v69;
                double v24 = v67;
                double v22 = v65;
                double v20 = x;
              }
              else
              {
                id v70 = [objc_alloc((Class)NSAttributedString) initWithString:v55];
                -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v81, v70, v80, v9, v20, v22, v24, v26);

                v60 = v55;
                id v55 = [objc_alloc((Class)NSMutableString) initWithString:&stru_20BB8];
                double v26 = height;
                double v24 = width;
                double v22 = y;
                double v20 = CGRectZero.origin.x;
              }
            }
            id v8 = v80;
            if ([v55 length])
            {
              id v71 = [objc_alloc((Class)NSAttributedString) initWithString:v55];
              -[BAXWebPageAccessibilityObjectWrapper _handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:](self, "_handleSyntheticElementFor:attributedValue:accessibilityFrame:interactiveElements:rootElement:", v81, v71, v80, v9, v20, v22, v24, v26);
            }
            char v77 = 1;
          }
          goto LABEL_43;
        }
        char v77 = 1;
      }
LABEL_44:

      ++v12;
    }
    while (v12 != v11);
  }
}

- (void)baxInvalidateCaches
{
  if (BEBooksWebKitAccessibility())
  {
    [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetCachedAccessibilityElementTree:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetIsTurningCounter:(char *)[(BAXWebPageAccessibilityObjectWrapper *)self _baxIsTurningCounter] - 1];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredLinkRotor:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHighlightRotor:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHighlightRotorIndex:&off_21868];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredVisibleLinkInfos:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredLinkRotorIndex:&off_21868];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHeadingsRotor:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHeadingsRotorIndex:&off_21868];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredVisibleLinkElements:0];
    [(BAXWebPageAccessibilityObjectWrapper *)self _dispatchPageScrolledNotification];
  }
}

- (void)_handlePageTurnTraitForRootElement:(id)a3
{
  id v10 = a3;
  unsigned int v4 = +[BEAccessibilityReadingState currentReadingState];
  unsigned int v5 = [v4 isSpreadWithChapterBoundary];

  if (!v5 || ([v10 accessibilityFrame], v6 != 0.0))
  {
LABEL_5:
    [(BAXWebPageAccessibilityObjectWrapper *)self _appendPageTurnToLastElementIgnoringImages:AXRequestingClient() == 11];
    goto LABEL_6;
  }
  id v7 = +[BEAccessibilityReadingState currentReadingState];
  if ([v7 isRTL])
  {
    [v10 accessibilityFrame];
    double v9 = v8;

    if (v9 != 0.0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

LABEL_6:
}

- (BOOL)_bkaxIsInteractiveElement:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_getAssociatedObject(v3, [@"StoredIsInteractiveElement" hash]);
  unsigned int v5 = v4;
  if (v4)
  {
    LOBYTE(v6) = [v4 BOOLValue];
  }
  else
  {
    if ([v3 isAccessibilityElement]) {
      id v6 = [v3 baxElementIsInteractive];
    }
    else {
      id v6 = 0;
    }
    id v7 = +[NSNumber numberWithBool:v6];
    id v8 = v3;
    objc_setAssociatedObject(v8, [@"StoredIsInteractiveElement" hash], v7, (char *)&dword_0 + 1);
  }
  return (char)v6;
}

- (void)_linkSubElementForElement:(id)a3
{
  id v4 = a3;
  id v8 = [objc_alloc((Class)UIAccessibilityLinkSubelement) initWithAccessibilityContainer:v4];
  unsigned int v5 = [v4 accessibilityLabel];
  [v8 setAccessibilityLabel:v5];

  id v6 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredVisibleLinkInfos];
  [v6 addObject:v8];

  id v7 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredVisibleLinkElements];
  [v7 addObject:v4];
}

- (BOOL)_isElementLink:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 accessibilityTraits];
  return (UIAccessibilityTraitLink & ~v3) == 0;
}

- (BOOL)_isElementImage:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 accessibilityTraits];
  return (UIAccessibilityTraitImage & ~v3) == 0;
}

- (BOOL)_isElementStaticText:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 accessibilityTraits];
  return (UIAccessibilityTraitStaticText & ~v3) == 0;
}

- (id)_previousInteractiveElement:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [v3 reverseObjectEnumerator];
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_modifySyntheticElement:(id)a3 withRootElement:(id)a4 forInteractiveElements:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    [v7 trimElementSpanningPageBoundary];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          CGFloat v16 = [v15 accessibilityValue:(void)v33];
          double v17 = [v7 accessibilityValue];
          if ([v16 isEqualToString:v17])
          {
            [v15 accessibilityFrame];
            CGFloat v19 = v18;
            CGFloat v21 = v20;
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            [v7 accessibilityFrame];
            v39.origin.CGFloat x = v26;
            v39.origin.CGFloat y = v27;
            v39.size.CGFloat width = v28;
            v39.size.CGFloat height = v29;
            v38.origin.CGFloat x = v19;
            v38.origin.CGFloat y = v21;
            v38.size.CGFloat width = v23;
            v38.size.CGFloat height = v25;
            BOOL v30 = CGRectEqualToRect(v38, v39);

            if (v30)
            {

              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    [v10 addObject:v7];
    BOOL v31 = 1;
  }
  else
  {
LABEL_14:
    BOOL v31 = 0;
  }

  return v31;
}

- (void)_handleSyntheticElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v39 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if ([v16 count])
  {
    for (unint64_t i = 0; (unint64_t)[v16 count] > i; ++i)
    {
      CGFloat v19 = [v16 objectAtIndexedSubscript:i];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        CGFloat v21 = [v16 objectAtIndexedSubscript:i];
        if ([(BAXWebPageAccessibilityObjectWrapper *)self _isElementLink:v39])
        {
          double v22 = [v39 accessibilityLabel];
          CGFloat v23 = [v21 accessibilityLabel];
          if ([v22 isEqualToString:v23])
          {
            [v39 accessibilityFrame];
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            [v21 accessibilityFrame];
            v42.origin.double x = v32;
            v42.origin.double y = v33;
            v42.size.double width = v34;
            v42.size.double height = v35;
            v41.origin.double x = v25;
            v41.origin.double y = v27;
            v41.size.double width = v29;
            v41.size.double height = v31;
            BOOL v36 = CGRectEqualToRect(v41, v42);

            if (v36) {
              goto LABEL_14;
            }
            continue;
          }
        }
      }
    }
  }
  v37 = -[BAXTextAccessibilityElement initWithReferenceElement:container:attributedValue:accessibilityFrame:]([BAXTextAccessibilityElement alloc], "initWithReferenceElement:container:attributedValue:accessibilityFrame:", v39, self, v15, x, y, width, height);
  if ([(BAXWebPageAccessibilityObjectWrapper *)self _modifySyntheticElement:v37 withRootElement:v17 forInteractiveElements:v16])
  {
    CGRect v38 = [(BAXWebPageAccessibilityObjectWrapper *)self _previousInteractiveElement:v16];
    [(BAXTextAccessibilityElement *)v37 setPreviousNavigableElement:v38];
    [v38 setNextNavigableElement:v37];
  }
LABEL_14:
}

- (void)_handleSyntheticImageElementFor:(id)a3 attributedValue:(id)a4 accessibilityFrame:(CGRect)a5 interactiveElements:(id)a6 rootElement:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  double v18 = -[BAXTextAccessibilityElement initWithReferenceElement:container:attributedValue:accessibilityFrame:]([BAXTextAccessibilityElement alloc], "initWithReferenceElement:container:attributedValue:accessibilityFrame:", v16, self, v15, x, y, width, height);

  [v14 addObject:v18];
  id v17 = [(BAXWebPageAccessibilityObjectWrapper *)self _previousInteractiveElement:v14];

  [(BAXTextAccessibilityElement *)v18 setPreviousNavigableElement:v17];
  [v17 setNextNavigableElement:v18];
}

- (BOOL)_isElementVisible:(id)a3 forRootElement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 _accessibilityTextMarkerRange];
  [v6 accessibilityBoundsForTextMarkers:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [v5 accessibilityVisibleContentRect];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v25.origin.double x = v17;
  v25.origin.double y = v19;
  v25.size.double width = v21;
  v25.size.double height = v23;
  v26.origin.double x = v9;
  v26.origin.double y = v11;
  v26.size.double width = v13;
  v26.size.double height = v15;
  LOBYTE(v6) = CGRectIntersectsRect(v25, v26);

  return (char)v6;
}

- (id)accessibilityCustomActions
{
  if (BEBooksWebKitAccessibility())
  {
    id v3 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    id v4 = +[NSMutableArray array];
    id v5 = +[BEAccessibilityReadingState currentReadingState];
    unsigned int v6 = [v5 isVisiblePageBookmarked];
    id v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    if (v6) {
      double v8 = @"unbookmark.page";
    }
    else {
      double v8 = @"bookmark.page";
    }
    if (v6) {
      CFStringRef v9 = @"bookmark.fill";
    }
    else {
      CFStringRef v9 = @"bookmark";
    }
    double v10 = BAXLocString(v8);
    CGFloat v11 = +[UIImage systemImageNamed:v9 withConfiguration:v3];
    id v12 = [v7 initWithName:v10 image:v11 actionHandler:&stru_20658];

    [v4 addObject:v12];
    unsigned int v13 = [v5 hasVisibleControls];
    id v14 = objc_alloc((Class)UIAccessibilityCustomAction);
    if (v13) {
      CGFloat v15 = @"hide.controls";
    }
    else {
      CGFloat v15 = @"show.controls";
    }
    if (v13) {
      CFStringRef v16 = @"eye.slash";
    }
    else {
      CFStringRef v16 = @"eye";
    }
    CGFloat v17 = BAXLocString(v15);
    double v18 = +[UIImage systemImageNamed:v16 withConfiguration:v3];
    id v19 = [v14 initWithName:v17 image:v18 actionHandler:&stru_20678];

    [v4 addObject:v19];
    if (UIAccessibilityIsSwitchControlRunning())
    {
      double v20 = +[BEAccessibilityReadingState currentReadingState];
      unsigned int v21 = [v20 isRTL];

      double v22 = @"arrow.left";
      id v42 = v12;
      if (v21) {
        CGFloat v23 = @"arrow.right";
      }
      else {
        CGFloat v23 = @"arrow.left";
      }
      if (!v21) {
        double v22 = @"arrow.right";
      }
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_5A84;
      v45[3] = &unk_206A0;
      if (v21) {
        uint64_t v24 = 5;
      }
      else {
        uint64_t v24 = 6;
      }
      if (v21) {
        uint64_t v25 = 6;
      }
      else {
        uint64_t v25 = 5;
      }
      v45[4] = self;
      v45[5] = v24;
      CGRect v26 = v22;
      CGFloat v27 = v23;
      id v41 = v19;
      double v28 = objc_retainBlock(v45);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_5AA8;
      v44[3] = &unk_206A0;
      v44[4] = self;
      v44[5] = v25;
      v40 = objc_retainBlock(v44);
      id v29 = objc_alloc((Class)UIAccessibilityCustomAction);
      double v30 = BAXLocString(@"turn.to.previous.page.action");
      CGFloat v31 = +[UIImage systemImageNamed:v27 withConfiguration:v3];

      id v32 = [v29 initWithName:v30 image:v31 actionHandler:v28];
      id v33 = objc_alloc((Class)UIAccessibilityCustomAction);
      CGFloat v34 = BAXLocString(@"turn.to.next.page.action");
      CGFloat v35 = +[UIImage systemImageNamed:v26 withConfiguration:v3];

      id v36 = [v33 initWithName:v34 image:v35 actionHandler:v40];
      v46[0] = v32;
      v46[1] = v36;
      v37 = +[NSArray arrayWithObjects:v46 count:2];
      [v4 addObjectsFromArray:v37];

      id v12 = v42;
      id v19 = v41;
    }
    id v38 = [v4 copy];
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    id v38 = [(BAXWebPageAccessibilityObjectWrapper *)&v43 accessibilityCustomActions];
  }

  return v38;
}

- (id)accessibilityCustomRotors
{
  id v3 = +[NSMutableArray array];
  id v4 = [(BAXWebPageAccessibilityObjectWrapper *)self _accessibilityInternalTextLinkCustomRotors];

  if (v4)
  {
    id v5 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredLinkRotor];
    [v3 addObject:v5];
  }
  unsigned int v6 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxHighlightRotor];

  if (v6)
  {
    id v7 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredHighlightRotor];
    [v3 addObject:v7];
  }
  double v8 = [(BAXWebPageAccessibilityObjectWrapper *)self _baxHeadingsRotor];

  if (v8)
  {
    CFStringRef v9 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredHeadingsRotor];
    [v3 addObject:v9];
  }
  if ([v3 count]) {
    id v10 = [v3 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)_baxHeadingsRotor
{
  id v3 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredHeadingsRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5D10;
    v6[3] = &unk_206C8;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    id v3 = [v4 initWithSystemType:3 itemSearchBlock:v6];
    [v3 setVisibleInTouchRotor:1];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHeadingsRotor:v3];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)_baxHighlightRotor
{
  id v3 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredHighlightRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    id v5 = BAXLocString(@"highlights");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_60B0;
    v7[3] = &unk_206C8;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    id v3 = [v4 initWithName:v5 itemSearchBlock:v7];

    [v3 setVisibleInTouchRotor:1];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredHighlightRotor:v3];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  if (!BEBooksWebKitAccessibility())
  {
    v8.receiver = self;
    v8.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    id v5 = [(BAXWebPageAccessibilityObjectWrapper *)&v8 _accessibilityInternalTextLinkCustomRotors];
    goto LABEL_10;
  }
  id v3 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredVisibleLinkInfos];
  if (![v3 count]) {
    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  id v4 = [(BAXWebPageAccessibilityObjectWrapper *)self baxStoredLinkRotor];
  if (!v4)
  {
    id v6 = objc_alloc((Class)UIAccessibilityCustomRotor);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_65BC;
    v9[3] = &unk_206C8;
    objc_copyWeak(&v11, &location);
    id v10 = v3;
    id v4 = [v6 initWithSystemType:1 itemSearchBlock:v9];
    [(BAXWebPageAccessibilityObjectWrapper *)self baxSetStoredLinkRotor:v4];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    if (v4) {
      goto LABEL_7;
    }
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  objc_destroyWeak(&location);
LABEL_7:
  id v13 = v4;
  id v5 = +[NSArray arrayWithObjects:&v13 count:1];

LABEL_9:
LABEL_10:

  return v5;
}

- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3
{
  int v5 = BEBooksWebKitAccessibility();
  if (v5)
  {
    if (a3 == 6)
    {
      LOBYTE(v5) = -[BAXWebPageAccessibilityObjectWrapper accessibilityScroll:](&v7, "accessibilityScroll:", 3, self, BAXWebPageAccessibilityObjectWrapper, v8.receiver, v8.super_class);
    }
    else if (a3 == 5)
    {
      LOBYTE(v5) = -[BAXWebPageAccessibilityObjectWrapper accessibilityScroll:](&v8, "accessibilityScroll:", 4, v7.receiver, v7.super_class, self, BAXWebPageAccessibilityObjectWrapper);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5 = BEBooksWebKitAccessibility();
  if (v5)
  {
    id v6 = +[BEAccessibilityReadingState currentReadingState];
    if ([v6 bookLayout] == (char *)&dword_0 + 2)
    {
    }
    else
    {
      objc_super v7 = +[BEAccessibilityReadingState currentReadingState];
      objc_super v8 = (char *)[v7 bookLayout];

      if (v8 != (unsigned char *)&dword_0 + 3)
      {
        CFStringRef v9 = +[BEAccessibilityReadingState currentReadingState];
        unsigned int v10 = [v9 isRTL];

        if (a3 == 1)
        {
LABEL_14:
          CFStringRef v11 = @"previous";
          goto LABEL_23;
        }
        if (a3 != 2)
        {
          if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
          {
            CFStringRef v12 = @"next";
            CFStringRef v13 = @"previous";
          }
          else
          {
            if (a3 != 6 && a3 != 3) {
              goto LABEL_24;
            }
            CFStringRef v12 = @"previous";
            CFStringRef v13 = @"next";
          }
          if (v10) {
            CFStringRef v11 = v13;
          }
          else {
            CFStringRef v11 = v12;
          }
          goto LABEL_23;
        }
LABEL_13:
        CFStringRef v11 = @"next";
LABEL_23:
        +[BEAXWebContentUtilities turnPageWithDirection:v11];
LABEL_24:
        [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetIsTurningCounter:(char *)[(BAXWebPageAccessibilityObjectWrapper *)self _baxIsTurningCounter] + 1];
        [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetCachedAccessibilityElementTree:0];
        return v5;
      }
    }
    v15.receiver = self;
    v15.super_class = (Class)BAXWebPageAccessibilityObjectWrapper;
    if ([(BAXWebPageAccessibilityObjectWrapper *)&v15 accessibilityScroll:a3]
      || [(BAXWebPageAccessibilityObjectWrapper *)self _accessibilityScrollWithDirection:a3]|| (unint64_t)a3 > 6)
    {
      goto LABEL_24;
    }
    if (((1 << a3) & 0x34) == 0)
    {
      if (((1 << a3) & 0x4A) == 0) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  return v5;
}

- (void)_dispatchPageScrolledNotification
{
  if ([(BAXWebPageAccessibilityObjectWrapper *)self _baxIsTurningCounter] <= 0)
  {
    uint64_t v3 = UIAccessibilityPageScrolledNotification;
    id v4 = [(BAXWebPageAccessibilityObjectWrapper *)self _axPageScrollString];
    int v5 = [v4 string];
    [(BAXWebPageAccessibilityObjectWrapper *)self postWebAXNotification:v3 notificationData:v5];

    [(BAXWebPageAccessibilityObjectWrapper *)self _baxSetIsTurningCounter:0];
  }
}

- (void)postWebAXNotification:(unsigned int)a3 notificationData:(id)a4
{
  id v6 = a4;
  objc_super v7 = +[BEAccessibilityReadingState currentReadingState];
  if (([v7 delayForDocumentChanged] & 1) == 0)
  {
    objc_super v8 = +[BEAccessibilityReadingState currentReadingState];
    [v8 newDocumentFinishedLoading];
  }
  dispatch_time_t v9 = dispatch_time(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6C2C;
  block[3] = &unk_20730;
  block[4] = self;
  id v12 = v6;
  unsigned int v13 = a3;
  id v10 = v6;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_accessibilityScrollStatus
{
  uint64_t v3 = +[BEAccessibilityReadingState currentReadingState];
  id v4 = [v3 pageCount];

  int v5 = +[BEAccessibilityReadingState currentReadingState];
  id v6 = [v5 currentPageNumber];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v7 = BAXLocString(@"loading.book");
  }
  else
  {
    objc_super v8 = BAXLocString(@"page.num.of %@ %@");
    dispatch_time_t v9 = +[NSNumber numberWithInteger:v6];
    id v10 = +[BAXWebPageAccessibilityObjectWrapper BAXLocalizedNumberForNumber:v9 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:0];
    CFStringRef v11 = +[NSNumber numberWithUnsignedInteger:v4];
    id v12 = +[BAXWebPageAccessibilityObjectWrapper BAXLocalizedNumberForNumber:v11 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:0];
    unsigned int v13 = [(BAXWebPageAccessibilityObjectWrapper *)self _axPageScrollString];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10, v12, v13);
    objc_super v7 = __BAXStringForVariables(v14, v15, v16, v17, v18, v19, v20, v21, @"__BAXStringForVariablesSentinel");
  }

  return v7;
}

+ (id)BAXLocalizedNumberForNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  dispatch_time_t v9 = [v8 stringFromNumber:v7];

  return v9;
}

- (id)_axPageScrollString
{
  v2 = +[BEAccessibilityReadingState currentReadingState];
  uint64_t v3 = [v2 visibleAnnotations];

  id v4 = [v3 count];
  int v5 = +[BEAccessibilityReadingState currentReadingState];
  id v6 = [v5 pageCount];

  id v7 = +[BEAccessibilityReadingState currentReadingState];
  id v8 = [v7 currentPage];
  uint64_t v10 = v9;

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = +[BEAccessibilityReadingState currentReadingState];
    id v8 = [v12 currentPageNumber];
  }
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v6 == 0)
  {
    uint64_t v15 = BAXLocString(@"page.num.of.loading");
    if (!v4) {
      goto LABEL_19;
    }
  }
  else
  {
    id v14 = BAXLocString(@"page.num.of.with.total.single %lu %lu");
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8, v6);

    if (!v4) {
      goto LABEL_19;
    }
  }
  uint64_t v16 = BAXLocString(@"%lu note(s)");
  if (v16)
  {
    uint64_t v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v4);
    __BAXStringForVariables(0, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

LABEL_19:
  uint64_t v25 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v26 = [v25 isVisiblePageBookmarked];

  if (v26)
  {
    CGFloat v27 = BAXLocString(@"has.bookmark");
    uint64_t v35 = __BAXStringForVariables(v4, v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);

    id v4 = (id)v35;
  }
  id v36 = objc_alloc((Class)NSMutableAttributedString);
  uint64_t v44 = __BAXStringForVariables(v15, v37, v38, v39, v40, v41, v42, v43, (uint64_t)v4);
  v45 = (void *)v44;
  if (v44) {
    CFStringRef v46 = (const __CFString *)v44;
  }
  else {
    CFStringRef v46 = &stru_20BB8;
  }
  CFStringRef v50 = @"UIAccessibilityTokenLowPitch";
  CFBooleanRef v51 = kCFBooleanTrue;
  double v47 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  id v48 = [v36 initWithString:v46 attributes:v47];

  return v48;
}

- (BOOL)_accessibilityIsRTL
{
  v2 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v3 = [v2 isRTL];

  return v3;
}

@end