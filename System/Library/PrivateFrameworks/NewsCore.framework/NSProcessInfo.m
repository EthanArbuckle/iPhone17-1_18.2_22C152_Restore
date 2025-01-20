@interface NSProcessInfo
@end

@implementation NSProcessInfo

void __50__NSProcessInfo_FCAdditions__fc_processLaunchDate__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  int v1 = [v0 processIdentifier];

  *(void *)v6 = 0xE00000001;
  int v7 = 1;
  int v8 = v1;
  memset(v5, 0, 512);
  size_t v4 = 648;
  sysctl(v6, 4u, v5, &v4, 0, 0);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v5[0]];
  v3 = (void *)_MergedGlobals_159;
  _MergedGlobals_159 = v2;
}

@end