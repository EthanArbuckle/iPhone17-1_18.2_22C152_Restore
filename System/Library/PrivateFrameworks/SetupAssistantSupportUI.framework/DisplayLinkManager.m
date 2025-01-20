@interface DisplayLinkManager
- (_TtC23SetupAssistantSupportUI18DisplayLinkManager)init;
- (void)frameWithDisplayLink:(id)a3;
@end

@implementation DisplayLinkManager

- (void)frameWithDisplayLink:(id)a3
{
  id v4 = a3;
  v11 = self;
  objc_msgSend(v4, sel_targetTimestamp);
  double v6 = v5;
  objc_msgSend(v4, sel_timestamp);
  v8 = *(void (**)(uint64_t, double))((char *)&v11->super.isa
                                              + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock);
  if (v8)
  {
    double v9 = v6 - v7;
    uint64_t v10 = swift_retain();
    v8(v10, v9);
    sub_25C230F94((uint64_t)v8);
  }
}

- (_TtC23SetupAssistantSupportUI18DisplayLinkManager)init
{
  result = (_TtC23SetupAssistantSupportUI18DisplayLinkManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock);

  sub_25C230F94(v3);
}

@end