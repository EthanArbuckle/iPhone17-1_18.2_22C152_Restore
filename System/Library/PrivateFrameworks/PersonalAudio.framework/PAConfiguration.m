@interface PAConfiguration
+ (BOOL)supportsSecureCoding;
+ (PAConfiguration)configurationWithAudiogram:(id)a3;
+ (PAConfiguration)configurationWithLeftMediaLoss:(id)a3 rightMediaLoss:(id)a4 leftSpeechLoss:(id)a5 andRightSpeechLoss:(id)a6;
+ (PAConfiguration)configurationWithLevel:(unint64_t)a3 andShape:(unint64_t)a4;
+ (PAConfiguration)configurationWithMediaOffsets:(id)a3 andSpeechOffsets:(id)a4;
+ (PAConfiguration)configurationWithPreset:(id)a3 andAdjustments:(id)a4;
+ (PAConfiguration)configurationWithRawAdjustment:(unint64_t)a3;
+ (id)configurationFromAudiogramSample:(id)a3;
+ (id)configurationFromType:(unint64_t)a3;
+ (id)dataFromPreset:(id *)a3;
+ (id)paramDataWithValue:(float)a3 andOffset:(int)a4;
- ($582E6112602F317AA177BE214B91E8F0)readSettingsFromPreset:(id)a3;
- ($582E6112602F317AA177BE214B91E8F0)settingsFromConfiguration:(BOOL)a3;
- ($D1907C19D6DE236B0F95485CBF7F2EE1)transparencySettingsForAddress:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)audiogramSettings;
- (NSDictionary)preset;
- (NSDictionary)presetAdjustments;
- (PAConfiguration)initWithCoder:(id)a3;
- (float)mediaPureToneAverage;
- (float)pureToneAverageForSpeech:(BOOL)a3;
- (float)speechPureToneAverage;
- (id)description;
- (id)lossArrayFromDictionary:(id)a3 forLeft:(BOOL)a4;
- (id)onBudsMediaSettingsForRoute:(id)a3;
- (id)presetDictionaryForSpeech:(BOOL)a3;
- (unint64_t)level;
- (unint64_t)shape;
- (void)encodeWithCoder:(id)a3;
- (void)setAudiogramSettings:(id)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setPreset:(id)a3;
- (void)setPresetAdjustments:(id)a3;
- (void)setShape:(unint64_t)a3;
@end

@implementation PAConfiguration

+ (PAConfiguration)configurationWithPreset:(id)a3 andAdjustments:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setPreset:v6];

  [v7 setPresetAdjustments:v5];
  return (PAConfiguration *)v7;
}

+ (id)configurationFromType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
      id v5 = +[PAConfiguration configurationWithRawAdjustment:v3];
      goto LABEL_19;
    case 3uLL:
      uint64_t v7 = 1;
      goto LABEL_13;
    case 4uLL:
      uint64_t v7 = 1;
      goto LABEL_15;
    case 5uLL:
      uint64_t v7 = 1;
      goto LABEL_17;
    case 6uLL:
      uint64_t v7 = 2;
      goto LABEL_13;
    case 7uLL:
      uint64_t v7 = 2;
      goto LABEL_15;
    case 8uLL:
      uint64_t v7 = 2;
      goto LABEL_17;
    case 9uLL:
      uint64_t v7 = 3;
LABEL_13:
      uint64_t v8 = 1;
      goto LABEL_18;
    case 0xAuLL:
      uint64_t v7 = 3;
LABEL_15:
      uint64_t v8 = 2;
      goto LABEL_18;
    case 0xBuLL:
      uint64_t v7 = 3;
LABEL_17:
      uint64_t v8 = 3;
LABEL_18:
      id v5 = +[PAConfiguration configurationWithLevel:andShape:](PAConfiguration, "configurationWithLevel:andShape:", v7, v8, v3);
LABEL_19:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

+ (PAConfiguration)configurationWithLevel:(unint64_t)a3 andShape:(unint64_t)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = paBundle();
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Presets_Level_%lu_Shape_%lu", a3, a4);
  uint64_t v8 = [v6 pathForResource:v7 ofType:@"aupreset"];

  v9 = paBundle();
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"Presets_SpeechMode_Level_%lu_Shape_%lu", a3, a4);
  v11 = [v9 pathForResource:v10 ofType:@"aupreset"];

  v12 = [NSDictionary dictionaryWithContentsOfFile:v8];
  v13 = [NSDictionary dictionaryWithContentsOfFile:v11];
  if ([v13 count])
  {
    v17 = @"PAPresetAdjustmentSpeechModeKey";
    v18[0] = v13;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    v14 = 0;
  }
  if ([v12 count])
  {
    v15 = +[PAConfiguration configurationWithPreset:v12 andAdjustments:v14];
    [v15 setLevel:a3];
    [v15 setShape:a4];
  }
  else
  {
    v15 = 0;
  }

  return (PAConfiguration *)v15;
}

+ (PAConfiguration)configurationWithRawAdjustment:(unint64_t)a3
{
  uint64_t v4 = paBundle();
  id v5 = [v4 pathForResource:@"Presets_0_dB_gain" ofType:@"aupreset"];

  id v6 = [NSDictionary dictionaryWithContentsOfFile:v5];
  uint64_t v7 = +[PAConfiguration configurationWithPreset:v6 andAdjustments:0];
  [v7 setLevel:0];
  [v7 setShape:a3];

  return (PAConfiguration *)v7;
}

+ (PAConfiguration)configurationWithAudiogram:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count] == 8)
  {
    uint64_t v4 = +[PAConfiguration configurationWithMediaOffsets:v3 andSpeechOffsets:v3];
  }
  else
  {
    PAInitializeLogging();
    id v5 = [NSString stringWithFormat:@"Skipping audiogram %@", v3];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "+[PAConfiguration configurationWithAudiogram:]", 181, v5];
    uint64_t v7 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = [v8 UTF8String];
      _os_log_impl(&dword_20CD3E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v4 = 0;
  }

  return (PAConfiguration *)v4;
}

