@interface ML3SortMapFaultingEntryArray
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation ML3SortMapFaultingEntryArray

void __64__ML3SortMapFaultingEntryArray_enumerateDirtyObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3, uint64_t a4)
{
  if (a3[36])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = a3;
    (*(void (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v6 + 16))(v6, v7, [a2 integerValue], a4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyInserts, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  dirtyInserts = self->_dirtyInserts;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)dirtyInserts setObject:v7 forKey:v8];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6243;
  v19 = __Block_byref_object_dispose__6244;
  id v20 = 0;
  dirtyInserts = self->_dirtyInserts;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke;
  v14[3] = &unk_1E5FB44F0;
  v14[4] = &v15;
  v14[5] = a3;
  [(NSMutableDictionary *)dirtyInserts enumerateKeysAndObjectsUsingBlock:v14];
  if (v16[5]) {
    -[NSMutableDictionary removeObjectForKey:](self->_dirtyInserts, "removeObjectForKey:");
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_dirtyInserts, "count"));
  id v7 = self->_dirtyInserts;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke_2;
  v11[3] = &unk_1E5FB44A0;
  unint64_t v13 = a3;
  id v8 = v6;
  v12 = v8;
  [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v11];
  v9 = self->_dirtyInserts;
  self->_dirtyInserts = v8;
  v10 = v8;

  _Block_object_dispose(&v15, 8);
}

void __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) integerValue] == *(void *)(a1 + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __52__ML3SortMapFaultingEntryArray_removeObjectAtIndex___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  unint64_t v6 = [v5 integerValue];
  uint64_t v8 = a1 + 32;
  id v7 = *(void **)(a1 + 32);
  if (v6 > *(void *)(v8 + 8))
  {
    v9 = NSNumber;
    uint64_t v10 = [v5 integerValue];

    id v5 = [v9 numberWithInteger:v10 - 1];
  }
  [v7 setObject:v11 forKey:v5];
}

- (void)removeLastObject
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6243;
  v9 = __Block_byref_object_dispose__6244;
  id v10 = 0;
  dirtyInserts = self->_dirtyInserts;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__ML3SortMapFaultingEntryArray_removeLastObject__block_invoke;
  v4[3] = &unk_1E5FB44C8;
  v4[4] = &v5;
  [(NSMutableDictionary *)dirtyInserts enumerateKeysAndObjectsUsingBlock:v4];
  if (v6[5]) {
    -[NSMutableDictionary removeObjectForKey:](self->_dirtyInserts, "removeObjectForKey:");
  }
  _Block_object_dispose(&v5, 8);
}

void __48__ML3SortMapFaultingEntryArray_removeLastObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v8)
  {
    uint64_t v9 = [v8 integerValue];
    if (v9 >= [v10 integerValue]) {
      goto LABEL_5;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v7 + 40), a2);
LABEL_5:
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  dirtyInserts = self->_dirtyInserts;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v6, "dictionaryWithCapacity:", -[NSMutableDictionary count](dirtyInserts, "count"));
  id v10 = self->_dirtyInserts;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __53__ML3SortMapFaultingEntryArray_insertObject_atIndex___block_invoke;
  v19 = &unk_1E5FB44A0;
  unint64_t v21 = a4;
  id v11 = v9;
  id v20 = v11;
  [(NSMutableDictionary *)v10 enumerateKeysAndObjectsUsingBlock:&v16];
  v12 = self->_dirtyInserts;
  self->_dirtyInserts = v11;
  unint64_t v13 = v11;

  v14 = self->_dirtyInserts;
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4, v16, v17, v18, v19);
  [(NSMutableDictionary *)v14 setObject:v8 forKey:v15];
}

void __53__ML3SortMapFaultingEntryArray_insertObject_atIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  unint64_t v6 = [v5 integerValue];
  uint64_t v8 = a1 + 32;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6 >= *(void *)(v8 + 8))
  {
    uint64_t v9 = NSNumber;
    uint64_t v10 = [v5 integerValue];

    id v5 = [v9 numberWithInteger:v10 + 1];
  }
  [v7 setObject:v11 forKey:v5];
}

- (void)addObject:(id)a3
{
  dirtyInserts = self->_dirtyInserts;
  id v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", -[ML3SortMapFaultingEntryArray count](self, "count"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)dirtyInserts setObject:v6 forKey:v7];
}

- (id)objectAtIndex:(unint64_t)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__6243;
  dirtyInserts = self->_dirtyInserts;
  unint64_t v21 = __Block_byref_object_dispose__6244;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke;
  v16[3] = &unk_1E5FB4478;
  v16[5] = &v23;
  v16[6] = a3;
  v16[4] = &v17;
  [(NSMutableDictionary *)dirtyInserts enumerateKeysAndObjectsUsingBlock:v16];
  id v7 = (void *)v18[5];
  if (!v7)
  {
    connection = self->_connection;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3 - *((int *)v24 + 6)];
    v27[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v11 = [(ML3DatabaseConnection *)connection executeQuery:@"SELECT name, name_order, name_section, sort_key FROM sort_map ORDER BY name_order LIMIT 1 OFFSET ?" withParameters:v10];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke_2;
    v15[3] = &unk_1E5FB77B8;
    v15[4] = &v17;
    [v11 enumerateRowsWithBlock:v15];

    id v7 = (void *)v18[5];
    if (!v7)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ML3SortMap.m", 1135, @"Did not find object at index %ld with %ld inserted objects", a3, -[NSMutableDictionary count](self->_dirtyInserts, "count"));

      id v7 = (void *)v18[5];
    }
  }
  id v12 = v7;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);

  return v12;
}

void __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([v8 integerValue] == a1[6])
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    *a4 = 1;
  }
  if ((unint64_t)[v8 integerValue] < a1[6]) {
    ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  }
}

void __46__ML3SortMapFaultingEntryArray_objectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 stringForColumnIndex:0];
  uint64_t v4 = [v3 int64ForColumnIndex:1];
  uint64_t v5 = [v3 intForColumnIndex:2];
  id v6 = [v3 dataForColumnIndex:3];

  id v7 = [[ML3MusicLibrary_SortMapEntry alloc] initWithName:v10 nameSection:v5 sortKey:v6 nameOrder:v4 dirtyFlag:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (unint64_t)count
{
  id v3 = [(ML3DatabaseConnection *)self->_connection executeQuery:@"SELECT COUNT() from sort_map"];
  uint64_t v4 = [v3 int64ValueForFirstRowAndColumn];
  unint64_t v5 = [(NSMutableDictionary *)self->_dirtyInserts count] + v4;

  return v5;
}

@end