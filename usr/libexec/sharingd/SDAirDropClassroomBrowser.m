@interface SDAirDropClassroomBrowser
- (_TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser)init;
- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4;
- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4;
- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4;
@end

@implementation SDAirDropClassroomBrowser

- (void)shareTargetBrowser:(id)a3 didFindTargets:(id)a4
{
}

- (void)shareTargetBrowser:(id)a3 didRemoveTargets:(id)a4
{
}

- (void)shareTargetBrowser:(id)a3 didInterruptWithError:(id)a4
{
  uint64_t v7 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a4;
  v12[5] = v11;
  id v13 = a4;
  id v14 = a3;
  v15 = self;
  sub_10028CFA8((uint64_t)v9, (uint64_t)&unk_10096D890, (uint64_t)v12);

  swift_release();
}

- (_TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser)init
{
  result = (_TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_browserQueue));
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropClassroomBrowser_managedConfig));

  swift_bridgeObjectRelease();

  swift_release();
}

@end