@interface CXCommon
+ (void)initialize;
@end

@implementation CXCommon

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    CXNoNamespace = objc_alloc_init(CXUnqualifiedNamespace);
  }
}

@end