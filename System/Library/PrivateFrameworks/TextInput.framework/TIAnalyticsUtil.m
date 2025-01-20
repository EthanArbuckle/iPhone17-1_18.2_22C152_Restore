@interface TIAnalyticsUtil
+ (BOOL)hasNonWhitespaceNonPunctuationText:(id)a3;
+ (BOOL)isArray:(id)a3;
+ (BOOL)isBoolean:(id)a3;
+ (BOOL)isDictionary:(id)a3;
+ (BOOL)isFloat:(id)a3;
+ (BOOL)isInteger:(id)a3;
+ (BOOL)isNumber:(id)a3;
+ (BOOL)isReportableClientId:(id)a3;
+ (BOOL)isString:(id)a3;
+ (BOOL)isStylizedString:(id)a3 equalToString:(id)a4;
+ (id)appCategoryForBundleID:(id)a3;
+ (id)bucketNumber:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5;
+ (id)bucketPercentageWithNumber:(id)a3;
+ (id)bucketPercentageWithNumerator:(id)a3 andDenominator:(id)a4;
+ (id)bucketPercentageWithValue:(double)a3;
+ (id)bucketRatioWithNumber:(id)a3 bucketCount:(int)a4;
+ (id)bucketRatioWithNumerator:(id)a3 andDenominator:(id)a4 bucketCount:(int)a5;
+ (id)bucketRatioWithValue:(double)a3 bucketCount:(int)a4;
+ (id)constrainInteger:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5;
+ (id)createStringByReplacingStylizedQuotesToStraightQuotes:(id)a3;
+ (id)indexesForValidRatiosInArray:(id)a3;
+ (id)roundCount:(id)a3 toSignificantDigits:(int64_t)a4;
+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4;
+ (id)toFloat:(id)a3;
+ (id)toInteger:(id)a3;
+ (int)computeCommonExtentForArrays:(id)a3;
@end

@implementation TIAnalyticsUtil

+ (id)appCategoryForBundleID:(id)a3
{
  id v3 = a3;
  if (!InputAnalyticsLibraryCore_12127()) {
    goto LABEL_7;
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getIAUtilityClass_softClass;
  uint64_t v11 = getIAUtilityClass_softClass;
  if (!getIAUtilityClass_softClass)
  {
    InputAnalyticsLibraryCore_12127();
    v9[3] = (uint64_t)objc_getClass("IAUtility");
    getIAUtilityClass_softClass = v9[3];
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = [v5 lookupAppBundle:v3];
  }
  else
  {
LABEL_7:
    v6 = @"nil";
  }

  return v6;
}

+ (BOOL)isReportableClientId:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple."])
  {
    char v4 = 1;
  }
  else
  {
    if (isReportableClientId__onceToken != -1) {
      dispatch_once(&isReportableClientId__onceToken, &__block_literal_global_12138);
    }
    id v5 = (void *)isReportableClientId__topThirdPartyBundleIds;
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v3, "hash"));
    char v4 = [v5 containsObject:v6];
  }
  return v4;
}

uint64_t __40__TIAnalyticsUtil_isReportableClientId___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EDC38D50, &unk_1EDC38D68, &unk_1EDC38D80, &unk_1EDC38D98, &unk_1EDC38DB0, &unk_1EDC38DC8, &unk_1EDC38DE0, &unk_1EDC38DF8, &unk_1EDC38E10, &unk_1EDC38E28, &unk_1EDC38E40, &unk_1EDC38E58, &unk_1EDC38E70, &unk_1EDC38E88, &unk_1EDC38EA0, &unk_1EDC38EB8, &unk_1EDC38ED0,
    &unk_1EDC38EE8,
    &unk_1EDC38F00,
    &unk_1EDC38F18,
    &unk_1EDC38F30,
    &unk_1EDC38F48,
    &unk_1EDC38F60,
  isReportableClientId__topThirdPartyBundleIds = 0);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)hasNonWhitespaceNonPunctuationText:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v8 = [v6 stringByTrimmingCharactersInSet:v7];

  LOBYTE(v7) = [v8 length] != 0;
  return (char)v7;
}

+ (BOOL)isStylizedString:(id)a3 equalToString:(id)a4
{
  id v6 = a4;
  v7 = [a1 createStringByReplacingStylizedQuotesToStraightQuotes:a3];
  LOBYTE(a1) = [v7 isEqualToString:v6];

  return (char)a1;
}

+ (id)createStringByReplacingStylizedQuotesToStraightQuotes:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
}

+ (id)indexesForValidRatiosInArray:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TIAnalyticsUtil_indexesForValidRatiosInArray___block_invoke;
  v7[3] = &unk_1E555A388;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

uint64_t __48__TIAnalyticsUtil_indexesForValidRatiosInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 doubleValue];
  if (v6 >= 0.0)
  {
    v7 = *(void **)(a1 + 32);
    return [v7 addIndex:a3];
  }
  return result;
}

+ (int)computeCommonExtentForArrays:(id)a3
{
  v15 = (id *)&v16;
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = -1;
    int v6 = -1;
    v7 = v3;
    do
    {
      int v8 = [v7 count];
      if (v5 >= v8) {
        int v9 = v8;
      }
      else {
        int v9 = v5;
      }
      if (v6 <= v8) {
        int v10 = v8;
      }
      else {
        int v10 = v6;
      }
      if (v5 == -1) {
        int v6 = v8;
      }
      else {
        int v6 = v10;
      }
      if (v5 == -1) {
        int v5 = v8;
      }
      else {
        int v5 = v9;
      }
      uint64_t v11 = v15++;
      id v12 = *v11;

      v7 = v12;
    }
    while (v12);
  }
  else
  {
    int v6 = -1;
    int v5 = -1;
  }
  if (v5 == v6) {
    int v13 = v5;
  }
  else {
    int v13 = -1;
  }

  return v13;
}

