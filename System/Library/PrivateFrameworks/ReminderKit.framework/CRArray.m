@interface CRArray
- (BOOL)isEqual:(id)a3;
- (BOOL)moveClock;
- (BOOL)wantsUndoCommands;
- (CRArray)init;
- (CRArray)initWithCRCoder:(id)a3;
- (CRArray)initWithCRCoder:(id)a3 array:(const void *)a4;
- (CRArray)initWithDocument:(id)a3;
- (CRArray)initWithTTArray:(id)a3 contents:(id)a4 document:(id)a5;
- (CRDictionary)contents;
- (CRDocument)document;
- (CRUndoDelegate)delegate;
- (NSString)description;
- (NSUUID)replicaUUID;
- (TTArray)array;
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
- (void)encodeWithCRCoder:(id)a3;
- (void)encodeWithCRCoder:(id)a3 array:(void *)a4;
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

@implementation CRArray

- (CRArray)init
{
  return 0;
}

- (CRArray)initWithDocument:(id)a3
{
  id v4 = a3;
  v5 = [[TTArray alloc] initWithDocument:v4];
  v6 = [[CRDictionary alloc] initWithDocument:v4];
  v7 = [(CRArray *)self initWithTTArray:v5 contents:v6 document:v4];

  return v7;
}

- (CRArray)initWithTTArray:(id)a3 contents:(id)a4 document:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRArray;
  v11 = [(CRArray *)&v13 init];
  if (v11)
  {
    [v8 setDelegate:v11];
    [(CRArray *)v11 setArray:v8];
    [(CRArray *)v11 setContents:v9];
    [(CRArray *)v11 setDocument:v10];
  }

  return v11;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v5 = [(CRArray *)self array];
  v6 = [v5 objectAtIndexedSubscript:a3];

  v7 = [(CRArray *)self contents];
  id v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)addObject:(id)a3
{
  id v3 = [(CRArray *)self _addObject:a3];
}

- (id)_addObject:(id)a3
{
  id v4 = a3;
  v5 = [(CRArray *)self _insertObject:v4 atIndex:[(CRArray *)self count]];

  return v5;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = [(CRArray *)self _insertObject:a3 atIndex:a4];
}

- (id)_insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  id v8 = [v6 UUID];
  id v9 = [(CRArray *)self _insertObject:v7 withIdentifier:v8 atIndex:a4 forUndo:0];

  return v9;
}

- (id)_insertObject:(id)a3 withIdentifier:(id)a4 atIndex:(unint64_t)a5 forUndo:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!a6)
  {
    v12 = [(CRArray *)self array];
    [v12 insertObject:v11 atIndex:a5];
  }
  objc_super v13 = [(CRArray *)self contents];
  [v13 setObject:v10 forKeyedSubscript:v11];

  if ([(CRArray *)self wantsUndoCommands])
  {
    v14 = [(CRArray *)self delegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__CRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke;
    v16[3] = &unk_1E61DE300;
    id v17 = v11;
    [v14 addUndoCommandsForObject:self block:v16];
  }

  return v11;
}

void __56__CRArray__insertObject_withIdentifier_atIndex_forUndo___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v3 = [(CRArray *)self count];
  if (v3)
  {
    [(CRArray *)self removeObjectAtIndex:v3 - 1];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
}

- (void)removeObjectAtIndex:(unint64_t)a3 forUndo:(BOOL)a4
{
  id v7 = [(CRArray *)self array];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  if ([(CRArray *)self wantsUndoCommands])
  {
    id v9 = [(CRArray *)self objectAtIndexedSubscript:a3];
    id v10 = [(CRArray *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__CRArray_removeObjectAtIndex_forUndo___block_invoke;
    v14[3] = &unk_1E61DE328;
    id v15 = v9;
    id v16 = v8;
    unint64_t v17 = a3;
    id v11 = v9;
    [v10 addUndoCommandsForObject:self block:v14];
  }
  if (!a4)
  {
    v12 = [(CRArray *)self array];
    [v12 removeObjectAtIndex:a3];
  }
  objc_super v13 = [(CRArray *)self contents];
  [v13 removeObjectForKey:v8];
}

void __39__CRArray_removeObjectAtIndex_forUndo___block_invoke(void *a1, void *a2)
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
  [(CRArray *)self removeObjectAtIndex:a3];
  [(CRArray *)self insertObject:v6 atIndex:a3];
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(CRArray *)self array];
  id v10 = [v7 objectAtIndexedSubscript:a3];

  id v8 = [(CRArray *)self array];
  [v8 removeObjectAtIndex:a3];

  id v9 = [(CRArray *)self array];
  [v9 insertObject:v10 atIndex:a4];

  [(CRArray *)self setMoveClock:1];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRArray *)self array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CRArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E61DE350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __38__CRArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unint64_t v5 = [v3 contents];
  id v6 = [v5 objectForKeyedSubscript:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)count
{
  v2 = [(CRArray *)self array];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSUUID)replicaUUID
{
  v2 = [(CRArray *)self document];
  unint64_t v3 = [v2 replica];

  return (NSUUID *)v3;
}

