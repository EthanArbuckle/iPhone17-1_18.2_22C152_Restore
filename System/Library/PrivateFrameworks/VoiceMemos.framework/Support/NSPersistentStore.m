@interface NSPersistentStore
- (BOOL)saveVoiceMemosMetadata:(id)a3 error:(id *)a4;
- (BOOL)saveVoiceMemosMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (NSCloudKitMirroringDelegate)rc_mirroringDelegate;
- (NSDictionary)voiceMemosMetadata;
@end

@implementation NSPersistentStore

- (NSCloudKitMirroringDelegate)rc_mirroringDelegate
{
  v2 = [(NSPersistentStore *)self options];
  v3 = [v2 objectForKeyedSubscript:NSPersistentStoreMirroringOptionsKey];

  if (v3)
  {
    v4 = [v3 objectForKeyedSubscript:NSPersistentStoreMirroringDelegateOptionKey];
  }
  else
  {
    v4 = 0;
  }

  return (NSCloudKitMirroringDelegate *)v4;
}

- (NSDictionary)voiceMemosMetadata
{
  v2 = [(NSPersistentStore *)self metadata];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.VoiceMemos.DatabaseProperties"];
  v4 = v3;
  if (!v3) {
    v3 = &__NSArray0__struct;
  }
  v5 = v3;

  return v5;
}

- (BOOL)saveVoiceMemosMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  v8 = [(NSPersistentStore *)self persistentStoreCoordinator];
  [v7 setPersistentStoreCoordinator:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000AB58;
  v12[3] = &unk_100038BA0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  LOBYTE(a4) = objc_msgSend(v9, "rc_performAndWaitReturningError:block:", a4, v12);

  return (char)a4;
}

- (BOOL)saveVoiceMemosMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NSPersistentStore *)self voiceMemosMetadata];
  id v11 = [v10 mutableCopy];

  [v11 setObject:v9 forKeyedSubscript:v8];
  LOBYTE(a5) = [(NSPersistentStore *)self saveVoiceMemosMetadata:v11 error:a5];

  return (char)a5;
}

@end