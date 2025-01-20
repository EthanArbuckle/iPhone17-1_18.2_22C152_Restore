@interface CHPCachedValuesRetriever
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPCachedValuesRetriever

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v6 = [v3 formula];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 dataValues];
  v10 = [v8 formula];
  v22 = [v10 references];

  uint64_t v11 = [v9 count];
  CsData::CsData(&v25);
  v21 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v13 = +[EDReferenceIterator referenceIteratorWithReferenceArray:v22 workbook:WeakRetained];

  while (1)
  {
    v14 = (EDCellHeader *)objc_msgSend(v13, "nextCell", v21);
    v15 = v14;
    if (!v14) {
      break;
    }
    if (v11)
    {
      v16 = (uint64_t *)objc_msgSend(v9, "dataPointAtIndex:", objc_msgSend(v13, "currentCellIndex"));
      if (v16)
      {
LABEL_8:
        v17 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
        v18 = styleForEDCell(v15, v17);

        if (v18)
        {
          v19 = [v18 contentFormat];

          if (v19)
          {
            v20 = [v18 contentFormat];
            v16[3] = [v20 formatId];
          }
        }
        if (!v11) {
          [v9 addDataPoint:v16];
        }
      }
    }
    else if (typeForEDCell(v14))
    {
      EDValue::makeFromCell((EDValue *)v15, (uint64_t)&v23);
      EDValue::operator=((uint64_t)&v25, &v23.type);
      EDValue::~EDValue(&v23);
      uint64_t v24 = [v13 currentCellIndex];
      uint64_t v26 = 0;
      v16 = &v24;
      goto LABEL_8;
    }
  }

  EDValue::~EDValue((EDValue *)&v25);
}

@end