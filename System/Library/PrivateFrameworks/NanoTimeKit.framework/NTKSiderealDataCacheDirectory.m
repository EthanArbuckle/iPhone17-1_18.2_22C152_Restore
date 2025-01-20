@interface NTKSiderealDataCacheDirectory
@end

@implementation NTKSiderealDataCacheDirectory

void ___NTKSiderealDataCacheDirectory_block_invoke()
{
  v0 = NTKCacheDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"SiderealData"];
  v2 = (void *)_NTKSiderealDataCacheDirectory___path;
  _NTKSiderealDataCacheDirectory___path = v1;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createDirectoryAtPath:_NTKSiderealDataCacheDirectory___path withIntermediateDirectories:1 attributes:0 error:0];
}

@end