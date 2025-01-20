@interface THAnnotationNoteCardInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)thaxBackDescription;
- (NSString)thaxBackHint;
- (NSString)thaxFrontDescription;
- (NSString)thaxFrontHint;
- (THCachedAnnotationAccessibility)_thaxAnnotation;
- (id)_wholeCardSideDescriptionFor:(id)a3;
@end

@implementation THAnnotationNoteCardInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THAnnotationNoteCardInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxFrontDescription
{
  v3 = [(THCachedAnnotationAccessibility *)[(THAnnotationNoteCardInfoAccessibility *)self _thaxAnnotation] thaxHighlightedTextDescription];

  return (NSString *)[(THAnnotationNoteCardInfoAccessibility *)self _wholeCardSideDescriptionFor:v3];
}

- (NSString)thaxFrontHint
{
  return THAccessibilityLocalizedString(@"study.card.annotation.highlight.hint.ios");
}

- (NSString)thaxBackDescription
{
  v3 = +[NSString stringWithFormat:THAccessibilityLocalizedString(@"study.card.annotation.note.format %@"), [(THCachedAnnotationAccessibility *)[(THAnnotationNoteCardInfoAccessibility *)self _thaxAnnotation] thaxNoteText]];

  return (NSString *)[(THAnnotationNoteCardInfoAccessibility *)self _wholeCardSideDescriptionFor:v3];
}

- (NSString)thaxBackHint
{
  return THAccessibilityLocalizedString(@"study.card.annotation.note.hint.ios");
}

- (THCachedAnnotationAccessibility)_thaxAnnotation
{
  char v14 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THAnnotationNoteCardInfoAccessibility *)self tsaxValueForKey:@"annotation"], 1, &v14);
  if (v14
    || (v5 = (THCachedAnnotationAccessibility *)v4, TSAccessibilityShouldPerformValidationChecks())
    && !v5
    && (int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Annotation is nil", v7, v8, v9, v10, v11, v13)))
  {
    abort();
  }
  return v5;
}

- (id)_wholeCardSideDescriptionFor:(id)a3
{
  id v5 = [(id)THBundle() localizedStringForKey:@"page %@" value:&stru_46D7E8 table:0];
  char v18 = 0;
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = __TSAccessibilityCastAsClass(v6, (uint64_t)[(THAnnotationNoteCardInfoAccessibility *)self tsaxValueForKey:@"pageNumberString"], 1, &v18);
  if (v18
    || (uint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7),
        char v17 = 0,
        uint64_t v9 = (objc_class *)objc_opt_class(),
        __TSAccessibilityCastAsClass(v9, (uint64_t)[(THAnnotationNoteCardInfoAccessibility *)self imaxValueForKey:@"title"], 1, &v17), v17))
  {
    abort();
  }
  return __TSAccessibilityStringForVariables(1, a3, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
}

@end