@interface BKSpreadThumbnailDirectoryCellAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation BKSpreadThumbnailDirectoryCellAccessibility

+ (id)imaxTargetClassName
{
  return @"BKSpreadThumbnailDirectoryCell";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(BKSpreadThumbnailDirectoryCellAccessibility *)self imaxValueForKey:@"spreadView"];
  v4 = [v3 imaxValueForKey:@"leftPageView"];
  v5 = [v3 imaxValueForKey:@"rightPageView"];
  v6 = [v4 imaxValueForKey:@"pageNumber"];
  id v7 = [v6 integerValue];

  v8 = [v5 imaxValueForKey:@"pageNumber"];
  id v9 = [v8 integerValue];

  v10 = +[NSNumber numberWithInteger:v7];
  v11 = +[NSNumberFormatter imaxLocalizedNumber:v10];

  v12 = +[NSNumber numberWithInteger:v9];
  v13 = +[NSNumberFormatter imaxLocalizedNumber:v12];

  BOOL v15 = v7 == (id)0x7FFFFFFFFFFFFFFFLL || v4 == 0;
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL || !v5)
  {
    if (v15)
    {
      v17 = 0;
      goto LABEL_18;
    }
    v16 = sub_1000B86A8(@"page.num %@");
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v11);
    v17 = LABEL_14:;

    if (v17) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v15)
  {
    v16 = sub_1000B86A8(@"page.num %@");
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v13);
    goto LABEL_14;
  }
LABEL_15:
  v18 = sub_1000B86A8(@"spread.page %@ %@");
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v11, v13);

LABEL_16:
  v19 = [(BKSpreadThumbnailDirectoryCellAccessibility *)self imaxValueForKey:@"hasRibbon"];
  unsigned int v20 = [v19 BOOLValue];

  if (v20)
  {
    v23 = sub_1000B86A8(@"has.bookmark");
    uint64_t v21 = __IMAccessibilityStringForVariables();

    v17 = (void *)v21;
  }
LABEL_18:

  return v17;
}

@end