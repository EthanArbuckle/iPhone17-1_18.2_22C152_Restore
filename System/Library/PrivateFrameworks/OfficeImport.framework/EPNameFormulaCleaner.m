@interface EPNameFormulaCleaner
- (BOOL)isObjectSupported:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
@end

@implementation EPNameFormulaCleaner

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v9 = a3;
  v5 = [EPFormulaCleaner alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v7 = [(EDProcessor *)v5 initWithWorkbook:WeakRetained];

  v8 = [v9 formula];
  [(EPFormulaCleaner *)v7 cleanFormula:v8 name:v9];
}

@end