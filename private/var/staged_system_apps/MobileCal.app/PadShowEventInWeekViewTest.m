@interface PadShowEventInWeekViewTest
- (id)_getEvent;
- (void)_setupViewToDate:(id)a3;
@end

@implementation PadShowEventInWeekViewTest

- (void)_setupViewToDate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplicationTest *)self model];
  [v5 setSelectedDate:v4];

  v6 = [(ApplicationTest *)self application];
  v7 = [v6 rootNavigationController];
  id v8 = [v7 resetToWeekView];

  [(PadShowEventTest *)self setController:v8];
  [v8 setDisplayedDate:v4 animated:0];
}

- (id)_getEvent
{
  v2 = [(PadShowEventTest *)self controller];
  v3 = [v2 visibleWeeks];
  id v4 = [v3 firstObject];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [v4 weekView];
  v6 = [v5 content];
  v7 = [v6 occurrenceViews];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 occurrence];
        if ([v12 isAllDay])
        {
        }
        else
        {
          v13 = [v11 occurrence];

          if (v13)
          {
            id v8 = [v11 occurrence];
            goto LABEL_13;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

@end