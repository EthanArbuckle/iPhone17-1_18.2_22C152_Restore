@interface UIInterfaceActionConcreteVisualStyleFactory_iOS
+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
@end

@implementation UIInterfaceActionConcreteVisualStyleFactory_iOS

+ (id)styleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v5 = a3;
  v6 = (Class *)off_1E52D3BE0;
  v7 = off_1E52D3BE8;
  if (a4 != 1) {
    v7 = off_1E52D3BD8;
  }
  if (a4 != 2) {
    v6 = (Class *)v7;
  }
  id v8 = objc_alloc_init(*v6);

  return v8;
}

@end