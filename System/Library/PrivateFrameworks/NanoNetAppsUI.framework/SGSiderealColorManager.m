@interface SGSiderealColorManager
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

@implementation SGSiderealColorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __40__SGSiderealColorManager_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = [[SGSiderealColorManager alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SGSiderealColorManager;
  v2 = [(SGSiderealColorManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
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
  v4.super_class = (Class)SGSiderealColorManager;
  [(SGSiderealColorManager *)&v4 dealloc];
}

- (void)addColorUpdateHandler:(id)a3
{
  updateHandlers = self->_updateHandlers;
  id v4 = (id)MEMORY[0x25A2B4B60](a3, a2);
  [(NSMutableArray *)updateHandlers addObject:v4];
}

- (void)_notifyHandlers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
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
    unint64_t v7 = 0;
    do
    {
      long long v8 = [v6 objectAtIndexedSubscript:v7];
      long long v9 = [v3 objectForKeyedSubscript:v8];
      [v8 floatValue];
      SGSunriseAltitudeToSolarDayPercentage();
      double v11 = v10;
      uint64_t v12 = [v9 objectAtIndexedSubscript:0];
      [v12 floatValue];
      v13 = [v9 objectAtIndexedSubscript:1];
      [v13 floatValue];
      v14 = [v9 objectAtIndexedSubscript:2];
      [v14 floatValue];
      v15 = SGCubicColorCurveElementCreate(v11);

      [v4 addObject:v15];
      ++v7;
    }
    while (v7 < [v6 count]);
  }
  uint64_t v16 = [v6 count] - 2;
  if (v16 >= 0)
  {
    do
    {
      v17 = [v6 objectAtIndexedSubscript:v16];
      v18 = [v3 objectForKeyedSubscript:v17];
      [v17 floatValue];
      SGSunsetAltitudeToSolarDayPercentage();
      double v20 = v19;
      v21 = [v18 objectAtIndexedSubscript:0];
      [v21 floatValue];
      v22 = [v18 objectAtIndexedSubscript:1];
      [v22 floatValue];
      v23 = [v18 objectAtIndexedSubscript:2];
      [v23 floatValue];
      v24 = SGCubicColorCurveElementCreate(v20);

      [v4 addObject:v24];
      --v16;
    }
    while (v16 != -1);
  }

  return v4;
}

uint64_t __50__SGSiderealColorManager__createElementsFromDict___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)civilTwilightCurveP3
{
  v11[13] = *MEMORY[0x263EF8340];
  civilTwilightCurve_p3 = self->_civilTwilightCurve_p3;
  if (civilTwilightCurve_p3)
  {
    id v3 = civilTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_27064F4A0;
    v10[1] = &unk_27064F4B8;
    v11[0] = &unk_270650598;
    v11[1] = &unk_2706505B0;
    v10[2] = &unk_27064F4D0;
    v10[3] = &unk_27064F4E8;
    v11[2] = &unk_2706505C8;
    v11[3] = &unk_2706505E0;
    v10[4] = &unk_27064F500;
    v10[5] = &unk_27064F518;
    v11[4] = &unk_2706505F8;
    v11[5] = &unk_270650610;
    v10[6] = &unk_27064F530;
    v10[7] = &unk_27064F548;
    v11[6] = &unk_270650628;
    v11[7] = &unk_270650640;
    v10[8] = &unk_27064F560;
    v10[9] = &unk_27064F578;
    v11[8] = &unk_270650658;
    v11[9] = &unk_270650670;
    v10[10] = &unk_27064F590;
    v10[11] = &unk_27064F5A8;
    v11[10] = &unk_270650688;
    v11[11] = &unk_2706506A0;
    v10[12] = &unk_27064F5C0;
    v11[12] = &unk_2706506B8;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(SGSiderealColorManager *)self _createElementsFromDict:v5];

    unint64_t v7 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_civilTwilightCurve_p3;
    self->_civilTwilightCurve_p3 = v7;

    id v3 = self->_civilTwilightCurve_p3;
  }
  return v3;
}

- (id)nauticalTwilightCurveP3
{
  v11[13] = *MEMORY[0x263EF8340];
  nauticalTwilightCurve_p3 = self->_nauticalTwilightCurve_p3;
  if (nauticalTwilightCurve_p3)
  {
    id v3 = nauticalTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_27064F4A0;
    v10[1] = &unk_27064F4B8;
    v11[0] = &unk_2706506D0;
    v11[1] = &unk_2706506E8;
    v10[2] = &unk_27064F4D0;
    v10[3] = &unk_27064F4E8;
    v11[2] = &unk_270650700;
    v11[3] = &unk_270650718;
    v10[4] = &unk_27064F500;
    v10[5] = &unk_27064F518;
    v11[4] = &unk_270650730;
    v11[5] = &unk_270650748;
    v10[6] = &unk_27064F530;
    v10[7] = &unk_27064F548;
    v11[6] = &unk_270650760;
    v11[7] = &unk_270650778;
    v10[8] = &unk_27064F560;
    v10[9] = &unk_27064F578;
    v11[8] = &unk_270650790;
    v11[9] = &unk_2706507A8;
    v10[10] = &unk_27064F590;
    v10[11] = &unk_27064F5A8;
    v11[10] = &unk_2706507C0;
    v11[11] = &unk_2706507D8;
    v10[12] = &unk_27064F5C0;
    v11[12] = &unk_2706507F0;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(SGSiderealColorManager *)self _createElementsFromDict:v5];

    unint64_t v7 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_nauticalTwilightCurve_p3;
    self->_nauticalTwilightCurve_p3 = v7;

    id v3 = self->_nauticalTwilightCurve_p3;
  }
  return v3;
}

