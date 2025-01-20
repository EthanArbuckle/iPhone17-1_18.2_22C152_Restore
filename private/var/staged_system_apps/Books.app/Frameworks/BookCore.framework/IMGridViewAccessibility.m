@interface IMGridViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4;
- (void)setGrabbedCell:(id)a3;
@end

@implementation IMGridViewAccessibility

+ (id)imaxTargetClassName
{
  return @"IMGridView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)setGrabbedCell:(id)a3
{
  id v4 = a3;
  id v5 = [(IMGridViewAccessibility *)self imaxValueForKey:@"_grabbedCell"];
  v9.receiver = self;
  v9.super_class = (Class)IMGridViewAccessibility;
  [(IMGridViewAccessibility *)&v9 setGrabbedCell:v4];
  if (v4 && v5 != v4)
  {
    v6 = IMAXLocString(@"started.moving.book %@");
    v7 = [v4 accessibilityLabel];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v8);
  }
}

- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)IMGridViewAccessibility;
  id v6 = a3;
  [(IMGridViewAccessibility *)&v19 _swapGrabbedCell:v6 withOtherCell:a4];
  v7 = [(IMGridViewAccessibility *)self imaxValueForKey:@"numberOfColumns"];
  uint64_t v8 = (uint64_t)[v7 integerValue];

  objc_super v9 = [v6 imaxValueForKey:@"tag"];

  uint64_t v10 = (uint64_t)[v9 integerValue] - 10000;
  uint64_t v11 = v10 % v8 + 1;
  uint64_t v12 = v10 / v8 + 1;
  v13 = +[NSNumber numberWithInteger:v11];
  v14 = +[NSNumberFormatter imaxLocalizedNumber:v13];

  v15 = +[NSNumber numberWithInteger:v12];
  v16 = +[NSNumberFormatter imaxLocalizedNumber:v15];

  LODWORD(v15) = UIAccessibilityAnnouncementNotification;
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, @"AXAnnouncementTypeReorderSound");
  v17 = IMAXLocString(@"finished.moving.book %@ %@");
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v16, v14, v19.receiver, v19.super_class);

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v18);
}

@end