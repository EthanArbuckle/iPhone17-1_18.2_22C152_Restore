@interface DNDModeConfigurationService.Listener
- (_TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener)init;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
@end

@implementation DNDModeConfigurationService.Listener

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener_onUpdate);
  if (v4)
  {
    id v6 = a3;
    v8 = self;
    uint64_t v7 = sub_1D32EF9AC((uint64_t)v4);
    v4(v7);
    sub_1D32EA5C0((uint64_t)v4);
  }
}

- (_TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener)init
{
  result = (_TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D32EA5C0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE11PosterBoardCSo27DNDModeConfigurationServiceP33_810B7575001E280934AD3AE501DC549F8Listener_onUpdate));
}

@end