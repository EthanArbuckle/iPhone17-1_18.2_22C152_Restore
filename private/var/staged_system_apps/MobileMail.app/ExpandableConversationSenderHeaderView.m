@interface ExpandableConversationSenderHeaderView
- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)initWithCoder:(id)a3;
- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)initWithFrame:(CGRect)a3;
- (double)calculateMaximumHeight;
- (double)calculateMinimumHeight;
- (void)configureViewHierarchy;
- (void)recalculateHeights;
- (void)setupViews;
- (void)updateLayoutWithProgress:(double)a3;
- (void)updateWith:(id)a3 expansionStatus:(int64_t)a4;
@end

@implementation ExpandableConversationSenderHeaderView

- (void)updateWith:(id)a3 expansionStatus:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  sub_1002B5670((char *)a3, a4);
}

- (void)updateLayoutWithProgress:(double)a3
{
  v3 = self;
  sub_1002B4B90(a3);
}

- (void)recalculateHeights
{
  v2 = self;
  sub_1002B59B0();
}

- (double)calculateMinimumHeight
{
  v2 = self;
  double v5 = sub_1002B5B50();

  return v5;
}

- (double)calculateMaximumHeight
{
  v2 = self;
  double v5 = sub_1002B5C98();

  return v5;
}

- (void)setupViews
{
  v2 = self;
  sub_1002B5D10();
}

- (void)configureViewHierarchy
{
  v2 = self;
  sub_1002B5F54();
}

- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail38ExpandableConversationSenderHeaderView *)sub_1002B7B30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail38ExpandableConversationSenderHeaderView *)sub_1002B7D6C(a3);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_imageViewTopConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_imageViewHeightConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_titleTopConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_subtitleTopConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_subtitleBottomConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_subtitleButtonHeightConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_backgroundViewHeightConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail38ExpandableConversationSenderHeaderView_contentViewBottomConstraint));
}

@end