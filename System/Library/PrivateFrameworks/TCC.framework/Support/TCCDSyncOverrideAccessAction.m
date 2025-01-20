@interface TCCDSyncOverrideAccessAction
+ (BOOL)supportsSecureCoding;
- (void)updateDatabase:(unint64_t)a3 killClient:(BOOL)a4;
@end

@implementation TCCDSyncOverrideAccessAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateDatabase:(unint64_t)a3 killClient:(BOOL)a4
{
}

@end