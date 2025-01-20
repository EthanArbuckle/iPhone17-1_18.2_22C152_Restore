@interface DOCColumnViewCell
- (_TtC5Files17DOCColumnViewCell)initWithCoder:(id)a3;
- (_TtC5Files17DOCColumnViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DOCColumnViewCell

- (_TtC5Files17DOCColumnViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Files17DOCColumnViewCell *)sub_1003A11C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files17DOCColumnViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC5Files17DOCColumnViewCell *)sub_1003A1AEC((uint64_t)v3);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003A15F8();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DOCColumnViewCell *)&v5 prepareForReuse];
  sub_1003A1894();
  id v3 = *(id *)&v2[OBJC_IVAR____TtC5Files17DOCColumnViewCell_navigationFocusGuide];
  sub_1000CBE70((uint64_t *)&unk_10070D080);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v3 setPreferredFocusEnvironments:isa, v5.receiver, v5.super_class];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCColumnViewCell_browserContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCColumnViewCell_navigationFocusGuide));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files17DOCColumnViewCell_separatorView);
}

@end