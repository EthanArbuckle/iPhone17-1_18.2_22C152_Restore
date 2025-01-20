@interface CarplayTableViewSection
+ (void)registerClassesOnTableView:(id)a3;
- (BOOL)_cellInRowIsCollapsedAllDayCell:(int64_t)a3;
- (BOOL)_shouldCollapseAllDayEventsAccordingToPolicy;
- (BOOL)paddingCellEnabled;
- (CarplayTableViewSection)initWithPaddingCellEnabled:(BOOL)a3 titleForSectionHeader:(id)a4 shouldCollapseMultipleAllDayEvents:(BOOL)a5 model:(id)a6;
- (NSArray)events;
- (NSString)sectionTitle;
- (double)heightForHeaderInSection;
- (id)_reusableOccurrenceTableViewCellForEvent:(id)a3 underDate:(id)a4 inTableView:(id)a5;
- (id)cellForRow:(int64_t)a3 underDate:(id)a4 inTableView:(id)a5;
- (id)headerForSectionInTableView:(id)a3;
- (id)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (int64_t)_birthdayCount;
- (int64_t)numberOfRows;
- (void)setEvents:(id)a3;
- (void)setPaddingCellEnabled:(BOOL)a3;
- (void)setSectionTitle:(id)a3;
- (void)updateWithEvents:(id)a3;
@end

@implementation CarplayTableViewSection

- (CarplayTableViewSection)initWithPaddingCellEnabled:(BOOL)a3 titleForSectionHeader:(id)a4 shouldCollapseMultipleAllDayEvents:(BOOL)a5 model:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CarplayTableViewSection;
  v13 = [(CarplayTableViewSection *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_paddingCellEnabled = a3;
    objc_storeStrong((id *)&v13->_sectionTitle, a4);
    v14->_shouldCollapseAllDay = a5;
    v14->_currentlyCollapsed = 1;
    objc_storeStrong((id *)&v14->_model, a6);
  }

  return v14;
}

- (void)updateWithEvents:(id)a3
{
  v4 = +[NSArray arrayWithArray:a3];
  events = self->_events;
  self->_events = v4;

  v6 = (NSArray *)objc_opt_new();
  v7 = (NSArray *)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->_events;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "isAllDay", (void)v18)) {
          v14 = v6;
        }
        else {
          v14 = v7;
        }
        [(NSArray *)v14 addObject:v13];
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  allDayEvents = self->_allDayEvents;
  self->_allDayEvents = v6;
  objc_super v16 = v6;

  timedEvents = self->_timedEvents;
  self->_timedEvents = v7;
}

- (int64_t)numberOfRows
{
  BOOL paddingCellEnabled = self->_paddingCellEnabled;
  if (![(NSArray *)self->_events count]) {
    return paddingCellEnabled + 1;
  }
  if ([(CarplayTableViewSection *)self _shouldCollapseAllDayEventsAccordingToPolicy])
  {
    return [(NSArray *)self->_timedEvents count] + paddingCellEnabled + 1;
  }
  return [(NSArray *)self->_events count] + paddingCellEnabled;
}

