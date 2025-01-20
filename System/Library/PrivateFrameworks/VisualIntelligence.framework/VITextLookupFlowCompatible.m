@interface VITextLookupFlowCompatible
- (_TtC18VisualIntelligence26VITextLookupFlowCompatible)init;
- (id)lookupTextWithQuery:(id)a3 completion:(id)a4;
@end

@implementation VITextLookupFlowCompatible

- (_TtC18VisualIntelligence26VITextLookupFlowCompatible)init
{
  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC18VisualIntelligence26VITextLookupFlowCompatible_flow) = (Class)sub_1DCFE4530(0, (uint64_t)sub_1DCFE3FC8, 0);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for VITextLookupFlowCompatible();
  return [(VITextLookupFlowCompatible *)&v4 init];
}

- (id)lookupTextWithQuery:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  id v9 = sub_1DCFE46E8((uint64_t)v7, (uint64_t)v8, v6);
  _Block_release(v6);
  _Block_release(v6);

  return v9;
}

- (void).cxx_destruct
{
}

@end