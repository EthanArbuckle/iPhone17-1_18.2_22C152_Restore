@interface EMChartMapper
+ (CGColor)newColorWithCalibratedRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
- (EMChartMapper)initWithChart:(id)a3 parent:(id)a4;
- (id)copyPdfWithState:(id)a3 withSize:(CGSize)a4;
- (id)dateFromXlDateTimeNumber:(double)a3;
- (void)_addCategoryAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6;
- (void)_addGraphicProperties:(id)a3 toDescription:(id)a4 withState:(id)a5;
- (void)_addStandardSeries:(id)a3 toDescription:(id)a4 withState:(id)a5;
- (void)_addUnitAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6;
- (void)addBackgroundToDescription:(id)a3 withState:(id)a4;
- (void)addLegendToDescription:(id)a3 chartSize:(CGSize)a4 withState:(id)a5;
- (void)addTitleToDescription:(id)a3 withState:(id)a4;
@end

@implementation EMChartMapper

- (EMChartMapper)initWithChart:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v8 = [(CMMapper *)self initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mChart, a3);
  }

  return v9;
}

- (id)copyPdfWithState:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v32 = a3;
  objc_storeStrong((id *)&self->mState, a3);
  v8 = [v32 resources];
  mResources = self->mResources;
  self->mResources = v8;

  v33 = [MEMORY[0x263EFF9A0] dictionary];
  v10 = [(CHDChart *)self->mChart mainType];
  mMainType = self->mMainType;
  self->mMainType = v10;

  uint64_t v30 = 72;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v12 = [(CHDChartType *)self->mMainType isColumn] ^ 1;
  }
  else {
    char v12 = 0;
  }
  self->mIsHorizontal = v12;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "axes", v30);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v17 axisPosition] || self->mIsHorizontal)
          && ([v17 axisPosition] != 1 || !self->mIsHorizontal))
        {
          if ([v17 isSecondary]) {
            uint64_t v18 = 104;
          }
          else {
            uint64_t v18 = 96;
          }
        }
        else
        {
          uint64_t v18 = 88;
        }
        if (!*(Class *)((char *)&self->super.super.isa + v18)) {
          objc_storeStrong((id *)((char *)&self->super.super.isa + v18), v17);
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->mIsStacked = [*(id *)((char *)&self->super.super.isa + v31) grouping] == 2;
    self->mIsPercentStacked = [*(id *)((char *)&self->super.super.isa + v31) grouping] == 1;
  }
  else
  {
    self->mIsStacked = 0;
    self->mIsPercentStacked = 0;
  }
  [(EMChartMapper *)self addTitleToDescription:v33 withState:v32];
  [(EMChartMapper *)self addBackgroundToDescription:v33 withState:v32];
  -[EMChartMapper addLegendToDescription:chartSize:withState:](self, "addLegendToDescription:chartSize:withState:", v33, v32, width, height);
  v19 = [*(id *)((char *)&self->super.super.isa + v31) seriesCollection];
  if ([v19 count])
  {
    v20 = [v19 objectAtIndex:0];
    mMainSeries = self->mMainSeries;
    self->mMainSeries = v20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(EMChartMapper *)self _addCategoryAxis:self->mBaseAxis series:self->mMainSeries state:v32 toDescription:v33];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [(EMChartMapper *)self _addUnitAxis:self->mBaseAxis series:self->mMainSeries state:v32 toDescription:v33];
    }
  }
  v22 = [NSNumber numberWithBool:0];
  [v33 setValue:v22 forKey:*MEMORY[0x263F62758]];

  uint64_t v23 = [v19 count];
  if (v23 >= 1)
  {
    for (uint64_t j = 0; j != v23; ++j)
    {
      v25 = [v19 objectAtIndex:j];
      [(EMChartMapper *)self addSeries:v25 toDescription:v33 withState:v32];
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    mPrimaryAxis = self->mPrimaryAxis;
    if (!mPrimaryAxis) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
  }
  mPrimaryAxis = self->mPrimaryAxis;
  if (mPrimaryAxis) {
LABEL_40:
  }
    [(EMChartMapper *)self _addUnitAxis:mPrimaryAxis series:self->mMainSeries state:v32 toDescription:v33];
LABEL_41:
  mSecondaryAxis = self->mSecondaryAxis;
  if (mSecondaryAxis) {
    [(EMChartMapper *)self _addUnitAxis:mSecondaryAxis series:self->mMainSeries state:v32 toDescription:v33];
  }
LABEL_43:
  PDFDataWithFormatterCallback = (void *)OIChartingCreatePDFDataWithFormatterCallback();

  return PDFDataWithFormatterCallback;
}

