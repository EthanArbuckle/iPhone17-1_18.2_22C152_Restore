@interface BAXObjectWrapper
+ (Class)baxBaseSafeCategoryClass;
+ (id)BAXLocalizedNumberForNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5;
+ (id)baxTargetClassName;
- (BEAttachmentElement)_baxCachedAttachmentElement;
- (BEAttachmentElement)baxAttachmentElement;
- (BOOL)_accessibilityIsRTL;
- (BOOL)_accessibilityPublicCustomRotorVisibleInTouchRotor:(id)a3;
- (BOOL)_accessibilityReadAllContinuesWithScroll;
- (BOOL)_accessibilityScrollNextPage;
- (BOOL)_accessibilityScrollPreviousPage;
- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (BOOL)_baxIsTurning;
- (BOOL)_elementContainsImageForSpeakScreen:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilitySupportsTextSelection;
- (BOOL)baxElementIsInteractive;
- (BOOL)baxIsBookContentElement;
- (BOOL)baxIsInPictureBook;
- (BOOL)baxIsInTableOfContents;
- (BOOL)baxNeedsAttachmentElement;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)_accessibilityFrameForRange:(_NSRange)a3;
- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3;
- (CGRect)baxBoundsForRange:(_NSRange)a3;
- (NSArray)baxStoredLineInfos;
- (NSAttributedString)baxRawAttributedString;
- (NSAttributedString)baxStoredAttributedPageContent;
- (NSMutableArray)baxStoredLinkInfos;
- (NSNumber)baxStoredHighlightRotorIndex;
- (NSNumber)baxStoredLinkRotorIndex;
- (NSTimer)_baxIsSettingSelectionTimer;
- (UIAccessibilityCustomRotor)baxStoredHighlightRotor;
- (UIAccessibilityCustomRotor)baxStoredLinkRotor;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)baxStoredVisibleContentRange;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityInternalTextLinkCustomRotors;
- (id)_accessibilityInternalTextLinks;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilitySupportsReadingContent;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5;
- (id)_axPageScrollString;
- (id)_baxHighlightRotor;
- (id)_bkaxSuperAccessibilityContainer;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3;
- (id)accessibilityAttributedPageContent;
- (id)accessibilityAttributedValue;
- (id)accessibilityContainer;
- (id)accessibilityContentForLineNumber:(int64_t)a3;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityLanguage;
- (id)accessibilityPageContent;
- (id)accessibilityTextualContext;
- (id)accessibilityValue;
- (id)baxBookContentElement;
- (id)baxHighlightInfos;
- (id)baxVisibleLineInfos;
- (id)baxWebPageObject;
- (id)description;
- (id)rects;
- (id)text;
- (id)visibleLinkElements:(id)a3;
- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_baxSetCachedAttachmentElement:(id)a3;
- (void)_baxSetIsSettingSelectionTimer:(id)a3;
- (void)_baxSetIsTurning:(BOOL)a3;
- (void)_dispatchPageScrolledNotification;
- (void)_oldAccessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)baxInvalidateCaches;
- (void)baxInvalidateContainerCaches;
- (void)baxInvalidateLineInfos;
- (void)baxSetStoredAttributedPageContent:(id)a3;
- (void)baxSetStoredHighlightRotor:(id)a3;
- (void)baxSetStoredHighlightRotorIndex:(id)a3;
- (void)baxSetStoredLineInfos:(id)a3;
- (void)baxSetStoredLinkInfos:(id)a3;
- (void)baxSetStoredLinkRotor:(id)a3;
- (void)baxSetStoredLinkRotorIndex:(id)a3;
- (void)baxSetStoredVisibleContentRange:(_NSRange)a3;
- (void)checkActions;
@end

@implementation BAXObjectWrapper

+ (id)baxTargetClassName
{
  return @"WebAccessibilityObjectWrapper";
}

+ (Class)baxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIAccessibilityCustomRotor)baxStoredHighlightRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_271E2);
}

- (void)baxSetStoredHighlightRotor:(id)a3
{
}

- (NSNumber)baxStoredHighlightRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_271E3);
}

- (void)baxSetStoredHighlightRotorIndex:(id)a3
{
}

- (UIAccessibilityCustomRotor)baxStoredLinkRotor
{
  return (UIAccessibilityCustomRotor *)__BAXGetAssociatedObject(self, &unk_271E4);
}

- (void)baxSetStoredLinkRotor:(id)a3
{
}

- (NSMutableArray)baxStoredLinkInfos
{
  return (NSMutableArray *)__BAXGetAssociatedObject(self, &unk_271E5);
}

- (void)baxSetStoredLinkInfos:(id)a3
{
}

- (NSNumber)baxStoredLinkRotorIndex
{
  return (NSNumber *)__BAXGetAssociatedObject(self, &unk_271E6);
}

- (void)baxSetStoredLinkRotorIndex:(id)a3
{
}

- (NSArray)baxStoredLineInfos
{
  return (NSArray *)__BAXGetAssociatedObject(self, &unk_271E7);
}

- (void)baxSetStoredLineInfos:(id)a3
{
}

- (NSAttributedString)baxStoredAttributedPageContent
{
  return (NSAttributedString *)__BAXGetAssociatedObject(self, &unk_271E8);
}

- (void)baxSetStoredAttributedPageContent:(id)a3
{
}

- (_NSRange)baxStoredVisibleContentRange
{
  id v2 = __BAXGetAssociatedRange(self, &unk_271E9);
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)baxSetStoredVisibleContentRange:(_NSRange)a3
{
}

- (BEAttachmentElement)_baxCachedAttachmentElement
{
  return (BEAttachmentElement *)__BAXGetAssociatedObject(self, &unk_271EA);
}

- (void)_baxSetCachedAttachmentElement:(id)a3
{
}

- (NSTimer)_baxIsSettingSelectionTimer
{
  return (NSTimer *)__BAXGetAssociatedObject(self, &unk_271EB);
}

