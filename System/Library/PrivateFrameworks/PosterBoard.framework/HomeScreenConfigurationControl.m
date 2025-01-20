@interface HomeScreenConfigurationControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (UIView)previewContentView;
- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithCoder:(id)a3;
- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPreviewContentView:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HomeScreenConfigurationControl

- (UIView)previewContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_previewContentView));
}

- (void)setPreviewContentView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D32E1358(v4);
}

- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_title);
  *id v4 = 0;
  v4[1] = 0xE000000000000000;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_showsSymbolWhenSelected) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_maximumHorizontalTitleOutset) = 0;
  id v5 = a3;

  result = (_TtC11PosterBoard30HomeScreenConfigurationControl *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32E19E4();
}

- (BOOL)isSelected
{
  return sub_1D32E234C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for HomeScreenConfigurationControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(HomeScreenConfigurationControl *)&v9 isSelected];
  v8.receiver = v6;
  v8.super_class = v5;
  [(HomeScreenConfigurationControl *)&v8 setSelected:v3];
  sub_1D32E1DD4(v7);
}

- (BOOL)isHighlighted
{
  return sub_1D32E234C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_1D32E21EC(a3);
}

- (BOOL)isEnabled
{
  return sub_1D32E234C(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = self;
  sub_1D32E23E0(a3);
}

- (_TtC11PosterBoard30HomeScreenConfigurationControl)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_previewContentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_titleLabel));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard30HomeScreenConfigurationControl_symbolImageView);
}

@end