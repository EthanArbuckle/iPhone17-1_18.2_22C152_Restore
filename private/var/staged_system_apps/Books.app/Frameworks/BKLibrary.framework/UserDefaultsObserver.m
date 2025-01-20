@interface UserDefaultsObserver
- (_TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation UserDefaultsObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_93A60();
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
  sub_93D00();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_8E3DC();
  uint64_t v11 = sub_93A20();

LABEL_8:
  sub_8E214((uint64_t)v14, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_8AF90((uint64_t)v14);
}

- (_TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver)init
{
  result = (_TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_84E4C0E1EA001C26EA74B9C51B2F995820UserDefaultsObserver_continuation;
  uint64_t v3 = sub_71350(&qword_EE4B8);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end