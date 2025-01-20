@interface TVUpNextQueueButtonContentView
- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)init;
- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithFrame:(CGRect)a3;
@end

@implementation TVUpNextQueueButtonContentView

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)init
{
  return (_TtC9SeymourUI30TVUpNextQueueButtonContentView *)sub_23A02F0FC();
}

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A02FC00();
}

- (_TtC9SeymourUI30TVUpNextQueueButtonContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI30TVUpNextQueueButtonContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  v4 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  v5 = *(id *)((char *)&self->super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout);
  objc_release(*(id *)((char *)&self->super._traitChangeRegistry
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_layout));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_textView));
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVUpNextQueueButtonContentView_stackView);
}

@end