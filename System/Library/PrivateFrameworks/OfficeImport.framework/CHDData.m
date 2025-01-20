@interface CHDData
+ (CHDData)dataWithDataPointCount:(unint64_t)a3 resources:(id)a4;
+ (CHDData)dataWithResources:(id)a3;
- (BOOL)isEmpty;
- (CGPoint)minMaxValues;
- (CHDData)initWithDataPointCount:(unint64_t)a3 resources:(id)a4;
- (CHDData)initWithResources:(id)a3;
- (id)contentFormat;
- (id)dataValues;
- (id)description;
- (id)firstValueContentFormatWithWorkbook:(id)a3;
- (id)formula;
- (unint64_t)averageDataPointDecimalCount;
- (unint64_t)contentFormatId;
- (unint64_t)countOfCellsBeingReferenced;
- (unint64_t)dataValueIndexCount;
- (void)setContentFormat:(id)a3;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setDataValueIndexCount:(unint64_t)a3;
- (void)setFormula:(id)a3 chart:(id)a4;
@end

@implementation CHDData

+ (CHDData)dataWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return (CHDData *)v4;
}

- (CHDData)initWithResources:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHDData;
  v5 = [(CHDData *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v7 = objc_alloc_init(CHDDataValuesCollection);
    mDataValues = v6->mDataValues;
    v6->mDataValues = v7;

    *(_OWORD *)&v6->mContentFormatId = xmmword_238EDF070;
  }

  return v6;
}

- (id)formula
{
  return self->mFormula;
}

- (id)dataValues
{
  return self->mDataValues;
}

+ (CHDData)dataWithDataPointCount:(unint64_t)a3 resources:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDataPointCount:a3 resources:v5];

  return (CHDData *)v6;
}

- (CHDData)initWithDataPointCount:(unint64_t)a3 resources:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHDData;
  v7 = [(CHDData *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mResources, v6);
    v9 = [[CHDDataValuesCollection alloc] initWithDataPointCount:a3];
    mDataValues = v8->mDataValues;
    v8->mDataValues = v9;

    *(_OWORD *)&v8->mContentFormatId = xmmword_238EDF070;
  }

  return v8;
}

- (void)setFormula:(id)a3 chart:(id)a4
{
  v11 = (CHDFormula *)a3;
  id v7 = a4;
  mFormula = self->mFormula;
  p_mFormula = &self->mFormula;
  if (mFormula != v11)
  {
    objc_storeStrong((id *)p_mFormula, a3);
    if (*p_mFormula)
    {
      objc_super v10 = [v7 processors];
      [v10 markObject:v11 processor:objc_opt_class()];
    }
  }
}

- (void)setDataValueIndexCount:(unint64_t)a3
{
  self->mDataValueIndexCount = a3;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (BOOL)isEmpty
{
  mFormula = self->mFormula;
  return (!mFormula || ![(EDFormula *)mFormula isSupportedFormula])
      && [(CHDData *)self dataValueIndexCount] == 0;
}

- (id)contentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained contentFormats];
  id v5 = [v4 objectWithKey:self->mContentFormatId];

  return v5;
}

- (unint64_t)dataValueIndexCount
{
  unint64_t v3 = [(CHDDataValuesCollection *)self->mDataValues count];
  unint64_t result = self->mDataValueIndexCount;
  if (v3 > result)
  {
    unint64_t result = [(CHDDataValuesCollection *)self->mDataValues count];
    self->mDataValueIndexCount = result;
  }
  return result;
}

- (unint64_t)countOfCellsBeingReferenced
{
  unint64_t v3 = [(CHDFormula *)self->mFormula references];

  if (v3)
  {
    mFormula = self->mFormula;
    return [(CHDFormula *)mFormula countOfCellsBeingReferenced];
  }
  else
  {
    return [(CHDData *)self dataValueIndexCount];
  }
}

- (void)setContentFormat:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [v8 formatId];
  if (v4 == -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    id v6 = [WeakRetained contentFormats];

    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "addOrEquivalentObject:", v8));
    self->mContentFormatId = [v7 formatId];
  }
  else
  {
    self->mContentFormatId = v4;
  }
}