- (void)addTitleToDescription:(id)a3 withState:(id)a4
{
  id v25 = a3;
  v5 = [(CHDChart *)self->mChart title];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 lastCachedName];
    v8 = [v7 string];

    if (v8)
    {
      v9 = [MEMORY[0x263EFF9A0] dictionary];
      [v9 setValue:v8 forKey:*MEMORY[0x263F62668]];
      v10 = [v6 lastCachedName];
      v11 = [v10 runs];

      if ([v11 count])
      {
        char v12 = [v11 objectAtIndex:0];
        id v13 = [v12 font];
        uint64_t v14 = [v13 color];
        uint64_t v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 CGColor];
          [v9 setValue:v16 forKey:*MEMORY[0x263F62748]];
        }
      }
      v17 = [v6 graphicProperties];
      if ([v17 hasFill]
        && ([v17 fill], v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
      {
        uint64_t v23 = [v17 fill];
        v24 = +[CMColorProperty copyCGColorFromOADFill:v23 state:self->mState];
      }
      else
      {
        LODWORD(v18) = 1.0;
        LODWORD(v19) = 1.0;
        LODWORD(v20) = 1.0;
        LODWORD(v21) = 1.0;
        v24 = +[EMChartMapper newColorWithCalibratedRed:v18 green:v19 blue:v20 alpha:v21];
      }
      [v9 setValue:v24 forKey:*MEMORY[0x263F62658]];
      CGColorRelease(v24);
      [v25 setValue:v9 forKey:*MEMORY[0x263F62750]];
    }
  }
}

+ (CGColor)newColorWithCalibratedRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v11 = CGColorCreate(DeviceRGB, components);
  CFRelease(DeviceRGB);
  return v11;
}

- (void)addBackgroundToDescription:(id)a3 withState:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  id v7 = [(CHDChart *)self->mChart plotArea];
  v8 = [v7 graphicProperties];
  if (v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    if ([v6 isOffice12]) {
      float v10 = 0.0;
    }
    else {
      float v10 = 1.0;
    }
    if ([v8 hasFill]
      && ([v8 fill], uint64_t v15 = objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      uint64_t v16 = [v8 fill];
      v17 = +[CMColorProperty copyCGColorFromOADFill:v16 state:self->mState];
    }
    else
    {
      LODWORD(v11) = 1.0;
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 1.0;
      *(float *)&double v14 = v10;
      v17 = +[EMChartMapper newColorWithCalibratedRed:v11 green:v12 blue:v13 alpha:v14];
    }
    [v9 setValue:v17 forKey:*MEMORY[0x263F62658]];
    CGColorRelease(v17);
    *(float *)&double v18 = v10;
    double v19 = +[EMChartMapper newColorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:v18];
    [v9 setValue:v19 forKey:*MEMORY[0x263F62738]];
    CGColorRelease(v19);
    [v35 setValue:v9 forKey:*MEMORY[0x263F626A8]];
  }
  double v20 = [(CHDChart *)self->mChart chartAreaGraphicProperties];
  if (v20)
  {
    double v21 = [MEMORY[0x263EFF9A0] dictionary];
    if ([v20 hasFill]
      && ([v20 fill], v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
    {
      uint64_t v23 = [v20 fill];
      v24 = +[CMColorProperty copyCGColorFromOADFill:v23 state:self->mState];
    }
    else
    {
      int v25 = [v6 isOffice12];
      LODWORD(v29) = 0.5;
      if (v25) {
        *(float *)&double v29 = 1.0;
      }
      LODWORD(v28) = 1.0;
      LODWORD(v26) = LODWORD(v29);
      LODWORD(v27) = LODWORD(v29);
      v24 = +[EMChartMapper newColorWithCalibratedRed:v29 green:v26 blue:v27 alpha:v28];
    }
    [v21 setValue:v24 forKey:*MEMORY[0x263F62658]];
    CGColorRelease(v24);
    LODWORD(v30) = 1064514355;
    LODWORD(v31) = 1.0;
    LODWORD(v32) = 1064514355;
    LODWORD(v33) = 1064514355;
    long long v34 = +[EMChartMapper newColorWithCalibratedRed:v30 green:v32 blue:v33 alpha:v31];
    [v21 setValue:v34 forKey:*MEMORY[0x263F62738]];
    CGColorRelease(v34);
    [v35 setValue:v21 forKey:*MEMORY[0x263F62640]];
  }
}

- (void)addLegendToDescription:(id)a3 chartSize:(CGSize)a4 withState:(id)a5
{
  id v18 = a3;
  id v6 = [(CHDChart *)self->mChart legend];
  id v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 legendPosition] - 1;
    if (v8 >= 4) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = dword_238EF15A0[v8];
    }
    float v10 = [MEMORY[0x263EFF9A0] dictionary];
    double v11 = [NSNumber numberWithInt:v9];
    [v10 setValue:v11 forKey:*MEMORY[0x263F62678]];

    double v12 = [v7 font];
    double v13 = [v12 color];
    double v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 CGColor];
      [v10 setValue:v15 forKey:*MEMORY[0x263F62748]];
    }
    else
    {
      uint64_t v16 = +[OITSUColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      uint64_t v17 = [v16 CGColor];
      [v10 setValue:v17 forKey:*MEMORY[0x263F62748]];
    }
    [v18 setValue:v10 forKey:*MEMORY[0x263F62670]];
  }
}

