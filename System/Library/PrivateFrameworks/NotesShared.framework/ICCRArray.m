@interface ICCRArray
- (BOOL)isEqual:(id)a3;
- (BOOL)moveClock;
- (BOOL)wantsUndoCommands;
- (ICCRArray)initWithDocument:(id)a3;
- (ICCRArray)initWithICCRCoder:(id)a3;
- (ICCRArray)initWithICCRCoder:(id)a3 array:(const void *)a4;
- (ICCRArray)initWithICTTArray:(id)a3 contents:(id)a4 document:(id)a5;
- (ICCRDictionary)contents;
- (ICCRDocument)document;
- (ICCRUndoDelegate)delegate;
- (ICTTArray)array;
- (NSArray)allObjects;
- (NSString)description;
- (NSUUID)replicaUUID;
- (id)_addObject:(id)a3;
- (id)_insertObject:(id)a3 atIndex:(unint64_t)a4;
- (id)_insertObject:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5 forUndo:(BOOL)a6;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)tombstone;
- (unint64_t)count;
- (unint64_t)firstIndexOf:(id)a3 fromIndex:(unint64_t)a4;
- (unint64_t)hash;
- (void)addObject:(id)a3;
- (void)addUndoCommandsForObject:(id)a3 block:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)encodeWithICCRCoder:(id)a3 array:(void *)a4;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)mergeWith:(id)a3;
- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)realizeLocalChangesIn:(id)a3;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectAtIndex:(unint64_t)a3 forUndo:(BOOL)a4;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setArray:(id)a3;
- (void)setContents:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setMoveClock:(BOOL)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRArray

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 15)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 15;
    operator new();
  }
  [(ICCRArray *)self encodeWithICCRCoder:v6 array:*(void *)(v4 + 40)];
}

- (void)encodeWithICCRCoder:(id)a3 array:(void *)a4
{
  id v10 = a3;
  id v6 = [(ICCRArray *)self array];
  *((_DWORD *)a4 + 8) |= 1u;
  uint64_t v7 = *((void *)a4 + 5);
  if (!v7) {
    operator new();
  }
  [v6 saveToArchive:v7];

  v8 = [(ICCRArray *)self contents];
  *((_DWORD *)a4 + 8) |= 2u;
  uint64_t v9 = *((void *)a4 + 6);
  if (!v9) {
    operator new();
  }
  [v8 encodeWithICCRCoder:v10 dictionary:v9];
}

- (ICCRArray)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 15)
  {
    id v6 = [(ICCRArray *)self initWithICCRCoder:v4 array:*(void *)(v5 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 document];
    id v6 = [(ICCRArray *)self initWithDocument:v7];
  }
  return v6;
}

- (ICCRArray)initWithICCRCoder:(id)a3 array:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = [ICCRDictionary alloc];
  v8 = v7;
  uint64_t v9 = *((void *)a4 + 6);
  if (!v9) {
    uint64_t v9 = *(void *)(CRDT::Array::default_instance((CRDT::Array *)v7) + 48);
  }
  id v10 = [(ICCRDictionary *)v8 initWithICCRCoder:v6 dictionary:v9];
  v11 = [ICTTArray alloc];
  v12 = v11;
  uint64_t v13 = *((void *)a4 + 5);
  if (!v13) {
    uint64_t v13 = *(void *)(CRDT::Array::default_instance((CRDT::Array *)v11) + 40);
  }
  v14 = [(ICTTArray *)v12 initWithICCRCoder:v6 stringArray:v13];
  v15 = [v6 document];
  v16 = [(ICCRArray *)self initWithICTTArray:v14 contents:v10 document:v15];

  return v16;
}

- (ICCRArray)initWithDocument:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [[ICTTArray alloc] initWithDocument:v4];
    id v6 = [[ICCRDictionary alloc] initWithDocument:v4];
    uint64_t v7 = self;
    v8 = v5;
    uint64_t v9 = v6;
    id v10 = v4;
  }
  else
  {
    uint64_t v5 = objc_alloc_init(ICTTArray);
    id v6 = objc_alloc_init(ICCRDictionary);
    uint64_t v7 = self;
    v8 = v5;
    uint64_t v9 = v6;
    id v10 = 0;
  }
  v11 = [(ICCRArray *)v7 initWithICTTArray:v8 contents:v9 document:v10];

  return v11;
}

