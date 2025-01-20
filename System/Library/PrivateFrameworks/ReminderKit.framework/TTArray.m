@interface TTArray
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsUndoCommands;
- (CRDocument)document;
- (CRUndoDelegate)delegate;
- (NSArray)nsArray;
- (NSString)description;
- (NSUUID)replicaUUID;
- (TTArray)init;
- (TTArray)initWithArchive:(const void *)a3 andReplicaID:(id)a4;
- (TTArray)initWithCRCoder:(id)a3;
- (TTArray)initWithCRCoder:(id)a3 stringArray:(const void *)a4;
- (TTArray)initWithContents:(id)a3;
- (TTArray)initWithDocument:(id)a3;
- (TTMergeableAttributedString)contents;
- (id)objectAtIndex:(unint64_t)a3;
- (id)serializeDataFromArchive:(const void *)a3;
- (id)textAttachmentAtIndex:(unint64_t)a3;
- (id)tombstone;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3;
- (void)addObject:(id)a3;
- (void)addUndoCommand:(id)a3;
- (void)encodeWithCRCoder:(id)a3;
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

@implementation TTArray

- (TTArray)init
{
  v3 = objc_alloc_init(TTMergeableAttributedString);
  v4 = [(TTArray *)self initWithContents:v3];

  return v4;
}

- (TTArray)initWithDocument:(id)a3
{
  id v4 = a3;
  v5 = [TTMergeableAttributedString alloc];
  v6 = [v4 replica];
  v7 = [(TTMergeableString *)v5 initWithReplicaID:v6];
  v8 = [(TTArray *)self initWithContents:v7];

  if (v8) {
    [(TTArray *)v8 setDocument:v4];
  }

  return v8;
}

- (TTArray)initWithContents:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTArray;
  v6 = [(TTArray *)&v8 init];
  if (v6)
  {
    [v5 setDelegate:v6];
    objc_storeStrong((id *)&v6->_contents, a3);
  }

  return v6;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = -[TTArray textAttachmentAtIndex:](self, "textAttachmentAtIndex:");
  if (!v4)
  {
    v6 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TTArray objectAtIndex:](a3, v6);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"TTArray: no object at index %lu", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }

  return v4;
}

- (id)textAttachmentAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  id v14 = 0;
  id v4 = [(TTArray *)self contents];
  id v5 = [v4 attributedString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__TTArray_textAttachmentAtIndex___block_invoke;
  v8[3] = &unk_1E61DE210;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", @"TTArrayAttachment", a3, 1, 0, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __33__TTArray_textAttachmentAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(TTArray *)self insertObject:v4 atIndex:[(TTArray *)self count]];
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__TTArray_indexOfObject___block_invoke;
  v8[3] = &unk_1E61DE238;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(TTArray *)self enumerateObjectsUsingBlock:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __25__TTArray_indexOfObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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
  v12 = @"TTArrayAttachment";
  v13[0] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  objc_msgSend(v9, "setAttributes:range:", v10, 0, 1);
  uint64_t v11 = [(TTArray *)self contents];
  [v11 insertAttributedString:v9 atIndex:a4];
}

