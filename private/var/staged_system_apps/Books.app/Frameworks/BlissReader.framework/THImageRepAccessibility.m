@interface THImageRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)p_shouldHitTest;
- (BOOL)thaxIsContainedInAudioRep;
- (BOOL)thaxIsElementIgnored;
- (BOOL)thaxIsPartOfAGallery;
- (NSString)thaxSibilingCaptionText;
- (THWAudioRepAccessibility)thaxParentAudioRep;
- (THWGalleryRepAccessibility)thaxRelatedGalleryRep;
- (id)_accessibilityEquivalenceTag;
- (id)accessibilityHint;
- (id)tsaxLabel;
- (int)thaxPressableAction;
- (unint64_t)accessibilityTraits;
@end

@implementation THImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THImageRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (int)thaxPressableAction
{
  return [(THImageRepAccessibility *)self tsaxIntValueForKey:@"pressableAction"];
}

- (BOOL)thaxIsContainedInAudioRep
{
  return [(THImageRepAccessibility *)self thaxParentAudioRep] != 0;
}

- (THWAudioRepAccessibility)thaxParentAudioRep
{
  v3 = objc_opt_class();
  v4 = [(TSDRepAccessibility *)self tsaxParentRep];

  return (THWAudioRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
}

- (BOOL)thaxIsPartOfAGallery
{
  return [(THImageRepAccessibility *)self thaxRelatedGalleryRep] != 0;
}

- (THWGalleryRepAccessibility)thaxRelatedGalleryRep
{
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxDelegate], 0, 0);
  if (v4)
  {
    Class v5 = v4;
    uint64_t v6 = objc_opt_class();
    id v7 = [(objc_class *)v5 thaxDelegate];
    v8 = (void *)v6;
  }
  else
  {
    v9 = objc_opt_class();
    Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)self tsaxInteractiveCanvasController] tsaxDelegate], 0, 0);
    uint64_t v11 = objc_opt_class();
    id v7 = [(objc_class *)v10 thaxDelegate];
    v8 = (void *)v11;
  }

  return (THWGalleryRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 0, 0);
}

- (NSString)thaxSibilingCaptionText
{
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  NSClassFromString(@"THWDrawablesWidgetRep");
  char isKindOfClass = objc_opt_isKindOfClass();
  result = 0;
  if (isKindOfClass)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [[-[objc_class tsaxChildReps](v4, "tsaxChildReps") reverseObjectEnumerator] 0];
    result = (NSString *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (result)
    {
      v8 = result;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (NSString *)((char *)i + 1))
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12 = objc_opt_class();
          Class v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
          if (v13) {
            return (NSString *)objc_msgSend(objc_msgSend(-[objc_class tsaxContainedRep](v13, "tsaxContainedRep"), "tsaxStorage"), "tsaxString");
          }
        }
        v8 = (NSString *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        result = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)tsaxLabel
{
  char v15 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxInfo], 1, &v15);
  if (v15) {
    goto LABEL_21;
  }
  Class v5 = (NSString *)[(objc_class *)v4 tsaxUserProvidedDescription];
  if (![(NSString *)v5 length]
    && [(THImageRepAccessibility *)self thaxIsContainedInAudioRep])
  {
    Class v5 = [(THWAudioRepAccessibility *)[(THImageRepAccessibility *)self thaxParentAudioRep] thaxMediaLabel];
  }
  if (![(NSString *)v5 length]
    && [(THImageRepAccessibility *)self thaxIsPartOfAGallery])
  {
    Class v5 = [(THWGalleryRepAccessibility *)[(THImageRepAccessibility *)self thaxRelatedGalleryRep] thaxCaptionForCurrentItem];
  }
  if (![(NSString *)v5 length]) {
    Class v5 = (NSString *)[(THImageRepAccessibility *)self thaxContainingGutterRepLabel];
  }
  if (![(NSString *)v5 length]) {
    Class v5 = [(THImageRepAccessibility *)self thaxSibilingCaptionText];
  }
  char v14 = 0;
  uint64_t v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[(TSDRepAccessibility *)self tsaxInfo], 1, &v14);
  if (v14) {
    goto LABEL_21;
  }
  Class v8 = v7;
  if (![(NSString *)v5 length] && [(objc_class *)v8 thaxPopUpInfo]) {
    Class v5 = THAccessibilityLocalizedString(@"widgets.popup.image");
  }
  char v13 = 0;
  uint64_t v9 = objc_opt_class();
  Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(TSDRepAccessibility *)self tsaxLayout], 1, &v13);
  if (v13) {
LABEL_21:
  }
    abort();
  Class v11 = v10;
  if (![(NSString *)v5 length] && [(objc_class *)v11 thaxIsExpanded]) {
    return THAccessibilityLocalizedString(@"widgets.expanded.image");
  }
  return v5;
}

