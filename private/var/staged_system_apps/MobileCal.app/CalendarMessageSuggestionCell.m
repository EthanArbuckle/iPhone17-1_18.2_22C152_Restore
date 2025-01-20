@interface CalendarMessageSuggestionCell
+ (BOOL)_notificationIsCancelled:(id)a3;
+ (id)actionsForNotification:(id)a3;
- (BOOL)notificationIsCancelled;
- (BOOL)showAsCancelledOrDeclined;
- (CalendarMessageSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_appNameString;
- (id)_dateString;
- (id)_fromString;
- (id)_locationString;
- (id)actions;
- (id)bodyStringDict;
- (id)provideAuthorView;
- (id)titleStrings;
- (unint64_t)options;
- (void)_updateSuggestionPropertiesWithNotification:(id)a3;
- (void)setNotification:(id)a3;
- (void)updateAuthor;
@end

@implementation CalendarMessageSuggestionCell

- (CalendarMessageSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CalendarMessageSuggestionCell;
  v4 = [(CalendarMessageCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CalendarMessageCell *)v4 setHasDisclosure:1];
  }
  return v5;
}

- (id)provideAuthorView
{
  id v2 = objc_alloc_init((Class)UIImageView);

  return v2;
}

- (void)updateAuthor
{
  id v9 = [(CalendarMessageCell *)self authorView];
  applicationRecord = self->_applicationRecord;
  if (applicationRecord
    && ([(LSApplicationRecord *)applicationRecord applicationState],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isInstalled],
        v4,
        v5))
  {
    v6 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
  }
  else
  {
    v6 = @"com.apple.siri";
  }
  objc_super v7 = +[UIScreen mainScreen];
  [v7 scale];
  v8 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);

  [v9 setImage:v8];
}

- (id)titleStrings
{
  id v2 = [(CalendarMessageCell *)self notification];
  v3 = [v2 title];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)bodyStringDict
{
  v3 = objc_opt_new();
  v4 = [(CalendarMessageSuggestionCell *)self _fromString];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:CUIKNotificationDescriptionKeyPerson];
  }
  unsigned int v5 = [(CalendarMessageSuggestionCell *)self _dateString];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:CUIKNotificationDescriptionKeyDate];
  }
  v6 = [(CalendarMessageSuggestionCell *)self _locationString];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:CUIKNotificationDescriptionKeyAction];
  }
  objc_super v7 = [(CalendarMessageSuggestionCell *)self _appNameString];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:CUIKNotificationDescriptionKeyApp];
  }

  return v3;
}

- (id)_fromString
{
  v3 = self->_suggestionOriginSenderName;
  if (v3)
  {
    if (!self->_fromString)
    {
      unsigned int v4 = [(CalendarMessageSuggestionCell *)self notificationIsCancelled];
      unsigned int v5 = +[NSBundle bundleForClass:objc_opt_class()];
      v6 = v5;
      if (v4) {
        CFStringRef v7 = @"Canceled by %@";
      }
      else {
        CFStringRef v7 = @"From: %@";
      }
      v11 = [v5 localizedStringForKey:v7 value:&stru_1001D6918 table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v3);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      fromString = self->_fromString;
      self->_fromString = v12;
    }
  }
  else
  {
    v8 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      id v9 = v8;
      v10 = [(CalendarMessageCell *)self notification];
      *(_DWORD *)buf = 136315394;
      v17 = "-[CalendarMessageSuggestionCell _fromString]";
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Suggested Event Notification had no from name; this is probably unexpected [%@]",
        buf,
        0x16u);
    }
  }
  v14 = self->_fromString;

  return v14;
}

- (id)_dateString
{
  dateString = self->_dateString;
  if (!dateString)
  {
    unsigned int v4 = [(CalendarMessageCell *)self notification];
    if ([v4 timeChanged]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [v4 dateChanged] ^ 1;
    }
    v6 = +[CUIKDateDescriptionGenerator sharedGenerator];
    CFStringRef v7 = [v4 startDateForNextOccurrence];
    v8 = [v6 dateStringForDate:v7 allDay:[v4 allDay] standalone:v5 shortFormat:0];

    if ([v4 timeChanged])
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = v9;
      CFStringRef v11 = @"Time changed to %@";
    }
    else
    {
      if (![v4 dateChanged])
      {
        v15 = +[NSString stringWithFormat:@"%@", v8];
        v10 = self->_dateString;
        self->_dateString = v15;
        goto LABEL_11;
      }
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = v9;
      CFStringRef v11 = @"Date changed to %@";
    }
    v12 = [(NSString *)v9 localizedStringForKey:v11 value:&stru_1001D6918 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v8);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    v14 = self->_dateString;
    self->_dateString = v13;

LABEL_11:
    dateString = self->_dateString;
  }

  return dateString;
}

