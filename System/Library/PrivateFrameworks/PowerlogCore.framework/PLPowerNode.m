@interface PLPowerNode
- (NSArray)rootNodeEnergyRows;
- (NSString)name;
- (PLPowerNode)initWithName:(id)a3 withFGEnergy:(double)a4 withBGEnergy:(double)a5 withFGTime:(double)a6 withBGTime:(double)a7 withBGAudioTime:(double)a8 withBGLocationTime:(double)a9 withRootNodeEnergyRows:(id)a10;
- (double)bgAudioTime;
- (double)bgEnergy;
- (double)bgLocationTime;
- (double)bgTime;
- (double)fgEnergy;
- (double)fgTime;
- (id)energy;
- (id)serialize;
- (id)time;
- (void)setBgAudioTime:(double)a3;
- (void)setBgEnergy:(double)a3;
- (void)setBgLocationTime:(double)a3;
- (void)setBgTime:(double)a3;
- (void)setFgEnergy:(double)a3;
- (void)setFgTime:(double)a3;
- (void)setName:(id)a3;
- (void)setRootNodeEnergyRows:(id)a3;
@end

@implementation PLPowerNode

- (PLPowerNode)initWithName:(id)a3 withFGEnergy:(double)a4 withBGEnergy:(double)a5 withFGTime:(double)a6 withBGTime:(double)a7 withBGAudioTime:(double)a8 withBGLocationTime:(double)a9 withRootNodeEnergyRows:(id)a10
{
  id v19 = a3;
  id v20 = a10;
  if (v19)
  {
    v23.receiver = self;
    v23.super_class = (Class)PLPowerNode;
    v21 = [(PLPowerNode *)&v23 init];
    self = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_name, a3);
      self->_fgEnergy = a4;
      self->_bgEnergy = a5;
      self->_fgTime = a6;
      self->_bgTime = a7;
      self->_bgAudioTime = a8;
      self->_bgLocationTime = a9;
      objc_storeStrong((id *)&self->_rootNodeEnergyRows, a10);
    }
  }

  return self;
}

- (id)energy
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(PLPowerNode *)self rootNodeEnergyRows];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:@"RootNodeID"];
        int v11 = [v10 intValue];

        if (v11)
        {
          v12 = [&unk_1F1585B08 objectAtIndexedSubscript:v11];
          v13 = [v9 objectForKeyedSubscript:@"FGEnergy"];
          [v13 doubleValue];
          double v15 = v14;

          v16 = [v9 objectForKeyedSubscript:@"BGEnergy"];
          [v16 doubleValue];
          double v18 = v17;

          [(PLPowerNode *)self fgTime];
          if (v19 <= 60.0 || (double v19 = v15 / 1000.0, v15 / 1000.0 <= 0.0))
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1F1580858, v12, v19);
          }
          else
          {
            id v20 = [NSNumber numberWithLong:llround(v19)];
            [v3 setObject:v20 forKeyedSubscript:v12];
          }
          [(PLPowerNode *)self bgTime];
          if (v21 <= 60.0 || (double v21 = v18 / 1000.0, v18 / 1000.0 <= 0.0))
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1F1580858, v12, v21);
          }
          else
          {
            v22 = [NSNumber numberWithLong:llround(v21)];
            [v4 setObject:v22 forKeyedSubscript:v12];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }

  v30[0] = @"fg";
  v30[1] = @"bg";
  v31[0] = v3;
  v31[1] = v4;
  objc_super v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v23;
}

- (id)time
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"fg";
  v3 = NSNumber;
  [(PLPowerNode *)self fgTime];
  uint64_t v5 = [v3 numberWithLong:llround(v4)];
  v20[1] = @"bg";
  v21[0] = v5;
  v18[0] = @"total";
  uint64_t v6 = NSNumber;
  [(PLPowerNode *)self bgTime];
  v8 = [v6 numberWithLong:llround(v7)];
  v19[0] = v8;
  v18[1] = @"audio";
  v9 = NSNumber;
  [(PLPowerNode *)self bgAudioTime];
  int v11 = [v9 numberWithLong:llround(v10)];
  v19[1] = v11;
  v18[2] = @"location";
  v12 = NSNumber;
  [(PLPowerNode *)self bgLocationTime];
  double v14 = [v12 numberWithLong:llround(v13)];
  v19[2] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v21[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v16;
}