- (id)astronomicalTwilightCurveP3
{
  v11[13] = *MEMORY[0x263EF8340];
  astronomicalTwilightCurve_p3 = self->_astronomicalTwilightCurve_p3;
  if (astronomicalTwilightCurve_p3)
  {
    id v3 = astronomicalTwilightCurve_p3;
  }
  else
  {
    v10[0] = &unk_27064F4A0;
    v10[1] = &unk_27064F4B8;
    v11[0] = &unk_270650808;
    v11[1] = &unk_270650820;
    v10[2] = &unk_27064F4D0;
    v10[3] = &unk_27064F4E8;
    v11[2] = &unk_270650838;
    v11[3] = &unk_270650850;
    v10[4] = &unk_27064F500;
    v10[5] = &unk_27064F518;
    v11[4] = &unk_270650868;
    v11[5] = &unk_270650880;
    v10[6] = &unk_27064F530;
    v10[7] = &unk_27064F548;
    v11[6] = &unk_270650898;
    v11[7] = &unk_2706508B0;
    v10[8] = &unk_27064F560;
    v10[9] = &unk_27064F578;
    v11[8] = &unk_2706508C8;
    v11[9] = &unk_2706508E0;
    v10[10] = &unk_27064F590;
    v10[11] = &unk_27064F5A8;
    v11[10] = &unk_2706508F8;
    v11[11] = &unk_270650910;
    v10[12] = &unk_27064F5C0;
    v11[12] = &unk_270650928;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(SGSiderealColorManager *)self _createElementsFromDict:v5];

    unint64_t v7 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_astronomicalTwilightCurve_p3;
    self->_astronomicalTwilightCurve_p3 = v7;

    id v3 = self->_astronomicalTwilightCurve_p3;
  }
  return v3;
}

- (id)dayGradientCurveP3
{
  v23[13] = *MEMORY[0x263EF8340];
  dayGradientCurve_p3 = self->_dayGradientCurve_p3;
  if (dayGradientCurve_p3)
  {
    id v3 = dayGradientCurve_p3;
  }
  else
  {
    v22[0] = &unk_27064F4A0;
    v22[1] = &unk_27064F4B8;
    v23[0] = &unk_270650940;
    v23[1] = &unk_270650958;
    v22[2] = &unk_27064F4D0;
    v22[3] = &unk_27064F4E8;
    v23[2] = &unk_270650970;
    v23[3] = &unk_270650988;
    v22[4] = &unk_27064F500;
    v22[5] = &unk_27064F518;
    v23[4] = &unk_2706509A0;
    v23[5] = &unk_2706509B8;
    v22[6] = &unk_27064F530;
    v22[7] = &unk_27064F548;
    v23[6] = &unk_2706509D0;
    v23[7] = &unk_2706509E8;
    v22[8] = &unk_27064F560;
    v22[9] = &unk_27064F578;
    v23[8] = &unk_270650A00;
    v23[9] = &unk_270650A18;
    v22[10] = &unk_27064F590;
    v22[11] = &unk_27064F5A8;
    v23[10] = &unk_270650A30;
    v23[11] = &unk_270650A48;
    v22[12] = &unk_27064F5C0;
    v23[12] = &unk_270650A60;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:13];
    uint64_t v16 = [(SGSiderealColorManager *)self _createElementsFromDict:v5];

    v15 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v16];
    v20[0] = &unk_27064F4A0;
    v20[1] = &unk_27064F4B8;
    v21[0] = &unk_270650A78;
    v21[1] = &unk_270650A90;
    v20[2] = &unk_27064F4D0;
    v20[3] = &unk_27064F4E8;
    v20[4] = &unk_27064F500;
    v21[2] = &unk_270650AA8;
    v21[3] = &unk_270650AC0;
    v21[4] = &unk_270650AD8;
    v21[5] = &unk_270650AF0;
    v20[5] = &unk_27064F518;
    v20[6] = &unk_27064F530;
    v21[6] = &unk_270650B08;
    v21[7] = &unk_270650B20;
    v20[7] = &unk_27064F548;
    v20[8] = &unk_27064F560;
    v21[8] = &unk_270650B38;
    v21[9] = &unk_270650B50;
    v20[9] = &unk_27064F578;
    v20[10] = &unk_27064F590;
    v20[11] = &unk_27064F5A8;
    v20[12] = &unk_27064F5C0;
    v21[10] = &unk_270650B68;
    v21[11] = &unk_270650B80;
    v21[12] = &unk_270650B98;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:13];
    unint64_t v7 = [(SGSiderealColorManager *)self _createElementsFromDict:v6];

    long long v8 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v7];
    v18[0] = &unk_27064F4A0;
    v18[1] = &unk_27064F4B8;
    v19[0] = &unk_270650BB0;
    v19[1] = &unk_270650BC8;
    v18[2] = &unk_27064F4D0;
    v18[3] = &unk_27064F4E8;
    v19[2] = &unk_270650BE0;
    v19[3] = &unk_270650BF8;
    v18[4] = &unk_27064F500;
    v18[5] = &unk_27064F518;
    v19[4] = &unk_270650C10;
    v19[5] = &unk_270650C28;
    v18[6] = &unk_27064F530;
    v18[7] = &unk_27064F548;
    v19[6] = &unk_270650C40;
    v19[7] = &unk_270650C58;
    v18[8] = &unk_27064F560;
    v18[9] = &unk_27064F578;
    v19[8] = &unk_270650C70;
    v19[9] = &unk_270650C88;
    v18[10] = &unk_27064F590;
    v18[11] = &unk_27064F5A8;
    v19[10] = &unk_270650CA0;
    v19[11] = &unk_270650CB8;
    v18[12] = &unk_27064F5C0;
    v19[12] = &unk_270650CD0;
    long long v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:13];
    double v10 = [(SGSiderealColorManager *)self _createElementsFromDict:v9];

    double v11 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v10];
    v17[0] = v15;
    v17[1] = v8;
    v17[2] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    v13 = self->_dayGradientCurve_p3;
    self->_dayGradientCurve_p3 = v12;

    id v3 = self->_dayGradientCurve_p3;
  }
  return v3;
}

