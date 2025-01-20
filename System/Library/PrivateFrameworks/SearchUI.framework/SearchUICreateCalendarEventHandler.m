@interface SearchUICreateCalendarEventHandler
- (BOOL)prefersContextMenu;
- (BOOL)prefersModalPresentation;
- (id)createViewControllerForCommand:(id)a3 environment:(id)a4;
- (id)eventFromSFCalendarEvent:(id)a3 eventStore:(id)a4;
- (unint64_t)destination;
@end

@implementation SearchUICreateCalendarEventHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6 = a4;
  v7 = [a3 event];
  if (v7)
  {
    v8 = [v6 presentingViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v10 = objc_opt_new();
      v11 = [(SearchUICreateCalendarEventHandler *)self eventFromSFCalendarEvent:v7 eventStore:v10];
      v12 = objc_opt_new();
      [v12 setEventStore:v10];
      [v12 setEvent:v11];
      v13 = [v6 presentingViewController];
      [v12 setEditViewDelegate:v13];

      goto LABEL_9;
    }
    v14 = SearchUITapLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SearchUICreateCalendarEventHandler createViewControllerForCommand:environment:](v14);
    }
  }
  else
  {
    v14 = SearchUITapLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SearchUICreateCalendarEventHandler createViewControllerForCommand:environment:](v14);
    }
  }

  v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (unint64_t)destination
{
  if ([MEMORY[0x1E4FAE198] isMacOS]) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)eventFromSFCalendarEvent:(id)a3 eventStore:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F25538];
  id v7 = a4;
  v8 = [v6 eventWithEventStore:v7];
  v9 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  [v8 setTimeZone:v9];

  v10 = [v5 title];
  [v8 setTitle:v10];

  objc_msgSend(v8, "setAllDay:", objc_msgSend(v5, "isAllDay"));
  v11 = [v5 startDate];
  [v8 setStartDate:v11];

  v12 = [v5 endDate];
  [v8 setEndDate:v12];

  v13 = [v5 notes];
  [v8 setNotes:v13];

  v14 = [v7 defaultCalendarForNewEvents];

  [v8 setCalendar:v14];
  uint64_t v15 = [v5 location];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v5 location];
    v18 = [v17 geoLocation];

    if (v18)
    {
      v19 = objc_opt_new();
      v20 = [v5 location];
      v21 = [v20 title];
      [v19 setTitle:v21];

      id v22 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      v23 = [v5 location];
      v24 = [v23 geoLocation];
      [v24 lat];
      double v26 = v25;
      v27 = [v5 location];
      v28 = [v27 geoLocation];
      [v28 lng];
      v30 = (void *)[v22 initWithLatitude:v26 longitude:v29];
      [v19 setGeoLocation:v30];

      v31 = [v5 location];
      [v31 radius];
      objc_msgSend(v19, "setRadius:");

      [v8 setStructuredLocation:v19];
    }
  }

  return v8;
}

- (void)createViewControllerForCommand:(os_log_t)log environment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Error performing SFCreateCalendarEventCommand: No calendar event provided.", v1, 2u);
}

- (void)createViewControllerForCommand:(os_log_t)log environment:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Error performing SFCreateCalendarEventCommand: no presentingViewController controller available", v1, 2u);
}

@end