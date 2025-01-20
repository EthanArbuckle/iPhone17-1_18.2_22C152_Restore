@interface SymbolButton
- (BOOL)isAccessibilityElement;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)accessibilityImageView;
- (UILabel)accessibilityTitleLabel;
- (UIView)accessibilityCustomView;
- (_TtC11MusicCoreUI12SymbolButton)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI12SymbolButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SymbolButton

- (_TtC11MusicCoreUI12SymbolButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s11MusicCoreUI12SymbolButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v2 = self;
  SymbolButton.layoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  v8.value.super.isa = (Class)a3;
  SymbolButton.traitCollectionDidChange(_:)(v8);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = SymbolButton.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)tintColorDidChange
{
  type metadata accessor for SymbolButton.Configuration(0);
  __chkstk_darwin();
  double v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v5 = (objc_class *)type metadata accessor for SymbolButton(0);
  v9.receiver = self;
  v9.super_class = v5;
  double v6 = self;
  [(SymbolButton *)&v9 tintColorDidChange];
  uint64_t v7 = (uint64_t)v6 + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton__configuration;
  swift_beginAccess();
  sub_979914(v7, (uint64_t)v4, type metadata accessor for SymbolButton.Configuration);
  sub_96CAC0((uint64_t)v4);
  sub_97180C((uint64_t)v4, type metadata accessor for SymbolButton.Configuration);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SymbolButton *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)hitRect
{
  v2 = self;
  double v3 = SymbolButton.hitRect()();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = self;
  if (UIViewIgnoresTouchEvents())
  {
  }
  else
  {
    unsigned __int8 v9 = -[SymbolButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y);

    if (v9) {
      goto LABEL_5;
    }
  }

  double v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  [(SymbolButton *)v8 hitRect];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (BOOL)isHighlighted
{
  return sub_96AFBC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (objc_class *)type metadata accessor for SymbolButton(0);
  v9.receiver = self;
  v9.super_class = v5;
  double v6 = self;
  char v7 = [(SymbolButton *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SymbolButton *)&v8 setHighlighted:v3];
  sub_96AA70(v7);
}

- (BOOL)isSelected
{
  return sub_96AFBC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  double v4 = self;
  SymbolButton.isSelected.setter(a3);
}

- (BOOL)isEnabled
{
  return sub_96AFBC(self, (uint64_t)a2, type metadata accessor for SymbolButton, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  double v4 = self;
  SymbolButton.isEnabled.setter(a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  double v6 = self;
  id v7 = _s11MusicCoreUI12SymbolButtonC22contextMenuInteraction_016configurationForG10AtLocationSo09UIContextG13ConfigurationCSgSo0mgH0C_So7CGPointVtF_0();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (UIImageView)accessibilityImageView
{
  v2 = self;
  id v3 = sub_96B620();

  return (UIImageView *)v3;
}

- (UILabel)accessibilityTitleLabel
{
  v2 = self;
  id v3 = sub_96B788();

  return (UILabel *)v3;
}

- (UIView)accessibilityCustomView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_customView));
}

- (_TtC11MusicCoreUI12SymbolButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_configurationProvider));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_handler));
  sub_97180C((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton__configuration, type metadata accessor for SymbolButton.Configuration);
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_buildMenu));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton_customView));

  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI12SymbolButton____lazy_storage___metrics, &qword_DFB530);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  objc_super v9 = (void *)_s11MusicCoreUI12SymbolButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0jG0C_So0J6RegionCtF_0(v6);

  return v9;
}

@end