+ (PAConfiguration)configurationWithMediaOffsets:(id)a3 andSpeechOffsets:(id)a4
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v123 = a4;
  if ([v6 count] == 8 && objc_msgSend(v123, "count") == 8)
  {
    id v120 = a1;
    v116 = +[PAConfiguration configurationWithLevel:1 andShape:1];
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    id v8 = paBundle();
    v9 = [v8 pathForResource:@"PresetValues" ofType:@"plist"];

    v10 = [NSDictionary dictionaryWithContentsOfFile:v9];
    [v10 objectForKey:@"level"];
    v11 = id v122 = v6;
    uint64_t v12 = [&unk_26C1E9F20 stringValue];
    uint64_t v13 = [v11 objectForKey:v12];

    v14 = (void *)MEMORY[0x263EFF9A0];
    v15 = [v13 objectForKey:@"shape"];
    v16 = [&unk_26C1E9F20 stringValue];
    v17 = [v15 objectForKey:v16];
    v18 = v14;
    v19 = (void *)v7;
    v121 = [v18 dictionaryWithDictionary:v17];

    v20 = paBundle();
    uint64_t v21 = [v20 pathForResource:@"PresetValuesSpeech" ofType:@"plist"];

    v119 = (void *)v21;
    v22 = [NSDictionary dictionaryWithContentsOfFile:v21];

    v118 = v22;
    v23 = [v22 objectForKey:@"level"];
    v24 = [&unk_26C1E9F20 stringValue];
    v25 = [v23 objectForKey:v24];

    v26 = (void *)MEMORY[0x263EFF9A0];
    v117 = v25;
    v27 = [v25 objectForKey:@"shape"];
    v28 = [&unk_26C1E9F20 stringValue];
    v29 = [v27 objectForKey:v28];
    v30 = [v26 dictionaryWithDictionary:v29];

    v31 = v116;
    v32 = (_DWORD *)[v116 settingsFromConfiguration:0];
    v33 = (_DWORD *)[v116 settingsFromConfiguration:1];
    v34 = +[PAAudiogramUtilities offsetsSortedByFrequency:v122];
    v35 = +[PAAudiogramUtilities offsetsSortedByFrequency:v123];
    if (v32)
    {
      v36 = [v34 objectAtIndexedSubscript:0];
      [v36 floatValue];
      v32[32] = v37;
      _DWORD *v32 = v37;

      v38 = [v34 objectAtIndexedSubscript:1];
      [v38 floatValue];
      v32[33] = v39;
      v32[1] = v39;

      v40 = [v34 objectAtIndexedSubscript:2];
      [v40 floatValue];
      v32[34] = v41;
      v32[2] = v41;

      v42 = [v34 objectAtIndexedSubscript:3];
      [v42 floatValue];
      v32[35] = v43;
      v32[3] = v43;

      v44 = [v34 objectAtIndexedSubscript:4];
      [v44 floatValue];
      v32[36] = v45;
      v32[4] = v45;

      v46 = [v34 objectAtIndexedSubscript:5];
      [v46 floatValue];
      v32[37] = v47;
      v32[5] = v47;

      v48 = [v34 objectAtIndexedSubscript:6];
      [v48 floatValue];
      v32[38] = v49;
      v32[6] = v49;

      v50 = [v34 objectAtIndexedSubscript:7];
      [v50 floatValue];
      v32[39] = v51;
      v32[7] = v51;

      v32[31] = 0;
      v52 = [v34 objectAtIndexedSubscript:0];
      [v121 setObject:v52 forKey:@"leftLoss250_dBHL"];

      v53 = [v34 objectAtIndexedSubscript:1];
      [v121 setObject:v53 forKey:@"leftLoss500_dBHL"];

      v54 = [v34 objectAtIndexedSubscript:2];
      [v121 setObject:v54 forKey:@"leftLoss1000_dBHL"];

      v55 = [v34 objectAtIndexedSubscript:3];
      [v121 setObject:v55 forKey:@"leftLoss2000_dBHL"];

      v56 = [v34 objectAtIndexedSubscript:4];
      [v121 setObject:v56 forKey:@"leftLoss3000_dBHL"];

      v57 = [v34 objectAtIndexedSubscript:5];
      [v121 setObject:v57 forKey:@"leftLoss4000_dBHL"];

      v58 = [v34 objectAtIndexedSubscript:6];
      [v121 setObject:v58 forKey:@"leftLoss6000_dBHL"];

      v59 = [v34 objectAtIndexedSubscript:7];
      [v121 setObject:v59 forKey:@"leftLoss10000_dBHL"];

      v60 = [v34 objectAtIndexedSubscript:0];
      [v121 setObject:v60 forKey:@"rightLoss250_dBHL"];

      v61 = [v34 objectAtIndexedSubscript:1];
      [v121 setObject:v61 forKey:@"rightLoss500_dBHL"];

      v62 = [v34 objectAtIndexedSubscript:2];
      [v121 setObject:v62 forKey:@"rightLoss1000_dBHL"];

      v63 = [v34 objectAtIndexedSubscript:3];
      [v121 setObject:v63 forKey:@"rightLoss2000_dBHL"];

      v64 = [v34 objectAtIndexedSubscript:4];
      [v121 setObject:v64 forKey:@"rightLoss3000_dBHL"];

      v65 = [v34 objectAtIndexedSubscript:5];
      [v121 setObject:v65 forKey:@"rightLoss4000_dBHL"];

      v66 = [v34 objectAtIndexedSubscript:6];
      [v121 setObject:v66 forKey:@"rightLoss6000_dBHL"];

      v67 = [v34 objectAtIndexedSubscript:7];
      [v121 setObject:v67 forKey:@"rightLoss10000_dBHL"];

      [v19 setObject:v121 forKey:@"PAConfigPresetMediaKey"];
      v68 = (void *)MEMORY[0x263EFF9A0];
      v69 = [v116 preset];
      v70 = [v68 dictionaryWithDictionary:v69];

      v71 = [v120 dataFromPreset:v32];
      [v70 setValue:v71 forKey:@"data"];

      [v116 setPreset:v70];
      free(v32);
    }
    if (v33)
    {
      v72 = [v35 objectAtIndexedSubscript:0];
      [v72 floatValue];
      v33[32] = v73;
      _DWORD *v33 = v73;

      v74 = [v35 objectAtIndexedSubscript:1];
      [v74 floatValue];
      v33[33] = v75;
      v33[1] = v75;

      v76 = [v35 objectAtIndexedSubscript:2];
      [v76 floatValue];
      v33[34] = v77;
      v33[2] = v77;

      v78 = [v35 objectAtIndexedSubscript:3];
      [v78 floatValue];
      v33[35] = v79;
      v33[3] = v79;

      v80 = [v35 objectAtIndexedSubscript:4];
      [v80 floatValue];
      v33[36] = v81;
      v33[4] = v81;

      v82 = [v35 objectAtIndexedSubscript:5];
      [v82 floatValue];
      v33[37] = v83;
      v33[5] = v83;

      v84 = [v35 objectAtIndexedSubscript:6];
      [v84 floatValue];
      v33[38] = v85;
      v33[6] = v85;

      v86 = [v35 objectAtIndexedSubscript:7];
      [v86 floatValue];
      v33[39] = v87;
      v33[7] = v87;

      v33[31] = 0;
      v88 = [v35 objectAtIndexedSubscript:0];
      [v30 setObject:v88 forKey:@"leftLoss250_dBHL"];

      v89 = [v35 objectAtIndexedSubscript:1];
      [v30 setObject:v89 forKey:@"leftLoss500_dBHL"];

      v90 = [v35 objectAtIndexedSubscript:2];
      [v30 setObject:v90 forKey:@"leftLoss1000_dBHL"];

      v91 = [v35 objectAtIndexedSubscript:3];
      [v30 setObject:v91 forKey:@"leftLoss2000_dBHL"];

      v92 = [v35 objectAtIndexedSubscript:4];
      [v30 setObject:v92 forKey:@"leftLoss3000_dBHL"];

      v93 = [v35 objectAtIndexedSubscript:5];
      [v30 setObject:v93 forKey:@"leftLoss4000_dBHL"];

      v94 = [v35 objectAtIndexedSubscript:6];
      [v30 setObject:v94 forKey:@"leftLoss6000_dBHL"];

      v95 = [v35 objectAtIndexedSubscript:7];
      [v30 setObject:v95 forKey:@"leftLoss10000_dBHL"];

      v96 = [v35 objectAtIndexedSubscript:0];
      [v30 setObject:v96 forKey:@"rightLoss250_dBHL"];

      v97 = [v35 objectAtIndexedSubscript:1];
      [v30 setObject:v97 forKey:@"rightLoss500_dBHL"];

      v98 = [v35 objectAtIndexedSubscript:2];
      [v30 setObject:v98 forKey:@"rightLoss1000_dBHL"];

      v99 = [v35 objectAtIndexedSubscript:3];
      [v30 setObject:v99 forKey:@"rightLoss2000_dBHL"];

      v100 = [v35 objectAtIndexedSubscript:4];
      [v30 setObject:v100 forKey:@"rightLoss3000_dBHL"];

      v101 = [v35 objectAtIndexedSubscript:5];
      [v30 setObject:v101 forKey:@"rightLoss4000_dBHL"];

      v102 = [v35 objectAtIndexedSubscript:6];
      [v30 setObject:v102 forKey:@"rightLoss6000_dBHL"];

      v103 = [v35 objectAtIndexedSubscript:7];
      [v30 setObject:v103 forKey:@"rightLoss10000_dBHL"];

      [v19 setObject:v30 forKey:@"PAConfigPresetSpeechKey"];
      v104 = (void *)MEMORY[0x263EFF9A0];
      v105 = [v116 presetAdjustments];
      v106 = [v105 valueForKey:@"PAPresetAdjustmentSpeechModeKey"];
      v107 = [v104 dictionaryWithDictionary:v106];

      v108 = [v120 dataFromPreset:v33];
      [v107 setValue:v108 forKey:@"data"];

      v109 = [NSDictionary dictionaryWithObject:v107 forKey:@"PAPresetAdjustmentSpeechModeKey"];
      [v116 setPresetAdjustments:v109];

      free(v33);
    }
    [v116 setAudiogramSettings:v19];
    [v116 setShape:12];
    [v116 setLevel:12];

    id v6 = v122;
  }
  else
  {
    PAInitializeLogging();
    v110 = [NSString stringWithFormat:@"Skipping offsets %@ - %@", v6, v123];
    v111 = [NSString stringWithFormat:@"%s:%d %@", "+[PAConfiguration configurationWithMediaOffsets:andSpeechOffsets:]", 192, v110];
    v112 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v113 = v111;
      v114 = v112;
      *(_DWORD *)buf = 136446210;
      uint64_t v125 = [v113 UTF8String];
      _os_log_impl(&dword_20CD3E000, v114, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v31 = 0;
  }

  return (PAConfiguration *)v31;
}

