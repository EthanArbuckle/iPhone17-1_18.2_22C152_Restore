@interface PPEventStorageGuardedData
- (PPEventStorageGuardedData)init;
- (id)ekStore;
@end

@implementation PPEventStorageGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarObjectIDs, 0);
  objc_storeStrong((id *)&self->_invisibleCalendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarIdentifiers, 0);
  objc_storeStrong((id *)&self->_ekStorePurger, 0);
}

- (id)ekStore
{
  v3 = (void *)MEMORY[0x1CB79D060](self, a2);
  v4 = [(EKTimedEventStorePurger *)self->_ekStorePurger acquireCachedEventStoreOrCreate:1];
  return v4;
}

- (PPEventStorageGuardedData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPEventStorageGuardedData;
  result = [(PPEventStorageGuardedData *)&v3 init];
  if (result) {
    result->_activeNoPurgeSessions = 0;
  }
  return result;
}

@end