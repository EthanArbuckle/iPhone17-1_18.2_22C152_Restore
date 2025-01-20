@interface ChartLabelInfoManager
+ (__CFString)_CFDateFormatterPropertyForMonthLabelLength:(int64_t)a3;
+ (id)chartLabelFont;
+ (id)sharedLabelInfoManager;
+ (void)clearSharedManager;
- (BOOL)use24hrTime;
- (ChartLabelInfoManager)init;
- (id)labelInfoForYAxis;
- (id)labelInfoWithString:(id)a3;
- (id)labelInfoWithUnsignedInteger:(unint64_t)a3;
- (id)monthLabelInfoArrayForLabelLength:(int64_t)a3;
- (void)dealloc;
- (void)resetLocale;
@end

@implementation ChartLabelInfoManager

+ (id)sharedLabelInfoManager
{
  v2 = (void *)__sharedInstance;
  if (!__sharedInstance)
  {
    v3 = objc_alloc_init(ChartLabelInfoManager);
    v4 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v3;

    v2 = (void *)__sharedInstance;
  }

  return v2;
}

+ (void)clearSharedManager
{
  v2 = (void *)__sharedInstance;
  __sharedInstance = 0;
}

+ (id)chartLabelFont
{
  v2 = (void *)axisLabelFont;
  if (!axisLabelFont)
  {
    v3 = (void *)MEMORY[0x263F1C658];
    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 _referenceBounds];
    double v5 = 12.0;
    if (v6 == 667.0) {
      double v5 = 15.0;
    }
    uint64_t v7 = [v3 systemFontOfSize:v5];
    v8 = (void *)axisLabelFont;
    axisLabelFont = v7;

    v2 = (void *)axisLabelFont;
  }

  return v2;
}

- (ChartLabelInfoManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ChartLabelInfoManager;
  v2 = [(ChartLabelInfoManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ChartLabelInfoManager *)v2 resetLocale];
  }
  return v3;
}

- (void)dealloc
{
  [(ChartLabelInfoManager *)self resetLocale];
  v3.receiver = self;
  v3.super_class = (Class)ChartLabelInfoManager;
  [(ChartLabelInfoManager *)&v3 dealloc];
}

- (id)labelInfoWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ChartLabelInfo);
  [(ChartLabelInfo *)v4 setString:v3];

  return v4;
}

- (id)labelInfoForYAxis
{
  yAxisLabelInfo = self->_yAxisLabelInfo;
  if (!yAxisLabelInfo)
  {
    v4 = objc_alloc_init(ChartLabelInfo);
    objc_super v5 = self->_yAxisLabelInfo;
    self->_yAxisLabelInfo = v4;

    [(ChartLabelInfo *)self->_yAxisLabelInfo setPosition:1.0];
    [(ChartLabelInfo *)self->_yAxisLabelInfo setImmutable:1];
    yAxisLabelInfo = self->_yAxisLabelInfo;
  }

  return yAxisLabelInfo;
}

- (id)labelInfoWithUnsignedInteger:(unint64_t)a3
{
  if (!self->_integerLabelInfoArray)
  {
    int v5 = 31;
    double v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:31];
    integerLabelInfoArray = self->_integerLabelInfoArray;
    self->_integerLabelInfoArray = v6;

    do
    {
      v8 = self->_integerLabelInfoArray;
      v9 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)v8 addObject:v9];

      --v5;
    }
    while (v5);
  }
  if (a3 - 32 > 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v14 = a3 - 1;
    v15 = [(NSMutableArray *)self->_integerLabelInfoArray objectAtIndex:a3 - 1];
    v16 = [MEMORY[0x263EFF9D0] null];

    if (v15 == v16)
    {
      v17 = objc_alloc_init(ChartLabelInfo);
      v18 = +[StockDataFormatter sharedDataFormatter];
      int v19 = [v18 doesLocaleUseASCII];

      if (v19)
      {
        v26[0] = (a3 % 0xAu) | 0x30;
        if (a3 < 0xA)
        {
          uint64_t v20 = 1;
        }
        else
        {
          v26[1] = (a3 % 0xAu) | 0x30;
          v26[0] = a3 / 0xAu + 48;
          uint64_t v20 = 2;
        }
        v24 = (void *)[[NSString alloc] initWithBytes:v26 length:v20 encoding:1];
        [(ChartLabelInfo *)v17 setString:v24];
      }
      else
      {
        v21 = +[StockDataFormatter sharedDataFormatter];
        v22 = [NSNumber numberWithUnsignedInteger:a3];
        v23 = [v21 formattedNumber:v22 withPrecision:0 useGroupSeparator:0];
        [(ChartLabelInfo *)v17 setString:v23];
      }
      [(ChartLabelInfo *)v17 setImmutable:1];
      [(NSMutableArray *)self->_integerLabelInfoArray replaceObjectAtIndex:v14 withObject:v17];
    }
    v13 = [(NSMutableArray *)self->_integerLabelInfoArray objectAtIndex:v14];
  }
  else
  {
    v10 = +[StockDataFormatter sharedDataFormatter];
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12 = [v10 formattedNumber:v11 withPrecision:0 useGroupSeparator:0];
    v13 = [(ChartLabelInfoManager *)self labelInfoWithString:v12];
  }

  return v13;
}

