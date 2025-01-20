@interface AudioPreviewPlayer
- (_TtC16MusicMessagesApp18AudioPreviewPlayer)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AudioPreviewPlayer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_100483E10();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1004851E0();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_10000BE24(&qword_10059F1E8, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v15 = sub_100483BF0();

LABEL_8:
  sub_10000A464(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100007728((uint64_t)v18);
}

- (_TtC16MusicMessagesApp18AudioPreviewPlayer)init
{
  return (_TtC16MusicMessagesApp18AudioPreviewPlayer *)sub_10000B5DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp18AudioPreviewPlayer__playerDispatchQueue));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicMessagesApp18AudioPreviewPlayer__playerBoundaryTimeObservationToken;

  sub_100007728((uint64_t)v3);
}

@end