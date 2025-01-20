@interface PLAmbientSuggestionComputeJournalEntryPayload
+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4;
+ (id)payloadAdapterForManagedObject:(id)a3;
+ (id)payloadClassID;
+ (id)snapshotSortDescriptors;
+ (id)supportedSuggestionTypes;
+ (unsigned)minimumSnapshotPayloadVersion;
+ (unsigned)payloadVersion;
@end

@implementation PLAmbientSuggestionComputeJournalEntryPayload

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 supportedSuggestionTypes];
  LOBYTE(a1) = [a1 isValidForPersistenceWithObjectDictionary:v7 additionalEntityName:v6 suggestionTypes:v8];

  return (char)a1;
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v4 = a3;
  v5 = [PLAmbientSuggestionComputePayloadAdapter alloc];
  id v6 = [a1 supportedSuggestionTypes];
  id v7 = [(PLSuggestionComputePayloadAdapter *)v5 initWithManagedObject:v4 suggestionTypes:v6];

  return v7;
}

+ (id)supportedSuggestionTypes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEBF22D0];
}

+ (id)snapshotSortDescriptors
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (id)payloadClassID
{
  v2 = NSString;
  v3 = [a1 entityName];
  id v4 = [v2 stringWithFormat:@"Ambient%@Compute", v3];

  return v4;
}

@end