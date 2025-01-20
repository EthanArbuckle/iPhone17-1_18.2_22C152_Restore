@interface _UIKitDragAndDropStatistics
+ (void)incrementUIKitScalarValueBy:(int64_t)a3 forKey:(id)a4;
+ (void)incrementUIKitScalarValueForKnownInternalAppsForKey:(id)a3 bundleID:(id)a4;
+ (void)recordUIKitDragAndDropDistributionValue:(double)a3 forKey:(id)a4;
+ (void)setUIKitScalarValue:(int64_t)a3 forKey:(id)a4;
@end

@implementation _UIKitDragAndDropStatistics

+ (void)recordUIKitDragAndDropDistributionValue:(double)a3 forKey:(id)a4
{
  id v5 = a4;
  id v7 = +[_UIStatisticsIntegrator sharedInstance];
  v6 = [NSString stringWithFormat:@"%@.%@", @"com.apple.UIKit.DragAndDrop", v5];

  [v7 recordDistributionValue:v6 forKey:a3];
}

+ (void)setUIKitScalarValue:(int64_t)a3 forKey:(id)a4
{
  id v5 = a4;
  id v7 = +[_UIStatisticsIntegrator sharedInstance];
  v6 = [NSString stringWithFormat:@"%@.%@", @"com.apple.UIKit.DragAndDrop", v5];

  [v7 setValue:a3 forKey:v6];
}

+ (void)incrementUIKitScalarValueBy:(int64_t)a3 forKey:(id)a4
{
  id v5 = a4;
  id v7 = +[_UIStatisticsIntegrator sharedInstance];
  v6 = [NSString stringWithFormat:@"%@.%@", @"com.apple.UIKit.DragAndDrop", v5];

  [v7 incrementValueBy:a3 forKey:v6];
}

+ (void)incrementUIKitScalarValueForKnownInternalAppsForKey:(id)a3 bundleID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (qword_1EB264D40 != -1)
  {
    dispatch_once(&qword_1EB264D40, &__block_literal_global_320_1);
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    _UIStatisticsBundleIdentifier(2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  v8 = v7;
LABEL_6:
  if ([(id)qword_1EB264D38 containsObject:v8])
  {
    v8 = v8;
    v9 = v8;
    goto LABEL_9;
  }
LABEL_8:
  v9 = @"other";
LABEL_9:
  v10 = [NSString stringWithFormat:@"%@.%@", v11, v9];
  [a1 incrementUIKitScalarValueBy:1 forKey:v10];
}

@end