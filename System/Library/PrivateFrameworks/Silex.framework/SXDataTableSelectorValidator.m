@interface SXDataTableSelectorValidator
- (BOOL)validateCellSelector:(id)a3 forIndexPath:(id)a4;
- (BOOL)validateColumnSelector:(id)a3 forColumnIndex:(unint64_t)a4;
- (BOOL)validateRowSelector:(id)a3 forRowIndex:(unint64_t)a4;
- (SXDataRecordStore)recordStore;
- (SXDataTableSelectorValidator)initWithRecordStore:(id)a3 dataOrientation:(unint64_t)a4;
- (id)conditionEngineForSelector:(id)a3 forIndexPath:(id)a4;
- (id)descriptorForIndexPath:(id)a3;
- (unint64_t)dataOrientation;
@end

@implementation SXDataTableSelectorValidator

- (SXDataTableSelectorValidator)initWithRecordStore:(id)a3 dataOrientation:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXDataTableSelectorValidator;
  v8 = [(SXDataTableSelectorValidator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recordStore, a3);
    v9->_dataOrientation = a4;
  }

  return v9;
}

- (BOOL)validateRowSelector:(id)a3 forRowIndex:(unint64_t)a4
{
  if (a4 == -1) {
    return 0;
  }
  unint64_t v4 = a4;
  id v6 = a3;
  id v7 = -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v6, v4, -1);
  objc_msgSend(v7, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v6, "even"), v4);
  uint64_t v8 = [v6 odd];

  [v7 addConditionForOddBoolean:v8 withInteger:v4];
  LOBYTE(v4) = [v7 isValid];

  return v4;
}

- (BOOL)validateColumnSelector:(id)a3 forColumnIndex:(unint64_t)a4
{
  if (a4 == -1) {
    return 0;
  }
  unint64_t v4 = a4;
  id v6 = a3;
  id v7 = -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v6, -1, v4);
  objc_msgSend(v7, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v6, "even"), v4);
  uint64_t v8 = [v6 odd];

  [v7 addConditionForOddBoolean:v8 withInteger:v4];
  LOBYTE(v4) = [v7 isValid];

  return v4;
}

- (BOOL)validateCellSelector:(id)a3 forIndexPath:(id)a4
{
  if (a4.var0 == -1) {
    return 0;
  }
  unint64_t var1 = a4.var1;
  if (a4.var1 == -1) {
    return 0;
  }
  unint64_t var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = -[SXDataTableSelectorValidator conditionEngineForSelector:forIndexPath:](self, "conditionEngineForSelector:forIndexPath:", v7, var0, var1);
  objc_msgSend(v8, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v7, "evenRows"), var0);
  objc_msgSend(v8, "addConditionForEvenBoolean:withInteger:", objc_msgSend(v7, "evenColumns"), var1);
  objc_msgSend(v8, "addConditionForOddBoolean:withInteger:", objc_msgSend(v7, "oddRows"), var0);
  uint64_t v9 = [v7 oddColumns];

  [v8 addConditionForOddBoolean:v9 withInteger:var1];
  char v10 = [v8 isValid];

  return v10;
}

- (id)conditionEngineForSelector:(id)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = -[SXDataTableSelectorValidator descriptorForIndexPath:](self, "descriptorForIndexPath:", var0, var1);
  uint64_t v9 = +[SXDataTableConditionEngine engine];
  objc_msgSend(v9, "addConditionForEqualInteger:withInteger:", objc_msgSend(v7, "columnIndex"), var1);
  objc_msgSend(v9, "addConditionForEqualInteger:withInteger:", objc_msgSend(v7, "rowIndex"), var0);
  char v10 = [v7 descriptor];

  objc_super v11 = [v8 identifier];
  [v9 addConditionForEqualString:v10 withString:v11];

  return v9;
}

- (id)descriptorForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  unint64_t v6 = [(SXDataTableSelectorValidator *)self dataOrientation];
  if (v6 == 1)
  {
    unint64_t var1 = var0;
  }
  else if (v6)
  {
    goto LABEL_8;
  }
  if (var1 != -1)
  {
    id v7 = [(SXDataTableSelectorValidator *)self recordStore];
    uint64_t v8 = [v7 descriptors];
    unint64_t v9 = [v8 count];

    if (var1 < v9)
    {
      char v10 = [(SXDataTableSelectorValidator *)self recordStore];
      objc_super v11 = [v10 descriptors];
      v12 = [v11 objectAtIndex:var1];

      goto LABEL_9;
    }
  }
LABEL_8:
  v12 = 0;
LABEL_9:
  return v12;
}

- (SXDataRecordStore)recordStore
{
  return self->_recordStore;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (void).cxx_destruct
{
}

@end