- (id)cellForRow:(int64_t)a3 underDate:(id)a4 inTableView:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(CarplayTableViewSection *)self _cellInRowIsCollapsedAllDayCell:a3])
  {
    id v10 = +[CarplayCollapsedAllDayTableViewCell reuseIdentifier];
    uint64_t v11 = [[CarplayCollapsedAllDayTableViewCell alloc] initWithStyle:0 reuseIdentifier:v10];
    [(CarplayCollapsedAllDayTableViewCell *)v11 configureWithAllDayCount:(unsigned char *)[(NSArray *)self->_allDayEvents count]- (unsigned char *)[(CarplayTableViewSection *)self _birthdayCount] birthdayCount:[(CarplayTableViewSection *)self _birthdayCount]];
  }
  else
  {
    if (!([(NSArray *)self->_events count] | a3)
      || self->_paddingCellEnabled
      && (char *)[(CarplayTableViewSection *)self numberOfRows] - 1 == (unsigned char *)a3)
    {
      uint64_t v11 = (CarplayCollapsedAllDayTableViewCell *)objc_opt_new();
      goto LABEL_12;
    }
    if ([(CarplayTableViewSection *)self _shouldCollapseAllDayEventsAccordingToPolicy])
    {
      timedEvents = self->_timedEvents;
      int64_t v13 = a3 - 1;
    }
    else
    {
      timedEvents = self->_events;
      int64_t v13 = a3;
    }
    id v10 = [(NSArray *)timedEvents objectAtIndexedSubscript:v13];
    uint64_t v11 = [(CarplayTableViewSection *)self _reusableOccurrenceTableViewCellForEvent:v10 underDate:v8 inTableView:v9];
  }

LABEL_12:

  return v11;
}

- (id)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CarplayTableViewSection _cellInRowIsCollapsedAllDayCell:](self, "_cellInRowIsCollapsedAllDayCell:", [v7 row]))
  {
    dispatch_time_t v8 = dispatch_time(0, 480000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100126248;
    block[3] = &unk_1001D28A8;
    block[4] = self;
    id v9 = v6;
    id v41 = v9;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    id v10 = objc_opt_new();
    if ([(NSArray *)self->_allDayEvents count] >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        id v12 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, [v7 section]);
        [v10 addObject:v12];

        ++v11;
      }
      while (v11 < [(NSArray *)self->_allDayEvents count]);
    }
    int64_t v13 = [v9 cellForRowAtIndexPath:v7];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10012625C;
    v35[3] = &unk_1001D2EB8;
    v35[4] = self;
    id v36 = v7;
    id v37 = v9;
    id v38 = v13;
    id v39 = v10;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100126308;
    v33[3] = &unk_1001D27D8;
    id v34 = v37;
    id v14 = v10;
    id v15 = v13;
    [v34 performBatchUpdates:v35 completion:v33];

    objc_super v16 = 0;
  }
  else
  {
    if ([(CarplayTableViewSection *)self _shouldCollapseAllDayEventsAccordingToPolicy])
    {
      timedEvents = self->_timedEvents;
      long long v18 = (char *)[v7 row] - 1;
    }
    else
    {
      timedEvents = self->_events;
      long long v18 = (char *)[v7 row];
    }
    long long v19 = [(NSArray *)timedEvents objectAtIndexedSubscript:v18];
    long long v20 = [v19 birthdayContactIdentifier];

    if (v20)
    {
      long long v21 = +[CalContactsProvider defaultProvider];
      v22 = [v19 birthdayContactIdentifier];
      v23 = +[CNStarkCardViewController descriptorForRequiredKeys];
      v45 = v23;
      v24 = +[NSArray arrayWithObjects:&v45 count:1];
      v25 = [v21 unifiedContactWithIdentifier:v22 keysToFetch:v24];

      objc_super v16 = +[CNStarkCardViewController starkCardControllerForCalendarEventWithContact:v25];
    }
    else if ([v19 isIntegrationEvent])
    {
      if (objc_msgSend(v19, "CUIK_reminderShouldBeEditable"))
      {
        [v19 setCompleted:^[v19 completed] ^ 1];
        v26 = [v6 EKUI_editor];
        id v32 = 0;
        unsigned __int8 v27 = [v26 saveEvent:v19 span:0 error:&v32];
        id v28 = v32;

        if ((v27 & 1) == 0)
        {
          v29 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v44 = v28;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
          }
        }
        id v42 = v7;
        v30 = +[NSArray arrayWithObjects:&v42 count:1];
        [v6 reloadRowsAtIndexPaths:v30 withRowAnimation:100];
      }
      objc_super v16 = 0;
    }
    else
    {
      objc_super v16 = [[CarplayDetailViewController alloc] initWithEvent:v19 showDayName:0];
    }
  }

  return v16;
}

