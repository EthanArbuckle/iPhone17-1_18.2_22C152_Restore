@interface AlertTemplateView.AlertActionCell
- (NSArray)preferredFocusEnvironments;
- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithCoder:(id)a3;
- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AlertTemplateView.AlertActionCell

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_1E32350C4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADED388);
  v3 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E3235164();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3235214();
}

- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI17AlertTemplateView15AlertActionCell *)sub_1E323534C();
}

- (_TtCC8VideosUI17AlertTemplateView15AlertActionCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3235468();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI17AlertTemplateView15AlertActionCell_buttonView));
}

@end