@interface ConversationSenderHeaderViewAnimator
+ (double)collapseProgressLimit;
+ (double)expansionProgressLimit;
- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)init;
- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)initWithHeaderView:(id)a3;
- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)headerView;
- (_TtP10MobileMail44ConversationSenderHeaderViewAnimatorDelegate_)delegate;
- (double)currentHeight;
- (int64_t)currentExpansionStatus;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCurrentExpansionStatus:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)updateHeaderWithExpansionStatus:(int64_t)a3;
@end

@implementation ConversationSenderHeaderViewAnimator

- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)headerView
{
  v2 = self;
  id v5 = (id)sub_10028FD10();

  return (_TtC10MobileMail38ExpandableConversationSenderHeaderView *)v5;
}

- (void)setHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10028FDC8(a3);
}

- (_TtP10MobileMail44ConversationSenderHeaderViewAnimatorDelegate_)delegate
{
  v2 = self;
  id v5 = (id)sub_10028FEA4();

  return (_TtP10MobileMail44ConversationSenderHeaderViewAnimatorDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_10028FF5C();
}

- (int64_t)currentExpansionStatus
{
  v2 = self;
  int64_t v5 = sub_100290028();

  return v5;
}

- (void)setCurrentExpansionStatus:(int64_t)a3
{
  v3 = self;
  sub_1002900D4(a3);
}

- (double)currentHeight
{
  v2 = self;
  double v5 = sub_100290188();

  return v5;
}

+ (double)expansionProgressLimit
{
  return sub_100290388();
}

+ (double)collapseProgressLimit
{
  return sub_1002903EC();
}

- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)initWithHeaderView:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail36ConversationSenderHeaderViewAnimator *)sub_10029069C(a3);
}

- (void)updateHeaderWithExpansionStatus:(int64_t)a3
{
  id v3 = self;
  sub_1002908E8(a3);
}

- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)init
{
  return (_TtC10MobileMail36ConversationSenderHeaderViewAnimator *)sub_100290BCC();
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail36ConversationSenderHeaderViewAnimator____lazy_storage___heightConstraint));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100290D64(a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100290EA4(a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v6 = a3;
  v7 = self;
  sub_100291F3C((uint64_t)a3, (uint64_t)a5, a4.x, a4.y);
}

@end