- (id)dialBackgroundCurveP3
{
  v11[13] = *MEMORY[0x263EF8340];
  dialBackgroundCurve_p3 = self->_dialBackgroundCurve_p3;
  if (dialBackgroundCurve_p3)
  {
    id v3 = dialBackgroundCurve_p3;
  }
  else
  {
    v10[0] = &unk_27064F4A0;
    v10[1] = &unk_27064F4B8;
    v11[0] = &unk_270650CE8;
    v11[1] = &unk_270650D00;
    v10[2] = &unk_27064F4D0;
    v10[3] = &unk_27064F4E8;
    v11[2] = &unk_270650D18;
    v11[3] = &unk_270650D30;
    v10[4] = &unk_27064F500;
    v10[5] = &unk_27064F518;
    v11[4] = &unk_270650D48;
    v11[5] = &unk_270650D60;
    v10[6] = &unk_27064F530;
    v10[7] = &unk_27064F548;
    v11[6] = &unk_270650D78;
    v11[7] = &unk_270650D90;
    v10[8] = &unk_27064F560;
    v10[9] = &unk_27064F578;
    v11[8] = &unk_270650DA8;
    v11[9] = &unk_270650DC0;
    v10[10] = &unk_27064F590;
    v10[11] = &unk_27064F5A8;
    v11[10] = &unk_270650DD8;
    v11[11] = &unk_270650DF0;
    v10[12] = &unk_27064F5C0;
    v11[12] = &unk_270650E08;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:13];
    uint64_t v6 = [(SGSiderealColorManager *)self _createElementsFromDict:v5];

    unint64_t v7 = [[SGCubicColorCurve alloc] initWithCubicColorCurveElements:v6];
    long long v8 = self->_dialBackgroundCurve_p3;
    self->_dialBackgroundCurve_p3 = v7;

    id v3 = self->_dialBackgroundCurve_p3;
  }
  return v3;
}

- (id)dialBackgroundColorCurve
{
  v56[23] = *MEMORY[0x263EF8340];
  dialBackground = self->_dialBackground;
  if (!dialBackground)
  {
    v51 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    v55 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v4);
    v56[0] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    v54 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v5);
    v56[1] = v54;
    SGSunriseAltitudeToSolarDayPercentage();
    v53 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v6);
    v56[2] = v53;
    SGSunriseAltitudeToSolarDayPercentage();
    v52 = _elementWithColorAtAltitude(218.0, 83.0, 24.0, v7);
    v56[3] = v52;
    SGSunriseAltitudeToSolarDayPercentage();
    v50 = _elementWithColorAtAltitude(212.0, 92.0, 22.0, v8);
    v56[4] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    v49 = _elementWithColorAtAltitude(206.0, 95.0, 21.0, v9);
    v56[5] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    v48 = _elementWithColorAtAltitude(202.0, 100.0, 20.0, v10);
    v56[6] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    v47 = _elementWithColorAtAltitude(200.0, 100.0, 20.0, v11);
    v56[7] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    v46 = _elementWithColorAtAltitude(200.0, 100.0, 20.0, v12);
    v56[8] = v46;
    SGSunriseAltitudeToSolarDayPercentage();
    v45 = _elementWithColorAtAltitude(204.0, 100.0, 20.0, v13);
    v56[9] = v45;
    SGSunriseAltitudeToSolarDayPercentage();
    v44 = _elementWithColorAtAltitude(206.0, 100.0, 24.0, v14);
    v56[10] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    v43 = _elementWithColorAtAltitude(217.0, 100.0, 24.0, v15);
    v56[11] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    v42 = _elementWithColorAtAltitude(217.0, 100.0, 24.0, v16);
    v56[12] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    v41 = _elementWithColorAtAltitude(220.0, 95.0, 24.0, v17);
    v56[13] = v41;
    SGSunsetAltitudeToSolarDayPercentage();
    v40 = _elementWithColorAtAltitude(223.0, 89.0, 25.0, v18);
    v56[14] = v40;
    SGSunsetAltitudeToSolarDayPercentage();
    double v20 = _elementWithColorAtAltitude(225.0, 85.0, 26.0, v19);
    v56[15] = v20;
    SGSunsetAltitudeToSolarDayPercentage();
    v22 = _elementWithColorAtAltitude(229.0, 85.0, 26.0, v21);
    v56[16] = v22;
    SGSunsetAltitudeToSolarDayPercentage();
    v24 = _elementWithColorAtAltitude(233.0, 85.0, 26.0, v23);
    v56[17] = v24;
    SGSunsetAltitudeToSolarDayPercentage();
    v26 = _elementWithColorAtAltitude(233.0, 85.0, 26.0, v25);
    v56[18] = v26;
    SGSunsetAltitudeToSolarDayPercentage();
    v28 = _elementWithColorAtAltitude(233.0, 84.0, 26.0, v27);
    v56[19] = v28;
    SGSunsetAltitudeToSolarDayPercentage();
    v30 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v29);
    v56[20] = v30;
    SGSunsetAltitudeToSolarDayPercentage();
    v32 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v31);
    v56[21] = v32;
    SGSunsetAltitudeToSolarDayPercentage();
    v34 = _elementWithColorAtAltitude(224.0, 80.0, 24.0, v33);
    v56[22] = v34;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:23];
    v36 = [(SGCubicColorCurve *)v51 initWithColorCurveElements:v35];
    v37 = self->_dialBackground;
    self->_dialBackground = v36;

    dialBackground = self->_dialBackground;
  }
  v38 = dialBackground;
  return v38;
}

