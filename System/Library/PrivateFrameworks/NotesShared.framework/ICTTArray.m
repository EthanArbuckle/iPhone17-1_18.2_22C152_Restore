@interface ICTTArray
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsUndoCommands;
- (ICCRDocument)document;
- (ICCRUndoDelegate)delegate;
- (ICTTArray)init;
- (ICTTArray)initWithArchive:(const void *)a3 replicaID:(id)a4;
- (ICTTArray)initWithContents:(id)a3;
- (ICTTArray)initWithDocument:(id)a3;
- (ICTTArray)initWithICCRCoder:(id)a3;
- (ICTTArray)initWithICCRCoder:(id)a3 stringArray:(const void *)a4;
- (ICTTMergeableAttributedString)contents;
- (NSArray)nsArray;
- (NSString)description;
- (NSUUID)replicaUUID;
- (id)objectAtIndex:(unint64_t)a3;
- (id)serializeDataFromArchive:(const void *)a3;
- (id)textAttachmentAtIndex:(unint64_t)a3;
- (id)tombstone;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3;
- (void)addObject:(id)a3;
- (void)addUndoCommand:(id)a3;
- (void)encodeWithICCRCoder:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)mergeWith:(id)a3;
- (void)realizeLocalChangesIn:(id)a3;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)saveToArchive:(void *)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICTTArray

- (id)serializeDataFromArchive:(const void *)a3
{
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(*(int (**)(const void *))(*(void *)a3 + 72))(a3)];
  v5 = (void *)[v4 mutableBytes];
  int v6 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v4 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, v5, v6);
  return v4;
}

- (ICTTArray)initWithArchive:(const void *)a3 replicaID:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  if (*((unsigned char *)a3 + 32))
  {
    v7 = [ICTTMergeableAttributedString alloc];
    v8 = v7;
    uint64_t v9 = *((void *)a3 + 5);
    if (!v9) {
      uint64_t v9 = *(void *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v7) + 40);
    }
    uint64_t v10 = [(ICTTMergeableString *)v8 initWithArchive:v9 replicaID:v22];
    v11 = (ICTTMergeableAttributedString *)v10;
    uint64_t v12 = *((int *)a3 + 14);
    if (v12)
    {
      v21 = self;
      v13 = (const CRDT::StringArray_ArrayAttachment **)*((void *)a3 + 6);
      uint64_t v14 = 8 * v12;
      do
      {
        CRDT::StringArray_ArrayAttachment::StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v23, *v13);
        if ((~v24 & 3) == 0)
        {
          if (*(char *)(v26 + 23) < 0) {
            uint64_t v15 = *(void *)(v26 + 8);
          }
          else {
            uint64_t v15 = *(unsigned __int8 *)(v26 + 23);
          }
          if (v15 == 16)
          {
            v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v21];
            v17 = [(ICTTMergeableString *)v11 attributedString];
            v27 = @"ICTTArrayAttachment";
            v28[0] = v16;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
            objc_msgSend(v17, "setAttributes:range:", v18, v25, 1);
          }
        }
        CRDT::StringArray_ArrayAttachment::~StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v23);
        ++v13;
        v14 -= 8;
      }
      while (v14);
      int v6 = v11;
      self = v21;
    }
    else
    {
      int v6 = (ICTTMergeableAttributedString *)v10;
    }
  }
  else
  {
    int v6 = [(ICTTMergeableString *)[ICTTMergeableAttributedString alloc] initWithReplicaID:v22];
  }
  v19 = -[ICTTArray initWithContents:](self, "initWithContents:", v6, v21);

  return v19;
}

- (void)saveToArchive:(void *)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = [(ICTTArray *)self contents];
  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v6 = *((void *)a3 + 5);
  if (!v6) {
    operator new();
  }
  [v5 saveToArchive:v6];

  if ([(ICTTArray *)self count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(ICTTArray *)self objectAtIndexedSubscript:v7];
      if (v8)
      {
        int v9 = *((_DWORD *)a3 + 15);
        uint64_t v10 = *((int *)a3 + 14);
        if ((int)v10 >= v9)
        {
          if (v9 == *((_DWORD *)a3 + 16)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 48, v9 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<CRDT::StringArray_ArrayAttachment>::New();
        }
        uint64_t v11 = *((void *)a3 + 6);
        *((_DWORD *)a3 + 14) = v10 + 1;
        uint64_t v12 = *(void *)(v11 + 8 * v10);
        *(_DWORD *)(v12 + 32) |= 1u;
        *(void *)(v12 + 40) = v7;
        v13[0] = 0;
        v13[1] = 0;
        [v8 getUUIDBytes:v13];
        *(_DWORD *)(v12 + 32) |= 2u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*(void *)(v12 + 48) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1C877D5C0]();
      }

      ++v7;
    }
    while ([(ICTTArray *)self count] > v7);
  }
}