- (BOOL)p_shouldHitTest
{
  v4.receiver = self;
  v4.super_class = (Class)THImageRepAccessibility;
  unsigned __int8 v2 = [(THImageRepAccessibility *)&v4 p_shouldHitTest];
  return [+[TSAccessibility sharedInstance] needsAccessibilityElements] | v2;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)THImageRepAccessibility;
  unint64_t v3 = [(TSDRepAccessibility *)&v7 accessibilityTraits];
  unsigned int v4 = [(THImageRepAccessibility *)self thaxIsContainedInAudioRep];
  UIAccessibilityTraits v5 = UIAccessibilityTraitStartsMediaSession;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityHint
{
  if ([(THImageRepAccessibility *)self thaxIsContainedInAudioRep])
  {
    if ([(THWAudioRepAccessibility *)[(THImageRepAccessibility *)self thaxParentAudioRep] thaxIsPlaying])
    {
      CFStringRef v3 = @"av.pause.playing.hint.ios";
    }
    else
    {
      CFStringRef v3 = @"av.play.stopped.hint.ios";
    }
    return THAccessibilityLocalizedString((uint64_t)v3);
  }
  else if ([(THImageRepAccessibility *)self thaxIsPartOfAGallery])
  {
    unsigned int v4 = [(THImageRepAccessibility *)self thaxRelatedGalleryRep];
    UIAccessibilityTraits v5 = [(THWGalleryRepAccessibility *)v4 thaxItemCountDescriptionForCurrentItem];
    if ([(THWGalleryRepAccessibility *)v4 thaxTotalItemCount] < 2) {
      v12 = 0;
    }
    else {
      v12 = THAccessibilityLocalizedString(@"gallery.item.hint.ios");
    }
    return __TSAccessibilityStringForVariables(1, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)THImageRepAccessibility;
    return [(TSDRepAccessibility *)&v14 accessibilityHint];
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v5 = [(THImageRepAccessibility *)self thaxIsPartOfAGallery];
  if (v5)
  {
    uint64_t v6 = [(THImageRepAccessibility *)self thaxRelatedGalleryRep];
    if ([(THWGalleryRepAccessibility *)v6 thaxTotalItemCount] < 2
      || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 1 > 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      if (a3 == 5)
      {
        uint64_t v7 = @"handleNavigateNextCommand";
      }
      else
      {
        UIUserInterfaceLayoutDirection v8 = [+[UIApplication sharedApplication] userInterfaceLayoutDirection];
        uint64_t v7 = @"handleNavigateNextCommand";
        if ((a3 != 2 || v8)
          && ((char *)[+[UIApplication sharedApplication] userInterfaceLayoutDirection] != (char *)&dword_0 + 1|| a3 != 1))
        {
          uint64_t v7 = @"handleNavigatePreviousCommand";
        }
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_2888AC;
      v11[3] = &unk_457250;
      v11[4] = v6;
      v11[5] = NSSelectorFromString(&v7->isa);
      __TSAccessibilityPerformSafeBlock((uint64_t)v11);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (id)_accessibilityEquivalenceTag
{
  v5.receiver = self;
  v5.super_class = (Class)THImageRepAccessibility;
  id v3 = [(THImageRepAccessibility *)&v5 _accessibilityEquivalenceTag];
  if ([(THImageRepAccessibility *)self thaxIsPartOfAGallery]) {
    return [(THWGalleryRepAccessibility *)[(THImageRepAccessibility *)self thaxRelatedGalleryRep] thaxItemCountDescriptionForCurrentItem];
  }
  return v3;
}

- (BOOL)thaxIsElementIgnored
{
  v5.receiver = self;
  v5.super_class = (Class)THImageRepAccessibility;
  BOOL v3 = [(THTSDImageRepAccessibility *)&v5 thaxIsElementIgnored];
  if (v3)
  {
    if ([(THImageRepAccessibility *)self thaxPressableAction]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(THImageRepAccessibility *)self thaxIsPartOfAGallery];
    }
  }
  return v3;
}

@end