- (id)dayGradientColorCurves
{
  v170[25] = *MEMORY[0x263EF8340];
  dayGradient = self->_dayGradient;
  if (dayGradient)
  {
    id v3 = dayGradient;
  }
  else
  {
    v162 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    v165 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v4);
    v170[0] = v165;
    SGSunriseAltitudeToSolarDayPercentage();
    v150 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v5);
    v170[1] = v150;
    SGSunriseAltitudeToSolarDayPercentage();
    v146 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v6);
    v170[2] = v146;
    SGSunriseAltitudeToSolarDayPercentage();
    v142 = _elementWithColorAtAltitude(235.0, 80.0, 25.0, v7);
    v170[3] = v142;
    SGSunriseAltitudeToSolarDayPercentage();
    v139 = _elementWithColorAtAltitude(225.0, 64.0, 53.0, v8);
    v170[4] = v139;
    SGSunriseAltitudeToSolarDayPercentage();
    v136 = _elementWithColorAtAltitude(224.0, 62.0, 61.0, v9);
    v170[5] = v136;
    SGSunriseAltitudeToSolarDayPercentage();
    v132 = _elementWithColorAtAltitude(222.0, 60.0, 74.0, v10);
    v170[6] = v132;
    SGSunriseAltitudeToSolarDayPercentage();
    v130 = _elementWithColorAtAltitude(216.0, 63.0, 76.0, v11);
    v170[7] = v130;
    SGSunriseAltitudeToSolarDayPercentage();
    v128 = _elementWithColorAtAltitude(215.0, 69.0, 78.0, v12);
    v170[8] = v128;
    SGSunriseAltitudeToSolarDayPercentage();
    v126 = _elementWithColorAtAltitude(214.0, 74.0, 80.0, v13);
    v170[9] = v126;
    SGSunriseAltitudeToSolarDayPercentage();
    v124 = _elementWithColorAtAltitude(213.0, 86.0, 86.0, v14);
    v170[10] = v124;
    SGSunriseAltitudeToSolarDayPercentage();
    v122 = _elementWithColorAtAltitude(212.0, 66.0, 88.0, v15);
    v170[11] = v122;
    SGSunriseAltitudeToSolarDayPercentage();
    v120 = _elementWithColorAtAltitude(204.0, 19.0, 96.0, v16);
    v170[12] = v120;
    SGSunsetAltitudeToSolarDayPercentage();
    v118 = _elementWithColorAtAltitude(212.0, 58.0, 87.0, v17);
    v170[13] = v118;
    SGSunsetAltitudeToSolarDayPercentage();
    v116 = _elementWithColorAtAltitude(213.0, 78.0, 83.0, v18);
    v170[14] = v116;
    SGSunsetAltitudeToSolarDayPercentage();
    v114 = _elementWithColorAtAltitude(217.0, 76.0, 67.0, v19);
    v170[15] = v114;
    SGSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(220.0, 76.0, 60.0, v20);
    v170[16] = v21;
    SGSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(223.0, 75.0, 55.0, v22);
    v170[17] = v23;
    SGSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 73.0, 47.0, v24);
    v170[18] = v25;
    SGSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(231.0, 78.0, 38.0, v26);
    v170[19] = v27;
    SGSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(233.0, 82.0, 33.0, v28);
    v170[20] = v29;
    SGSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(240.0, 96.0, 22.0, v30);
    v170[21] = v31;
    SGSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v32);
    v170[22] = v33;
    SGSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v34);
    v170[23] = v35;
    SGSunsetAltitudeToSolarDayPercentage();
    v37 = _elementWithColorAtAltitude(237.0, 87.0, 24.0, v36);
    v170[24] = v37;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v170 count:25];
    v163 = [(SGCubicColorCurve *)v162 initWithColorCurveElements:v38];

    v131 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    v147 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v39);
    v169[0] = v147;
    SGSunriseAltitudeToSolarDayPercentage();
    v140 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v40);
    v169[1] = v140;
    SGSunriseAltitudeToSolarDayPercentage();
    v137 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v41);
    v169[2] = v137;
    SGSunriseAltitudeToSolarDayPercentage();
    v134 = _elementWithColorAtAltitude(214.0, 74.0, 22.0, v42);
    v169[3] = v134;
    SGSunriseAltitudeToSolarDayPercentage();
    v133 = _elementWithColorAtAltitude(209.0, 30.0, 51.0, v43);
    v169[4] = v133;
    SGSunriseAltitudeToSolarDayPercentage();
    v129 = _elementWithColorAtAltitude(207.0, 25.0, 60.0, v44);
    v169[5] = v129;
    SGSunriseAltitudeToSolarDayPercentage();
    v127 = _elementWithColorAtAltitude(203.0, 21.0, 72.0, v45);
    v169[6] = v127;
    SGSunriseAltitudeToSolarDayPercentage();
    v125 = _elementWithColorAtAltitude(212.0, 23.0, 82.0, v46);
    v169[7] = v125;
    SGSunriseAltitudeToSolarDayPercentage();
    v123 = _elementWithColorAtAltitude(208.0, 31.0, 80.0, v47);
    v169[8] = v123;
    SGSunriseAltitudeToSolarDayPercentage();
    v121 = _elementWithColorAtAltitude(205.0, 40.0, 80.0, v48);
    v169[9] = v121;
    SGSunriseAltitudeToSolarDayPercentage();
    v119 = _elementWithColorAtAltitude(202.0, 62.0, 75.0, v49);
    v169[10] = v119;
    SGSunriseAltitudeToSolarDayPercentage();
    v117 = _elementWithColorAtAltitude(201.0, 59.0, 77.0, v50);
    v169[11] = v117;
    SGSunriseAltitudeToSolarDayPercentage();
    v152 = _elementWithColorAtAltitude(199.0, 53.0, 82.0, v51);
    v169[12] = v152;
    SGSunsetAltitudeToSolarDayPercentage();
    v115 = _elementWithColorAtAltitude(202.0, 67.0, 77.0, v52);
    v169[13] = v115;
    SGSunsetAltitudeToSolarDayPercentage();
    v113 = _elementWithColorAtAltitude(203.0, 74.0, 75.0, v53);
    v169[14] = v113;
    SGSunsetAltitudeToSolarDayPercentage();
    v144 = _elementWithColorAtAltitude(210.0, 57.0, 67.0, v54);
    v169[15] = v144;
    SGSunsetAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(215.0, 49.0, 64.0, v55);
    v169[16] = v56;
    SGSunsetAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(221.0, 42.0, 61.0, v57);
    v169[17] = v58;
    SGSunsetAltitudeToSolarDayPercentage();
    v60 = _elementWithColorAtAltitude(237.0, 30.0, 57.0, v59);
    v169[18] = v60;
    SGSunsetAltitudeToSolarDayPercentage();
    v62 = _elementWithColorAtAltitude(236.0, 38.0, 48.0, v61);
    v169[19] = v62;
    SGSunsetAltitudeToSolarDayPercentage();
    v64 = _elementWithColorAtAltitude(236.0, 46.0, 42.0, v63);
    v169[20] = v64;
    SGSunsetAltitudeToSolarDayPercentage();
    v66 = _elementWithColorAtAltitude(235.0, 68.0, 31.0, v65);
    v169[21] = v66;
    SGSunsetAltitudeToSolarDayPercentage();
    v68 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v67);
    v169[22] = v68;
    SGSunsetAltitudeToSolarDayPercentage();
    v70 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v69);
    v169[23] = v70;
    SGSunsetAltitudeToSolarDayPercentage();
    v72 = _elementWithColorAtAltitude(225.0, 70.0, 27.0, v71);
    v169[24] = v72;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v169 count:25];
    v156 = [(SGCubicColorCurve *)v131 initWithColorCurveElements:v73];

    v74 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    v153 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v75);
    v168[0] = v153;
    SGSunriseAltitudeToSolarDayPercentage();
    v151 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v76);
    v168[1] = v151;
    SGSunriseAltitudeToSolarDayPercentage();
    v149 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v77);
    v168[2] = v149;
    SGSunriseAltitudeToSolarDayPercentage();
    v155 = _elementWithColorAtAltitude(230.0, 60.0, 55.0, v78);
    v168[3] = v155;
    SGSunriseAltitudeToSolarDayPercentage();
    v154 = _elementWithColorAtAltitude(21.0, 19.0, 61.0, v79);
    v168[4] = v154;
    SGSunriseAltitudeToSolarDayPercentage();
    v148 = _elementWithColorAtAltitude(30.0, 29.0, 74.0, v80);
    v168[5] = v148;
    SGSunriseAltitudeToSolarDayPercentage();
    v145 = _elementWithColorAtAltitude(35.0, 44.0, 94.0, v81);
    v168[6] = v145;
    SGSunriseAltitudeToSolarDayPercentage();
    v143 = _elementWithColorAtAltitude(40.0, 28.0, 98.0, v82);
    v168[7] = v143;
    SGSunriseAltitudeToSolarDayPercentage();
    v159 = _elementWithColorAtAltitude(54.0, 12.0, 86.0, v83);
    v168[8] = v159;
    SGSunriseAltitudeToSolarDayPercentage();
    v141 = _elementWithColorAtAltitude(171.0, 8.0, 82.0, v84);
    v168[9] = v141;
    SGSunriseAltitudeToSolarDayPercentage();
    v138 = _elementWithColorAtAltitude(206.0, 50.0, 94.0, v85);
    v168[10] = v138;
    SGSunriseAltitudeToSolarDayPercentage();
    v135 = _elementWithColorAtAltitude(208.0, 58.0, 95.0, v86);
    v168[11] = v135;
    SGSunriseAltitudeToSolarDayPercentage();
    v166 = _elementWithColorAtAltitude(210.0, 77.0, 96.0, v87);
    v168[12] = v166;
    SGSunsetAltitudeToSolarDayPercentage();
    v158 = _elementWithColorAtAltitude(208.0, 58.0, 95.0, v88);
    v168[13] = v158;
    SGSunsetAltitudeToSolarDayPercentage();
    v157 = _elementWithColorAtAltitude(206.0, 50.0, 94.0, v89);
    v168[14] = v157;
    SGSunsetAltitudeToSolarDayPercentage();
    v161 = _elementWithColorAtAltitude(204.0, 17.0, 81.0, v90);
    v168[15] = v161;
    SGSunsetAltitudeToSolarDayPercentage();
    v160 = _elementWithColorAtAltitude(54.0, 1.0, 76.0, v91);
    v168[16] = v160;
    SGSunsetAltitudeToSolarDayPercentage();
    v93 = _elementWithColorAtAltitude(29.0, 14.0, 82.0, v92);
    v168[17] = v93;
    SGSunsetAltitudeToSolarDayPercentage();
    v95 = _elementWithColorAtAltitude(28.0, 30.0, 98.0, v94);
    v168[18] = v95;
    SGSunsetAltitudeToSolarDayPercentage();
    v97 = _elementWithColorAtAltitude(344.0, 10.0, 64.0, v96);
    v168[19] = v97;
    SGSunsetAltitudeToSolarDayPercentage();
    v99 = _elementWithColorAtAltitude(245.0, 22.0, 56.0, v98);
    v168[20] = v99;
    SGSunsetAltitudeToSolarDayPercentage();
    v101 = _elementWithColorAtAltitude(226.0, 79.0, 50.0, v100);
    v168[21] = v101;
    SGSunsetAltitudeToSolarDayPercentage();
    v103 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v102);
    v168[22] = v103;
    SGSunsetAltitudeToSolarDayPercentage();
    v105 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v104);
    v168[23] = v105;
    SGSunsetAltitudeToSolarDayPercentage();
    v107 = _elementWithColorAtAltitude(227.0, 70.0, 48.0, v106);
    v168[24] = v107;
    v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:25];
    v109 = [(SGCubicColorCurve *)v74 initWithColorCurveElements:v108];

    v167[0] = v163;
    v167[1] = v156;
    v167[2] = v109;
    v110 = [MEMORY[0x263EFF8C0] arrayWithObjects:v167 count:3];
    v111 = self->_dayGradient;
    self->_dayGradient = v110;

    id v3 = self->_dayGradient;
  }
  return v3;
}

