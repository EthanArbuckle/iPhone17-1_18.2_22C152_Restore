@interface MusicInterstellarContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MusicInterstellarContentView)initWithCoder:(id)a3;
- (MusicInterstellarContentView)initWithFrame:(CGRect)a3;
- (SLAttributionView)pill;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (_TtC16MusicApplication9BadgeView)badgeView;
- (void)layoutSubviews;
- (void)setBadgeView:(id)a3;
- (void)setPill:(id)a3;
@end

@implementation MusicInterstellarContentView

- (_TtC16MusicApplication9BadgeView)badgeView
{
  return (_TtC16MusicApplication9BadgeView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR___MusicInterstellarContentView_badgeView));
}

- (void)setBadgeView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicInterstellarContentView_badgeView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicInterstellarContentView_badgeView) = (Class)a3;
  id v3 = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicInterstellarContentView_titleLabel));
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicInterstellarContentView_subtitleLabel));
}

- (SLAttributionView)pill
{
  return (SLAttributionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicInterstellarContentView_pill));
}

- (void)setPill:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_2BE6A8(a3);
}

- (MusicInterstellarContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2BE72C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = self;
  id v5 = [(MusicInterstellarContentView *)v4 traitCollection];
  id v6 = [self defaultMetrics];
  v7 = (void *)sub_AB7560();
  sub_AB7160();
  double v9 = v8;

  double v10 = width;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2B68BC();
}

- (MusicInterstellarContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (MusicInterstellarContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2BE648((uint64_t)self + OBJC_IVAR___MusicInterstellarContentView_typedConfiguration, _s17CellConfigurationVMa);

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicInterstellarContentView____lazy_storage___mediaPickerAddButton);
}

@end