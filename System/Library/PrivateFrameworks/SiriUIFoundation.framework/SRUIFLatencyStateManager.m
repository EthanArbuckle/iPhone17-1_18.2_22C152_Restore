@interface SRUIFLatencyStateManager
- (_TtC16SiriUIFoundation24SRUIFLatencyStateManager)init;
- (id)getLatestLatencyInformation;
- (void)processLatencyProgressUpdate:(id)a3;
- (void)processParameterSummary:(id)a3;
- (void)processTaskReceivedWithIdentifier:(id)a3;
@end

@implementation SRUIFLatencyStateManager

- (id)getLatestLatencyInformation
{
  v2 = self;
  id v3 = sub_225FE9BD8();

  return v3;
}

- (void)processTaskReceivedWithIdentifier:(id)a3
{
}

- (void)processParameterSummary:(id)a3
{
}

- (void)processLatencyProgressUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_225FE9ED8(v4);
}

- (_TtC16SiriUIFoundation24SRUIFLatencyStateManager)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentTaskIdentifier);
  void *v2 = 0;
  v2[1] = 0;
  id v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummary);
  *id v3 = 0;
  v3[1] = 0;
  *(_DWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencyProgress) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16SiriUIFoundation24SRUIFLatencyStateManager_currentLatencySummaryType) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SRUIFLatencyStateManager();
  return [(SRUIFLatencyStateManager *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end