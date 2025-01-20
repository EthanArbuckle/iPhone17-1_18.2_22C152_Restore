@interface THNoteCardLayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)thaxIsBottomCard;
- (BOOL)thaxIsFlipped;
- (BOOL)thaxIsTopCard;
- (THNoteCardContentLayerAccessibility)thaxFrontLayer;
- (THNoteCardsControllerAccessibility)thaxDelegate;
- (id)_thaxEmptyCardAccessibilityLabel;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation THNoteCardLayerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNoteCardLayer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)accessibilityIncrement
{
  if (![(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
  {
    v3 = [(THNoteCardLayerAccessibility *)self thaxDelegate];
    [(THNoteCardsControllerAccessibility *)v3 thaxGotoNextCard];
  }
}

- (void)accessibilityDecrement
{
  if (![(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
  {
    v3 = [(THNoteCardLayerAccessibility *)self thaxDelegate];
    [(THNoteCardsControllerAccessibility *)v3 thaxGotoPreviousCard];
  }
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THNoteCardLayerAccessibility;
  unint64_t v3 = [(THNoteCardLayerAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard];
  UIAccessibilityTraits v5 = UIAccessibilityTraitAdjustable;
  if (v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (THNoteCardsControllerAccessibility)thaxDelegate
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THNoteCardsControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNoteCardLayerAccessibility *)self tsaxValueForKey:@"_delegate"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THNoteCardContentLayerAccessibility)thaxFrontLayer
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (THNoteCardContentLayerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNoteCardLayerAccessibility *)self tsaxValueForKey:@"frontLayer"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIsFlipped
{
  return [(THNoteCardLayerAccessibility *)self tsaxBoolValueForKey:@"isFlipped"];
}

- (BOOL)thaxIsTopCard
{
  return [(THNoteCardLayerAccessibility *)self tsaxBoolValueForKey:@"isTopCard"];
}

- (BOOL)thaxIsBottomCard
{
  return [(THNoteCardLayerAccessibility *)self tsaxBoolValueForKey:@"isBottomCard"];
}

- (id)accessibilityHint
{
  if (![(THNoteCardLayerAccessibility *)self thaxIsTopCard]
    || [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
  {
    return 0;
  }
  if ([(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxCanFlipTopCard]&& [(THNoteCardLayerAccessibility *)self thaxIsFlipped])
  {
    unsigned int v4 = [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxInfoForTopCard];
    return [(THAccessibilityNoteCardInfo *)v4 thaxFrontHint];
  }
  else
  {
    char v5 = [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxInfoForTopCard];
    return [(THAccessibilityNoteCardInfo *)v5 thaxBackHint];
  }
}

- (id)accessibilityLabel
{
  if (![(THNoteCardLayerAccessibility *)self thaxIsTopCard]) {
    return 0;
  }
  if ([(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxCanFlipTopCard]&& [(THNoteCardLayerAccessibility *)self thaxIsFlipped])
  {
    id v3 = [(THAccessibilityNoteCardInfo *)[(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxInfoForTopCard] thaxBackDescription];
  }
  else if ([(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
  {
    id v3 = [(THNoteCardLayerAccessibility *)self _thaxEmptyCardAccessibilityLabel];
  }
  else
  {
    id v3 = [(THAccessibilityNoteCardInfo *)[(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxInfoForTopCard] thaxFrontDescription];
  }
  char v5 = v3;
  v6 = [(THNoteCardContentLayerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxFrontLayer] thaxCardNumberString];
  return __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = [(THNoteCardLayerAccessibility *)self thaxIsTopCard];
  if (v5)
  {
    if (![(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
    {
      if (a3 == 1)
      {
        [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxGotoPreviousCard];
        goto LABEL_8;
      }
      if (a3 == 2)
      {
        [(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxGotoNextCard];
LABEL_8:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v6[0] = [(id)THBundle() localizedStringForKey:@"Flip card" value:&stru_46D7E8 table:0];
  v6[1] = [THBundle localizedStringForKey:@"Study card" value:&stru_46D7E8 table:v6[0]];
  v6[2] = [(id)THBundle() localizedStringForKey:@"Flashcard" value:&stru_46D7E8 table:0];
  id v4 = [v3 initWithArray:[NSArray arrayWithObjects:v6, v6, v6, nil]];
  if ([(THNoteCardsControllerAccessibility *)[(THNoteCardLayerAccessibility *)self thaxDelegate] thaxIsShowingEmptyStudyCard])
  {
    [v4 tsu_addNonNilObject:[self accessibilityLabel]];
  }
  return v4;
}

- (id)_thaxEmptyCardAccessibilityLabel
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [self tsaxValueForKey:@"_frontLayer" tsaxValueForKey:@"_bodyLayer"];
  char v12 = 0;
  BOOL v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[v4 tsaxValueForKey:@"_headingLabel"], 1, &v12);
  if (v12
    || (Class v7 = v6,
        char v12 = 0,
        uint64_t v8 = objc_opt_class(),
        Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[v4 tsaxValueForKey:@"_bodyLabel"], 1, &v12), v12))
  {
    abort();
  }
  Class v10 = v9;
  v13[0] = [(objc_class *)v7 thaxText];
  v13[1] = [(objc_class *)v10 thaxText];
  [v3 tsu_addObjectsFromNonNilArray:[NSArray arrayWithObjects:count:v13, 2]];
  return [v3 componentsJoinedByString:@", "];
}

@end