+ (id)bucketPercentageWithValue:(double)a3
{
  return +[TIAnalyticsUtil bucketRatioWithValue:100 bucketCount:a3];
}

+ (id)bucketPercentageWithNumerator:(id)a3 andDenominator:(id)a4
{
  return +[TIAnalyticsUtil bucketRatioWithNumerator:a3 andDenominator:a4 bucketCount:100];
}

+ (id)bucketPercentageWithNumber:(id)a3
{
  return +[TIAnalyticsUtil bucketRatioWithNumber:a3 bucketCount:100];
}

+ (id)bucketRatioWithValue:(double)a3 bucketCount:(int)a4
{
  if (a3 == -1.0)
  {
    *(void *)&a4 = 0xFFFFFFFFLL;
  }
  else
  {
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    a4 = llround(a3 * (double)a4);
  }
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", *(void *)&a4, v4);
  return v6;
}

+ (id)bucketRatioWithNumerator:(id)a3 andDenominator:(id)a4 bucketCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  [a3 doubleValue];
  double v9 = v8;
  [v7 doubleValue];
  double v11 = v10;

  if (v9 < 0.0 || v11 <= 0.0)
  {
    id v12 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  }
  else
  {
    id v12 = +[TIAnalyticsUtil bucketRatioWithValue:v5 bucketCount:v9 / v11];
  }

  return v12;
}

+ (id)bucketRatioWithNumber:(id)a3 bucketCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [a3 doubleValue];

  return +[TIAnalyticsUtil bucketRatioWithValue:bucketCount:](TIAnalyticsUtil, "bucketRatioWithValue:bucketCount:", v4);
}

+ (id)bucketNumber:(id)a3 bucketThresholds:(id)a4 bucketValues:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if (v8)
  {
    if (v9) {
      [v9 objectAtIndexedSubscript:0];
    }
    else {
    id v12 = [NSNumber numberWithInteger:0];
    }
    if ([v8 count])
    {
      uint64_t v13 = 0;
      while (1)
      {
        [v7 doubleValue];
        double v15 = v14;
        uint64_t v16 = [v8 objectAtIndexedSubscript:v13];
        [v16 doubleValue];
        double v18 = v17;

        if (v15 < v18) {
          break;
        }
        ++v13;
        if (v10) {
          [v10 objectAtIndexedSubscript:v13];
        }
        else {
        id v11 = [NSNumber numberWithInteger:v13];
        }

        id v12 = v11;
        if ([v8 count] == v13) {
          goto LABEL_15;
        }
      }
    }
    id v11 = v12;
  }
  else
  {
    id v11 = v7;
  }
LABEL_15:

  return v11;
}

+ (id)constrainInteger:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 intValue];
  if (v7)
  {
    int v10 = [v7 intValue];
    if ((int)v9 <= v10) {
      uint64_t v9 = v10;
    }
    else {
      uint64_t v9 = v9;
    }
  }
  if (v8)
  {
    int v11 = [v8 intValue];
    if ((int)v9 >= v11) {
      uint64_t v9 = v11;
    }
    else {
      uint64_t v9 = v9;
    }
  }
  id v12 = [NSNumber numberWithInt:v9];

  return v12;
}

+ (id)roundNumber:(id)a3 toSignificantDigits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v11 = v5;
    goto LABEL_11;
  }
  BOOL v7 = +[TIAnalyticsUtil isInteger:v5];
  [v5 doubleValue];
  if (v8 == 0.0)
  {
    uint64_t v9 = NSNumber;
    if (v7)
    {
      uint64_t v10 = 0;
LABEL_8:
      id v11 = [v9 numberWithInt:v10];
      goto LABEL_11;
    }
    double v16 = 0.0;
  }
  else
  {
    double v12 = v8;
    int v13 = [v6 intValue];
    double v14 = log10(fabs(v12));
    double v15 = __exp10((double)(int)(v13 - vcvtpd_s64_f64(v14)));
    double v16 = round(v12 * v15) / v15;
    uint64_t v9 = NSNumber;
    if (v7)
    {
      uint64_t v10 = (int)v16;
      goto LABEL_8;
    }
  }
  id v11 = [v9 numberWithDouble:v16];
LABEL_11:
  double v17 = v11;

  return v17;
}

+ (id)roundCount:(id)a3 toSignificantDigits:(int64_t)a4
{
  id v5 = NSNumber;
  id v6 = a3;
  BOOL v7 = [v5 numberWithInteger:a4];
  double v8 = +[TIAnalyticsUtil roundNumber:v6 toSignificantDigits:v7];

  return v8;
}

+ (id)toFloat:(id)a3
{
  id v3 = NSNumber;
  [a3 floatValue];

  return (id)objc_msgSend(v3, "numberWithFloat:");
}

+ (id)toInteger:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [a3 intValue];

  return (id)[v3 numberWithInt:v4];
}

+ (BOOL)isDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isArray:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isBoolean:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v4 = CFGetTypeID(v3);
    BOOL v5 = v4 == CFBooleanGetTypeID();
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isNumber:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[TIAnalyticsUtil isInteger:v3]
    || +[TIAnalyticsUtil isFloat:v3];

  return v4;
}

+ (BOOL)isFloat:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (CFTypeID v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("fd", *(char *)[v3 objCType], 3uLL) != 0;

  return v5;
}

+ (BOOL)isInteger:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (CFTypeID v4 = CFGetTypeID(v3), v4 != CFBooleanGetTypeID())
    && memchr("BcsilqCSILQ", *(char *)[v3 objCType], 0xCuLL) != 0;

  return v5;
}

+ (BOOL)isString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end