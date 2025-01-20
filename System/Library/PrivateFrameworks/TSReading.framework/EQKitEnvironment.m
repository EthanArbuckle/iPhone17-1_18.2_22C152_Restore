@interface EQKitEnvironment
+ (id)dataForEnvironment:(id)a3;
+ (id)defaultEnvironment;
+ (id)environmentFromData:(id)a3;
- (BOOL)fontsLoaded;
@end

@implementation EQKitEnvironment

+ (id)environmentFromData:(id)a3
{
  return +[EQKitEnvironmentInstance environmentFromData:a3];
}

+ (id)defaultEnvironment
{
  return +[EQKitEnvironmentInstance defaultEnvironment];
}

+ (id)dataForEnvironment:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return +[EQKitEnvironmentInstance dataForEnvironment:a3];
}

- (BOOL)fontsLoaded
{
  return 0;
}

@end