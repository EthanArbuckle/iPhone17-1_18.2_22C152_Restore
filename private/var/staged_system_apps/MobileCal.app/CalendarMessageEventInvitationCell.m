@interface CalendarMessageEventInvitationCell
+ (BOOL)_notificationIsCancelled:(id)a3;
+ (BOOL)_notificationIsInvite:(id)a3;
+ (id)actionsForNotification:(id)a3;
- (BOOL)notificationIsCancelled;
- (BOOL)notificationIsInvite;
- (BOOL)showAsCancelledOrDeclined;
- (NSString)organizerName;
- (id)_dateString;
- (id)_invitedByString;
- (id)_organizerString;
- (id)actionBodyString;
- (id)actions;
- (id)bodyStringDict;
- (id)preActionBodyStrings;
- (id)titleStrings;
- (int64_t)actionBodyStringAction;
- (int64_t)selectedResponseButton;
- (unint64_t)options;
- (void)setNotification:(id)a3;
- (void)setOrganizerName:(id)a3;
- (void)updateAuthor;
@end

@implementation CalendarMessageEventInvitationCell

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

- (id)bodyStringDict
{
  v3 = [(CalendarMessageCell *)self notification];
  v4 = [v3 descriptionStrings:CUIKCalendarNoboDescriptionProfile];

  v5 = +[NSMutableDictionary dictionaryWithDictionary:v4];
  v6 = [(CalendarMessageEventInvitationCell *)self _organizerString];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:CUIKNotificationDescriptionKeyPerson];
  }
  v7 = [(CalendarMessageEventInvitationCell *)self _invitedByString];
  if (v7)
  {
    v8 = &CUIKNotificationDescriptionKeySecondPerson;
    if (!v6) {
      v8 = &CUIKNotificationDescriptionKeyPerson;
    }
    [v5 setObject:v7 forKeyedSubscript:*v8];
  }
  v9 = [(CalendarMessageCell *)self notification];
  unsigned int v10 = [v9 couldBeJunk];

  if (v10) {
    [v5 setObject:0 forKeyedSubscript:CUIKNotificationDescriptionKeyPerson];
  }

  return v5;
}

- (id)preActionBodyStrings
{
  v3 = [(CalendarMessageCell *)self notification];
  unsigned int v4 = [v3 couldBeJunk];

  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(CalendarMessageCell *)self notification];
  v6 = [v5 owner];

  v7 = [v6 emailAddress];

  if (v7)
  {
    id v8 = [v6 emailAddress];
    goto LABEL_10;
  }
  v9 = [v6 phoneNumber];

  if (v9)
  {
    unsigned int v10 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
    v11 = [v6 phoneNumber];
    uint64_t v12 = [v10 formattedStringForPhoneNumber:v11];
  }
  else
  {
    v13 = [v6 URL];
    unsigned int v10 = [v13 resourceSpecifier];

    if (v10)
    {
      id v8 = v10;
      goto LABEL_9;
    }
    v11 = [(CalendarMessageCell *)self notification];
    uint64_t v12 = CUIKDisplayStringForNotificationIdentity();
  }
  id v8 = (id)v12;

LABEL_9:
LABEL_10:

  if (v8)
  {
    v16[0] = v8;
    v16[1] = @" — ";
    v14 = +[NSArray arrayWithObjects:v16 count:2];

    goto LABEL_13;
  }