- (id)civilTwilightColorCurve
{
  v58[24] = *MEMORY[0x263EF8340];
  civilTwilight = self->_civilTwilight;
  if (!civilTwilight)
  {
    double v53 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v4);
    v58[0] = v57;
    SGSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v5);
    v58[1] = v56;
    SGSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v6);
    v58[2] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(220.0, 70.0, 45.0, v7);
    v58[3] = v54;
    SGSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 70.0, 46.0, v8);
    v58[4] = v52;
    SGSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(215.0, 70.0, 47.0, v9);
    v58[5] = v51;
    SGSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(215.0, 65.0, 50.0, v10);
    v58[6] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v11);
    v58[7] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v12);
    v58[8] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v13);
    v58[9] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v14);
    v58[10] = v46;
    SGSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(210.0, 80.0, 50.0, v15);
    v58[11] = v45;
    SGSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(208.0, 85.0, 52.0, v16);
    v58[12] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(216.0, 75.0, 55.0, v17);
    v58[13] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(216.0, 75.0, 55.0, v18);
    v58[14] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(217.0, 75.0, 55.0, v19);
    v58[15] = v41;
    SGSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(220.0, 75.0, 55.0, v20);
    v58[16] = v21;
    SGSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(223.0, 70.0, 55.0, v22);
    v58[17] = v23;
    SGSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 70.0, 60.0, v24);
    v58[18] = v25;
    SGSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(228.0, 70.0, 60.0, v26);
    v58[19] = v27;
    SGSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(228.0, 70.0, 50.0, v28);
    v58[20] = v29;
    SGSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(226.0, 80.0, 40.0, v30);
    v58[21] = v31;
    SGSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v32);
    v58[22] = v33;
    SGSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 80.0, 40.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:24];
    v37 = [(SGCubicColorCurve *)v53 initWithColorCurveElements:v36];
    v38 = self->_civilTwilight;
    self->_civilTwilight = v37;

    civilTwilight = self->_civilTwilight;
  }
  double v39 = civilTwilight;
  return v39;
}

