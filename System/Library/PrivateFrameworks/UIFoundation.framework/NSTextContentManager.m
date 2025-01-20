@interface NSTextContentManager
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticallySynchronizesTextLayoutManagers;
- (BOOL)automaticallySynchronizesToBackingStore;
- (BOOL)containsExtraLineFragment;
- (BOOL)hasEditingTransaction;
- (BOOL)isCountableDataSource;
- (NSArray)textElementsForRange:(NSTextRange *)range;
- (NSArray)textLayoutManagers;
- (NSTextContentManager)init;
- (NSTextContentManager)initWithCoder:(NSCoder *)coder;
- (NSTextLayoutManager)primaryTextLayoutManager;
- (NSTextRange)documentRange;
- (id)delegate;
- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4;
- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4;
- (unint64_t)maximumNumberOfUncachedElements;
- (void)_decrementTransactionStack;
- (void)_incrementTransactionStack;
- (void)addTextLayoutManager:(NSTextLayoutManager *)textLayoutManager;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)performEditingTransactionUsingBlock:(void *)transaction;
- (void)recordEditActionInRange:(NSTextRange *)originalTextRange newTextRange:(NSTextRange *)newTextRange;
- (void)removeTextLayoutManager:(NSTextLayoutManager *)textLayoutManager;
- (void)setAutomaticallySynchronizesTextLayoutManagers:(BOOL)automaticallySynchronizesTextLayoutManagers;
- (void)setAutomaticallySynchronizesToBackingStore:(BOOL)automaticallySynchronizesToBackingStore;
- (void)setDelegate:(id)delegate;
- (void)setMaximumNumberOfUncachedElements:(unint64_t)a3;
- (void)setPrimaryTextLayoutManager:(NSTextLayoutManager *)primaryTextLayoutManager;
- (void)synchronizeTextLayoutManagers:(void *)completionHandler;
@end

@implementation NSTextContentManager

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (unint64_t)maximumNumberOfUncachedElements
{
  return self->_maximumNumberOfUncachedElements;
}

- (void)synchronizeTextLayoutManagers:(void *)completionHandler
{
  objc_sync_enter(self);
  textLayoutManagers = self->_textLayoutManagers;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke;
  v5[3] = &unk_1E55C7868;
  v5[4] = self;
  [(NSMutableArray *)textLayoutManagers enumerateObjectsUsingBlock:v5];

  self->_editHistory = 0;
  objc_sync_exit(self);
}

uint64_t __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke_2;
  v4[3] = &unk_1E55C7840;
  v4[4] = a2;
  return [v2 enumerateObjectsUsingBlock:v4];
}

- (NSArray)textLayoutManagers
{
  objc_sync_enter(self);
  v3 = (NSArray *)(id)[(NSMutableArray *)self->_textLayoutManagers copy];
  objc_sync_exit(self);
  return v3;
}

- (void)dealloc
{
  [(NSTextContentManager *)self setPrimaryTextLayoutManager:0];
  [(NSTextContentManager *)self setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)NSTextContentManager;
  [(NSTextContentManager *)&v3 dealloc];
}

- (void)setDelegate:(id)delegate
{
}

- (NSTextContentManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSTextContentManager;
  v2 = [(NSTextContentManager *)&v4 init];
  if (v2)
  {
    v2->_textLayoutManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_automaticallySynchronizesTextLayoutManagers = 1;
  }
  return v2;
}

- (void)setPrimaryTextLayoutManager:(NSTextLayoutManager *)primaryTextLayoutManager
{
  if (self->_primaryTextLayoutManager != primaryTextLayoutManager)
  {
    [(NSTextContentManager *)self synchronizeTextLayoutManagers:0];
    objc_sync_enter(self);

    if ([(NSMutableArray *)self->_textLayoutManagers containsObject:primaryTextLayoutManager])v5 = primaryTextLayoutManager; {
    else
    }
      v5 = 0;
    self->_primaryTextLayoutManager = v5;
    objc_sync_exit(self);
  }
}