+ (PAConfiguration)configurationWithLeftMediaLoss:(id)a3 rightMediaLoss:(id)a4 leftSpeechLoss:(id)a5 andRightSpeechLoss:(id)a6
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v187 = v13;
  if ((unint64_t)[v10 count] < 8
    || (unint64_t)[v11 count] < 8
    || (unint64_t)[v12 count] < 8
    || (unint64_t)[v13 count] < 8)
  {
    PAInitializeLogging();
    v14 = [NSString stringWithFormat:@"Missing coefficients [%lu, %lu, %lu, %lu]", objc_msgSend(v10, "count"), objc_msgSend(v11, "count"), objc_msgSend(v12, "count"), objc_msgSend(v13, "count")];
    id v15 = [NSString stringWithFormat:@"%s:%d %@", "+[PAConfiguration configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:]", 302, v14];
    v16 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v15;
      v17 = v16;
      *(_DWORD *)buf = 136446210;
      uint64_t v194 = [v15 UTF8String];
      _os_log_impl(&dword_20CD3E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v18 = 0;
    goto LABEL_8;
  }
  id v182 = a1;
  v183 = v12;
  v184 = v11;
  uint64_t v188 = 0;
  uint64_t v20 = 1;
  uint64_t v21 = &off_264103000;
  id v186 = v10;
  do
  {
    for (uint64_t i = 1; i != 4; ++i)
    {
      v23 = [v21[7] configurationWithLevel:v20 andShape:i];
      v24 = (float *)[v23 settingsFromConfiguration:0];

      if (!v24) {
        continue;
      }
      v25 = [v10 objectAtIndexedSubscript:0];
      [v25 floatValue];
      if (v26 != *v24) {
        goto LABEL_29;
      }
      v27 = [v10 objectAtIndexedSubscript:1];
      [v27 floatValue];
      if (v28 != v24[1]) {
        goto LABEL_28;
      }
      v29 = [v10 objectAtIndexedSubscript:2];
      [v29 floatValue];
      if (v30 != v24[2]) {
        goto LABEL_27;
      }
      v31 = [v10 objectAtIndexedSubscript:3];
      [v31 floatValue];
      if (v32 != v24[3])
      {

LABEL_27:
LABEL_28:

        goto LABEL_29;
      }
      v33 = [v10 objectAtIndexedSubscript:4];
      [v33 floatValue];
      if (v34 != v24[4])
      {

        goto LABEL_36;
      }
      [v10 objectAtIndexedSubscript:5];
      v36 = v35 = v10;
      [v36 floatValue];
      if (v37 != v24[5]) {
        goto LABEL_35;
      }
      v191 = [v35 objectAtIndexedSubscript:6];
      [v191 floatValue];
      if (v38 != v24[6])
      {

LABEL_35:
        id v10 = v35;
LABEL_36:
        uint64_t v21 = &off_264103000;
        goto LABEL_29;
      }
      int v39 = [v35 objectAtIndexedSubscript:7];
      [v39 floatValue];
      float v41 = v40;
      float v42 = v24[7];

      if (v41 != v42)
      {
        id v10 = v186;
        uint64_t v21 = &off_264103000;
        goto LABEL_30;
      }
      PAInitializeLogging();
      int v43 = [NSString stringWithFormat:@"Loss matches preset [%d, %d]", v20, i];
      v44 = [NSString stringWithFormat:@"%s:%d %@", "+[PAConfiguration configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:]", 324, v43];
      int v45 = (void *)*MEMORY[0x263F472C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
      {
        id v46 = v44;
        int v47 = v45;
        uint64_t v48 = [v46 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v194 = v48;
        _os_log_impl(&dword_20CD3E000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v21 = &off_264103000;
      +[PAConfiguration configurationWithLevel:v20 andShape:i];
      uint64_t v188 = v25 = (void *)v188;
      id v10 = v186;
LABEL_29:

LABEL_30:
      free(v24);
    }
    ++v20;
  }
  while (v20 != 4);
  id v12 = v183;
  id v11 = v184;
  v18 = (void *)v188;
  if (!v188)
  {
    v189 = [v21[7] configurationWithLevel:1 andShape:2];
    v14 = [MEMORY[0x263EFF9A0] dictionary];
    int v49 = paBundle();
    v50 = [v49 pathForResource:@"PresetValues" ofType:@"plist"];

    int v51 = [NSDictionary dictionaryWithContentsOfFile:v50];
    v52 = [v51 objectForKey:@"level"];
    v53 = [&unk_26C1E9F20 stringValue];
    v54 = [v52 objectForKey:v53];

    v55 = (void *)MEMORY[0x263EFF9A0];
    [v54 objectForKey:@"shape"];
    v57 = id v56 = v10;
    v58 = [&unk_26C1E9F20 stringValue];
    v59 = [v57 objectForKey:v58];
    v181 = [v55 dictionaryWithDictionary:v59];

    id v11 = v184;
    id v10 = v56;
    v60 = paBundle();
    id v15 = [v60 pathForResource:@"PresetValuesSpeech" ofType:@"plist"];

    v61 = [NSDictionary dictionaryWithContentsOfFile:v15];

    v192 = v61;
    v62 = [v61 objectForKey:@"level"];
    v63 = [&unk_26C1E9F20 stringValue];
    v64 = [v62 objectForKey:v63];

    v65 = (void *)MEMORY[0x263EFF9A0];
    v190 = v64;
    v66 = [v64 objectForKey:@"shape"];
    v67 = [&unk_26C1E9F20 stringValue];
    v68 = [v66 objectForKey:v67];
    v185 = [v65 dictionaryWithDictionary:v68];

    v69 = v181;
    v70 = (_DWORD *)[v189 settingsFromConfiguration:0];
    v71 = (_DWORD *)[v189 settingsFromConfiguration:1];
    if (v70)
    {
      v72 = [v10 objectAtIndexedSubscript:0];
      [v72 floatValue];
      _DWORD *v70 = v73;

      v74 = [v10 objectAtIndexedSubscript:1];
      [v74 floatValue];
      v70[1] = v75;

      v76 = [v10 objectAtIndexedSubscript:2];
      [v76 floatValue];
      v70[2] = v77;

      v78 = [v10 objectAtIndexedSubscript:3];
      [v78 floatValue];
      v70[3] = v79;

      v80 = [v10 objectAtIndexedSubscript:4];
      [v80 floatValue];
      v70[4] = v81;

      v82 = [v10 objectAtIndexedSubscript:5];
      [v82 floatValue];
      v70[5] = v83;

      v84 = [v10 objectAtIndexedSubscript:6];
      [v84 floatValue];
      v70[6] = v85;

      v86 = [v10 objectAtIndexedSubscript:7];
      [v86 floatValue];
      v70[7] = v87;

      v88 = [v184 objectAtIndexedSubscript:0];
      [v88 floatValue];
      v70[32] = v89;

      v90 = [v184 objectAtIndexedSubscript:1];
      [v90 floatValue];
      v70[33] = v91;

      v92 = [v184 objectAtIndexedSubscript:2];
      [v92 floatValue];
      v70[34] = v93;

      v94 = [v184 objectAtIndexedSubscript:3];
      [v94 floatValue];
      v70[35] = v95;

      v96 = [v184 objectAtIndexedSubscript:4];
      [v96 floatValue];
      v70[36] = v97;

      v98 = [v184 objectAtIndexedSubscript:5];
      [v98 floatValue];
      v70[37] = v99;

      v100 = [v184 objectAtIndexedSubscript:6];
      [v100 floatValue];
      v70[38] = v101;

      v102 = [v184 objectAtIndexedSubscript:7];
      [v102 floatValue];
      v70[39] = v103;

      v104 = [v10 objectAtIndexedSubscript:0];
      [v181 setObject:v104 forKey:@"leftLoss250_dBHL"];

      v105 = [v10 objectAtIndexedSubscript:1];
      [v181 setObject:v105 forKey:@"leftLoss500_dBHL"];

      v106 = [v10 objectAtIndexedSubscript:2];
      [v181 setObject:v106 forKey:@"leftLoss1000_dBHL"];

      v107 = [v10 objectAtIndexedSubscript:3];
      [v181 setObject:v107 forKey:@"leftLoss2000_dBHL"];

      v108 = [v10 objectAtIndexedSubscript:4];
      [v181 setObject:v108 forKey:@"leftLoss3000_dBHL"];

      v109 = [v10 objectAtIndexedSubscript:5];
      [v181 setObject:v109 forKey:@"leftLoss4000_dBHL"];

      v110 = [v10 objectAtIndexedSubscript:6];
      [v181 setObject:v110 forKey:@"leftLoss6000_dBHL"];

      v111 = [v10 objectAtIndexedSubscript:7];
      [v181 setObject:v111 forKey:@"leftLoss10000_dBHL"];

      v112 = [v184 objectAtIndexedSubscript:0];
      [v181 setObject:v112 forKey:@"rightLoss250_dBHL"];

      id v113 = [v184 objectAtIndexedSubscript:1];
      [v181 setObject:v113 forKey:@"rightLoss500_dBHL"];

      v114 = [v184 objectAtIndexedSubscript:2];
      [v181 setObject:v114 forKey:@"rightLoss1000_dBHL"];

      v115 = [v184 objectAtIndexedSubscript:3];
      [v181 setObject:v115 forKey:@"rightLoss2000_dBHL"];

      v116 = [v184 objectAtIndexedSubscript:4];
      [v181 setObject:v116 forKey:@"rightLoss3000_dBHL"];

      v117 = [v184 objectAtIndexedSubscript:5];
      [v181 setObject:v117 forKey:@"rightLoss4000_dBHL"];

      v118 = [v184 objectAtIndexedSubscript:6];
      [v181 setObject:v118 forKey:@"rightLoss6000_dBHL"];

      v119 = [v184 objectAtIndexedSubscript:7];
      [v181 setObject:v119 forKey:@"rightLoss10000_dBHL"];

      [v14 setObject:v181 forKey:@"PAConfigPresetMediaKey"];
      [v14 setObject:v10 forKey:@"PAConfigLeftMediaKey"];
      [v14 setObject:v184 forKey:@"PAConfigRightMediaKey"];
      id v120 = (void *)MEMORY[0x263EFF9A0];
      [v189 preset];
      id v122 = v121 = v71;
      id v123 = [v120 dictionaryWithDictionary:v122];

      v124 = [v182 dataFromPreset:v70];
      [v123 setValue:v124 forKey:@"data"];

      v71 = v121;
      [v189 setPreset:v123];
      free(v70);
    }
    id v12 = v183;
    uint64_t v125 = v185;
    if (v71)
    {
      uint64_t v126 = [v183 objectAtIndexedSubscript:0];
      [v126 floatValue];
      _DWORD *v71 = v127;

      v128 = [v183 objectAtIndexedSubscript:1];
      [v128 floatValue];
      v71[1] = v129;

      v130 = [v183 objectAtIndexedSubscript:2];
      [v130 floatValue];
      v71[2] = v131;

      v132 = [v183 objectAtIndexedSubscript:3];
      [v132 floatValue];
      v71[3] = v133;

      v134 = [v183 objectAtIndexedSubscript:4];
      [v134 floatValue];
      v71[4] = v135;

      v136 = [v183 objectAtIndexedSubscript:5];
      [v136 floatValue];
      v71[5] = v137;

      v138 = [v183 objectAtIndexedSubscript:6];
      [v138 floatValue];
      v71[6] = v139;

      v140 = [v183 objectAtIndexedSubscript:7];
      [v140 floatValue];
      v71[7] = v141;

      v142 = [v187 objectAtIndexedSubscript:0];
      [v142 floatValue];
      v71[32] = v143;

      v144 = [v187 objectAtIndexedSubscript:1];
      [v144 floatValue];
      v71[33] = v145;

      v146 = [v187 objectAtIndexedSubscript:2];
      [v146 floatValue];
      v71[34] = v147;

      v148 = [v187 objectAtIndexedSubscript:3];
      [v148 floatValue];
      v71[35] = v149;

      v150 = [v187 objectAtIndexedSubscript:4];
      [v150 floatValue];
      v71[36] = v151;

      v152 = [v187 objectAtIndexedSubscript:5];
      [v152 floatValue];
      v71[37] = v153;

      v154 = [v187 objectAtIndexedSubscript:6];
      [v154 floatValue];
      v71[38] = v155;
      v180 = v71;

      v156 = [v187 objectAtIndexedSubscript:7];
      [v156 floatValue];
      v71[39] = v157;

      v158 = [v183 objectAtIndexedSubscript:0];
      [v185 setObject:v158 forKey:@"leftLoss250_dBHL"];

      v159 = [v183 objectAtIndexedSubscript:1];
      [v185 setObject:v159 forKey:@"leftLoss500_dBHL"];

      v160 = [v183 objectAtIndexedSubscript:2];
      [v185 setObject:v160 forKey:@"leftLoss1000_dBHL"];

      v161 = [v183 objectAtIndexedSubscript:3];
      [v185 setObject:v161 forKey:@"leftLoss2000_dBHL"];

      v162 = [v183 objectAtIndexedSubscript:4];
      [v185 setObject:v162 forKey:@"leftLoss3000_dBHL"];

      v163 = [v183 objectAtIndexedSubscript:5];
      [v185 setObject:v163 forKey:@"leftLoss4000_dBHL"];

      v164 = [v183 objectAtIndexedSubscript:6];
      [v185 setObject:v164 forKey:@"leftLoss6000_dBHL"];

      v165 = [v183 objectAtIndexedSubscript:7];
      [v185 setObject:v165 forKey:@"leftLoss10000_dBHL"];

      v166 = [v187 objectAtIndexedSubscript:0];
      [v185 setObject:v166 forKey:@"rightLoss250_dBHL"];

      v167 = [v187 objectAtIndexedSubscript:1];
      [v185 setObject:v167 forKey:@"rightLoss500_dBHL"];

      v168 = [v187 objectAtIndexedSubscript:2];
      [v185 setObject:v168 forKey:@"rightLoss1000_dBHL"];

      v169 = [v187 objectAtIndexedSubscript:3];
      [v185 setObject:v169 forKey:@"rightLoss2000_dBHL"];

      v170 = [v187 objectAtIndexedSubscript:4];
      [v185 setObject:v170 forKey:@"rightLoss3000_dBHL"];

      v171 = [v187 objectAtIndexedSubscript:5];
      [v185 setObject:v171 forKey:@"rightLoss4000_dBHL"];

      v172 = [v187 objectAtIndexedSubscript:6];
      [v185 setObject:v172 forKey:@"rightLoss6000_dBHL"];

      v173 = [v187 objectAtIndexedSubscript:7];
      [v185 setObject:v173 forKey:@"rightLoss10000_dBHL"];

      [v14 setObject:v185 forKey:@"PAConfigPresetSpeechKey"];
      [v14 setObject:v183 forKey:@"PAConfigLeftSpeechKey"];
      [v14 setObject:v187 forKey:@"PAConfigRightSpeechKey"];
      v174 = (void *)MEMORY[0x263EFF9A0];
      v175 = [v189 presetAdjustments];
      v176 = [v175 valueForKey:@"PAPresetAdjustmentSpeechModeKey"];
      v177 = [v174 dictionaryWithDictionary:v176];

      v69 = v181;
      uint64_t v125 = v185;

      v178 = [v182 dataFromPreset:v180];
      [v177 setValue:v178 forKey:@"data"];

      v179 = [NSDictionary dictionaryWithObject:v177 forKey:@"PAPresetAdjustmentSpeechModeKey"];
      [v189 setPresetAdjustments:v179];

      free(v180);
    }
    [v189 setAudiogramSettings:v14];
    [v189 setShape:12];
    v18 = v189;
    [v189 setLevel:12];

LABEL_8:
  }

  return (PAConfiguration *)v18;
}

+ (id)configurationFromAudiogramSample:(id)a3
{
  id v3 = +[PAAudiogramUtilities normalizedOffsetsFromAudiogram:a3];
  uint64_t v4 = +[PAConfiguration configurationWithAudiogram:v3];

  return v4;
}

+ (id)paramDataWithValue:(float)a3 andOffset:(int)a4
{
  v6[0] = bswap32(a4 >> 2);
  v6[1] = bswap32(LODWORD(a3));
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:8];
  return v4;
}

+ (id)dataFromPreset:(id *)a3
{
  id v5 = [MEMORY[0x263EFF990] data];
  id v6 = v5;
  *(float *)&double v7 = a3->var0;
  if (a3->var0 == a3->var32
    && (*(float *)&double v7 = a3->var1, *(float *)&v7 == a3->var33)
    && (*(float *)&double v7 = a3->var2, *(float *)&v7 == a3->var34)
    && (*(float *)&double v7 = a3->var3, *(float *)&v7 == a3->var35)
    && (*(float *)&double v7 = a3->var4, *(float *)&v7 == a3->var36)
    && (*(float *)&double v7 = a3->var5, *(float *)&v7 == a3->var37)
    && (*(float *)&double v7 = a3->var6, *(float *)&v7 == a3->var38))
  {
    *(float *)&double v7 = a3->var7;
    float v8 = 0.0;
  }
  else
  {
    float v8 = 1.0;
  }
  uint64_t v90 = 0;
  int v91 = 671088640;
  objc_msgSend(v5, "appendBytes:length:", &v90, 12, v7);
  *(float *)&double v9 = a3->var0;
  id v10 = [a1 paramDataWithValue:0 andOffset:v9];
  [v6 appendData:v10];

  *(float *)&double v11 = a3->var1;
  id v12 = [a1 paramDataWithValue:4 andOffset:v11];
  [v6 appendData:v12];

  *(float *)&double v13 = a3->var2;
  v14 = [a1 paramDataWithValue:8 andOffset:v13];
  [v6 appendData:v14];

  *(float *)&double v15 = a3->var3;
  v16 = [a1 paramDataWithValue:12 andOffset:v15];
  [v6 appendData:v16];

  *(float *)&double v17 = a3->var4;
  v18 = [a1 paramDataWithValue:16 andOffset:v17];
  [v6 appendData:v18];

  *(float *)&double v19 = a3->var5;
  uint64_t v20 = [a1 paramDataWithValue:20 andOffset:v19];
  [v6 appendData:v20];

  *(float *)&double v21 = a3->var6;
  v22 = [a1 paramDataWithValue:24 andOffset:v21];
  [v6 appendData:v22];

  *(float *)&double v23 = a3->var7;
  v24 = [a1 paramDataWithValue:28 andOffset:v23];
  [v6 appendData:v24];

  *(float *)&double v25 = a3->var8;
  float v26 = [a1 paramDataWithValue:32 andOffset:v25];
  [v6 appendData:v26];

  *(float *)&double v27 = a3->var9;
  float v28 = [a1 paramDataWithValue:36 andOffset:v27];
  [v6 appendData:v28];

  *(float *)&double v29 = a3->var10;
  float v30 = [a1 paramDataWithValue:40 andOffset:v29];
  [v6 appendData:v30];

  *(float *)&double v31 = a3->var11;
  float v32 = [a1 paramDataWithValue:44 andOffset:v31];
  [v6 appendData:v32];

  *(float *)&double v33 = a3->var12;
  float v34 = [a1 paramDataWithValue:48 andOffset:v33];
  [v6 appendData:v34];

  *(float *)&double v35 = a3->var13;
  v36 = [a1 paramDataWithValue:52 andOffset:v35];
  [v6 appendData:v36];

  *(float *)&double v37 = a3->var14;
  float v38 = [a1 paramDataWithValue:56 andOffset:v37];
  [v6 appendData:v38];

  *(float *)&double v39 = a3->var15;
  float v40 = [a1 paramDataWithValue:60 andOffset:v39];
  [v6 appendData:v40];

  *(float *)&double v41 = a3->var16;
  float v42 = [a1 paramDataWithValue:64 andOffset:v41];
  [v6 appendData:v42];

  *(float *)&double v43 = a3->var17;
  v44 = [a1 paramDataWithValue:68 andOffset:v43];
  [v6 appendData:v44];

  *(float *)&double v45 = a3->var18;
  id v46 = [a1 paramDataWithValue:72 andOffset:v45];
  [v6 appendData:v46];

  *(float *)&double v47 = a3->var19;
  uint64_t v48 = [a1 paramDataWithValue:76 andOffset:v47];
  [v6 appendData:v48];

  *(float *)&double v49 = a3->var20;
  v50 = [a1 paramDataWithValue:80 andOffset:v49];
  [v6 appendData:v50];

  *(float *)&double v51 = a3->var21;
  v52 = [a1 paramDataWithValue:84 andOffset:v51];
  [v6 appendData:v52];

  *(float *)&double v53 = a3->var22;
  v54 = [a1 paramDataWithValue:88 andOffset:v53];
  [v6 appendData:v54];

  *(float *)&double v55 = a3->var23;
  id v56 = [a1 paramDataWithValue:92 andOffset:v55];
  [v6 appendData:v56];

  *(float *)&double v57 = a3->var24;
  v58 = [a1 paramDataWithValue:96 andOffset:v57];
  [v6 appendData:v58];

  *(float *)&double v59 = a3->var25;
  v60 = [a1 paramDataWithValue:100 andOffset:v59];
  [v6 appendData:v60];

  *(float *)&double v61 = a3->var26;
  v62 = [a1 paramDataWithValue:104 andOffset:v61];
  [v6 appendData:v62];

  *(float *)&double v63 = a3->var27;
  v64 = [a1 paramDataWithValue:108 andOffset:v63];
  [v6 appendData:v64];

  *(float *)&double v65 = a3->var28;
  v66 = [a1 paramDataWithValue:112 andOffset:v65];
  [v6 appendData:v66];

  *(float *)&double v67 = a3->var29;
  v68 = [a1 paramDataWithValue:116 andOffset:v67];
  [v6 appendData:v68];

  *(float *)&double v69 = a3->var30;
  v70 = [a1 paramDataWithValue:120 andOffset:v69];
  [v6 appendData:v70];

  *(float *)&double v71 = v8;
  v72 = [a1 paramDataWithValue:124 andOffset:v71];
  [v6 appendData:v72];

  *(float *)&double v73 = a3->var32;
  v74 = [a1 paramDataWithValue:128 andOffset:v73];
  [v6 appendData:v74];

  *(float *)&double v75 = a3->var33;
  v76 = [a1 paramDataWithValue:132 andOffset:v75];
  [v6 appendData:v76];

  *(float *)&double v77 = a3->var34;
  v78 = [a1 paramDataWithValue:136 andOffset:v77];
  [v6 appendData:v78];

  *(float *)&double v79 = a3->var35;
  v80 = [a1 paramDataWithValue:140 andOffset:v79];
  [v6 appendData:v80];

  *(float *)&double v81 = a3->var36;
  v82 = [a1 paramDataWithValue:144 andOffset:v81];
  [v6 appendData:v82];

  *(float *)&double v83 = a3->var37;
  v84 = [a1 paramDataWithValue:148 andOffset:v83];
  [v6 appendData:v84];

  *(float *)&double v85 = a3->var38;
  v86 = [a1 paramDataWithValue:152 andOffset:v85];
  [v6 appendData:v86];

  *(float *)&double v87 = a3->var39;
  v88 = [a1 paramDataWithValue:156 andOffset:v87];
  [v6 appendData:v88];

  return v6;
}

- (PAConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PAConfiguration;
  id v5 = [(PAConfiguration *)&v22 init];
  if (v5)
  {
    -[PAConfiguration setLevel:](v5, "setLevel:", [v4 decodeIntegerForKey:@"PAConfigPresetLevelKey"]);
    -[PAConfiguration setShape:](v5, "setShape:", [v4 decodeIntegerForKey:@"PAConfigPresetShapeKey"]);
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    id v21 = 0;
    double v13 = [v4 decodeTopLevelObjectOfClasses:v12 forKey:@"PAConfigPresetKey" error:&v21];
    id v14 = v21;
    [(PAConfiguration *)v5 setPreset:v13];

    if (v14
      && [v14 code] != 4865
      && os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_ERROR))
    {
      -[PAConfiguration initWithCoder:]();
    }

    id v20 = 0;
    double v15 = [v4 decodeTopLevelObjectOfClasses:v12 forKey:@"PAConfigPresetAdjustmentsKey" error:&v20];
    id v16 = v20;
    [(PAConfiguration *)v5 setPresetAdjustments:v15];

    if (v16
      && [v16 code] != 4865
      && os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_ERROR))
    {
      -[PAConfiguration initWithCoder:]();
    }
    if ([v4 containsValueForKey:@"PAConfigPresetAudiogramKey"])
    {

      id v19 = 0;
      double v17 = [v4 decodeTopLevelObjectOfClasses:v12 forKey:@"PAConfigPresetAudiogramKey" error:&v19];
      id v16 = v19;
      [(PAConfiguration *)v5 setAudiogramSettings:v17];

      if (v16)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_ERROR)) {
          -[PAConfiguration initWithCoder:]();
        }
      }
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeInteger:self->_level forKey:@"PAConfigPresetLevelKey"];
  [v9 encodeInteger:self->_shape forKey:@"PAConfigPresetShapeKey"];
  id v4 = [(PAConfiguration *)self preset];
  [v9 encodeObject:v4 forKey:@"PAConfigPresetKey"];

  id v5 = [(PAConfiguration *)self presetAdjustments];
  [v9 encodeObject:v5 forKey:@"PAConfigPresetAdjustmentsKey"];

  id v6 = [(PAConfiguration *)self audiogramSettings];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(PAConfiguration *)self audiogramSettings];
    [v9 encodeObject:v8 forKey:@"PAConfigPresetAudiogramKey"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PAConfiguration *)self preset];
    uint64_t v7 = [v5 preset];
    if ([v6 isEqualToDictionary:v7])
    {
      uint64_t v8 = [(PAConfiguration *)self presetAdjustments];
      id v9 = [v5 presetAdjustments];
      char v10 = [v8 isEqualToDictionary:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PAConfiguration: %p, Level: %d, Shape: %d", self, -[PAConfiguration level](self, "level"), -[PAConfiguration shape](self, "shape")];
}

- (id)presetDictionaryForSpeech:(BOOL)a3
{
  unint64_t level = self->_level;
  if (level)
  {
    BOOL v5 = a3;
    if (level == 12)
    {
      id v6 = [(PAConfiguration *)self audiogramSettings];
      uint64_t v7 = v6;
      if (v5) {
        uint64_t v8 = @"PAConfigPresetSpeechKey";
      }
      else {
        uint64_t v8 = @"PAConfigPresetMediaKey";
      }
      id v9 = [v6 objectForKey:v8];
    }
    else
    {
      float v26 = @"PresetValues";
      if (a3) {
        float v26 = @"PresetValuesSpeech";
      }
      double v27 = v26;
      float v28 = paBundle();
      uint64_t v7 = [v28 pathForResource:v27 ofType:@"plist"];

      double v29 = [NSDictionary dictionaryWithContentsOfFile:v7];
      float v30 = [v29 objectForKey:@"level"];
      double v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAConfiguration level](self, "level"));
      float v32 = [v31 stringValue];
      double v33 = [v30 objectForKey:v32];

      float v34 = [v33 objectForKey:@"shape"];
      double v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAConfiguration shape](self, "shape"));
      v36 = [v35 stringValue];
      id v9 = [v34 objectForKey:v36];
    }
  }
  else
  {
    if (self->_shape == 2) {
      double v10 = 10.0;
    }
    else {
      double v10 = 0.0;
    }
    id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
    uint64_t v11 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v11 forKey:@"leftLoss250_dBHL"];

    id v12 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v12 forKey:@"leftLoss500_dBHL"];

    double v13 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v13 forKey:@"leftLoss1000_dBHL"];

    id v14 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v14 forKey:@"leftLoss2000_dBHL"];

    double v15 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v15 forKey:@"leftLoss3000_dBHL"];

    id v16 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v16 forKey:@"leftLoss4000_dBHL"];

    double v17 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v17 forKey:@"leftLoss6000_dBHL"];

    v18 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v18 forKey:@"leftLoss10000_dBHL"];

    id v19 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v19 forKey:@"rightLoss250_dBHL"];

    id v20 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v20 forKey:@"rightLoss500_dBHL"];

    id v21 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v21 forKey:@"rightLoss1000_dBHL"];

    objc_super v22 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v22 forKey:@"rightLoss2000_dBHL"];

    double v23 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v23 forKey:@"rightLoss3000_dBHL"];

    v24 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v24 forKey:@"rightLoss4000_dBHL"];

    double v25 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v25 forKey:@"rightLoss6000_dBHL"];

    uint64_t v7 = [NSNumber numberWithDouble:v10];
    [v9 setObject:v7 forKey:@"rightLoss10000_dBHL"];
  }

  return v9;
}