- (void)_baxSetIsSettingSelectionTimer:(id)a3
{
}

- (BOOL)_baxIsTurning
{
  return __BAXGetAssociatedBool(self, &unk_271EC);
}

- (void)_baxSetIsTurning:(BOOL)a3
{
}

- (id)baxBookContentElement
{
  id v2 = self;
  if (v2)
  {
    while (1)
    {
      NSClassFromString(@"WebAccessibilityObjectWrapper");
      if (objc_opt_isKindOfClass())
      {
        if ([(BAXObjectWrapper *)v2 baxIsBookContentElement]) {
          break;
        }
      }
      uint64_t v3 = [(BAXObjectWrapper *)v2 accessibilityContainer];

      id v2 = (BAXObjectWrapper *)v3;
      if (!v3) {
        goto LABEL_7;
      }
    }
    id v2 = v2;
  }
LABEL_7:

  return v2;
}

- (void)baxInvalidateCaches
{
  [(BAXObjectWrapper *)self baxSetStoredLinkRotorIndex:0];
  [(BAXObjectWrapper *)self baxSetStoredLinkRotorIndex:0];
  [(BAXObjectWrapper *)self baxSetStoredLinkRotor:0];
  [(BAXObjectWrapper *)self baxSetStoredHighlightRotor:0];
  [(BAXObjectWrapper *)self baxSetStoredLinkInfos:0];
  [(BAXObjectWrapper *)self baxSetStoredAttributedPageContent:0];
  [(BAXObjectWrapper *)self _baxSetCachedAttachmentElement:0];
  [(BAXObjectWrapper *)self _baxSetIsTurning:0];
  uint64_t v3 = self;
  objc_setAssociatedObject(v3, [@"StoredIsInteractiveElement" hash], 0, (char *)&dword_0 + 1);

  if ((uint64_t)[(BAXObjectWrapper *)v3 accessibilityElementCount] >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(BAXObjectWrapper *)v3 accessibilityElementAtIndex:v4];
      v6 = objc_opt_class();
      v7 = __BAXCastAsSafeCategory(v6, v5, 0, 0);
      v8 = v7;
      if (v7) {
        [v7 baxInvalidateCaches];
      }

      ++v4;
    }
    while (v4 < (uint64_t)[(BAXObjectWrapper *)v3 accessibilityElementCount]);
  }
}

- (void)baxInvalidateLineInfos
{
}

- (BEAttachmentElement)baxAttachmentElement
{
  uint64_t v3 = [(BAXObjectWrapper *)self _baxCachedAttachmentElement];
  if (!v3)
  {
    if (![(BAXObjectWrapper *)self baxNeedsAttachmentElement]) {
      goto LABEL_5;
    }
    uint64_t v3 = [[BEAttachmentElement alloc] initWithObjectWrapperElement:self];
    [(BAXObjectWrapper *)self _baxSetCachedAttachmentElement:v3];
  }

LABEL_5:

  return [(BAXObjectWrapper *)self _baxCachedAttachmentElement];
}

- (BOOL)baxNeedsAttachmentElement
{
  v3.receiver = self;
  v3.super_class = (Class)BAXObjectWrapper;
  return (UIAccessibilityTraitImage & [(BAXObjectWrapper *)&v3 accessibilityTraits]) != 0;
}

- (NSAttributedString)baxRawAttributedString
{
  return (NSAttributedString *)[(BAXObjectWrapper *)self baxValueForKey:@"attributedStringForElement"];
}

- (BOOL)baxElementIsInteractive
{
  v4.receiver = self;
  v4.super_class = (Class)BAXObjectWrapper;
  unint64_t v2 = [(BAXObjectWrapper *)&v4 accessibilityTraits];
  if ((UIAccessibilityTraitStaticText & v2) != 0) {
    return 0;
  }
  if (((UIAccessibilityTraitAdjustable | UIAccessibilityTraitButton | UIAccessibilityTraitPopupButton | UIAccessibilityTraitRadioButton | UIAccessibilityTraitStartsMediaSession) & v2) != 0) {
    return (UIAccessibilityTraitImage & v2) == 0;
  }
  return 0;
}

- (BOOL)isAccessibilityElement
{
  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    return [(BAXObjectWrapper *)&v9 isAccessibilityElement];
  }
  else
  {
    unint64_t v4 = [(BAXObjectWrapper *)self accessibilityTraits];
    unsigned __int8 v5 = [(BAXObjectWrapper *)self baxIsBookContentElement];
    UIAccessibilityTraits v6 = UIAccessibilityTraitLink;
    unsigned __int8 v7 = [(BAXObjectWrapper *)self baxElementIsInteractive];
    if ((v6 & ~v4) != 0) {
      char v8 = v7;
    }
    else {
      char v8 = 1;
    }
    return v8 | v5;
  }
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(BAXObjectWrapper *)self accessibilityTraits];
  BOOL v4 = (UIAccessibilityTraitLink & ~v3) != 0;
  if ([(BAXObjectWrapper *)self baxElementIsInteractive])
  {
    v6.receiver = self;
    v6.super_class = (Class)BAXObjectWrapper;
    return [(BAXObjectWrapper *)&v6 accessibilityActivate];
  }
  return v4;
}

- (id)accessibilityValue
{
  if (BEBooksWebKitAccessibility())
  {
    [(BAXObjectWrapper *)&v7 accessibilityValue];
  }
  else if ([(BAXObjectWrapper *)self baxElementIsInteractive])
  {
    [(BAXObjectWrapper *)&v6 accessibilityValue];
  }
  else
  {
    if ([(BAXObjectWrapper *)self baxIsBookContentElement])
    {
      unint64_t v3 = [(BAXObjectWrapper *)self accessibilityPageContent];
      goto LABEL_9;
    }
    [(BAXObjectWrapper *)&v5 accessibilityValue];
  unint64_t v3 = };
LABEL_9:

  return v3;
}