- (void)_addCategoryAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6
{
  id v49 = a3;
  id v46 = a4;
  id v9 = a5;
  id v48 = a6;
  v50 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  self->mHasDateCategory = objc_opt_isKindOfClass() & 1;
  v44 = [v49 contentFormat];
  float v10 = [v44 formatString];
  double v11 = [v10 string];

  v47 = v11;
  if (!v11
    || (char v12 = [(__CFString *)v11 isEqualToString:@"General"], v13 = v11, (v12 & 1) != 0))
  {
    if (!self->mHasDateCategory) {
      goto LABEL_8;
    }
    double v13 = @"GenericDate";
  }
  v51 = +[EMNumberFormatter formatterForFormat:v13];
  if (!self->mHasDateCategory) {
    goto LABEL_9;
  }
  double v14 = [NSNumber numberWithInt:2];
  [v50 setValue:v14 forKey:*MEMORY[0x263F62618]];

  if (v51)
  {
    objc_msgSend(v50, "setValue:forKey:");
    goto LABEL_9;
  }
LABEL_8:
  v51 = 0;
LABEL_9:
  v45 = [v46 categoryData];
  v55 = [v45 dataValues];
  uint64_t v15 = objc_opt_new();
  if ([v55 count])
  {
    uint64_t v16 = [v55 count];
    if (v16 >= 1)
    {
      for (uint64_t i = 0; v16 != i; ++i)
      {
        id v18 = [v55 dataValueAtIndex:i];
        EDValue::EDValue(&v58, (const EDValue *)[v18 value]);

        int SInt32 = CsLeReadSInt32((unsigned int *)&v58);
        if (self->mHasDateCategory)
        {
          double v20 = [(EMChartMapper *)self dateFromXlDateTimeNumber:EDValue::numberValue(&v58)];
          double v21 = NSNumber;
          [v20 timeIntervalSinceReferenceDate];
          v22 = objc_msgSend(v21, "numberWithDouble:");
          [v15 addObject:v22];
        }
        else
        {
          if (SInt32 == 3)
          {
            double v20 = EDValue::nsStringValue(&v58);
            if (v20) {
              [v15 addObject:v20];
            }
            goto LABEL_15;
          }
          if (SInt32 != 2) {
            goto LABEL_16;
          }
          if (v51)
          {
            double v23 = EDValue::numberValue(&v58);
            double v20 = [(CHDChart *)self->mChart workbook];
            [v51 formatValue:v20 inWorkbook:v23];
          }
          else
          {
            double v20 = [NSNumber numberWithDouble:EDValue::numberValue(&v58)];
            [v20 description];
          v22 = };
          [v15 addObject:v22];
        }

LABEL_15:
LABEL_16:
        EDValue::~EDValue(&v58);
      }
    }
  }
  else
  {
    v43 = [v45 formula];
    v24 = [v43 references];
    uint64_t v53 = [v24 count];
    if (v53 >= 1)
    {
      uint64_t v25 = 0;
      v52 = v24;
      do
      {
        double v26 = [v24 objectAtIndex:v25];
        v56 = [v9 document];
        v54 = objc_msgSend(v56, "sheetAtIndex:", objc_msgSend(v26, "sheetIndex"));
        double v27 = [v54 rowBlocks];
        for (uint64_t j = [v26 firstColumn];
              (int)j <= (int)[v26 lastColumn];
              uint64_t j = (j + 1))
        {
          for (uint64_t k = [v26 firstRow]; (int)k <= (int)objc_msgSend(v26, "lastRow"); uint64_t k = (k + 1))
          {
            double v30 = (const EDCellHeader *)[v27 cellWithRowNumber:k columnNumber:j];
            double v31 = [v9 resources];
            double v32 = stringValueForEDCell(v30, v31);

            uint64_t v33 = [v32 string];
            long long v34 = (void *)v33;
            if (v33) {
              id v35 = (__CFString *)v33;
            }
            else {
              id v35 = &stru_26EBF24D8;
            }
            [v15 addObject:v35];
          }
        }

        ++v25;
        v24 = v52;
      }
      while (v25 != v53);
    }
  }
  [v50 setValue:v15 forKey:*MEMORY[0x263F62600]];
  long long v36 = [v49 font];
  long long v37 = [v36 color];
  v38 = v37;
  if (v37)
  {
    uint64_t v39 = [v37 CGColor];
    [v50 setValue:v39 forKey:*MEMORY[0x263F62748]];
  }
  uint64_t v40 = *MEMORY[0x263F625F8];
  v41 = [v48 objectForKey:*MEMORY[0x263F625F8]];
  if (!v41)
  {
    v41 = [MEMORY[0x263EFF9A0] dictionary];
    [v48 setValue:v41 forKey:v40];
  }
  if (self->mIsHorizontal) {
    v42 = (void *)MEMORY[0x263F62628];
  }
  else {
    v42 = (void *)MEMORY[0x263F62620];
  }
  [v41 setValue:v50 forKey:*v42];
}

