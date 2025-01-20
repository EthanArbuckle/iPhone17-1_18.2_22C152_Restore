@interface EFormula
+ (id)singletonEFormula;
+ (id)stringToFormula:(id)a3 formulaHelper:(id)a4 formulaClass:(Class)a5;
- (Class)formulaClass;
- (id)formulaHelper;
- (id)resolveTable:(const char *)a3 sheetIndex:(unint64_t *)a4;
- (id)stringToTokens:(id)a3;
- (id)tableData;
- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4;
- (unint64_t)resolveName:(const char *)a3;
- (unint64_t)resolveSheet:(const char *)a3 isCurrentSheet:(BOOL *)a4;
- (void)dealloc;
- (void)setFormula:(id)a3;
- (void)setFormulaClass:(Class)a3;
- (void)setFormulaHelper:(id)a3;
- (void)setTableData:(id)a3;
@end

@implementation EFormula

+ (id)stringToFormula:(id)a3 formulaHelper:(id)a4 formulaClass:(Class)a5
{
  v8 = (void *)[a1 singletonEFormula];
  [v8 setFormulaClass:a5];
  [v8 setFormulaHelper:a4];
  v9 = (void *)[v8 stringToTokens:a3];
  [v8 setFormulaHelper:0];
  return v9;
}

+ (id)singletonEFormula
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  id v3 = (id)[v2 objectForKey:@"EFormula"];
  if (!v3)
  {
    id v3 = objc_alloc_init((Class)objc_opt_class());
    [v2 setObject:v3 forKey:@"EFormula"];
  }
  return v3;
}

- (void)setFormulaClass:(Class)a3
{
  self->mFormulaClass = a3;
}

- (void)setFormulaHelper:(id)a3
{
  id v5 = a3;

  self->mHelper = (EFHelper *)a3;
}

- (id)stringToTokens:(id)a3
{
  if ([a3 UTF8String]) {
    operator new();
  }
  [(EDFormula *)self->mFormula setWarning:1];
  return 0;
}

- (Class)formulaClass
{
  return self->mFormulaClass;
}

- (void)setFormula:(id)a3
{
  id v5 = a3;

  self->mFormula = (EDFormula *)a3;
}

- (id)formulaHelper
{
  return self->mHelper;
}

- (void)dealloc
{
  mTableData = self->mTableData;
  if (mTableData) {

  }
  v4.receiver = self;
  v4.super_class = (Class)EFormula;
  [(EFormula *)&v4 dealloc];
}

- (unint64_t)resolveName:(const char *)a3
{
  mHelper = self->mHelper;
  uint64_t v4 = [NSString stringWithUTF8String:a3];
  return [(EFHelper *)mHelper resolveName:v4];
}

- (id)resolveTable:(const char *)a3 sheetIndex:(unint64_t *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:");
  v7 = (void *)[(EFHelper *)self->mHelper resolveTable:v6];
  if (v7) {
    *a4 = [(EFHelper *)self->mHelper resolveTableToSheetId:v6];
  }
  return v7;
}

- (unint64_t)resolveSheet:(const char *)a3 isCurrentSheet:(BOOL *)a4
{
  uint64_t v6 = [NSString stringWithUTF8String:a3];
  unint64_t v7 = [(EFHelper *)self->mHelper resolveSheet:v6];
  if (v7 == -1) {
    char v8 = 0;
  }
  else {
    char v8 = [(EFHelper *)self->mHelper isCurrentSheet:v6];
  }
  *a4 = v8;
  return v7;
}

- (unint64_t)resolveFirstSheet:(id)a3 lastSheet:(id)a4
{
  return [(EFHelper *)self->mHelper resolveFirstSheet:a3 lastSheet:a4];
}

- (id)tableData
{
  return self->mTableData;
}

- (void)setTableData:(id)a3
{
  id v5 = a3;

  self->mTableData = (EFTableData *)a3;
}

@end