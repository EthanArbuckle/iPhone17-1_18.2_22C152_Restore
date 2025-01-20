@interface SUCompletionDataProvider
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
@end

@implementation SUCompletionDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  v11 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263F89500]);
  [v7 configureFromProvider:self];
  int v8 = [v7 parseData:a3 returningError:&v11];
  if (v8)
  {
    v9 = -[SUCompletionsResponse initWithPropertyList:]([SUCompletionsResponse alloc], "initWithPropertyList:", [v7 output]);
    [(ISDataProvider *)self setOutput:v9];
    [(ISDataProvider *)self migrateOutputFromSubProvider:v7];
  }
  if (a4) {
    *a4 = v11;
  }
  return v8;
}

@end