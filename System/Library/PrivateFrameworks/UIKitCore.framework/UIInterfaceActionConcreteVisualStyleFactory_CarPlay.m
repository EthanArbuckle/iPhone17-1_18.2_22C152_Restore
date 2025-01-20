@interface UIInterfaceActionConcreteVisualStyleFactory_CarPlay
+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
@end

@implementation UIInterfaceActionConcreteVisualStyleFactory_CarPlay

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  v4 = off_1E52D3BD0;
  if (a4) {
    v4 = off_1E52D3BC8;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

@end