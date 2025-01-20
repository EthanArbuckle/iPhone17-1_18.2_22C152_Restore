@interface UIInputViewSetPlacementOffScreenDownByScreenHeight
+ (BOOL)supportsSecureCoding;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
@end

@implementation UIInputViewSetPlacementOffScreenDownByScreenHeight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  v5 = a4;
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E4F5B268];
    id v7 = a5;
    id v8 = v5;
    [v7 frame];
    double v10 = v9;
    [v8 frame];
    v5 = [v6 constraintWithItem:v8 attribute:3 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:v10 - v11];
  }
  return v5;
}

@end