@interface BKSpeakSelectionUICalloutBarAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)updateAvailableButtons;
@end

@implementation BKSpeakSelectionUICalloutBarAccessibility

+ (id)imaxTargetClassName
{
  return @"UICalloutBar";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)updateAvailableButtons
{
  v4.receiver = self;
  v4.super_class = (Class)BKSpeakSelectionUICalloutBarAccessibility;
  [(BKSpeakSelectionUICalloutBarAccessibility *)&v4 updateAvailableButtons];
  if (NSClassFromString(@"AXQuickSpeak"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10016ABDC;
    v3[3] = &unk_100A43D60;
    v3[4] = self;
    sub_1000B8460(v3);
  }
}

@end