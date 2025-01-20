@interface NTKSiderealColorManager
+ (id)sharedInstance;
- (id)_createElementsFromDict:(id)a3;
- (id)_init;
- (id)astronomicalTwilightColorCurve;
- (id)astronomicalTwilightCurveP3;
- (id)civilTwilightColorCurve;
- (id)civilTwilightCurveP3;
- (id)dayDiskBloomColorCurve;
- (id)dayGradientColorCurves;
- (id)dayGradientCurveP3;
- (id)dialBackgroundColorCurve;
- (id)dialBackgroundCurveP3;
- (id)innerComplicationColorCurve;
- (id)nauticalTwilightColorCurve;
- (id)nauticalTwilightCurveP3;
- (id)outerComplicationColorCurve;
- (void)_notifyHandlers;
- (void)addColorUpdateHandler:(id)a3;
- (void)dealloc;
@end

@implementation NTKSiderealColorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_30);
  }
  v2 = (void *)sharedInstance___sharedInstance_1;
  return v2;
}

void __41__NTKSiderealColorManager_sharedInstance__block_invoke()
{
  id v0 = [[NTKSiderealColorManager alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSiderealColorManager;
  v2 = [(NTKSiderealColorManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    updateHandlers = v2->_updateHandlers;
    v2->_updateHandlers = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)dealloc
{
  updateHandlers = self->_updateHandlers;
  self->_updateHandlers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NTKSiderealColorManager;
  [(NTKSiderealColorManager *)&v4 dealloc];
}

- (void)addColorUpdateHandler:(id)a3
{
  updateHandlers = self->_updateHandlers;
  id v4 = _Block_copy(a3);
  [(NSMutableArray *)updateHandlers addObject:v4];
}

- (void)_notifyHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_updateHandlers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_createElementsFromDict:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 allKeys];
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_6];

  if ([v6 count])
  {
    long long v7 = [v6 objectAtIndexedSubscript:0];
    long long v8 = [v3 objectForKeyedSubscript:v7];
    [v7 floatValue];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v10 = v9;
    [v8 objectAtIndexedSubscript:0];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    [v8 objectAtIndexedSubscript:1];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    [v8 objectAtIndexedSubscript:2];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    NTKCubicColorCurveElementCreate(v10);
  }
  uint64_t v11 = [v6 count] - 2;
  if (v11 >= 0)
  {
    uint64_t v12 = [v6 objectAtIndexedSubscript:v11];
    v13 = [v3 objectForKeyedSubscript:v12];
    [v12 floatValue];
    NTKSunsetAltitudeToSolarDayPercentage();
    double v15 = v14;
    [v13 objectAtIndexedSubscript:0];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    [v13 objectAtIndexedSubscript:1];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    [v13 objectAtIndexedSubscript:2];
    [(id)objc_claimAutoreleasedReturnValue() floatValue];
    NTKCubicColorCurveElementCreate(v15);
  }

  return v4;
}

uint64_t __51__NTKSiderealColorManager__createElementsFromDict___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)civilTwilightCurveP3
{
  v11[13] = *MEMORY[0x1E4F143B8];
  civilTwilightCurve_p3 = self->_civilTwilightCurve_p3;
  if (civilTwilightCurve_p3)
  {
    id v3 = civilTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_1F16E0BA0;
    v10[1] = &unk_1F16E0BB8;
    v11[0] = &unk_1F16E8E90;
    v11[1] = &unk_1F16E8EA8;
    v10[2] = &unk_1F16E0BD0;
    v10[3] = &unk_1F16E0BE8;
    v11[2] = &unk_1F16E8EC0;
    v11[3] = &unk_1F16E8ED8;
    v10[4] = &unk_1F16E0C00;
    v10[5] = &unk_1F16E0C18;
    v11[4] = &unk_1F16E8EF0;
    v11[5] = &unk_1F16E8F08;
    v10[6] = &unk_1F16E0C30;
    v10[7] = &unk_1F16E0C48;
    v11[6] = &unk_1F16E8F20;
    v11[7] = &unk_1F16E8F38;
    v10[8] = &unk_1F16E0C60;
    v10[9] = &unk_1F16E0C78;
    v11[8] = &unk_1F16E8F50;
    v11[9] = &unk_1F16E8F68;
    v10[10] = &unk_1F16E0C90;
    v10[11] = &unk_1F16E0CA8;
    v11[10] = &unk_1F16E8F80;
    v11[11] = &unk_1F16E8F98;
    v10[12] = &unk_1F16E0CC0;
    v11[12] = &unk_1F16E8FB0;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(NTKSiderealColorManager *)self _createElementsFromDict:v5];

    long long v7 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_civilTwilightCurve_p3;
    self->_civilTwilightCurve_p3 = v7;

    id v3 = self->_civilTwilightCurve_p3;
  }
  return v3;
}

