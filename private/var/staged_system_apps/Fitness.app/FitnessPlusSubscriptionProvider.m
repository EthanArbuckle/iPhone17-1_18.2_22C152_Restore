@interface FitnessPlusSubscriptionProvider
+ (NSString)fitnessPlusSubscriptionDidChangeNotification;
@end

@implementation FitnessPlusSubscriptionProvider

+ (NSString)fitnessPlusSubscriptionDidChangeNotification
{
  if (qword_10094A6F8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100997898;

  return (NSString *)v2;
}

@end