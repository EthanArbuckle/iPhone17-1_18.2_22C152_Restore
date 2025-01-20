@interface DefaultsObserver
- (_TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_1007FDC70();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v14, 0, sizeof(v14));
    id v12 = a5;
    v13 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_10048F824(&qword_100B24A08, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v11 = sub_1007FDA70();

LABEL_8:
  (*(void (**)(uint64_t))((char *)&self->super.isa
                                  + OBJC_IVAR____TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver_callback))(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)v14, (uint64_t *)&unk_100B269C0);
}

- (_TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver)init
{
  result = (_TtC5BooksP33_8A1BE8AE8AE70CC0220B9F5FF837F82D16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end