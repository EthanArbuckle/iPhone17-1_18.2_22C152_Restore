@interface THPFDContext
+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3;
@end

@implementation THPFDContext

+ (BOOL)isBagRefetchRequiredForStatus:(int64_t)a3
{
  return +[PFDContext isBagRefetchRequiredForStatus:a3];
}

@end