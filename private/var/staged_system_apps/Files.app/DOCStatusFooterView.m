@interface DOCStatusFooterView
- (_TtC5Files19DOCStatusFooterView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation DOCStatusFooterView

- (void)dealloc
{
  v2 = self;
  sub_1001AF504();
}

- (void).cxx_destruct
{
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_delegate);
  swift_unknownObjectWeakDestroy();
  sub_1000A4D20((uint64_t)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView_quotaLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView____lazy_storage___folderInformationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview));
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_gestureDelegate);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files19DOCStatusFooterView_syncStateFooterView);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001B0ECC();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1001AF868();
}

- (_TtC5Files19DOCStatusFooterView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Files19DOCStatusFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_gestureDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
    id v10 = a3;
    v11 = self;
    v12 = (void *)v9(ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001B0FCC(v6);
  id v10 = v9;

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v5 = OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview;
  id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview);
  if (v6)
  {
    id v9 = a3;
    id v10 = a4;
    swift_unknownObjectRetain();
    v11 = self;
    [v6 removeFromSuperview];
    id v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = 0;

    swift_unknownObjectRelease();
  }
}

@end