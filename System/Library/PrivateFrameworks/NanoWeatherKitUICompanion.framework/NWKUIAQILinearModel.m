@interface NWKUIAQILinearModel
- (NSArray)colorIndices;
- (NSString)index;
- (NWKUIAQILinearModel)initWithAirQualityConditions:(id)a3;
- (NWKUIAQILinearModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8 colorIndices:(id)a9 index:(id)a10 percentage:(double)a11;
- (double)percentage;
@end

@implementation NWKUIAQILinearModel

- (NWKUIAQILinearModel)initWithAirQualityConditions:(id)a3
{
  v29 = self;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v32 = a3;
  v3 = [v32 scale];
  v4 = [MEMORY[0x263EFF980] array];
  v31 = v3;
  [v3 gradient];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v30 = long long v37 = 0u;
  v5 = [v30 stops];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x263F825C8];
        v12 = objc_msgSend(v10, "color", v29);
        v13 = objc_msgSend(v11, "nwkui_colorFromHexString:", v12);

        [v10 location];
        v15 = +[NWKUIAirQualityColorIndex colorIndexWithIndex:v13 color:v14];
        [v4 addObject:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }

  unint64_t v16 = [v32 airQualityIndex];
  v17 = NWMColorForValueInIndices(v4, (double)v16);
  uint64_t v18 = [v31 range];
  uint64_t v20 = v19;
  v33.receiver = v29;
  v33.super_class = (Class)NWKUIAQILinearModel;
  v21 = [(NWKUIAQIModel *)&v33 initWithAirQualityConditions:v32 color:v17];
  if (v21)
  {
    double v22 = (double)(v16 - 1) / (double)(unint64_t)(v20 + v18 - 1);
    uint64_t v23 = [v4 copy];
    colorIndices = v21->_colorIndices;
    v21->_colorIndices = (NSArray *)v23;

    v25 = +[NWKUIAQIFormatter autoupdatingSharedFormatter];
    uint64_t v26 = [v25 formattedIndexFromAirQualityConditions:v32];
    index = v21->_index;
    v21->_index = (NSString *)v26;

    v21->_percentage = v22;
  }

  return v21;
}

- (NWKUIAQILinearModel)initWithName:(id)a3 label:(id)a4 categoryDescription:(id)a5 color:(id)a6 date:(id)a7 expiration:(id)a8 colorIndices:(id)a9 index:(id)a10 percentage:(double)a11
{
  id v19 = a9;
  id v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)NWKUIAQILinearModel;
  v21 = [(NWKUIAQIModel *)&v27 initWithName:a3 label:a4 categoryDescription:a5 color:a6 date:a7 expiration:a8];
  if (v21)
  {
    uint64_t v22 = [v19 copy];
    colorIndices = v21->_colorIndices;
    v21->_colorIndices = (NSArray *)v22;

    uint64_t v24 = [v20 copy];
    index = v21->_index;
    v21->_index = (NSString *)v24;

    v21->_percentage = a11;
  }

  return v21;
}

- (NSArray)colorIndices
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)index
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (double)percentage
{
  return self->_percentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_colorIndices, 0);
}

@end