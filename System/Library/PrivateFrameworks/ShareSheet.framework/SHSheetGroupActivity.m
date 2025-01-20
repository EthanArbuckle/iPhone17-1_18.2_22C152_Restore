@interface SHSheetGroupActivity
+ (NSString)groupActivityType;
@end

@implementation SHSheetGroupActivity

+ (NSString)groupActivityType
{
  return (NSString *)@"com.apple.group-activities.activity";
}

@end