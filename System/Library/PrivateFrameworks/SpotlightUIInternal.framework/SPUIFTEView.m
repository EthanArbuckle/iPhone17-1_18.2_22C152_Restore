@interface SPUIFTEView
- (SPUIFTEView)initWithHostedView:(id)a3;
- (SPUIFTEView)initWithPrivacyPresentation:(id)a3 ttr:(id)a4;
@end

@implementation SPUIFTEView

- (SPUIFTEView)initWithPrivacyPresentation:(id)a3 ttr:(id)a4
{
  v5 = _Block_copy(a3);
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return (SPUIFTEView *)sub_23D30F5D0((uint64_t)sub_23D310568, v7, (uint64_t)sub_23D3109CC, v8);
}

- (SPUIFTEView)initWithHostedView:(id)a3
{
  id v3 = a3;
  result = (SPUIFTEView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end