@interface NSObject(TCObjectAdditions)
+ (BOOL)tc_overridesClassMethod:()TCObjectAdditions;
@end

@implementation NSObject(TCObjectAdditions)

+ (BOOL)tc_overridesClassMethod:()TCObjectAdditions
{
  v5 = (objc_class *)objc_opt_class();
  Method ClassMethod = class_getClassMethod(v5, a3);
  return ClassMethod != class_getClassMethod((Class)[a1 superclass], a3);
}

@end