- (id)nauticalTwilightColorCurve
{
  v58[24] = *MEMORY[0x263EF8340];
  nauticalTwilight = self->_nauticalTwilight;
  if (!nauticalTwilight)
  {
    double v52 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v4);
    v58[0] = v57;
    SGSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v5);
    v58[1] = v56;
    SGSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 80.0, 30.0, v6);
    v58[2] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(216.0, 86.0, 30.0, v7);
    v58[3] = v54;
    SGSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(210.0, 86.0, 33.0, v8);
    v58[4] = v53;
    SGSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(208.0, 85.0, 33.0, v9);
    v58[5] = v51;
    SGSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(206.0, 80.0, 36.0, v10);
    v58[6] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v11);
    v58[7] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v12);
    v58[8] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v13);
    v58[9] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(210.0, 80.0, 37.0, v14);
    v58[10] = v46;
    SGSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(208.0, 80.0, 37.0, v15);
    v58[11] = v45;
    SGSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(207.0, 85.0, 39.0, v16);
    v58[12] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 85.0, 40.0, v17);
    v58[13] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(212.0, 85.0, 42.0, v18);
    v58[14] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(216.0, 85.0, 42.0, v19);
    v58[15] = v41;
    SGSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(222.0, 80.0, 42.0, v20);
    v58[16] = v21;
    SGSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(224.0, 75.0, 43.0, v22);
    v58[17] = v23;
    SGSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(228.0, 75.0, 45.0, v24);
    v58[18] = v25;
    SGSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(228.0, 75.0, 45.0, v26);
    v58[19] = v27;
    SGSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(228.0, 75.0, 40.0, v28);
    v58[20] = v29;
    SGSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(224.0, 75.0, 28.0, v30);
    v58[21] = v31;
    SGSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v32);
    v58[22] = v33;
    SGSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 80.0, 28.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:24];
    v37 = [(SGCubicColorCurve *)v52 initWithColorCurveElements:v36];
    v38 = self->_nauticalTwilight;
    self->_nauticalTwilight = v37;

    nauticalTwilight = self->_nauticalTwilight;
  }
  double v39 = nauticalTwilight;
  return v39;
}

