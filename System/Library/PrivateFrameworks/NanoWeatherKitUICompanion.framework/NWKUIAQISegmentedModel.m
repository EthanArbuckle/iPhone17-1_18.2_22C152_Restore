@interface NWKUIAQISegmentedModel
- (NSArray)segments;
- (NWKUIAQISegmentedModel)initWithAirQualityConditions:(id)a3;
- (NWKUIAQISegmentedModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8 segments:(id)a9 glyph:(id)a10;
- (UIImage)glyph;
- (id)_createGlyphWithName:(id)a3;
@end

@implementation NWKUIAQISegmentedModel

- (NWKUIAQISegmentedModel)initWithAirQualityConditions:(id)a3
{
  id v4 = a3;
  v5 = [v4 scale];
  v6 = [v5 categories];

  v7 = [v4 currentScaleCategory];
  v8 = (void *)MEMORY[0x263F825C8];
  v9 = [v7 color];
  v10 = objc_msgSend(v8, "nwkui_colorFromHexString:", v9);

  v28.receiver = self;
  v28.super_class = (Class)NWKUIAQISegmentedModel;
  v11 = [(NWKUIAQIModel *)&v28 initWithAirQualityConditions:v4 color:v10];

  if (v11)
  {
    uint64_t v12 = [v6 indexOfObject:v7];
    v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __55__NWKUIAQISegmentedModel_initWithAirQualityConditions___block_invoke;
    v25 = &unk_2649DE070;
    id v26 = v13;
    uint64_t v27 = v12;
    id v14 = v13;
    v15 = (void *)MEMORY[0x230FA6310](&v22);
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15, v22, v23, v24, v25);
    uint64_t v16 = [v14 copy];
    segments = v11->_segments;
    v11->_segments = (NSArray *)v16;

    v18 = [v7 glyph];
    uint64_t v19 = [(NWKUIAQISegmentedModel *)v11 _createGlyphWithName:v18];
    glyph = v11->_glyph;
    v11->_glyph = (UIImage *)v19;
  }
  return v11;
}

void __55__NWKUIAQISegmentedModel_initWithAirQualityConditions___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = (void *)MEMORY[0x263F825C8];
  v6 = [a2 color];
  objc_msgSend(v5, "nwkui_colorFromHexString:", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [[NWKUIAQISegmentModel alloc] initWithColor:v8 active:*(void *)(a1 + 40) >= a3];
  [*(id *)(a1 + 32) addObject:v7];
}

- (NWKUIAQISegmentedModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8 segments:(id)a9 glyph:(id)a10
{
  id v17 = a9;
  id v18 = a10;
  v23.receiver = self;
  v23.super_class = (Class)NWKUIAQISegmentedModel;
  uint64_t v19 = [(NWKUIAQIModel *)&v23 initWithName:a3 label:a4 categoryDescription:a5 color:a6 date:a7 expiration:a8];
  if (v19)
  {
    uint64_t v20 = [v17 copy];
    segments = v19->_segments;
    v19->_segments = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_glyph, a10);
  }

  return v19;
}

- (id)_createGlyphWithName:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 containsString:@"high"])
  {
    v5 = [MEMORY[0x263F825C8] yellowColor];
    v16[0] = v5;
    v6 = [(NWKUIAQIModel *)self color];
    v16[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];

    id v8 = [MEMORY[0x263F82818] _configurationWithHierarchicalColors:v7];
    v9 = (void *)MEMORY[0x263F82818];
    v10 = (void *)MEMORY[0x263F81708];
    [MEMORY[0x263F81708] systemFontSize];
    v11 = objc_msgSend(v10, "systemFontOfSize:");
    uint64_t v12 = [v9 configurationWithFont:v11];

    v13 = [v12 configurationByApplyingConfiguration:v8];
  }
  else
  {
    v13 = 0;
  }
  id v14 = [MEMORY[0x263F827E8] systemImageNamed:v4 withConfiguration:v13];

  return v14;
}

- (NSArray)segments
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (UIImage)glyph
{
  return (UIImage *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end