- (id)nauticalTwilightCurveP3
{
  v11[13] = *MEMORY[0x1E4F143B8];
  nauticalTwilightCurve_p3 = self->_nauticalTwilightCurve_p3;
  if (nauticalTwilightCurve_p3)
  {
    id v3 = nauticalTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_1F16E0BA0;
    v10[1] = &unk_1F16E0BB8;
    v11[0] = &unk_1F16E8FC8;
    v11[1] = &unk_1F16E8FE0;
    v10[2] = &unk_1F16E0BD0;
    v10[3] = &unk_1F16E0BE8;
    v11[2] = &unk_1F16E8FF8;
    v11[3] = &unk_1F16E9010;
    v10[4] = &unk_1F16E0C00;
    v10[5] = &unk_1F16E0C18;
    v11[4] = &unk_1F16E9028;
    v11[5] = &unk_1F16E9040;
    v10[6] = &unk_1F16E0C30;
    v10[7] = &unk_1F16E0C48;
    v11[6] = &unk_1F16E9058;
    v11[7] = &unk_1F16E9070;
    v10[8] = &unk_1F16E0C60;
    v10[9] = &unk_1F16E0C78;
    v11[8] = &unk_1F16E9088;
    v11[9] = &unk_1F16E90A0;
    v10[10] = &unk_1F16E0C90;
    v10[11] = &unk_1F16E0CA8;
    v11[10] = &unk_1F16E90B8;
    v11[11] = &unk_1F16E90D0;
    v10[12] = &unk_1F16E0CC0;
    v11[12] = &unk_1F16E90E8;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(NTKSiderealColorManager *)self _createElementsFromDict:v5];

    long long v7 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_nauticalTwilightCurve_p3;
    self->_nauticalTwilightCurve_p3 = v7;

    id v3 = self->_nauticalTwilightCurve_p3;
  }
  return v3;
}

- (id)astronomicalTwilightCurveP3
{
  v11[13] = *MEMORY[0x1E4F143B8];
  astronomicalTwilightCurve_p3 = self->_astronomicalTwilightCurve_p3;
  if (astronomicalTwilightCurve_p3)
  {
    id v3 = astronomicalTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_1F16E0BA0;
    v10[1] = &unk_1F16E0BB8;
    v11[0] = &unk_1F16E9100;
    v11[1] = &unk_1F16E9118;
    v10[2] = &unk_1F16E0BD0;
    v10[3] = &unk_1F16E0BE8;
    v11[2] = &unk_1F16E9130;
    v11[3] = &unk_1F16E9148;
    v10[4] = &unk_1F16E0C00;
    v10[5] = &unk_1F16E0C18;
    v11[4] = &unk_1F16E9160;
    v11[5] = &unk_1F16E9178;
    v10[6] = &unk_1F16E0C30;
    v10[7] = &unk_1F16E0C48;
    v11[6] = &unk_1F16E9190;
    v11[7] = &unk_1F16E91A8;
    v10[8] = &unk_1F16E0C60;
    v10[9] = &unk_1F16E0C78;
    v11[8] = &unk_1F16E91C0;
    v11[9] = &unk_1F16E91D8;
    v10[10] = &unk_1F16E0C90;
    v10[11] = &unk_1F16E0CA8;
    v11[10] = &unk_1F16E91F0;
    v11[11] = &unk_1F16E9208;
    v10[12] = &unk_1F16E0CC0;
    v11[12] = &unk_1F16E9220;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(NTKSiderealColorManager *)self _createElementsFromDict:v5];

    long long v7 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_astronomicalTwilightCurve_p3;
    self->_astronomicalTwilightCurve_p3 = v7;

    id v3 = self->_astronomicalTwilightCurve_p3;
  }
  return v3;
}

- (id)dayGradientCurveP3
{
  v23[13] = *MEMORY[0x1E4F143B8];
  dayGradientCurve_p3 = self->_dayGradientCurve_p3;
  if (dayGradientCurve_p3)
  {
    id v3 = dayGradientCurve_p3;
  }
  else
  {
    v22[0] = &unk_1F16E0BA0;
    v22[1] = &unk_1F16E0BB8;
    v23[0] = &unk_1F16E9238;
    v23[1] = &unk_1F16E9250;
    v22[2] = &unk_1F16E0BD0;
    v22[3] = &unk_1F16E0BE8;
    v23[2] = &unk_1F16E9268;
    v23[3] = &unk_1F16E9280;
    v22[4] = &unk_1F16E0C00;
    v22[5] = &unk_1F16E0C18;
    v23[4] = &unk_1F16E9298;
    v23[5] = &unk_1F16E92B0;
    v22[6] = &unk_1F16E0C30;
    v22[7] = &unk_1F16E0C48;
    v23[6] = &unk_1F16E92C8;
    v23[7] = &unk_1F16E92E0;
    v22[8] = &unk_1F16E0C60;
    v22[9] = &unk_1F16E0C78;
    v23[8] = &unk_1F16E92F8;
    v23[9] = &unk_1F16E9310;
    v22[10] = &unk_1F16E0C90;
    v22[11] = &unk_1F16E0CA8;
    v23[10] = &unk_1F16E9328;
    v23[11] = &unk_1F16E9340;
    v22[12] = &unk_1F16E0CC0;
    v23[12] = &unk_1F16E9358;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:13];
    v16 = [(NTKSiderealColorManager *)self _createElementsFromDict:v5];

    double v15 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v16];
    v20[0] = &unk_1F16E0BA0;
    v20[1] = &unk_1F16E0BB8;
    v21[0] = &unk_1F16E9370;
    v21[1] = &unk_1F16E9388;
    v20[2] = &unk_1F16E0BD0;
    v20[3] = &unk_1F16E0BE8;
    v20[4] = &unk_1F16E0C00;
    v21[2] = &unk_1F16E93A0;
    v21[3] = &unk_1F16E93B8;
    v21[4] = &unk_1F16E93D0;
    v21[5] = &unk_1F16E93E8;
    v20[5] = &unk_1F16E0C18;
    v20[6] = &unk_1F16E0C30;
    v21[6] = &unk_1F16E9400;
    v21[7] = &unk_1F16E9418;
    v20[7] = &unk_1F16E0C48;
    v20[8] = &unk_1F16E0C60;
    v21[8] = &unk_1F16E9430;
    v21[9] = &unk_1F16E9448;
    v20[9] = &unk_1F16E0C78;
    v20[10] = &unk_1F16E0C90;
    v20[11] = &unk_1F16E0CA8;
    v20[12] = &unk_1F16E0CC0;
    v21[10] = &unk_1F16E9460;
    v21[11] = &unk_1F16E9478;
    v21[12] = &unk_1F16E9490;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:13];
    long long v7 = [(NTKSiderealColorManager *)self _createElementsFromDict:v6];

    long long v8 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v7];
    v18[0] = &unk_1F16E0BA0;
    v18[1] = &unk_1F16E0BB8;
    v19[0] = &unk_1F16E94A8;
    v19[1] = &unk_1F16E94C0;
    v18[2] = &unk_1F16E0BD0;
    v18[3] = &unk_1F16E0BE8;
    v19[2] = &unk_1F16E94D8;
    v19[3] = &unk_1F16E94F0;
    v18[4] = &unk_1F16E0C00;
    v18[5] = &unk_1F16E0C18;
    v19[4] = &unk_1F16E9508;
    v19[5] = &unk_1F16E9520;
    v18[6] = &unk_1F16E0C30;
    v18[7] = &unk_1F16E0C48;
    v19[6] = &unk_1F16E9538;
    v19[7] = &unk_1F16E9550;
    v18[8] = &unk_1F16E0C60;
    v18[9] = &unk_1F16E0C78;
    v19[8] = &unk_1F16E9568;
    v19[9] = &unk_1F16E9580;
    v18[10] = &unk_1F16E0C90;
    v18[11] = &unk_1F16E0CA8;
    v19[10] = &unk_1F16E9598;
    v19[11] = &unk_1F16E95B0;
    v18[12] = &unk_1F16E0CC0;
    v19[12] = &unk_1F16E95C8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:13];
    double v10 = [(NTKSiderealColorManager *)self _createElementsFromDict:v9];

    uint64_t v11 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v10];
    v17[0] = v15;
    v17[1] = v8;
    v17[2] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    v13 = self->_dayGradientCurve_p3;
    self->_dayGradientCurve_p3 = v12;

    id v3 = self->_dayGradientCurve_p3;
  }
  return v3;
}

