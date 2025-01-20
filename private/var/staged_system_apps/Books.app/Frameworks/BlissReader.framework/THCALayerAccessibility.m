@interface THCALayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_axMarginNoteBoundsInCanvasView;
- (CGRect)accessibilityFrame;
- (THCachedAnnotationAccessibility)thaxAssociatedAnnotation;
- (id)_accessibilityContainingParentForOrdering;
- (id)_accessibilityTouchContainer;
- (id)_axParentRep;
- (void)thaxSetAssociatedAnnotation:(id)a3;
@end

@implementation THCALayerAccessibility

+ (id)tsaxTargetClassName
{
  return @"CALayer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THCALayerAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"THCALayerAccessibility"];
}

- (THCachedAnnotationAccessibility)thaxAssociatedAnnotation
{
  return (THCachedAnnotationAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_573A7D);
}

- (void)thaxSetAssociatedAnnotation:(id)a3
{
}

- (CGRect)_axMarginNoteBoundsInCanvasView
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [(THCALayerAccessibility *)self thaxAssociatedAnnotation];
  if (v7)
  {
    v8 = v7;
    id v9 = [(THCachedAnnotationAccessibility *)v7 thaxParentHighlightController];
    id v10 = [v9 tsaxValueForKey:@"parentRep"];
    id v11 = objc_msgSend(objc_msgSend(v10, "tsaxValueForKey:", @"canvas"), "tsaxValueForKey:", @"canvasController");
    id v12 = objc_msgSend(objc_msgSend(v11, "tsaxValueForKey:", @"canvasView"), "tsaxValueForKey:", @"layer");
    if (v12)
    {
      id v13 = v12;
      uint64_t v28 = 0;
      v29 = (CGRect *)&v28;
      uint64_t v30 = 0x4010000000;
      v31 = &unk_41622E;
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      CGSize v33 = size;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_29C138;
      v27[3] = &unk_46C900;
      v27[7] = v11;
      v27[8] = &v28;
      v27[4] = v9;
      v27[5] = v8;
      v27[6] = v10;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v27)) {
        abort();
      }
      [(THCALayerAccessibility *)self bounds];
      -[THCALayerAccessibility convertRect:toLayer:](self, "convertRect:toLayer:", v13);
      CGFloat x = v15;
      CGFloat y = v16;
      CGFloat width = v17;
      double height = v18;
      double MinY = CGRectGetMinY(v29[1]);
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.double height = height;
      if (MinY < CGRectGetMinY(v34))
      {
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.double height = height;
        double v20 = CGRectGetMinY(v35);
        if (v20 < CGRectGetMaxY(v29[1])) {
          CGFloat y = CGRectGetMinY(v29[1]);
        }
      }
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.double height = height;
      double MaxY = CGRectGetMaxY(v36);
      if (MaxY < CGRectGetMaxY(v29[1]))
      {
        double v22 = CGRectGetMaxY(v29[1]);
        v37.origin.CGFloat x = x;
        v37.origin.CGFloat y = y;
        v37.size.CGFloat width = width;
        v37.size.double height = height;
        double height = height + v22 - CGRectGetMaxY(v37);
      }
      _Block_object_dispose(&v28, 8);
    }
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)accessibilityFrame
{
  [(THCALayerAccessibility *)self _axMarginNoteBoundsInCanvasView];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (CGRectIsEmpty(v12))
  {
    v11.receiver = self;
    v11.super_class = (Class)THCALayerAccessibility;
    [(THCALayerAccessibility *)&v11 accessibilityFrame];
  }
  else
  {
    [self tsaxValueForKey:@"accessibilityContainer"] tsaxFrameFromBounds:x, y, width, height];
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  v9.receiver = self;
  v9.super_class = (Class)THCALayerAccessibility;
  [(THCALayerAccessibility *)&v9 accessibilityFrame];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (id)_axParentRep
{
  id v2 = [(THCachedAnnotationAccessibility *)[(THCALayerAccessibility *)self thaxAssociatedAnnotation] tsaxValueForKey:@"thaxParentHighlightController"];

  return [v2 tsaxValueForKey:@"parentRep"];
}

- (id)_accessibilityContainingParentForOrdering
{
  id result = [[-[THCALayerAccessibility _axParentRep](self, "_axParentRep")] tsaxValueForKey:@"thaxTextAndMarginNotesLayersContainer"];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THCALayerAccessibility;
    return [(THCALayerAccessibility *)&v4 _accessibilityContainingParentForOrdering];
  }
  return result;
}

- (id)_accessibilityTouchContainer
{
  id result = [[-[THCALayerAccessibility _axParentRep](self, "_axParentRep") tsaxValueForKey:@"thaxMarginNotesLayersTouchContainer"]
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THCALayerAccessibility;
    return [(THCALayerAccessibility *)&v4 _accessibilityTouchContainer];
  }
  return result;
}

@end