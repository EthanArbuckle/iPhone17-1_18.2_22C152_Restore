@interface CalendarMessageAttendeeReplyCell
+ (id)_bodyStringDict:(id)a3;
+ (id)actionsForNotification:(id)a3 proposedTimeAttendee:(id *)a4 eventStore:(id)a5;
+ (int64_t)numberOfLinesForBodyLabels;
+ (int64_t)numberOfLinesForTitleLabels;
- (CUIKMessageStrings)messageStrings;
- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee;
- (NSString)dateString;
- (id)actions;
- (id)bodyStringDict;
- (id)titleStrings;
- (unint64_t)options;
- (void)setDateString:(id)a3;
- (void)setMessageStrings:(id)a3;
- (void)setNotification:(id)a3;
- (void)setProposedTimeAttendee:(id)a3;
- (void)updateAuthor;
@end

@implementation CalendarMessageAttendeeReplyCell

+ (int64_t)numberOfLinesForTitleLabels
{
  return 2;
}

+ (int64_t)numberOfLinesForBodyLabels
{
  return 4;
}

- (id)titleStrings
{
  v3 = [(CalendarMessageCell *)self notification];
  v4 = [v3 title];

  if (v4)
  {
    v5 = [(CalendarMessageCell *)self notification];
    v6 = [v5 title];
    v11 = v6;
    v7 = &v11;
  }
  else
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"(No Title)" value:&stru_1001D6918 table:0];
    v10 = v6;
    v7 = &v10;
  }
  v8 = +[NSArray arrayWithObjects:v7 count:1];

  return v8;
}

- (void)updateAuthor
{
  v2 = self;
  v3 = [(CalendarMessageAttendeeReplyCell *)self bodyStringDict];
  v4 = [v3 objectForKeyedSubscript:CUIKNotificationDescriptionKeyImportantAttendee];
  uint64_t v5 = [(CalendarMessageCell *)v2 authorView];
  v6 = (void *)v5;
  if (v4)
  {
    v7 = [(CalendarMessageCell *)v2 authorCacheKeyForIdentity:v4];
    uint64_t v8 = [(id)objc_opt_class() authorCacheObjectForKey:v7];
    v9 = (void *)v8;
    if (v8)
    {
      uint64_t v46 = v8;
      v10 = +[NSArray arrayWithObjects:&v46 count:1];
      [v6 updateWithContacts:v10];
    }
    else
    {
      if ([v6 loadContactsAsynchronously]) {
        [v6 updateWithContacts:0];
      }
      v30 = [(CalendarMessageCell *)v2 authorAddressForIdentity:v4];
      v31 = [v4 name];
      v32 = [v4 firstName];
      v33 = [v4 lastName];
      [v6 updateWithAddress:v30 fullName:v31 firstName:v32 lastName:v33];

      if (([v6 loadContactsAsynchronously] & 1) == 0)
      {
        v34 = objc_opt_class();
        v35 = [v6 contact];
        [v34 authorCacheSetObject:v35 forKey:v7];
      }
    }
  }
  else
  {
    v36 = (void *)v5;
    v37 = v3;
    v11 = [(CalendarMessageCell *)v2 notification];
    v12 = [v11 attendees];
    v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v14 = [(CalendarMessageCell *)v2 notification];
    v15 = [v14 attendees];

    id obj = v15;
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v42;
      v38 = v13;
      do
      {
        v19 = 0;
        id v39 = v17;
        do
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v19);
          v21 = [(CalendarMessageCell *)v2 authorCacheKeyForIdentity:v20];
          v22 = [(id)objc_opt_class() authorCacheObjectForKey:v21];
          if (!v22)
          {
            v23 = [(CalendarMessageCell *)v2 authorAddressForIdentity:v20];
            v24 = [v20 name];
            [v20 firstName];
            v25 = v2;
            v27 = uint64_t v26 = v18;
            v28 = [v20 lastName];
            v29 = +[EKUILabeledAvatarView contactKeysToFetch];
            v22 = +[ContactsUtils contactForAddress:v23 fullName:v24 firstName:v27 lastName:v28 keysToFetch:v29];

            uint64_t v18 = v26;
            v2 = v25;

            id v17 = v39;
            v13 = v38;
            [(id)objc_opt_class() authorCacheSetObject:v22 forKey:v21];
          }
          [v13 addObject:v22];

          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v17);
    }

    v6 = v36;
    [v36 updateWithContacts:v13];
    v7 = v13;
    v4 = 0;
    v3 = v37;
  }
}