- (id)dialBackgroundCurveP3
{
  v11[13] = *MEMORY[0x1E4F143B8];
  dialBackgroundCurve_p3 = self->_dialBackgroundCurve_p3;
  if (dialBackgroundCurve_p3)
  {
    id v3 = dialBackgroundCurve_p3;
  }
  else
  {
    v10[0] = &unk_1F16E0BA0;
    v10[1] = &unk_1F16E0BB8;
    v11[0] = &unk_1F16E95E0;
    v11[1] = &unk_1F16E95F8;
    v10[2] = &unk_1F16E0BD0;
    v10[3] = &unk_1F16E0BE8;
    v11[2] = &unk_1F16E9610;
    v11[3] = &unk_1F16E9628;
    v10[4] = &unk_1F16E0C00;
    v10[5] = &unk_1F16E0C18;
    v11[4] = &unk_1F16E9640;
    v11[5] = &unk_1F16E9658;
    v10[6] = &unk_1F16E0C30;
    v10[7] = &unk_1F16E0C48;
    v11[6] = &unk_1F16E9670;
    v11[7] = &unk_1F16E9688;
    v10[8] = &unk_1F16E0C60;
    v10[9] = &unk_1F16E0C78;
    v11[8] = &unk_1F16E96A0;
    v11[9] = &unk_1F16E96B8;
    v10[10] = &unk_1F16E0C90;
    v10[11] = &unk_1F16E0CA8;
    v11[10] = &unk_1F16E96D0;
    v11[11] = &unk_1F16E96E8;
    v10[12] = &unk_1F16E0CC0;
    v11[12] = &unk_1F16E9700;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(NTKSiderealColorManager *)self _createElementsFromDict:v5];

    long long v7 = [(NTKCubicColorCurve *)[NTKAltitudeColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_dialBackgroundCurve_p3;
    self->_dialBackgroundCurve_p3 = v7;

    id v3 = self->_dialBackgroundCurve_p3;
  }
  return v3;
}

- (id)dialBackgroundColorCurve
{
  v56[23] = *MEMORY[0x1E4F143B8];
  dialBackground = self->_dialBackground;
  if (!dialBackground)
  {
    v51 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    v55 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v4);
    v56[0] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    v54 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v5);
    v56[1] = v54;
    NTKSunriseAltitudeToSolarDayPercentage();
    v53 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v6);
    v56[2] = v53;
    NTKSunriseAltitudeToSolarDayPercentage();
    v52 = _elementWithColorAtAltitude(218.0, 83.0, 24.0, v7);
    v56[3] = v52;
    NTKSunriseAltitudeToSolarDayPercentage();
    v50 = _elementWithColorAtAltitude(212.0, 92.0, 22.0, v8);
    v56[4] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    v49 = _elementWithColorAtAltitude(206.0, 95.0, 21.0, v9);
    v56[5] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    v48 = _elementWithColorAtAltitude(202.0, 100.0, 20.0, v10);
    v56[6] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    v47 = _elementWithColorAtAltitude(200.0, 100.0, 20.0, v11);
    v56[7] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    v46 = _elementWithColorAtAltitude(200.0, 100.0, 20.0, v12);
    v56[8] = v46;
    NTKSunriseAltitudeToSolarDayPercentage();
    v45 = _elementWithColorAtAltitude(204.0, 100.0, 20.0, v13);
    v56[9] = v45;
    NTKSunriseAltitudeToSolarDayPercentage();
    v44 = _elementWithColorAtAltitude(206.0, 100.0, 24.0, v14);
    v56[10] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    v43 = _elementWithColorAtAltitude(217.0, 100.0, 24.0, v15);
    v56[11] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    v42 = _elementWithColorAtAltitude(217.0, 100.0, 24.0, v16);
    v56[12] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    v41 = _elementWithColorAtAltitude(220.0, 95.0, 24.0, v17);
    v56[13] = v41;
    NTKSunsetAltitudeToSolarDayPercentage();
    v40 = _elementWithColorAtAltitude(223.0, 89.0, 25.0, v18);
    v56[14] = v40;
    NTKSunsetAltitudeToSolarDayPercentage();
    v20 = _elementWithColorAtAltitude(225.0, 85.0, 26.0, v19);
    v56[15] = v20;
    NTKSunsetAltitudeToSolarDayPercentage();
    v22 = _elementWithColorAtAltitude(229.0, 85.0, 26.0, v21);
    v56[16] = v22;
    NTKSunsetAltitudeToSolarDayPercentage();
    v24 = _elementWithColorAtAltitude(233.0, 85.0, 26.0, v23);
    v56[17] = v24;
    NTKSunsetAltitudeToSolarDayPercentage();
    v26 = _elementWithColorAtAltitude(233.0, 85.0, 26.0, v25);
    v56[18] = v26;
    NTKSunsetAltitudeToSolarDayPercentage();
    v28 = _elementWithColorAtAltitude(233.0, 84.0, 26.0, v27);
    v56[19] = v28;
    NTKSunsetAltitudeToSolarDayPercentage();
    v30 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v29);
    v56[20] = v30;
    NTKSunsetAltitudeToSolarDayPercentage();
    v32 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v31);
    v56[21] = v32;
    NTKSunsetAltitudeToSolarDayPercentage();
    v34 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v33);
    v56[22] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:23];
    v36 = [(NTKCubicColorCurve *)v51 initWithColorCurveElements:v35];
    v37 = self->_dialBackground;
    self->_dialBackground = v36;

    dialBackground = self->_dialBackground;
  }
  v38 = dialBackground;
  return v38;
}

