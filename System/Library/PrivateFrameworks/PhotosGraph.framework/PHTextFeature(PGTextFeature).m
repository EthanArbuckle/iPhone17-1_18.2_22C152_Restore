@interface PHTextFeature(PGTextFeature)
+ (id)pg_textFeatureForFeature:()PGTextFeature;
@end

@implementation PHTextFeature(PGTextFeature)

+ (id)pg_textFeatureForFeature:()PGTextFeature
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 string];

    if (v5)
    {
      uint64_t v6 = [v4 type];
      switch(v6)
      {
        case 0:
        case 1:
        case 2:
        case 7:
        case 11:
        case 12:
        case 14:
        case 16:
        case 23:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 37:
          v7 = +[PGLogging sharedLogging];
          v8 = [v7 loggingConnection];

          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v9 = +[PGFeature stringForFeatureType:](PGFeature, "stringForFeatureType:", [v4 type]);
            int v17 = 138412290;
            v18 = v9;
            _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Cannot create a PHTextFeature from PGFeature type %@", (uint8_t *)&v17, 0xCu);
          }
          goto LABEL_7;
        case 3:
          uint64_t v6 = 1;
          break;
        case 4:
        case 5:
        case 6:
          break;
        case 8:
        case 20:
          uint64_t v6 = 7;
          break;
        case 9:
          uint64_t v6 = 10;
          break;
        case 10:
          uint64_t v6 = 9;
          break;
        case 13:
          uint64_t v6 = 12;
          break;
        case 15:
          uint64_t v6 = 2;
          break;
        case 17:
          uint64_t v6 = 14;
          break;
        case 18:
          uint64_t v6 = 11;
          break;
        case 19:
          uint64_t v6 = 3;
          break;
        case 21:
          uint64_t v6 = 15;
          break;
        case 22:
          uint64_t v6 = 16;
          break;
        case 24:
          uint64_t v6 = 17;
          break;
        case 25:
          uint64_t v6 = 18;
          break;
        case 26:
          uint64_t v6 = 19;
          break;
        case 36:
          uint64_t v6 = 13;
          break;
        default:
          uint64_t v6 = 0;
          break;
      }
      v10 = (void *)MEMORY[0x1E4F39320];
      v11 = [v4 string];
      [v4 weight];
      float v13 = v12;
      uint64_t v14 = [v4 origin];
      *(float *)&double v15 = v13;
      v5 = [v10 textFeatureWithType:v6 string:v11 weight:v14 origin:v15];
    }
  }
  else
  {
LABEL_7:
    v5 = 0;
  }

  return v5;
}

@end