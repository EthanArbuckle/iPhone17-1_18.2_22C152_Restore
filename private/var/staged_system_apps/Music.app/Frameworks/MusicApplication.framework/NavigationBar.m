@interface NavigationBar
- (CGRect)bounds;
- (_TtC16MusicApplication13NavigationBar)initWithCoder:(id)a3;
- (_TtC16MusicApplication13NavigationBar)initWithFrame:(CGRect)a3;
- (void)_cancelInteractiveTransition;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
@end

@implementation NavigationBar

- (_TtC16MusicApplication13NavigationBar)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13NavigationBar *)sub_1B3978(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13NavigationBar)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicTintColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicPartialBackgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication13NavigationBar_topItemPreferredNavigationBarTintColorObserver) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NavigationBar();
  id v4 = a3;
  v5 = [(NavigationBar *)&v7 initWithCoder:v4];

  return v5;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B3B74();
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NavigationBar();
  [(NavigationBar *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for NavigationBar();
  v26.receiver = self;
  v26.super_class = v8;
  v9 = self;
  [(NavigationBar *)&v26 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v25.receiver = v9;
  v25.super_class = v8;
  -[NavigationBar setBounds:](&v25, "setBounds:", x, y, width, height);
  [(NavigationBar *)v9 frame];
  v28.origin.double x = v18;
  v28.origin.double y = v19;
  v28.size.double width = v20;
  v28.size.double height = v21;
  v27.origin.double x = v11;
  v27.origin.double y = v13;
  v27.size.double width = v15;
  v27.size.double height = v17;
  if (!CGRectEqualToRect(v27, v28))
  {
    [(NavigationBar *)v9 bounds];
    char v23 = HI.SizeClass.init(_:)(v22);
    double v24 = HI.SizeClass.margin.getter(v23);
    -[NavigationBar setLayoutMargins:](v9, "setLayoutMargins:", 0.0, v24, 0.0, v24);
  }
}

- (void)_cancelInteractiveTransition
{
  double v2 = self;
  sub_1B3DFC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13NavigationBar_musicPartialBackgroundView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13NavigationBar_topItemPreferredNavigationBarTintColorObserver);
}

@end