@interface NFLPCDStatisticsCALogger
+ (void)postAnalyticsLPCDStatistic:(id)a3;
@end

@implementation NFLPCDStatisticsCALogger

+ (void)postAnalyticsLPCDStatistic:(id)a3
{
  v27[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[NFCALogger sharedCALogger];
  v5 = [v4 generateDailyUUIDForCA];
  v6 = [v3 objectForKeyedSubscript:@"falseDetectionCount"];

  if (v6)
  {
    v26[0] = @"falseDetectionCount";
    v7 = [v3 objectForKeyedSubscript:@"falseDetectionCount"];
    v27[0] = v7;
    v27[1] = &unk_1F24D2000;
    v26[1] = @"tagType1ReadSuccessCount";
    v26[2] = @"tagType2ReadSuccessCount";
    v27[2] = &unk_1F24D2000;
    v27[3] = &unk_1F24D2000;
    v26[3] = @"tagType3ReadSuccessCount";
    v26[4] = @"tagType4ReadSuccessCount";
    v27[4] = &unk_1F24D2000;
    v27[5] = &unk_1F24D2000;
    v26[5] = @"tagType5ReadSuccessCount";
    v26[6] = @"notNDEFFormatedTagCount";
    v26[7] = @"dailyDeviceUUID";
    v8 = @"noUUID";
    if (v5) {
      v8 = v5;
    }
    v27[6] = &unk_1F24D2000;
    v27[7] = v8;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = v27;
    v11 = v26;
LABEL_9:
    v15 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:8];
    goto LABEL_10;
  }
  v12 = [v3 objectForKeyedSubscript:@"notNDEFFormatedTagCount"];

  if (v12)
  {
    v24[0] = @"falseDetectionCount";
    v24[1] = @"tagType1ReadSuccessCount";
    v25[0] = &unk_1F24D2000;
    v25[1] = &unk_1F24D2000;
    v24[2] = @"tagType2ReadSuccessCount";
    v24[3] = @"tagType3ReadSuccessCount";
    v25[2] = &unk_1F24D2000;
    v25[3] = &unk_1F24D2000;
    v24[4] = @"tagType4ReadSuccessCount";
    v24[5] = @"tagType5ReadSuccessCount";
    v25[4] = &unk_1F24D2000;
    v25[5] = &unk_1F24D2000;
    v24[6] = @"notNDEFFormatedTagCount";
    uint64_t v13 = [v3 objectForKeyedSubscript:@"notNDEFFormatedTagCount"];
    v7 = (void *)v13;
    v24[7] = @"dailyDeviceUUID";
    v14 = @"noUUID";
    if (v5) {
      v14 = v5;
    }
    v25[6] = v13;
    v25[7] = v14;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = v25;
    v11 = v24;
    goto LABEL_9;
  }
  v23[0] = &unk_1F24D2000;
  v7 = [v3 objectForKeyedSubscript:@"falseDetectionCount" @"tagType1ReadSuccessCount"];
  v23[1] = v7;
  v22[2] = @"tagType2ReadSuccessCount";
  v17 = [v3 objectForKeyedSubscript:x0];
  v23[2] = v17;
  v22[3] = @"tagType3ReadSuccessCount";
  v18 = [v3 objectForKeyedSubscript:x0];
  v23[3] = v18;
  v22[4] = @"tagType4ReadSuccessCount";
  v19 = [v3 objectForKeyedSubscript:v18];
  v23[4] = v19;
  v22[5] = @"tagType5ReadSuccessCount";
  v20 = [v3 objectForKeyedSubscript:x0];
  v23[5] = v20;
  v23[6] = &unk_1F24D2000;
  v22[6] = @"notNDEFFormatedTagCount";
  v22[7] = @"dailyDeviceUUID";
  if (v5) {
    v21 = v5;
  }
  else {
    v21 = @"noUUID";
  }
  v23[7] = v21;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];

LABEL_10:
  v16 = (void *)MEMORY[0x1CB7976C0]();
  [v4 postCAEventFor:@"com.apple.nfcd.lpcdStatistic" eventInput:v15];
}

@end