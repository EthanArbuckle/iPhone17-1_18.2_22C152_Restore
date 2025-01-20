@interface SectionViewBarButtonItem
- (_TtC5TeaUI24SectionViewBarButtonItem)init;
- (_TtC5TeaUI24SectionViewBarButtonItem)initWithCoder:(id)a3;
@end

@implementation SectionViewBarButtonItem

- (_TtC5TeaUI24SectionViewBarButtonItem)init
{
  return (_TtC5TeaUI24SectionViewBarButtonItem *)sub_1B5EEE7F4();
}

- (_TtC5TeaUI24SectionViewBarButtonItem)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5EEEB8C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_barBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_collapsingButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5TeaUI24SectionViewBarButtonItem_onCreateMenuBlock);
  sub_1B5E3799C(v3);
}

@end