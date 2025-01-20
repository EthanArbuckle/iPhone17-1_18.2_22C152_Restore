@interface THNoteCardsControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxCanFlipTopCard;
- (BOOL)thaxIsShowingEmptyStudyCard;
- (THAccessibilityNoteCardInfo)thaxInfoForTopCard;
- (THNoteCardLayerAccessibility)thaxTopCard;
- (UIView)thaxNoteCardsView;
- (id)p_noteCardsForInfos:(id)a3;
- (void)detachFromView:(id)a3;
- (void)p_handleDelayedCardUpdate;
- (void)thaxGotoNextCard;
- (void)thaxGotoPreviousCard;
@end

@implementation THNoteCardsControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNoteCardsController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)thaxGotoNextCard
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_28422C;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)thaxGotoPreviousCard
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2842B0;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (BOOL)thaxIsShowingEmptyStudyCard
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_284388;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)thaxCanFlipTopCard
{
  return [(THNoteCardsControllerAccessibility *)self tsaxBoolValueForKey:@"canFlipTopCard"];
}

- (THAccessibilityNoteCardInfo)thaxInfoForTopCard
{
  id v2 = [(THNoteCardsControllerAccessibility *)self tsaxValueForKey:@"p_topNoteCardInfo"];
  if (([v2 conformsToProtocol:&OBJC_PROTOCOL___THAccessibilityNoteCardInfo] & 1) == 0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Info does not conform to the THAccessibilityNoteCardInfo: %@", v6, v7, v8, v9, v10, (uint64_t)v5))abort(); {
    }
      }
    return 0;
  }
  return (THAccessibilityNoteCardInfo *)v2;
}

- (THNoteCardLayerAccessibility)thaxTopCard
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THNoteCardLayerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNoteCardsControllerAccessibility *)self tsaxValueForKey:@"p_topNoteCard"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIView)thaxNoteCardsView
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THNoteCardsControllerAccessibility *)self tsaxValueForKey:@"_noteCardsView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)p_noteCardsForInfos:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THNoteCardsControllerAccessibility;
  id v4 = [(THNoteCardsControllerAccessibility *)&v6 p_noteCardsForInfos:a3];
  [(UIView *)[(THNoteCardsControllerAccessibility *)self thaxNoteCardsView] setAccessibilityElements:v4];
  return v4;
}

- (void)detachFromView:(id)a3
{
  [(UIView *)[(THNoteCardsControllerAccessibility *)self thaxNoteCardsView] setAccessibilityElements:0];
  v5.receiver = self;
  v5.super_class = (Class)THNoteCardsControllerAccessibility;
  [(THNoteCardsControllerAccessibility *)&v5 detachFromView:a3];
}

- (void)p_handleDelayedCardUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardsControllerAccessibility;
  [(THNoteCardsControllerAccessibility *)&v3 p_handleDelayedCardUpdate];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, [(THNoteCardsControllerAccessibility *)self thaxTopCard]);
}

@end