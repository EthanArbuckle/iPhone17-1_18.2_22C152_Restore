@interface PageButtonsControl
- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)scrollByButton:(id)a3;
@end

@implementation PageButtonsControl

- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1250B4();
}

- (void)scrollByButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_124A50();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[PageButtonsControl hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_2E66C(0, (unint64_t *)&qword_474180);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = sub_385270();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_124D10();
}

- (_TtC23ShelfKitCollectionViews18PageButtonsControl)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews18PageButtonsControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_scrollHandle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PageButtonsControl_rightButton));

  swift_bridgeObjectRelease();
}

@end