- (void)removeLastObject
{
  unint64_t v3 = [(TTArray *)self count];
  if (v3)
  {
    [(TTArray *)self removeObjectAtIndex:v3 - 1];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v4 = [(TTArray *)self contents];
  objc_msgSend(v4, "deleteCharactersInRange:", a3, 1);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  [(TTArray *)self removeObjectAtIndex:a3];
  [(TTArray *)self insertObject:v6 atIndex:a3];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  if ([(TTArray *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      char v7 = 0;
      id v6 = [(TTArray *)self objectAtIndexedSubscript:v5];
      v4[2](v4, v6, v5, &v7);

      if (v7) {
        break;
      }
      ++v5;
    }
    while ([(TTArray *)self count] > v5);
  }
}

- (unint64_t)count
{
  v2 = [(TTArray *)self contents];
  unint64_t v3 = [v2 length];

  return v3;
}

- (NSUUID)replicaUUID
{
  v2 = [(TTArray *)self contents];
  unint64_t v3 = [v2 replicaUUID];

  return (NSUUID *)v3;
}

- (NSString)description
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16;
  uint64_t v11 = __Block_byref_object_dispose__16;
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F1339A18];
  unint64_t v3 = [(TTArray *)self count];
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __22__TTArray_description__block_invoke;
    v6[3] = &unk_1E61DE260;
    v6[4] = &v7;
    v6[5] = v3;
    [(TTArray *)self enumerateObjectsUsingBlock:v6];
    id v4 = (__CFString *)[(id)v8[5] copy];
  }
  else
  {
    id v4 = @"[]";
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __22__TTArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    id v6 = [(TTArray *)self contents];
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
  v2 = [(TTArray *)self contents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)nsArray
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __18__TTArray_nsArray__block_invoke;
  v7[3] = &unk_1E61DE288;
  id v8 = v3;
  id v4 = v3;
  [(TTArray *)self enumerateObjectsUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __18__TTArray_nsArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    id v9 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TTArray mergeWith:](v8, v9);
    }

    id v10 = [NSString stringWithFormat:@"TTArray cannot merge with object of type %@.", v8];
    objc_exception_throw(v10);
  }
  id v11 = v4;
  id v5 = [(TTArray *)self contents];
  id v6 = [v11 contents];

  [v5 mergeWith:v6];
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4 = a3;
  id v5 = [(TTArray *)self contents];
  [v5 realizeLocalChangesIn:v4];
}

- (id)tombstone
{
  v2 = [(TTArray *)self contents];
  unint64_t v3 = [v2 tombstone];

  id v4 = [[TTArray alloc] initWithContents:v3];

  return v4;
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(TTArray *)self contents];
  [v5 walkGraph:v4];
}

- (void)setDocument:(id)a3
{
  p_document = &self->_document;
  id v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  id v6 = [(TTArray *)self contents];
  [v6 setDocument:v5];
}

- (void)addUndoCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(TTArray *)self delegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__TTArray_addUndoCommand___block_invoke;
  v7[3] = &unk_1E61DE2B0;
  id v8 = v4;
  id v6 = v4;
  [v5 addUndoCommandsForObject:self block:v7];
}

void __26__TTArray_addUndoCommand___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 contents];
  [v2 applyToString:v3];
}

- (BOOL)wantsUndoCommands
{
  v2 = [(TTArray *)self delegate];
  char v3 = [v2 wantsUndoCommands];

  return v3;
}

- (CRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);

  return (CRDocument *)WeakRetained;
}

- (CRUndoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRUndoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TTMergeableAttributedString)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_document);
}

- (id)serializeDataFromArchive:(const void *)a3
{
  id v4 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(*(int (**)(const void *))(*(void *)a3 + 72))(a3)];
  id v5 = (void *)[v4 mutableBytes];
  int v6 = TTBoundedCheckedCastNSUIntegerToUInt32([v4 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)a3, v5, v6);

  return v4;
}

- (TTArray)initWithArchive:(const void *)a3 andReplicaID:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v22 = a4;
  if (*((unsigned char *)a3 + 32))
  {
    uint64_t v7 = [TTMergeableAttributedString alloc];
    id v8 = v7;
    uint64_t v9 = *((void *)a3 + 5);
    if (!v9) {
      uint64_t v9 = *(void *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v7) + 40);
    }
    uint64_t v10 = [(TTMergeableString *)v8 initWithArchive:v9 andReplicaID:v22];
    id v11 = (TTMergeableAttributedString *)v10;
    uint64_t v12 = *((int *)a3 + 14);
    if (v12)
    {
      v21 = self;
      uint64_t v13 = (const CRDT::StringArray_ArrayAttachment **)*((void *)a3 + 6);
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
            v17 = [(TTMergeableString *)v11 attributedString];
            v27 = @"TTArrayAttachment";
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
      int v6 = (TTMergeableAttributedString *)v10;
    }
  }
  else
  {
    int v6 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v22];
  }
  v19 = -[TTArray initWithContents:](self, "initWithContents:", v6, v21);

  return v19;
}

