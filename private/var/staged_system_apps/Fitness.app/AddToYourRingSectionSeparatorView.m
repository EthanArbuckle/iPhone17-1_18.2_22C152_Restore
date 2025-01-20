@interface AddToYourRingSectionSeparatorView
- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithCoder:(id)a3;
- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation AddToYourRingSectionSeparatorView

- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div;
  sub_10007E2D8(0, (unint64_t *)&qword_10094E530);
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)sub_1006D134C();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AddToYourRingSectionSeparatorView();
  v10 = -[AddToYourRingSectionSeparatorView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  uint64_t v11 = *(uint64_t *)((char *)&v10->super.super.super.super.isa
                   + OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div);
  v12 = v10;
  [(AddToYourRingSectionSeparatorView *)v12 addSubview:v11];
  sub_1001C5D20();

  return v12;
}

- (_TtC10FitnessApp33AddToYourRingSectionSeparatorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div;
  sub_10007E2D8(0, (unint64_t *)&qword_10094E530);
  id v6 = a3;
  v7 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1006D134C();

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for AddToYourRingSectionSeparatorView();
  uint64_t v8 = [(AddToYourRingSectionSeparatorView *)&v10 initWithCoder:v6];

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp33AddToYourRingSectionSeparatorView_div));
}

@end