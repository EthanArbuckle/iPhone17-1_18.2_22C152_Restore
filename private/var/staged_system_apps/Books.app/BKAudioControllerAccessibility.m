@interface BKAudioControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (void)viewDidLoad;
@end

@implementation BKAudioControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKAudioController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)BKAudioControllerAccessibility;
  [(BKAudioControllerAccessibility *)&v5 viewDidLoad];
  v3 = [(BKAudioControllerAccessibility *)self imaxValueForKey:@"_volumeSlider"];
  v4 = sub_1000B86A8(@"volume.slider");
  [v3 setAccessibilityLabel:v4];
}

@end