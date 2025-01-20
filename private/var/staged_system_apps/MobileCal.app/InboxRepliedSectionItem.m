@interface InboxRepliedSectionItem
- (EKCalendarEventInvitationNotification)notification;
- (EKEvent)event;
- (EKEventOccurrenceInfo)occurrenceInfo;
- (InboxRepliedSectionItem)initWithOccurrenceInfo:(id)a3;
- (NSDictionary)cellFrameDictionary;
- (id)description;
- (void)setCellFrameDictionary:(id)a3;
- (void)setEvent:(id)a3;
- (void)setNotification:(id)a3;
- (void)setOccurrenceInfo:(id)a3;
@end

@implementation InboxRepliedSectionItem

- (InboxRepliedSectionItem)initWithOccurrenceInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)InboxRepliedSectionItem;
  v6 = [(InboxRepliedSectionItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_occurrenceInfo, a3);
  }

  return v7;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)InboxRepliedSectionItem;
  v3 = [(InboxRepliedSectionItem *)&v10 description];
  v4 = [(InboxRepliedSectionItem *)self cellFrameDictionary];
  id v5 = [(InboxRepliedSectionItem *)self event];
  v6 = [(InboxRepliedSectionItem *)self occurrenceInfo];
  v7 = [(InboxRepliedSectionItem *)self notification];
  v8 = +[NSString stringWithFormat:@"[%@] cellFrameDictionary: [%@] event: [%@] occurrenceInfo: [%@] notification: [%@]", v3, v4, v5, v6, v7];

  return v8;
}

- (EKEventOccurrenceInfo)occurrenceInfo
{
  return self->_occurrenceInfo;
}

- (void)setOccurrenceInfo:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (EKCalendarEventInvitationNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (NSDictionary)cellFrameDictionary
{
  return self->_cellFrameDictionary;
}

- (void)setCellFrameDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellFrameDictionary, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_occurrenceInfo, 0);
}

@end