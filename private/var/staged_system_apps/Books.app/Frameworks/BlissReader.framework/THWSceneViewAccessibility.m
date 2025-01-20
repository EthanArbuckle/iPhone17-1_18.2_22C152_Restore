@interface THWSceneViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (double)thaxAccessibilityFrameBottomInset;
- (double)thaxAccessibilityFrameLeftInset;
- (double)thaxAccessibilityFrameRightInset;
- (double)thaxAccessibilityFrameTopInset;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)thaxSetAccessibilityFrameBottomInset:(double)a3;
- (void)thaxSetAccessibilityFrameLeftInset:(double)a3;
- (void)thaxSetAccessibilityFrameRightInset:(double)a3;
- (void)thaxSetAccessibilityFrameTopInset:(double)a3;
@end

@implementation THWSceneViewAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString(@"3d.model");
}

- (unint64_t)accessibilityTraits
{
  return TSAccessibilityTraitAllowsDirectInteraction;
}

- (CGRect)accessibilityFrame
{
  v26.receiver = self;
  v26.super_class = (Class)THWSceneViewAccessibility;
  [(THWSceneViewAccessibility *)&v26 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameLeftInset];
  double v12 = v11 + v4;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameTopInset];
  double v14 = v6 + v13;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameLeftInset];
  double v16 = v8 - v15;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameRightInset];
  double v18 = v16 - v17;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameTopInset];
  double v20 = v10 - v19;
  [(THWSceneViewAccessibility *)self thaxAccessibilityFrameBottomInset];
  double v22 = v20 - v21;
  double v23 = v12;
  double v24 = v14;
  double v25 = v18;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"THWSceneView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (double)thaxAccessibilityFrameTopInset
{
  __TSAccessibilityGetAssociatedCGFloat(self, &unk_573A73);
  return result;
}

- (void)thaxSetAccessibilityFrameTopInset:(double)a3
{
}

- (double)thaxAccessibilityFrameLeftInset
{
  __TSAccessibilityGetAssociatedCGFloat(self, &unk_573A74);
  return result;
}

- (void)thaxSetAccessibilityFrameLeftInset:(double)a3
{
}

- (double)thaxAccessibilityFrameRightInset
{
  __TSAccessibilityGetAssociatedCGFloat(self, &unk_573A75);
  return result;
}

- (void)thaxSetAccessibilityFrameRightInset:(double)a3
{
}

- (double)thaxAccessibilityFrameBottomInset
{
  __TSAccessibilityGetAssociatedCGFloat(self, &unk_573A76);
  return result;
}

- (void)thaxSetAccessibilityFrameBottomInset:(double)a3
{
}

@end