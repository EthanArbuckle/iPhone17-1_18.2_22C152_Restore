@interface NSOrderedSet(SafariExtras)
- (SetChange)safari_changeFromSet:()SafariExtras withModificationCheck:;
@end

@implementation NSOrderedSet(SafariExtras)

- (SetChange)safari_changeFromSet:()SafariExtras withModificationCheck:
{
  id v6 = a3;
  id v7 = a4;
  if (a1 == v6)
  {
    v19 = +[SetChange emptyChange];
    goto LABEL_13;
  }
  if ([a1 count])
  {
    if ([v6 count])
    {
      v8 = -[NSOrderedSet safari_indexesNotInSet:](v6, a1);
      v9 = -[NSOrderedSet safari_indexesNotInSet:](a1, v6);
      v10 = (void *)MEMORY[0x1E4F1CA80];
      unint64_t v11 = [a1 count];
      if (v11 >= [v6 count]) {
        v12 = v6;
      }
      else {
        v12 = a1;
      }
      v13 = objc_msgSend(v10, "setWithCapacity:", objc_msgSend(v12, "count"));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __73__NSOrderedSet_SafariExtras__safari_changeFromSet_withModificationCheck___block_invoke;
      v22[3] = &unk_1E6D7EBB0;
      v22[4] = a1;
      id v23 = v8;
      id v24 = v9;
      id v25 = v13;
      id v26 = v7;
      id v14 = v13;
      id v15 = v9;
      id v16 = v8;
      [v6 enumerateObjectsUsingBlock:v22];
      v17 = [SetChange alloc];
      v18 = [MEMORY[0x1E4F28D60] indexSet];
      v19 = [(SetChange *)v17 initWithInsertedIndexes:v15 deletedIndexes:v16 modifiedIndexes:v18 moves:v14];

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(a1, "count"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [[SetChange alloc] initAsInsertAllWithIndexes:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [[SetChange alloc] initAsDeleteAllWithIndexes:v16];
  }
  v19 = v20;
LABEL_12:

LABEL_13:
  return v19;
}

@end