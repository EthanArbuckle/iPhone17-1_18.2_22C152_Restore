@interface PCApplication
+ (BOOL)_isSystemUIService;
+ (id)_systemUIServiceClientSettings;
+ (id)_systemUIServiceIdentifier;
@end

@implementation PCApplication

+ (BOOL)_isSystemUIService
{
  return 1;
}

+ (id)_systemUIServiceIdentifier
{
  return @"com.apple.proximitycontrold";
}

+ (id)_systemUIServiceClientSettings
{
  v2 = +[UIMutableApplicationSceneClientSettings settings];
  [v2 setPreferredLevel:UIHUDWindowLevel];

  return v2;
}

@end