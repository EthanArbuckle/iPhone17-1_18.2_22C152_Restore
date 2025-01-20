@interface ISSettings
+ (id)sharedInstance;
- (void)save;
@end

@implementation ISSettings

+ (id)sharedInstance
{
  return 0;
}

- (void)save
{
  id v2 = +[ISRootSettings sharedInstance];
  [v2 save];
}

@end