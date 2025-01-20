@interface UISceneHitTestActionResponse
- (UISceneHitTestActionResponse)initWithProcessIdentifier:(int)a3;
- (int)processIdentifer;
@end

@implementation UISceneHitTestActionResponse

- (UISceneHitTestActionResponse)initWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInt:v3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)UISceneHitTestActionResponse;
  v7 = [(UISceneHitTestActionResponse *)&v9 initWithInfo:v5 error:0];

  return v7;
}

- (int)processIdentifer
{
  v2 = [(UISceneHitTestActionResponse *)self info];
  uint64_t v3 = [v2 objectForSetting:1];
  int v4 = [v3 intValue];

  return v4;
}

@end