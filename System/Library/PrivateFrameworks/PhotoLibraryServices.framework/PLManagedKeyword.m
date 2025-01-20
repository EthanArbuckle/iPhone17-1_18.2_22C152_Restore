@interface PLManagedKeyword
+ (id)entityName;
+ (id)keywordForTitle:(id)a3 context:(id)a4;
+ (id)keywordForUuid:(id)a3 context:(id)a4;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
- (void)awakeFromInsert;
@end

@implementation PLManagedKeyword

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  v5 = [(PLManagedObjectJournalEntryPayload *)[PLKeywordJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"uuid"];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadID
{
  v2 = [(PLManagedKeyword *)self uuid];
  v3 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v2];

  return v3;
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLManagedKeyword;
  [(PLManagedKeyword *)&v4 awakeFromInsert];
  v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLManagedKeyword *)self setUuid:v3];
}

+ (id)keywordForUuid:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PLManagedKeyword fetchRequest];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", v6];

  [v7 setPredicate:v8];
  v9 = [v5 executeFetchRequest:v7 error:0];

  v10 = [v9 firstObject];

  return v10;
}

+ (id)keywordForTitle:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[PLManagedKeyword fetchRequest];
  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"title", v6];

  [v7 setPredicate:v8];
  v9 = [v5 executeFetchRequest:v7 error:0];

  v10 = [v9 firstObject];

  return v10;
}

+ (id)entityName
{
  return @"Keyword";
}

@end