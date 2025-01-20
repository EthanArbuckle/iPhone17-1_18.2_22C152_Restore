@interface PTTuningParameters
+ (float)noiseScaleFactorForHwModelID:(int)a3 sensorID:(int)a4;
+ (id)hwModelIDToString:(int)a3;
+ (int)hwModelIDFromFigModelSpecificName:(id)a3;
@end

@implementation PTTuningParameters

+ (float)noiseScaleFactorForHwModelID:(int)a3 sensorID:(int)a4
{
  switch(a3 & 0xFFFFFFFE)
  {
    case 0xEu:
      float result = 0.25;
      if ((a4 - 1811) >= 2 && a4 != 2051) {
        return 0.24;
      }
      return result;
    case 0x12u:
      float result = 0.17;
      if (a4 > 2130)
      {
        if (a4 != 2131) {
          goto LABEL_24;
        }
      }
      else if ((a4 - 1811) >= 2 && a4 != 2051)
      {
        return 0.16;
      }
      return result;
    case 0x14u:
    case 0x18u:
      float result = flt_1D081FCB8[a4 == 2308];
      if (a4 == 1812) {
        return 0.25;
      }
      return result;
    case 0x16u:
      float result = 0.17;
      if (a4 != 1812 && a4 != 2307)
      {
LABEL_24:
        if (a4 != 2323) {
          return 0.16;
        }
      }
      return result;
    default:
      float result = 0.5;
      if (a4 > 1794)
      {
        if (a4 == 1795) {
          return result;
        }
        if (a4 != 1812)
        {
          if (a4 == 1811) {
            return 0.75;
          }
          return 0.25;
        }
        return 1.0;
      }
      if (a4 == 1300) {
        return 1.0;
      }
      if (a4 != 1539) {
        return 0.25;
      }
      return result;
  }
}

+ (int)hwModelIDFromFigModelSpecificName:(id)a3
{
  v3 = [&unk_1F26C11C8 objectForKey:a3];
  v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

+ (id)hwModelIDToString:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [&unk_1F26C11C8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    v7 = @"Unknown";
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&unk_1F26C11C8);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [&unk_1F26C11C8 objectForKeyedSubscript:v9];
        if ([v10 intValue] == a3)
        {
          v7 = v9;

          goto LABEL_12;
        }
      }
      uint64_t v5 = [&unk_1F26C11C8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = @"Unknown";
  }
LABEL_12:

  return v7;
}

@end