- (void)_addStandardSeries:(id)a3 toDescription:(id)a4 withState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v127 = a5;
  v118 = v7;
  int v9 = [v7 isDateTimeFormattingFlag];
  v117 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = *MEMORY[0x263F626E0];
  v109 = v8;
  v112 = [v8 valueForKey:*MEMORY[0x263F626E0]];
  if (!v112)
  {
    v112 = [MEMORY[0x263EFF980] array];
    [v8 setValue:v112 forKey:v10];
  }
  [v112 addObject:v117];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = (void *)MEMORY[0x263F626B0];
LABEL_5:
    [v117 setValue:*v11 forKey:*MEMORY[0x263F62710]];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v117 setValue:*MEMORY[0x263F62638] forKey:*MEMORY[0x263F62710]];
    int v12 = 0;
    int v13 = 1;
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v20 = [v7 chartType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v22 = (void *)MEMORY[0x263F625D0];
    }
    else
    {
      v83 = [v118 chartType];
      int v84 = [v83 isDoughnutType];

      v22 = (void *)MEMORY[0x263F626A0];
      if (v84) {
        v22 = (void *)MEMORY[0x263F62650];
      }
    }
    [v117 setValue:*v22 forKey:*MEMORY[0x263F62710]];
    v85 = [v118 dataValuePropertiesCollection];
    if ([v85 count])
    {
      v86 = [v85 objectAtIndex:0];
      if (objc_opt_respondsToSelector())
      {
        v87 = NSNumber;
        int v88 = [v86 explosion];
        if (v88 >= 0) {
          int v89 = v88;
        }
        else {
          int v89 = v88 + 1;
        }
        v90 = [v87 numberWithInt:(v89 >> 1)];
        [v117 setValue:v90 forKey:*MEMORY[0x263F62700]];
      }
    }

