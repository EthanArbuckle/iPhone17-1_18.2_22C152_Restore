@interface VUIMediaShareControlButton
+ (id)perfectlyCenteredShareImage;
+ (id)shareControlItemForMediaItem:(id)a3 inPlayerViewController:(id)a4;
@end

@implementation VUIMediaShareControlButton

+ (id)shareControlItemForMediaItem:(id)a3 inPlayerViewController:(id)a4
{
  id v4 = a3;
  v5 = +[VUILocalizationManager sharedInstance];
  v6 = [v5 localizedStringForKey:@"MEDIA_SHARE_BUTTON_TITLE"];

  v7 = +[VUIMediaShareControlButton perfectlyCenteredShareImage];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F16710]) initWithTitle:v6 type:0];
  [v8 setImage:v7];
  uint64_t v9 = [v4 mediaItemMetadataForProperty:@"showMediaShareMetadata"];
  v10 = (void *)v9;
  if (v9)
  {
    v27 = v7;
    v29 = (void *)v9;
    v30 = v6;
    v11 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"chevron.right"];
    v12 = objc_opt_new();
    v13 = [v4 mediaItemMetadataForProperty:@"mediaShareMetadata"];
    uint64_t v14 = objc_msgSend(v13, "vui_stringForKey:", @"menuTitle");
    v15 = (void *)MEMORY[0x1E4FB13F0];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke;
    v36[3] = &unk_1E6DF5B70;
    id v16 = v4;
    id v37 = v16;
    id v17 = v13;
    id v38 = v17;
    v28 = (void *)v14;
    v18 = [v15 actionWithTitle:v14 image:v11 identifier:0 handler:v36];
    [v12 addObject:v18];
    v19 = [v16 mediaItemMetadataForProperty:@"showMediaShareMetadata"];
    v20 = objc_msgSend(v19, "vui_stringForKey:", @"menuTitle");
    if ([v20 length])
    {
      id v21 = v17;
      v22 = (void *)MEMORY[0x1E4FB13F0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_2;
      v33[3] = &unk_1E6DF5B70;
      id v34 = v16;
      id v35 = v19;
      v23 = v22;
      id v17 = v21;
      v24 = [v23 actionWithTitle:v20 image:v11 identifier:0 handler:v33];
      [v12 addObject:v24];
    }
    v7 = v27;
    v25 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3E921E0 image:v27 identifier:0 options:1 children:v12];
    [v8 setMenu:v25];

    v10 = v29;
    v6 = v30;
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_3;
    v31[3] = &unk_1E6DF3D58;
    id v32 = v4;
    [v8 setAction:v31];
    v11 = v32;
  }

  return v8;
}

uint64_t __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke(uint64_t a1)
{
  return +[VUIMediaShareCoordinator shareMediaItem:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40)];
}

uint64_t __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_2(uint64_t a1)
{
  return +[VUIMediaShareCoordinator shareMediaItem:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40)];
}

void __82__VUIMediaShareControlButton_shareControlItemForMediaItem_inPlayerViewController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:@"mediaShareMetadata"];
  +[VUIMediaShareCoordinator shareMediaItem:*(void *)(a1 + 32) metadata:v2];
}

+ (id)perfectlyCenteredShareImage
{
  if (perfectlyCenteredShareImage___once != -1) {
    dispatch_once(&perfectlyCenteredShareImage___once, &__block_literal_global_30);
  }
  id v2 = (void *)perfectlyCenteredShareImage_shareImageSymbol;
  return v2;
}

void __57__VUIMediaShareControlButton_perfectlyCenteredShareImage__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1618] whiteColor];
  v1 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  id v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:18.0];
  v3 = [v1 imageWithConfiguration:v2];

  [v3 size];
  CGFloat v5 = v4 + 5.0;
  [v3 size];
  double v7 = v6;
  v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v20.width = v7;
  v20.height = v5;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v10);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v5);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  id v18 = v0;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v18 CGColor]);
  CGFloat v12 = v7 + -2.0;
  CGFloat v13 = v5 + -5.0;
  v21.origin.x = 1.0;
  v21.origin.y = 5.0;
  v21.size.width = v12;
  v21.size.height = v13;
  CGContextFillRect(CurrentContext, v21);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
  id v14 = v3;
  v15 = (CGImage *)[v14 CGImage];
  v22.origin.x = 1.0;
  v22.origin.y = 5.0;
  v22.size.width = v12;
  v22.size.height = v13;
  CGContextDrawImage(CurrentContext, v22, v15);
  uint64_t v16 = UIGraphicsGetImageFromCurrentImageContext();
  id v17 = (void *)perfectlyCenteredShareImage_shareImageSymbol;
  perfectlyCenteredShareImage_shareImageSymbol = v16;

  UIGraphicsEndImageContext();
}

@end