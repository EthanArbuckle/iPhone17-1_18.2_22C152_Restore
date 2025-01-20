@interface SVXAddViewsExpressionParser
@end

@implementation SVXAddViewsExpressionParser

BOOL __98___SVXAddViewsExpressionParser__parseViews_addViews_aceViewByAceId_aceIdByParseableExpressionIds___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 aceId];
  v4 = [*(id *)(a1 + 32) aceId];
  BOOL v5 = v3 == v4;

  return v5;
}

void __52___SVXAddViewsExpressionParser_parseAddViews_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (a2)
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = [*(id *)(a1 + 48) aceViewByAceId];
    v8 = [*(id *)(a1 + 48) aceViewIdByExpressionId];
    v9 = [v5 _parseViews:v10 addViews:v6 aceViewByAceId:v7 aceIdByParseableExpressionIds:v8];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

@end