LABEL_6:
    int v12 = 0;
    int v13 = 0;
    if (!v9) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      if (self->mIsStacked)
      {
        double v11 = (void *)MEMORY[0x263F62730];
        goto LABEL_5;
      }
      BOOL mIsPercentStacked = self->mIsPercentStacked;
      v106 = (void *)MEMORY[0x263F62698];
      v107 = (void *)MEMORY[0x263F62680];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (self->mIsHorizontal)
        {
          if (self->mIsStacked)
          {
            double v11 = (void *)MEMORY[0x263F625D8];
            goto LABEL_5;
          }
          BOOL mIsPercentStacked = self->mIsPercentStacked;
          v106 = (void *)MEMORY[0x263F625C0];
          v107 = (void *)MEMORY[0x263F625B0];
        }
        else
        {
          if (self->mIsStacked)
          {
            double v11 = (void *)MEMORY[0x263F625E0];
            goto LABEL_5;
          }
          BOOL mIsPercentStacked = self->mIsPercentStacked;
          v106 = (void *)MEMORY[0x263F625C8];
          v107 = (void *)MEMORY[0x263F625B8];
        }
      }
      else if (self->mIsHorizontal)
      {
        if (self->mIsStacked)
        {
          double v11 = (void *)MEMORY[0x263F62720];
          goto LABEL_5;
        }
        BOOL mIsPercentStacked = self->mIsPercentStacked;
        v106 = (void *)MEMORY[0x263F62688];
        v107 = (void *)MEMORY[0x263F62630];
      }
      else
      {
        if (self->mIsStacked)
        {
          double v11 = (void *)MEMORY[0x263F62728];
          goto LABEL_5;
        }
        BOOL mIsPercentStacked = self->mIsPercentStacked;
        v106 = (void *)MEMORY[0x263F62690];
        v107 = (void *)MEMORY[0x263F62648];
      }
    }
    if (mIsPercentStacked) {
      double v11 = v106;
    }
    else {
      double v11 = v107;
    }
    goto LABEL_5;
  }
  [v117 setValue:*MEMORY[0x263F62760] forKey:*MEMORY[0x263F62710]];
  int v13 = 0;
  int v12 = 1;
  if (!v9) {
    goto LABEL_18;
  }
LABEL_10:
  self->mHasPrimaryDateAxis = 1;
  double v14 = [NSNumber numberWithInt:2];
  [v117 setValue:v14 forKey:*MEMORY[0x263F62618]];

  uint64_t v15 = [v118 valueData];
  uint64_t v16 = [v15 contentFormat];

  uint64_t v17 = [v16 formatString];
  id v18 = [v17 string];

  if (v18 && ([v18 isEqualToString:@"General"] & 1) == 0)
  {
    double v19 = +[EMNumberFormatter formatterForFormat:v18];
    [v117 setValue:v19 forKey:*MEMORY[0x263F625E8]];
  }
  else
  {
    double v19 = +[EMNumberFormatter formatterForFormat:@"GenericDate"];
    [v117 setValue:v19 forKey:*MEMORY[0x263F625E8]];
  }

