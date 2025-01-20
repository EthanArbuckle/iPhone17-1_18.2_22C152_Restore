@interface HeaderBottomEdgeDecoration
- (CGSize)intrinsicContentSize;
- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithCoder:(id)a3;
- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateLayers;
@end

@implementation HeaderBottomEdgeDecoration

- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor26HeaderBottomEdgeDecoration *)sub_20BFBFEEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor26HeaderBottomEdgeDecoration)initWithCoder:(id)a3
{
  return (_TtC11NotesEditor26HeaderBottomEdgeDecoration *)sub_20BFC00BC(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20BFC0280();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(HeaderBottomEdgeDecoration *)v2 window];
  double v4 = 1.0;
  if (v3)
  {
    v5 = v3;
    id v6 = objc_msgSend(v3, sel_screen);

    objc_msgSend(v6, sel_scale);
    double v4 = v7;
  }
  double v8 = *MEMORY[0x263F83C20];

  double v9 = 1.0 / v4;
  double v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)updateLayers
{
  v2 = self;
  sub_20BFC0500();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor26HeaderBottomEdgeDecoration_gradientLayer));
}

@end