- (id)dayGradientColorCurves
{
  v170[25] = *MEMORY[0x1E4F143B8];
  dayGradient = self->_dayGradient;
  if (dayGradient)
  {
    id v3 = dayGradient;
  }
  else
  {
    v162 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    v165 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v4);
    v170[0] = v165;
    NTKSunriseAltitudeToSolarDayPercentage();
    v150 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v5);
    v170[1] = v150;
    NTKSunriseAltitudeToSolarDayPercentage();
    v146 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v6);
    v170[2] = v146;
    NTKSunriseAltitudeToSolarDayPercentage();
    v142 = _elementWithColorAtAltitude(235.0, 80.0, 25.0, v7);
    v170[3] = v142;
    NTKSunriseAltitudeToSolarDayPercentage();
    v139 = _elementWithColorAtAltitude(225.0, 64.0, 53.0, v8);
    v170[4] = v139;
    NTKSunriseAltitudeToSolarDayPercentage();
    v136 = _elementWithColorAtAltitude(224.0, 62.0, 61.0, v9);
    v170[5] = v136;
    NTKSunriseAltitudeToSolarDayPercentage();
    v132 = _elementWithColorAtAltitude(222.0, 60.0, 74.0, v10);
    v170[6] = v132;
    NTKSunriseAltitudeToSolarDayPercentage();
    v130 = _elementWithColorAtAltitude(216.0, 63.0, 76.0, v11);
    v170[7] = v130;
    NTKSunriseAltitudeToSolarDayPercentage();
    v128 = _elementWithColorAtAltitude(215.0, 69.0, 78.0, v12);
    v170[8] = v128;
    NTKSunriseAltitudeToSolarDayPercentage();
    v126 = _elementWithColorAtAltitude(214.0, 74.0, 80.0, v13);
    v170[9] = v126;
    NTKSunriseAltitudeToSolarDayPercentage();
    v124 = _elementWithColorAtAltitude(213.0, 86.0, 86.0, v14);
    v170[10] = v124;
    NTKSunriseAltitudeToSolarDayPercentage();
    v122 = _elementWithColorAtAltitude(212.0, 66.0, 88.0, v15);
    v170[11] = v122;
    NTKSunriseAltitudeToSolarDayPercentage();
    v120 = _elementWithColorAtAltitude(204.0, 19.0, 96.0, v16);
    v170[12] = v120;
    NTKSunsetAltitudeToSolarDayPercentage();
    v118 = _elementWithColorAtAltitude(212.0, 58.0, 87.0, v17);
    v170[13] = v118;
    NTKSunsetAltitudeToSolarDayPercentage();
    v116 = _elementWithColorAtAltitude(213.0, 78.0, 83.0, v18);
    v170[14] = v116;
    NTKSunsetAltitudeToSolarDayPercentage();
    v114 = _elementWithColorAtAltitude(217.0, 76.0, 67.0, v19);
    v170[15] = v114;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(220.0, 76.0, 60.0, v20);
    v170[16] = v21;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(223.0, 75.0, 55.0, v22);
    v170[17] = v23;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 73.0, 47.0, v24);
    v170[18] = v25;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(231.0, 78.0, 38.0, v26);
    v170[19] = v27;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(233.0, 82.0, 33.0, v28);
    v170[20] = v29;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(240.0, 96.0, 22.0, v30);
    v170[21] = v31;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v32);
    v170[22] = v33;
    NTKSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v34);
    v170[23] = v35;
    NTKSunsetAltitudeToSolarDayPercentage();
    v37 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v36);
    v170[24] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:25];
    v163 = [(NTKCubicColorCurve *)v162 initWithColorCurveElements:v38];

    v131 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    v147 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v39);
    v169[0] = v147;
    NTKSunriseAltitudeToSolarDayPercentage();
    v140 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v40);
    v169[1] = v140;
    NTKSunriseAltitudeToSolarDayPercentage();
    v137 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v41);
    v169[2] = v137;
    NTKSunriseAltitudeToSolarDayPercentage();
    v134 = _elementWithColorAtAltitude(214.0, 74.0, 22.0, v42);
    v169[3] = v134;
    NTKSunriseAltitudeToSolarDayPercentage();
    v133 = _elementWithColorAtAltitude(209.0, 30.0, 51.0, v43);
    v169[4] = v133;
    NTKSunriseAltitudeToSolarDayPercentage();
    v129 = _elementWithColorAtAltitude(207.0, 25.0, 60.0, v44);
    v169[5] = v129;
    NTKSunriseAltitudeToSolarDayPercentage();
    v127 = _elementWithColorAtAltitude(203.0, 21.0, 72.0, v45);
    v169[6] = v127;
    NTKSunriseAltitudeToSolarDayPercentage();
    v125 = _elementWithColorAtAltitude(212.0, 23.0, 82.0, v46);
    v169[7] = v125;
    NTKSunriseAltitudeToSolarDayPercentage();
    v123 = _elementWithColorAtAltitude(208.0, 31.0, 80.0, v47);
    v169[8] = v123;
    NTKSunriseAltitudeToSolarDayPercentage();
    v121 = _elementWithColorAtAltitude(205.0, 40.0, 80.0, v48);
    v169[9] = v121;
    NTKSunriseAltitudeToSolarDayPercentage();
    v119 = _elementWithColorAtAltitude(202.0, 62.0, 75.0, v49);
    v169[10] = v119;
    NTKSunriseAltitudeToSolarDayPercentage();
    v117 = _elementWithColorAtAltitude(201.0, 59.0, 77.0, v50);
    v169[11] = v117;
    NTKSunriseAltitudeToSolarDayPercentage();
    v152 = _elementWithColorAtAltitude(199.0, 53.0, 82.0, v51);
    v169[12] = v152;
    NTKSunsetAltitudeToSolarDayPercentage();
    v115 = _elementWithColorAtAltitude(202.0, 67.0, 77.0, v52);
    v169[13] = v115;
    NTKSunsetAltitudeToSolarDayPercentage();
    v113 = _elementWithColorAtAltitude(203.0, 74.0, 75.0, v53);
    v169[14] = v113;
    NTKSunsetAltitudeToSolarDayPercentage();
    v144 = _elementWithColorAtAltitude(210.0, 57.0, 67.0, v54);
    v169[15] = v144;
    NTKSunsetAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(215.0, 49.0, 64.0, v55);
    v169[16] = v56;
    NTKSunsetAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(221.0, 42.0, 61.0, v57);
    v169[17] = v58;
    NTKSunsetAltitudeToSolarDayPercentage();
    v60 = _elementWithColorAtAltitude(237.0, 30.0, 57.0, v59);
    v169[18] = v60;
    NTKSunsetAltitudeToSolarDayPercentage();
    v62 = _elementWithColorAtAltitude(236.0, 38.0, 48.0, v61);
    v169[19] = v62;
    NTKSunsetAltitudeToSolarDayPercentage();
    v64 = _elementWithColorAtAltitude(236.0, 46.0, 42.0, v63);
    v169[20] = v64;
    NTKSunsetAltitudeToSolarDayPercentage();
    v66 = _elementWithColorAtAltitude(235.0, 68.0, 31.0, v65);
    v169[21] = v66;
    NTKSunsetAltitudeToSolarDayPercentage();
    v68 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v67);
    v169[22] = v68;
    NTKSunsetAltitudeToSolarDayPercentage();
    v70 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v69);
    v169[23] = v70;
    NTKSunsetAltitudeToSolarDayPercentage();
    v72 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v71);
    v169[24] = v72;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:25];
    v156 = [(NTKCubicColorCurve *)v131 initWithColorCurveElements:v73];

    v74 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    v153 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v75);
    v168[0] = v153;
    NTKSunriseAltitudeToSolarDayPercentage();
    v151 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v76);
    v168[1] = v151;
    NTKSunriseAltitudeToSolarDayPercentage();
    v149 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v77);
    v168[2] = v149;
    NTKSunriseAltitudeToSolarDayPercentage();
    v155 = _elementWithColorAtAltitude(230.0, 60.0, 55.0, v78);
    v168[3] = v155;
    NTKSunriseAltitudeToSolarDayPercentage();
    v154 = _elementWithColorAtAltitude(21.0, 19.0, 61.0, v79);
    v168[4] = v154;
    NTKSunriseAltitudeToSolarDayPercentage();
    v148 = _elementWithColorAtAltitude(30.0, 29.0, 74.0, v80);
    v168[5] = v148;
    NTKSunriseAltitudeToSolarDayPercentage();
    v145 = _elementWithColorAtAltitude(35.0, 44.0, 94.0, v81);
    v168[6] = v145;
    NTKSunriseAltitudeToSolarDayPercentage();
    v143 = _elementWithColorAtAltitude(40.0, 28.0, 98.0, v82);
    v168[7] = v143;
    NTKSunriseAltitudeToSolarDayPercentage();
    v159 = _elementWithColorAtAltitude(54.0, 12.0, 86.0, v83);
    v168[8] = v159;
    NTKSunriseAltitudeToSolarDayPercentage();
    v141 = _elementWithColorAtAltitude(171.0, 8.0, 82.0, v84);
    v168[9] = v141;
    NTKSunriseAltitudeToSolarDayPercentage();
    v138 = _elementWithColorAtAltitude(206.0, 50.0, 94.0, v85);
    v168[10] = v138;
    NTKSunriseAltitudeToSolarDayPercentage();
    v135 = _elementWithColorAtAltitude(208.0, 58.0, 95.0, v86);
    v168[11] = v135;
    NTKSunriseAltitudeToSolarDayPercentage();
    v166 = _elementWithColorAtAltitude(210.0, 77.0, 96.0, v87);
    v168[12] = v166;
    NTKSunsetAltitudeToSolarDayPercentage();
    v158 = _elementWithColorAtAltitude(208.0, 58.0, 95.0, v88);
    v168[13] = v158;
    NTKSunsetAltitudeToSolarDayPercentage();
    v157 = _elementWithColorAtAltitude(206.0, 50.0, 94.0, v89);
    v168[14] = v157;
    NTKSunsetAltitudeToSolarDayPercentage();
    v161 = _elementWithColorAtAltitude(204.0, 17.0, 81.0, v90);
    v168[15] = v161;
    NTKSunsetAltitudeToSolarDayPercentage();
    v160 = _elementWithColorAtAltitude(54.0, 1.0, 76.0, v91);
    v168[16] = v160;
    NTKSunsetAltitudeToSolarDayPercentage();
    v93 = _elementWithColorAtAltitude(29.0, 14.0, 82.0, v92);
    v168[17] = v93;
    NTKSunsetAltitudeToSolarDayPercentage();
    v95 = _elementWithColorAtAltitude(28.0, 30.0, 98.0, v94);
    v168[18] = v95;
    NTKSunsetAltitudeToSolarDayPercentage();
    v97 = _elementWithColorAtAltitude(344.0, 10.0, 64.0, v96);
    v168[19] = v97;
    NTKSunsetAltitudeToSolarDayPercentage();
    v99 = _elementWithColorAtAltitude(245.0, 22.0, 56.0, v98);
    v168[20] = v99;
    NTKSunsetAltitudeToSolarDayPercentage();
    v101 = _elementWithColorAtAltitude(226.0, 79.0, 50.0, v100);
    v168[21] = v101;
    NTKSunsetAltitudeToSolarDayPercentage();
    v103 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v102);
    v168[22] = v103;
    NTKSunsetAltitudeToSolarDayPercentage();
    v105 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v104);
    v168[23] = v105;
    NTKSunsetAltitudeToSolarDayPercentage();
    v107 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v106);
    v168[24] = v107;
    v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:25];
    v109 = [(NTKCubicColorCurve *)v74 initWithColorCurveElements:v108];

    v167[0] = v163;
    v167[1] = v156;
    v167[2] = v109;
    v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:3];
    v111 = self->_dayGradient;
    self->_dayGradient = v110;

    id v3 = self->_dayGradient;
  }
  return v3;
}