LABEL_18:
  v110 = [v118 categoryData];
  v111 = [v118 valueData];
  if (((v12 | v13) & 1) != 0 || self->mHasDateCategory)
  {
    v128 = [v110 dataValues];
    v131 = [MEMORY[0x263EFF980] array];
    if ([v128 count])
    {
      uint64_t v23 = [v128 count];
      if (v23)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          uint64_t v25 = [v128 dataValueAtIndex:i];
          EDValue::EDValue(&v134, (const EDValue *)[v25 value]);

          if (self->mHasDateCategory)
          {
            double v26 = [(EMChartMapper *)self dateFromXlDateTimeNumber:EDValue::numberValue(&v134)];
            double v27 = NSNumber;
            [v26 timeIntervalSinceReferenceDate];
            double v28 = objc_msgSend(v27, "numberWithDouble:");
            [v131 addObject:v28];
          }
          else
          {
            double v29 = EDValue::numberValue(&v134);
            if (v29 > 1.79769313e308) {
              double v29 = 1.79769313e308;
            }
            if (v29 < -1.79769313e308) {
              double v29 = -1.79769313e308;
            }
            double v26 = [NSNumber numberWithDouble:v29];
            [v131 addObject:v26];
          }

          EDValue::~EDValue(&v134);
        }
      }
      double v30 = v131;
    }
    else
    {
      double v30 = [MEMORY[0x263EFF980] array];

      v113 = [v110 formula];
      double v31 = [v113 references];
      uint64_t v119 = [v31 count];
      if (v119)
      {
        uint64_t v32 = 0;
        v115 = v31;
        do
        {
          uint64_t v121 = v32;
          uint64_t v33 = objc_msgSend(v31, "objectAtIndex:");
          v132 = [v127 document];
          v124 = objc_msgSend(v132, "sheetAtIndex:", objc_msgSend(v33, "sheetIndex"));
          long long v34 = [v124 rowBlocks];
          for (uint64_t j = [v33 firstColumn];
                (int)j <= (int)[v33 lastColumn];
                uint64_t j = (j + 1))
          {
            for (uint64_t k = [v33 firstRow]; (int)k <= (int)objc_msgSend(v33, "lastRow"); uint64_t k = (k + 1))
            {
              long long v37 = (EDCellHeader *)[v34 cellWithRowNumber:k columnNumber:j];
              v38 = v37;
              if (v37 && typeForEDCell(v37) == 2)
              {
                double v39 = numberValueForEDCell(v38);
                if (v39 > 1.79769313e308) {
                  double v39 = 1.79769313e308;
                }
                if (v39 < -1.79769313e308) {
                  double v39 = -1.79769313e308;
                }
                uint64_t v40 = [NSNumber numberWithDouble:v39];
                [v30 addObject:v40];
              }
            }
          }

          uint64_t v32 = v121 + 1;
          double v31 = v115;
        }
        while (v121 + 1 != v119);
      }
    }
    [v117 setValue:v30 forKey:*MEMORY[0x263F626B8]];
  }
  else
  {
    double v30 = 0;
    v128 = 0;
  }
  v41 = v128;
  v129 = [v111 dataValues];

  v133 = [MEMORY[0x263EFF980] array];

  if (![v129 count])
  {
    v108 = [v111 formula];
    id v49 = [v108 references];
    uint64_t v116 = [v49 count];
    if (!v116) {
      goto LABEL_81;
    }
    uint64_t v50 = 0;
    v114 = v49;
    while (1)
    {
      uint64_t v120 = v50;
      v51 = objc_msgSend(v49, "objectAtIndex:");
      v125 = [v127 document];
      v122 = objc_msgSend(v125, "sheetAtIndex:", objc_msgSend(v51, "sheetIndex"));
      v52 = [v122 rowBlocks];
      for (uint64_t m = [v51 firstColumn]; (int)m <= (int)objc_msgSend(v51, "lastColumn"); uint64_t m = (m + 1))
      {
        for (uint64_t n = [v51 firstRow]; (int)n <= (int)objc_msgSend(v51, "lastRow"); uint64_t n = (n + 1))
        {
          v55 = (EDCellHeader *)[v52 cellWithRowNumber:n columnNumber:m];
          v56 = v55;
          if (v9)
          {
            v57 = [(EMChartMapper *)self dateFromXlDateTimeNumber:numberValueForEDCell(v55)];
            EDValue v58 = NSNumber;
            [v57 timeIntervalSinceReferenceDate];
            v59 = objc_msgSend(v58, "numberWithDouble:");
            [v133 addObject:v59];

LABEL_76:
            continue;
          }
          if (typeForEDCell(v55))
          {
            double v60 = numberValueForEDCell(v56);
            if (v60 > 1.79769313e308) {
              double v60 = 1.79769313e308;
            }
            if (v60 < -1.79769313e308) {
              double v60 = -1.79769313e308;
            }
            v57 = [NSNumber numberWithDouble:v60];
            [v133 addObject:v57];
            goto LABEL_76;
          }
          [v133 addObject:&unk_26EC81218];
        }
      }

      uint64_t v50 = v120 + 1;
      id v49 = v114;
      if (v120 + 1 == v116)
      {
LABEL_81:

        goto LABEL_82;
      }
    }
  }
  uint64_t v42 = [v129 count];
  if (v42)
  {
    for (iuint64_t i = 0; ii != v42; ++ii)
    {
      v44 = [v129 dataValueAtIndex:ii];
      EDValue::EDValue(&v134, (const EDValue *)[v44 value]);

      if (v9)
      {
        v45 = [(EMChartMapper *)self dateFromXlDateTimeNumber:EDValue::numberValue(&v134)];
        id v46 = NSNumber;
        [v45 timeIntervalSinceReferenceDate];
        v47 = objc_msgSend(v46, "numberWithDouble:");
        [v133 addObject:v47];
      }
      else
      {
        double v48 = EDValue::numberValue(&v134);
        if (v48 > 1.79769313e308) {
          double v48 = 1.79769313e308;
        }
        if (v48 < -1.79769313e308) {
          double v48 = -1.79769313e308;
        }
        v45 = [NSNumber numberWithDouble:v48];
        [v133 addObject:v45];
      }

      EDValue::~EDValue(&v134);
    }
  }