- (id)astronomicalTwilightColorCurve
{
  v58[24] = *MEMORY[0x263EF8340];
  astronomicalTwilight = self->_astronomicalTwilight;
  if (!astronomicalTwilight)
  {
    double v52 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v4);
    v58[0] = v57;
    SGSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v5);
    v58[1] = v56;
    SGSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v6);
    v58[2] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    double v54 = _elementWithColorAtAltitude(212.0, 82.0, 20.0, v7);
    v58[3] = v54;
    SGSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(204.0, 85.0, 20.0, v8);
    v58[4] = v53;
    SGSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(202.0, 85.0, 20.0, v9);
    v58[5] = v51;
    SGSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(198.0, 90.0, 22.0, v10);
    v58[6] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(200.0, 90.0, 24.0, v11);
    v58[7] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v12);
    v58[8] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v13);
    v58[9] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(200.0, 90.0, 26.0, v14);
    v58[10] = v46;
    SGSunriseAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(204.0, 85.0, 26.0, v15);
    v58[11] = v45;
    SGSunriseAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(206.0, 85.0, 30.0, v16);
    v58[12] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(217.0, 85.0, 30.0, v17);
    v58[13] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(217.0, 85.0, 30.0, v18);
    v58[14] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    double v41 = _elementWithColorAtAltitude(220.0, 86.0, 30.0, v19);
    v58[15] = v41;
    SGSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(223.0, 86.0, 30.0, v20);
    v58[16] = v21;
    SGSunsetAltitudeToSolarDayPercentage();
    double v23 = _elementWithColorAtAltitude(225.0, 81.0, 30.0, v22);
    v58[17] = v23;
    SGSunsetAltitudeToSolarDayPercentage();
    double v25 = _elementWithColorAtAltitude(229.0, 80.0, 30.0, v24);
    v58[18] = v25;
    SGSunsetAltitudeToSolarDayPercentage();
    double v27 = _elementWithColorAtAltitude(233.0, 75.0, 30.0, v26);
    v58[19] = v27;
    SGSunsetAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(233.0, 75.0, 28.0, v28);
    v58[20] = v29;
    SGSunsetAltitudeToSolarDayPercentage();
    double v31 = _elementWithColorAtAltitude(233.0, 75.0, 22.0, v30);
    v58[21] = v31;
    SGSunsetAltitudeToSolarDayPercentage();
    double v33 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v32);
    v58[22] = v33;
    SGSunsetAltitudeToSolarDayPercentage();
    v35 = _elementWithColorAtAltitude(224.0, 82.0, 20.0, v34);
    v58[23] = v35;
    double v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:24];
    v37 = [(SGCubicColorCurve *)v52 initWithColorCurveElements:v36];
    v38 = self->_astronomicalTwilight;
    self->_astronomicalTwilight = v37;

    astronomicalTwilight = self->_astronomicalTwilight;
  }
  double v39 = astronomicalTwilight;
  return v39;
}

- (id)innerComplicationColorCurve
{
  v60[25] = *MEMORY[0x263EF8340];
  innerComplication = self->_innerComplication;
  if (!innerComplication)
  {
    double v54 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v59 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v4);
    v60[0] = v59;
    SGSunriseAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v5);
    v60[1] = v58;
    SGSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(225.0, 55.0, 85.0, v6);
    v60[2] = v57;
    SGSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(223.0, 55.0, 85.0, v7);
    v60[3] = v56;
    SGSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(218.0, 55.0, 85.0, v8);
    v60[4] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v9);
    v60[5] = v53;
    SGSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v10);
    v60[6] = v52;
    SGSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(216.0, 55.0, 85.0, v11);
    v60[7] = v51;
    SGSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(212.0, 55.0, 85.0, v12);
    v60[8] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(208.0, 55.0, 85.0, v13);
    v60[9] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(208.0, 60.0, 85.0, v14);
    v60[10] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(209.0, 55.0, 85.0, v15);
    v60[11] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(198.0, 50.0, 90.0, v16);
    v60[12] = v46;
    SGSunsetAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(209.0, 55.0, 85.0, v17);
    v60[13] = v45;
    SGSunsetAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(210.0, 60.0, 85.0, v18);
    v60[14] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 60.0, 85.0, v19);
    v60[15] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(218.0, 60.0, 88.0, v20);
    v60[16] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    double v22 = _elementWithColorAtAltitude(222.0, 60.0, 88.0, v21);
    v60[17] = v22;
    SGSunsetAltitudeToSolarDayPercentage();
    double v24 = _elementWithColorAtAltitude(229.0, 60.0, 85.0, v23);
    v60[18] = v24;
    SGSunsetAltitudeToSolarDayPercentage();
    double v26 = _elementWithColorAtAltitude(232.0, 55.0, 85.0, v25);
    v60[19] = v26;
    SGSunsetAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(233.0, 55.0, 85.0, v27);
    v60[20] = v28;
    SGSunsetAltitudeToSolarDayPercentage();
    double v30 = _elementWithColorAtAltitude(230.0, 55.0, 85.0, v29);
    v60[21] = v30;
    SGSunsetAltitudeToSolarDayPercentage();
    double v32 = _elementWithColorAtAltitude(227.0, 55.0, 85.0, v31);
    v60[22] = v32;
    SGSunsetAltitudeToSolarDayPercentage();
    double v34 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v33);
    v60[23] = v34;
    SGSunsetAltitudeToSolarDayPercentage();
    double v36 = _elementWithColorAtAltitude(228.0, 55.0, 85.0, v35);
    v60[24] = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:25];
    v38 = [(SGCubicColorCurve *)v54 initWithColorCurveElements:v37];
    double v39 = self->_innerComplication;
    self->_innerComplication = v38;

    innerComplication = self->_innerComplication;
  }
  double v40 = innerComplication;
  return v40;
}

