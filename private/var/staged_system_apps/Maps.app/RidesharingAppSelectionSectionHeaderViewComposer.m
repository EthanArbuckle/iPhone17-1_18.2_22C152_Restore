@interface RidesharingAppSelectionSectionHeaderViewComposer
+ (void)configureHeader:(id)a3 withPrimaryText:(id)a4;
@end

@implementation RidesharingAppSelectionSectionHeaderViewComposer

+ (void)configureHeader:(id)a3 withPrimaryText:(id)a4
{
  id v5 = a3;
  id v6 = [a4 localizedUppercaseString];
  [v5 setMajorString:v6];
}

@end