- (id)serialize
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v3 = [PLValueComparison alloc];
  double v4 = [(PLPowerNode *)self name];
  uint64_t v5 = [(PLValueComparison *)v3 initWithKey:@"AppBundleId" withValue:v4 withComparisonOperation:0];

  uint64_t v6 = +[PowerlogCore sharedCore];
  double v7 = [v6 storage];
  v49[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
  v9 = [v7 lastEntryForKey:@"PLApplicationAgent_EventNone_AllApps" withComparisons:v8 isSingleton:1];

  if (v9
    && ([v9 objectForKeyedSubscript:@"AppIs3rdParty"],
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 BOOLValue],
        v10,
        v11))
  {
    v47[0] = @"app_bundleid";
    v46 = [(PLPowerNode *)self name];
    v48[0] = v46;
    v47[1] = @"app_build_version";
    uint64_t v12 = [v9 objectForKeyedSubscript:@"AppBuildVersion"];
    if (v12)
    {
      double v13 = [v9 objectForKeyedSubscript:@"AppBuildVersion"];
    }
    else
    {
      double v13 = &stru_1F15208F0;
    }
    v39 = v13;
    v48[1] = v13;
    v47[2] = @"app_version";
    uint64_t v15 = [v9 objectForKeyedSubscript:@"AppBundleVersion"];
    if (v15)
    {
      v16 = [v9 objectForKeyedSubscript:@"AppBundleVersion"];
    }
    else
    {
      v16 = &stru_1F15208F0;
    }
    v38 = v16;
    v48[2] = v16;
    v47[3] = @"app_sessionreporter_key";
    uint64_t v17 = [v9 objectForKeyedSubscript:@"AppVendorID"];
    if (v17)
    {
      double v18 = [v9 objectForKeyedSubscript:@"AppVendorID"];
    }
    else
    {
      double v18 = &stru_1F15208F0;
    }
    v37 = v18;
    v48[3] = v18;
    v47[4] = @"app_adamid";
    uint64_t v19 = [v9 objectForKeyedSubscript:@"AppItemID"];
    if (v19)
    {
      id v20 = [v9 objectForKeyedSubscript:@"AppItemID"];
    }
    else
    {
      id v20 = &stru_1F15208F0;
    }
    v36 = v20;
    v48[4] = v20;
    v47[5] = @"app_cohort";
    v41 = [v9 objectForKeyedSubscript:@"AppCohort"];
    v45 = (void *)v12;
    if (v41)
    {
      double v21 = [v9 objectForKeyedSubscript:@"AppCohort"];
    }
    else
    {
      double v21 = &stru_1F15208F0;
    }
    v35 = v21;
    v48[5] = v21;
    v47[6] = @"app_storefront";
    v22 = [v9 objectForKeyedSubscript:@"AppStoreFront"];
    if (v22)
    {
      objc_super v23 = [v9 objectForKeyedSubscript:@"AppStoreFront"];
    }
    else
    {
      objc_super v23 = &stru_1F15208F0;
    }
    v48[6] = v23;
    v47[7] = @"app_is_beta";
    v40 = objc_msgSend(v9, "objectForKeyedSubscript:", @"AppIsBeta", v23);
    int v24 = [v40 BOOLValue];
    v25 = @"false";
    if (v24) {
      v25 = @"true";
    }
    v48[7] = v25;
    v47[8] = @"app_arch";
    long long v26 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
    v43 = (void *)v17;
    if (v26)
    {
      long long v27 = [v9 objectForKeyedSubscript:@"AppArchitecture"];
    }
    else
    {
      long long v27 = &stru_1F15208F0;
    }
    v42 = (void *)v19;
    v44 = (void *)v15;
    v48[8] = v27;
    v47[9] = @"slice_uuid";
    long long v28 = [v9 objectForKeyedSubscript:@"AppUUID"];
    long long v29 = v5;
    if (v28)
    {
      v30 = [v9 objectForKeyedSubscript:@"AppUUID"];
    }
    else
    {
      v30 = &stru_1F15208F0;
    }
    v48[9] = v30;
    v47[10] = @"app_energy";
    v31 = [(PLPowerNode *)self energy];
    v48[10] = v31;
    v47[11] = @"app_time";
    v32 = [(PLPowerNode *)self time];
    v48[11] = v32;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:12];

    if (v28) {
    uint64_t v5 = v29;
    }
    if (v26) {

    }
    if (v22) {
    if (v41)
    }

    if (v42) {
    if (v43)
    }

    if (v44) {
    if (v45)
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (double)fgEnergy
{
  return self->_fgEnergy;
}

- (void)setFgEnergy:(double)a3
{
  self->_fgEnergy = a3;
}

- (double)bgEnergy
{
  return self->_bgEnergy;
}

- (void)setBgEnergy:(double)a3
{
  self->_bgEnergy = a3;
}

- (double)fgTime
{
  return self->_fgTime;
}

- (void)setFgTime:(double)a3
{
  self->_fgTime = a3;
}

- (double)bgTime
{
  return self->_bgTime;
}

- (void)setBgTime:(double)a3
{
  self->_bgTime = a3;
}

- (double)bgAudioTime
{
  return self->_bgAudioTime;
}

- (void)setBgAudioTime:(double)a3
{
  self->_bgAudioTime = a3;
}

- (double)bgLocationTime
{
  return self->_bgLocationTime;
}

- (void)setBgLocationTime:(double)a3
{
  self->_bgLocationTime = a3;
}

- (NSArray)rootNodeEnergyRows
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootNodeEnergyRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeEnergyRows, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end