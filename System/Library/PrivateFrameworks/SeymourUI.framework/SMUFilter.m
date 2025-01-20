@interface SMUFilter
+ (id)gaussianBlurFilterWithInputRadius:(double)a3 inputHardEdges:(id)a4 inputNormalizeEdges:(id)a5 inputQuality:(id)a6 inputIntermediateBitDepth:(id)a7 inputDither:(id)a8 name:(id)a9;
+ (id)programTextBackgroundVibrantColorMatrixFilter;
+ (id)programTextBlurFilter1;
+ (id)programTextBlurFilter2;
+ (id)programTextColorMatrixFilter;
+ (void)applyProgramTextFiltersToLayer:(id)a3;
+ (void)applyProgramVibrantColorFilterToLayer:(id)a3;
@end

@implementation SMUFilter

+ (id)gaussianBlurFilterWithInputRadius:(double)a3 inputHardEdges:(id)a4 inputNormalizeEdges:(id)a5 inputQuality:(id)a6 inputIntermediateBitDepth:(id)a7 inputDither:(id)a8 name:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
  v22 = [NSNumber numberWithDouble:a3];
  [v21 setValue:v22 forKey:@"inputRadius"];

  if (v15) {
    [v21 setValue:v15 forKey:@"inputHardEdges"];
  }
  if (v16) {
    [v21 setValue:v16 forKey:@"inputNormalizeEdges"];
  }
  if (v17) {
    [v21 setValue:v17 forKey:@"inputQuality"];
  }
  if (v18) {
    [v21 setValue:v18 forKey:@"inputIntermediateBitDepth"];
  }
  if (v19) {
    [v21 setValue:v19 forKey:@"inputDither"];
  }
  [v21 setName:v20];

  return v21;
}

+ (id)programTextBlurFilter1
{
  return (id)[a1 gaussianBlurFilterWithInputRadius:0 inputHardEdges:0 inputNormalizeEdges:@"low" inputQuality:@"low" inputIntermediateBitDepth:0 inputDither:@"blur1" name:40.0];
}

+ (id)programTextColorMatrixFilter
{
  v2 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  v5[0] = 0;
  v5[1] = 0;
  int v6 = 1065353216;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v9 = 0;
  int v10 = 1065353216;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v3 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:v5];
  [v2 setValue:v3 forKey:@"inputColorMatrix"];

  return v2;
}

+ (id)programTextBlurFilter2
{
  return (id)[a1 gaussianBlurFilterWithInputRadius:MEMORY[0x263EFFA88] inputHardEdges:0 inputNormalizeEdges:@"default" inputQuality:0 inputIntermediateBitDepth:0 inputDither:@"blur2" name:200.0];
}

+ (void)applyProgramTextFiltersToLayer:(id)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 programTextBlurFilter1];
  int v6 = objc_msgSend(a1, "programTextColorMatrixFilter", v5);
  v9[1] = v6;
  long long v7 = [a1 programTextBlurFilter2];
  v9[2] = v7;
  long long v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  [v4 setFilters:v8];
}

+ (id)programTextBackgroundVibrantColorMatrixFilter
{
  v2 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DB8]];
  v5[0] = xmmword_23A80CB00;
  v5[1] = xmmword_23A80CB10;
  void v5[2] = xmmword_23A80CB20;
  v5[3] = xmmword_23A80CB30;
  v5[4] = xmmword_23A80CB40;
  v3 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:v5];
  [v2 setValue:v3 forKey:@"inputColorMatrix"];

  return v2;
}

+ (void)applyProgramVibrantColorFilterToLayer:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 programTextBackgroundVibrantColorMatrixFilter];
  v7[0] = v5;
  int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v4 setFilters:v6];
}

@end