- (ICTTArray)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 14) {
    uint64_t v6 = [(ICTTArray *)self initWithICCRCoder:v4 stringArray:*(void *)(v5 + 40)];
  }
  else {
    uint64_t v6 = [(ICTTArray *)self init];
  }
  unint64_t v7 = v6;

  return v7;
}

- (ICTTArray)initWithICCRCoder:(id)a3 stringArray:(const void *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (*((unsigned char *)a4 + 32))
  {
    uint64_t v12 = [ICTTMergeableAttributedString alloc];
    v13 = v12;
    uint64_t v14 = *((void *)a4 + 5);
    if (!v14) {
      uint64_t v14 = *(void *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v12) + 40);
    }
    uint64_t v15 = [(ICTTMergeableAttributedString *)v13 initWithICCRCoder:v27 string:v14];
    v16 = (ICTTMergeableAttributedString *)v15;
    uint64_t v17 = *((int *)a4 + 14);
    if (v17)
    {
      uint64_t v26 = self;
      v18 = (const CRDT::StringArray_ArrayAttachment **)*((void *)a4 + 6);
      uint64_t v19 = 8 * v17;
      do
      {
        CRDT::StringArray_ArrayAttachment::StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v28, *v18);
        if ((~v29 & 3) == 0)
        {
          uint64_t v20 = *(char *)(v31 + 23) < 0 ? *(void *)(v31 + 8) : *(unsigned __int8 *)(v31 + 23);
          if (v20 == 16)
          {
            v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v26];
            id v22 = [(ICTTMergeableString *)v16 attributedString];
            v32 = @"ICTTArrayAttachment";
            v33[0] = v21;
            v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
            objc_msgSend(v22, "setAttributes:range:", v23, v30, 1);
          }
        }
        CRDT::StringArray_ArrayAttachment::~StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v28);
        ++v18;
        v19 -= 8;
      }
      while (v19);
      int v9 = v16;
      self = v26;
    }
    else
    {
      int v9 = (ICTTMergeableAttributedString *)v15;
    }
  }
  else
  {
    uint64_t v6 = [ICTTMergeableAttributedString alloc];
    unint64_t v7 = [v27 document];
    v8 = [v7 replica];
    int v9 = [(ICTTMergeableString *)v6 initWithReplicaID:v8];

    objc_opt_class();
    uint64_t v10 = [v27 document];
    uint64_t v11 = ICDynamicCast();

    if (v11) {
      [(ICTTMergeableString *)v9 setDocument:v11];
    }
  }
  int v24 = -[ICTTArray initWithContents:](self, "initWithContents:", v9, v26);

  return v24;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 14)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 14;
    operator new();
  }
  [(ICTTArray *)self saveToArchive:*(void *)(v4 + 40)];
}

- (ICTTArray)init
{
  v3 = [ICTTMergeableAttributedString alloc];
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [(ICTTMergeableString *)v3 initWithReplicaID:v4];
  id v6 = [(ICTTArray *)self initWithContents:v5];

  return v6;
}

- (ICTTArray)initWithDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [ICTTMergeableAttributedString alloc];
  id v6 = [v4 replica];
  unint64_t v7 = [(ICTTMergeableString *)v5 initWithReplicaID:v6];
  v8 = [(ICTTArray *)self initWithContents:v7];

  if (v8) {
    [(ICTTArray *)v8 setDocument:v4];
  }

  return v8;
}

- (ICTTArray)initWithContents:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICTTArray;
  id v6 = [(ICTTArray *)&v8 init];
  if (v6)
  {
    [v5 setDelegate:v6];
    objc_storeStrong((id *)&v6->_contents, a3);
  }

  return v6;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = -[ICTTArray textAttachmentAtIndex:](self, "textAttachmentAtIndex:");
  if (!v4)
  {
    id v6 = os_log_create("com.apple.coreCRDT", "ICTTArray");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICTTArray objectAtIndex:](a3, v6);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"ICTTArray: no object at index %lu", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  return v4;
}

