@interface PXGSpritesRectDiagnosticsProvider
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
@end

@implementation PXGSpritesRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [off_1E5DA9658 sharedInstance];
  if ([v7 anySpritesRectDiagnosticsEnabled])
  {
    [v5 visibleRect];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__PXGSpritesRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v16[3] = &unk_1E5DB6920;
    id v17 = v7;
    id v18 = v6;
    objc_msgSend(v5, "enumerateSpritesInRect:usingBlock:", v16, v9, v11, v13, v15);
  }
}

void __82__PXGSpritesRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  switch(*(unsigned char *)(a6 + 1))
  {
    case 0:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForUndefinedSprites])
      {
        [MEMORY[0x1E4FB1618] lightGrayColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 1:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForNamedImageSprites])
      {
        [MEMORY[0x1E4FB1618] blueColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 2:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForDisplayAssetSprites])
      {
        [MEMORY[0x1E4FB1618] cyanColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 3:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForTextSprites])
      {
        [MEMORY[0x1E4FB1618] orangeColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 4:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForTitleSubtitleSprites])
      {
        [MEMORY[0x1E4FB1618] purpleColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 5:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForSolidColorSprites])
      {
        [MEMORY[0x1E4FB1618] redColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 6:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForGradientSprites])
      {
        [MEMORY[0x1E4FB1618] yellowColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 7:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForShadowSprites])
      {
        [MEMORY[0x1E4FB1618] magentaColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 8:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForDecorationSprites])
      {
        [MEMORY[0x1E4FB1618] darkGrayColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 0xA:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForViewSprites])
      {
        [MEMORY[0x1E4FB1618] brownColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 0xB:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForPathSprites])
      {
        [MEMORY[0x1E4FB1618] systemPinkColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 0xC:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForPathSprites])
      {
        [MEMORY[0x1E4FB1618] systemTealColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    case 0xD:
      if ([*(id *)(a1 + 32) enableRectDiagnosticsForPathSprites])
      {
        [MEMORY[0x1E4FB1618] systemMintColor];
        objc_claimAutoreleasedReturnValue();
      }
      break;
    default:
      break;
  }
  PXRectWithCenterAndSize();
}

@end