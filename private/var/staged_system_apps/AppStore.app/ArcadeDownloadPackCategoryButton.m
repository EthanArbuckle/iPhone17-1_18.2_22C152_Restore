@interface ArcadeDownloadPackCategoryButton
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithCoder:(id)a3;
- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithFrame:(CGRect)a3;
- (void)didPress:(id)a3;
- (void)didRelease:(id)a3;
- (void)didTap;
- (void)invalidateMeasurements;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation ArcadeDownloadPackCategoryButton

- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005F6AD0();
}

- (BOOL)isSelected
{
  return sub_10015BA44(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ArcadeDownloadPackCategoryButton *)&v5 setSelected:v3];
  sub_1005F5B90();
}

- (BOOL)isEnabled
{
  return sub_10015BA44(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = self;
  sub_1005F4E64(a3);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(ArcadeDownloadPackCategoryButton *)v2 bounds];
  id v3 = [(ArcadeDownloadPackCategoryButton *)v2 traitCollection];
  sub_1005F5CDC(v10);
  sub_100081D90(v10, v10[3]);
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v5 = v4;
  double v7 = v6;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v10);

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005F6294();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1005F5CDC(v11);
  sub_100081D90(v11, v11[3]);
  id v4 = [(ArcadeDownloadPackCategoryButton *)v3 traitCollection];
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v6 = v5;
  double v8 = v7;

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)didTap
{
  ObjectType = (objc_class *)swift_getObjectType();
  v7.receiver = self;
  v7.super_class = ObjectType;
  id v4 = self;
  unsigned int v5 = [(ArcadeDownloadPackCategoryButton *)&v7 isSelected];
  v6.receiver = v4;
  v6.super_class = ObjectType;
  [(ArcadeDownloadPackCategoryButton *)&v6 setSelected:v5 ^ 1];
  sub_1005F5B90();
  (*(void (**)(void))((char *)&v4->super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_action))(*(Class *)((char *)&v4->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_category));
}

- (void)didPress:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  sub_1005F6590(v4);
}

- (void)didRelease:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self;
  sub_1005F6DA4(v4);
}

- (void)invalidateMeasurements
{
  v2 = self;
  [(ArcadeDownloadPackCategoryButton *)v2 setNeedsLayout];
  [(ArcadeDownloadPackCategoryButton *)v2 invalidateIntrinsicContentSize];
}

- (_TtC8AppStore32ArcadeDownloadPackCategoryButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore32ArcadeDownloadPackCategoryButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_backgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore32ArcadeDownloadPackCategoryButton_selectedBackgroundView);
}

@end