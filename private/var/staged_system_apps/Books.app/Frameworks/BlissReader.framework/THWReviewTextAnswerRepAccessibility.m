@interface THWReviewTextAnswerRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsSelected;
- (BOOL)thaxShouldHideChildReps;
- (NSString)thaxAnswerAccessibilityDescription;
- (NSString)thaxAnswerLetter;
- (NSString)thaxAnswerStateDescription;
- (NSString)thaxAnswerText;
- (NSString)thaxAnswerTextWithAccessibilityDescription;
- (id)accessibilityLabel;
- (int)_thaxRadioState;
- (int)_thaxState;
- (unint64_t)accessibilityTraits;
- (void)thaxSelectAnswer;
@end

@implementation THWReviewTextAnswerRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewTextAnswerRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)thaxAnswerStateDescription
{
  unsigned int v2 = [(THWReviewTextAnswerRepAccessibility *)self _thaxState];
  if (v2 == 1)
  {
    CFStringRef v3 = @"review.answer.correct";
  }
  else
  {
    if (v2 != 2) {
      return 0;
    }
    CFStringRef v3 = @"review.answer.incorrect";
  }

  return THAccessibilityLocalizedString((uint64_t)v3);
}

- (BOOL)thaxIsSelected
{
  return [(THWReviewTextAnswerRepAccessibility *)self _thaxRadioState] == 2;
}

- (NSString)thaxAnswerTextWithAccessibilityDescription
{
  CFStringRef v3 = [(THWReviewTextAnswerRepAccessibility *)self thaxAnswerAccessibilityDescription];
  v4 = [(THWReviewTextAnswerRepAccessibility *)self thaxAnswerText];
  if ([(NSString *)v3 isEqualToString:v4]) {
    return v3;
  }
  else {
    return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
}

- (NSString)thaxAnswerAccessibilityDescription
{
  char v5 = 0;
  CFStringRef v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"p_answerAccessibilityDescription"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxAnswerText
{
  char v5 = 0;
  CFStringRef v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"p_answerText"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxAnswerLetter
{
  unint64_t v2 = (unint64_t)[(TSDLayoutAccessibility *)[(TSDRepAccessibility *)self tsaxLayout] tsaxUnsignedIntegerValueForKey:@"index"];
  uint64_t v3 = v2;
  if (v2 > 5) {
    v4 = 0;
  }
  else {
    v4 = THAccessibilityLocalizedString((uint64_t)off_46C740[v2]);
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (![(NSString *)v4 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"No letter provided for quiz answer at index: %lu", v6, v7, v8, v9, v10, v3))abort(); {
    }
      }
  }
  return v4;
}

- (void)thaxSelectAnswer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_28F894;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (int)_thaxState
{
  return [[self tsaxValueForKey:@"state"] unsignedIntegerValue];
}

- (int)_thaxRadioState
{
  return [[self tsaxValueForKey:@"radioState"] unsignedIntegerValue];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2 = UIAccessibilityTraitButton;
  unsigned int v3 = [(THWReviewTextAnswerRepAccessibility *)self thaxIsSelected];
  UIAccessibilityTraits v4 = UIAccessibilityTraitSelected;
  if (!v3) {
    UIAccessibilityTraits v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityLabel
{
  unsigned int v3 = [(THWReviewTextAnswerRepAccessibility *)self thaxAnswerLetter];
  UIAccessibilityTraits v4 = [(THWReviewTextAnswerRepAccessibility *)self thaxAnswerTextWithAccessibilityDescription];
  [(THWReviewTextAnswerRepAccessibility *)self thaxAnswerStateDescription];
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

@end