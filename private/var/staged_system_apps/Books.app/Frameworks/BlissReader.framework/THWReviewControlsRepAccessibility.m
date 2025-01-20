@interface THWReviewControlsRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_thaxNextButtonHidden;
- (BOOL)_thaxPrevButtonHidden;
- (BOOL)thaxButtonControlRepIsIgnored:(id)a3;
- (id)thaxLabelForButtonControlRep:(id)a3;
- (int)thaxCheckAnswerButtonState;
@end

@implementation THWReviewControlsRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewControlsRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (int)thaxCheckAnswerButtonState
{
  return [self tsaxValueForKey:@"checkAnswerButtonState"] unsignedIntegerValue];
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  v4 = (char *)[a3 thaxTag];
  if (!v4)
  {
    CFStringRef v5 = @"widgets.review.previous.description";
    goto LABEL_8;
  }
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    unsigned int v6 = [(THWReviewControlsRepAccessibility *)self thaxCheckAnswerButtonState];
    if (v6 <= 3)
    {
      CFStringRef v5 = off_46C400[v6];
      goto LABEL_8;
    }
    return 0;
  }
  if (v4 != (unsigned char *)&dword_0 + 1) {
    return 0;
  }
  CFStringRef v5 = @"widgets.review.next.description";
LABEL_8:

  return THAccessibilityLocalizedString((uint64_t)v5);
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  v4 = (char *)[a3 thaxTag];
  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    return [(THWReviewControlsRepAccessibility *)self _thaxNextButtonHidden];
  }
  else if (v4)
  {
    return 0;
  }
  else
  {
    return [(THWReviewControlsRepAccessibility *)self _thaxPrevButtonHidden];
  }
}

- (BOOL)_thaxPrevButtonHidden
{
  return [(THWReviewControlsRepAccessibility *)self tsaxBoolValueForKey:@"prevButtonHidden"];
}

- (BOOL)_thaxNextButtonHidden
{
  return [(THWReviewControlsRepAccessibility *)self tsaxBoolValueForKey:@"nextButtonHidden"];
}

@end