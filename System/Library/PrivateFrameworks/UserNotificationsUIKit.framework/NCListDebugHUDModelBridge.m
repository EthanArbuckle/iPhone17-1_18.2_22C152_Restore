@interface NCListDebugHUDModelBridge
+ (void)chartProperty:(double)a3 label:(id)a4 inListView:(id)a5;
+ (void)plotProperty:(double)a3 label:(id)a4 inListView:(id)a5;
+ (void)plotRect:(CGRect)a3 label:(id)a4;
+ (void)trackListView:(id)a3;
+ (void)updateNotificationCount:(int64_t)a3;
- (NCListDebugHUDModelBridge)init;
@end

@implementation NCListDebugHUDModelBridge

+ (void)trackListView:(id)a3
{
  id v4 = a3;
  sub_1D7D2B4E4(a3);
}

+ (void)plotProperty:(double)a3 label:(id)a4 inListView:(id)a5
{
}

+ (void)plotRect:(CGRect)a3 label:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = sub_1D7D7F790();
  sub_1D7D7A630(v8, v9, x, y, width, height);

  swift_bridgeObjectRelease();
}

+ (void)chartProperty:(double)a3 label:(id)a4 inListView:(id)a5
{
}

+ (void)updateNotificationCount:(int64_t)a3
{
}

- (NCListDebugHUDModelBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)NCListDebugHUDModelBridge;
  return [(NCListDebugHUDModelBridge *)&v3 init];
}

@end