@interface _UIFloatingTabBarPlatformMetrics_Mac
- (_UIFloatingTabBarPlatformMetrics_Mac)init;
@end

@implementation _UIFloatingTabBarPlatformMetrics_Mac

- (_UIFloatingTabBarPlatformMetrics_Mac)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBarPlatformMetrics_Mac;
  v2 = [(_UIFloatingTabBarPlatformMetrics *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_UIFloatingTabBarPlatformMetrics *)v2 setBackgroundEffect:0];
    [(_UIFloatingTabBarPlatformMetrics *)v3 setSidebarBorderWidth:2.0];
    [(_UIFloatingTabBarPlatformMetrics *)v3 setSidebarBorderInsideBounds:0];
    [(_UIFloatingTabBarPlatformMetrics *)v3 setSidebarPrefersMacAppearance:1];
  }
  return v3;
}

@end