- (id)civilTwilightColorCurve
{
  v58[24] = *MEMORY[0x1E4F143B8];
  civilTwilight = self->_civilTwilight;
  if (!civilTwilight)
  {
    double v53 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v4);
    v58[0] = v57;
    NTKSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v5);
    v58[1] = v56;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v6);
    v58[2] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(220.0, 70.0, 45.0, v7);
    v58[3] = v54;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 70.0, 46.0, v8);
    v58[4] = v52;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(215.0, 70.0, 47.0, v9);
    v58[5] = v51;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(215.0, 65.0, 50.0, v10);
    v58[6] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v11);
    v58[7] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v12);
    v58[8] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v13);
    v58[9] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v14);
    v58[10] = v46;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v15);
    v58[11] = v45;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(208.0, 85.0, 52.0, v16);
    v58[12] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(216.0, 75.0, 55.0, v17);
    v58[13] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(216.0, 75.0, 55.0, v18);
    v58[14] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(217.0, 75.0, 55.0, v19);
    v58[15] = v41;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(220.0, 75.0, 55.0, v20);
    v58[16] = v21;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(223.0, 70.0, 55.0, v22);
    v58[17] = v23;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 70.0, 60.0, v24);
    v58[18] = v25;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(228.0, 70.0, 60.0, v26);
    v58[19] = v27;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(228.0, 70.0, 50.0, v28);
    v58[20] = v29;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(226.0, 80.0, 40.0, v30);
    v58[21] = v31;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v32);
    v58[22] = v33;
    NTKSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:24];
    v37 = [(NTKCubicColorCurve *)v53 initWithColorCurveElements:v36];
    v38 = self->_civilTwilight;
    self->_civilTwilight = v37;

    civilTwilight = self->_civilTwilight;
  }
  double v39 = civilTwilight;
  return v39;
}