- (void)recordEditActionInRange:(NSTextRange *)originalTextRange newTextRange:(NSTextRange *)newTextRange
{
  v8[2] = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  editHistory = self->_editHistory;
  if (!editHistory)
  {
    editHistory = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_editHistory = editHistory;
  }
  v8[0] = originalTextRange;
  v8[1] = newTextRange;
  -[NSMutableArray addObject:](editHistory, "addObject:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2]);
  objc_sync_exit(self);
}

uint64_t __54__NSTextContentManager_synchronizeTextLayoutManagers___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 firstObject];

  return [v2 processLayoutInvalidationForTextRange:v3 synchronizing:1];
}

- (void)addTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  [(NSTextContentManager *)self willChangeValueForKey:@"textLayoutManagers"];
  objc_sync_enter(self);
  [(NSMutableArray *)self->_textLayoutManagers addObject:textLayoutManager];
  [(NSTextLayoutManager *)textLayoutManager setTextContentManager:self];
  objc_sync_exit(self);

  [(NSTextContentManager *)self didChangeValueForKey:@"textLayoutManagers"];
}

- (void).cxx_destruct
{
}

- (void)_incrementTransactionStack
{
  p_transactionStack = &self->_transactionStack;
  if (atomic_load(&self->_transactionStack))
  {
    atomic_fetch_add((atomic_ullong *volatile)p_transactionStack, 1uLL);
  }
  else
  {
    [(NSTextContentManager *)self willChangeValueForKey:@"hasEditingTransaction"];
    atomic_fetch_add((atomic_ullong *volatile)p_transactionStack, 1uLL);
    [(NSTextContentManager *)self didChangeValueForKey:@"hasEditingTransaction"];
  }
}

- (void)_decrementTransactionStack
{
  p_transactionStack = &self->_transactionStack;
  unint64_t v3 = atomic_load(&self->_transactionStack);
  if (v3 > 1)
  {
    atomic_fetch_add((atomic_ullong *volatile)p_transactionStack, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [(NSTextContentManager *)self willChangeValueForKey:@"hasEditingTransaction"];
    atomic_fetch_add((atomic_ullong *volatile)p_transactionStack, 0xFFFFFFFFFFFFFFFFLL);
    [(NSTextContentManager *)self didChangeValueForKey:@"hasEditingTransaction"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextContentManager)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    char v5 = [(NSCoder *)coder decodeInt32ForKey:@"NS.flags"];
    [(NSTextContentManager *)self setDelegate:[(NSCoder *)coder decodeObjectForKey:@"NS.delegate"]];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    self->_textLayoutManagers = (NSMutableArray *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"NS.textLayoutManagers");
    self->_maximumNumberOfUncachedElements = [(NSCoder *)coder decodeIntegerForKey:@"NS.maximumNumberOfUncachedElements"];
    self->_automaticallySynchronizesToBackingStore = (v5 & 2) != 0;
    self->_automaticallySynchronizesTextLayoutManagers = v5 & 1;
    if (!self->_textLayoutManagers) {
      self->_textLayoutManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    char v5 = [(NSTextContentManager *)self textLayoutManagers];
    id v6 = [(NSTextContentManager *)self delegate];
    uint64_t v7 = self->_automaticallySynchronizesTextLayoutManagers | (2
                                                             * self->_automaticallySynchronizesToBackingStore);
    if (v7) {
      [a3 encodeInt32:v7 forKey:@"NS.flags"];
    }
    if (v6) {
      [a3 encodeObject:v6 forKey:@"NS.delegate"];
    }
    if ([(NSArray *)v5 count]) {
      [a3 encodeObject:v5 forKey:@"NS.textLayoutManagers"];
    }
    if (self->_maximumNumberOfUncachedElements)
    {
      objc_msgSend(a3, "encodeInteger:forKey:");
    }
  }
}

- (void)removeTextLayoutManager:(NSTextLayoutManager *)textLayoutManager
{
  if (-[NSMutableArray containsObject:](self->_textLayoutManagers, "containsObject:"))
  {
    if ([(NSTextContentManager *)self primaryTextLayoutManager] == textLayoutManager) {
      [(NSTextContentManager *)self setPrimaryTextLayoutManager:0];
    }
    [(NSTextContentManager *)self willChangeValueForKey:@"textLayoutManagers"];
    objc_sync_enter(self);
    [(NSTextLayoutManager *)textLayoutManager setTextContentManager:0];
    [(NSMutableArray *)self->_textLayoutManagers removeObject:textLayoutManager];
    objc_sync_exit(self);
    [(NSTextContentManager *)self didChangeValueForKey:@"textLayoutManagers"];
  }
}

- (NSTextLayoutManager)primaryTextLayoutManager
{
  objc_sync_enter(self);
  unint64_t v3 = self->_primaryTextLayoutManager;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)containsExtraLineFragment
{
  return 0;
}

- (NSArray)textElementsForRange:(NSTextRange *)range
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__12;
  v14 = __Block_byref_object_dispose__12;
  uint64_t v15 = 0;
  id v5 = [(NSTextRange *)range location];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__NSTextContentManager_textElementsForRange___block_invoke;
  v9[3] = &unk_1E55C6230;
  v9[4] = range;
  v9[5] = &v10;
  [(NSTextContentManager *)self enumerateTextElementsFromLocation:v5 options:0 usingBlock:v9];
  id v6 = (id)v11[5];
  if (v11[5]) {
    uint64_t v7 = (NSArray *)v11[5];
  }
  else {
    uint64_t v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __45__NSTextContentManager_textElementsForRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "containsLocation:", objc_msgSend((id)objc_msgSend(a2, "elementRange"), "location"));
  if (v4)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:a2];
  }
  return v4;
}

