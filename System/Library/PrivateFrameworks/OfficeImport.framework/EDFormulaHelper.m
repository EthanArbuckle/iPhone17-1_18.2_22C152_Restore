@interface EDFormulaHelper
- (BOOL)isCurrentSheet:(id)a3;
- (EDFormulaHelper)initWithWorkbook:(id)a3 worksheet:(id)a4 rowNumber:(int)a5 columnNumber:(int)a6;
- (id)resolveTable:(id)a3;
- (id)workbook;
- (int)columnNumber;
- (int)resolveFunctionName:(id)a3;
- (int)rowNumber;
- (unint64_t)createIndexWithType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5;
- (unint64_t)resolveFile:(id)a3;
- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4;
- (unint64_t)resolveName:(id)a3;
- (unint64_t)resolveSheet:(id)a3;
- (unint64_t)resolveTableColumn:(id)a3 columnName:(id)a4;
- (unint64_t)resolveTableToSheetId:(id)a3;
@end

@implementation EDFormulaHelper

- (EDFormulaHelper)initWithWorkbook:(id)a3 worksheet:(id)a4 rowNumber:(int)a5 columnNumber:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EDFormulaHelper;
  v13 = [(EDFormulaHelper *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mWorkbook, a3);
    objc_storeStrong((id *)&v14->mWorksheet, a4);
    v14->mRowNumber = a5;
    v14->mColumnNumber = a6;
    uint64_t v15 = [v11 mappingContext];
    mMappingContext = v14->mMappingContext;
    v14->mMappingContext = (ECMappingContext *)v15;
  }
  return v14;
}

- (int)resolveFunctionName:(id)a3
{
  id v3 = a3;
  CsString::CsString(&v8);
  id v4 = v3;
  CsString::append(&v8, (const unsigned __int16 *)[v4 cStringUsingEncoding:10], objc_msgSend(v4, "length"));
  if (v8.var1) {
    var1 = v8.var1;
  }
  else {
    var1 = (unsigned __int16 *)&unk_238EDF6E8;
  }
  int v6 = XlFunctionIdForName(var1);
  CsString::~CsString(&v8);

  return v6;
}

- (unint64_t)resolveName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EDWorkbook *)self->mWorkbook indexOfSheet:self->mWorksheet];
  int v6 = [(EDWorkbook *)self->mWorkbook resources];
  v7 = [v6 names];

  uint64_t v8 = [v7 count];
  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      v10 = [v7 objectAtIndex:v9];
      id v11 = v10;
      if (v10)
      {
        id v12 = [v10 nameString];
        char v13 = [v12 isEqualToString:v4];

        if ((v13 & 1) != 0 && (![v11 sheetIndex] || v5 == objc_msgSend(v11, "sheetIndex"))) {
          break;
        }
      }

      if (v8 == ++v9) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    unint64_t v9 = -1;
  }

  return v9;
}

- (id)resolveTable:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = [(EDWorkbook *)self->mWorkbook sheetCount];
    if (v5)
    {
      uint64_t v6 = 0;
      while (1)
      {
        v7 = [(EDWorksheet *)self->mWorksheet tables];
        uint64_t v8 = [v7 count];

        if (v8) {
          break;
        }
LABEL_8:
        if (++v6 == v5) {
          goto LABEL_17;
        }
      }
      uint64_t v9 = 0;
      while (1)
      {
        v10 = [(EDWorksheet *)self->mWorksheet tables];
        id v11 = [v10 objectAtIndex:v9];

        id v12 = [v11 name];
        char v13 = [v12 isEqualToString:v4];

        if (v13) {
          goto LABEL_18;
        }

        if (v8 == ++v9) {
          goto LABEL_8;
        }
      }
    }
LABEL_17:
    id v11 = 0;
    goto LABEL_18;
  }
  v14 = [(EDWorksheet *)self->mWorksheet tables];
  uint64_t v15 = [v14 count];

  if (!v15) {
    goto LABEL_17;
  }
  uint64_t v16 = 0;
  while (1)
  {
    v17 = [(EDWorksheet *)self->mWorksheet tables];
    id v11 = [v17 objectAtIndex:v16];

    objc_super v18 = [v11 tableRange];
    int v19 = [v18 firstColumn];
    int mColumnNumber = self->mColumnNumber;
    if (v19 <= mColumnNumber && mColumnNumber <= (int)[v18 lastColumn])
    {
      int v21 = [v18 firstRow];
      int mRowNumber = self->mRowNumber;
      if (v21 <= mRowNumber && mRowNumber <= (int)[v18 lastRow]) {
        break;
      }
    }

    if (v15 == ++v16) {
      goto LABEL_17;
    }
  }