- (id)nauticalTwilightColorCurve
{
  v58[24] = *MEMORY[0x1E4F143B8];
  nauticalTwilight = self->_nauticalTwilight;
  if (!nauticalTwilight)
  {
    double v52 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v4);
    v58[0] = v57;
    NTKSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v5);
    v58[1] = v56;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 80.0, 30.0, v6);
    v58[2] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(216.0, 86.0, 30.0, v7);
    v58[3] = v54;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(210.0, 86.0, 33.0, v8);
    v58[4] = v53;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(208.0, 85.0, 33.0, v9);
    v58[5] = v51;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(206.0, 80.0, 36.0, v10);
    v58[6] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v11);
    v58[7] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v12);
    v58[8] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v13);
    v58[9] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v14);
    v58[10] = v46;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(208.0, 80.0, 37.0, v15);
    v58[11] = v45;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(207.0, 85.0, 39.0, v16);
    v58[12] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 85.0, 40.0, v17);
    v58[13] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(212.0, 85.0, 42.0, v18);
    v58[14] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(216.0, 85.0, 42.0, v19);
    v58[15] = v41;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(222.0, 80.0, 42.0, v20);
    v58[16] = v21;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(224.0, 75.0, 43.0, v22);
    v58[17] = v23;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 75.0, 45.0, v24);
    v58[18] = v25;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(228.0, 75.0, 45.0, v26);
    v58[19] = v27;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(228.0, 75.0, 40.0, v28);
    v58[20] = v29;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(224.0, 75.0, 28.0, v30);
    v58[21] = v31;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v32);
    v58[22] = v33;
    NTKSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:24];
    v37 = [(NTKCubicColorCurve *)v52 initWithColorCurveElements:v36];
    v38 = self->_nauticalTwilight;
    self->_nauticalTwilight = v37;

    nauticalTwilight = self->_nauticalTwilight;
  }
  double v39 = nauticalTwilight;
  return v39;
}

