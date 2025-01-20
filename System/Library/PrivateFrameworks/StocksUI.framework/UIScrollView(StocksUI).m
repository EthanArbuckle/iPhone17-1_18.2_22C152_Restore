@interface UIScrollView(StocksUI)
- (void)su_performScrollTestWithLength:()StocksUI completion:;
@end

@implementation UIScrollView(StocksUI)

- (void)su_performScrollTestWithLength:()StocksUI completion:
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F82B80]);
  [v7 setIterations:1];
  [v7 setLength:a2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__UIScrollView_StocksUI__su_performScrollTestWithLength_completion___block_invoke;
  v9[3] = &unk_263FDCED0;
  id v10 = v6;
  id v8 = v6;
  [a1 _performScrollTestWithParameters:v7 completionBlock:v9];
}

@end