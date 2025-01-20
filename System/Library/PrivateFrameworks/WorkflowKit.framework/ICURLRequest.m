@interface ICURLRequest
@end

@implementation ICURLRequest

void __23___ICURLRequest_opener__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = (void *)MEMORY[0x1E4F5A7A0];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v12 = [v7 sharedContext];
  v11 = [*(id *)(a1 + 32) userInterface];
  [v12 openURL:v10 withBundleIdentifier:v9 userInterface:v11 completionHandler:v8];
}

@end