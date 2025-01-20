@interface ASKBuildTypeGetCurrent
@end

@implementation ASKBuildTypeGetCurrent

void __ASKBuildTypeGetCurrent_block_invoke(id a1)
{
  if (+[PFClientUtil isRunningOnInternalOS]) {
    v1 = @"internal";
  }
  else {
    v1 = @"production";
  }

  objc_storeStrong((id *)&ASKBuildTypeGetCurrent_buildType, v1);
}

@end