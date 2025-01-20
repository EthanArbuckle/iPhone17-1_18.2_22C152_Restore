@interface _UIApplicationSceneDisplayHostComponent
- (void)setDisplayBasedSafeAreaInsets:(UIEdgeInsets)a3 forSettings:(id)a4;
@end

@implementation _UIApplicationSceneDisplayHostComponent

- (void)setDisplayBasedSafeAreaInsets:(UIEdgeInsets)a3 forSettings:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F29238];
  UIEdgeInsets v7 = a3;
  id v5 = a4;
  v6 = [v4 valueWithBytes:&v7 objCType:"{UIEdgeInsets=dddd}"];
  objc_msgSend(v5, "setDisplayBasedSafeAreaInsetsValue:", v6, *(void *)&v7.top, *(void *)&v7.left, *(void *)&v7.bottom, *(void *)&v7.right);
}

@end