- (id)_locationString
{
  id v2 = [(CalendarMessageCell *)self notification];
  if ([v2 locationChanged])
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v4 = [v3 localizedStringForKey:@"Location changed" value:&stru_1001D6918 table:0];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)_appNameString
{
  appNameString = self->_appNameString;
  if (!appNameString)
  {
    unsigned int v4 = [(LSApplicationRecord *)self->_applicationRecord localizedName];
    uint64_t v5 = +[CUIKSuggestionDescriptionGenerator originDescriptionStringWithAppName:v4];
    v6 = self->_appNameString;
    self->_appNameString = v5;

    appNameString = self->_appNameString;
  }

  return appNameString;
}

- (id)actions
{
  v3 = objc_opt_class();
  unsigned int v4 = [(CalendarMessageCell *)self notification];
  uint64_t v5 = [v3 actionsForNotification:v4];

  return v5;
}

+ (id)actionsForNotification:(id)a3
{
  id v4 = a3;
  if ([a1 _notificationIsCancelled:v4])
  {
    uint64_t v5 = &off_1001DCA58;
  }
  else if ([v4 type] == (id)12)
  {
    uint64_t v5 = &off_1001DCA70;
  }
  else
  {
    uint64_t v5 = &off_1001DCA88;
  }

  return v5;
}

- (unint64_t)options
{
  return 4;
}

- (BOOL)showAsCancelledOrDeclined
{
  v4.receiver = self;
  v4.super_class = (Class)CalendarMessageSuggestionCell;
  if ([(CalendarMessageCell *)&v4 showAsCancelledOrDeclined]) {
    return 1;
  }
  else {
    return [(CalendarMessageSuggestionCell *)self notificationIsCancelled];
  }
}

- (BOOL)notificationIsCancelled
{
  id v2 = [(CalendarMessageCell *)self notification];
  BOOL v3 = [v2 type] == (id)13;

  return v3;
}

+ (BOOL)_notificationIsCancelled:(id)a3
{
  return [a3 type] == (id)13;
}

- (void)setNotification:(id)a3
{
  fromString = self->_fromString;
  self->_fromString = 0;
  id v5 = a3;

  dateString = self->_dateString;
  self->_dateString = 0;

  appNameString = self->_appNameString;
  self->_appNameString = 0;

  [(CalendarMessageSuggestionCell *)self _updateSuggestionPropertiesWithNotification:v5];
  v8.receiver = self;
  v8.super_class = (Class)CalendarMessageSuggestionCell;
  [(CalendarMessageCell *)&v8 setNotification:v5];
}

- (void)_updateSuggestionPropertiesWithNotification:(id)a3
{
  id v23 = a3;
  if (v23)
  {
    objc_super v4 = [(CalendarMessageCell *)self delegate];
    id v5 = [v4 eventStoreForCell:self];

    v6 = [v23 resourceChangeFromEventStore:v5];
    CFStringRef v7 = [v6 calendarItem];
    objc_super v8 = [v7 localCustomObjectForKey:kSuggestionsEkEventOriginBundleIdKey];
    id v9 = [v7 localCustomObjectForKey:kSuggestionsEkEventOriginDisplayNameKey];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v8;
      }
      else {
        v10 = 0;
      }
      id v11 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v9;
      }
      else {
        v12 = 0;
      }
      v13 = v12;
      suggestionOriginSenderName = self->_suggestionOriginSenderName;
      self->_suggestionOriginSenderName = v13;
    }
    else
    {
      suggestionOriginSenderName = [v23 suggestedEvent];
      v16 = [suggestionOriginSenderName origin];
      id v11 = [v16 bundleId];

      v17 = [suggestionOriginSenderName origin];
      __int16 v18 = [v17 fromPerson];
      v19 = [v18 displayName];
      v20 = self->_suggestionOriginSenderName;
      self->_suggestionOriginSenderName = v19;
    }
    if (v11)
    {
      v21 = (LSApplicationRecord *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v11 allowPlaceholder:0 error:0];
      applicationRecord = self->_applicationRecord;
      self->_applicationRecord = v21;
    }
  }
  else
  {
    v15 = self->_suggestionOriginSenderName;
    self->_suggestionOriginSenderName = 0;

    id v5 = self->_applicationRecord;
    self->_applicationRecord = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_suggestionOriginSenderName, 0);
  objc_storeStrong((id *)&self->_appNameString, 0);
  objc_storeStrong((id *)&self->_dateString, 0);

  objc_storeStrong((id *)&self->_fromString, 0);
}

@end