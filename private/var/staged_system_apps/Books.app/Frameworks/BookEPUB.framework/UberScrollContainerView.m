@interface UberScrollContainerView
- (_TtC8BookEPUB23UberScrollContainerView)initWithCoder:(id)a3;
- (_TtC8BookEPUB23UberScrollContainerView)initWithFrame:(CGRect)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation UberScrollContainerView

- (_TtC8BookEPUB23UberScrollContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A7498();
}

- (_TtC8BookEPUB23UberScrollContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC8BookEPUB23UberScrollContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_paginatingService);
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_viewDocumentMap));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_documentViewMap));
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_scrollDelegate);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_locationProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_A71A4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_pendingState));
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_paginationCompleteSubscription, (uint64_t *)&unk_400E48);
  swift_bridgeObjectRelease();
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_bookPaginationSubscription, (uint64_t *)&unk_400E48);
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_updateStateCancellable, (uint64_t *)&unk_400E48);
  id v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB23UberScrollContainerView_log;
  uint64_t v4 = sub_2FB8A0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    v6 = self;
    sub_166D98((unsigned __int8 *)v6);

    swift_unknownObjectRelease();
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_A7728();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_A77C8(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_A7844();
}

@end