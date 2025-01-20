@interface StaticConversationSenderHeaderView
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (_TtC10MobileMail34StaticConversationSenderHeaderView)initWithCoder:(id)a3;
- (_TtC10MobileMail34StaticConversationSenderHeaderView)initWithFrame:(CGRect)a3;
- (int64_t)appearance;
- (void)configureViewHierarchy;
- (void)layoutSubviews;
- (void)setAppearance:(int64_t)a3;
- (void)setupViews;
- (void)updateWith:(id)a3;
@end

@implementation StaticConversationSenderHeaderView

- (int64_t)appearance
{
  v2 = self;
  int64_t v5 = sub_1004332D4();

  return v5;
}

- (void)setAppearance:(int64_t)a3
{
  v3 = self;
  sub_100433380(a3);
}

- (UIFont)titleFont
{
  v2 = self;
  id v5 = sub_10043384C();

  return (UIFont *)v5;
}

- (UIFont)subtitleFont
{
  v2 = self;
  id v5 = sub_1004339BC();

  return (UIFont *)v5;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100433A34();
}

- (void)updateWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100433B94((char *)a3);
}

- (void)setupViews
{
  v2 = self;
  sub_100433D78();
}

- (void)configureViewHierarchy
{
  v2 = self;
  sub_100434444();
}

- (_TtC10MobileMail34StaticConversationSenderHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail34StaticConversationSenderHeaderView *)sub_100435724(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail34StaticConversationSenderHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail34StaticConversationSenderHeaderView *)sub_1004358F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail34StaticConversationSenderHeaderView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail34StaticConversationSenderHeaderView_bottomBackgroundView));
}

@end