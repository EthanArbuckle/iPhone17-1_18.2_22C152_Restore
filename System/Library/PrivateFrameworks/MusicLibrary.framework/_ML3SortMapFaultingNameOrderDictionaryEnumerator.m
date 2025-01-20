@interface _ML3SortMapFaultingNameOrderDictionaryEnumerator
- (_ML3SortMapFaultingNameOrderDictionaryEnumerator)initWithDirtyInsertsEnumerator:(id)a3 connection:(id)a4;
- (id)nextObject;
@end

@implementation _ML3SortMapFaultingNameOrderDictionaryEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_dirtyInsertsEnumerator, 0);
}

- (id)nextObject
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6243;
  v17 = __Block_byref_object_dispose__6244;
  id v18 = [(NSEnumerator *)self->_dirtyInsertsEnumerator nextObject];
  v4 = (void *)v14[5];
  if (!v4)
  {
    connection = self->_connection;
    v6 = NSNumber;
    ++self->_offset;
    v7 = objc_msgSend(v6, "numberWithUnsignedInteger:");
    v19[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v9 = [(ML3DatabaseConnection *)connection executeQuery:@"SELECT name, name_order, name_section FROM sort_map LIMIT 1 OFFSET ?" withParameters:v8];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62___ML3SortMapFaultingNameOrderDictionaryEnumerator_nextObject__block_invoke;
    v12[3] = &unk_1E5FB4540;
    v12[5] = &v13;
    v12[6] = a2;
    v12[4] = self;
    [v9 enumerateRowsWithBlock:v12];

    v4 = (void *)v14[5];
  }
  id v10 = v4;
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (_ML3SortMapFaultingNameOrderDictionaryEnumerator)initWithDirtyInsertsEnumerator:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ML3SortMapFaultingNameOrderDictionaryEnumerator;
  v9 = [(_ML3SortMapFaultingNameOrderDictionaryEnumerator *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a4);
    objc_storeStrong((id *)&v10->_dirtyInsertsEnumerator, a3);
  }

  return v10;
}

@end