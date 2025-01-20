@interface NWMTemperatureColorIndex
+ (NSArray)allIndices;
+ (id)indexWithTemperature:(id)a3 color:(id)a4;
- (NWMTemperatureColorIndex)initWithTemperature:(id)a3 color:(id)a4;
- (WFTemperature)temperature;
@end

@implementation NWMTemperatureColorIndex

+ (NSArray)allIndices
{
  if (allIndices_onceToken_0 != -1) {
    dispatch_once(&allIndices_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)allIndices_AllIndices_0;

  return (NSArray *)v2;
}

+ (id)indexWithTemperature:(id)a3 color:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[NWMTemperatureColorIndex alloc] initWithTemperature:v6 color:v5];

  return v7;
}

- (NWMTemperatureColorIndex)initWithTemperature:(id)a3 color:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [v7 celsius];
  v11.receiver = self;
  v11.super_class = (Class)NWMTemperatureColorIndex;
  v9 = -[NWKUIColorIndex initWithValue:color:](&v11, sel_initWithValue_color_, v8);

  if (v9) {
    objc_storeStrong((id *)&v9->_temperature, a3);
  }

  return v9;
}

void __38__NWMTemperatureColorIndex_allIndices__block_invoke()
{
  v14[4] = *MEMORY[0x263EF8340];
  v13 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:0.0];
  v12 = [MEMORY[0x263F1C550] systemCyanColor];
  objc_super v11 = +[NWMTemperatureColorIndex indexWithTemperature:v13 color:v12];
  v14[0] = v11;
  v0 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:10.0];
  v1 = [MEMORY[0x263F1C550] systemGreenColor];
  v2 = +[NWMTemperatureColorIndex indexWithTemperature:v0 color:v1];
  v14[1] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:20.0];
  v4 = [MEMORY[0x263F1C550] systemYellowColor];
  id v5 = +[NWMTemperatureColorIndex indexWithTemperature:v3 color:v4];
  v14[2] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:30.0];
  id v7 = [MEMORY[0x263F1C550] systemRedColor];
  id v8 = +[NWMTemperatureColorIndex indexWithTemperature:v6 color:v7];
  v14[3] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  v10 = (void *)allIndices_AllIndices_0;
  allIndices_AllIndices_0 = v9;
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (void).cxx_destruct
{
}

@end