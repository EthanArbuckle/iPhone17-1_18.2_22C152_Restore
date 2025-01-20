@interface SXCalendarEventActionActivityProvider
- (SXCalendarEventActionActivityProvider)initWithCalendarPresenter:(id)a3 host:(id)a4;
- (SXCalendarPresenter)calendarPresenter;
- (SXHost)host;
- (id)activityGroupForAction:(id)a3;
- (void)createEvent:(id)a3;
- (void)showInCalendar:(id)a3;
@end

@implementation SXCalendarEventActionActivityProvider

- (SXCalendarEventActionActivityProvider)initWithCalendarPresenter:(id)a3 host:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXCalendarEventActionActivityProvider;
  v9 = [(SXCalendarEventActionActivityProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendarPresenter, a3);
    objc_storeStrong((id *)&v10->_host, a4);
  }

  return v10;
}

- (id)activityGroupForAction:(id)a3
{
  id v4 = a3;
  v5 = [SXActionActivityGroup alloc];
  v6 = [v4 title];
  id v7 = [(SXActionActivityGroup *)v5 initWithTitle:v6];

  id v8 = [SXBlockActionActivity alloc];
  v9 = SXBundle();
  v10 = [v9 localizedStringForKey:@"Create Event" value:&stru_26D5311C0 table:0];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke;
  v25[3] = &unk_2646512B0;
  v25[4] = self;
  id v11 = v4;
  id v26 = v11;
  objc_super v12 = [(SXBlockActionActivity *)v8 initWithLabel:v10 type:0 block:v25];
  [(SXActionActivityGroup *)v7 addActivity:v12];

  v13 = [SXBlockActionActivity alloc];
  v14 = SXBundle();
  v15 = [v14 localizedStringForKey:@"Show in Calendar" value:&stru_26D5311C0 table:0];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke_2;
  v22 = &unk_2646512B0;
  v23 = self;
  id v24 = v11;
  id v16 = v11;
  v17 = [(SXBlockActionActivity *)v13 initWithLabel:v15 type:1 block:&v19];
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v17, v19, v20, v21, v22, v23);

  return v7;
}

uint64_t __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createEvent:*(void *)(a1 + 40)];
}

uint64_t __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) showInCalendar:*(void *)(a1 + 40)];
}

- (void)createEvent:(id)a3
{
  id v4 = a3;
  v5 = [SXPresentableCalendarEvent alloc];
  v6 = [v4 startDate];
  v14 = [(SXPresentableCalendarEvent *)v5 initWithStartDate:v6];

  id v7 = [v4 endDate];
  [(SXPresentableCalendarEvent *)v14 setEndDate:v7];

  id v8 = [v4 timeZone];
  [(SXPresentableCalendarEvent *)v14 setTimeZone:v8];

  -[SXPresentableCalendarEvent setAllDay:](v14, "setAllDay:", [v4 allDay]);
  v9 = [v4 title];
  [(SXPresentableCalendarEvent *)v14 setTitle:v9];

  v10 = [v4 URL];
  [(SXPresentableCalendarEvent *)v14 setURL:v10];

  id v11 = [v4 notes];
  [(SXPresentableCalendarEvent *)v14 setNotes:v11];

  objc_super v12 = [v4 location];

  [(SXPresentableCalendarEvent *)v14 setLocation:v12];
  v13 = [(SXCalendarEventActionActivityProvider *)self calendarPresenter];
  [v13 presentCalendarEvent:v14];
}

- (void)showInCalendar:(id)a3
{
  id v4 = NSURL;
  v5 = NSString;
  v6 = [a3 startDate];
  [v6 timeIntervalSinceReferenceDate];
  id v8 = objc_msgSend(v5, "stringWithFormat:", @"calshow:%d", (int)v7);
  id v10 = [v4 URLWithString:v8];

  v9 = [(SXCalendarEventActionActivityProvider *)self host];
  [v9 openURL:v10 completion:0];
}

- (SXCalendarPresenter)calendarPresenter
{
  return self->_calendarPresenter;
}

- (SXHost)host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_calendarPresenter, 0);
}

@end