@interface RhizomePosterRenderer
- (_TtC13RhizomePoster21RhizomePosterRenderer)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation RhizomePosterRenderer

- (_TtC13RhizomePoster21RhizomePosterRenderer)init
{
  return (_TtC13RhizomePoster21RhizomePosterRenderer *)sub_100029A64();
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100029F68(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10002AE90((uint64_t)v8, a4, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002CEBC();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_unlockState;
  uint64_t v4 = sub_10003A500();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_wakeState;
  uint64_t v6 = sub_10003A5C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  sub_10000775C((uint64_t)self + OBJC_IVAR____TtC13RhizomePoster21RhizomePosterRenderer_currentUUID, &qword_10004AF70);
}

@end