- (id)headerForSectionInTableView:(id)a3
{
  if (self->_sectionTitle)
  {
    id v4 = a3;
    v5 = +[CarplayTableViewHeaderView reuseIdentifier];
    id v6 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v5];

    [v6 setHeaderText:self->_sectionTitle];
    [v6 setAnyCalendarsHiddenByFocus:[self->_model focusFilterMode] == 1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (double)heightForHeaderInSection
{
  +[CarplayTableViewHeaderView height];
  return result;
}

+ (void)registerClassesOnTableView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[CarplayTableViewHeaderView reuseIdentifier];
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  id v7 = (objc_class *)objc_opt_class();
  dispatch_time_t v8 = NSStringFromClass(v7);
  [v3 registerClass:v6 forCellReuseIdentifier:v8];

  uint64_t v9 = objc_opt_class();
  id v10 = (objc_class *)objc_opt_class();
  unint64_t v11 = NSStringFromClass(v10);
  [v3 registerClass:v9 forCellReuseIdentifier:v11];

  uint64_t v12 = objc_opt_class();
  int64_t v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  [v3 registerClass:v12 forCellReuseIdentifier:v14];

  uint64_t v15 = objc_opt_class();
  id v16 = +[CarplayCollapsedAllDayTableViewCell reuseIdentifier];
  [v3 registerClass:v15 forCellReuseIdentifier:v16];
}

- (BOOL)_shouldCollapseAllDayEventsAccordingToPolicy
{
  return [(NSArray *)self->_allDayEvents count] >= 2
      && [(NSArray *)self->_events count] >= 5
      && self->_shouldCollapseAllDay
      && self->_currentlyCollapsed;
}

- (id)_reusableOccurrenceTableViewCellForEvent:(id)a3 underDate:(id)a4 inTableView:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isReminderIntegrationEvent])
  {
    dispatch_time_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = (objc_class *)EKUIListViewReminderCell;
LABEL_5:
    id v12 = [[v10 alloc] initForCarplayWithReuseIdentifier:v9];
    [v12 updateWithEvent:v6 dimmed:0];
    goto LABEL_7;
  }
  if ([v6 isAllDay])
  {
    unint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v11);
    id v10 = (objc_class *)EKUIListViewAllDayEventCell;
    goto LABEL_5;
  }
  int64_t v13 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v13);
  id v12 = [objc_alloc((Class)EKUIListViewTimedEventCell) initForCarplayWithReuseIdentifier:v9];
  id v14 = +[NSCalendar currentCalendar];
  uint64_t v15 = [v6 startDate];
  id v16 = [v6 endDateUnadjustedForLegacyClients];
  id v17 = [v14 cal_isMultidayEventForUIWithStartDate:v15 endDate:v16];

  [v12 updateWithEvent:v6 isMultiday:v17 occurrenceStartDate:v7 dimmed:0];
LABEL_7:

  return v12;
}

- (int64_t)_birthdayCount
{
  allDayEvents = self->_allDayEvents;
  id v3 = +[NSPredicate predicateWithBlock:&stru_1001D5E30];
  uint64_t v4 = [(NSArray *)allDayEvents filteredArrayUsingPredicate:v3];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (BOOL)_cellInRowIsCollapsedAllDayCell:(int64_t)a3
{
  BOOL result = [(CarplayTableViewSection *)self _shouldCollapseAllDayEventsAccordingToPolicy];
  if (a3) {
    return 0;
  }
  return result;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (BOOL)paddingCellEnabled
{
  return self->_paddingCellEnabled;
}

- (void)setPaddingCellEnabled:(BOOL)a3
{
  self->_BOOL paddingCellEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_timedEvents, 0);

  objc_storeStrong((id *)&self->_allDayEvents, 0);
}

@end