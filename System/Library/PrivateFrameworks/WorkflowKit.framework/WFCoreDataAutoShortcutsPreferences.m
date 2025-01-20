@interface WFCoreDataAutoShortcutsPreferences
+ (id)fetchRequest;
@end

@implementation WFCoreDataAutoShortcutsPreferences

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AutoShortcutsPreferences"];
}

@end