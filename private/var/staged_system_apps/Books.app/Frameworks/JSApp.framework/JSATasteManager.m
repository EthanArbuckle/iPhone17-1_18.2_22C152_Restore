@interface JSATasteManager
+ (id)sharedInstance;
- (void)syncTastes;
@end

@implementation JSATasteManager

+ (id)sharedInstance
{
  if (qword_CE2C0 != -1) {
    dispatch_once(&qword_CE2C0, &stru_B2450);
  }
  v2 = (void *)qword_CE2C8;

  return v2;
}

- (void)syncTastes
{
  id v2 = +[JSABridge sharedInstance];
  [v2 enqueueBlock:&stru_B2490 file:@"JSATasteManager.m" line:32];
}

@end