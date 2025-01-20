@interface VisualIntelligenceActionHostToClient
- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)init;
- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithXPCDictionary:(id)a3;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation VisualIntelligenceActionHostToClient

- (void)performActionForHostedWindowScene:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA4F264(v4);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VisualIntelligenceActionHostToClient();
  return [(VisualIntelligenceActionHostToClient *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_20CA3AC98;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient *)VisualIntelligenceActionHostToClient.init(info:timeout:forResponseOn:withHandler:)(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisualIntelligenceActionHostToClient();
  return [(VisualIntelligenceActionHostToClient *)&v3 init];
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithXPCDictionary:(id)a3
{
  return (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient *)sub_20CA4FA6C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient)initWithCoder:(id)a3
{
  return (_TtC12SiriSharedUI36VisualIntelligenceActionHostToClient *)sub_20CA4FA6C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end