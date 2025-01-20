@interface MKInternal
+ (BOOL)isInternal;
@end

@implementation MKInternal

+ (BOOL)isInternal
{
  uint64_t v2 = [@"com.apple.MigrationKit" UTF8String];
  return MEMORY[0x270EDAB48](v2);
}

@end