@interface _NEKSyncSet
- (NSArray)calendars;
- (NSArray)events;
- (NSArray)stores;
- (NSArray)tasks;
- (void)setCalendars:(id)a3;
- (void)setEvents:(id)a3;
- (void)setStores:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation _NEKSyncSet

- (NSArray)stores
{
  return self->_stores;
}

- (void)setStores:(id)a3
{
}

- (NSArray)calendars
{
  return self->_calendars;
}

- (void)setCalendars:(id)a3
{
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_calendars, 0);

  objc_storeStrong((id *)&self->_stores, 0);
}

@end