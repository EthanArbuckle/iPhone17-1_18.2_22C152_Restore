@interface TSADocumentManagerViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxShouldEnterIntermediateStateUponScrolling;
- (BOOL)shouldReuseCells;
- (id)dequeueReusableCellWithIdentifier:(id)a3;
- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (void)_detachCell:(id)a3 assignedCellsIndex:(unint64_t)a4;
- (void)_detachPlaceholderViewAtIndex:(unint64_t)a3;
- (void)_loadCells;
- (void)_trimReusableCells;
- (void)_tsaxPerformBlockCaringAboutReusingCells:(id)a3;
- (void)_tsaxSetShouldEnterIntermediateStateUponScrolling:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation TSADocumentManagerViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxShouldEnterIntermediateStateUponScrolling
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F4);
}

- (void)_tsaxSetShouldEnterIntermediateStateUponScrolling:(BOOL)a3
{
}

- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v10 = [(TSADocumentManagerViewAccessibility *)self _tsaxShouldEnterIntermediateStateUponScrolling];
  [(TSADocumentManagerViewAccessibility *)self _tsaxSetShouldEnterIntermediateStateUponScrolling:1];
  v11.receiver = self;
  v11.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility _accessibilityScrollToFrame:forView:](&v11, "_accessibilityScrollToFrame:forView:", a4, x, y, width, height);
  [(TSADocumentManagerViewAccessibility *)self _tsaxSetShouldEnterIntermediateStateUponScrolling:v10];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(TSADocumentManagerViewAccessibility *)self _tsaxShouldEnterIntermediateStateUponScrolling])
  {
    [(TSADocumentManagerViewAccessibility *)self tsaxValueForKey:@"_enterIntermediateState"];
  }
  v8.receiver = self;
  v8.super_class = (Class)TSADocumentManagerViewAccessibility;
  -[TSADocumentManagerViewAccessibility setContentOffset:animated:](&v8, "setContentOffset:animated:", v4, x, y);
}

- (BOOL)shouldReuseCells
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewAccessibility;
  return [(TSADocumentManagerViewAccessibility *)&v4 shouldReuseCells];
}

- (void)_tsaxPerformBlockCaringAboutReusingCells:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()
    && [(TSADocumentManagerViewAccessibility *)self tsaxBoolValueForKey:@"_shouldReuseCells"])
  {
    objc_super v4 = self;
    [(TSADocumentManagerViewAccessibility *)self setValue:+[NSNumber numberWithBool:0] forKey:@"_shouldReuseCells"];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSADocumentManagerViewAccessibility *)self setValue:+[NSNumber numberWithBool:1] forKey:@"_shouldReuseCells"];
  }
  else
  {
    v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_272E40;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSADocumentManagerViewAccessibility *)self _tsaxPerformBlockCaringAboutReusingCells:v3];
}

- (void)_loadCells
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_272F34;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  [(TSADocumentManagerViewAccessibility *)self _tsaxPerformBlockCaringAboutReusingCells:v2];
}

- (id)dequeueReusableCellWithIdentifier:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentManagerViewAccessibility;
  return [(TSADocumentManagerViewAccessibility *)&v6 dequeueReusableCellWithIdentifier:a3];
}

- (void)_detachCell:(id)a3 assignedCellsIndex:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSADocumentManagerViewAccessibility;
  [(TSADocumentManagerViewAccessibility *)&v5 _detachCell:a3 assignedCellsIndex:a4];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [self tsaxValueForKey:@"_reusableCells"] removeAllObjects;
  }
}

- (void)_detachPlaceholderViewAtIndex:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewAccessibility;
  [(TSADocumentManagerViewAccessibility *)&v4 _detachPlaceholderViewAtIndex:a3];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [self tsaxValueForKey:@"_placeholderViewPool"] removeAllObjects;
  }
}

- (void)_trimReusableCells
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [self tsaxValueForKey:@"_reusableCells" removeAllObjects];
    id v3 = [(TSADocumentManagerViewAccessibility *)self tsaxValueForKey:@"_placeholderViewPool"];
    [v3 removeAllObjects];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSADocumentManagerViewAccessibility;
    [(TSADocumentManagerViewAccessibility *)&v4 _trimReusableCells];
  }
}

@end