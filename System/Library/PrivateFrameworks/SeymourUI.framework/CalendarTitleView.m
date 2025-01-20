@interface CalendarTitleView
- (_TtC9SeymourUI17CalendarTitleView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17CalendarTitleView)initWithFrame:(CGRect)a3;
@end

@implementation CalendarTitleView

- (_TtC9SeymourUI17CalendarTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17CalendarTitleView *)sub_23A369444(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17CalendarTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A369E34();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17CalendarTitleView_styleProvider);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI17CalendarTitleView_styleProvider);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI17CalendarTitleView_styleProvider);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC9SeymourUI17CalendarTitleView_styleProvider));

  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17CalendarTitleView_titleLabel);
}

@end