- (BOOL)hasEditingTransaction
{
  unint64_t v2 = atomic_load(&self->_transactionStack);
  return v2 != 0;
}

- (void)performEditingTransactionUsingBlock:(void *)transaction
{
  [(NSTextContentManager *)self _incrementTransactionStack];
  (*((void (**)(void *))transaction + 2))(transaction);
  [(NSTextContentManager *)self _decrementTransactionStack];
  if (![(NSTextContentManager *)self hasEditingTransaction])
  {
    if ([(NSTextContentManager *)self automaticallySynchronizesTextLayoutManagers])
    {
      [(NSTextContentManager *)self synchronizeTextLayoutManagers:0];
    }
    if ([(NSTextContentManager *)self automaticallySynchronizesToBackingStore])
    {
      [(NSTextContentManager *)self synchronizeToBackingStore:0];
    }
  }
}

- (NSTextRange)documentRange
{
  return (NSTextRange *)+[NSCountableTextRange documentRange];
}

- (id)enumerateTextElementsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  return 0;
}

- (id)locationFromLocation:(id)a3 withOffset:(int64_t)a4
{
  return 0;
}

- (int64_t)offsetFromLocation:(id)a3 toLocation:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isCountableDataSource
{
  return 0;
}

- (void)setMaximumNumberOfUncachedElements:(unint64_t)a3
{
  self->_maximumNumberOfUncachedElements = a3;
}

- (BOOL)automaticallySynchronizesTextLayoutManagers
{
  return self->_automaticallySynchronizesTextLayoutManagers;
}

- (void)setAutomaticallySynchronizesTextLayoutManagers:(BOOL)automaticallySynchronizesTextLayoutManagers
{
  self->_automaticallySynchronizesTextLayoutManagers = automaticallySynchronizesTextLayoutManagers;
}

- (BOOL)automaticallySynchronizesToBackingStore
{
  return self->_automaticallySynchronizesToBackingStore;
}

- (void)setAutomaticallySynchronizesToBackingStore:(BOOL)automaticallySynchronizesToBackingStore
{
  self->_automaticallySynchronizesToBackingStore = automaticallySynchronizesToBackingStore;
}

@end