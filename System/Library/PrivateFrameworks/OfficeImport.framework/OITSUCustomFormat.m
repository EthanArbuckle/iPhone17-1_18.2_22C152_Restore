@interface OITSUCustomFormat
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualWithStemNameMatching:(id)a3;
- (BOOL)p_isEqual:(id)a3 matchingFullName:(BOOL)a4;
- (NSMutableArray)conditionList;
- (NSString)currencyCode;
- (NSString)formatName;
- (NSString)formatNameStem;
- (NSString)formatNameTag;
- (OITSUCustomFormat)customFormatWithNewName:(id)a3;
- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5;
- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5 conditionList:(id)a6;
- (OITSUCustomFormatData)defaultFormatData;
- (id)conditionalFormatAtIndex:(unint64_t)a3;
- (id)conditionalFormatDataForKey:(unint64_t)a3;
- (id)conditionalFormatDataForValue:(double)a3;
- (id)conditionalFormatDataForValue:(double)a3 outKey:(unint64_t *)a4;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)formatType;
- (unint64_t)conditionCount;
- (unint64_t)hash;
- (void)p_addConditionOfType:(int)a3 value:(double)a4 data:(id)a5;
- (void)p_makeFormatNameStemAndTag;
@end

@implementation OITSUCustomFormat

- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5 conditionList:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)OITSUCustomFormat;
  v13 = [(OITSUCustomFormat *)&v25 init];
  if (v13)
  {
    if ((a4 - 270) >= 3)
    {
      v14 = [NSString stringWithUTF8String:"-[OITSUCustomFormat initWithName:formatType:data:conditionList:]"];
      v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:234 isFatal:0 description:"Creating a custom format without a correct custom format type."];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    if (!v11)
    {
      v16 = [NSString stringWithUTF8String:"-[OITSUCustomFormat initWithName:formatType:data:conditionList:]"];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 235, 0, "invalid nil value for '%{public}s'", "customFormatData");

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v18 = [v10 copy];
    formatName = v13->_formatName;
    v13->_formatName = (NSString *)v18;

    v13->_formatType = a4;
    uint64_t v20 = [v11 copy];
    defaultFormatData = v13->_defaultFormatData;
    v13->_defaultFormatData = (OITSUCustomFormatData *)v20;

    [(OITSUCustomFormatData *)v13->_defaultFormatData setIsConditional:0];
    if (v12)
    {
      if (a4 != 270)
      {
        v22 = [NSString stringWithUTF8String:"-[OITSUCustomFormat initWithName:formatType:data:conditionList:]"];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:244 isFatal:0 description:"Conditions are only allowed for number custom formats."];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      objc_storeStrong((id *)&v13->_conditionList, a6);
    }
  }

  return v13;
}

