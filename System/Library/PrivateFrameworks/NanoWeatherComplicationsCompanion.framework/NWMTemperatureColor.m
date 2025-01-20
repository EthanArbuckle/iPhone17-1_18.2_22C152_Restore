@interface NWMTemperatureColor
+ (NSArray)colorSpectrum;
+ (id)colorForTemperature:(id)a3;
+ (void)colorSpectrumBetweenLow:(id)a3 high:(id)a4 handler:(id)a5;
@end

@implementation NWMTemperatureColor

+ (id)colorForTemperature:(id)a3
{
  [a3 celsius];

  return +[NWKUIColorIndex colorForValue:](NWMTemperatureColorIndex, "colorForValue:");
}

+ (void)colorSpectrumBetweenLow:(id)a3 high:(id)a4 handler:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v31 = [MEMORY[0x263EFF980] arrayWithObject:&unk_26EEA8348];
  v10 = (void *)MEMORY[0x263EFF980];
  v11 = +[NWMTemperatureColor colorForTemperature:v7];
  v30 = [v10 arrayWithObject:v11];

  if (objc_msgSend(v7, "nwm_compare:", v8))
  {
    v29 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v12 = +[NWMTemperatureColorIndex allIndices];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = [v17 temperature];
          uint64_t v19 = objc_msgSend(v7, "nwm_compare:", v18);

          v20 = [v17 temperature];
          uint64_t v21 = objc_msgSend(v8, "nwm_compare:", v20);

          if (v19 <= 0 && (v21 & 0x8000000000000000) == 0)
          {
            v22 = NSNumber;
            v23 = [v17 temperature];
            objc_msgSend(v23, "nwm_percentageBetweenLow:high:", v7, v8);
            v24 = objc_msgSend(v22, "numberWithDouble:");
            [v31 addObject:v24];

            v25 = [v17 color];
            [v30 addObject:v25];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    v9 = v29;
  }
  [v31 addObject:&unk_26EEA8360];
  v26 = +[NWMTemperatureColor colorForTemperature:v8];
  [v30 addObject:v26];

  v27 = (void *)[v31 copy];
  v28 = (void *)[v30 copy];
  v9[2](v9, v27, v28);
}

+ (NSArray)colorSpectrum
{
  v2 = (void *)colorSpectrum_ColorSpectrum;
  if (!colorSpectrum_ColorSpectrum)
  {
    v3 = +[NWMTemperatureColorIndex allIndices];
    v4 = NSStringFromSelector(sel_color);
    uint64_t v5 = [v3 valueForKeyPath:v4];
    v6 = (void *)colorSpectrum_ColorSpectrum;
    colorSpectrum_ColorSpectrum = v5;

    v2 = (void *)colorSpectrum_ColorSpectrum;
  }

  return (NSArray *)v2;
}

@end