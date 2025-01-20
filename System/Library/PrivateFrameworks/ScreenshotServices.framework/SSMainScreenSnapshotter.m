@interface SSMainScreenSnapshotter
- (id)takeScreenshot;
@end

@implementation SSMainScreenSnapshotter

- (id)takeScreenshot
{
  v24[6] = *MEMORY[0x263EF8340];
  v23[0] = *MEMORY[0x263F1D910];
  v22 = [(SSScreenSnapshotter *)self screen];
  v24[0] = v22;
  v23[1] = *MEMORY[0x263F1D8E0];
  v3 = NSNumber;
  v4 = [(SSScreenSnapshotter *)self screen];
  v5 = [v4 traitCollection];
  v6 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "displayGamut"));
  uint64_t v7 = *MEMORY[0x263F1D8E8];
  uint64_t v8 = MEMORY[0x263EFFA88];
  v24[1] = v6;
  v24[2] = MEMORY[0x263EFFA88];
  uint64_t v9 = *MEMORY[0x263F1D8F0];
  v23[2] = v7;
  v23[3] = v9;
  v10 = NSNumber;
  v11 = [(SSScreenSnapshotter *)self screen];
  [v11 scale];
  v12 = objc_msgSend(v10, "numberWithDouble:");
  v24[3] = v12;
  v23[4] = *MEMORY[0x263F1D900];
  v13 = NSNumber;
  v14 = [MEMORY[0x263F1C408] sharedApplication];
  v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "activeInterfaceOrientation"));
  v23[5] = *MEMORY[0x263F1D8F8];
  v24[4] = v15;
  v24[5] = v8;
  v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:6];

  v17 = (void *)_UIRenderDisplay();
  id v18 = objc_alloc(MEMORY[0x263F1C6B0]);
  v19 = [(SSScreenSnapshotter *)self screen];
  [v19 scale];
  v20 = objc_msgSend(v18, "_initWithIOSurface:scale:orientation:", v17, 0);

  return v20;
}

uint64_t __41__SSMainScreenSnapshotter_takeScreenshot__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F06398](a2);
}

@end