@interface TextInputBundlesRootForDevelopment
@end

@implementation TextInputBundlesRootForDevelopment

void ___TextInputBundlesRootForDevelopment_block_invoke()
{
  TIGetTextInputFrameworkPath();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 stringByDeletingLastPathComponent];
  v1 = [NSString stringWithUTF8String:"/System/Library/PrivateFrameworks"];
  if (v0 && ([v0 isEqualToString:v1] & 1) == 0) {
    objc_storeStrong((id *)&_TextInputBundlesRootForDevelopment_bundlesRoot, v0);
  }
}

@end