@interface NSURLSession
@end

@implementation NSURLSession

void __42__NSURLSession_Workflow__wf_sharedSession__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) sharedSession];
  v2 = [v1 configuration];
  id v5 = (id)[v2 copy];

  objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", @"com.apple.shortcuts");
  uint64_t v3 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v5];
  v4 = (void *)wf_sharedSession_sharedSession;
  wf_sharedSession_sharedSession = v3;
}

@end