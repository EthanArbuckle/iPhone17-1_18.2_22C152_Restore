@interface CDCloudSyncVersions
- (CDCloudSyncVersions)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSPersistentHistoryToken)historyToken;
- (id)mutableCopy;
- (void)setHistoryToken:(id)a3;
@end

@implementation CDCloudSyncVersions

- (id)mutableCopy
{
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for CDMutableCloudSyncVersions());
  v4 = self;
  id v5 = sub_22AF0(v4, v3);

  return v5;
}

- (NSPersistentHistoryToken)historyToken
{
  v2 = self;
  v3 = (void *)sub_20F6C();

  return (NSPersistentHistoryToken *)v3;
}

- (void)setHistoryToken:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_21274(a3);
}

- (CDCloudSyncVersions)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CDCloudSyncVersions();
  return [(CDCloudSyncVersions *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end