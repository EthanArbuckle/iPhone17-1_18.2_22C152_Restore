@interface TUIResourceCollector
+ (id)createImageResourceCollector;
+ (id)createImageResourceCollectorForLoaded;
+ (id)createImageResourceCollectorForNotLoadedInVisibleBounds:(CGRect)a3 viewState:(id)a4;
+ (id)createResourceCollectorForEverything;
+ (id)createResourceCollectorForVisibleBounds:(CGRect)a3 viewState:(id)a4;
@end

@implementation TUIResourceCollector

+ (id)createResourceCollectorForEverything
{
  v2 = -[_TUIResourceCollector initWithBounds:viewState:]([_TUIResourceCollector alloc], "initWithBounds:viewState:", 0, CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height);

  return v2;
}

+ (id)createResourceCollectorForVisibleBounds:(CGRect)a3 viewState:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = -[_TUIResourceCollector initWithBounds:viewState:]([_TUIResourceCollector alloc], "initWithBounds:viewState:", v8, x, y, width, height);

  return v9;
}

+ (id)createImageResourceCollectorForLoaded
{
  v2 = objc_alloc_init(_TUILoadedImageResourceCollector);

  return v2;
}

+ (id)createImageResourceCollectorForNotLoadedInVisibleBounds:(CGRect)a3 viewState:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v9 = -[_TUIImageResourceCollector initWithBounds:viewState:]([_TUINotLoadedImageResourceCollector alloc], "initWithBounds:viewState:", v8, x, y, width, height);

  return v9;
}

+ (id)createImageResourceCollector
{
  v2 = objc_alloc_init(_TUIImageResourceCollector);

  return v2;
}

@end