LABEL_82:
  [v117 setValue:v133 forKey:*MEMORY[0x263F62718]];
  v61 = [v118 lastCachedName];
  v62 = v61;
  if (v61 && CsLeReadSInt32((unsigned int *)[v61 value]) == 3)
  {
    v63 = EDValue::EDValue(&v134, (const EDValue *)[v62 value]);
    v64 = EDValue::nsStringValue(v63);
    [v117 setValue:v64 forKey:*MEMORY[0x263F62668]];

    EDValue::~EDValue(&v134);
  }
  else
  {
    v65 = [v118 name];
    v66 = [v65 references];
    if ([v66 count])
    {
      v67 = [v66 objectAtIndex:0];
      v126 = [v127 document];
      v123 = objc_msgSend(v126, "sheetAtIndex:", objc_msgSend(v67, "sheetIndex"));
      v68 = [v123 rowBlocks];
      uint64_t v69 = [v67 firstColumn];
LABEL_87:
      if ((int)v69 <= (int)[v67 lastColumn])
      {
        for (juint64_t j = [v67 firstRow]; ; juint64_t j = (jj + 1))
        {
          if ((int)jj > (int)[v67 lastRow])
          {
            uint64_t v69 = (v69 + 1);
            goto LABEL_87;
          }
          v71 = (EDCellHeader *)[v68 cellWithRowNumber:jj columnNumber:v69];
          if (typeForEDCell(v71) == 3)
          {
            v72 = [v127 resources];
            v73 = stringValueForEDCell(v71, v72);

            v74 = [v73 string];
            if ([v74 length])
            {
              [v117 setValue:v74 forKey:*MEMORY[0x263F62668]];

              break;
            }
          }
        }
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    v75 = [v118 marker];
    if ([v75 size] && (int)objc_msgSend(v75, "style") >= 1)
    {
      v76 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v75, "size"));
      [v117 setValue:v76 forKey:*MEMORY[0x263F626F8]];

      v77 = [NSNumber numberWithInt:1];
      [v117 setValue:v77 forKey:*MEMORY[0x263F626F0]];

      v78 = [v75 graphicProperties];
      v79 = [v78 fill];

      if (v79)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v80 = +[OITSUColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
          v81 = (CGColor *)[v80 CGColor];
          v82 = v81;
          if (v81) {
            CGColorRetain(v81);
          }
        }
        else
        {
          v82 = +[CMColorProperty copyCGColorFromOADFill:v79 state:v127];
        }
        [v117 setValue:v82 forKey:*MEMORY[0x263F626E8]];
        CGColorRelease(v82);
      }
    }
  }
  v91 = [v118 defaultDataLabel];
  if ([v91 isShowValue])
  {
    v92 = [NSNumber numberWithBool:1];
    [v117 setValue:v92 forKey:*MEMORY[0x263F62708]];
  }
  v93 = [v118 errorBarYAxis];
  if (v93)
  {
    v94 = objc_opt_new();
    v95 = NSNumber;
    *(float *)&double v96 = (float)[v93 valueType];
    v97 = [v95 numberWithFloat:v96];
    [v94 setValue:v97 forKey:*MEMORY[0x263F626D8]];

    v98 = NSNumber;
    *(float *)&double v99 = (float)[v93 type];
    v100 = [v98 numberWithFloat:v99];
    [v94 setValue:v100 forKey:*MEMORY[0x263F626C8]];

    v101 = NSNumber;
    [v93 value];
    *(float *)&double v102 = v102;
    v103 = [v101 numberWithFloat:v102];
    [v94 setValue:v103 forKey:*MEMORY[0x263F626D0]];

    [v117 setValue:v94 forKey:*MEMORY[0x263F626C0]];
  }
  v104 = [v118 graphicProperties];
  [(EMChartMapper *)self _addGraphicProperties:v104 toDescription:v117 withState:v127];
}

