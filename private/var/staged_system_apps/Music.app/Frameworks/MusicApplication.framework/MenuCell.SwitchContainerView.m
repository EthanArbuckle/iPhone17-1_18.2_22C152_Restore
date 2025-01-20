@interface MenuCell.SwitchContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MenuCell.SwitchContainerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  v4 = self;
  id v5 = sub_54222C();
  [v5 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

  if (height > v9) {
    double v10 = height;
  }
  else {
    double v10 = v9;
  }
  double v11 = v7;
  result.double height = v10;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_542320();
}

- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView_isTopAligned) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MenuCell.SwitchContainerView();
  return -[MenuCell.SwitchContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView_isTopAligned) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MenuCell.SwitchContainerView();
  id v4 = a3;
  id v5 = [(MenuCell.SwitchContainerView *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication8MenuCellP33_C2E388CD2164915D6B208DFC15E7FAC819SwitchContainerView____lazy_storage___switchButton));
}

@end