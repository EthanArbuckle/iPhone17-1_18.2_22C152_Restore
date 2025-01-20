@interface NUPaywallViewData
- (NUPaywallViewData)init;
- (NUPaywallViewData)initWithViewSessionID:(id)a3 viewType:(id)a4 viewAction:(id)a5;
@end

@implementation NUPaywallViewData

- (NUPaywallViewData)initWithViewSessionID:(id)a3 viewType:(id)a4 viewAction:(id)a5
{
  uint64_t v5 = sub_1DFDFDD20();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1DFDFDD20();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1DFDFDD20();
  return (NUPaywallViewData *)PaywallViewData.init(viewSessionID:viewType:viewAction:)(v5, v7, v8, v10, v11, v12);
}

- (NUPaywallViewData)init
{
  result = (NUPaywallViewData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end