- (id)textAttachmentAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__56;
  v13 = __Block_byref_object_dispose__56;
  id v14 = 0;
  id v4 = [(ICTTArray *)self contents];
  id v5 = [v4 attributedString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__ICTTArray_textAttachmentAtIndex___block_invoke;
  v8[3] = &unk_1E64A4AF0;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", @"ICTTArrayAttachment", a3, 1, 0, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __35__ICTTArray_textAttachmentAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(ICTTArray *)self insertObject:v4 atIndex:[(ICTTArray *)self count]];
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__ICTTArray_indexOfObject___block_invoke;
  v8[3] = &unk_1E64A95E8;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(ICTTArray *)self enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __27__ICTTArray_indexOfObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a2, "CR_compare:", *(void *)(a1 + 32));
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (objc_class *)NSString;
  id v7 = a3;
  objc_super v8 = (void *)[[v6 alloc] initWithUTF8String:"\uFFFC"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
  uint64_t v12 = @"ICTTArrayAttachment";
  v13[0] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  objc_msgSend(v9, "setAttributes:range:", v10, 0, 1);
  uint64_t v11 = [(ICTTArray *)self contents];
  [v11 insertAttributedString:v9 atIndex:a4];
}

- (void)removeLastObject
{
  unint64_t v3 = [(ICTTArray *)self count];
  if (v3)
  {
    [(ICTTArray *)self removeObjectAtIndex:v3 - 1];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v4 = [(ICTTArray *)self contents];
  objc_msgSend(v4, "deleteCharactersInRange:", a3, 1);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  [(ICTTArray *)self removeObjectAtIndex:a3];
  [(ICTTArray *)self insertObject:v6 atIndex:a3];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  if ([(ICTTArray *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      char v7 = 0;
      id v6 = [(ICTTArray *)self objectAtIndexedSubscript:v5];
      v4[2](v4, v6, v5, &v7);

      if (v7) {
        break;
      }
      ++v5;
    }
    while ([(ICTTArray *)self count] > v5);
  }
}

- (unint64_t)count
{
  v2 = [(ICTTArray *)self contents];
  unint64_t v3 = [v2 length];

  return v3;
}

- (NSUUID)replicaUUID
{
  v2 = [(ICTTArray *)self contents];
  unint64_t v3 = [v2 replicaUUID];

  return (NSUUID *)v3;
}

- (NSString)description
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__56;
  uint64_t v11 = __Block_byref_object_dispose__56;
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F1F2FFF8];
  unint64_t v3 = [(ICTTArray *)self count];
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __24__ICTTArray_description__block_invoke;
    v6[3] = &unk_1E64A9610;
    v6[4] = &v7;
    v6[5] = v3;
    [(ICTTArray *)self enumerateObjectsUsingBlock:v6];
    id v4 = (__CFString *)[(id)v8[5] copy];
  }
  else
  {
    id v4 = @"[]";
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__ICTTArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (!a3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:@"["];
    id v5 = v9;
  }
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v7 = [v5 description];
  [v6 appendString:v7];

  if (*(void *)(a1 + 40) - 1 == a3) {
    objc_super v8 = @"]";
  }
  else {
    objc_super v8 = @", ";
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ICTTArray *)self contents];
    uint64_t v7 = [v5 contents];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(ICTTArray *)self contents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)nsArray
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __20__ICTTArray_nsArray__block_invoke;
  v7[3] = &unk_1E64A9638;
  id v8 = v3;
  id v4 = v3;
  [(ICTTArray *)self enumerateObjectsUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __20__ICTTArray_nsArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:a3];
}

- (void)mergeWith:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = os_log_create("com.apple.coreCRDT", "ICTTArray");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICCRArray mergeWith:](v8, v9);
    }

    id v10 = [NSString stringWithFormat:@"ICTTArray cannot merge with object of type %@.", v8];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  id v5 = [(ICTTArray *)self contents];
  id v6 = [v11 contents];

  [v5 mergeWith:v6];
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTArray *)self contents];
  [v5 realizeLocalChangesIn:v4];
}

- (id)tombstone
{
  v2 = [(ICTTArray *)self contents];
  unint64_t v3 = [v2 tombstone];

  id v4 = [[ICTTArray alloc] initWithContents:v3];
  return v4;
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTArray *)self contents];
  [v5 walkGraph:v4];
}

- (void)setDocument:(id)a3
{
  p_document = &self->_document;
  id v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  id v6 = [(ICTTArray *)self contents];
  [v6 setDocument:v5];
}

- (void)addUndoCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTTArray *)self delegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__ICTTArray_addUndoCommand___block_invoke;
  v7[3] = &unk_1E64A9660;
  id v8 = v4;
  id v6 = v4;
  [v5 addUndoCommandsForObject:self block:v7];
}

void __28__ICTTArray_addUndoCommand___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 contents];
  [v2 applyToString:v3];
}

- (BOOL)wantsUndoCommands
{
  v2 = [(ICTTArray *)self delegate];
  char v3 = [v2 wantsUndoCommands];

  return v3;
}

- (ICCRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ICCRDocument *)WeakRetained;
}

- (ICCRUndoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICCRUndoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICTTMergeableAttributedString)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
}

- (void)objectAtIndex:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "No object at index %lu", (uint8_t *)&v2, 0xCu);
}

@end