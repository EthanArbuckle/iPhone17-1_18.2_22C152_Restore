@interface NDOTypeChecking
+ (BOOL)isNotEmptyString:(id)a3;
@end

@implementation NDOTypeChecking

+ (BOOL)isNotEmptyString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 length] != 0;

  return v4;
}

@end