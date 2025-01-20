@interface CalculationResultCompletionProvider
- (CalculationResultCompletionProvider)init;
- (void)setQueryToComplete:(id)a3;
@end

@implementation CalculationResultCompletionProvider

- (CalculationResultCompletionProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)CalculationResultCompletionProvider;
  v2 = [(CompletionProvider *)&v7 init];
  if (v2)
  {
    v3 = (WBSCalculationResultProvider *)objc_alloc_init(MEMORY[0x1E4F98A00]);
    calcuationResultProvider = v2->_calcuationResultProvider;
    v2->_calcuationResultProvider = v3;

    v5 = v2;
  }

  return v2;
}

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  v5 = [v4 queryString];
  objc_initWeak(&location, self);
  calcuationResultProvider = self->_calcuationResultProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CalculationResultCompletionProvider_setQueryToComplete___block_invoke;
  v9[3] = &unk_1E6D7AFF0;
  objc_copyWeak(&v12, &location);
  id v7 = v5;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [(WBSCalculationResultProvider *)calcuationResultProvider evaluateQuery:v8 resultHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __58__CalculationResultCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = [[CalculationResultCompletionItem alloc] initWithQuery:*(void *)(a1 + 40) calculationResult:v3];
      v8[0] = v6;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v5 setCompletions:v7 forString:*(void *)(a1 + 32)];
    }
    else
    {
      [WeakRetained setCompletions:MEMORY[0x1E4F1CBF0] forString:*(void *)(a1 + 32)];
    }
  }
}

- (void).cxx_destruct
{
}

@end