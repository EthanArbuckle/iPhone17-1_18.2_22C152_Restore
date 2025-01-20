@interface SRResearchDaysViewController
- (NSArray)tombstones;
- (NSMutableSet)deletedDays;
- (SRResearchDaysViewController)init;
- (double)end;
- (id)dateForRow:(int64_t)a3;
- (id)datesFrom:(double)a3 to:(double)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfDays;
- (void)dealloc;
- (void)setDeletedDays:(id)a3;
- (void)setEnd:(double)a3;
- (void)setNumberOfDays:(int64_t)a3;
- (void)setTombstones:(id)a3;
- (void)viewDidLoad;
@end

@implementation SRResearchDaysViewController

- (SRResearchDaysViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SRResearchDaysViewController;
  return [(SRResearchDaysViewController *)&v3 initWithStyle:2];
}

- (void)viewDidLoad
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SRResearchDaysViewController;
  [(SRResearchDaysViewController *)&v17 viewDidLoad];
  -[SRResearchDaysViewController setDeletedDays:](self, "setDeletedDays:", [MEMORY[0x263EFF9C0] set]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(SRResearchDaysViewController *)self tombstones];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v8 reason])
        {
          v9 = [(SRResearchDaysViewController *)self deletedDays];
          [v8 startTime];
          double v11 = v10;
          [v8 endTime];
          [(NSMutableSet *)v9 addObjectsFromArray:[(SRResearchDaysViewController *)self datesFrom:v11 to:v12]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  [(SRResearchDaysViewController *)self setTombstones:0];
  [(SRResearchDaysViewController *)self setDeletedDays:0];
  v3.receiver = self;
  v3.super_class = (Class)SRResearchDaysViewController;
  [(SRResearchDaysViewController *)&v3 dealloc];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (id)objc_msgSend((id)-[SRResearchDaysViewController tableView](self, "tableView", a3), "dequeueReusableCellWithIdentifier:", @"SRDataDayRowReuseIdentifier");
  if (!v6)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"SRDataDayRowReuseIdentifier"];
    [v6 setSelectionStyle:0];
  }
  id v7 = -[SRResearchDaysViewController dateForRow:](self, "dateForRow:", [a4 row]);
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(MEMORY[0x263F08790], "localizedStringFromDate:dateStyle:timeStyle:", v7, 2, 0));
  if ([(NSMutableSet *)[(SRResearchDaysViewController *)self deletedDays] containsObject:v7])uint64_t v8 = 3; {
  else
  }
    uint64_t v8 = 4;
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", v8));
  return v6;
}

- (id)dateForRow:(int64_t)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = (void *)MEMORY[0x263EFF910];
  [(SRResearchDaysViewController *)self end];
  uint64_t v7 = objc_msgSend(v5, "startOfDayForDate:", objc_msgSend(v6, "dateWithSRAbsoluteTime:"));
  id v8 = (id)objc_opt_new();
  [v8 setDay:-a3];
  return (id)[v5 dateByAddingComponents:v8 toDate:v7 options:0];
}

- (id)datesFrom:(double)a3 to:(double)a4
{
  id v6 = (void *)[MEMORY[0x263EFF980] array];
  if (a3 <= a4)
  {
    id v8 = (void *)[MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v9 = objc_msgSend(v8, "startOfDayForDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithSRAbsoluteTime:", a3));
    uint64_t v10 = objc_msgSend(v8, "startOfDayForDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithSRAbsoluteTime:", a4));
    id v11 = (id)objc_opt_new();
    [v11 setDay:-1];
    for (uint64_t i = (void *)v10; [i compare:v9] != -1; v10 = (uint64_t)i)
    {
      [v6 addObject:v10];
      uint64_t i = (void *)[v8 dateByAddingComponents:v11 toDate:v10 options:0];
    }
  }
  return v6;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (int64_t)numberOfDays
{
  return self->_numberOfDays;
}

- (void)setNumberOfDays:(int64_t)a3
{
  self->_numberOfDays = a3;
}

- (NSArray)tombstones
{
  return self->_tombstones;
}

- (void)setTombstones:(id)a3
{
}

- (NSMutableSet)deletedDays
{
  return self->_deletedDays;
}

- (void)setDeletedDays:(id)a3
{
}

@end