- (ICCRArray)initWithICTTArray:(id)a3 contents:(id)a4 document:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICCRArray;
  v11 = [(ICCRArray *)&v13 init];
  if (v11)
  {
    [v8 setDelegate:v11];
    [(ICCRArray *)v11 setArray:v8];
    [(ICCRArray *)v11 setContents:v9];
    [(ICCRArray *)v11 setDocument:v10];
  }

  return v11;
}

- (NSArray)allObjects
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[ICCRArray count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__ICCRArray_allObjects__block_invoke;
  v6[3] = &unk_1E64A7630;
  id v4 = v3;
  id v7 = v4;
  [(ICCRArray *)self enumerateObjectsUsingBlock:v6];

  return (NSArray *)v4;
}

uint64_t __23__ICCRArray_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(ICCRArray *)self array];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  id v7 = [(ICCRArray *)self contents];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)addObject:(id)a3
{
  id v3 = [(ICCRArray *)self _addObject:a3];
}

- (id)_addObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRArray *)self _insertObject:v4 atIndex:[(ICCRArray *)self count]];

  return v5;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = [(ICCRArray *)self _insertObject:a3 atIndex:a4];
}

- (id)_insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  id v8 = [v6 UUID];
  id v9 = [(ICCRArray *)self _insertObject:v7 withIdentifier:v8 atIndex:a4 forUndo:0];

  return v9;
}

- (id)_insertObject:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5 forUndo:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a6)
  {
    v12 = [(ICCRArray *)self array];
    [v12 insertObject:v11 atIndex:a5];
  }
  objc_super v13 = [(ICCRArray *)self contents];
  [v13 setObject:v10 forKeyedSubscript:v11];

  if ([(ICCRArray *)self wantsUndoCommands])
  {
    v14 = [(ICCRArray *)self delegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__ICCRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke;
    v16[3] = &unk_1E64A7658;
    id v17 = v11;
    [v14 addUndoCommandsForObject:self block:v16];
  }
  return v11;
}

void __58__ICCRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 array];
  uint64_t v4 = [v3 indexOfObject:*(void *)(a1 + 32)];

  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v4 forUndo:1];
  }
}

- (void)removeLastObject
{
  unint64_t v3 = [(ICCRArray *)self count];
  if (v3)
  {
    [(ICCRArray *)self removeObjectAtIndex:v3 - 1];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)removeObjectAtIndex:(unint64_t)a3 forUndo:(BOOL)a4
{
  id v7 = [(ICCRArray *)self array];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  if ([(ICCRArray *)self wantsUndoCommands])
  {
    id v9 = [(ICCRArray *)self objectAtIndexedSubscript:a3];
    id v10 = [(ICCRArray *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __41__ICCRArray_removeObjectAtIndex_forUndo___block_invoke;
    v14[3] = &unk_1E64A7680;
    id v15 = v9;
    id v16 = v8;
    unint64_t v17 = a3;
    id v11 = v9;
    [v10 addUndoCommandsForObject:self block:v14];
  }
  if (!a4)
  {
    v12 = [(ICCRArray *)self array];
    [v12 removeObjectAtIndex:a3];
  }
  objc_super v13 = [(ICCRArray *)self contents];
  [v13 removeObjectForKey:v8];
}

void __41__ICCRArray_removeObjectAtIndex_forUndo___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t v5 = [v8 count];
  if (v5 >= a1[6]) {
    unint64_t v6 = a1[6];
  }
  else {
    unint64_t v6 = v5;
  }
  id v7 = (id)[v8 _insertObject:v3 withIdentifier:v4 atIndex:v6 forUndo:1];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  [(ICCRArray *)self removeObjectAtIndex:a3];
  [(ICCRArray *)self insertObject:v6 atIndex:a3];
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(ICCRArray *)self array];
  id v10 = [v7 objectAtIndexedSubscript:a3];

  id v8 = [(ICCRArray *)self array];
  [v8 removeObjectAtIndex:a3];

  id v9 = [(ICCRArray *)self array];
  [v9 insertObject:v10 atIndex:a4];

  [(ICCRArray *)self setMoveClock:1];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICCRArray *)self array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ICCRArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E64A76A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __40__ICCRArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 contents];
  id v6 = [v5 objectForKeyedSubscript:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)count
{
  v2 = [(ICCRArray *)self array];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSUUID)replicaUUID
{
  v2 = [(ICCRArray *)self document];
  unint64_t v3 = [v2 replica];

  return (NSUUID *)v3;
}

