@interface SBSApplicationShortcutCustomImageIcon(ShortcutUIKit)
- (id)_scui_iconImageForCachedBitmapData:()ShortcutUIKit scale:;
- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit;
@end

@implementation SBSApplicationShortcutCustomImageIcon(ShortcutUIKit)

- (id)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  v2 = [a1 imageData];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = [a1 dataType];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  if (v3 == 1)
  {
    uint64_t v7 = objc_msgSend(a1, "_scui_iconImageForCachedBitmapData:scale:", v2, v6);
    goto LABEL_7;
  }
  if (v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = [MEMORY[0x263F1C6B0] imageWithData:v2 scale:v6];
LABEL_7:
  v8 = (void *)v7;
LABEL_8:
  if ([a1 isTemplate]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = [v8 imageWithRenderingMode:v9];

  return v10;
}

- (id)_scui_iconImageForCachedBitmapData:()ShortcutUIKit scale:
{
  uint64_t v2 = LICreateIconFromCachedBitmap();
  if (v2)
  {
    uint64_t v3 = (CGImage *)v2;
    v4 = [MEMORY[0x263F1C6B0] imageWithCGImage:v2 scale:0 orientation:a1];
    CGImageRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end