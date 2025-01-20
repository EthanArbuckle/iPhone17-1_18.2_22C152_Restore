@interface SSOtherScreenSnapshotter
- (id)takeScreenshot;
@end

@implementation SSOtherScreenSnapshotter

- (id)takeScreenshot
{
  v23[6] = *MEMORY[0x263EF8340];
  v22[0] = *MEMORY[0x263F1D910];
  v3 = [(SSScreenSnapshotter *)self screen];
  v23[0] = v3;
  v22[1] = *MEMORY[0x263F1D8E0];
  v4 = NSNumber;
  v5 = [(SSScreenSnapshotter *)self screen];
  v6 = [v5 traitCollection];
  v7 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v6, "displayGamut"));
  uint64_t v8 = *MEMORY[0x263F1D8E8];
  uint64_t v9 = MEMORY[0x263EFFA88];
  v23[1] = v7;
  v23[2] = MEMORY[0x263EFFA88];
  uint64_t v10 = *MEMORY[0x263F1D8F0];
  v22[2] = v8;
  v22[3] = v10;
  v11 = NSNumber;
  v12 = [(SSScreenSnapshotter *)self screen];
  [v12 scale];
  v13 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v14 = *MEMORY[0x263F1D900];
  v23[3] = v13;
  v23[4] = &unk_26D05B8F0;
  uint64_t v15 = *MEMORY[0x263F1D8F8];
  v22[4] = v14;
  v22[5] = v15;
  v23[5] = v9;
  v16 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];

  v17 = (void *)_UIRenderDisplay();
  id v18 = objc_alloc(MEMORY[0x263F1C6B0]);
  v19 = [(SSScreenSnapshotter *)self screen];
  [v19 scale];
  v20 = objc_msgSend(v18, "_initWithIOSurface:scale:orientation:", v17, 0);

  return v20;
}

uint64_t __42__SSOtherScreenSnapshotter_takeScreenshot__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F06398](a2);
}

@end