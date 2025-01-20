@interface MusicSubscriptionStatusHacks
+ (void)setupSubscriptionStatusHacks;
@end

@implementation MusicSubscriptionStatusHacks

+ (void)setupSubscriptionStatusHacks
{
  if (qword_1010D6CC0 != -1) {
    dispatch_once(&qword_1010D6CC0, &stru_100FC37E8);
  }
}

@end