- (id)accessibilityAttributedValue
{
  if (BEBooksWebKitAccessibility())
  {
    [(BAXObjectWrapper *)&v6 accessibilityAttributedValue];
  }
  else
  {
    if ([(BAXObjectWrapper *)self baxIsBookContentElement])
    {
      unint64_t v3 = [(BAXObjectWrapper *)self accessibilityAttributedPageContent];
      goto LABEL_7;
    }
    [(BAXObjectWrapper *)&v5 accessibilityAttributedValue];
  unint64_t v3 = };
LABEL_7:

  return v3;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  id v6 = a4;
  if (BEBooksWebKitAccessibility())
  {
    -[BAXObjectWrapper _iosAccessibilityAttributeValue:forParameter:](&v21, "_iosAccessibilityAttributeValue:forParameter:", a3, v6, v20.receiver, v20.super_class, self, BAXObjectWrapper);
    v18 = LABEL_11:;
    goto LABEL_12;
  }
  if (a3 != 92700)
  {
    -[BAXObjectWrapper _iosAccessibilityAttributeValue:forParameter:](&v20, "_iosAccessibilityAttributeValue:forParameter:", a3, v6, self, BAXObjectWrapper, v21.receiver, v21.super_class);
    goto LABEL_11;
  }
  [v6 pointValue];
  double v8 = v7;
  double v10 = v9;
  v11 = [(BAXObjectWrapper *)self _accessibilityParentView];
  v12 = [v11 window];

  if (v12)
  {
    v13 = [v11 window];
    [v13 convertPoint:v11 toView:v8];
    double v8 = v14;
    double v10 = v15;
  }
  int64_t v16 = -[BAXObjectWrapper accessibilityLineNumberForPoint:](self, "accessibilityLineNumberForPoint:", v8, v10);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v17 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v17 = v16;
  }
  v18 = +[NSNumber numberWithInteger:v17];

LABEL_12:

  return v18;
}

- (BOOL)accessibilitySupportsTextSelection
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)BAXObjectWrapper;
  unint64_t v3 = [(BAXObjectWrapper *)&v5 accessibilityTraits];
  if ((BEBooksWebKitAccessibility() & 1) == 0
    && [(BAXObjectWrapper *)self baxIsBookContentElement])
  {
    return v3 & ~UIAccessibilityTraitWebContent | UIAccessibilityTraitBookContent | UIAccessibilityTraitCausesPageTurn;
  }
  return v3;
}

- (id)accessibilityTextualContext
{
  return UIAccessibilityTextualContextNarrative;
}

- (id)accessibilityLanguage
{
  return 0;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  BOOL v4 = [(BAXObjectWrapper *)self baxBookContentElement];
  id v5 = +[BEAXWebContentUtilities lineRangeForCharacterPosition:a3 forBookContentElement:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  unint64_t v3 = [(BAXObjectWrapper *)self baxBookContentElement];
  BOOL v4 = +[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:v3];

  id v5 = [(BAXObjectWrapper *)self _accessibilityTextMarkerRangeForSelection];
  if ([v5 count] == (char *)&dword_0 + 2)
  {
    NSUInteger v6 = [v5 firstObject];
    NSUInteger v7 = (char *)((unsigned char *)[(BAXObjectWrapper *)self _accessibilityRangeForTextMarker:v6]- v4);

    NSUInteger v8 = [v5 lastObject];
    NSUInteger v9 = (char *)((unsigned char *)[(BAXObjectWrapper *)self _accessibilityRangeForTextMarker:v8]- v4);

    BOOL v11 = v7 != (char *)0x7FFFFFFFFFFFFFFFLL && v9 != (char *)0x7FFFFFFFFFFFFFFFLL;
    BOOL v12 = (uint64_t)v9 > (uint64_t)v7;
    if (v11 && v12) {
      NSUInteger v13 = v9 - v7;
    }
    else {
      NSUInteger v13 = 0;
    }
    if (v11 && v12) {
      uint64_t v14 = (uint64_t)v7;
    }
    else {
      uint64_t v14 = 0x7FFFFFFFLL;
    }
  }
  else
  {
    NSUInteger v13 = 0;
    uint64_t v14 = 0x7FFFFFFFLL;
  }

  NSUInteger v15 = v14;
  NSUInteger v16 = v13;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = [(BAXObjectWrapper *)self baxBookContentElement];
  NSUInteger v7 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:v6];

  NSUInteger v8 = &v7[location];
  [(BAXObjectWrapper *)self checkActions];
  if (length)
  {
    v18.receiver = self;
    v18.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilitySetSelectedTextRange:](&v18, "_accessibilitySetSelectedTextRange:", v8, length);
  }
  else
  {
    NSUInteger v9 = [(BAXObjectWrapper *)self baxBookContentElement];
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", v8, 0, v9);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    +[BEAXWebContentUtilities jsSetSelectionWithFrame:](BEAXWebContentUtilities, "jsSetSelectionWithFrame:", v11, v13, v15, v17);
  }
}

- (void)checkActions
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7EB0;
  block[3] = &unk_20798;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_oldAccessibilitySetSelectedTextRange:(_NSRange)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BAXObjectWrapper;
  -[BAXObjectWrapper _accessibilitySetSelectedTextRange:](&v3, "_accessibilitySetSelectedTextRange:", a3.location, a3.length);
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  if (BEBooksWebKitAccessibility())
  {
    v8.receiver = self;
    v8.super_class = (Class)BAXObjectWrapper;
    id v5 = [(BAXObjectWrapper *)&v8 _accessibilityAttributedValueForRange:a3];
  }
  else
  {
    NSUInteger v6 = [(BAXObjectWrapper *)self baxBookContentElement];
    id v5 = +[BEAXWebContentUtilities attributedValueForRange:forBookContentElement:](BEAXWebContentUtilities, "attributedValueForRange:forBookContentElement:", a3->location, a3->length, v6);
  }

  return v5;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (BEBooksWebKitAccessibility())
  {
    v23.receiver = self;
    v23.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilityBoundsForRange:](&v23, "_accessibilityBoundsForRange:", location, length);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v14 = [(BAXObjectWrapper *)self baxBookContentElement];
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", location, length, v14);
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)baxBoundsForRange:(_NSRange)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BAXObjectWrapper;
  -[BAXObjectWrapper _accessibilityBoundsForRange:](&v7, "_accessibilityBoundsForRange:", a3.location, a3.length);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v3 = a3;
  double v4 = +[BEAccessibilityReadingState currentReadingState];
  double v5 = [v4 performableOperations];

  unsigned int v6 = [v5 containsObject:v3];
  if (v6) {
    +[BEAXWebContentUtilities performNativeAction:v3];
  }

  return v6;
}