- ($582E6112602F317AA177BE214B91E8F0)settingsFromConfiguration:(BOOL)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v3 = [(PAConfiguration *)self presetDictionaryForSpeech:a3];
  PAInitializeLogging();
  id v4 = NSString;
  BOOL v5 = [v3 objectForKey:@"leftLoss250_dBHL"];
  id v6 = [v3 objectForKey:@"rightLoss250_dBHL"];
  uint64_t v7 = [v4 stringWithFormat:@"Preset values (first band) {%@, %@}", v5, v6];

  uint64_t v8 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration settingsFromConfiguration:]", 680, v7];
  id v9 = (os_log_t *)MEMORY[0x263F472C8];
  double v10 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v8;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v95 = [v11 UTF8String];
    _os_log_impl(&dword_20CD3E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG)) {
    -[PAConfiguration settingsFromConfiguration:]();
  }
  if ([v3 count] == 40)
  {
    double v13 = ($582E6112602F317AA177BE214B91E8F0 *)malloc_type_calloc(1uLL, 0xA0uLL, 0x1000040B8406A4EuLL);
    id v14 = [v3 objectForKey:@"leftLoss250_dBHL"];
    [v14 floatValue];
    v13->var0 = v15;

    id v16 = [v3 objectForKey:@"leftLoss500_dBHL"];
    [v16 floatValue];
    v13->var1 = v17;

    v18 = [v3 objectForKey:@"leftLoss1000_dBHL"];
    [v18 floatValue];
    v13->var2 = v19;

    id v20 = [v3 objectForKey:@"leftLoss2000_dBHL"];
    [v20 floatValue];
    v13->var3 = v21;

    objc_super v22 = [v3 objectForKey:@"leftLoss3000_dBHL"];
    [v22 floatValue];
    v13->var4 = v23;

    v24 = [v3 objectForKey:@"leftLoss4000_dBHL"];
    [v24 floatValue];
    v13->var5 = v25;

    float v26 = [v3 objectForKey:@"leftLoss6000_dBHL"];
    [v26 floatValue];
    v13->var6 = v27;

    float v28 = [v3 objectForKey:@"leftLoss10000_dBHL"];
    [v28 floatValue];
    v13->var7 = v29;

    float v30 = [v3 objectForKey:@"maxFdcGain_dB"];
    [v30 floatValue];
    v13->var8 = v31;

    float v32 = [v3 objectForKey:@"minFdcGain_dB"];
    [v32 floatValue];
    v13->var9 = v33;

    float v34 = [v3 objectForKey:@"attackTime_ms"];
    [v34 floatValue];
    v13->var10 = v35;

    v36 = [v3 objectForKey:@"releaseTime_ms"];
    [v36 floatValue];
    v13->var11 = v37;

    float v38 = [v3 objectForKey:@"fdcInputSmoothingTime_ms"];
    [v38 floatValue];
    v13->var12 = v39;

    float v40 = [v3 objectForKey:@"fineTuningGainBias_dB"];
    [v40 floatValue];
    v13->var13 = v41;

    float v42 = [v3 objectForKey:@"fineTuningBrightnessAdjust_dB"];
    [v42 floatValue];
    v13->var14 = v43;

    v44 = [v3 objectForKey:@"fineTuningRatioAdjust"];
    [v44 floatValue];
    v13->var15 = v45;

    id v46 = [v3 objectForKey:@"fineTuningSplBias_dB"];
    [v46 floatValue];
    v13->var16 = v47;

    uint64_t v48 = [v3 objectForKey:@"enableNoiseSuppression"];
    [v48 floatValue];
    v13->var17 = v49;

    v50 = [v3 objectForKey:@"noiseEstTimeConst_s"];
    [v50 floatValue];
    v13->var18 = v51;

    v52 = [v3 objectForKey:@"noiseEstBias_dB"];
    [v52 floatValue];
    v13->var19 = v53;

    v54 = [v3 objectForKey:@"noiseSuppTimeConst_ms"];
    [v54 floatValue];
    v13->var20 = v55;

    id v56 = [v3 objectForKey:@"noiseSuppFloor_dB"];
    [v56 floatValue];
    v13->var21 = v57;

    v58 = [v3 objectForKey:@"minCombinedGain_dB"];
    [v58 floatValue];
    v13->var22 = v59;

    v60 = [v3 objectForKey:@"filteringMode"];
    [v60 floatValue];
    v13->var23 = v61;

    v62 = [v3 objectForKey:@"outputSensitivity_dB"];
    [v62 floatValue];
    v13->var24 = v63;

    v64 = [v3 objectForKey:@"downstreamGain_dB"];
    [v64 floatValue];
    v13->var25 = v65;

    v66 = [v3 objectForKey:@"processingMode"];
    [v66 floatValue];
    v13->var26 = v67;

    v68 = [v3 objectForKey:@"headphoneType"];
    [v68 floatValue];
    v13->var27 = v69;

    v70 = [v3 objectForKey:@"expanderRatio"];
    [v70 floatValue];
    v13->var28 = v71;

    v72 = [v3 objectForKey:@"expanderThreshold_dB"];
    [v72 floatValue];
    v13->var29 = v73;

    v74 = [v3 objectForKey:@"linkedMode"];
    [v74 floatValue];
    v13->var30 = v75;

    v76 = [v3 objectForKey:@"rightLoss250_dBHL"];
    [v76 floatValue];
    v13->var32 = v77;

    v78 = [v3 objectForKey:@"rightLoss500_dBHL"];
    [v78 floatValue];
    v13->var33 = v79;

    v80 = [v3 objectForKey:@"rightLoss1000_dBHL"];
    [v80 floatValue];
    v13->var34 = v81;

    v82 = [v3 objectForKey:@"rightLoss2000_dBHL"];
    [v82 floatValue];
    v13->var35 = v83;

    v84 = [v3 objectForKey:@"rightLoss3000_dBHL"];
    [v84 floatValue];
    v13->var36 = v85;

    v86 = [v3 objectForKey:@"rightLoss4000_dBHL"];
    [v86 floatValue];
    v13->var37 = v87;

    v88 = [v3 objectForKey:@"rightLoss6000_dBHL"];
    [v88 floatValue];
    v13->var38 = v89;

    uint64_t v90 = [v3 objectForKey:@"rightLoss10000_dBHL"];
    [v90 floatValue];
    v13->var39 = v91;

    if (v13->var0 == v13->var32
      && v13->var1 == v13->var33
      && v13->var2 == v13->var34
      && v13->var3 == v13->var35
      && v13->var4 == v13->var36
      && v13->var5 == v13->var37
      && v13->var6 == v13->var38
      && v13->var7 == v13->var39)
    {
      float v92 = 0.0;
    }
    else
    {
      float v92 = 1.0;
    }
    v13->var31 = v92;
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- ($582E6112602F317AA177BE214B91E8F0)readSettingsFromPreset:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [a3 valueForKey:@"data"];
  if ([v3 length])
  {
    id v4 = ($582E6112602F317AA177BE214B91E8F0 *)malloc_type_calloc(1uLL, 0xA0uLL, 0x1000040B8406A4EuLL);
    BOOL v5 = [MEMORY[0x263EFF990] dataWithLength:160];
    unsigned int v22 = 0;
    uint64_t v21 = 0;
    objc_msgSend(v3, "getBytes:range:", &v21, 0, 12);
    int v6 = bswap32(v22);
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 8 * v6;
      do
      {
        *(void *)buf = 0;
        if (v7 + 20 <= (unint64_t)[v3 length])
        {
          objc_msgSend(v3, "getBytes:range:", buf, v7 + 12, 8);
          unsigned int v9 = bswap32(buf[0]);
          unsigned int v20 = bswap32(buf[1]);
          if (v9 <= 0x28) {
            objc_msgSend(v5, "replaceBytesInRange:withBytes:", 4 * v9, 4, &v20);
          }
        }
        v7 += 8;
      }
      while (v8 != v7);
    }
    uint64_t v10 = [v5 length];
    id v11 = (os_log_t *)MEMORY[0x263F472C8];
    if (v10 != 160)
    {
      id v12 = (void *)*MEMORY[0x263F472C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_FAULT)) {
        -[PAConfiguration readSettingsFromPreset:](v12, v5);
      }
    }
    objc_msgSend(v5, "getBytes:length:", v4, objc_msgSend(v5, "length"));
    PAInitializeLogging();
    double v13 = [NSString stringWithFormat:@"Preset settings (first band) {%lf, %lf}", v4->var0, v4->var32];
    id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration readSettingsFromPreset:]", 787, v13];
    os_log_t v15 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      float v17 = v15;
      uint64_t v18 = [v16 UTF8String];
      buf[0] = 136446210;
      *(void *)&buf[1] = v18;
      _os_log_impl(&dword_20CD3E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)buf, 0xCu);
    }
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG)) {
      -[PAConfiguration readSettingsFromPreset:](&v4->var0);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- ($D1907C19D6DE236B0F95485CBF7F2EE1)transparencySettingsForAddress:(id)a3
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(PAConfiguration *)self settingsFromConfiguration:0];
  if (v5)
  {
    int v6 = (float32x2_t *)v5;
    uint64_t v7 = ($D1907C19D6DE236B0F95485CBF7F2EE1 *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
    float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x4054000000000000uLL);
    *(float32x4_t *)&v7->var1.double var0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(*v6), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6->f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var1.double var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[2]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[2].f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var2.double var0 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[16]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[16].f32), v8), (float64x2_t)0));
    *(float32x4_t *)&v7->var2.double var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmaxnmq_f64(vminnmq_f64(vcvtq_f64_f32(v6[18]), v8), (float64x2_t)0)), vmaxnmq_f64(vminnmq_f64(vcvt_hight_f64_f32(*(float32x4_t *)v6[18].f32), v8), (float64x2_t)0));
    unsigned int v9 = +[PASettings sharedInstance];
    [v9 transparencyToneForAddress:v4];
    double v11 = v10 * 2.0 + -1.0;

    id v12 = +[PASettings sharedInstance];
    [v12 transparencyBalanceForAddress:v4];
    double v14 = v13 * 2.0 + -1.0;

    os_log_t v15 = +[PASettings sharedInstance];
    [v15 transparencyAmplificationForAddress:v4];
    double v17 = v16 * 2.0 + -1.0;

    if (v14 <= 0.0) {
      double v18 = v14;
    }
    else {
      double v18 = 0.0;
    }
    double v19 = v17 - v18;
    double v20 = fmax(v14, 0.0) + v17;
    PAInitializeLogging();
    uint64_t v21 = [NSString stringWithFormat:@"Sending tone: %lf, leftGain: %lf, rightGain: %lf balance %lf", *(void *)&v11, *(void *)&v19, *(void *)&v20, *(void *)&v14];
    unsigned int v22 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration transparencySettingsForAddress:]", 868, v21];
    float v23 = (os_log_t *)MEMORY[0x263F472C8];
    uint64_t v24 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v25 = v22;
      float v26 = v24;
      *(_DWORD *)buf = 136446210;
      uint64_t v82 = [v25 UTF8String];
      _os_log_impl(&dword_20CD3E000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    float v27 = +[PASettings sharedInstance];
    unsigned int v28 = [v27 transparencyBeamformingForAddress:v4];
    v7->var2.double var10 = (float)v28;
    v7->var1.double var10 = (float)v28;

    float v29 = +[PASettings sharedInstance];
    [v29 transparencyNoiseSupressorForAddress:v4];
    *(float *)&double v30 = v30;
    v7->var2.double var11 = *(float *)&v30;
    v7->var1.double var11 = *(float *)&v30;

    float v31 = fmax(fmin(v11, 1.0), -1.0);
    float v32 = fmax(fmin(v19, 2.0), -1.0);
    v7->var1.double var8 = v32;
    v7->var1.double var9 = v31;
    float v33 = fmax(fmin(v20, 2.0), -1.0);
    v7->var2.double var8 = v33;
    v7->var2.double var9 = v31;
    float v34 = +[PAHMSManager sharedInstance];
    unsigned int v35 = [v34 yodelEnabledForAddress:v4];

    PAInitializeLogging();
    v36 = [NSString stringWithFormat:@"Checking Yodel %d = %@", v35, v4];
    float v37 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration transparencySettingsForAddress:]", 878, v36];
    os_log_t v38 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
    {
      float v39 = v23;
      id v40 = v37;
      float v41 = v38;
      float v42 = v40;
      float v23 = v39;
      uint64_t v43 = [v42 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v82 = v43;
      _os_log_impl(&dword_20CD3E000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (v35)
    {
      float v44 = fmax(fmin(v17 - v14 * 0.5, 1.5), -1.5);
      v7->var1.double var8 = v44;
      float v45 = fmax(fmin(v14 * 0.5 + v17, 1.5), -1.5);
      v7->var2.double var8 = v45;
    }
    id v46 = +[PASettings sharedInstance];
    if ([v46 personalMediaEnabled])
    {
      float v47 = +[PASettings sharedInstance];
      v7->double var0 = (float)[v47 transparencyCustomizedForAddress:v4];
    }
    else
    {
      v7->double var0 = 0.0;
    }

    PAInitializeLogging();
    uint64_t v48 = [NSString stringWithFormat:@"Sending enabled %lf, first band: {%lf, %lf}", v7->var0, v7->var1.var0, v7->var2.var0];
    float v49 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration transparencySettingsForAddress:]", 890, v48];
    os_log_t v50 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = v49;
      v52 = v50;
      uint64_t v53 = [v51 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v82 = v53;
      _os_log_impl(&dword_20CD3E000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v54 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v56 = v7->var0;
      double var0 = v7->var1.var0;
      double var1 = v7->var1.var1;
      double var2 = v7->var1.var2;
      double var3 = v7->var1.var3;
      double var4 = v7->var1.var4;
      double var5 = v7->var1.var5;
      double var6 = v7->var1.var6;
      double var7 = v7->var1.var7;
      double var8 = v7->var1.var8;
      double var9 = v7->var1.var9;
      double var10 = v7->var1.var10;
      double var11 = v7->var1.var11;
      double v69 = v7->var2.var0;
      double v70 = v7->var2.var1;
      double v71 = v7->var2.var2;
      double v72 = v7->var2.var3;
      double v73 = v7->var2.var4;
      double v74 = v7->var2.var5;
      double v75 = v7->var2.var6;
      double v76 = v7->var2.var7;
      double v77 = v7->var2.var8;
      double v78 = v7->var2.var9;
      double v79 = v7->var2.var10;
      double v80 = v7->var2.var11;
      *(_DWORD *)buf = 134224128;
      uint64_t v82 = v56;
      __int16 v83 = 2048;
      double v84 = var0;
      __int16 v85 = 2048;
      double v86 = var1;
      __int16 v87 = 2048;
      double v88 = var2;
      __int16 v89 = 2048;
      double v90 = var3;
      __int16 v91 = 2048;
      double v92 = var4;
      __int16 v93 = 2048;
      double v94 = var5;
      __int16 v95 = 2048;
      double v96 = var6;
      __int16 v97 = 2048;
      double v98 = var7;
      __int16 v99 = 2048;
      double v100 = var8;
      __int16 v101 = 2048;
      double v102 = var9;
      __int16 v103 = 2048;
      double v104 = var10;
      __int16 v105 = 2048;
      double v106 = var11;
      __int16 v107 = 2048;
      double v108 = v69;
      __int16 v109 = 2048;
      double v110 = v70;
      __int16 v111 = 2048;
      double v112 = v71;
      __int16 v113 = 2048;
      double v114 = v72;
      __int16 v115 = 2048;
      double v116 = v73;
      __int16 v117 = 2048;
      double v118 = v74;
      __int16 v119 = 2048;
      double v120 = v75;
      __int16 v121 = 2048;
      double v122 = v76;
      __int16 v123 = 2048;
      double v124 = v77;
      __int16 v125 = 2048;
      double v126 = v78;
      __int16 v127 = 2048;
      double v128 = v79;
      __int16 v129 = 2048;
      double v130 = v80;
      _os_log_debug_impl(&dword_20CD3E000, v54, OS_LOG_TYPE_DEBUG, "Sending enabled %lf, left: {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}, right: {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}", buf, 0xFCu);
    }
    free(v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)lossArrayFromDictionary:(id)a3 forLeft:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a3;
  uint64_t v7 = [v5 array];
  if (v4) {
    float64x2_t v8 = @"leftLoss250_dBHL";
  }
  else {
    float64x2_t v8 = @"rightLoss250_dBHL";
  }
  if (v4) {
    unsigned int v9 = @"leftLoss500_dBHL";
  }
  else {
    unsigned int v9 = @"rightLoss500_dBHL";
  }
  if (v4) {
    double v10 = @"leftLoss1000_dBHL";
  }
  else {
    double v10 = @"rightLoss1000_dBHL";
  }
  if (v4) {
    double v11 = @"leftLoss2000_dBHL";
  }
  else {
    double v11 = @"rightLoss2000_dBHL";
  }
  if (v4) {
    id v12 = @"leftLoss3000_dBHL";
  }
  else {
    id v12 = @"rightLoss3000_dBHL";
  }
  if (v4) {
    double v13 = @"leftLoss4000_dBHL";
  }
  else {
    double v13 = @"rightLoss4000_dBHL";
  }
  if (v4) {
    double v14 = @"leftLoss6000_dBHL";
  }
  else {
    double v14 = @"rightLoss6000_dBHL";
  }
  if (v4) {
    os_log_t v15 = @"leftLoss10000_dBHL";
  }
  else {
    os_log_t v15 = @"rightLoss10000_dBHL";
  }
  double v16 = [v6 objectForKey:v8];
  [v7 hcSafeAddObject:v16];

  double v17 = [v6 objectForKey:v9];
  [v7 hcSafeAddObject:v17];

  double v18 = [v6 objectForKey:v10];
  [v7 hcSafeAddObject:v18];

  double v19 = [v6 objectForKey:v11];
  [v7 hcSafeAddObject:v19];

  double v20 = [v6 objectForKey:v12];
  [v7 hcSafeAddObject:v20];

  uint64_t v21 = [v6 objectForKey:v13];
  [v7 hcSafeAddObject:v21];

  unsigned int v22 = [v6 objectForKey:v14];
  [v7 hcSafeAddObject:v22];

  float v23 = [v6 objectForKey:v15];

  [v7 hcSafeAddObject:v23];
  if ([v7 count] == 8) {
    uint64_t v24 = v7;
  }
  else {
    uint64_t v24 = 0;
  }
  id v25 = v24;

  return v25;
}

- (id)onBudsMediaSettingsForRoute:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(getHMDeviceConfigurationsClass());
  id v6 = +[PASettings sharedInstance];
  id v51 = v4;
  int v7 = [v6 personalMediaEnabledForRouteUID:v4];

  if (v7)
  {
    float64x2_t v8 = +[PASettings sharedInstance];
    char v50 = [v8 personalAudioAccommodationTypes];
  }
  else
  {
    char v50 = 0;
  }
  PAInitializeLogging();
  unsigned int v9 = NSString;
  double v10 = NSNumber;
  double v11 = +[PASettings sharedInstance];
  id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "currentEnrollmentProgress"));
  double v13 = +[PASettings sharedInstance];
  double v14 = [v13 personalMediaEnabledByRouteUID];
  os_log_t v15 = +[PASettings sharedInstance];
  double v16 = [v15 accommodationTypesByRouteUID];
  double v17 = [v9 stringWithFormat:@"Checking state %@ - %@ - %@ - %@", v51, v12, v14, v16];

  double v18 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration onBudsMediaSettingsForRoute:]", 962, v17];
  double v19 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v18;
    uint64_t v21 = v19;
    *(_DWORD *)buf = 136446210;
    uint64_t v53 = [v20 UTF8String];
    _os_log_impl(&dword_20CD3E000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unsigned int v22 = +[PASettings sharedInstance];
  if ([v22 currentEnrollmentProgress] == 2) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2;
  }
  [v5 setEnrollPMEVoice:v23];

  if ((v50 & 2) != 0) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 2;
  }
  [v5 setEnablePMEVoice:v24];
  if ((v50 & 4) != 0) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  [v5 setEnablePMEMedia:v25];
  float v26 = [(PAConfiguration *)self presetDictionaryForSpeech:1];
  float v27 = [(PAConfiguration *)self presetDictionaryForSpeech:0];
  unsigned int v28 = [(PAConfiguration *)self lossArrayFromDictionary:v27 forLeft:1];
  [v5 setMediaLossArrayLeft:v28];

  float v29 = [(PAConfiguration *)self lossArrayFromDictionary:v27 forLeft:0];
  [v5 setMediaLossArrayRight:v29];

  double v30 = [(PAConfiguration *)self lossArrayFromDictionary:v26 forLeft:1];
  [v5 setVoiceLossArrayLeft:v30];

  float v31 = [(PAConfiguration *)self lossArrayFromDictionary:v26 forLeft:0];
  [v5 setVoiceLossArrayRight:v31];

  PAInitializeLogging();
  float v32 = [NSString stringWithFormat:@"Media config for route %@", v5];
  float v33 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration onBudsMediaSettingsForRoute:]", 976, v32];
  float v34 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v35 = v33;
    v36 = v34;
    uint64_t v37 = [v35 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v53 = v37;
    _os_log_impl(&dword_20CD3E000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  PAInitializeLogging();
  os_log_t v38 = NSString;
  float v39 = [v5 mediaLossArrayLeft];
  id v40 = [v5 mediaLossArrayRight];
  float v41 = [v5 voiceLossArrayLeft];
  float v42 = [v5 voiceLossArrayRight];
  uint64_t v43 = [v38 stringWithFormat:@"Sending configuration [%@, %@], [%@, %@]", v39, v40, v41, v42];

  float v44 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration onBudsMediaSettingsForRoute:]", 977, v43];
  float v45 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v46 = v44;
    float v47 = v45;
    uint64_t v48 = [v46 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v53 = v48;
    _os_log_impl(&dword_20CD3E000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v5;
}

- (float)pureToneAverageForSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (self->_level == 12)
  {
    id v5 = [(PAConfiguration *)self audiogramSettings];
    id v6 = v5;
    if (v3) {
      int v7 = @"PAConfigPresetSpeechKey";
    }
    else {
      int v7 = @"PAConfigPresetMediaKey";
    }
    float64x2_t v8 = [v5 objectForKey:v7];
  }
  else
  {
    unsigned int v9 = @"PresetValues";
    if (a3) {
      unsigned int v9 = @"PresetValuesSpeech";
    }
    double v10 = v9;
    double v11 = paBundle();
    id v6 = [v11 pathForResource:v10 ofType:@"plist"];

    id v12 = [NSDictionary dictionaryWithContentsOfFile:v6];
    double v13 = [v12 objectForKey:@"level"];
    double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAConfiguration level](self, "level"));
    os_log_t v15 = [v14 stringValue];
    double v16 = [v13 objectForKey:v15];

    double v17 = [v16 objectForKey:@"shape"];
    double v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PAConfiguration shape](self, "shape"));
    double v19 = [v18 stringValue];
    float64x2_t v8 = [v17 objectForKey:v19];
  }
  float v20 = 0.0;
  if ([v8 count] == 40)
  {
    uint64_t v21 = [v8 objectForKey:@"leftLoss500_dBHL"];
    [v21 floatValue];
    float v23 = v22;
    uint64_t v24 = [v8 objectForKey:@"leftLoss1000_dBHL"];
    [v24 floatValue];
    float v26 = v23 + v25;
    float v27 = [v8 objectForKey:@"leftLoss2000_dBHL"];
    [v27 floatValue];
    float v29 = v26 + v28;
    double v30 = [v8 objectForKey:@"leftLoss4000_dBHL"];
    [v30 floatValue];
    float v32 = (float)(v29 + v31) * 0.25;

    float v33 = [v8 objectForKey:@"rightLoss500_dBHL"];
    [v33 floatValue];
    float v35 = v34;
    v36 = [v8 objectForKey:@"rightLoss1000_dBHL"];
    [v36 floatValue];
    float v38 = v35 + v37;
    float v39 = [v8 objectForKey:@"rightLoss2000_dBHL"];
    [v39 floatValue];
    float v41 = v38 + v40;
    float v42 = [v8 objectForKey:@"rightLoss4000_dBHL"];
    [v42 floatValue];
    float v20 = (float)(v41 + v43) * 0.25;

    if (v32 < v20) {
      float v20 = v32;
    }
  }
  PAInitializeLogging();
  float v44 = objc_msgSend(NSString, "stringWithFormat:", @"PTA %d = %lf", v3, v20);
  float v45 = [NSString stringWithFormat:@"%s:%d %@", "-[PAConfiguration pureToneAverageForSpeech:]", 1009, v44];
  id v46 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v47 = v45;
    uint64_t v48 = v46;
    *(_DWORD *)buf = 136446210;
    uint64_t v51 = [v47 UTF8String];
    _os_log_impl(&dword_20CD3E000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v20;
}

