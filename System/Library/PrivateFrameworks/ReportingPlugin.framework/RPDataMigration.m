@interface RPDataMigration
+ (unsigned)getUserDataDisposition;
@end

@implementation RPDataMigration

+ (unsigned)getUserDataDisposition
{
  return MEMORY[0x270F25400](a1, a2);
}

@end