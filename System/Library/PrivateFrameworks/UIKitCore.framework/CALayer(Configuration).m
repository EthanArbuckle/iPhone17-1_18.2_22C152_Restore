@interface CALayer(Configuration)
- (uint64_t)_configureUsingLayer:()Configuration;
@end

@implementation CALayer(Configuration)

- (uint64_t)_configureUsingLayer:()Configuration
{
  id v4 = a3;
  v5 = [v4 contentsGravity];
  [a1 setContentsGravity:v5];

  objc_msgSend(a1, "setNeedsDisplayOnBoundsChange:", objc_msgSend(v4, "needsDisplayOnBoundsChange"));
  v6 = [v4 contentsFormat];
  [a1 setContentsFormat:v6];

  objc_msgSend(a1, "setContentsMultiplyColor:", objc_msgSend(v4, "contentsMultiplyColor"));
  [v4 contentsScale];
  double v8 = v7;

  return [a1 setContentsScale:v8];
}

@end