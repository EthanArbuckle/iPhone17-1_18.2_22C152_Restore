@interface ICMergeableDictionary
- (ICCRDictionary)dictionary;
- (ICCRDocument)document;
- (ICMergeableDictionary)initWithData:(id)a3 replicaID:(id)a4;
- (NSArray)allKeys;
- (NSUUID)replicaID;
- (id)description;
- (id)encodedData;
- (id)objectForKey:(id)a3;
- (unint64_t)mergeWithDictionary:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation ICMergeableDictionary

- (ICMergeableDictionary)initWithData:(id)a3 replicaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICMergeableDictionary;
  v8 = [(ICMergeableDictionary *)&v19 init];
  if (!v8) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v14 = [[ICCRDocument alloc] initWithReplica:v7];
    document = v8->_document;
    v8->_document = v14;

    v16 = [[ICCRDictionary alloc] initWithDocument:v8->_document];
    dictionary = v8->_dictionary;
    v8->_dictionary = v16;

    [(ICCRDocument *)v8->_document setRootObject:v8->_dictionary];
    goto LABEL_6;
  }
  uint64_t v9 = +[ICCRCoderUnarchiver decodedDocumentFromData:v6 replica:v7];
  v10 = v8->_document;
  v8->_document = (ICCRDocument *)v9;

  uint64_t v11 = [(ICCRDocument *)v8->_document rootObject];
  v12 = v8->_dictionary;
  v8->_dictionary = (ICCRDictionary *)v11;

  if (v8->_document)
  {
LABEL_6:
    v13 = v8;
    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ICMergeableDictionary *)self dictionary];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (ICCRDictionary)dictionary
{
  return self->_dictionary;
}

- (id)description
{
  v2 = [(ICMergeableDictionary *)self dictionary];
  v3 = [v2 description];

  return v3;
}

- (NSArray)allKeys
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(ICMergeableDictionary *)self dictionary];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(ICMergeableDictionary *)self dictionary];
  id v7 = [v6 keyEnumerator];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return (NSArray *)v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ICMergeableDictionary *)self objectForKey:v6];

  if (v7) {
    [(ICMergeableDictionary *)self removeObjectForKey:v6];
  }
  if (v9)
  {
    uint64_t v8 = [(ICMergeableDictionary *)self dictionary];
    [v8 setObject:v9 forKey:v6];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ICMergeableDictionary *)self dictionary];
  [v5 removeObjectForKey:v4];
}

- (void)removeAllObjects
{
  id v2 = [(ICMergeableDictionary *)self dictionary];
  [v2 removeAllObjects];
}

- (NSUUID)replicaID
{
  id v2 = [(ICMergeableDictionary *)self document];
  v3 = [v2 replica];

  return (NSUUID *)v3;
}

- (id)encodedData
{
  id v2 = [(ICMergeableDictionary *)self document];
  v3 = [v2 archivedData];

  return v3;
}

- (unint64_t)mergeWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(ICMergeableDictionary *)self document];
  id v6 = [v4 document];
  id v7 = [v6 archivedData];
  uint64_t v8 = [v5 mergeWithData:v7];

  if (v8 == 2)
  {
    unint64_t v10 = 2;
  }
  else if (v8)
  {
    unint64_t v10 = 1;
  }
  else
  {
    id v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ICMergeableDictionary *)(uint64_t)self mergeWithDictionary:v9];
    }

    unint64_t v10 = 0;
  }

  return v10;
}

- (ICCRDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

- (void)mergeWithDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Failed to merge %@ with %@", (uint8_t *)&v3, 0x16u);
}

@end