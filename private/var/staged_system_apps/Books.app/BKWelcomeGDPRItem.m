@interface BKWelcomeGDPRItem
- (BOOL)welcomeScreenShouldShow;
@end

@implementation BKWelcomeGDPRItem

- (BOOL)welcomeScreenShouldShow
{
  v3 = +[UIApplication sharedApplication];
  unsigned __int8 v4 = [v3 launchedToTest];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)BKWelcomeGDPRItem;
  return [(BKWelcomeGDPRItem *)&v6 welcomeScreenShouldShow];
}

@end