- (void)_addGraphicProperties:(id)a3 toDescription:(id)a4 withState:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v23 hasStroke])
  {
    uint64_t v10 = [v23 stroke];
    double v11 = v10;
    if (v10)
    {
      int v12 = [v10 fill];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v23 fill];

        int v12 = (void *)v13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v14 = +[OITSUColor colorWithCalibratedRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        uint64_t v15 = (CGColor *)[v14 CGColor];
        uint64_t v16 = v15;
        if (v15) {
          CGColorRetain(v15);
        }
      }
      else
      {
        uint64_t v16 = +[CMColorProperty copyCGColorFromOADFill:v12 state:v9];
      }
      [v8 setValue:v16 forKey:*MEMORY[0x263F62738]];
      CGColorRelease(v16);
      uint64_t v17 = NSNumber;
      [v11 width];
      id v18 = objc_msgSend(v17, "numberWithFloat:");
      [v8 setValue:v18 forKey:*MEMORY[0x263F62740]];
    }
  }
  if ([v23 hasFill])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v19 = [v23 fill];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v20 = [(CMMapper *)self parent];
          double v21 = +[CMShapeRenderer copyImageFromOADImageFill:v19 withMapper:v20];

          if (v21)
          {
            [v8 setValue:v21 forKey:*MEMORY[0x263F62660]];
            CGImageRelease(v21);
          }
        }
        else if (v19)
        {
          v22 = +[CMColorProperty copyCGColorFromOADFill:v19 state:v9];
          [v8 setValue:v22 forKey:*MEMORY[0x263F62658]];
          CGColorRelease(v22);
        }
      }
    }
  }
}

- (void)_addUnitAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6
{
  id v30 = a3;
  id v8 = a6;
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = *MEMORY[0x263F625F8];
  double v11 = [v8 objectForKey:*MEMORY[0x263F625F8]];
  if (!v11)
  {
    double v11 = [MEMORY[0x263EFF9A0] dictionary];
    [v8 setValue:v11 forKey:v10];
  }
  if (self->mIsPercentStacked)
  {
    int v12 = [NSNumber numberWithInt:3];
    [v9 setValue:v12 forKey:*MEMORY[0x263F62618]];
  }
  else
  {
    if (!self->mHasPrimaryDateAxis) {
      goto LABEL_8;
    }
    int v12 = [NSNumber numberWithInt:2];
    [v9 setValue:v12 forKey:*MEMORY[0x263F62618]];
  }

LABEL_8:
  uint64_t v13 = [v30 majorGridLinesGraphicProperties];
  double v14 = [v13 stroke];
  uint64_t v15 = [v14 fill];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v17 = [NSNumber numberWithBool:1];
    [v9 setValue:v17 forKey:*MEMORY[0x263F625F0]];
  }
  if (([v30 isAutoMinimumValue] & 1) == 0)
  {
    id v18 = NSNumber;
    [v30 scalingMinimum];
    *(float *)&double v19 = v19;
    double v20 = [v18 numberWithFloat:v19];
    [v9 setValue:v20 forKey:*MEMORY[0x263F62610]];
  }
  if (([v30 isAutoMaximumValue] & 1) == 0)
  {
    double v21 = NSNumber;
    [v30 scalingMaximum];
    *(float *)&double v22 = v22;
    id v23 = [v21 numberWithFloat:v22];
    [v9 setValue:v23 forKey:*MEMORY[0x263F62608]];
  }
  v24 = [v30 font];
  uint64_t v25 = [v24 color];
  double v26 = v25;
  if (v25)
  {
    uint64_t v27 = [v25 CGColor];
    [v9 setValue:v27 forKey:*MEMORY[0x263F62748]];
  }
  unsigned int v28 = [v30 axisPosition];
  if (v28 >= 4) {
    double v29 = (void *)MEMORY[0x263F62628];
  }
  else {
    double v29 = (void *)qword_264D68B40[v28];
  }
  [v11 setValue:v9 forKey:*v29];
}

- (id)dateFromXlDateTimeNumber:(double)a3
{
  v4 = [(CHDChart *)self->mChart workbook];
  v5 = +[ECUtils dateFromXlDateTimeNumber:v4 edWorkbook:a3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSecondaryAxis, 0);
  objc_storeStrong((id *)&self->mPrimaryAxis, 0);
  objc_storeStrong((id *)&self->mBaseAxis, 0);
  objc_storeStrong((id *)&self->mMainSeries, 0);
  objc_storeStrong((id *)&self->mMainType, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mState, 0);
  objc_storeStrong((id *)&self->mChart, 0);
}

@end