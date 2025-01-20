@interface CHPSeriesDateTimeFormatting
- (BOOL)isDateTimeFomrattingInData:(id)a3;
- (BOOL)isDateTimeFormattingInContentFormatString:(id)a3 edCell:(EDCellHeader *)a4;
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation CHPSeriesDateTimeFormatting

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v6 = [v4 valueData];
      if ([v6 isEmpty])
      {
        v8 = [v4 categoryData];
        int v7 = [v8 isEmpty] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      v6 = [v4 valueData];
      int v7 = [v6 isEmpty] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [v7 valueData];
  if (([v5 isEmpty] & 1) == 0) {
    objc_msgSend(v7, "setDateTimeFormattingFlag:", -[CHPSeriesDateTimeFormatting isDateTimeFomrattingInData:](self, "isDateTimeFomrattingInData:", v5));
  }
  if (([v7 isDateTimeFormattingFlag] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v7 categoryData];
      if (([v6 isEmpty] & 1) == 0) {
        objc_msgSend(v7, "setDateTimeFormattingFlag:", -[CHPSeriesDateTimeFormatting isDateTimeFomrattingInData:](self, "isDateTimeFomrattingInData:", v6));
      }
    }
  }
}

- (BOOL)isDateTimeFomrattingInData:(id)a3
{
  id v4 = a3;
  if ([v4 isEmpty]) {
    goto LABEL_2;
  }
  v6 = [v4 contentFormat];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 formatString];
    BOOL v5 = [(CHPSeriesDateTimeFormatting *)self isDateTimeFormattingInContentFormatString:v8 edCell:0];
LABEL_10:

    goto LABEL_11;
  }
  v9 = [v4 formula];

  if (v9)
  {
    v10 = [v4 formula];
    v8 = [v10 references];

    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    v12 = +[EDReferenceIterator referenceIteratorWithReferenceArray:v8 workbook:WeakRetained];

    v13 = (EDCellHeader *)[v12 nextCell];
    if (v13)
    {
      v14 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
      v15 = styleForEDCell(v13, v14);
      uint64_t v16 = [v15 contentFormat];

      id v7 = (void *)v16;
    }
    else
    {
      id v7 = 0;
    }
    v17 = [v7 formatString];
    BOOL v5 = [(CHPSeriesDateTimeFormatting *)self isDateTimeFormattingInContentFormatString:v17 edCell:v13];

    goto LABEL_10;
  }
LABEL_2:
  BOOL v5 = 0;
LABEL_11:

  return v5;
}

- (BOOL)isDateTimeFormattingInContentFormatString:(id)a3 edCell:(EDCellHeader *)a4
{
  v6 = (EDString *)a3;
  double v7 = 1.0;
  if (a4 && typeForEDCell(a4) == 2) {
    double v7 = numberValueForEDCell(a4);
  }
  id WeakRetained = (EDWorkbook *)objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v9 = (XlFormatSection *)xlSectionForNumberWithFormatting(v7, v6, WeakRetained);

  if (v9)
  {
    BOOL v10 = *((unsigned char *)v9 + 2) != 0;
    XlFormatSection::~XlFormatSection(v9);
    MEMORY[0x23EC997B0]();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end