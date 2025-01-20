@interface BKUICalloutBarAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)appear;
- (void)fade;
@end

@implementation BKUICalloutBarAccessibility

+ (id)imaxTargetClassName
{
  return @"UICalloutBar";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)appear
{
  v7.receiver = self;
  v7.super_class = (Class)BKUICalloutBarAccessibility;
  [(BKUICalloutBarAccessibility *)&v7 appear];
  v3 = [(BKUICalloutBarAccessibility *)self subviews];
  if ([v3 count])
  {
    dispatch_time_t v4 = dispatch_time(0, 750000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016B014;
    block[3] = &unk_100A43D60;
    id v6 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)fade
{
  if (!byte_100B754F0)
  {
    v2.receiver = self;
    v2.super_class = (Class)BKUICalloutBarAccessibility;
    [(BKUICalloutBarAccessibility *)&v2 fade];
  }
}

@end