@interface ICNote(SearchIndexable_UI)
- (id)dataForTypeIdentifier:()SearchIndexable_UI;
@end

@implementation ICNote(SearchIndexable_UI)

- (id)dataForTypeIdentifier:()SearchIndexable_UI
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__36;
  v17 = __Block_byref_object_dispose__36;
  id v18 = 0;
  v5 = [a1 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__ICNote_SearchIndexable_UI__dataForTypeIdentifier___block_invoke;
  v9[3] = &unk_1E5FD93E0;
  id v6 = v4;
  id v10 = v6;
  v11 = a1;
  v12 = &v13;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

@end