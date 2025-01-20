@interface StatusBarOverlayWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithContentRect:(CGRect)a3;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation StatusBarOverlayWindow

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow_interactionView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[StatusBarOverlayWindow initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  [(StatusBarOverlayWindow *)v9 setWindowLevel:UIWindowLevelStatusBar];
  [(StatusBarOverlayWindow *)v9 _setWindowControlsStatusBarOrientation:0];

  return v9;
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow_interactionView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(StatusBarOverlayWindow *)&v7 initWithCoder:a3];
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow_interactionView);
  if (!v4) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = v4;
  -[StatusBarOverlayWindow convertPoint:toCoordinateSpace:](v9, "convertPoint:toCoordinateSpace:", v10, x, y);
  unsigned __int8 v11 = [v10 pointInside:v8];

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[StatusBarOverlayWindow hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  id v10 = v9;
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

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  result = (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow)initWithContentRect:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B322StatusBarOverlayWindow_interactionView));
}

@end