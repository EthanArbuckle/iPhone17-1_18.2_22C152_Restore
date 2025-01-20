@interface THWReviewImageAnswerChoiceStateAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxButtonControlRepIsSelected:(id)a3;
- (id)thaxLabelForButtonControlRep:(id)a3;
- (int)_thaxChoiceState;
@end

@implementation THWReviewImageAnswerChoiceStateAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewImageAnswerChoiceState";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  unsigned int v4 = [(THWReviewImageAnswerChoiceStateAccessibility *)self _thaxChoiceState];
  if (v4 == 1)
  {
    CFStringRef v5 = @"review.answer.correct";
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    CFStringRef v5 = @"review.answer.incorrect";
LABEL_5:
    v6 = THAccessibilityLocalizedString((uint64_t)v5);
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:
  char v16 = 0;
  v7 = (objc_class *)objc_opt_class();
  v8 = (void *)__TSAccessibilityCastAsClass(v7, (uint64_t)[(THWReviewImageAnswerChoiceStateAccessibility *)self tsaxValueForKey:@"choiceAccessibilityDescription"], 1, &v16);
  if (v16) {
    abort();
  }
  return __TSAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v6);
}

- (BOOL)thaxButtonControlRepIsSelected:(id)a3
{
  return [(THWReviewImageAnswerChoiceStateAccessibility *)self tsaxBoolValueForKey:@"selected"];
}

- (int)_thaxChoiceState
{
  return [[self tsaxValueForKey:@"choiceState"] unsignedIntegerValue];
}

@end