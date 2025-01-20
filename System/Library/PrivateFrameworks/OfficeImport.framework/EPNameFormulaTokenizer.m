@interface EPNameFormulaTokenizer
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation EPNameFormulaTokenizer

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v15 = v6;
  v8 = [v15 formulaString];
  v9 = v8;
  if (v8 && [v8 length])
  {
    p_mWorkbook = &self->super.mWorkbook;
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    v12 = +[EXFormula edTokensForFormulaString:v9 sheet:v7 workbook:WeakRetained];

    id v13 = objc_loadWeakRetained((id *)p_mWorkbook);
    [v15 setFormula:v12 workbook:v13];

    id v14 = objc_loadWeakRetained((id *)p_mWorkbook);
    [v15 setFormulaString:0 workbook:v14];
  }
}

@end