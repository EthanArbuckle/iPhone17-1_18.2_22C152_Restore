@interface EditButton
- (BOOL)editEnabled;
- (BOOL)isInputEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC7Measure10EditButton)initWithCoder:(id)a3;
- (_TtC7Measure10EditButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)editBegan;
- (void)editCancelled;
- (void)editEnded;
- (void)setEditEnabled:(BOOL)a3;
- (void)setIsInputEnabled:(BOOL)a3;
@end

@implementation EditButton

- (BOOL)editEnabled
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled);
}

- (void)setEditEnabled:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled) = a3;
  if (v3 != a3)
  {
    BOOL v4 = a3;
    v6 = self;
    float v5 = 0.5;
    if (v4) {
      float v5 = 1.0;
    }
    sub_10008E3D0(v5);
  }
}

- (BOOL)isInputEnabled
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_isInputEnabled);
}

- (void)setIsInputEnabled:(BOOL)a3
{
  BOOL v4 = self;
  sub_10008D43C(a3);
}

- (_TtC7Measure10EditButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008E7F0();
}

- (void)editBegan
{
  if (*((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled) == 1
    && *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_isInputEnabled) == 1)
  {
    v2 = self;
    sub_10008DD58();
  }
}

- (void)editEnded
{
  v2 = self;
  sub_10008DF64();
}

- (void)editCancelled
{
  v2 = self;
  sub_10008E248();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(EditButton *)v8 bounds];
  CGRect v13 = CGRectInset(v12, -30.0, -30.0);
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (_TtC7Measure10EditButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7Measure10EditButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure10EditButton_delegate);

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_pressUpDownAnimation);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = (void *)sub_10008E91C();

  return v9;
}

@end