- (void)saveToArchive:(void *)a3
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(TTArray *)self contents];
  *((_DWORD *)a3 + 8) |= 1u;
  uint64_t v6 = *((void *)a3 + 5);
  if (!v6) {
    operator new();
  }
  [v5 saveToArchive:v6];

  if ([(TTArray *)self count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [(TTArray *)self objectAtIndexedSubscript:v7];
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
        MEMORY[0x1BA9DB490]();
      }

      ++v7;
    }
    while ([(TTArray *)self count] > v7);
  }
}

- (TTArray)initWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 14) {
    uint64_t v6 = [(TTArray *)self initWithCRCoder:v4 stringArray:*(void *)(v5 + 40)];
  }
  else {
    uint64_t v6 = [(TTArray *)self init];
  }
  unint64_t v7 = v6;

  return v7;
}

- (TTArray)initWithCRCoder:(id)a3 stringArray:(const void *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  if (*((unsigned char *)a4 + 32))
  {
    uint64_t v13 = [TTMergeableAttributedString alloc];
    uint64_t v14 = v13;
    uint64_t v15 = *((void *)a4 + 5);
    if (!v15) {
      uint64_t v15 = *(void *)(CRDT::StringArray::default_instance((CRDT::StringArray *)v13) + 40);
    }
    uint64_t v16 = [(TTMergeableAttributedString *)v14 initWithCRCoder:v28 string:v15];
    v17 = (TTMergeableAttributedString *)v16;
    uint64_t v18 = *((int *)a4 + 14);
    if (v18)
    {
      v27 = self;
      v19 = (const CRDT::StringArray_ArrayAttachment **)*((void *)a4 + 6);
      uint64_t v20 = 8 * v18;
      do
      {
        CRDT::StringArray_ArrayAttachment::StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v29, *v19);
        if ((~v30 & 3) == 0)
        {
          uint64_t v21 = *(char *)(v32 + 23) < 0 ? *(void *)(v32 + 8) : *(unsigned __int8 *)(v32 + 23);
          if (v21 == 16)
          {
            id v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v27];
            v23 = [(TTMergeableString *)v17 attributedString];
            v33 = @"TTArrayAttachment";
            v34[0] = v22;
            int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
            objc_msgSend(v23, "setAttributes:range:", v24, v31, 1);
          }
        }
        CRDT::StringArray_ArrayAttachment::~StringArray_ArrayAttachment((CRDT::StringArray_ArrayAttachment *)v29);
        ++v19;
        v20 -= 8;
      }
      while (v20);
      int v9 = v17;
      self = v27;
    }
    else
    {
      int v9 = (TTMergeableAttributedString *)v16;
    }
  }
  else
  {
    uint64_t v6 = [TTMergeableAttributedString alloc];
    unint64_t v7 = [v28 document];
    id v8 = [v7 replica];
    int v9 = [(TTMergeableString *)v6 initWithReplicaID:v8];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v28 document];
    uint64_t v12 = REMDynamicCast(v10, (uint64_t)v11);

    if (v12) {
      [(TTMergeableString *)v9 setDocument:v12];
    }
  }
  uint64_t v25 = -[TTArray initWithContents:](self, "initWithContents:", v9, v27);

  return v25;
}

- (void)encodeWithCRCoder:(id)a3
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
  [(TTArray *)self saveToArchive:*(void *)(v4 + 40)];
}

- (void)objectAtIndex:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "No object at index %{public}lu", (uint8_t *)&v2, 0xCu);
}

- (void)mergeWith:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Cannot merge with object of type %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end