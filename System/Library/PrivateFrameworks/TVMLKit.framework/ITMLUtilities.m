@interface ITMLUtilities
+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5;
@end

@implementation ITMLUtilities

+ (void)image:(id)a3 didCompleteLoadingForCache:(int64_t)a4 requestRecord:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a3;
    v9 = [v8 uiImage];
    v10 = [v8 imageType];

    v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v10, (CFStringRef)*MEMORY[0x263F01918]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke;
    v15[3] = &unk_264BA9050;
    v16 = v10;
    id v17 = v9;
    v18 = v11;
    v12 = v11;
    id v13 = v9;
    v14 = v10;
    [v7 didCompleteLoadingFromCache:a4 withResponseBodyBlock:v15];
  }
}

void __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2;
  v6[3] = &unk_264BA9028;
  id v7 = a1[4];
  id v8 = a1[5];
  id v10 = v3;
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __64__ITMLUtilities_image_didCompleteLoadingForCache_requestRecord___block_invoke_2(uint64_t a1)
{
  v2 = (void *)*MEMORY[0x263F01A80];
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F01A80]])
  {

LABEL_4:
    uint64_t v5 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 40), 1.0);
    goto LABEL_6;
  }
  id v3 = (void *)*MEMORY[0x263F01A88];
  char v4 = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F01A88]];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
LABEL_6:
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end