- (id)_accessibilityTextOperations
{
  unint64_t v2 = +[BEAccessibilityReadingState currentReadingState];
  id v3 = [v2 performableOperations];

  return v3;
}

- (id)_accessibilitySupportsReadingContent
{
  id v3 = &__kCFBooleanFalse;
  if ((BEBooksWebKitAccessibility() & 1) == 0
    && [(BAXObjectWrapper *)self baxIsBookContentElement])
  {
    return &__kCFBooleanTrue;
  }
  return v3;
}

- (id)accessibilityContainer
{
  v14.receiver = self;
  v14.super_class = (Class)BAXObjectWrapper;
  id v3 = [(BAXObjectWrapper *)&v14 accessibilityContainer];
  double v4 = self;
  double v5 = objc_getAssociatedObject(v4, [@"StoredIsInteractiveElement" hash]);

  if ([v5 BOOLValue])
  {
    id v6 = v3;
    id v3 = v6;
    if (v6)
    {
      objc_super v7 = v6;
      while (1)
      {
        NSClassFromString(@"WKAccessibilityWebPageObject");
        if (objc_opt_isKindOfClass()) {
          break;
        }
        double v8 = objc_opt_class();
        double v9 = __BAXCastAsSafeCategory(v8, v7, 0, 0);
        double v10 = v9;
        if (v9) {
          [v9 _bkaxSuperAccessibilityContainer];
        }
        else {
        uint64_t v11 = [v7 accessibilityContainer];
        }

        objc_super v7 = (void *)v11;
        if (!v11) {
          goto LABEL_11;
        }
      }
      id v12 = v7;

      id v3 = v12;
    }
  }
LABEL_11:

  return v3;
}

- (id)_bkaxSuperAccessibilityContainer
{
  v4.receiver = self;
  v4.super_class = (Class)BAXObjectWrapper;
  unint64_t v2 = [(BAXObjectWrapper *)&v4 accessibilityContainer];

  return v2;
}

- (id)accessibilityPageContent
{
  if (BEBooksWebKitAccessibility())
  {
    v6.receiver = self;
    v6.super_class = (Class)BAXObjectWrapper;
    id v3 = [(BAXObjectWrapper *)&v6 accessibilityPageContent];
  }
  else if ([(BAXObjectWrapper *)self baxElementIsInteractive])
  {
    id v3 = 0;
  }
  else
  {
    objc_super v4 = [(BAXObjectWrapper *)self accessibilityAttributedPageContent];
    id v3 = [v4 string];
  }

  return v3;
}

- (id)accessibilityAttributedPageContent
{
  if ((BEBooksWebKitAccessibility() & 1) != 0
    || [(BAXObjectWrapper *)self baxNeedsAttachmentElement])
  {
    goto LABEL_3;
  }
  double v5 = [(BAXObjectWrapper *)self baxBookContentElement];
  id v3 = +[BEAXWebContentUtilities attributedPageContentForBookContentElement:v5];

  if (!v3)
  {
    objc_super v6 = [(BAXObjectWrapper *)self baxBookContentElement];
    unsigned int v7 = [(BAXObjectWrapper *)self _elementContainsImageForSpeakScreen:v6];

    if (!v7)
    {
LABEL_3:
      id v3 = 0;
      goto LABEL_4;
    }
    id v8 = objc_alloc((Class)NSAttributedString);
    double v9 = BAXLocString(@"image");
    id v3 = [v8 initWithString:v9];
  }
LABEL_4:

  return v3;
}

- (int64_t)accessibilityLineNumberForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    return -[BAXObjectWrapper accessibilityLineNumberForPoint:](&v9, "accessibilityLineNumberForPoint:", x, y);
  }
  else
  {
    unsigned int v7 = [(BAXObjectWrapper *)self baxBookContentElement];
    int64_t v8 = +[BEAXWebContentUtilities lineNumberForPoint:forBookContentElement:](BEAXWebContentUtilities, "lineNumberForPoint:forBookContentElement:", v7, x, y);

    return v8;
  }
}

- (id)accessibilityContentForLineNumber:(int64_t)a3
{
  if (BEBooksWebKitAccessibility())
  {
    v9.receiver = self;
    v9.super_class = (Class)BAXObjectWrapper;
    double v5 = [(BAXObjectWrapper *)&v9 accessibilityContentForLineNumber:a3];
  }
  else
  {
    objc_super v6 = [(BAXObjectWrapper *)self baxBookContentElement];
    unsigned int v7 = +[BEAXWebContentUtilities attributedStringForLineNumber:a3 forBookContentElement:v6];
    double v5 = [v7 string];
  }

  return v5;
}

- (id)accessibilityAttributedContentForLineNumber:(int64_t)a3
{
  if (BEBooksWebKitAccessibility())
  {
    v8.receiver = self;
    v8.super_class = (Class)BAXObjectWrapper;
    double v5 = [(BAXObjectWrapper *)&v8 accessibilityAttributedContentForLineNumber:a3];
  }
  else
  {
    objc_super v6 = [(BAXObjectWrapper *)self baxBookContentElement];
    double v5 = +[BEAXWebContentUtilities attributedStringForLineNumber:a3 forBookContentElement:v6];
  }

  return v5;
}

