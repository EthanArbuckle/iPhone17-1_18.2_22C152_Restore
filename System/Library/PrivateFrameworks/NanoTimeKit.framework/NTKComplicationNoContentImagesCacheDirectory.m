@interface NTKComplicationNoContentImagesCacheDirectory
@end

@implementation NTKComplicationNoContentImagesCacheDirectory

void ___NTKComplicationNoContentImagesCacheDirectory_block_invoke()
{
  v0 = NTKCacheDirectory();
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"ComplicationNoContentImages"];
  v2 = (void *)_NTKComplicationNoContentImagesCacheDirectory___path;
  _NTKComplicationNoContentImagesCacheDirectory___path = v1;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v3 createDirectoryAtPath:_NTKComplicationNoContentImagesCacheDirectory___path withIntermediateDirectories:1 attributes:0 error:0];
}

@end