@interface ContextMenuInteractor
- (_TtC8VideosUI21ContextMenuInteractor)init;
@end

@implementation ContextMenuInteractor

- (_TtC8VideosUI21ContextMenuInteractor)init
{
  return (_TtC8VideosUI21ContextMenuInteractor *)sub_1E33C9220();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI21ContextMenuInteractor_delegate);
  swift_release();
  swift_release();
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI21ContextMenuInteractor_indexPath, (uint64_t *)&unk_1EBF83FF0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8VideosUI21ContextMenuInteractor_deferredMenuHandler));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI21ContextMenuInteractor_currentContextMenuConfiguration));
  swift_unknownObjectWeakDestroy();
}

@end