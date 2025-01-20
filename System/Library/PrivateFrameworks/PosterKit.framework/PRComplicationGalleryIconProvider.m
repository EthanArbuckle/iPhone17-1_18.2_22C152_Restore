@interface PRComplicationGalleryIconProvider
+ (void)loadIconImageForApplicationBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5;
+ (void)loadIconImageForExtensionBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5;
@end

@implementation PRComplicationGalleryIconProvider

+ (void)loadIconImageForExtensionBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F223A0];
  id v9 = a5;
  id v10 = a3;
  id v13 = (id)[[v8 alloc] initWithBundleIdentifier:v10 error:0];

  v11 = [v13 containingBundleRecord];
  v12 = [v11 bundleIdentifier];
  [a1 loadIconImageForApplicationBundleIdentifier:v12 atWidth:v9 completion:a4];
}

+ (void)loadIconImageForApplicationBundleIdentifier:(id)a3 atWidth:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke;
  block[3] = &unk_1E54DC320;
  double v15 = a4;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:@"com.apple.mobilecal"];
  id v3 = objc_alloc(MEMORY[0x1E4F6F248]);
  v4 = v3;
  if (v2)
  {
    v5 = [MEMORY[0x1E4F1C9C8] date];
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v7 = (void *)[v4 initWithDate:v5 calendar:v6 format:0];
  }
  else
  {
    id v7 = (void *)[v3 initWithBundleIdentifier:*(void *)(a1 + 32)];
  }
  double v8 = *(double *)(a1 + 48);
  id v9 = objc_alloc(MEMORY[0x1E4F6F258]);
  id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  v12 = objc_msgSend(v9, "initWithSize:scale:", v8, v8, v11);

  id v13 = [v7 prepareImageForDescriptor:v12];
  id v14 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v15 = [v13 CGImage];
  [v13 scale];
  v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke_2;
  v19[3] = &unk_1E54DC2F8;
  id v17 = *(id *)(a1 + 40);
  id v20 = v16;
  id v21 = v17;
  id v18 = v16;
  dispatch_async(MEMORY[0x1E4F14428], v19);
}

uint64_t __100__PRComplicationGalleryIconProvider_loadIconImageForApplicationBundleIdentifier_atWidth_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end