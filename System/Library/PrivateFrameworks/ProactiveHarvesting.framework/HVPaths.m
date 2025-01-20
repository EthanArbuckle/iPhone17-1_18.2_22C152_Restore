@interface HVPaths
+ (id)topDirectoryCreateIfNeeded:(BOOL)a3;
@end

@implementation HVPaths

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__HVPaths_topDirectoryCreateIfNeeded___block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  BOOL v6 = a3;
  if (topDirectoryCreateIfNeeded___pasOnceToken17 != -1) {
    dispatch_once(&topDirectoryCreateIfNeeded___pasOnceToken17, v5);
  }
  v3 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;

  return v3;
}

void __38__HVPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A6667F0]();
  uint64_t v3 = [*(id *)(a1 + 32) topDirectoryWithName:@"Suggestions/Harvesting" createIfNeeded:*(unsigned __int8 *)(a1 + 40)];
  v4 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  topDirectoryCreateIfNeeded___pasExprOnceResult = v3;
}

@end