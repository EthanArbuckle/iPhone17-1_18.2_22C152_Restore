@interface COSSoftwareUpdatePINController
- (id)stringsBundle;
- (id)stringsTable;
@end

@implementation COSSoftwareUpdatePINController

- (id)stringsTable
{
  return @"Software Update";
}

- (id)stringsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

@end