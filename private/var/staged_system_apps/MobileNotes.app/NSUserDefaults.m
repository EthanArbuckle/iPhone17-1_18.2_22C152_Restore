@interface NSUserDefaults
- (BOOL)_ICDebugWindowEnabled;
- (void)set_ICDebugWindowEnabled:(BOOL)a3;
@end

@implementation NSUserDefaults

- (BOOL)_ICDebugWindowEnabled
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unsigned __int8 v4 = [(NSUserDefaults *)v2 BOOLForKey:v3];

  return v4;
}

- (void)set_ICDebugWindowEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = self;
  id v5 = String._bridgeToObjectiveC()();
  [(NSUserDefaults *)v4 setBool:v3 forKey:v5];
}

@end