- (float)mediaPureToneAverage
{
  [(PAConfiguration *)self pureToneAverageForSpeech:0];
  return result;
}

- (float)speechPureToneAverage
{
  [(PAConfiguration *)self pureToneAverageForSpeech:1];
  return result;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)setLevel:(unint64_t)a3
{
  self->_unint64_t level = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (NSDictionary)preset
{
  return self->_preset;
}

- (void)setPreset:(id)a3
{
}

- (NSDictionary)presetAdjustments
{
  return self->_presetAdjustments;
}

- (void)setPresetAdjustments:(id)a3
{
}

- (NSDictionary)audiogramSettings
{
  return self->_audiogramSettings;
}

- (void)setAudiogramSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogramSettings, 0);
  objc_storeStrong((id *)&self->_presetAdjustments, 0);
  objc_storeStrong((id *)&self->_preset, 0);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20CD3E000, v0, v1, "Error decoding audiogram preset: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20CD3E000, v0, v1, "Error decoding preset adjustments: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_20CD3E000, v0, v1, "Error decoding preset: %@", v2, v3, v4, v5, v6);
}

- (void)settingsFromConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20CD3E000, v0, OS_LOG_TYPE_DEBUG, "Preset values %@", v1, 0xCu);
}

- (void)readSettingsFromPreset:(float *)a1 .cold.1(float *a1)
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  int v58 = 134227968;
  double v59 = OUTLINED_FUNCTION_0(*a1);
  uint64_t v61 = v1;
  double v63 = OUTLINED_FUNCTION_0(*(float *)(v2 + 8));
  uint64_t v65 = v3;
  double v67 = OUTLINED_FUNCTION_0(*(float *)(v4 + 16));
  uint64_t v69 = v5;
  double v71 = OUTLINED_FUNCTION_0(*(float *)(v6 + 24));
  uint64_t v73 = v7;
  double v75 = OUTLINED_FUNCTION_0(*(float *)(v8 + 32));
  uint64_t v77 = v9;
  double v79 = OUTLINED_FUNCTION_0(*(float *)(v10 + 40));
  uint64_t v81 = v11;
  double v83 = OUTLINED_FUNCTION_0(*(float *)(v12 + 48));
  *(void *)(v13 + 134) = v14;
  double v86 = OUTLINED_FUNCTION_0(*(float *)(v15 + 56));
  *(void *)(v16 + 154) = v17;
  double v19 = OUTLINED_FUNCTION_0(*(float *)(v18 + 64));
  *(double *)(v20 + 164) = v19;
  *(void *)(v20 + 174) = v21;
  double v91 = OUTLINED_FUNCTION_0(*(float *)(v22 + 72));
  *(void *)(v23 + 194) = v24;
  double v26 = OUTLINED_FUNCTION_0(*(float *)(v25 + 80));
  *(double *)(v27 + 204) = v26;
  *(void *)(v27 + 214) = v28;
  double v96 = OUTLINED_FUNCTION_0(*(float *)(v29 + 88));
  *(void *)(v30 + 234) = v31;
  double v33 = OUTLINED_FUNCTION_0(*(float *)(v32 + 96));
  *(double *)(v34 + 244) = v33;
  *(void *)(v34 + 254) = v35;
  double v101 = OUTLINED_FUNCTION_0(*(float *)(v36 + 104));
  *float v37 = v38;
  double v40 = OUTLINED_FUNCTION_0(*(float *)(v39 + 112));
  *(double *)(v41 + 10) = v40;
  *(void *)(v41 + 20) = v42;
  double v106 = OUTLINED_FUNCTION_0(*(float *)(v43 + 120));
  double v45 = *v44;
  *(void *)(v46 + 40) = v47;
  *(double *)(v46 + 50) = v45;
  double v49 = OUTLINED_FUNCTION_0(*(float *)(v48 + 132));
  *(double *)(v50 + 60) = v49;
  uint64_t v111 = v51;
  double v53 = OUTLINED_FUNCTION_0(*(float *)(v52 + 140));
  *(double *)(v54 + 80) = v53;
  *(void *)(v54 + 90) = v55;
  LODWORD(v55) = *(_DWORD *)(v56 + 152);
  *(double *)(v54 + 100) = *(float *)(v56 + 148);
  double v116 = *(float *)&v55;
  *(double *)(v54 + 120) = *(float *)(v56 + 156);
  __int16 v60 = 2048;
  __int16 v62 = 2048;
  __int16 v64 = 2048;
  __int16 v66 = 2048;
  __int16 v68 = 2048;
  __int16 v70 = 2048;
  __int16 v72 = 2048;
  __int16 v74 = 2048;
  __int16 v76 = 2048;
  __int16 v78 = 2048;
  __int16 v80 = 2048;
  __int16 v82 = 2048;
  __int16 v84 = 2048;
  __int16 v85 = 2048;
  __int16 v87 = 2048;
  __int16 v88 = 2048;
  __int16 v89 = 2048;
  __int16 v90 = 2048;
  __int16 v92 = 2048;
  __int16 v93 = 2048;
  __int16 v94 = 2048;
  __int16 v95 = 2048;
  __int16 v97 = 2048;
  __int16 v98 = 2048;
  __int16 v99 = 2048;
  __int16 v100 = 2048;
  __int16 v102 = 2048;
  __int16 v103 = 2048;
  __int16 v104 = 2048;
  __int16 v105 = 2048;
  __int16 v107 = 2048;
  __int16 v108 = 2048;
  __int16 v109 = 2048;
  __int16 v110 = 2048;
  __int16 v112 = 2048;
  __int16 v113 = 2048;
  __int16 v114 = 2048;
  __int16 v115 = 2048;
  __int16 v117 = 2048;
  _os_log_debug_impl(&dword_20CD3E000, v57, OS_LOG_TYPE_DEBUG, "Preset settings {%lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf, %lf}", (uint8_t *)&v58, 0x192u);
}

- (void)readSettingsFromPreset:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_20CD3E000, v3, OS_LOG_TYPE_FAULT, "PAPresetSettings translated data wrong length %lu", v4, 0xCu);
}

@end