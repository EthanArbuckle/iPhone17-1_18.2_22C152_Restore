@interface VoiceOptionsView
- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler;
- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider;
- (_TtC9SiriSetup16VoiceOptionsView)init;
- (void)setVoiceSelectionEventHandler:(id)a3;
- (void)setVoiceSelectionViewModelProvider:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)voiceSelectionViewModelDidChange;
@end

@implementation VoiceOptionsView

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (SUICVoiceSelectionViewModelProviding *)v2;
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  v2 = (void *)swift_unknownObjectRetain();

  return (SUICVoiceSelectionEventHandling *)v2;
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
}

- (_TtC9SiriSetup16VoiceOptionsView)init
{
  return (_TtC9SiriSetup16VoiceOptionsView *)sub_235A3BA70();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_235A688F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235A688D0();
  id v10 = a3;
  v11 = self;
  sub_235A3C68C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)voiceSelectionViewModelDidChange
{
  v2 = self;
  sub_235A3BE3C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9SiriSetup16VoiceOptionsView____lazy_storage___tableViewDataSource);
}

@end