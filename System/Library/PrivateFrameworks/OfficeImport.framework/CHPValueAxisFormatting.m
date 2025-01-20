@interface CHPValueAxisFormatting
- (BOOL)isObjectSupported:(id)a3;
- (BOOL)isPercentageFormattingInContentFormatString:(id)a3 edValue:(EDValue *)a4;
- (id)dataPointFormattingInData:(id)a3;
- (id)dataPointFormattingInSeriesCollection:(id)a3;
- (id)dataPointFormattingInSources:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPValueAxisFormatting

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v19 = v6;
  v7 = [v19 axes];
  v8 = 0;
  v9 = 0;
  unsigned int v10 = 0;
  while (1)
  {
    unsigned int v11 = v10;
    if (objc_msgSend(v7, "count", v18) <= (unint64_t)v10) {
      break;
    }
    v12 = [v7 objectAtIndex:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;

      v14 = [v13 contentFormat];

      if (v14)
      {
        v15 = [v14 formatString];
        objc_msgSend(v13, "setPercentageFormattingFlag:", -[CHPValueAxisFormatting isPercentageFormattingInContentFormatString:edValue:](self, "isPercentageFormattingInContentFormatString:edValue:", v15, 0));
      }
    }
    else
    {
      id v13 = v8;
      v14 = v9;
    }

    unsigned int v10 = v11 + 1;
    v8 = v13;
    v9 = v14;
  }
  if (v8 && !v9)
  {
    if ([v8 isPercentageFormattingFlag])
    {
      v9 = 0;
    }
    else
    {
      v16 = [v19 seriesCollection];
      v9 = [(CHPValueAxisFormatting *)self dataPointFormattingInSeriesCollection:v16];

      if (v9)
      {
        [v8 setContentFormat:v9];
        [v8 setIsContentFormatDerivedFromDataPoints:1];
        v17 = [v9 formatString];
        objc_msgSend(v8, "setPercentageFormattingFlag:", -[CHPValueAxisFormatting isPercentageFormattingInContentFormatString:edValue:](self, "isPercentageFormattingInContentFormatString:edValue:", v17, 0));
      }
    }
  }
}

- (id)dataPointFormattingInSeriesCollection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v5 count];
      if (v6)
      {
        id v7 = 0;
        uint64_t v8 = 0;
        while (1)
        {
          v9 = [v5 objectAtIndex:v8];
          unsigned int v10 = [v9 valueData];
          unsigned int v11 = [(CHPValueAxisFormatting *)self dataPointFormattingInData:v10];

          if (!v11) {
            break;
          }
          if (v7)
          {
            if (([v11 isEqual:v7] & 1) == 0) {
              break;
            }
          }
          else
          {
            id v7 = v11;
          }

          if (v6 == ++v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  id v7 = 0;
LABEL_14:

  return v7;
}

- (id)dataPointFormattingInData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 contentFormat];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(CHPValueAxisFormatting *)self dataPointFormattingInSources:v5];
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isPercentageFormattingInContentFormatString:(id)a3 edValue:(EDValue *)a4
{
  v5 = (EDString *)a3;
  double v6 = 1.0;
  if (a4 && CsLeReadSInt32((unsigned int *)a4) == 2) {
    double v6 = EDValue::numberValue(a4);
  }
  id v7 = (XlFormatSection *)xlSectionForNumberWithFormatting(v6, v5, 0);
  if (v7)
  {
    BOOL v8 = *((unsigned char *)v7 + 5) != 0;
    XlFormatSection::~XlFormatSection(v7);
    MEMORY[0x23EC997B0]();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)dataPointFormattingInSources:(id)a3
{
  id v4 = a3;
  v5 = [v4 dataValues];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = 0;
    id v8 = 0;
    while (1)
    {
      uint64_t v9 = [v5 dataPointAtIndex:v7];
      if (v9)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
        unsigned int v11 = [WeakRetained contentFormats];
        v12 = [v11 objectWithKey:*(void *)(v9 + 24)];

        if (!v12) {
          goto LABEL_14;
        }
        if (v8)
        {
          if (([v12 isEqual:v8] & 1) == 0)
          {
LABEL_14:

            id v13 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          id v8 = v12;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_13;
      }
    }
  }
  id v8 = 0;
LABEL_13:
  id v8 = v8;
  id v13 = v8;
LABEL_15:

  return v13;
}

@end