@interface PLBatteryUIResponseTypeBatteryBreakdownBLD
+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4;
- (void)populateBLDKeysWithEnergyEntries:(id)a3;
@end

@implementation PLBatteryUIResponseTypeBatteryBreakdownBLD

- (void)populateBLDKeysWithEnergyEntries:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v63 = [MEMORY[0x1E4F1CA48] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v60 = v3;
  id obj = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v64 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
  if (v64)
  {
    uint64_t v62 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v74 != v62) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        v6 = [&unk_1F4013E10 objectAtIndexedSubscript:15];
        uint64_t v7 = [v5 objectForKeyedSubscript:v6];

        v72 = (void *)v7;
        if (v7) {
          v8 = (void *)v7;
        }
        else {
          v8 = &unk_1F400D7C8;
        }
        [v5 setObject:v8 forKeyedSubscript:@"BLDEnergyAudio"];
        v9 = [&unk_1F4013E28 objectAtIndexedSubscript:50];
        uint64_t v10 = [v5 objectForKeyedSubscript:v9];

        v71 = (void *)v10;
        if (v10) {
          v11 = (void *)v10;
        }
        else {
          v11 = &unk_1F400D7C8;
        }
        [v5 setObject:v11 forKeyedSubscript:@"BLDEnergyBluetooth"];
        v12 = [&unk_1F4013E40 objectAtIndexedSubscript:37];
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];

        v70 = (void *)v13;
        if (v13) {
          v14 = (void *)v13;
        }
        else {
          v14 = &unk_1F400D7C8;
        }
        [v5 setObject:v14 forKeyedSubscript:@"BLDEnergyCellData"];
        v15 = [&unk_1F4013E58 objectAtIndexedSubscript:10];
        uint64_t v16 = [v5 objectForKeyedSubscript:v15];

        v69 = (void *)v16;
        if (v16) {
          v17 = (void *)v16;
        }
        else {
          v17 = &unk_1F400D7C8;
        }
        [v5 setObject:v17 forKeyedSubscript:@"BLDEnergyDisplay"];
        v18 = [&unk_1F4013E70 objectAtIndexedSubscript:38];
        uint64_t v19 = [v5 objectForKeyedSubscript:v18];

        v68 = (void *)v19;
        if (v19) {
          v20 = (void *)v19;
        }
        else {
          v20 = &unk_1F400D7C8;
        }
        [v5 setObject:v20 forKeyedSubscript:@"BLDEnergyVoice"];
        v21 = [&unk_1F4013E88 objectAtIndexedSubscript:11];
        uint64_t v22 = [v5 objectForKeyedSubscript:v21];

        v67 = (void *)v22;
        if (v22) {
          v23 = (void *)v22;
        }
        else {
          v23 = &unk_1F400D7C8;
        }
        [v5 setObject:v23 forKeyedSubscript:@"BLDEnergyWiFi"];
        v24 = [&unk_1F4013EA0 objectAtIndexedSubscript:1];
        uint64_t v25 = [v5 objectForKeyedSubscript:v24];

        v66 = (void *)v25;
        if (v25) {
          v26 = (void *)v25;
        }
        else {
          v26 = &unk_1F400D7C8;
        }
        [v5 setObject:v26 forKeyedSubscript:@"BBCondition"];
        v27 = objc_opt_class();
        v28 = [&unk_1F4013EB8 objectAtIndexedSubscript:2];
        v29 = [&unk_1F4013ED0 objectAtIndexedSubscript:2];
        v65 = [v27 rootNodeQualificationNameWithQualificationName:v28 withRootNodeName:v29];

        uint64_t v30 = [v5 objectForKeyedSubscript:v65];
        v31 = (void *)v30;
        if (v30) {
          v32 = (void *)v30;
        }
        else {
          v32 = &unk_1F400D7C8;
        }
        [v5 setObject:v32 forKeyedSubscript:@"BLDEnergyFGCPU"];
        v33 = [&unk_1F4013EE8 objectAtIndexedSubscript:2];
        v34 = [v5 objectForKeyedSubscript:v33];

        if (v34) {
          v35 = v34;
        }
        else {
          v35 = &unk_1F400D7C8;
        }
        id v36 = v35;

        v37 = (void *)MEMORY[0x1E4F28ED0];
        [v36 doubleValue];
        double v39 = v38;
        [v31 doubleValue];
        double v41 = v39 - v40;
        if (v41 < 0.0) {
          double v41 = 0.0;
        }
        v42 = [v37 numberWithDouble:v41];
        [v5 setObject:v42 forKeyedSubscript:@"BLDEnergyBGCPU"];
        v43 = objc_opt_class();
        v44 = [&unk_1F4013F00 objectAtIndexedSubscript:2];
        v45 = [&unk_1F4013F18 objectAtIndexedSubscript:48];
        v46 = [v43 rootNodeQualificationNameWithQualificationName:v44 withRootNodeName:v45];

        uint64_t v47 = [v5 objectForKeyedSubscript:v46];
        v48 = (void *)v47;
        if (v47) {
          v49 = (void *)v47;
        }
        else {
          v49 = &unk_1F400D7C8;
        }
        [v5 setObject:v49 forKeyedSubscript:@"BLDEnergyFGLocation"];
        v50 = [&unk_1F4013F30 objectAtIndexedSubscript:48];
        v51 = [v5 objectForKeyedSubscript:v50];

        if (v51) {
          v52 = v51;
        }
        else {
          v52 = &unk_1F400D7C8;
        }
        id v53 = v52;

        v54 = (void *)MEMORY[0x1E4F28ED0];
        [v53 doubleValue];
        double v56 = v55;

        [v48 doubleValue];
        double v58 = v56 - v57;
        if (v58 < 0.0) {
          double v58 = 0.0;
        }
        v59 = [v54 numberWithDouble:v58];
        [v5 setObject:v59 forKeyedSubscript:@"BLDEnergyBGLocation"];
        [v63 addObject:v5];
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
    }
    while (v64);
  }

  [v60 setObject:v63 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

+ (id)rootNodeQualificationNameWithQualificationName:(id)a3 withRootNodeName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@", a3, a4];
}

@end