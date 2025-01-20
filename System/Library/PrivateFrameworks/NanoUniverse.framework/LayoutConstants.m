@interface LayoutConstants
@end

@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, uint64_t a2)
{
  v16[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:2];
  v15[0] = &unk_26CFE78C8;
  int64x2_t v10 = vdupq_n_s64(0x4044000000000000uLL);
  int64x2_t v12 = v10;
  v3 = [MEMORY[0x263F08D40] valueWithBytes:&v12 objCType:"{CGSize=dd}"];
  v16[0] = v3;
  v15[1] = &unk_26CFE78E0;
  int64x2_t v11 = v10;
  v4 = [MEMORY[0x263F08D40] valueWithBytes:&v11 objCType:"{CGSize=dd}"];
  v16[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  objc_msgSend(v2, "scaledSize:withOverrides:", v5, 40.0, 40.0);
  _LayoutConstants_constants_0 = v6;
  _LayoutConstants_constants_1 = v7;

  _LayoutConstants_constants_2 = 0x4039000000000000;
  v13[0] = &unk_26CFE78C8;
  v13[1] = &unk_26CFE78E0;
  v14[0] = &unk_26CFE7948;
  v14[1] = &unk_26CFE7958;
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v2 scaledValue:v8 withOverrides:4.0];
  _LayoutConstants_constants_3 = v9;
}

@end