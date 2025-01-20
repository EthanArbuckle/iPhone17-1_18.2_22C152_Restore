@interface PLSuggestionComputePayloadAdapter
- (BOOL)isValidForJournalPersistence;
- (PLSuggestionComputePayloadAdapter)initWithManagedObject:(id)a3 suggestionTypes:(id)a4;
- (id)payloadForChangedKeys:(id)a3;
- (id)payloadID;
- (id)payloadIDForTombstone:(id)a3;
@end

@implementation PLSuggestionComputePayloadAdapter

- (void).cxx_destruct
{
}

- (id)payloadIDForTombstone:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"uuid"];
  v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLSuggestionComputePayloadAdapter *)self isValidForJournalPersistence]) {
    v5 = [(PLManagedObjectJournalEntryPayload *)[PLSuggestionComputeJournalEntryPayload alloc] initWithInsertAdapter:self changedKeys:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)payloadID
{
  v2 = [(PLSuggestionComputePayloadAdapter *)self suggestion];
  v3 = [v2 uuid];
  id v4 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v3];

  return v4;
}

- (BOOL)isValidForJournalPersistence
{
  suggestionTypes = self->_suggestionTypes;
  id v4 = NSNumber;
  v5 = [(PLSuggestionComputePayloadAdapter *)self suggestion];
  v6 = objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(v5, "type"));
  BOOL v7 = [(NSSet *)suggestionTypes containsObject:v6];

  if (v7)
  {
    v8 = [(PLSuggestionComputePayloadAdapter *)self suggestion];
    v9 = [v8 keyAssets];

    if ([v9 count] == 1)
    {
      v10 = [v9 anyObject];
      LOBYTE(v7) = [v10 trashedState] == 0;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (PLSuggestionComputePayloadAdapter)initWithManagedObject:(id)a3 suggestionTypes:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLSuggestionComputePayloadAdapter;
  BOOL v7 = [(PLJournalEntryPayloadUpdateAdapter *)&v11 initWithManagedObject:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    suggestionTypes = v7->_suggestionTypes;
    v7->_suggestionTypes = (NSSet *)v8;
  }
  return v7;
}

@end