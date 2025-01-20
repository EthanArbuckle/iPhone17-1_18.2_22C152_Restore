@interface DayViewTableViewSectionHeader
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithCoder:(id)a3;
- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithFrame:(CGRect)a3;
- (void)updateFonts;
@end

@implementation DayViewTableViewSectionHeader

- (CGSize)intrinsicContentSize
{
  v3 = self;
  v4 = self;
  id v5 = [v3 preferredFontForTextStyle:UIFontTextStyleBody];
  [v5 _scaledValueForValue:44.0];
  double v7 = v6;

  id v8 = [self mainScreen];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  CGFloat Width = CGRectGetWidth(v21);

  double v18 = Width;
  double v19 = v7;
  result.height = v19;
  result.width = v18;
  return result;
}

- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp29DayViewTableViewSectionHeader *)sub_1006120DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateFonts
{
  v2 = self;
  sub_1006123B0();
}

- (_TtC10FitnessApp29DayViewTableViewSectionHeader)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader____lazy_storage___divider));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp29DayViewTableViewSectionHeader_labelBaseline);
}

@end