@interface THWReviewRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3;
- (id)_thaxRepForQuestion:(id)a3;
- (id)thaxScrollStatusStringForScrollView:(id)a3;
- (unint64_t)thaxQuestionCount;
- (unint64_t)thaxQuestionIndex;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)p_checkQuestionAnswer:(id)a3;
@end

@implementation THWReviewRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxQuestionIndex
{
  v2 = [(THTSDRepAccessibility *)self tsaxLayout];

  return (unint64_t)[(THTSDLayoutAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"questionIndex"];
}

- (unint64_t)thaxQuestionCount
{
  v2 = [(THTSDRepAccessibility *)self tsaxLayout];

  return (unint64_t)[(THTSDLayoutAccessibility *)v2 tsaxUnsignedIntegerValueForKey:@"questionCount"];
}

- (void)p_checkQuestionAnswer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility p_checkQuestionAnswer:](&v9, "p_checkQuestionAnswer:");
  id v5 = [(THWReviewRepAccessibility *)self _thaxRepForQuestion:a3];
  char v8 = 0;
  v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[(TSDRepAccessibility *)self tsaxInfo], 1, &v8);
  if (v8) {
    abort();
  }
  TSAccessibilityPostHighPriorityAnnouncementNotification(0, (uint64_t)-[objc_class thaxLocalizedDescriptionForQuestionState:](v7, "thaxLocalizedDescriptionForQuestionState:", [v5 questionState]));
}

- (id)_thaxRepForQuestion:(id)a3
{
  uint64_t v6 = 0;
  Class v7 = &v6;
  uint64_t v8 = 0x3052000000;
  objc_super v9 = sub_28535C;
  v10 = sub_28536C;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_285378;
  v5[3] = &unk_457DA0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  id result = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THWReviewQuestionRep, v3, 1, &v6);
  if ((_BYTE)v6) {
    abort();
  }
  return result;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility control:repWasAdded:](&v12, "control:repWasAdded:", a3);
  uint64_t v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a4, 0, 0);
  if (v7)
  {
    Class v8 = v7;
    char v11 = 0;
    objc_super v9 = objc_opt_class();
    Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(objc_class *)v8 thaxScrollView], 1, &v11);
    if (v11) {
      abort();
    }
    [(objc_class *)v10 thaxSetScrollingDelegate:self];
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)THWReviewRepAccessibility;
  -[THWReviewRepAccessibility control:repWillBeRemoved:](&v11, "control:repWillBeRemoved:", a3);
  id v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)a4, 0, 0);
  if (v6)
  {
    Class v7 = v6;
    char v10 = 0;
    Class v8 = objc_opt_class();
    Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[(objc_class *)v7 thaxScrollView], 1, &v10);
    if (v10) {
      abort();
    }
    [(objc_class *)v9 thaxSetScrollingDelegate:0];
  }
}

- (BOOL)thaxShouldPreventPageScrolledNotificationForScrollView:(id)a3
{
  return 1;
}

- (id)thaxScrollStatusStringForScrollView:(id)a3
{
  v4 = THAccessibilityLocalizedString(@"widgets.review.question.number %@ %@");
  id v5 = TSAccessibilityLocalizedUnsignedInteger((uint64_t)[(THWReviewRepAccessibility *)self thaxQuestionIndex] + 1);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5, TSAccessibilityLocalizedUnsignedInteger([(THWReviewRepAccessibility *)self thaxQuestionCount]));
}

@end