- (id)astronomicalTwilightColorCurve
{
  v58[24] = *MEMORY[0x1E4F143B8];
  astronomicalTwilight = self->_astronomicalTwilight;
  if (!astronomicalTwilight)
  {
    double v52 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v4);
    v58[0] = v57;
    NTKSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v5);
    v58[1] = v56;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v6);
    v58[2] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(212.0, 82.0, 20.0, v7);
    v58[3] = v54;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(204.0, 85.0, 20.0, v8);
    v58[4] = v53;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(202.0, 85.0, 20.0, v9);
    v58[5] = v51;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(198.0, 90.0, 22.0, v10);
    v58[6] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(200.0, 90.0, 24.0, v11);
    v58[7] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v12);
    v58[8] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v13);
    v58[9] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v14);
    v58[10] = v46;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(204.0, 85.0, 26.0, v15);
    v58[11] = v45;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(206.0, 85.0, 30.0, v16);
    v58[12] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(217.0, 85.0, 30.0, v17);
    v58[13] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(217.0, 85.0, 30.0, v18);
    v58[14] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(220.0, 86.0, 30.0, v19);
    v58[15] = v41;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(223.0, 86.0, 30.0, v20);
    v58[16] = v21;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(225.0, 81.0, 30.0, v22);
    v58[17] = v23;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(229.0, 80.0, 30.0, v24);
    v58[18] = v25;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(233.0, 75.0, 30.0, v26);
    v58[19] = v27;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(233.0, 75.0, 28.0, v28);
    v58[20] = v29;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(233.0, 75.0, 22.0, v30);
    v58[21] = v31;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v32);
    v58[22] = v33;
    NTKSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:24];
    v37 = [(NTKCubicColorCurve *)v52 initWithColorCurveElements:v36];
    v38 = self->_astronomicalTwilight;
    self->_astronomicalTwilight = v37;

    astronomicalTwilight = self->_astronomicalTwilight;
  }
  double v39 = astronomicalTwilight;
  return v39;
}

- (id)innerComplicationColorCurve
{
  v60[25] = *MEMORY[0x1E4F143B8];
  innerComplication = self->_innerComplication;
  if (!innerComplication)
  {
    double v54 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v59 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v4);
    v60[0] = v59;
    NTKSunriseAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v5);
    v60[1] = v58;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(225.0, 55.0, 85.0, v6);
    v60[2] = v57;
    NTKSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(223.0, 55.0, 85.0, v7);
    v60[3] = v56;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(218.0, 55.0, 85.0, v8);
    v60[4] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v9);
    v60[5] = v53;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v10);
    v60[6] = v52;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v11);
    v60[7] = v51;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(212.0, 55.0, 85.0, v12);
    v60[8] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(208.0, 55.0, 85.0, v13);
    v60[9] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(208.0, 60.0, 85.0, v14);
    v60[10] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(209.0, 55.0, 85.0, v15);
    v60[11] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(198.0, 50.0, 90.0, v16);
    v60[12] = v46;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(209.0, 55.0, 85.0, v17);
    v60[13] = v45;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(210.0, 60.0, 85.0, v18);
    v60[14] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 60.0, 85.0, v19);
    v60[15] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(218.0, 60.0, 88.0, v20);
    v60[16] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v22 = _elementWithColorAtAltitude(222.0, 60.0, 88.0, v21);
    v60[17] = v22;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v24 = _elementWithColorAtAltitude(229.0, 60.0, 85.0, v23);
    v60[18] = v24;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v26 = _elementWithColorAtAltitude(232.0, 55.0, 85.0, v25);
    v60[19] = v26;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(233.0, 55.0, 85.0, v27);
    v60[20] = v28;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v30 = _elementWithColorAtAltitude(230.0, 55.0, 85.0, v29);
    v60[21] = v30;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v32 = _elementWithColorAtAltitude(227.0, 55.0, 85.0, v31);
    v60[22] = v32;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v34 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v33);
    v60[23] = v34;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v36 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v35);
    v60[24] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:25];
    v38 = [(NTKCubicColorCurve *)v54 initWithColorCurveElements:v37];
    double v39 = self->_innerComplication;
    self->_innerComplication = v38;

    innerComplication = self->_innerComplication;
  }
  double v40 = innerComplication;
  return v40;
}