- (unint64_t)firstIndexOf:(id)a3 fromIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(ICCRArray *)self count] <= a4)
  {
LABEL_4:
    a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      id v7 = [(ICCRArray *)self objectAtIndexedSubscript:a4];
      char v8 = [v7 isEqual:v6];

      if (v8) {
        break;
      }
      if (++a4 >= [(ICCRArray *)self count]) {
        goto LABEL_4;
      }
    }
  }

  return a4;
}

- (NSString)description
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__37;
  id v11 = __Block_byref_object_dispose__37;
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F1F2FFF8];
  unint64_t v3 = [(ICCRArray *)self count];
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __24__ICCRArray_description__block_invoke;
    v6[3] = &unk_1E64A76D0;
    void v6[4] = &v7;
    v6[5] = v3;
    [(ICCRArray *)self enumerateObjectsUsingBlock:v6];
    id v4 = (__CFString *)[(id)v8[5] copy];
  }
  else
  {
    id v4 = @"[]";
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __24__ICCRArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    char v8 = @"]";
  }
  else {
    char v8 = @", ";
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
    id v6 = [(ICCRArray *)self contents];
    uint64_t v7 = [v5 contents];
    if ([v6 isEqual:v7])
    {
      char v8 = [(ICCRArray *)self array];
      id v9 = [v5 array];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ICCRArray *)self contents];
  uint64_t v4 = [v3 hash];
  id v5 = [(ICCRArray *)self array];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)mergeWith:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = os_log_create("com.apple.coreCRDT", "ICTTArray");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICCRArray mergeWith:](v10, v11);
    }

    id v12 = [NSString stringWithFormat:@"ICCRArray cannot merge with object of type %@.", v10];
    objc_exception_throw(v12);
  }
  id v13 = v4;
  id v5 = [(ICCRArray *)self array];
  unint64_t v6 = [v13 array];
  [v5 mergeWith:v6];

  uint64_t v7 = [(ICCRArray *)self contents];
  char v8 = [v13 contents];

  [v7 mergeWith:v8];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(ICCRArray *)self array];
  id v9 = [v8 deltaSince:v7 in:v6];

  uint64_t v10 = [(ICCRArray *)self contents];
  id v11 = [v10 deltaSince:v7 in:v6];

  id v12 = [[ICCRArray alloc] initWithICTTArray:v9 contents:v11 document:v6];
  return v12;
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v6 = a3;
  id v4 = [(ICCRArray *)self array];
  [v4 realizeLocalChangesIn:v6];

  id v5 = [(ICCRArray *)self contents];
  [v5 realizeLocalChangesIn:v6];

  if ([(ICCRArray *)self moveClock]) {
    objc_msgSend(v6, "setUnserializedReplicaClock:", objc_msgSend(v6, "unserializedReplicaClock") + -[ICCRArray moveClock](self, "moveClock"));
  }
  [(ICCRArray *)self setMoveClock:0];
}

- (id)tombstone
{
  unint64_t v3 = [(ICCRArray *)self array];
  id v4 = [v3 tombstone];

  id v5 = [(ICCRArray *)self contents];
  id v6 = [v5 tombstone];

  id v7 = [ICCRArray alloc];
  char v8 = [(ICCRArray *)self document];
  id v9 = [(ICCRArray *)v7 initWithICTTArray:v4 contents:v6 document:v8];

  return v9;
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRArray *)self array];
  [v5 walkGraph:v4];

  id v6 = [(ICCRArray *)self contents];
  [v6 walkGraph:v4];
}

- (void)setDocument:(id)a3
{
  p_document = &self->_document;
  id v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  id v6 = [(ICCRArray *)self array];
  [v6 setDocument:v5];

  id v7 = [(ICCRArray *)self contents];
  [v7 setDocument:v5];
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = [(ICCRArray *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__ICCRArray_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E64A76F8;
  id v9 = v5;
  id v7 = v5;
  [v6 addUndoCommandsForObject:self block:v8];
}

void __44__ICCRArray_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 array];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)wantsUndoCommands
{
  uint64_t v2 = [(ICCRArray *)self delegate];
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

- (ICTTArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
}

- (ICCRDictionary)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (BOOL)moveClock
{
  return self->_moveClock;
}

- (void)setMoveClock:(BOOL)a3
{
  self->_moveClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_array, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
}

- (void)mergeWith:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Cannot merge with object of type %@.", (uint8_t *)&v2, 0xCu);
}

@end