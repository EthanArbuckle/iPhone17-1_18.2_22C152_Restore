@interface ProgressKeyValueObservation
- (_TtC19VoiceShortcutClient27ProgressKeyValueObservation)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation ProgressKeyValueObservation

- (void)dealloc
{
  v2 = self;
  ProgressKeyValueObservation.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19VoiceShortcutClient27ProgressKeyValueObservation_progress));

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_1B3D723A8();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1B3D72888();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B3C7E69C();
    sub_1B3D72228();
  }
LABEL_7:
  sub_1B3C7E4AC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B3C78F00((uint64_t)v13);
}

- (_TtC19VoiceShortcutClient27ProgressKeyValueObservation)init
{
}

@end