- (BOOL)use24hrTime
{
  return self->_use24hrTime;
}

+ (__CFString)_CFDateFormatterPropertyForMonthLabelLength:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v3 = (__CFString **)MEMORY[0x263EFFC20];
      return *v3;
    case 1:
      id v3 = (__CFString **)MEMORY[0x263EFFBD8];
      return *v3;
    case 2:
      id v3 = (__CFString **)MEMORY[0x263EFFBF8];
      return *v3;
  }
  return 0;
}

- (id)monthLabelInfoArrayForLabelLength:(int64_t)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  monthLabelInfoArrays = self->_monthLabelInfoArrays;
  if (!monthLabelInfoArrays)
  {
    int v6 = 3;
    uint64_t v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    v8 = self->_monthLabelInfoArrays;
    self->_monthLabelInfoArrays = v7;

    do
    {
      v9 = self->_monthLabelInfoArrays;
      v10 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)v9 addObject:v10];

      --v6;
    }
    while (v6);
    monthLabelInfoArrays = self->_monthLabelInfoArrays;
  }
  id v11 = [(NSMutableArray *)monthLabelInfoArrays objectAtIndex:a3];
  id v12 = [MEMORY[0x263EFF9D0] null];

  if (v11 != v12)
  {
    v13 = v11;
LABEL_7:
    id v11 = v13;
    unint64_t v14 = v11;
    goto LABEL_27;
  }
  v15 = +[ChartLabelInfoManager _CFDateFormatterPropertyForMonthLabelLength:a3];
  if (v15)
  {
    CFStringRef v16 = v15;
    v17 = (__CFDateFormatter *)dateFormatter;
    if (!dateFormatter)
    {
      v17 = CFDateFormatterCreate(0, (CFLocaleRef)[MEMORY[0x263EFF960] currentLocale], kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      dateFormatter = (uint64_t)v17;
    }
    v18 = (void *)CFDateFormatterCopyProperty(v17, v16);
    if (v18)
    {
      int v19 = v18;
      v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = -[ChartLabelInfoManager labelInfoWithString:](self, "labelInfoWithString:", *(void *)(*((void *)&v33 + 1) + 8 * i), (void)v33);
            [v13 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v22);
      }

      v26 = (void *)CFDateFormatterCopyProperty((CFDateFormatterRef)dateFormatter, (CFDateFormatterKey)*MEMORY[0x263EFFBB0]);
      uint64_t v27 = [v26 count];
      if (v27 == [v13 count] && v27 >= 1)
      {
        uint64_t v29 = 0;
        do
        {
          v30 = objc_msgSend(v13, "objectAtIndex:", v29, (void)v33);
          v31 = [v26 objectAtIndex:v29];
          [v30 setAccessibilityLabel:v31];

          ++v29;
        }
        while (v27 != v29);
      }
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_monthLabelInfoArrays, "replaceObjectAtIndex:withObject:", a3, v13, (void)v33);

      goto LABEL_7;
    }
  }
  unint64_t v14 = 0;
LABEL_27:

  return v14;
}

- (void)resetLocale
{
  monthLabelInfoArrays = self->_monthLabelInfoArrays;
  self->_monthLabelInfoArrays = 0;

  integerLabelInfoArray = self->_integerLabelInfoArray;
  self->_integerLabelInfoArray = 0;

  self->_use24hrTime = _CPTimeFormatIs24HourMode() != 0;
  if (dateFormatter)
  {
    CFRelease((CFTypeRef)dateFormatter);
    dateFormatter = 0;
  }
  int v5 = (void *)monthDayFormatter;
  monthDayFormatter = 0;

  int v6 = (void *)yearFormatter;
  yearFormatter = 0;

  uint64_t v7 = (void *)axisLabelFont;
  axisLabelFont = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integerLabelInfoArray, 0);
  objc_storeStrong((id *)&self->_monthLabelInfoArrays, 0);

  objc_storeStrong((id *)&self->_yAxisLabelInfo, 0);
}

@end