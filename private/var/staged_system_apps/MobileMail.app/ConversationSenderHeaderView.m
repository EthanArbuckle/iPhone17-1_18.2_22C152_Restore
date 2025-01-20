@interface ConversationSenderHeaderView
- (UIButton)subtitleButton;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)contentView;
- (_TtC10MobileMail28ConversationSenderHeaderView)initWithCoder:(id)a3;
- (_TtC10MobileMail28ConversationSenderHeaderView)initWithFrame:(CGRect)a3;
- (_TtC10MobileMail33ConversationSenderHeaderViewModel)viewModel;
- (_TtP10MobileMail36ConversationSenderHeaderViewDelegate_)delegate;
- (double)avatarSize;
- (double)calculateMaximumHeight;
- (double)calculateMinimumHeight;
- (double)maximumHeight;
- (double)minimumHeight;
- (void)adjustCalculatedHeightsBy:(double)a3;
- (void)configureViewHierarchy;
- (void)recalculateHeights;
- (void)setDelegate:(id)a3;
- (void)setMaximumHeight:(double)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setViewModel:(id)a3;
- (void)setupViews;
- (void)updateWith:(id)a3;
@end

@implementation ConversationSenderHeaderView

- (_TtP10MobileMail36ConversationSenderHeaderViewDelegate_)delegate
{
  v2 = self;
  id v5 = (id)sub_100288C14();

  return (_TtP10MobileMail36ConversationSenderHeaderViewDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100288CCC();
}

- (_TtC10MobileMail33ConversationSenderHeaderViewModel)viewModel
{
  v2 = self;
  id v5 = sub_100288E4C();

  return (_TtC10MobileMail33ConversationSenderHeaderViewModel *)v5;
}

- (void)setViewModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100288F04(a3);
}

- (double)minimumHeight
{
  v2 = self;
  double v5 = sub_100289038();

  return v5;
}

- (void)setMinimumHeight:(double)a3
{
  v3 = self;
  sub_1002890E4(a3);
}

- (double)maximumHeight
{
  v2 = self;
  double v5 = sub_100289204();

  return v5;
}

- (void)setMaximumHeight:(double)a3
{
  v3 = self;
  sub_1002892B0(a3);
}

- (UIImageView)imageView
{
  v2 = self;
  id v5 = sub_1002893E4();

  return (UIImageView *)v5;
}

- (UILabel)titleLabel
{
  v2 = self;
  id v5 = sub_100289480();

  return (UILabel *)v5;
}

- (UIButton)subtitleButton
{
  v2 = self;
  id v5 = sub_10028951C();

  return (UIButton *)v5;
}

- (UIView)backgroundView
{
  v2 = self;
  id v5 = sub_1002895B8();

  return (UIView *)v5;
}

- (UIView)contentView
{
  v2 = self;
  id v5 = sub_100289654();

  return (UIView *)v5;
}

- (UIFont)titleFont
{
  v2 = self;
  id v5 = sub_10028AC24();

  return (UIFont *)v5;
}

- (UIFont)subtitleFont
{
  v2 = self;
  id v5 = sub_10028ACE4();

  return (UIFont *)v5;
}

- (double)avatarSize
{
  v2 = self;
  double v5 = sub_10028AD8C();

  return v5;
}

- (_TtC10MobileMail28ConversationSenderHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail28ConversationSenderHeaderView *)sub_10028AEF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail28ConversationSenderHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028B374();
}

- (void)updateWith:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10028B658((char *)a3);
}

- (void)setupViews
{
  v2 = self;
  sub_10028BB48();
}

- (void)configureViewHierarchy
{
  v2 = self;
  sub_10028C2A0();
}

- (double)calculateMinimumHeight
{
  v2 = self;
  sub_10028C370();
  double v6 = v3;

  return v6;
}

- (double)calculateMaximumHeight
{
  v2 = self;
  double v5 = sub_10028C420();

  return v5;
}

- (void)recalculateHeights
{
  v2 = self;
  sub_10028C4D8();
}

- (void)adjustCalculatedHeightsBy:(double)a3
{
  double v3 = self;
  sub_10028D0E8(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_subtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView_contentView));
  sub_100289BA4((uint64_t)self+ OBJC_IVAR____TtC10MobileMail28ConversationSenderHeaderView____lazy_storage___titleTextAttributesTransformer);
}

@end