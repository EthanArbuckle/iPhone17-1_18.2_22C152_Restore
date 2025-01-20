@interface EntrySwipeMenuButton
- (BOOL)accessibilityActivate;
- (_TtC7Journal20EntrySwipeMenuButton)initWithCoder:(id)a3;
- (_TtC7Journal20EntrySwipeMenuButton)initWithFrame:(CGRect)a3;
- (void)buttonTapped;
@end

@implementation EntrySwipeMenuButton

- (_TtC7Journal20EntrySwipeMenuButton)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal20EntrySwipeMenuButton *)sub_1003EAAE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal20EntrySwipeMenuButton)initWithCoder:(id)a3
{
  return (_TtC7Journal20EntrySwipeMenuButton *)sub_1003EAC64(a3);
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Journal20EntrySwipeMenuButton_tapClosure);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (BOOL)accessibilityActivate
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC7Journal20EntrySwipeMenuButton_tapClosure);
  v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20EntrySwipeMenuButton_imageBackgroundColor));

  swift_release();
}

@end