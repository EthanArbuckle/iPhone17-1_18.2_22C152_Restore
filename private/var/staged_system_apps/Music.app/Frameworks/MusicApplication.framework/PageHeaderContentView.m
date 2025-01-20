@interface PageHeaderContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)supertitle;
- (NSString)title;
- (UIView)accessoryView;
- (_TtC16MusicApplication21PageHeaderContentView)initWithCoder:(id)a3;
- (_TtC16MusicApplication21PageHeaderContentView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setAccessoryView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupertitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PageHeaderContentView

- (_TtC16MusicApplication21PageHeaderContentView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21PageHeaderContentView *)sub_376AB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21PageHeaderContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_379E74();
}

- (UIView)accessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView));
}

- (void)setAccessoryView:(id)a3
{
  id v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView) = (Class)a3;
  id v4 = a3;
  v5 = self;
  sub_37711C(v6);
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)supertitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSupertitle:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_377948();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  id v5 = [(PageHeaderContentView *)v4 traitCollection];
  double v6 = sub_378714(v5, width);

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.double width = v7;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PageHeaderContentView();
  id v2 = v3.receiver;
  [(PageHeaderContentView *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_378A44((uint64_t)a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_378BC0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_pageHeaderContentViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_accessoryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_leadingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_leadingSizingStackView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21PageHeaderContentView_gradientView);
}

@end