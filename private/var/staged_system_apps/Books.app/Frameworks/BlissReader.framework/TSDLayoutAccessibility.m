@interface TSDLayoutAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDLayoutGeometryAccessibility)tsaxInspectorGeometry;
- (TSDRepAccessibility)tsaxRepForLayout;
- (TSWPStorageAccessibility)tsaxStorage;
- (void)dragBy:(CGPoint)a3;
- (void)invalidate;
@end

@implementation TSDLayoutAccessibility

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v24.receiver = self;
  v24.super_class = (Class)TSDLayoutAccessibility;
  -[TSDLayoutAccessibility dragBy:](&v24, "dragBy:");
  +[TSDRepAccessibility tsaxCurrentRepDragOffset];
  BOOL v14 = vabdd_f64(v11, x) <= 2.0;
  double v13 = vabdd_f64(v12, y);
  BOOL v14 = v14 && v13 <= 2.0;
  if (!v14)
  {
    double v15 = fabs(x);
    if (x == 0.0)
    {
      v17 = 0;
    }
    else
    {
      if (x <= 0.0) {
        CFStringRef v16 = @"moving.object.left";
      }
      else {
        CFStringRef v16 = @"moving.object.right";
      }
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v16), *(void *)&v15);
    }
    if (y == 0.0)
    {
      v20 = 0;
      double v18 = fabs(y);
    }
    else
    {
      double v18 = fabs(y);
      if (y <= 0.0) {
        CFStringRef v19 = @"moving.object.up";
      }
      else {
        CFStringRef v19 = @"moving.object.down";
      }
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v19), *(void *)&v18);
    }
    if (v15 <= v18) {
      v21 = v20;
    }
    else {
      v21 = v17;
    }
    if (v15 <= v18) {
      uint64_t v22 = (uint64_t)v17;
    }
    else {
      uint64_t v22 = (uint64_t)v20;
    }
    v23 = __TSAccessibilityStringForVariables(1, v21, v5, v6, v7, v8, v9, v10, v22);
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v23);
    UIAccessibilityPostNotification(TSAccessibilityElementMovedNotification, 0);
    +[TSDRepAccessibility tsaxSetCurrentRepDragOffset:](TSDRepAccessibility, "tsaxSetCurrentRepDragOffset:", x, y);
  }
}

+ (id)tsaxTargetClassName
{
  return @"TSDLayout";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSDLayoutGeometryAccessibility)tsaxInspectorGeometry
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSDLayoutGeometryAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDLayoutAccessibility *)self tsaxValueForKey:@"inspectorGeometry"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  return 0;
}

- (TSDRepAccessibility)tsaxRepForLayout
{
  char v8 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[-[TSDLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"layoutController") tsaxValueForKey:@"canvas"], 1, &v8);
  if (v8) {
    abort();
  }
  Class v5 = v4;
  uint64_t v6 = objc_opt_class();
  return (TSDRepAccessibility *)[__TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[(objc_class *)v5 tsaxInteractiveCanvasController], 0, 0) tsaxRepForLayout:self];
}

- (void)invalidate
{
  v15.receiver = self;
  v15.super_class = (Class)TSDLayoutAccessibility;
  [(TSDLayoutAccessibility *)&v15 invalidate];
  v3 = [(TSDLayoutAccessibility *)self tsaxStorage];
  if (v3)
  {
    Class v4 = v3;
    char v14 = 0;
    Class v5 = objc_opt_class();
    Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[-[TSDLayoutAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"layoutController") tsaxValueForKey:@"canvas"], 1, &v14);
    if (v14) {
      abort();
    }
    Class v7 = v6;
    char v8 = objc_opt_class();
    Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[(objc_class *)v7 tsaxInteractiveCanvasController], 0, 0);
    if (v9)
    {
      Class v10 = v9;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_27003C;
      v13[3] = &unk_46BAA0;
      v13[4] = v9;
      [(TSWPStorageAccessibility *)v4 tsaxEnumerateAttachmentsUsingBlock:v13];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_270048;
      v12[3] = &unk_46BAC8;
      v12[4] = v10;
      [(TSWPStorageAccessibility *)v4 tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:v12];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_270054;
      v11[3] = &unk_46BAF0;
      v11[4] = v10;
      [(TSWPStorageAccessibility *)v4 tsaxEnumerateSmartFieldsUsingBlock:v11];
    }
  }
}

@end