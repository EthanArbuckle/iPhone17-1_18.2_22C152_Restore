@interface SFTabOverviewItemView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SFTabOverviewItemView)initWithCoder:(id)a3;
- (SFTabOverviewItemView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation SFTabOverviewItemView

- (SFTabOverviewItemView)initWithFrame:(CGRect)a3
{
  return (SFTabOverviewItemView *)sub_18C69B600(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFTabOverviewItemView)initWithCoder:(id)a3
{
  return (SFTabOverviewItemView *)sub_18C69B898(a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TabOverviewItemView();
  id v7 = a4;
  v8 = (char *)v12.receiver;
  if (-[SFTabOverviewItemView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    v10 = *(void **)&v8[OBJC_IVAR___SFTabOverviewItemView_thumbnailView];
    objc_msgSend(v8, sel_convertPoint_toCoordinateSpace_, v10, x, y, v12.receiver, v12.super_class);
    unsigned __int8 v9 = objc_msgSend(v10, sel_pointInside_withEvent_, v7);
  }

  return v9;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TabOverviewItemView();
  v2 = (char *)v4.receiver;
  [(SFTabOverviewItemView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR___SFTabOverviewItemView_closingBackgroundView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  sub_18C69C5A0();
  sub_18C69C7E4();
  sub_18C69C940();
}

- (void)tintColorDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabOverviewItemView_tintedSelectionBorderView);
  v3 = self;
  id v4 = [(SFTabOverviewItemView *)v3 tintColor];
  objc_msgSend(v2, sel_setBorderColor_, v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SFTabOverviewItemView_titleView);
}

@end