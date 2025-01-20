@interface VisualIntelligenceActionClientToHost
- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)init;
- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation VisualIntelligenceActionClientToHost

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA0C178(v4);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VisualIntelligenceActionClientToHost();
  return [(VisualIntelligenceActionClientToHost *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_20CA0CF04;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost *)VisualIntelligenceActionClientToHost.init(info:timeout:forResponseOn:withHandler:)(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VisualIntelligenceActionClientToHost();
  return [(VisualIntelligenceActionClientToHost *)&v3 init];
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithXPCDictionary:(id)a3
{
  return (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost *)sub_20CA0CCDC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost)initWithCoder:(id)a3
{
  return (_TtC12SiriSharedUI36VisualIntelligenceActionClientToHost *)sub_20CA0CCDC(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end