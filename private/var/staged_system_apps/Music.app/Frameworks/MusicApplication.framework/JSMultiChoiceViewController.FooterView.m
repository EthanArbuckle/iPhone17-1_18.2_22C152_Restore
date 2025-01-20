@interface JSMultiChoiceViewController.FooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation JSMultiChoiceViewController.FooterView

- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_text);
  void *v8 = 0;
  v8[1] = 0xE000000000000000;
  uint64_t v9 = OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label;
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_4EE3B4();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for JSMultiChoiceViewController.FooterView();
  v11 = -[JSMultiChoiceViewController.FooterView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  [(JSMultiChoiceViewController.FooterView *)v11 addSubview:*(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label)];
  return v11;
}

- (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_text);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  uint64_t v5 = OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_4EE3B4();

  result = (_TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4EE178();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  [(JSMultiChoiceViewController.FooterView *)v5 music_inheritedLayoutInsets];
  UIEdgeInsetsInsetRect(0.0, 0.0, width, height, v6, v7);
  [*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label) sizeThatFits:v8, v9];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication27JSMultiChoiceViewControllerP33_A8E569B24FF6D407321C1DADBD6A2E9610FooterView_label);
}

@end