LABEL_12:
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)actionBodyString
{
  v2 = [(CalendarMessageCell *)self notification];
  unsigned int v3 = [v2 couldBeJunk];

  if (v3)
  {
    unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"Report Junk…" value:&stru_1001D6918 table:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)actionBodyStringAction
{
  v2 = [(CalendarMessageCell *)self notification];
  unsigned int v3 = [v2 couldBeJunk];

  if (v3) {
    return 0x10000;
  }
  else {
    return 0;
  }
}

- (int64_t)selectedResponseButton
{
  v2 = [(CalendarMessageCell *)self notification];
  unsigned int v3 = (char *)[v2 participationStatus];

  if ((unint64_t)(v3 - 2) > 2) {
    return 0;
  }
  else {
    return qword_1001C15C8[(void)(v3 - 2)];
  }
}

- (void)updateAuthor
{
  unsigned int v3 = [(CalendarMessageCell *)self notification];
  unsigned int v4 = [v3 couldBeJunk];

  if (v4)
  {
    id v6 = [(CalendarMessageCell *)self authorView];
    v5 = objc_opt_new();
    [v6 setContact:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CalendarMessageEventInvitationCell;
    [(CalendarMessageCell *)&v7 updateAuthor];
  }
}

- (id)_invitedByString
{
  unsigned int v3 = [(CalendarMessageCell *)self notification];
  unsigned int v4 = [v3 invitedBy];

  if (v4)
  {
    invitedByString = self->_invitedByString;
    if (!invitedByString)
    {
      id v6 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v7 = [v6 localizedStringForKey:@"Invited by %@" value:&stru_1001D6918 table:0];

      if (v7)
      {
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v4);
        id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = self->_invitedByString;
        self->_invitedByString = v8;
      }
      invitedByString = self->_invitedByString;
    }
    unsigned int v10 = invitedByString;
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (id)_organizerString
{
  if (!self->_organizerString)
  {
    unsigned int v3 = [(CalendarMessageCell *)self notification];
    unsigned __int8 v4 = [v3 couldBeJunk];

    if ((v4 & 1) == 0)
    {
      if ([(CalendarMessageEventInvitationCell *)self notificationIsCancelled])
      {
        v5 = +[NSBundle bundleForClass:objc_opt_class()];
        id v6 = v5;
        CFStringRef v7 = @"Canceled by %@";
      }
      else
      {
        id v8 = [(CalendarMessageEventInvitationCell *)self _invitedByString];

        if (!v8) {
          goto LABEL_12;
        }
        v5 = +[NSBundle bundleForClass:objc_opt_class()];
        id v6 = v5;
        CFStringRef v7 = @"Organized by %@";
      }
      v9 = [v5 localizedStringForKey:v7 value:&stru_1001D6918 table:0];

      organizerName = self->_organizerName;
      v11 = organizerName;
      if (!organizerName)
      {
        id v6 = [(CalendarMessageCell *)self notification];
        v11 = CUIKDisplayStringForNotificationIdentity();
      }
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11);
      uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      organizerString = self->_organizerString;
      self->_organizerString = v12;

      if (!organizerName)
      {
      }
    }
  }
LABEL_12:
  v14 = self->_organizerString;

  return v14;
}

- (id)_dateString
{
  dateString = self->_dateString;
  if (dateString) {
    goto LABEL_13;
  }
  unsigned __int8 v4 = [(CalendarMessageCell *)self notification];
  if ([v4 timeChanged])
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"Time changed to %@";
  }
  else
  {
    if (![v4 dateChanged])
    {
      uint64_t v9 = 1;
      id v8 = @"%@";
      goto LABEL_8;
    }
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = v5;
    CFStringRef v7 = @"Date changed to %@";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_1001D6918 table:0];

  uint64_t v9 = 0;
LABEL_8:
  unsigned int v10 = +[CUIKDateDescriptionGenerator sharedGenerator];
  v11 = [v4 startDateForNextOccurrence];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = [v4 startDate];
  }
  v13 = [v10 dateStringForDate:v12 allDay:[v4 isAllDay] standalone:v9 shortFormat:0];
  if (!v11) {

  }
  v14 = +[NSString localizedStringWithValidatedFormat:v8, @"%@", 0, v13 validFormatSpecifiers error];
  v15 = self->_dateString;
  self->_dateString = v14;

  dateString = self->_dateString;
LABEL_13:

  return dateString;
}

- (id)actions
{
  unsigned int v3 = objc_opt_class();
  unsigned __int8 v4 = [(CalendarMessageCell *)self notification];
  v5 = [v3 actionsForNotification:v4];

  return v5;
}

+ (id)actionsForNotification:(id)a3
{
  id v4 = a3;
  if ([a1 _notificationIsInvite:v4])
  {
    v5 = &off_1001DCB00;
  }
  else if ([v4 type] == (id)2)
  {
    v5 = &off_1001DCB18;
  }
  else
  {
    v5 = &off_1001DCB30;
  }

  return v5;
}

+ (BOOL)_notificationIsInvite:(id)a3
{
  id v4 = a3;
  BOOL v5 = ([a1 _notificationIsCancelled:v4] & 1) == 0
    && [v4 participationStatus] != (id)2
    && [v4 participationStatus] != (id)3
    && [v4 participationStatus] != (id)4;

  return v5;
}

+ (BOOL)_notificationIsCancelled:(id)a3
{
  return [a3 type] == (id)2;
}

- (unint64_t)options
{
  return 4;
}

- (BOOL)showAsCancelledOrDeclined
{
  v4.receiver = self;
  v4.super_class = (Class)CalendarMessageEventInvitationCell;
  if ([(CalendarMessageCell *)&v4 showAsCancelledOrDeclined]) {
    return 1;
  }
  else {
    return [(CalendarMessageEventInvitationCell *)self notificationIsCancelled];
  }
}

- (BOOL)notificationIsCancelled
{
  unsigned int v3 = objc_opt_class();
  objc_super v4 = [(CalendarMessageCell *)self notification];
  LOBYTE(v3) = [v3 _notificationIsCancelled:v4];

  return (char)v3;
}

- (BOOL)notificationIsInvite
{
  unsigned int v3 = objc_opt_class();
  objc_super v4 = [(CalendarMessageCell *)self notification];
  LOBYTE(v3) = [v3 _notificationIsInvite:v4];

  return (char)v3;
}

- (void)setNotification:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CalendarMessageEventInvitationCell;
  [(CalendarMessageCell *)&v7 setNotification:a3];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy()) {
    BOOL v4 = [(CalendarMessageEventInvitationCell *)self notificationIsInvite];
  }
  else {
    BOOL v4 = 0;
  }
  [(CalendarMessageCell *)self setHasDisclosure:v4];
  organizerString = self->_organizerString;
  self->_organizerString = 0;

  dateString = self->_dateString;
  self->_dateString = 0;
}

- (NSString)organizerName
{
  return self->_organizerName;
}

- (void)setOrganizerName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerName, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_invitedByString, 0);

  objc_storeStrong((id *)&self->_organizerString, 0);
}

@end