- (id)outerComplicationColorCurve
{
  v60[25] = *MEMORY[0x1E4F143B8];
  outerComplication = self->_outerComplication;
  if (!outerComplication)
  {
    double v54 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v59 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v4);
    v60[0] = v59;
    NTKSunriseAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v5);
    v60[1] = v58;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(225.0, 30.0, 92.0, v6);
    v60[2] = v57;
    NTKSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(223.0, 30.0, 92.0, v7);
    v60[3] = v56;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(218.0, 30.0, 92.0, v8);
    v60[4] = v55;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v9);
    v60[5] = v53;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v10);
    v60[6] = v52;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v11);
    v60[7] = v51;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(212.0, 30.0, 92.0, v12);
    v60[8] = v50;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(208.0, 30.0, 92.0, v13);
    v60[9] = v49;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(208.0, 30.0, 92.0, v14);
    v60[10] = v48;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(209.0, 30.0, 92.0, v15);
    v60[11] = v47;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(198.0, 30.0, 90.0, v16);
    v60[12] = v46;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(209.0, 30.0, 92.0, v17);
    v60[13] = v45;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(210.0, 30.0, 92.0, v18);
    v60[14] = v44;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 30.0, 92.0, v19);
    v60[15] = v43;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(218.0, 30.0, 92.0, v20);
    v60[16] = v42;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v22 = _elementWithColorAtAltitude(222.0, 30.0, 92.0, v21);
    v60[17] = v22;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v24 = _elementWithColorAtAltitude(229.0, 30.0, 92.0, v23);
    v60[18] = v24;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v26 = _elementWithColorAtAltitude(232.0, 30.0, 92.0, v25);
    v60[19] = v26;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(233.0, 30.0, 92.0, v27);
    v60[20] = v28;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v30 = _elementWithColorAtAltitude(230.0, 30.0, 92.0, v29);
    v60[21] = v30;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v32 = _elementWithColorAtAltitude(227.0, 30.0, 92.0, v31);
    v60[22] = v32;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v34 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v33);
    v60[23] = v34;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v36 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v35);
    v60[24] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:25];
    v38 = [(NTKCubicColorCurve *)v54 initWithColorCurveElements:v37];
    double v39 = self->_outerComplication;
    self->_outerComplication = v38;

    outerComplication = self->_outerComplication;
  }
  double v40 = outerComplication;
  return v40;
}

- (id)dayDiskBloomColorCurve
{
  v30[10] = *MEMORY[0x1E4F143B8];
  dayDiskBloom = self->_dayDiskBloom;
  if (!dayDiskBloom)
  {
    double v27 = [NTKAltitudeColorCurve alloc];
    NTKSunriseAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v4);
    v30[0] = v29;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v5);
    v30[1] = v28;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v7 = _elementWithColorAtAltitude(45.0, 45.0, 100.0, v6);
    v30[2] = v7;
    NTKSunriseAltitudeToSolarDayPercentage();
    double v9 = _elementWithColorAtAltitude(45.0, 10.0, 100.0, v8);
    v30[3] = v9;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v11 = _elementWithColorAtAltitude(45.0, 25.0, 100.0, v10);
    v30[4] = v11;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v13 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v12);
    v30[5] = v13;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v15 = _elementWithColorAtAltitude(40.0, 60.0, 100.0, v14);
    v30[6] = v15;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v17 = _elementWithColorAtAltitude(35.0, 65.0, 100.0, v16);
    v30[7] = v17;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v19 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v18);
    v30[8] = v19;
    NTKSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v20);
    v30[9] = v21;
    double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:10];
    double v23 = [(NTKCubicColorCurve *)v27 initWithColorCurveElements:v22];
    double v24 = self->_dayDiskBloom;
    self->_dayDiskBloom = v23;

    dayDiskBloom = self->_dayDiskBloom;
  }
  double v25 = dayDiskBloom;
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayDiskBloom, 0);
  objc_storeStrong((id *)&self->_outerComplication, 0);
  objc_storeStrong((id *)&self->_innerComplication, 0);
  objc_storeStrong((id *)&self->_dayGradientCurve_p3, 0);
  objc_storeStrong((id *)&self->_dialBackgroundCurve_p3, 0);
  objc_storeStrong((id *)&self->_astronomicalTwilightCurve_p3, 0);
  objc_storeStrong((id *)&self->_nauticalTwilightCurve_p3, 0);
  objc_storeStrong((id *)&self->_civilTwilightCurve_p3, 0);
  objc_storeStrong((id *)&self->_astronomicalTwilight, 0);
  objc_storeStrong((id *)&self->_nauticalTwilight, 0);
  objc_storeStrong((id *)&self->_civilTwilight, 0);
  objc_storeStrong((id *)&self->_dayGradient, 0);
  objc_storeStrong((id *)&self->_dialBackground, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
}

@end