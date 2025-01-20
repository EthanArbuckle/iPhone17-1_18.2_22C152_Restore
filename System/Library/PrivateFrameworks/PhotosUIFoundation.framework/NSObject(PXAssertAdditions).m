@interface NSObject(PXAssertAdditions)
+ (id)px_descriptionForAssertionMessage;
- (id)px_descriptionForAssertionMessage;
@end

@implementation NSObject(PXAssertAdditions)

- (id)px_descriptionForAssertionMessage
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"<%@: %p>", v4, a1];

  return v5;
}

+ (id)px_descriptionForAssertionMessage
{
  v1 = NSString;
  v2 = NSStringFromClass(a1);
  v3 = [v1 stringWithFormat:@"<%@>", v2];

  return v3;
}

@end