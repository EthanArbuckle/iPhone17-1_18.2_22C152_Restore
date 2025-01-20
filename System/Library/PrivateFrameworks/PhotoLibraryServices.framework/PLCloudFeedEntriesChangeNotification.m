@interface PLCloudFeedEntriesChangeNotification
+ (id)notificationWithFullReload;
+ (id)notificationWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5;
- (BOOL)shouldReload;
- (NSSet)deletedEntries;
- (NSSet)insertedEntries;
- (NSSet)updatedEntries;
- (id)_initWithFullReload;
- (id)_initWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5;
- (id)name;
- (id)object;
- (id)userInfo;
- (void)setDeletedEntries:(id)a3;
- (void)setInsertedEntries:(id)a3;
- (void)setShouldReload:(BOOL)a3;
- (void)setUpdatedEntries:(id)a3;
@end

@implementation PLCloudFeedEntriesChangeNotification

+ (id)notificationWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithInsertedEntries:v10 updatedEntries:v9 deletedEntries:v8];

  return v11;
}

+ (id)notificationWithFullReload
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithFullReload];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedEntries, 0);
  objc_storeStrong((id *)&self->_updatedEntries, 0);
  objc_storeStrong((id *)&self->_insertedEntries, 0);
}

- (void)setDeletedEntries:(id)a3
{
}

- (NSSet)deletedEntries
{
  return self->_deletedEntries;
}

- (void)setUpdatedEntries:(id)a3
{
}

- (NSSet)updatedEntries
{
  return self->_updatedEntries;
}

- (void)setInsertedEntries:(id)a3
{
}

- (NSSet)insertedEntries
{
  return self->_insertedEntries;
}

- (void)setShouldReload:(BOOL)a3
{
  self->_shouldReload = a3;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (id)userInfo
{
  return 0;
}

- (id)object
{
  return 0;
}

- (id)name
{
  v2 = @"PLCloudFeedEntriesDidChangeNotification";
  return @"PLCloudFeedEntriesDidChangeNotification";
}

- (id)_initWithInsertedEntries:(id)a3 updatedEntries:(id)a4 deletedEntries:(id)a5
{
  if (self)
  {
    id v8 = a5;
    id v9 = a4;
    [(PLCloudFeedEntriesChangeNotification *)self setInsertedEntries:a3];
    [(PLCloudFeedEntriesChangeNotification *)self setUpdatedEntries:v9];

    [(PLCloudFeedEntriesChangeNotification *)self setDeletedEntries:v8];
  }
  return self;
}

- (id)_initWithFullReload
{
  if (self) {
    [(PLCloudFeedEntriesChangeNotification *)self setShouldReload:1];
  }
  return self;
}

@end