@interface _UIBlurThroughEffect
+ (id)_blurThroughWithStyle:(int64_t)a3;
- (BOOL)_indicatesMacSidebarBackground;
- (_UIBlurThroughEffect)initWithStyle:(int64_t)a3;
- (int64_t)_expectedUsage;
@end

@implementation _UIBlurThroughEffect

- (_UIBlurThroughEffect)initWithStyle:(int64_t)a3
{
  return 0;
}

+ (id)_blurThroughWithStyle:(int64_t)a3
{
  v3 = [[_UIBlurThroughEffect alloc] initWithStyle:a3];
  return v3;
}

- (int64_t)_expectedUsage
{
  return 1;
}

- (BOOL)_indicatesMacSidebarBackground
{
  return 1;
}

@end