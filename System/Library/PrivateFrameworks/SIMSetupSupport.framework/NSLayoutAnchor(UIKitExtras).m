@interface NSLayoutAnchor(UIKitExtras)
- (id)constraintEqualToAnchor:()UIKitExtras constant:priority:;
@end

@implementation NSLayoutAnchor(UIKitExtras)

- (id)constraintEqualToAnchor:()UIKitExtras constant:priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

@end