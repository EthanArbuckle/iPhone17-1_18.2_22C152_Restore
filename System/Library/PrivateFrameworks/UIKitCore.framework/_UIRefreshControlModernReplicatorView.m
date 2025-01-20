@interface _UIRefreshControlModernReplicatorView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _UIRefreshControlModernReplicatorView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIRefreshControlModernReplicatorView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"instanceCount"] & 1) != 0
    || ([v4 isEqualToString:@"instanceAlphaOffset"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"instanceColor"];
  }

  return v5;
}

@end