- (id)outerComplicationColorCurve
{
  v60[25] = *MEMORY[0x263EF8340];
  outerComplication = self->_outerComplication;
  if (!outerComplication)
  {
    double v54 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v59 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v4);
    v60[0] = v59;
    SGSunriseAltitudeToSolarDayPercentage();
    v58 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v5);
    v60[1] = v58;
    SGSunriseAltitudeToSolarDayPercentage();
    double v57 = _elementWithColorAtAltitude(225.0, 30.0, 92.0, v6);
    v60[2] = v57;
    SGSunriseAltitudeToSolarDayPercentage();
    v56 = _elementWithColorAtAltitude(223.0, 30.0, 92.0, v7);
    v60[3] = v56;
    SGSunriseAltitudeToSolarDayPercentage();
    double v55 = _elementWithColorAtAltitude(218.0, 30.0, 92.0, v8);
    v60[4] = v55;
    SGSunriseAltitudeToSolarDayPercentage();
    double v53 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v9);
    v60[5] = v53;
    SGSunriseAltitudeToSolarDayPercentage();
    double v52 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v10);
    v60[6] = v52;
    SGSunriseAltitudeToSolarDayPercentage();
    double v51 = _elementWithColorAtAltitude(216.0, 30.0, 92.0, v11);
    v60[7] = v51;
    SGSunriseAltitudeToSolarDayPercentage();
    double v50 = _elementWithColorAtAltitude(212.0, 30.0, 92.0, v12);
    v60[8] = v50;
    SGSunriseAltitudeToSolarDayPercentage();
    double v49 = _elementWithColorAtAltitude(208.0, 30.0, 92.0, v13);
    v60[9] = v49;
    SGSunriseAltitudeToSolarDayPercentage();
    double v48 = _elementWithColorAtAltitude(208.0, 30.0, 92.0, v14);
    v60[10] = v48;
    SGSunriseAltitudeToSolarDayPercentage();
    double v47 = _elementWithColorAtAltitude(209.0, 30.0, 92.0, v15);
    v60[11] = v47;
    SGSunriseAltitudeToSolarDayPercentage();
    double v46 = _elementWithColorAtAltitude(198.0, 30.0, 90.0, v16);
    v60[12] = v46;
    SGSunsetAltitudeToSolarDayPercentage();
    double v45 = _elementWithColorAtAltitude(209.0, 30.0, 92.0, v17);
    v60[13] = v45;
    SGSunsetAltitudeToSolarDayPercentage();
    double v44 = _elementWithColorAtAltitude(210.0, 30.0, 92.0, v18);
    v60[14] = v44;
    SGSunsetAltitudeToSolarDayPercentage();
    double v43 = _elementWithColorAtAltitude(212.0, 30.0, 92.0, v19);
    v60[15] = v43;
    SGSunsetAltitudeToSolarDayPercentage();
    double v42 = _elementWithColorAtAltitude(218.0, 30.0, 92.0, v20);
    v60[16] = v42;
    SGSunsetAltitudeToSolarDayPercentage();
    double v22 = _elementWithColorAtAltitude(222.0, 30.0, 92.0, v21);
    v60[17] = v22;
    SGSunsetAltitudeToSolarDayPercentage();
    double v24 = _elementWithColorAtAltitude(229.0, 30.0, 92.0, v23);
    v60[18] = v24;
    SGSunsetAltitudeToSolarDayPercentage();
    double v26 = _elementWithColorAtAltitude(232.0, 30.0, 92.0, v25);
    v60[19] = v26;
    SGSunsetAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(233.0, 30.0, 92.0, v27);
    v60[20] = v28;
    SGSunsetAltitudeToSolarDayPercentage();
    double v30 = _elementWithColorAtAltitude(230.0, 30.0, 92.0, v29);
    v60[21] = v30;
    SGSunsetAltitudeToSolarDayPercentage();
    double v32 = _elementWithColorAtAltitude(227.0, 30.0, 92.0, v31);
    v60[22] = v32;
    SGSunsetAltitudeToSolarDayPercentage();
    double v34 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v33);
    v60[23] = v34;
    SGSunsetAltitudeToSolarDayPercentage();
    double v36 = _elementWithColorAtAltitude(228.0, 30.0, 92.0, v35);
    v60[24] = v36;
    v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:25];
    v38 = [(SGCubicColorCurve *)v54 initWithColorCurveElements:v37];
    double v39 = self->_outerComplication;
    self->_outerComplication = v38;

    outerComplication = self->_outerComplication;
  }
  double v40 = outerComplication;
  return v40;
}

- (id)dayDiskBloomColorCurve
{
  v30[10] = *MEMORY[0x263EF8340];
  dayDiskBloom = self->_dayDiskBloom;
  if (!dayDiskBloom)
  {
    double v27 = [SGCubicColorCurve alloc];
    SGSunriseAltitudeToSolarDayPercentage();
    double v29 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v4);
    v30[0] = v29;
    SGSunriseAltitudeToSolarDayPercentage();
    double v28 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v5);
    v30[1] = v28;
    SGSunriseAltitudeToSolarDayPercentage();
    double v7 = _elementWithColorAtAltitude(45.0, 45.0, 100.0, v6);
    v30[2] = v7;
    SGSunriseAltitudeToSolarDayPercentage();
    double v9 = _elementWithColorAtAltitude(45.0, 10.0, 100.0, v8);
    v30[3] = v9;
    SGSunsetAltitudeToSolarDayPercentage();
    double v11 = _elementWithColorAtAltitude(45.0, 25.0, 100.0, v10);
    v30[4] = v11;
    SGSunsetAltitudeToSolarDayPercentage();
    double v13 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v12);
    v30[5] = v13;
    SGSunsetAltitudeToSolarDayPercentage();
    double v15 = _elementWithColorAtAltitude(40.0, 60.0, 100.0, v14);
    v30[6] = v15;
    SGSunsetAltitudeToSolarDayPercentage();
    double v17 = _elementWithColorAtAltitude(35.0, 65.0, 100.0, v16);
    v30[7] = v17;
    SGSunsetAltitudeToSolarDayPercentage();
    double v19 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v18);
    v30[8] = v19;
    SGSunsetAltitudeToSolarDayPercentage();
    double v21 = _elementWithColorAtAltitude(45.0, 40.0, 100.0, v20);
    v30[9] = v21;
    double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:10];
    double v23 = [(SGCubicColorCurve *)v27 initWithColorCurveElements:v22];
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