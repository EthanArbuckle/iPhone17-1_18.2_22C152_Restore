@interface WFToolKitIndexer
- (WFToolKitIndexer)init;
- (WFToolKitIndexer)initWithClientIdentifier:(id)a3 error:(id *)a4;
- (void)reindexWithRequest:(WFToolKitIndexingRequest *)a3 completionHandler:(id)a4;
@end

@implementation WFToolKitIndexer

- (WFToolKitIndexer)initWithClientIdentifier:(id)a3 error:(id *)a4
{
  return (WFToolKitIndexer *)ToolKitIndexer.init(clientIdentifier:)();
}

- (void)reindexWithRequest:(WFToolKitIndexingRequest *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100059F5C();
}

- (WFToolKitIndexer)init
{
}

- (void).cxx_destruct
{
}

@end