@interface ActivityTypeIconView
- (_TtC9SeymourUI20ActivityTypeIconView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20ActivityTypeIconView)initWithFrame:(CGRect)a3;
- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3;
- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (int64_t)accessibilityActivityType;
@end

@implementation ActivityTypeIconView

- (_TtC9SeymourUI20ActivityTypeIconView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType;
  *(void *)v7 = 0;
  v7[8] = 1;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ActivityTypeIconView();
  v8 = -[ActivityTypeIconView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v9 = self;
  v10 = v8;
  id v11 = objc_msgSend(v9, sel_whiteColor);
  [(ActivityTypeIconView *)v10 setTintColor:v11];

  return v10;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC9SeymourUI20ActivityTypeIconView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI20ActivityTypeIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC9SeymourUI20ActivityTypeIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)accessibilityActivityType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType);
  if ((*((unsigned char *)&self->super.super.super._responderFlags
        + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType) & 1) != 0)
    return -1;
  int64_t result = *v2;
  if (*v2 < 0) {
    __break(1u);
  }
  return result;
}

@end