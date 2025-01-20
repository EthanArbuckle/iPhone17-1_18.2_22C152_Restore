@interface DebugFormatInspectorMaskViewController
- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithRootViewController:(id)a3;
@end

@implementation DebugFormatInspectorMaskViewController

- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithCoder:(id)a3
{
  result = (_TtC8NewsFeed38DebugFormatInspectorMaskViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC8NewsFeed38DebugFormatInspectorMaskViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC8NewsFeed38DebugFormatInspectorMaskViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed38DebugFormatInspectorMaskViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super.super._externalObjectsTableForViewLoading
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[10] = *(_OWORD *)((char *)&self->super.super._currentAction
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[11] = v3;
  char v10 = *((unsigned char *)&self->super.super._savedHeaderSuperview
        + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  long long v4 = *(_OWORD *)((char *)&self->super.super._childModalViewControllers
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[6] = *(_OWORD *)((char *)&self->super.super._nibBundle
                    + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[7] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super._dimmingView
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[8] = *(_OWORD *)((char *)&self->super.super._previousRootViewController
                    + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[9] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super._tab
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[2] = *(_OWORD *)((char *)&self->super.super._view
                    + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[3] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super._title
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[4] = *(_OWORD *)((char *)&self->super.super._navigationItem
                    + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[5] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_model);
  v9[1] = v8;
  sub_1C09F4704((uint64_t)v9);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed38DebugFormatInspectorMaskViewController_maskSegmentedViewController));
}

@end