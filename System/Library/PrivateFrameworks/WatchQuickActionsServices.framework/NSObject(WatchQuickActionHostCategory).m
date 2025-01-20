@interface NSObject(WatchQuickActionHostCategory)
- (void)setQuickActionHostObserver:()WatchQuickActionHostCategory;
@end

@implementation NSObject(WatchQuickActionHostCategory)

- (void)setQuickActionHostObserver:()WatchQuickActionHostCategory
{
  id v7 = a3;
  v4 = objc_getAssociatedObject(a1, &WQAHostObserverIdentifier);
  v5 = v4;
  if (v4) {
    [v4 setHostObserver:0];
  }
  if (v7)
  {
    v6 = objc_opt_new();
    [v6 setHostObserver:v7];
    objc_setAssociatedObject(a1, &WQAHostObserverIdentifier, v6, (void *)1);
  }
  else
  {
    objc_setAssociatedObject(a1, &WQAHostObserverIdentifier, 0, (void *)1);
  }
}

@end