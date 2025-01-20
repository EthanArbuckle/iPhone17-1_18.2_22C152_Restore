@interface SXCalendarPresenter
- (SXCalendarPresenter)initWithViewControllerPresenting:(id)a3 eventStoreProvider:(id)a4;
- (SXEventStoreProvider)eventStoreProvider;
- (SXViewControllerPresenting)viewControllerPresenting;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)presentCalendarEvent:(id)a3;
@end

@implementation SXCalendarPresenter

- (SXCalendarPresenter)initWithViewControllerPresenting:(id)a3 eventStoreProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXCalendarPresenter;
  v9 = [(SXCalendarPresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewControllerPresenting, a3);
    objc_storeStrong((id *)&v10->_eventStoreProvider, a4);
  }

  return v10;
}

- (void)presentCalendarEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 startDate];

    if (v6)
    {
      objc_initWeak(&location, self);
      id v7 = dispatch_get_global_queue(25, 0);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke;
      v8[3] = &unk_264651440;
      v8[4] = self;
      objc_copyWeak(&v10, &location);
      id v9 = v5;
      dispatch_async(v7, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke(id *a1)
{
  v2 = [a1[4] eventStoreProvider];
  v3 = [v2 eventStore];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_2;
  v7[3] = &unk_264651418;
  objc_copyWeak(&v11, a1 + 6);
  id v4 = v3;
  id v8 = v4;
  id v5 = a1[5];
  id v6 = a1[4];
  id v9 = v5;
  id v10 = v6;
  [v4 requestWriteOnlyAccessToEventsWithCompletion:v7];

  objc_destroyWeak(&v11);
}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_3;
  block[3] = &unk_2646513F0;
  char v10 = a2;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64) && (id v2 = objc_loadWeakRetained((id *)(a1 + 56)), v2, v2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v3 = [MEMORY[0x263F04B90] eventWithEventStore:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(a1 + 40) startDate];
    [v3 setStartDate:v4];

    id v5 = [*(id *)(a1 + 40) endDate];
    [v3 setEndDate:v5];

    id v6 = [*(id *)(a1 + 40) timeZone];
    [v3 setTimeZone:v6];

    objc_msgSend(v3, "setAllDay:", objc_msgSend(*(id *)(a1 + 40), "allDay"));
    id v7 = [*(id *)(a1 + 40) title];
    [v3 setTitle:v7];

    uint64_t v8 = [*(id *)(a1 + 40) URL];
    [v3 setURL:v8];

    id v9 = [*(id *)(a1 + 40) notes];
    char v10 = [v9 text];
    [v3 setNotes:v10];

    id v11 = [*(id *)(a1 + 40) location];
    [v3 setLocation:v11];

    id v12 = objc_alloc_init(MEMORY[0x263F04C70]);
    [v12 setEventStore:*(void *)(a1 + 32)];
    [v12 setEvent:v3];
    [v12 setEditViewDelegate:WeakRetained];
    v13 = [WeakRetained viewControllerPresenting];
    [v13 presentViewController:v12 animated:1];
  }
  else
  {
    v14 = (void *)MEMORY[0x263F1C3F8];
    v15 = SXBundle();
    v16 = [v15 localizedStringForKey:@"Can’t Access Calendar" value:&stru_26D5311C0 table:0];
    v17 = SXBundle();
    v18 = [v17 localizedStringForKey:@"SXRequirePermissionToAccessCalendar" value:&stru_26D5311C0 table:0];
    id WeakRetained = [v14 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

    v19 = (void *)MEMORY[0x263F1C3F0];
    v20 = SXBundle();
    v21 = [v20 localizedStringForKey:@"OK" value:&stru_26D5311C0 table:0];
    v22 = [v19 actionWithTitle:v21 style:0 handler:0];
    [WeakRetained addAction:v22];

    id v3 = [*(id *)(a1 + 48) viewControllerPresenting];
    [v3 presentViewController:WeakRetained animated:1];
  }
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (SXViewControllerPresenting)viewControllerPresenting
{
  return self->_viewControllerPresenting;
}

- (SXEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
}

@end