@interface SuggestedActionsService
- (_TtC10LinkDaemon23SuggestedActionsService)init;
- (void)suggestedActionsForSuggestionsRequests:(NSArray *)a3 reply:(id)a4;
@end

@implementation SuggestedActionsService

- (_TtC10LinkDaemon23SuggestedActionsService)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)suggestedActionsForSuggestionsRequests:(NSArray *)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_1000F7D3C((uint64_t)&unk_10017E6B8, (uint64_t)v7);
}

@end