- (OITSUCustomFormat)initWithName:(id)a3 formatType:(int)a4 data:(id)a5
{
  return [(OITSUCustomFormat *)self initWithName:a3 formatType:*(void *)&a4 data:a5 conditionList:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = +[OITSUMutableCustomFormat allocWithZone:a3];
  v5 = [(OITSUCustomFormat *)self formatName];
  uint64_t v6 = [(OITSUCustomFormat *)self formatType];
  v7 = [(OITSUCustomFormat *)self defaultFormatData];
  v8 = [(OITSUCustomFormat *)v4 initWithName:v5 formatType:v6 data:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(OITSUCustomFormat *)self conditionList];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 conditionType];
        [v14 conditionValue];
        double v17 = v16;
        uint64_t v18 = [v14 data];
        [(OITSUCustomFormat *)v8 p_addConditionOfType:v15 value:v18 data:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (OITSUCustomFormat)customFormatWithNewName:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [OITSUCustomFormat alloc];
  uint64_t v6 = [(OITSUCustomFormat *)self formatType];
  v7 = [(OITSUCustomFormat *)self defaultFormatData];
  v8 = [(OITSUCustomFormat *)v5 initWithName:v4 formatType:v6 data:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(OITSUCustomFormat *)self conditionList];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v14 conditionType];
        [v14 conditionValue];
        double v17 = v16;
        uint64_t v18 = [v14 data];
        [(OITSUCustomFormat *)v8 p_addConditionOfType:v15 value:v18 data:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)conditionCount
{
  v2 = [(OITSUCustomFormat *)self conditionList];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)p_addConditionOfType:(int)a3 value:(double)a4 data:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  if ([(OITSUCustomFormat *)self formatType] != 270)
  {
    v9 = [NSString stringWithUTF8String:"-[OITSUCustomFormat p_addConditionOfType:value:data:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:284 isFatal:0 description:"Adding conditions is only allowed for Custom Numbers."];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (!v8)
  {
    uint64_t v11 = [NSString stringWithUTF8String:"-[OITSUCustomFormat p_addConditionOfType:value:data:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 285, 0, "invalid nil value for '%{public}s'", "data");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v13 = [(OITSUCustomFormat *)self conditionList];

  if (!v13)
  {
    v14 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    conditionList = self->_conditionList;
    self->_conditionList = v14;
  }
  double v17 = [[OITSUCustomFormatCondition alloc] initWithType:v6 value:v8 data:a4];

  double v16 = [(OITSUCustomFormat *)self conditionList];
  [v16 addObject:v17];
}

- (unint64_t)hash
{
  unint64_t v3 = [(OITSUCustomFormat *)self defaultFormatData];
  id v4 = [v3 formatString];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(OITSUCustomFormat *)self formatType];

  return v6;
}

- (void)p_makeFormatNameStemAndTag
{
  unint64_t v3 = [(OITSUCustomFormat *)self formatName];

  if (v3)
  {
    id v4 = [(OITSUCustomFormat *)self formatName];
    uint64_t v5 = +[OITSULocale currentLocale];
    unint64_t v6 = [v5 locale];
    id v13 = 0;
    TSUNumberFormatterExtractBaseStemFromString(v4, v6, &v13);
    v7 = (NSString *)v13;

    formatNameStem = self->_formatNameStem;
    self->_formatNameStem = v7;
    v9 = v7;

    uint64_t v10 = [(OITSUCustomFormat *)self formatName];
    objc_msgSend(v10, "substringFromIndex:", -[NSString length](v9, "length"));
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    formatNameTag = self->_formatNameTag;
    self->_formatNameTag = v11;
  }
}

- (NSString)formatNameStem
{
  formatNameStem = self->_formatNameStem;
  if (!formatNameStem)
  {
    [(OITSUCustomFormat *)self p_makeFormatNameStemAndTag];
    formatNameStem = self->_formatNameStem;
  }
  return formatNameStem;
}

- (NSString)formatNameTag
{
  formatNameTag = self->_formatNameTag;
  if (!formatNameTag)
  {
    [(OITSUCustomFormat *)self p_makeFormatNameStemAndTag];
    formatNameTag = self->_formatNameTag;
  }
  return formatNameTag;
}

- (BOOL)p_isEqual:(id)a3 matchingFullName:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = (OITSUCustomFormat *)a3;
  if (self != v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = TSUDynamicCast(v7, (uint64_t)v6);
    if (!v8) {
      goto LABEL_20;
    }
    int v9 = [(OITSUCustomFormat *)self formatType];
    if (v9 != [v8 formatType]) {
      goto LABEL_20;
    }
    uint64_t v10 = [(OITSUCustomFormat *)self conditionList];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [v8 conditionList];
    uint64_t v13 = [v12 count];

    if (v11 != v13) {
      goto LABEL_20;
    }
    if (v4)
    {
      v14 = [v8 formatName];
      uint64_t v15 = [(OITSUCustomFormat *)self formatName];
      char v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v18 = [(OITSUCustomFormat *)self formatNameStem];
      v19 = [v8 formatNameStem];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_20;
      }
    }
    long long v21 = [(OITSUCustomFormat *)self defaultFormatData];
    long long v22 = [v8 defaultFormatData];
    int v23 = [v21 isEqual:v22];

    if (v23)
    {
      v24 = [(OITSUCustomFormat *)self conditionList];
      uint64_t v25 = [v24 count];

      if (!v25)
      {
        char v17 = 1;
        goto LABEL_21;
      }
      unint64_t v26 = 0;
      while (1)
      {
        v27 = [(OITSUCustomFormat *)self conditionList];
        v28 = [v27 objectAtIndex:v26];

        v29 = [v8 conditionList];
        v30 = [v29 objectAtIndex:v26];

        if (v28)
        {
          if (v30) {
            goto LABEL_15;
          }
        }
        else
        {
          v33 = [NSString stringWithUTF8String:"-[OITSUCustomFormat p_isEqual:matchingFullName:]"];
          v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 366, 0, "invalid nil value for '%{public}s'", "thisCondition");

          +[OITSUAssertionHandler logBacktraceThrottled];
          if (v30) {
            goto LABEL_15;
          }
        }
        v35 = [NSString stringWithUTF8String:"-[OITSUCustomFormat p_isEqual:matchingFullName:]"];
        v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 367, 0, "invalid nil value for '%{public}s'", "otherCondition");

        +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_15:
        char v17 = [v28 isEqual:v30];

        if (v17)
        {
          ++v26;
          v31 = [(OITSUCustomFormat *)self conditionList];
          unint64_t v32 = [v31 count];

          if (v26 < v32) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
LABEL_20:
    char v17 = 0;
LABEL_21:

    goto LABEL_22;
  }
  char v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  return [(OITSUCustomFormat *)self p_isEqual:a3 matchingFullName:1];
}

- (BOOL)isEqualWithStemNameMatching:(id)a3
{
  return [(OITSUCustomFormat *)self p_isEqual:a3 matchingFullName:0];
}

- (id)conditionalFormatDataForValue:(double)a3
{
  return [(OITSUCustomFormat *)self conditionalFormatDataForValue:0 outKey:a3];
}

- (id)conditionalFormatDataForValue:(double)a3 outKey:(unint64_t *)a4
{
  if ([(OITSUCustomFormat *)self formatType] == 270)
  {
    unint64_t v7 = [(OITSUCustomFormat *)self conditionCount];
    if (v7)
    {
      unint64_t v8 = v7;
      uint64_t v9 = 0;
      while (2)
      {
        uint64_t v10 = [(OITSUCustomFormat *)self conditionList];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

        [v11 conditionValue];
        double v13 = v12;
        switch([v11 conditionType])
        {
          case 0u:
            if (vabdd_f64(a3, v13) >= 1.0e-14) {
              goto LABEL_13;
            }
            goto LABEL_15;
          case 1u:
            if (v13 > a3) {
              goto LABEL_15;
            }
            goto LABEL_13;
          case 2u:
            if (v13 >= a3) {
              goto LABEL_15;
            }
            goto LABEL_13;
          case 3u:
            if (v13 >= a3) {
              goto LABEL_13;
            }
            goto LABEL_15;
          case 4u:
            if (v13 > a3) {
              goto LABEL_13;
            }
LABEL_15:
            char v16 = [v11 data];

            if (!v16) {
              goto LABEL_16;
            }
            unint64_t v17 = v9 + 1;
            if (!a4) {
              goto LABEL_19;
            }
            goto LABEL_18;
          default:
            v14 = [NSString stringWithUTF8String:"-[OITSUCustomFormat conditionalFormatDataForValue:outKey:]"];
            uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m"];
            +[OITSUAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:424 isFatal:0 description:"Unexpected condition type in conditional number format!"];

            +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_13:

LABEL_16:
            if (v8 == ++v9) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
  char v16 = [(OITSUCustomFormat *)self defaultFormatData];
  unint64_t v17 = 0;
  if (a4) {
LABEL_18:
  }
    *a4 = v17;
LABEL_19:
  return v16;
}

- (id)conditionalFormatAtIndex:(unint64_t)a3
{
  BOOL v4 = [(OITSUCustomFormat *)self conditionList];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)conditionalFormatDataForKey:(unint64_t)a3
{
  if (a3)
  {
    BOOL v4 = [(OITSUCustomFormat *)self conditionList];
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3 - 1];
    unint64_t v6 = [v5 data];
  }
  else
  {
    unint64_t v6 = [(OITSUCustomFormat *)self defaultFormatData];
  }
  return v6;
}

- (NSString)currencyCode
{
  if (!self->_currencyCodeComputed)
  {
    unint64_t v3 = [(OITSUCustomFormat *)self defaultFormatData];
    unsigned __int16 v4 = [v3 currencyCodeIndex];

    if ([(OITSUCustomFormat *)self conditionCount])
    {
      uint64_t v5 = 0;
      int v6 = 0;
      while (1)
      {
        unint64_t v7 = [(OITSUCustomFormat *)self conditionalFormatAtIndex:v5];
        unint64_t v8 = [v7 data];
        int v9 = [v8 currencyCodeIndex];

        if (v4)
        {
          if (v9 && v9 != v4) {
            break;
          }
        }
        if (v9 == (unsigned __int16)v6) {
          unsigned __int16 v10 = v9;
        }
        else {
          unsigned __int16 v10 = 0;
        }
        if (v5 != 1) {
          unsigned __int16 v10 = 0;
        }
        if (v5)
        {
          int v11 = v6;
        }
        else
        {
          unsigned __int16 v10 = 0;
          int v11 = v9;
        }
        if (!v4)
        {
          unsigned __int16 v4 = v10;
          int v6 = v11;
        }
        if (++v5 >= [(OITSUCustomFormat *)self conditionCount]) {
          goto LABEL_20;
        }
      }
      unsigned __int16 v4 = 0;
    }
LABEL_20:
    TSUCurrencyCodeForIndex(v4);
    double v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    currencyCode = self->_currencyCode;
    self->_currencyCode = v12;

    self->_currencyCodeComputed = 1;
  }
  v14 = self->_currencyCode;
  return v14;
}

- (id)description
{
  unint64_t v3 = NSString;
  unsigned __int16 v4 = [(OITSUCustomFormat *)self formatName];
  uint64_t v5 = [(OITSUCustomFormat *)self defaultFormatData];
  int v6 = [v5 formatString];
  unint64_t v7 = [v3 stringWithFormat:@"TSUCustomFormat:%@, %@", v4, v6];

  return v7;
}

- (int)formatType
{
  return self->_formatType;
}

- (OITSUCustomFormatData)defaultFormatData
{
  return self->_defaultFormatData;
}

- (NSString)formatName
{
  return self->_formatName;
}

- (NSMutableArray)conditionList
{
  return self->_conditionList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionList, 0);
  objc_storeStrong((id *)&self->_formatName, 0);
  objc_storeStrong((id *)&self->_defaultFormatData, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_formatNameTag, 0);
  objc_storeStrong((id *)&self->_formatNameStem, 0);
}

@end