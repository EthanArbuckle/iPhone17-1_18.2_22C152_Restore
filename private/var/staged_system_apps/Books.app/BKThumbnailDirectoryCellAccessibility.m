@interface BKThumbnailDirectoryCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation BKThumbnailDirectoryCellAccessibility

+ (id)imaxTargetClassName
{
  return @"BKThumbnailDirectoryCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v15.receiver = self;
  v15.super_class = (Class)BKThumbnailDirectoryCellAccessibility;
  v3 = [(BKThumbnailDirectoryCellAccessibility *)&v15 accessibilityLabel];
  v4 = [(BKThumbnailDirectoryCellAccessibility *)self imaxValueForKey:@"pageView"];
  v5 = [v4 imaxValueForKey:@"pageNumber"];
  id v6 = [v5 intValue];

  if ((int)v6 >= 1)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Page %d" value:&stru_100A70340 table:0];

    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);

    v3 = (void *)v9;
  }
  v10 = [(BKThumbnailDirectoryCellAccessibility *)self imaxValueForKey:@"hasRibbon"];
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    v14 = sub_1000B86A8(@"has.bookmark");
    uint64_t v12 = __IMAccessibilityStringForVariables();

    v3 = (void *)v12;
  }

  return v3;
}

- (CGRect)accessibilityFrame
{
  v27.receiver = self;
  v27.super_class = (Class)BKThumbnailDirectoryCellAccessibility;
  [(BKThumbnailDirectoryCellAccessibility *)&v27 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  unsigned int v11 = [(BKThumbnailDirectoryCellAccessibility *)self imaxValueForKey:@"contentView"];
  uint64_t v12 = __IMAccessibilityCastAsClass();

  [v12 bounds];
  uint64_t v21 = 0;
  v22 = (double *)&v21;
  uint64_t v23 = 0x4010000000;
  v24 = &unk_10092E1A3;
  long long v25 = 0u;
  long long v26 = 0u;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
  double v13 = v22[4];
  double v14 = v22[5];
  CGFloat v16 = v22[6];
  CGFloat v15 = v22[7];
  _Block_object_dispose(&v21, 8);
  v30.origin.x = CGRectZero.origin.x;
  v30.origin.y = CGRectZero.origin.y;
  v30.size.width = CGRectZero.size.width;
  v30.size.height = CGRectZero.size.height;
  v28.origin.x = v13;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v15;
  if (CGRectEqualToRect(v28, v30))
  {
    CGFloat v15 = v10;
    CGFloat v16 = v8;
  }
  else
  {
    double v4 = v4 + v13;
    double v6 = v6 + v14;
  }
  double v17 = v4;
  double v18 = v6;
  double v19 = v16;
  double v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

@end