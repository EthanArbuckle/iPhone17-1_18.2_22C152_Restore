@interface ICArchive
+ (NSString)demoModeUserDefaultsKey;
+ (NSString)userDefaultsKey;
+ (UTType)universalTypeIdentifier;
@end

@implementation ICArchive

+ (UTType)universalTypeIdentifier
{
  return (UTType *)[MEMORY[0x263F1D920] exportedTypeWithIdentifier:@"com.apple.notes.archive"];
}

+ (NSString)userDefaultsKey
{
  return (NSString *)@"alexandria";
}

+ (NSString)demoModeUserDefaultsKey
{
  return (NSString *)@"alexandria-demo-mode";
}

@end