- (CGPoint)minMaxValues
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  unint64_t v5 = [(CHDDataValuesCollection *)self->mDataValues count];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    double v8 = 2.22507386e-308;
    double v9 = 2.22507386e-308;
    while (1)
    {
      objc_super v10 = [(CHDDataValuesCollection *)self->mDataValues dataPointAtIndex:v7];
      if (v10)
      {
        p_value = &v10->value;
        if (CsLeReadSInt32((unsigned int *)&v10->value) == 2)
        {
          double v12 = EDValue::numberValue(p_value);
          if (v9 == 2.22507386e-308 && v8 == 2.22507386e-308)
          {
            double v9 = v12;
          }
          else if (v12 <= v8)
          {
            if (v12 < v9) {
              double v9 = v12;
            }
            goto LABEL_10;
          }
          double v8 = v12;
        }
      }
LABEL_10:
      if (v6 == ++v7) {
        goto LABEL_15;
      }
    }
  }
  double v9 = 2.22507386e-308;
  double v8 = 2.22507386e-308;
LABEL_15:
  BOOL v13 = v9 != 2.22507386e-308;
  BOOL v14 = v8 != 2.22507386e-308;
  if (v13 && v14) {
    double v15 = v9;
  }
  else {
    double v15 = v3;
  }
  if (v13 && v14) {
    double v16 = v8;
  }
  else {
    double v16 = v4;
  }
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)averageDataPointDecimalCount
{
  unint64_t result = [(CHDDataValuesCollection *)self->mDataValues count];
  if (result)
  {
    unint64_t v4 = result;
    unint64_t v5 = 0;
    unint64_t v17 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(CHDDataValuesCollection *)self->mDataValues dataPointAtIndex:i];
      if (v7)
      {
        p_value = &v7->value;
        if (CsLeReadSInt32((unsigned int *)&v7->value) == 2)
        {
          double v9 = [NSNumber numberWithDouble:EDValue::numberValue(p_value)];
          objc_super v10 = [v9 stringValue];

          uint64_t v11 = [v10 rangeOfString:@"."];
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = [v10 length];
            unint64_t v13 = v12 + ~v11;
            if (v13 >= 0xF)
            {
              BOOL v14 = objc_msgSend(v10, "substringWithRange:", 0, objc_msgSend(v10, "length") - 1);

              if ([v14 hasSuffix:@"0"])
              {
                unint64_t v13 = v12 - v11 - 2;
                while ([v14 hasSuffix:@"0"])
                {
                  uint64_t v15 = objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 1);

                  --v13;
                  BOOL v14 = (void *)v15;
                }
              }
              else if ([v14 hasSuffix:@"9"])
              {
                while ([v14 hasSuffix:@"9"])
                {
                  uint64_t v16 = objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 1);

                  --v13;
                  BOOL v14 = (void *)v16;
                }
              }
              objc_super v10 = v14;
            }
            v5 += v13;
          }
          ++v17;
        }
      }
    }
    if (v17) {
      return vcvtas_u32_f32((float)v5 / (float)v17);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)firstValueContentFormatWithWorkbook:(id)a3
{
  id v4 = a3;
  mFormula = self->mFormula;
  if (mFormula)
  {
    unint64_t v6 = [(CHDFormula *)mFormula references];

    if (v6)
    {
      uint64_t v7 = [(CHDFormula *)self->mFormula references];
      double v8 = +[EDReferenceIterator referenceIteratorWithReferenceArray:v7 workbook:v4];

      double v9 = (CHDDataPoint *)[v8 nextCell];
      if (!v9)
      {
LABEL_9:

        goto LABEL_11;
      }
      id WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->mResources);
      uint64_t v11 = styleForEDCell((EDCellHeader *)v9, WeakRetained);
      double v9 = [v11 contentFormat];

LABEL_8:
      goto LABEL_9;
    }
  }
  if ([(CHDDataValuesCollection *)self->mDataValues count])
  {
    double v9 = [(CHDDataValuesCollection *)self->mDataValues dataPointAtIndex:0];
    if (!v9) {
      goto LABEL_11;
    }
    double v8 = objc_loadWeakRetained((id *)&self->mResources);
    id WeakRetained = [v8 contentFormats];
    double v9 = [(EDResources *)WeakRetained objectWithKey:v9->contentFormatId];
    goto LABEL_8;
  }
  double v9 = 0;
LABEL_11:

  return v9;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDData;
  v2 = [(CHDData *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong((id *)&self->mDataValues, 0);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end