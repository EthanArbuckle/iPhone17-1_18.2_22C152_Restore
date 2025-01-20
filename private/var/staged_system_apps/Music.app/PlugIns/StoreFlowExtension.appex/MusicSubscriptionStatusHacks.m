@interface MusicSubscriptionStatusHacks
+ (void)setupSubscriptionStatusHacks;
@end

@implementation MusicSubscriptionStatusHacks

+ (void)setupSubscriptionStatusHacks
{
  if (qword_100011BC0 != -1) {
    dispatch_once(&qword_100011BC0, &stru_10000C3F8);
  }
}

@end