- (id)bodyStringDict
{
  v3 = objc_opt_class();
  v4 = [(CalendarMessageCell *)self notification];
  uint64_t v5 = [v3 _bodyStringDict:v4];

  return v5;
}

+ (id)_bodyStringDict:(id)a3
{
  return [a3 descriptionStrings:CUIKCalendarNoboDescriptionProfile];
}

- (id)actions
{
  [(CalendarMessageAttendeeReplyCell *)self layoutIfNeeded];
  v3 = [(CalendarMessageCell *)self delegate];
  v4 = [v3 eventStoreForCell:self];

  uint64_t v5 = objc_opt_class();
  v6 = [(CalendarMessageCell *)self notification];
  id v10 = 0;
  v7 = [v5 actionsForNotification:v6 proposedTimeAttendee:&v10 eventStore:v4];
  id v8 = v10;

  [(CalendarMessageAttendeeReplyCell *)self setProposedTimeAttendee:v8];

  return v7;
}

+ (id)actionsForNotification:(id)a3 proposedTimeAttendee:(id *)a4 eventStore:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a1 _bodyStringDict:v8];
  v11 = [v10 objectForKeyedSubscript:CUIKNotificationDescriptionKeyImportantAttendee];
  v12 = v11;
  if (v11
    && [v11 proposedStartDateChanged]
    && ([v12 proposedStartDate], v13 = objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    if (a4) {
      *a4 = v12;
    }
    if ([v12 proposedStartDateDeclined])
    {
      v14 = &off_1001DC9B0;
    }
    else
    {
      v32 = v10;
      uint64_t v18 = [v8 objectID];
      id v34 = v8;
      v19 = [v8 startDate];
      id v33 = v9;
      v20 = [v9 eventForObjectID:v18 occurrenceDate:v19 checkValid:0];

      v35 = objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v21 = [v20 attendees];
      id v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v37;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v27 = v26;
              v28 = [v12 emailAddress];
              v29 = [v27 emailAddress];
              unsigned int v30 = [v28 isEqual:v29];

              if (v30)
              {
                [v35 addObject:v27];

                goto LABEL_29;
              }
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
LABEL_29:

      if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:v20 withParticipantRecipients:v35])v14 = &off_1001DC9C8; {
      else
      }
        v14 = &off_1001DC9E0;

      id v9 = v33;
      id v8 = v34;
      id v10 = v32;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    v15 = [v10 objectForKeyedSubscript:CUIKNotificationDescriptionKeyTimeProposals];

    if (v15)
    {
      v14 = &off_1001DC9F8;
    }
    else
    {
      id v16 = [v10 objectForKeyedSubscript:CUIKNotificationDescriptionKeyComment];

      if (v16)
      {
        id v17 = [v10 objectForKeyedSubscript:CUIKNotificationDescriptionKeyMultipleComments];

        if (v17) {
          v14 = &off_1001DCA28;
        }
        else {
          v14 = &off_1001DCA40;
        }
      }
      else
      {
        v14 = &off_1001DCA10;
      }
    }
  }

  return v14;
}

- (unint64_t)options
{
  return 4;
}

- (void)setNotification:(id)a3
{
  id v4 = a3;
  [(CalendarMessageCell *)self setHasDisclosure:EKUICurrentWidthSizeClassIsCompactInViewHierarchy()];
  dateString = self->_dateString;
  self->_dateString = 0;

  v6.receiver = self;
  v6.super_class = (Class)CalendarMessageAttendeeReplyCell;
  [(CalendarMessageCell *)&v6 setNotification:v4];
}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return self->_proposedTimeAttendee;
}

- (void)setProposedTimeAttendee:(id)a3
{
}

- (CUIKMessageStrings)messageStrings
{
  return self->_messageStrings;
}

- (void)setMessageStrings:(id)a3
{
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_messageStrings, 0);

  objc_storeStrong((id *)&self->_proposedTimeAttendee, 0);
}

@end