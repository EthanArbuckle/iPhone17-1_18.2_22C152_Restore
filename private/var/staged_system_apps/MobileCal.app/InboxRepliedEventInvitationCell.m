@interface InboxRepliedEventInvitationCell
- (BOOL)showAsCancelledOrDeclined;
- (id)actions;
- (unint64_t)options;
- (void)setNotification:(id)a3;
@end

@implementation InboxRepliedEventInvitationCell

- (id)actions
{
  return &off_1001DC950;
}

- (BOOL)showAsCancelledOrDeclined
{
  v6.receiver = self;
  v6.super_class = (Class)InboxRepliedEventInvitationCell;
  if ([(CalendarMessageEventInvitationCell *)&v6 showAsCancelledOrDeclined]) {
    return 1;
  }
  v4 = [(CalendarMessageCell *)self notification];
  BOOL v3 = [v4 participationStatus] == (id)3;

  return v3;
}

- (void)setNotification:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)InboxRepliedEventInvitationCell;
  [(CalendarMessageEventInvitationCell *)&v4 setNotification:a3];
  [(CalendarMessageCell *)self setHasDisclosure:EKUICurrentWidthSizeClassIsCompactInViewHierarchy()];
}

- (unint64_t)options
{
  return 0;
}

@end