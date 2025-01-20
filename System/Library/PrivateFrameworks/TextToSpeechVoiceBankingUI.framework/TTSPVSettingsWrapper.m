@interface TTSPVSettingsWrapper
- (NSString)speechSource;
- (TTSPVSettingsWrapper)init;
- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate;
- (UIViewController)rootView;
- (void)addViewToParent:(id)a3;
- (void)reloadView;
- (void)setDataDelegate:(id)a3;
- (void)setRootView:(id)a3;
- (void)setSpeechSource:(id)a3;
@end

@implementation TTSPVSettingsWrapper

- (NSString)speechSource
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_25F53C038();
  swift_release();
  swift_release();

  if (v6)
  {
    v4 = (void *)sub_25F53D8A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setSpeechSource:(id)a3
{
  if (a3) {
    sub_25F53D8E8();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_25F53C048();
}

- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate
{
  v2 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper_dataDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2611F62E0](v2);

  return (TTSPerVoiceSettingsViewControllerDelegate *)v3;
}

- (void)setDataDelegate:(id)a3
{
}

- (UIViewController)rootView
{
  v2 = self;
  id v3 = sub_25F521D80();

  return (UIViewController *)v3;
}

- (void)setRootView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TTSPVSettingsWrapper____lazy_storage___rootView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TTSPVSettingsWrapper____lazy_storage___rootView) = (Class)a3;
  id v3 = a3;
}

- (TTSPVSettingsWrapper)init
{
  return (TTSPVSettingsWrapper *)TTSPVSettingsWrapper.init()();
}

- (void)reloadView
{
  v2 = self;
  sub_25F5224FC();
}

- (void)addViewToParent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F522AF4(v4);
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper__voiceId;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A4F00);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  uint64_t v6 = (char *)self + OBJC_IVAR___TTSPVSettingsWrapper__voiceSettings;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7A4F18);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR___TTSPVSettingsWrapper__speechSource, v4);
  swift_bridgeObjectRelease();
  sub_25F52718C((uint64_t)self + OBJC_IVAR___TTSPVSettingsWrapper_dataDelegate);
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TTSPVSettingsWrapper____lazy_storage___rootView);
}

@end