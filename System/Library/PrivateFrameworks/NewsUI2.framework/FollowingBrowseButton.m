@interface FollowingBrowseButton
- (_TtC7NewsUI221FollowingBrowseButton)initWithCoder:(id)a3;
- (_TtC7NewsUI221FollowingBrowseButton)initWithFrame:(CGRect)a3;
@end

@implementation FollowingBrowseButton

- (_TtC7NewsUI221FollowingBrowseButton)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI221FollowingBrowseButton *)sub_1DEC84F74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI221FollowingBrowseButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEC85AC0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221FollowingBrowseButton_button);
}

@end