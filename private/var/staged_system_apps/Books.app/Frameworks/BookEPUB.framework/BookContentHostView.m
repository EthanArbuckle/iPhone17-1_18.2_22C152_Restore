@interface BookContentHostView
- (_TtC8BookEPUB19BookContentHostView)initWithCoder:(id)a3;
- (_TtC8BookEPUB19BookContentHostView)initWithFrame:(CGRect)a3;
@end

@implementation BookContentHostView

- (_TtC8BookEPUB19BookContentHostView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E48A8();
}

- (_TtC8BookEPUB19BookContentHostView)initWithFrame:(CGRect)a3
{
  result = (_TtC8BookEPUB19BookContentHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18A034(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_theme), *(void *)&self->theme[OBJC_IVAR____TtC8BookEPUB19BookContentHostView_theme]);
  sub_1E47E0((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19BookContentHostView____lazy_storage___logger);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentViewLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageLabelHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_headerLabelContainerTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_pageBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentTopConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8BookEPUB19BookContentHostView_contentBottomConstraint);
}

@end