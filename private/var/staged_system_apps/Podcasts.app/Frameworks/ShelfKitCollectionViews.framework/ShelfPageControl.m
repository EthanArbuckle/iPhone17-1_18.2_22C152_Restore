@interface ShelfPageControl
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation ShelfPageControl

- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ShelfPageControl *)sub_1308AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ShelfPageControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_131F7C();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType();
  id v9 = a4;
  v10 = self;
  id v11 = [(ShelfPageControl *)v10 layoutMarginsGuide];
  [v11 layoutFrame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v24.origin.double x = v13;
  v24.origin.double y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  v23.double x = x;
  v23.double y = y;
  if (CGRectContainsPoint(v24, v23))
  {

    return 0;
  }
  else
  {
    v22.receiver = v10;
    v22.super_class = ObjectType;
    BOOL v20 = -[ShelfPageControl pointInside:withEvent:](&v22, "pointInside:withEvent:", v9, x, y);
  }
  return v20;
}

- (void)layoutMarginsDidChange
{
  v2 = self;
  ShelfPageControl.layoutMarginsDidChange()();
}

- (void)layoutSubviews
{
  v2 = self;
  ShelfPageControl.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_pageControls));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_leftBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_leftBackgroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_rightBackground));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews16ShelfPageControl_rightBackgroundMask);
}

@end