- (CGRect)accessibilityFrameForLineNumber:(int64_t)a3
{
  if (BEBooksWebKitAccessibility())
  {
    v22.receiver = self;
    v22.super_class = (Class)BAXObjectWrapper;
    [(BAXObjectWrapper *)&v22 accessibilityFrameForLineNumber:a3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v13 = [(BAXObjectWrapper *)self baxBookContentElement];
    +[BEAXWebContentUtilities frameForLineNumber:a3 forBookContentElement:v13];
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_accessibilityFrameForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (BEBooksWebKitAccessibility())
  {
    v36.receiver = self;
    v36.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilityFrameForRange:](&v36, "_accessibilityFrameForRange:", location, length);
    CGFloat x = v6;
    CGFloat y = v8;
    CGFloat width = v10;
    CGFloat height = v12;
  }
  else
  {
    double v14 = [(BAXObjectWrapper *)self baxBookContentElement];
    double v15 = (char *)+[BEAXWebContentUtilities chapterRangeForRange:forBookContentElement:](BEAXWebContentUtilities, "chapterRangeForRange:forBookContentElement:", location, length, v14);
    uint64_t v17 = v16;

    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
    double v18 = [(BAXObjectWrapper *)self _accessibilityTextMarkerForPosition:v15];
    uint64_t v19 = [(BAXObjectWrapper *)self _accessibilityTextMarkerForPosition:&v15[v17]];
    double v20 = (void *)v19;
    if (v18) {
      BOOL v21 = v19 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (!v21)
    {
      v37[0] = v18;
      v37[1] = v19;
      objc_super v22 = +[NSArray arrayWithObjects:v37 count:2];
      objc_super v23 = [(BAXObjectWrapper *)self _accessibilityConvertDataArrayToTextMarkerArray:v22];

      v24 = [(BAXObjectWrapper *)self baxBookContentElement];
      v25 = [v24 lineRectsAndText];

      if ([v25 count])
      {
        v26 = [v25 firstObject];
        v27 = [v26 valueForKey:@"rect"];
        [v27 CGRectValue];
        CGFloat x = v28;
        CGFloat y = v29;
        CGFloat width = v30;
        CGFloat height = v31;
      }
    }
  }
  double v32 = x;
  double v33 = y;
  double v34 = width;
  double v35 = height;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (_NSRange)_accessibilityRangeForLineNumber:(int64_t)a3
{
  if (BEBooksWebKitAccessibility())
  {
    v11.receiver = self;
    v11.super_class = (Class)BAXObjectWrapper;
    id v5 = [(BAXObjectWrapper *)&v11 _accessibilityRangeForLineNumber:a3];
  }
  else
  {
    double v7 = [(BAXObjectWrapper *)self baxBookContentElement];
    id v8 = +[BEAXWebContentUtilities lineRangeForLineNumber:a3 forBookContentElement:v7];
    NSUInteger v10 = v9;

    id v5 = v8;
    NSUInteger v6 = v10;
  }
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (BOOL)_accessibilityReadAllContinuesWithScroll
{
  if (BEBooksWebKitAccessibility())
  {
    v4.receiver = self;
    v4.super_class = (Class)BAXObjectWrapper;
    return [(BAXObjectWrapper *)&v4 _accessibilityReadAllContinuesWithScroll];
  }
  else
  {
    return [(BAXObjectWrapper *)self baxIsBookContentElement];
  }
}

- (id)_accessibilityInternalTextLinks
{
  unint64_t v2 = [(BAXObjectWrapper *)self baxBookContentElement];
  id v3 = +[BEAXLineInfo linkElementsForElement:v2];

  objc_super v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        NSUInteger v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v10)
        {
          id v11 = objc_alloc((Class)UIAccessibilityLinkSubelement);
          id v12 = [v11 initWithAccessibilityContainer:v10];
          double v13 = [v10 text];
          [v12 setAccessibilityLabel:v13];

          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    id v14 = [v4 copy];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (id)visibleLinkElements:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = +[BEAccessibilityReadingState currentReadingState];
  if ([v6 isFixedLayoutBook])
  {
    id v7 = [(BAXObjectWrapper *)self baxBookContentElement];
    [v7 accessibilityVisibleContentRect];
  }
  else
  {
    id v7 = +[BEAccessibilityReadingState currentReadingState];
    [v7 primaryVisibleContentRect];
  }
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v4;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        BOOL v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v21 accessibilityFrame:v26];
        v32.CGFloat x = v22;
        v32.CGFloat y = v23;
        v33.origin.CGFloat x = v12;
        v33.origin.CGFloat y = v13;
        v33.size.CGFloat width = v14;
        v33.size.CGFloat height = v15;
        if (CGRectContainsPoint(v33, v32)) {
          [v5 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }

  if ([v5 count]) {
    id v24 = [v5 copy];
  }
  else {
    id v24 = 0;
  }

  return v24;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  id v3 = [(BAXObjectWrapper *)self baxStoredLinkInfos];

  if (!v3)
  {
    id v4 = [(BAXObjectWrapper *)self _accessibilityInternalTextLinks];
    id v5 = [v4 mutableCopy];
    [(BAXObjectWrapper *)self baxSetStoredLinkInfos:v5];
  }
  id v6 = [(BAXObjectWrapper *)self baxStoredLinkInfos];
  id v7 = [(BAXObjectWrapper *)self visibleLinkElements:v6];

  if ([v7 count])
  {
    objc_initWeak(&location, self);
    id v8 = [(BAXObjectWrapper *)self baxStoredLinkRotor];
    if (v8)
    {
      objc_destroyWeak(&location);
LABEL_7:
      id v20 = v8;
      double v10 = +[NSArray arrayWithObjects:&v20 count:1];

      goto LABEL_9;
    }
    id v9 = objc_alloc((Class)UIAccessibilityCustomRotor);
    CGFloat v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    CGFloat v14 = sub_9150;
    CGFloat v15 = &unk_207C0;
    objc_copyWeak(&v18, &location);
    id v16 = self;
    id v17 = v7;
    id v8 = [v9 initWithSystemType:1 itemSearchBlock:&v12];
    -[BAXObjectWrapper baxSetStoredLinkRotor:](self, "baxSetStoredLinkRotor:", v8, v12, v13, v14, v15, v16);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    if (v8) {
      goto LABEL_7;
    }
  }
  double v10 = 0;
LABEL_9:

  return v10;
}

- (id)_baxHighlightRotor
{
  id v3 = [(BAXObjectWrapper *)self baxStoredHighlightRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc((Class)UIAccessibilityCustomRotor);
    id v5 = BAXLocString(@"highlights");
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_93DC;
    double v10 = &unk_207E8;
    objc_copyWeak(&v11, &location);
    id v3 = [v4 initWithName:v5 itemSearchBlock:&v7];

    -[BAXObjectWrapper baxSetStoredHighlightRotor:](self, "baxSetStoredHighlightRotor:", v3, v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)baxHighlightInfos
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomRotors
{
  id v3 = +[NSMutableArray array];
  if ([(BAXObjectWrapper *)self baxIsBookContentElement])
  {
    id v4 = [(BAXObjectWrapper *)self _accessibilityInternalTextLinkCustomRotors];

    if (v4)
    {
      id v5 = [(BAXObjectWrapper *)self baxStoredLinkRotor];
      [v3 addObject:v5];
    }
    uint64_t v6 = [(BAXObjectWrapper *)self _baxHighlightRotor];
    if (v6)
    {
      id v7 = (void *)v6;
      unsigned __int8 v8 = [(BAXObjectWrapper *)self baxIsInPictureBook];

      if ((v8 & 1) == 0)
      {
        id v9 = [(BAXObjectWrapper *)self baxStoredHighlightRotor];
        [v3 addObject:v9];
      }
    }
  }
  if ([v3 count]) {
    id v10 = [v3 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_accessibilityPublicCustomRotorVisibleInTouchRotor:(id)a3
{
  id v4 = a3;
  id v5 = [(BAXObjectWrapper *)self baxStoredLinkRotor];
  uint64_t v6 = [v5 baxValueForKey:@"uuid"];
  unsigned __int8 v7 = [v6 isEqual:v4];

  unsigned __int8 v8 = [(BAXObjectWrapper *)self baxStoredHighlightRotor];
  id v9 = [v8 baxValueForKey:@"uuid"];
  unsigned __int8 v10 = [v9 isEqual:v4];

  return v10 | v7;
}

- (id)_accessibilitySpeakThisString
{
  id v3 = [(BAXObjectWrapper *)self baxBookContentElement];
  [v3 baxSetStoredAttributedPageContent:0];

  return [(BAXObjectWrapper *)self accessibilityPageContent];
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  unsigned __int8 v10 = [(BAXObjectWrapper *)self baxBookContentElement];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_10;
  }
  id v11 = [v9 length];

  if (!v11)
  {
LABEL_10:
    v37.receiver = self;
    v37.super_class = (Class)BAXObjectWrapper;
    -[BAXObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:](&v37, "_accessibilityTextRectsForSpeakThisStringRange:string:", location, length, v9);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  CGFloat v12 = [(BAXObjectWrapper *)self baxBookContentElement];
  uint64_t v13 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:v12]+ location;
  uint64_t v31 = 0;
  CGPoint v32 = &v31;
  uint64_t v33 = 0x3032000000;
  double v34 = sub_9CEC;
  double v35 = sub_9CFC;
  id v36 = 0;
  CGFloat v14 = [(BAXObjectWrapper *)self _accessibilityTextMarkerForPosition:v13];
  uint64_t v15 = [(BAXObjectWrapper *)self _accessibilityTextMarkerForPosition:&v13[length]];
  id v16 = (void *)v15;
  id v17 = 0;
  if (v14 && v15)
  {
    v39[0] = v14;
    v39[1] = v15;
    id v18 = +[NSArray arrayWithObjects:v39 count:2];
    uint64_t v19 = [v12 _accessibilityConvertDataArrayToTextMarkerArray:v18];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_9D04;
    v26[3] = &unk_20810;
    BOOL v30 = a5;
    long long v29 = &v31;
    id v27 = v12;
    id v17 = v19;
    id v28 = v17;
    __BAXPerformSafeBlock(v26);
  }
  if (![(id)v32[5] count])
  {
    id v20 = [(BAXObjectWrapper *)self baxBookContentElement];
    +[BEAXWebContentUtilities frameForRange:forBookContentElement:](BEAXWebContentUtilities, "frameForRange:forBookContentElement:", v13, length, v20);
    BOOL v21 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
    v38 = v21;
    uint64_t v22 = +[NSArray arrayWithObjects:&v38 count:1];
    CGFloat v23 = (void *)v32[5];
    v32[5] = v22;
  }
  id v24 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
LABEL_11:

  return v24;
}

- (BOOL)_elementContainsImageForSpeakScreen:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessibilityElementCount];
  if (v5)
  {
    id v6 = v5;
    unsigned __int8 v7 = 0;
    uint64_t v8 = 0;
    UIAccessibilityTraits v9 = UIAccessibilityTraitImage;
    while (1)
    {
      unsigned __int8 v10 = objc_opt_class();
      id v11 = [v4 accessibilityElementAtIndex:v8];
      CGFloat v12 = __BAXCastAsSafeCategory(v10, v11, 0, 0);

      if (v12)
      {
        if ((v9 & (unint64_t)[v12 accessibilityTraits]) != 0)
        {

          unsigned __int8 v7 = 1;
          goto LABEL_10;
        }
        unsigned __int8 v7 = [(BAXObjectWrapper *)self _elementContainsImageForSpeakScreen:v12];
      }

      if (v6 == (id)++v8) {
        goto LABEL_10;
      }
    }
  }
  unsigned __int8 v7 = 0;
LABEL_10:

  return v7 & 1;
}

- (BOOL)baxIsBookContentElement
{
  id v3 = [(BAXObjectWrapper *)self baxWebPageObject];
  if (v3
    && ([(BAXObjectWrapper *)self accessibilityContainer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == v3))
  {
    +[BEAccessibilityReadingState registerBookContentElement:self];
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)baxWebPageObject
{
  id v2 = [(BAXObjectWrapper *)self accessibilityContainer];
  if (v2)
  {
    while (1)
    {
      id v3 = [v2 accessibilityContainer];
      NSClassFromString(@"WKAccessibilityWebPageObject");
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v5 = [v2 accessibilityContainer];

      id v2 = (id)v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (BOOL)baxIsInTableOfContents
{
  return 0;
}

- (BOOL)baxIsInPictureBook
{
  id v2 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v3 = [v2 isFixedLayoutBook];

  return v3;
}

- (id)baxVisibleLineInfos
{
  unsigned __int8 v3 = [(BAXObjectWrapper *)self baxBookContentElement];
  id v4 = (char *)+[BEAXWebContentUtilities visibleTextRangeInChapterForBookContentElement:v3];
  uint64_t v6 = v5;

  unsigned __int8 v7 = [(BAXObjectWrapper *)self baxBookContentElement];
  uint64_t v8 = [v7 baxStoredLineInfos];

  UIAccessibilityTraits v9 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    CGFloat v14 = &v4[v6];
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v17 = [v16 rangeInChapter:v25];
        id v18 = (char *)[v16 rangeInChapter];
        id v20 = &v18[v19];
        if (v4 <= v17 && v17 < v14 && v4 <= v20 && v20 < v14) {
          [v9 addObject:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)text
{
  unsigned __int8 v3 = [(BAXObjectWrapper *)self textMarkerRange];
  id v4 = [(BAXObjectWrapper *)self stringForTextMarkers:v3];

  return v4;
}

- (id)rects
{
  id v2 = [(BAXObjectWrapper *)self lineRectsAndText];
  if (v2)
  {
    unsigned __int8 v3 = +[NSMutableArray array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          UIAccessibilityTraits v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) valueForKey:@"rect" v12];
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if ([v3 count]) {
      id v10 = v3;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)description
{
  unsigned __int8 v3 = [(BAXObjectWrapper *)self text];
  if ((unint64_t)[v3 length] > 0x3B)
  {
    id v5 = [v3 substringToIndex:30];
    id v6 = [v3 substringFromIndex:[v3 length] - 30];
    id v4 = +[NSString stringWithFormat:@"%@...%@", v5, v6];
  }
  else
  {
    id v4 = v3;
  }
  [(BAXObjectWrapper *)self accessibilityFrame];
  uint64_t v7 = NSStringFromCGRect(v14);
  unsigned int v8 = [(BAXObjectWrapper *)self baxIsBookContentElement];
  v12.receiver = self;
  v12.super_class = (Class)BAXObjectWrapper;
  id v9 = [(BAXObjectWrapper *)&v12 accessibilityTraits];
  id v10 = +[NSString stringWithFormat:@"<%@ %p isBookContentElement=%d frame=%@ superTraits=%d text=\"%@\"", objc_opt_class(), self, v8, v7, v9, v4];

  return v10;
}

- (id)accessibilityCustomActions
{
  id v2 = +[NSMutableArray array];
  unsigned __int8 v3 = +[BEAccessibilityReadingState currentReadingState];
  unsigned int v4 = [v3 isVisiblePageBookmarked];

  id v5 = objc_alloc((Class)UIAccessibilityCustomAction);
  if (v4) {
    id v6 = @"unbookmark.page";
  }
  else {
    id v6 = @"bookmark.page";
  }
  uint64_t v7 = BAXLocString(v6);
  id v8 = [v5 initWithName:v7 actionHandler:&stru_20830];

  [v2 addObject:v8];
  id v9 = [v2 copy];

  return v9;
}

- (BOOL)_accessibilityScrollNextPage
{
  return [(BAXObjectWrapper *)self accessibilityScroll:5];
}

- (BOOL)_accessibilityScrollPreviousPage
{
  return [(BAXObjectWrapper *)self accessibilityScroll:6];
}

- (BOOL)_accessibilityScrollWithDirection:(int64_t)a3
{
  if (a3 == 6) {
    return -[BAXObjectWrapper accessibilityScroll:](&v4, "accessibilityScroll:", 3, self, BAXObjectWrapper, v5.receiver, v5.super_class);
  }
  if (a3 == 5) {
    return -[BAXObjectWrapper accessibilityScroll:](&v5, "accessibilityScroll:", 4, v4.receiver, v4.super_class, self, BAXObjectWrapper);
  }
  return 0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unsigned int v5 = [(BAXObjectWrapper *)self _accessibilityIsRTL];
  if (a3 == 1 && (v5 & 1) != 0 || a3 == 2 && ((v5 ^ 1) & 1) != 0)
  {
    CFStringRef v6 = @"next";
  }
  else
  {
    BOOL v9 = a3 == 2;
    if (!v5) {
      BOOL v9 = a3 == 1;
    }
    CFStringRef v6 = @"previous";
    if (!v9)
    {
      if (a3 == 5)
      {
        CFStringRef v6 = @"next";
      }
      else if (a3 != 6)
      {
        id v10 = +[BEAccessibilityReadingState currentReadingState];
        id v11 = (char *)[v10 bookLayout];

        if (v11 != (unsigned char *)&dword_0 + 2)
        {
          v13.receiver = self;
          v13.super_class = (Class)BAXObjectWrapper;
          return [(BAXObjectWrapper *)&v13 accessibilityScroll:a3];
        }
        if (a3 == 3) {
          CFStringRef v12 = @"previous";
        }
        else {
          CFStringRef v12 = 0;
        }
        if (a3 == 4) {
          CFStringRef v6 = @"next";
        }
        else {
          CFStringRef v6 = v12;
        }
      }
    }
  }
  +[BEAXWebContentUtilities turnPageWithDirection:v6];
  [(BAXObjectWrapper *)self _dispatchPageScrolledNotification];
  uint64_t v7 = [(BAXObjectWrapper *)self baxBookContentElement];
  [v7 baxSetStoredAttributedPageContent:0];

  if (BEBooksWebKitAccessibility()) {
    [(BAXObjectWrapper *)self baxInvalidateContainerCaches];
  }
  return 1;
}

- (void)baxInvalidateContainerCaches
{
  uint64_t v2 = [(BAXObjectWrapper *)self accessibilityContainer];
  if (v2)
  {
    unsigned __int8 v3 = (void *)v2;
    while (1)
    {
      NSClassFromString(@"WKAccessibilityWebPageObject");
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 accessibilityContainer];

      unsigned __int8 v3 = (void *)v4;
      if (!v4) {
        return;
      }
    }
    unsigned int v5 = objc_opt_class();
    __BAXCastAsSafeCategory(v5, v3, 0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 _baxSetCachedAccessibilityElementTree:0];
  }
}

- (void)_dispatchPageScrolledNotification
{
  [(BAXObjectWrapper *)self _baxSetIsTurning:1];
  dispatch_time_t v3 = dispatch_time(0, 150000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A984;
  block[3] = &unk_20798;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_accessibilityScrollStatus
{
  uint64_t v2 = +[BEAccessibilityReadingState currentReadingState];
  id v3 = [v2 pageCount];

  uint64_t v4 = +[BEAccessibilityReadingState currentReadingState];
  id v5 = [v4 currentPage];

  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = BAXLocString(@"loading.book");
  }
  else
  {
    uint64_t v7 = BAXLocString(@"page.num.of %@ %@");
    id v8 = +[NSNumber numberWithInteger:v5];
    BOOL v9 = +[BAXObjectWrapper BAXLocalizedNumberForNumber:v8 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:0];
    id v10 = +[NSNumber numberWithUnsignedInteger:v3];
    id v11 = +[BAXObjectWrapper BAXLocalizedNumberForNumber:v10 numberStyle:1 maximumNumberOfDigitsAfterDecimalSeparator:0];
    CFStringRef v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9, v11);
    id v6 = __BAXStringForVariables(v12, v13, v14, v15, v16, v17, v18, v19, @"__BAXStringForVariablesSentinel");
  }

  return v6;
}

+ (id)BAXLocalizedNumberForNumber:(id)a3 numberStyle:(unint64_t)a4 maximumNumberOfDigitsAfterDecimalSeparator:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setNumberStyle:a4];
  [v8 setMaximumFractionDigits:a5];
  BOOL v9 = [v8 stringFromNumber:v7];

  return v9;
}

- (id)_axPageScrollString
{
  id v3 = [(BAXObjectWrapper *)self baxStoredLinkInfos];

  if (!v3)
  {
    uint64_t v4 = [(BAXObjectWrapper *)self _accessibilityInternalTextLinks];
    id v5 = [v4 copy];
    [(BAXObjectWrapper *)self baxSetStoredLinkInfos:v5];
  }
  id v6 = [(BAXObjectWrapper *)self baxStoredLinkInfos];
  id v7 = [(BAXObjectWrapper *)self visibleLinkElements:v6];

  id v8 = +[BEAccessibilityReadingState currentReadingState];
  BOOL v9 = [v8 visibleAnnotations];

  id v10 = [v7 count];
  id v11 = [v9 count];
  CFStringRef v12 = +[BEAccessibilityReadingState currentReadingState];
  id v13 = [v12 pageCount];

  uint64_t v14 = +[BEAccessibilityReadingState currentReadingState];
  uint64_t v15 = (char *)[v14 currentPage];
  unint64_t v17 = v16;

  uint64_t v18 = &AXRequestingClient_ptr;
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = BAXLocString(@"page.num.of.loading");
  }
  else if (v17 < 2)
  {
    CGFloat v23 = BAXLocString(@"page.num.of.with.total.single %lu %lu");
    uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v15, v13);
  }
  else
  {
    BAXLocString(@"page.num.of.with.total.spread %lu %lu %lu");
    id v20 = v9;
    v22 = BOOL v21 = v7;
    uint64_t v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v15, &v15[v17 - 1], v13);

    id v7 = v21;
    BOOL v9 = v20;
    uint64_t v18 = &AXRequestingClient_ptr;
  }
  if (v10)
  {
    id v24 = v18[154];
    long long v25 = BAXLocString(@"%lu link(s)");
    long long v26 = [v24 localizedStringWithFormat:v25, v10];

    __BAXStringForVariables(0, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    double v34 = v18[154];
    double v35 = BAXLocString(@"%lu note(s)");
    id v36 = [v34 localizedStringWithFormat:v35, v11];

    uint64_t v44 = __BAXStringForVariables(v10, v37, v38, v39, v40, v41, v42, v43, (uint64_t)v36);

    id v10 = (id)v44;
  }
  v45 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v46 = [v45 isVisiblePageBookmarked];

  if (v46)
  {
    v47 = BAXLocString(@"has.bookmark");
    uint64_t v55 = __BAXStringForVariables(v10, v48, v49, v50, v51, v52, v53, v54, (uint64_t)v47);

    id v10 = (id)v55;
  }
  id v56 = objc_alloc((Class)NSMutableAttributedString);
  uint64_t v64 = __BAXStringForVariables(v19, v57, v58, v59, v60, v61, v62, v63, (uint64_t)v10);
  v65 = (void *)v64;
  if (v64) {
    CFStringRef v66 = (const __CFString *)v64;
  }
  else {
    CFStringRef v66 = &stru_20BB8;
  }
  CFStringRef v70 = @"UIAccessibilityTokenLowPitch";
  CFBooleanRef v71 = kCFBooleanTrue;
  v67 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
  id v68 = [v56 initWithString:v66 attributes:v67];

  return v68;
}

- (BOOL)_accessibilityIsRTL
{
  uint64_t v2 = +[BEAccessibilityReadingState currentReadingState];
  unsigned __int8 v3 = [v2 isRTL];

  return v3;
}

@end