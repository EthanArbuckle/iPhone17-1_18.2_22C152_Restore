@interface CHPSeriesValueSynthesizer
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPSeriesValueSynthesizer

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 valueData];
    if ([v5 isEmpty])
    {
      char v6 = 0;
    }
    else
    {
      v7 = [v4 categoryData];
      char v6 = [v7 isEmpty];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v5 = a3;
  char v6 = [v5 valueData];
  v7 = [v5 categoryData];
  if (!v7)
  {
    v8 = [CHDData alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    v7 = [(CHDData *)v8 initWithResources:WeakRetained];

    [v5 setCategoryData:v7];
  }
  if ([(CHDData *)v7 isEmpty])
  {
    v10 = [(CHDData *)v7 dataValues];
    unint64_t v11 = [v6 countOfCellsBeingReferenced];
    if (v11)
    {
      unint64_t v12 = 1;
      do
      {
        CsData::CsData(&v16);
        unint64_t v15 = v12 - 1;
        EDValue::makeWithNumber(v13, (double)v12, (uint64_t)&v14);
        EDValue::operator=((uint64_t)&v16, &v14.type);
        EDValue::~EDValue(&v14);
        uint64_t v17 = -1;
        [v10 addDataPoint:&v15];
        EDValue::~EDValue((EDValue *)&v16);
        ++v12;
      }
      while (v12 <= v11);
    }
    [v10 finishReading];
  }
}

@end