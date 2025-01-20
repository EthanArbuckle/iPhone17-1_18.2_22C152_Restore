@interface SliderTableViewCell
- (_TtC5TeaUI19SliderTableViewCell)initWithCoder:(id)a3;
- (_TtC5TeaUI19SliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)valueChanged;
@end

@implementation SliderTableViewCell

- (_TtC5TeaUI19SliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return (_TtC5TeaUI19SliderTableViewCell *)sub_1B6122F70(v4, v4, v6);
}

- (_TtC5TeaUI19SliderTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B61235D8();
}

- (void)valueChanged
{
  v2 = self;
  sub_1B61236E4();
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI19SliderTableViewCell_onChange));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI19SliderTableViewCell_valueLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI19SliderTableViewCell_slider);
}

@end