@interface TSWReviewAnswerStateValueTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation TSWReviewAnswerStateValueTransformer

+ (id)allowedTopLevelClasses
{
  uint64_t v3 = objc_opt_class();
  return +[NSArray arrayWithObjects:&v3 count:1];
}

@end