LABEL_18:
  return v11;
}

- (unint64_t)resolveSheet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ECMappingContext *)self->mMappingContext mappedSheetIndexForSheetName:v4];
  if (v5 == -1)
  {
    uint64_t v6 = [(EDWorkbook *)self->mWorkbook workbookName];
    char v7 = [v4 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      unint64_t v8 = -1;
      goto LABEL_5;
    }
    unint64_t v5 = 0;
  }
  unint64_t v8 = [(EDFormulaHelper *)self createIndexWithType:1 firstSheetIndex:v5 lastSheetIndex:v5];
LABEL_5:

  return v8;
}

- (unint64_t)createIndexWithType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  unint64_t v8 = [(EDWorkbook *)self->mWorkbook resources];
  uint64_t v9 = [v8 links];
  unint64_t v10 = [v9 addOrEquivalentLinkReferenceOfType:v7 firstSheetIndex:a4 lastSheetIndex:a5];

  return v10;
}

- (BOOL)isCurrentSheet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EDSheet *)self->mWorksheet name];
  uint64_t v6 = [v5 string];
  char v7 = [v6 isEqualToString:v4];

  return v7;
}

- (unint64_t)resolveTableToSheetId:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    char v7 = [(EDSheet *)self->mWorksheet name];
    id v12 = [v7 string];
    unint64_t v15 = [(EDFormulaHelper *)self resolveSheet:v12];
LABEL_13:

    goto LABEL_14;
  }
  unint64_t v5 = [(EDWorkbook *)self->mWorkbook sheetCount];
  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      char v7 = [(EDWorkbook *)self->mWorkbook sheetAtIndex:v6 loadIfNeeded:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v8 = [v7 tables];
        uint64_t v9 = [v8 count];

        if (v9) {
          break;
        }
      }
LABEL_9:

      if (++v6 == v5) {
        goto LABEL_10;
      }
    }
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [v7 tables];
      id v12 = [v11 objectAtIndex:v10];

      char v13 = [v12 name];
      int v14 = [v13 isEqualToString:v4];

      if (v14) {
        break;
      }

      if (v9 == ++v10) {
        goto LABEL_9;
      }
    }
    uint64_t v16 = [v7 name];
    v17 = [v16 string];
    unint64_t v15 = [(EDFormulaHelper *)self resolveSheet:v17];

    goto LABEL_13;
  }
LABEL_10:
  unint64_t v15 = -1;
LABEL_14:

  return v15;
}

- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ECMappingContext *)self->mMappingContext mappedSheetIndexForSheetName:a3];
  unint64_t v8 = [(ECMappingContext *)self->mMappingContext mappedSheetIndexForSheetName:v6];
  if (v7 == -1 || v8 == -1) {
    unint64_t v10 = -1;
  }
  else {
    unint64_t v10 = [(EDFormulaHelper *)self createIndexWithType:1 firstSheetIndex:v7 lastSheetIndex:v8];
  }

  return v10;
}

- (unint64_t)resolveFile:(id)a3
{
  return [(EDFormulaHelper *)self createIndexWithType:2 firstSheetIndex:65534 lastSheetIndex:65534];
}

- (unint64_t)resolveTableColumn:(id)a3 columnName:(id)a4
{
  id v5 = a4;
  id v6 = [a3 tableColumns];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v6 objectAtIndex:v8];
      unint64_t v10 = [v9 name];
      char v11 = [v10 isEqualToString:v5];

      if (v11) {
        break;
      }
      if (v7 == ++v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v8 = -1;
  }

  return v8;
}

- (id)workbook
{
  return self->mWorkbook;
}

- (int)rowNumber
{
  return self->mRowNumber;
}

- (int)columnNumber
{
  return self->mColumnNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMappingContext, 0);
  objc_storeStrong((id *)&self->mWorksheet, 0);
  objc_storeStrong((id *)&self->mWorkbook, 0);
}

@end