- (unint64_t)firstIndexOf:(id)a3 fromIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(CRArray *)self count] <= a4)
  {
LABEL_4:
    a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      id v7 = [(CRArray *)self objectAtIndexedSubscript:a4];
      char v8 = [v7 isEqual:v6];

      if (v8) {
        break;
      }
      if (++a4 >= [(CRArray *)self count]) {
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
  id v10 = __Block_byref_object_copy__17;
  id v11 = __Block_byref_object_dispose__17;
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F1339A18];
  unint64_t v3 = [(CRArray *)self count];
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __22__CRArray_description__block_invoke;
    v6[3] = &unk_1E61DE378;
    v6[4] = &v7;
    v6[5] = v3;
    [(CRArray *)self enumerateObjectsUsingBlock:v6];
    id v4 = (__CFString *)[(id)v8[5] copy];
  }
  else
  {
    id v4 = @"[]";
  }
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __22__CRArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    id v6 = [(CRArray *)self contents];
    uint64_t v7 = [v5 contents];
    if ([v6 isEqual:v7])
    {
      char v8 = [(CRArray *)self array];
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
  unint64_t v3 = [(CRArray *)self contents];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRArray *)self array];
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
    id v11 = os_log_create("com.apple.coreCRDT", "TTArray");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TTArray mergeWith:](v10, v11);
    }

    id v12 = [NSString stringWithFormat:@"CRArray cannot merge with object of type %@.", v10];
    objc_exception_throw(v12);
  }
  id v13 = v4;
  id v5 = [(CRArray *)self array];
  unint64_t v6 = [v13 array];
  [v5 mergeWith:v6];

  uint64_t v7 = [(CRArray *)self contents];
  char v8 = [v13 contents];

  [v7 mergeWith:v8];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(CRArray *)self array];
  id v9 = [v8 deltaSince:v7 in:v6];

  uint64_t v10 = [(CRArray *)self contents];
  id v11 = [v10 deltaSince:v7 in:v6];

  id v12 = [[CRArray alloc] initWithTTArray:v9 contents:v11 document:v6];

  return v12;
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v6 = a3;
  id v4 = [(CRArray *)self array];
  [v4 realizeLocalChangesIn:v6];

  id v5 = [(CRArray *)self contents];
  [v5 realizeLocalChangesIn:v6];

  if ([(CRArray *)self moveClock]) {
    objc_msgSend(v6, "setUnserializedReplicaClock:", objc_msgSend(v6, "unserializedReplicaClock") + -[CRArray moveClock](self, "moveClock"));
  }
  [(CRArray *)self setMoveClock:0];
}

- (id)tombstone
{
  unint64_t v3 = [(CRArray *)self array];
  id v4 = [v3 tombstone];

  id v5 = [(CRArray *)self contents];
  id v6 = [v5 tombstone];

  id v7 = [CRArray alloc];
  char v8 = [(CRArray *)self document];
  id v9 = [(CRArray *)v7 initWithTTArray:v4 contents:v6 document:v8];

  return v9;
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(CRArray *)self array];
  [v5 walkGraph:v4];

  id v6 = [(CRArray *)self contents];
  [v6 walkGraph:v4];
}

- (void)setDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(CRArray *)self array];
  [v5 setDocument:v4];

  id v6 = [(CRArray *)self contents];
  [v6 setDocument:v4];
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = [(CRArray *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CRArray_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E61DE3A0;
  id v9 = v5;
  id v7 = v5;
  [v6 addUndoCommandsForObject:self block:v8];
}

void __42__CRArray_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 array];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)wantsUndoCommands
{
  uint64_t v2 = [(CRArray *)self delegate];
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

- (TTArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
}

- (CRDictionary)contents
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

- (void)encodeWithCRCoder:(id)a3
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
  [(CRArray *)self encodeWithCRCoder:v6 array:*(void *)(v4 + 40)];
}

- (void)encodeWithCRCoder:(id)a3 array:(void *)a4
{
  id v10 = a3;
  id v6 = [(CRArray *)self array];
  *((_DWORD *)a4 + 8) |= 1u;
  uint64_t v7 = *((void *)a4 + 5);
  if (!v7) {
    operator new();
  }
  [v6 saveToArchive:v7];

  char v8 = [(CRArray *)self contents];
  *((_DWORD *)a4 + 8) |= 2u;
  uint64_t v9 = *((void *)a4 + 6);
  if (!v9) {
    operator new();
  }
  [v8 encodeWithCRCoder:v10 dictionary:v9];
}

- (CRArray)initWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 15)
  {
    id v6 = [(CRArray *)self initWithCRCoder:v4 array:*(void *)(v5 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 document];
    id v6 = [(CRArray *)self initWithDocument:v7];
  }
  return v6;
}

- (CRArray)initWithCRCoder:(id)a3 array:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = [CRDictionary alloc];
  char v8 = v7;
  uint64_t v9 = *((void *)a4 + 6);
  if (!v9) {
    uint64_t v9 = *(void *)(CRDT::Array::default_instance((CRDT::Array *)v7) + 48);
  }
  id v10 = [(CRDictionary *)v8 initWithCRCoder:v6 dictionary:v9];
  id v11 = [TTArray alloc];
  id v12 = v11;
  uint64_t v13 = *((void *)a4 + 5);
  if (!v13) {
    uint64_t v13 = *(void *)(CRDT::Array::default_instance((CRDT::Array *)v11) + 40);
  }
  v14 = [(TTArray *)v12 initWithCRCoder:v6 stringArray:v13];
  id v15 = [v6 document];
  id v16 = [(CRArray *)self initWithTTArray:v14 contents:v10 document:v15];

  return v16;
}

@end