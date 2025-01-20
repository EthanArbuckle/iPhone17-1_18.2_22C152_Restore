@interface PSSpecifierUpdates
+ (BOOL)_wantsDebugCallbacks;
+ (Class)_groupIndexClass;
+ (PSSpecifierUpdates)updatesWithSpecifiers:(id)a3;
+ (id)updatesByDiffingSpecifiers:(id)a3 withSpecifiers:(id)a4 changedBlock:(id)a5;
+ (void)_assertSpecifierIDsAreUnique:(id)a3;
- (BOOL)_addAndApplyOperation:(id)a3;
- (BOOL)_enumerateArrayWithConjuctionalResult:(id)a3 usingBlock:(id)a4;
- (BOOL)_removeOneSpecifierOnlyAtIndex:(unint64_t)a3;
- (BOOL)appendSpecifier:(id)a3;
- (BOOL)appendSpecifier:(id)a3 toGroup:(id)a4;
- (BOOL)appendSpecifier:(id)a3 toGroupAtGroupIndex:(unint64_t)a4;
- (BOOL)appendSpecifier:(id)a3 toGroupWithID:(id)a4;
- (BOOL)appendSpecifiers:(id)a3;
- (BOOL)appendSpecifiers:(id)a3 toGroup:(id)a4;
- (BOOL)appendSpecifiers:(id)a3 toGroupAtGroupIndex:(unint64_t)a4;
- (BOOL)appendSpecifiers:(id)a3 toGroupWithID:(id)a4;
- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4;
- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifierWithID:(id)a4;
- (BOOL)insertContiguousSpecifiers:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)insertSpecifier:(id)a3 afterSpecifier:(id)a4;
- (BOOL)insertSpecifier:(id)a3 afterSpecifierWithID:(id)a4;
- (BOOL)insertSpecifier:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)insertSpecifier:(id)a3 atIndexPath:(id)a4;
- (BOOL)moveSpecifier:(id)a3 toIndex:(unint64_t)a4;
- (BOOL)moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (BOOL)moveSpecifierAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (BOOL)reloadSpecifier:(id)a3;
- (BOOL)reloadSpecifierAtIndex:(unint64_t)a3;
- (BOOL)reloadSpecifierAtIndexPath:(id)a3;
- (BOOL)reloadSpecifierWithID:(id)a3;
- (BOOL)reloadSpecifiers:(id)a3;
- (BOOL)reloadSpecifiersInGroup:(id)a3;
- (BOOL)reloadSpecifiersInGroupAtGroupIndex:(unint64_t)a3;
- (BOOL)reloadSpecifiersInGroupWithID:(id)a3;
- (BOOL)reloadSpecifiersInRange:(_NSRange)a3;
- (BOOL)reloadSpecifiersWithIDs:(id)a3;
- (BOOL)removeSpecifier:(id)a3;
- (BOOL)removeSpecifierAtIndex:(unint64_t)a3;
- (BOOL)removeSpecifierAtIndexPath:(id)a3;
- (BOOL)removeSpecifierWithID:(id)a3;
- (BOOL)removeSpecifiers:(id)a3;
- (BOOL)removeSpecifiersInGroup:(id)a3;
- (BOOL)removeSpecifiersInGroupAtGroupIndex:(unint64_t)a3;
- (BOOL)removeSpecifiersInGroupWithID:(id)a3;
- (BOOL)removeSpecifiersInRange:(_NSRange)a3;
- (BOOL)removeSpecifiersWithIDs:(id)a3;
- (BOOL)swapSpecifier:(id)a3 withSpecifier:(id)a4;
- (BOOL)swapSpecifierAtIndex:(unint64_t)a3 withSpecifierAtIndex:(unint64_t)a4;
- (NSArray)currentSpecifiers;
- (NSArray)originalSpecifiers;
- (NSArray)updates;
- (PSSpecifierGroupIndex)groupIndex;
- (PSSpecifierUpdateContext)context;
- (PSSpecifierUpdates)init;
- (PSSpecifierUpdates)initWithSpecifiers:(id)a3;
- (PSSpecifierUpdates)initWithSpecifiers:(id)a3 applyUpdates:(id)a4;
- (id)_groupIndexCreatingIfNecessary;
- (id)_init;
- (id)_initForCopyWithOriginalSpecifiers:(id)a3 currentSpecifiers:(id)a4 updates:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)specifierForID:(id)a3;
- (id)specifiersAfterApplyingUpdatesToIndex:(unint64_t)a3;
- (id)stepByStepDescription;
- (unint64_t)indexOfSpecifier:(id)a3;
- (unint64_t)indexOfSpecifierWithID:(id)a3;
- (void)enumerateUpdatesUsingBlock:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation PSSpecifierUpdates

+ (PSSpecifierUpdates)updatesWithSpecifiers:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSpecifiers:v4];

  return (PSSpecifierUpdates *)v5;
}

- (id)_init
{
  v4.receiver = self;
  v4.super_class = (Class)PSSpecifierUpdates;
  v2 = [(PSSpecifierUpdates *)&v4 init];
  if (v2) {
    v2->_wantsDebugCallbacks = [(id)objc_opt_class() _wantsDebugCallbacks];
  }
  return v2;
}

- (PSSpecifierUpdates)init
{
  uint64_t v4 = objc_opt_class();
  Name = sel_getName(a2);
  v6 = sel_getName(sel_initWithSpecifiers_);
  NSLog(&cfstr_SCalledShouldB.isa, v4, Name, v6);

  return 0;
}

- (PSSpecifierUpdates)initWithSpecifiers:(id)a3
{
  return [(PSSpecifierUpdates *)self initWithSpecifiers:a3 applyUpdates:0];
}

- (PSSpecifierUpdates)initWithSpecifiers:(id)a3 applyUpdates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSSpecifierUpdates *)self _init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
    originalSpecifiers = v8->_originalSpecifiers;
    v8->_originalSpecifiers = (NSArray *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
    currentSpecifiers = v8->_currentSpecifiers;
    v8->_currentSpecifiers = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    updates = v8->_updates;
    v8->_updates = (NSMutableArray *)v13;

    if ([v7 count])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __54__PSSpecifierUpdates_initWithSpecifiers_applyUpdates___block_invoke;
      v16[3] = &unk_1E5C5F5D0;
      v17 = v8;
      [v7 enumerateObjectsUsingBlock:v16];
    }
  }

  return v8;
}

uint64_t __54__PSSpecifierUpdates_initWithSpecifiers_applyUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addAndApplyOperation:a2];
}

- (id)_initForCopyWithOriginalSpecifiers:(id)a3 currentSpecifiers:(id)a4 updates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PSSpecifierUpdates *)self _init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uint64_t v13 = (void *)v11[5];
    v11[5] = v12;

    uint64_t v14 = [v9 mutableCopy];
    v15 = (void *)v11[1];
    v11[1] = v14;

    uint64_t v16 = [v10 mutableCopy];
    v17 = (void *)v11[2];
    v11[2] = v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  originalSpecifiers = self->_originalSpecifiers;
  currentSpecifiers = self->_currentSpecifiers;
  updates = self->_updates;
  return (id)[v4 _initForCopyWithOriginalSpecifiers:originalSpecifiers currentSpecifiers:currentSpecifiers updates:updates];
}

- (PSSpecifierUpdateContext)context
{
  context = self->_context;
  if (!context)
  {
    id v4 = +[PSSpecifierUpdateContext context];
    v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  return context;
}

+ (Class)_groupIndexClass
{
  return (Class)objc_opt_class();
}

- (id)_groupIndexCreatingIfNecessary
{
  groupIndex = self->_groupIndex;
  if (!groupIndex)
  {
    id v4 = (PSSpecifierGroupIndex *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_groupIndexClass")), "initWithSpecifiers:", self->_currentSpecifiers);
    v5 = self->_groupIndex;
    self->_groupIndex = v4;

    groupIndex = self->_groupIndex;
  }
  return groupIndex;
}

- (PSSpecifierGroupIndex)groupIndex
{
  v2 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  v3 = (void *)[v2 copy];

  return (PSSpecifierGroupIndex *)v3;
}

- (NSArray)currentSpecifiers
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_currentSpecifiers];
}

- (NSArray)updates
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_updates];
}

- (void)enumerateUpdatesUsingBlock:(id)a3
{
  id v4 = a3;
  updates = self->_updates;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PSSpecifierUpdates_enumerateUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E5C5F5F8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)updates enumerateObjectsUsingBlock:v7];
}

uint64_t __49__PSSpecifierUpdates_enumerateUpdatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)indexOfSpecifier:(id)a3
{
  return [(NSMutableArray *)self->_currentSpecifiers indexOfObject:a3];
}

- (unint64_t)indexOfSpecifierWithID:(id)a3
{
  return [(NSMutableArray *)self->_currentSpecifiers indexOfSpecifierWithID:a3];
}

- (id)specifierForID:(id)a3
{
  return (id)[(NSMutableArray *)self->_currentSpecifiers specifierForID:a3];
}

- (BOOL)_enumerateArrayWithConjuctionalResult:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PSSpecifierUpdates__enumerateArrayWithConjuctionalResult_usingBlock___block_invoke;
  v10[3] = &unk_1E5C5F620;
  uint64_t v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __71__PSSpecifierUpdates__enumerateArrayWithConjuctionalResult_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (result) {
    BOOL v4 = *(unsigned char *)(v3 + 24) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  return result;
}

+ (BOOL)_wantsDebugCallbacks
{
  return 0;
}

- (BOOL)_addAndApplyOperation:(id)a3
{
  id v4 = a3;
  int v5 = [v4 applyToArray:self->_currentSpecifiers];
  if (v5)
  {
    [(NSMutableArray *)self->_updates addObject:v4];
    [(PSSpecifierGroupIndex *)self->_groupIndex performUpdateOperation:v4];
    if (self->_wantsDebugCallbacks) {
      [(PSSpecifierUpdates *)self _didApplyOperation:v4];
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Specifier updates %@ failed to apply update operation %@ to specifiers %@.\nThis should not be happening and is almost certainly due to the caller having provided an inconsistent array of specifiers or updates at initialization.", self, v4, self->_currentSpecifiers format];
  }

  return v5;
}

- (BOOL)insertSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    if ([(NSMutableArray *)self->_currentSpecifiers count] >= a4)
    {
      id v7 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v6 atIndex:a4];
      BOOL v11 = [(PSSpecifierUpdates *)self _addAndApplyOperation:v7];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      id v7 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v6 atIndex:a4];
      char v8 = NSString;
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to insert specifier at out-of-bounds index %lu", a4);
      id v10 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates insertSpecifier:atIndex:]", v9];
      [(PSSpecifierUpdates *)self _operationFailed:v7 reason:v10];

      BOOL v11 = 0;
LABEL_7:

      goto LABEL_8;
    }
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)insertSpecifier:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  uint64_t v9 = [v8 indexOfSpecifierAtIndexPath:v7 forInsertion:1];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      id v10 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v6 atIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v11 = NSString;
      uint64_t v12 = [NSString stringWithFormat:@"attempted to insert at missing indexPath %@", v7];
      uint64_t v13 = [v11 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates insertSpecifier:atIndexPath:]", v12];
      [(PSSpecifierUpdates *)self _operationFailed:v10 reason:v13];
    }
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = [(PSSpecifierUpdates *)self insertSpecifier:v6 atIndex:v9];
  }

  return v14;
}

- (BOOL)insertSpecifier:(id)a3 afterSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v9 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v6 atIndex:0x8000000000000000];
      id v10 = NSString;
      BOOL v11 = [NSString stringWithFormat:@"attempted to insert after missing specifier %@", v7];
      uint64_t v12 = [v10 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates insertSpecifier:afterSpecifier:]", v11];
      [(PSSpecifierUpdates *)self _operationFailed:v9 reason:v12];
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [(PSSpecifierUpdates *)self insertSpecifier:v6 atIndex:v8 + 1];
  }

  return v13;
}

- (BOOL)insertSpecifier:(id)a3 afterSpecifierWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableArray *)self->_currentSpecifiers indexOfSpecifierWithID:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v9 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v6 atIndex:0x8000000000000000];
      id v10 = NSString;
      BOOL v11 = [NSString stringWithFormat:@"attempted to insert after missing specifier ID %@", v7];
      uint64_t v12 = [v10 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates insertSpecifier:afterSpecifierWithID:]", v11];
      [(PSSpecifierUpdates *)self _operationFailed:v9 reason:v12];
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [(PSSpecifierUpdates *)self insertSpecifier:v6 atIndex:v8 + 1];
  }

  return v13;
}

- (BOOL)insertContiguousSpecifiers:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PSSpecifierUpdates_insertContiguousSpecifiers_atIndex___block_invoke;
    v9[3] = &unk_1E5C5F648;
    v9[4] = self;
    v9[5] = a4;
    BOOL v7 = [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:v6 usingBlock:v9];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __57__PSSpecifierUpdates_insertContiguousSpecifiers_atIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSpecifier:a2 atIndex:*(void *)(a1 + 40) + a3];
}

- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4
{
  currentSpecifiers = self->_currentSpecifiers;
  id v7 = a3;
  LOBYTE(a4) = [(PSSpecifierUpdates *)self insertContiguousSpecifiers:v7 atIndex:[(NSMutableArray *)currentSpecifiers indexOfObject:a4] + 1];

  return (char)a4;
}

- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifierWithID:(id)a4
{
  currentSpecifiers = self->_currentSpecifiers;
  id v7 = a3;
  LOBYTE(a4) = [(PSSpecifierUpdates *)self insertContiguousSpecifiers:v7 atIndex:[(NSMutableArray *)currentSpecifiers indexOfSpecifierWithID:a4] + 1];

  return (char)a4;
}

- (BOOL)appendSpecifier:(id)a3
{
  uint64_t v3 = self;
  currentSpecifiers = self->_currentSpecifiers;
  id v5 = a3;
  LOBYTE(v3) = [(PSSpecifierUpdates *)v3 insertSpecifier:v5 atIndex:[(NSMutableArray *)currentSpecifiers count]];

  return (char)v3;
}

- (BOOL)appendSpecifiers:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__PSSpecifierUpdates_appendSpecifiers___block_invoke;
  v4[3] = &unk_1E5C5F670;
  v4[4] = self;
  return [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:a3 usingBlock:v4];
}

uint64_t __39__PSSpecifierUpdates_appendSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendSpecifier:a2];
}

- (BOOL)appendSpecifier:(id)a3 toGroupAtGroupIndex:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v11 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v11 count:1];

  BOOL v9 = -[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:](self, "appendSpecifiers:toGroupAtGroupIndex:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)appendSpecifiers:(id)a3 toGroupAtGroupIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    if ([v7 numberOfGroups] <= a4)
    {
      if (self->_wantsDebugCallbacks)
      {
        id v10 = [v6 firstObject];
        id v11 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v10 atIndex:0x7FFFFFFFFFFFFFFFLL];
        uint64_t v12 = NSString;
        objc_msgSend(NSString, "stringWithFormat:", @"attempted to append specifiers to out-of-bounds group at index %lu", a4);
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v8 = [v7 rangeOfSpecifiersInGroupAtGroupIndex:a4];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v13 = [(PSSpecifierUpdates *)self insertContiguousSpecifiers:v6 atIndex:v8 + v9];
        goto LABEL_12;
      }
      if (self->_wantsDebugCallbacks)
      {
        id v10 = [v6 firstObject];
        id v11 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v10 atIndex:0x7FFFFFFFFFFFFFFFLL];
        uint64_t v12 = NSString;
        objc_msgSend(NSString, "stringWithFormat:", @"attempted to append specifiers to invalid group index %lu", a4);
        BOOL v14 = LABEL_9:;
        uint64_t v15 = [v12 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:]", v14];
        [(PSSpecifierUpdates *)self _operationFailed:v11 reason:v15];
      }
    }
    BOOL v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)appendSpecifier:(id)a3 toGroup:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  BOOL v10 = -[PSSpecifierUpdates appendSpecifiers:toGroup:](self, "appendSpecifiers:toGroup:", v9, v7, v12, v13);
  return v10;
}

- (BOOL)appendSpecifiers:(id)a3 toGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v9 = [v8 groupSpecifiers];
    uint64_t v10 = [v9 indexOfObject:v7];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v16 = [(PSSpecifierUpdates *)self appendSpecifiers:v6 toGroupAtGroupIndex:v10];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      id v11 = [v6 firstObject];
      id v12 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v11 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v13 = NSString;
      BOOL v14 = [NSString stringWithFormat:@"attempted to append specifiers to missing group %@", v7];
      uint64_t v15 = [v13 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates appendSpecifiers:toGroup:]", v14];
      [(PSSpecifierUpdates *)self _operationFailed:v12 reason:v15];
    }
  }
  BOOL v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)appendSpecifier:(id)a3 toGroupWithID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  BOOL v10 = -[PSSpecifierUpdates appendSpecifiers:toGroupWithID:](self, "appendSpecifiers:toGroupWithID:", v9, v7, v12, v13);
  return v10;
}

- (BOOL)appendSpecifiers:(id)a3 toGroupWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v9 = [v8 groupSpecifiers];
    uint64_t v10 = [v9 indexOfSpecifierWithID:v7];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v16 = [(PSSpecifierUpdates *)self appendSpecifiers:v6 toGroupAtGroupIndex:v10];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      id v11 = [v6 firstObject];
      id v12 = +[PSSpecifierUpdateOperation insertOperationWithSpecifier:v11 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v13 = NSString;
      BOOL v14 = [NSString stringWithFormat:@"attempted to append specifiers to missing group ID %@", v7];
      uint64_t v15 = [v13 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates appendSpecifiers:toGroupWithID:]", v14];
      [(PSSpecifierUpdates *)self _operationFailed:v12 reason:v15];
    }
  }
  BOOL v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)removeSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      id v6 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:v4 atIndex:0x7FFFFFFFFFFFFFFFLL];
      id v7 = NSString;
      id v8 = [NSString stringWithFormat:@"attempted to remove missing specifier %@", v4];
      uint64_t v9 = [v7 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifier:]", v8];
      [(PSSpecifierUpdates *)self _operationFailed:v6 reason:v9];
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = [(PSSpecifierUpdates *)self removeSpecifierAtIndex:v5];
  }

  return v10;
}

- (BOOL)removeSpecifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PSSpecifierUpdates_removeSpecifiers___block_invoke;
    v7[3] = &unk_1E5C5F670;
    void v7[4] = self;
    BOOL v5 = [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:v4 usingBlock:v7];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __39__PSSpecifierUpdates_removeSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeSpecifier:a2];
}

- (BOOL)removeSpecifierWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    currentSpecifiers = self->_currentSpecifiers;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__PSSpecifierUpdates_removeSpecifierWithID___block_invoke;
    v15[3] = &unk_1E5C5F698;
    id v7 = v4;
    id v16 = v7;
    uint64_t v8 = [(NSMutableArray *)currentSpecifiers indexOfObjectPassingTest:v15];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (self->_wantsDebugCallbacks)
      {
        uint64_t v9 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
        BOOL v10 = NSString;
        id v11 = [NSString stringWithFormat:@"attempted to remove missing specifier ID %@", v7];
        id v12 = [v10 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifierWithID:]", v11];
        [(PSSpecifierUpdates *)self _operationFailed:v9 reason:v12];
      }
      BOOL v13 = 0;
    }
    else
    {
      BOOL v13 = [(PSSpecifierUpdates *)self removeSpecifierAtIndex:v8];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __44__PSSpecifierUpdates_removeSpecifierWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)removeSpecifiersWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__PSSpecifierUpdates_removeSpecifiersWithIDs___block_invoke;
    v7[3] = &unk_1E5C5F6C0;
    void v7[4] = self;
    BOOL v5 = [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:v4 usingBlock:v7];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __46__PSSpecifierUpdates_removeSpecifiersWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeSpecifierWithID:a2];
}

- (BOOL)removeSpecifierAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_currentSpecifiers count] <= a3)
  {
    if (!self->_wantsDebugCallbacks) {
      return 0;
    }
    BOOL v5 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:0 atIndex:a3];
    uint64_t v8 = NSString;
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to remove specifier at out-of-bounds index %lu", a3);
    uint64_t v9 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifierAtIndex:]", v6];
    [(PSSpecifierUpdates *)self _operationFailed:v5 reason:v9];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:a3];
    id v6 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:v5 atIndex:a3];
    BOOL v7 = [(PSSpecifierUpdates *)self _addAndApplyOperation:v6];
  }

  return v7;
}

- (BOOL)_removeOneSpecifierOnlyAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_currentSpecifiers count] <= a3)
  {
    if (!self->_wantsDebugCallbacks) {
      return 0;
    }
    BOOL v5 = +[PSSpecifierUpdateOperation _removeOneSpecifierOnlyOperationWithSpecifier:0 atIndex:a3];
    uint64_t v8 = NSString;
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to remove specifier at out-of-bounds index %lu", a3);
    uint64_t v9 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates _removeOneSpecifierOnlyAtIndex:]", v6];
    [(PSSpecifierUpdates *)self _operationFailed:v5 reason:v9];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:a3];
    id v6 = +[PSSpecifierUpdateOperation _removeOneSpecifierOnlyOperationWithSpecifier:v5 atIndex:a3];
    BOOL v7 = [(PSSpecifierUpdates *)self _addAndApplyOperation:v6];
  }

  return v7;
}

- (BOOL)removeSpecifiersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length <= [(NSMutableArray *)self->_currentSpecifiers count])
  {
    NSUInteger v9 = v6 - 1;
    int v10 = 1;
    while (v9 >= location)
      v10 &= [(PSSpecifierUpdates *)self removeSpecifierAtIndex:v9--];
  }
  else
  {
    if (self->_wantsDebugCallbacks)
    {
      unint64_t v7 = [(NSMutableArray *)self->_currentSpecifiers count];
      if (location >= v7)
      {
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:location];
      }
      id v11 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:v8 atIndex:location];
      id v12 = NSString;
      v17.NSUInteger location = location;
      v17.NSUInteger length = length;
      BOOL v13 = NSStringFromRange(v17);
      BOOL v14 = [v12 stringWithFormat:@"attempted to remove specifiers in out-of-bounds range %@", v13];
      uint64_t v15 = [v12 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifiersInRange:]", v14];
      [(PSSpecifierUpdates *)self _operationFailed:v11 reason:v15];

      if (location < v7) {
    }
      }
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)removeSpecifierAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  uint64_t v6 = [v5 indexOfSpecifierAtIndexPath:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      unint64_t v7 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v8 = NSString;
      NSUInteger v9 = [NSString stringWithFormat:@"attempted to remove specifier at missing or out-of-bounds indexPath %@", v4];
      int v10 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifierAtIndexPath:]", v9];
      [(PSSpecifierUpdates *)self _operationFailed:v7 reason:v10];
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(PSSpecifierUpdates *)self removeSpecifierAtIndex:v6];
  }

  return v11;
}

- (BOOL)removeSpecifiersInGroupAtGroupIndex:(unint64_t)a3
{
  BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  if ([v5 numberOfGroups] <= a3)
  {
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v8 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v14 = NSString;
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to remove specifiers in out-of-bounds group at index %lu", a3);
      id v16 = [v14 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:]", v15];
      [(PSSpecifierUpdates *)self _operationFailed:v8 reason:v16];

      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = [v5 rangeOfSpecifiersInGroupAtGroupIndex:a3];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v17 = -[PSSpecifierUpdates removeSpecifiersInRange:](self, "removeSpecifiersInRange:", v6, v7);
      goto LABEL_10;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v8 = [v5 groupSpecifiers];
      NSUInteger v9 = [v8 objectAtIndexedSubscript:a3];
      int v10 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:v9 atIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v11 = NSString;
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to remove specifiers in group at index %lu that does not have a valid range", a3);
      BOOL v13 = [v11 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:]", v12];
      [(PSSpecifierUpdates *)self _operationFailed:v10 reason:v13];

LABEL_7:
    }
  }
  BOOL v17 = 0;
LABEL_10:

  return v17;
}

- (BOOL)removeSpecifiersInGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && ![v4 cellType])
  {
    uint64_t v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v9 = [v8 groupIndexOfGroup:v5];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v6 = [(PSSpecifierUpdates *)self removeSpecifiersInGroupAtGroupIndex:v9];
      goto LABEL_4;
    }
    if (self->_wantsDebugCallbacks)
    {
      int v10 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:v5 atIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v11 = NSString;
      id v12 = [NSString stringWithFormat:@"attempted to remove specifiers in missing group %@", v5];
      BOOL v13 = [v11 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifiersInGroup:]", v12];
      [(PSSpecifierUpdates *)self _operationFailed:v10 reason:v13];
    }
  }
  BOOL v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)removeSpecifiersInGroupWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v6 = [v5 groupIndexOfGroupWithID:v4];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v11 = [(PSSpecifierUpdates *)self removeSpecifiersInGroupAtGroupIndex:v6];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v7 = +[PSSpecifierUpdateOperation removeOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v8 = NSString;
      uint64_t v9 = [NSString stringWithFormat:@"attempted to remove specifiers in missing group with ID %@", v4];
      int v10 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates removeSpecifiersInGroupWithID:]", v9];
      [(PSSpecifierUpdates *)self _operationFailed:v7 reason:v10];
    }
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)reloadSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v4];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v10 = [(PSSpecifierUpdates *)self reloadSpecifierAtIndex:v5];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v6 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:v4 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v7 = NSString;
      uint64_t v8 = [NSString stringWithFormat:@"attempted to reload missing specifier %@", v4];
      uint64_t v9 = [v7 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifier:]", v8];
      [(PSSpecifierUpdates *)self _operationFailed:v6 reason:v9];
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)reloadSpecifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PSSpecifierUpdates_reloadSpecifiers___block_invoke;
    v7[3] = &unk_1E5C5F670;
    void v7[4] = self;
    BOOL v5 = [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:v4 usingBlock:v7];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __39__PSSpecifierUpdates_reloadSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadSpecifier:a2];
}

- (BOOL)reloadSpecifiersInGroupAtGroupIndex:(unint64_t)a3
{
  BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  if ([v5 numberOfGroups] <= a3)
  {
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v8 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v9 = NSString;
      objc_msgSend(NSString, "stringWithFormat:", @"attempted to reload specifiers in out-of-bounds group at index %lu", a3);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = [v5 rangeOfSpecifiersInGroupAtGroupIndex:a3];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v12 = -[PSSpecifierUpdates reloadSpecifiersInRange:](self, "reloadSpecifiersInRange:", v6, v7);
      goto LABEL_10;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v8 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v9 = NSString;
      objc_msgSend(NSString, "stringWithFormat:", @"attempted to reload specifiers in missing group at index %lu", a3);
      BOOL v10 = LABEL_7:;
      BOOL v11 = [v9 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifiersInGroupAtGroupIndex:]", v10];
      [(PSSpecifierUpdates *)self _operationFailed:v8 reason:v11];
    }
  }
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)reloadSpecifiersInGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && ![v4 cellType])
  {
    uint64_t v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v9 = [v8 groupIndexOfGroup:v5];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v6 = [(PSSpecifierUpdates *)self reloadSpecifiersInGroupAtGroupIndex:v9];
      goto LABEL_4;
    }
    if (self->_wantsDebugCallbacks)
    {
      BOOL v10 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      BOOL v11 = NSString;
      BOOL v12 = [NSString stringWithFormat:@"attempted to reload specifiers in missing group %@", v5];
      BOOL v13 = [v11 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifiersInGroup:]", v12];
      [(PSSpecifierUpdates *)self _operationFailed:v10 reason:v13];
    }
  }
  BOOL v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)reloadSpecifiersInGroupWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
    uint64_t v6 = [v5 groupIndexOfGroupWithID:v4];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v11 = [(PSSpecifierUpdates *)self reloadSpecifiersInGroupAtGroupIndex:v6];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v7 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v8 = NSString;
      uint64_t v9 = [NSString stringWithFormat:@"attempted to reload specifiers in missing group ID %@", v4];
      BOOL v10 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifiersInGroupWithID:]", v9];
      [(PSSpecifierUpdates *)self _operationFailed:v7 reason:v10];
    }
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)reloadSpecifierWithID:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    currentSpecifiers = self->_currentSpecifiers;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__PSSpecifierUpdates_reloadSpecifierWithID___block_invoke;
    v15[3] = &unk_1E5C5F698;
    id v7 = v4;
    id v16 = v7;
    uint64_t v8 = [(NSMutableArray *)currentSpecifiers indexOfObjectPassingTest:v15];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (self->_wantsDebugCallbacks)
      {
        uint64_t v9 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
        BOOL v10 = NSString;
        BOOL v11 = [NSString stringWithFormat:@"attempted to reload missing specifier ID %@", v7];
        BOOL v12 = [v10 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifierWithID:]", v11];
        [(PSSpecifierUpdates *)self _operationFailed:v9 reason:v12];
      }
      BOOL v13 = 0;
    }
    else
    {
      BOOL v13 = [(PSSpecifierUpdates *)self reloadSpecifierAtIndex:v8];
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __44__PSSpecifierUpdates_reloadSpecifierWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (BOOL)reloadSpecifiersWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__PSSpecifierUpdates_reloadSpecifiersWithIDs___block_invoke;
    v7[3] = &unk_1E5C5F6C0;
    void v7[4] = self;
    BOOL v5 = [(PSSpecifierUpdates *)self _enumerateArrayWithConjuctionalResult:v4 usingBlock:v7];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __46__PSSpecifierUpdates_reloadSpecifiersWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reloadSpecifierWithID:a2];
}

- (BOOL)reloadSpecifierAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_currentSpecifiers count] <= a3)
  {
    if (!self->_wantsDebugCallbacks) {
      return 0;
    }
    BOOL v5 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:a3];
    uint64_t v8 = NSString;
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to reload specifier at out-of-bounds index %lu", a3);
    uint64_t v9 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifierAtIndex:]", v6];
    [(PSSpecifierUpdates *)self _operationFailed:v5 reason:v9];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:a3];
    uint64_t v6 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:v5 atIndex:a3];
    BOOL v7 = [(PSSpecifierUpdates *)self _addAndApplyOperation:v6];
  }

  return v7;
}

- (BOOL)reloadSpecifierAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  uint64_t v6 = [v5 indexOfSpecifierAtIndexPath:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      BOOL v7 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
      uint64_t v8 = NSString;
      uint64_t v9 = [NSString stringWithFormat:@"attempted to reload specifier at missing or out-of-bounds indexPath %@", v4];
      BOOL v10 = [v8 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifierAtIndexPath:]", v9];
      [(PSSpecifierUpdates *)self _operationFailed:v7 reason:v10];
    }
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(PSSpecifierUpdates *)self reloadSpecifierAtIndex:v6];
  }

  return v11;
}

- (BOOL)reloadSpecifiersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = a3.location + a3.length;
  unint64_t v7 = [(NSMutableArray *)self->_currentSpecifiers count];
  if (v6 > v7)
  {
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v9 = +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:0 atIndex:v6];
      BOOL v10 = NSString;
      v15.NSUInteger location = location;
      v15.NSUInteger length = length;
      BOOL v11 = NSStringFromRange(v15);
      BOOL v12 = [v10 stringWithFormat:@"attempted to reload specifiers in out-of-bounds range %@", v11];
      BOOL v13 = [v10 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates reloadSpecifiersInRange:]", v12];
      [(PSSpecifierUpdates *)self _operationFailed:v9 reason:v13];
    }
  }
  else
  {
    for (NSUInteger i = v6 - 1; i >= location; --i)
      [(PSSpecifierUpdates *)self reloadSpecifierAtIndex:i];
  }
  return v6 <= v7;
}

- (BOOL)moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  if ([(NSMutableArray *)self->_currentSpecifiers count] > a3)
  {
    unint64_t v7 = [(NSMutableArray *)self->_currentSpecifiers count];
    if (a3 != a4 && v7 > a4)
    {
      uint64_t v8 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:a3];
      uint64_t v9 = +[PSSpecifierUpdateOperation moveOperationWithSpecifier:v8 fromIndex:a3 toIndex:a4];
      BOOL v10 = [(PSSpecifierUpdates *)self _addAndApplyOperation:v9];

LABEL_11:
      return v10;
    }
  }
  if (!self->_wantsDebugCallbacks) {
    return 0;
  }
  unint64_t v11 = [(NSMutableArray *)self->_currentSpecifiers count];
  if (v11 <= a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:a3];
  }
  BOOL v13 = +[PSSpecifierUpdateOperation moveOperationWithSpecifier:v8 fromIndex:a3 toIndex:a4];
  BOOL v14 = NSString;
  NSRange v15 = [NSString stringWithFormat:@"attempted to move specifier from index %lu to index %lu, when one or more of these indexes are out of bounds", a3, a4];
  id v16 = [v14 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:]", v15];
  [(PSSpecifierUpdates *)self _operationFailed:v13 reason:v16];

  BOOL v10 = 0;
  BOOL result = 0;
  if (v11 > a3) {
    goto LABEL_11;
  }
  return result;
}

- (BOOL)moveSpecifierAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  unint64_t v9 = [v8 indexOfSpecifierAtIndexPath:v6];

  BOOL v10 = [(PSSpecifierUpdates *)self _groupIndexCreatingIfNecessary];
  uint64_t v11 = [v10 indexOfSpecifierAtIndexPath:v7];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      unint64_t v13 = [(NSMutableArray *)self->_currentSpecifiers count];
      if (v9 >= v13)
      {
        BOOL v14 = 0;
      }
      else
      {
        BOOL v14 = [(NSMutableArray *)self->_currentSpecifiers objectAtIndexedSubscript:v9];
      }
      NSRange v15 = +[PSSpecifierUpdateOperation moveOperationWithSpecifier:v14 fromIndex:v9 toIndex:v11];
      id v16 = NSString;
      BOOL v17 = [NSString stringWithFormat:@"attempted to move specifier from indexPath %@ to indexPath %@, when one or more of these indexPaths are missing or out of bounds", v6, v7];
      v18 = [v16 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates moveSpecifierAtIndexPath:toIndexPath:]", v17];
      [(PSSpecifierUpdates *)self _operationFailed:v15 reason:v18];

      if (v9 < v13) {
    }
      }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:", v9, v11 - ([v6 section] < objc_msgSend(v7, "section")));
  }

  return v12;
}

- (BOOL)moveSpecifier:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v6];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v12 = [(PSSpecifierUpdates *)self moveSpecifierAtIndex:v7 toIndex:a4];
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      uint64_t v8 = +[PSSpecifierUpdateOperation moveOperationWithSpecifier:0 fromIndex:0x7FFFFFFFFFFFFFFFLL toIndex:a4];
      unint64_t v9 = NSString;
      BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", @"attempted to move specifier from out-of-bounds index %lu", 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v11 = [v9 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates moveSpecifier:toIndex:]", v10];
      [(PSSpecifierUpdates *)self _operationFailed:v8 reason:v11];
    }
  }
  BOOL v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)swapSpecifierAtIndex:(unint64_t)a3 withSpecifierAtIndex:(unint64_t)a4
{
  if ([(NSMutableArray *)self->_currentSpecifiers count] <= a3
    || [(NSMutableArray *)self->_currentSpecifiers count] <= a4)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    if (a3 >= a4) {
      unint64_t v7 = a4;
    }
    else {
      unint64_t v7 = a3;
    }
    if (a3 > a4) {
      a4 = a3;
    }
    BOOL v8 = [(PSSpecifierUpdates *)self moveSpecifierAtIndex:v7 toIndex:a4];
    if (v8)
    {
      if (v7 == a4 - 1)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        LOBYTE(v8) = -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:");
      }
    }
  }
  return v8;
}

- (BOOL)swapSpecifier:(id)a3 withSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v6];
    uint64_t v11 = [(NSMutableArray *)self->_currentSpecifiers indexOfObject:v8];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
    {
      if (v10 != v11 && self->_wantsDebugCallbacks)
      {
        BOOL v14 = v11 != 0x7FFFFFFFFFFFFFFFLL;
        BOOL v15 = v10 != 0x7FFFFFFFFFFFFFFFLL;
        id v16 = +[PSSpecifierUpdateOperation moveOperationWithSpecifier:v6 fromIndex:v10 toIndex:v11];
        BOOL v17 = NSString;
        v18 = [NSString stringWithFormat:@"attempted to swap specifier %@ (found: %d) with specifier %@ (found: %d), when one or more of these specifiers could not be found", v6, v15, v8, v14];
        v19 = [v17 stringWithFormat:@"%s failed: %@", "-[PSSpecifierUpdates swapSpecifier:withSpecifier:]", v18];
        [(PSSpecifierUpdates *)self _operationFailed:v16 reason:v19];
      }
      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = [(PSSpecifierUpdates *)self swapSpecifierAtIndex:v10 withSpecifierAtIndex:v11];
    }
  }

  return v9;
}

+ (void)_assertSpecifierIDsAreUnique:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PSSpecifierUpdates__assertSpecifierIDsAreUnique___block_invoke;
  v7[3] = &unk_1E5C5D640;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __51__PSSpecifierUpdates__assertSpecifierIDsAreUnique___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 identifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  id v6 = v5;

  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"found specifier with duplicate ID %@ in specifiers %@", v7, *(void *)(a1 + 40) format];
  }
  [*(id *)(a1 + 32) addObject:v6];
}

+ (id)updatesByDiffingSpecifiers:(id)a3 withSpecifiers:(id)a4 changedBlock:(id)a5
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0;
  if (v8 && v9)
  {
    id v44 = v10;
    BOOL v12 = [(id)objc_opt_class() updatesWithSpecifiers:v8];
    [a1 _assertSpecifierIDsAreUnique:v8];
    [a1 _assertSpecifierIDsAreUnique:v9];
    unint64_t v13 = [MEMORY[0x1E4F28E60] indexSet];
    BOOL v14 = [MEMORY[0x1E4F28E60] indexSet];
    BOOL v15 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v17 = [MEMORY[0x1E4F1CA80] set];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke;
    v65[3] = &unk_1E5C5F6E8;
    id v18 = v8;
    id v66 = v18;
    id v19 = v15;
    id v67 = v19;
    id v20 = v14;
    id v68 = v20;
    [v9 enumerateObjectsUsingBlock:v65];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_2;
    v58[3] = &unk_1E5C5F710;
    id v59 = v9;
    id v60 = v13;
    id v61 = v20;
    id v64 = v44;
    id v21 = v16;
    id v62 = v21;
    id v63 = v17;
    id v40 = v17;
    id v43 = v20;
    id v42 = v13;
    [v18 enumerateObjectsUsingBlock:v58];
    v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
    v69[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_3;
    v56[3] = &unk_1E5C5F738;
    id v24 = v12;
    id v57 = v24;
    [v42 enumerateIndexesWithOptions:2 usingBlock:v56];
    v25 = [v21 allKeys];
    v39 = [v25 sortedArrayUsingDescriptors:v23];

    v26 = [MEMORY[0x1E4F1CA48] array];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_4;
    v53[3] = &unk_1E5C5F760;
    id v54 = v26;
    id v55 = v21;
    id v41 = v21;
    id v27 = v26;
    [v39 enumerateObjectsUsingBlock:v53];
    v28 = [v24 currentSpecifiers];
    v29 = (void *)[v28 mutableCopy];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_5;
    v50[3] = &unk_1E5C5D640;
    id v51 = v29;
    id v30 = v24;
    id v52 = v30;
    id v31 = v29;
    [v27 enumerateObjectsWithOptions:2 usingBlock:v50];
    v32 = [v19 allKeys];
    v33 = [v32 sortedArrayUsingDescriptors:v23];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_7;
    v47[3] = &unk_1E5C5F760;
    id v48 = v19;
    id v34 = v30;
    id v49 = v34;
    id v38 = v19;
    [v33 enumerateObjectsUsingBlock:v47];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_8;
    v45[3] = &unk_1E5C5F788;
    id v35 = v34;
    id v46 = v35;
    [v40 enumerateObjectsUsingBlock:v45];
    v36 = v46;
    id v11 = v35;

    id v10 = v44;
  }

  return v11;
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v11 = v5;
  id v7 = [v5 identifier];
  uint64_t v8 = [v6 indexOfSpecifierWithID:v7];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v9 setObject:v11 forKeyedSubscript:v10];

    [*(id *)(a1 + 48) addIndex:a3];
  }
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v19 = v5;
  id v7 = [v5 identifier];
  uint64_t v8 = [v6 indexOfSpecifierWithID:v7];

  id v9 = *(void **)(a1 + 40);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 addIndex:a3];
    goto LABEL_13;
  }
  uint64_t v10 = a3 - objc_msgSend(v9, "countOfIndexesInRange:", 0, a3);
  uint64_t v11 = v8 - objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", 0, v8);
  uint64_t v12 = *(void *)(a1 + 72);
  if (v12)
  {
    unint64_t v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v11];
    LODWORD(v12) = (*(uint64_t (**)(uint64_t, id, void *))(v12 + 16))(v12, v19, v13);
  }
  if (v11 == v10)
  {
    if (*(void *)(a1 + 72)) {
      int v14 = v12;
    }
    else {
      int v14 = 1;
    }
    if (v14 != 1) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v15 = *(void **)(a1 + 56);
    id v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
    [v15 setObject:v19 forKeyedSubscript:v16];

    if ((v12 & 1) == 0) {
      goto LABEL_13;
    }
  }
  BOOL v17 = *(void **)(a1 + 64);
  id v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v11];
  [v17 addObject:v18];

LABEL_13:
}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removeOneSpecifierOnlyAtIndex:a2];
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  [v2 addObject:v3];
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_6;
  v11[3] = &unk_1E5C5F698;
  id v7 = v5;
  id v12 = v7;
  uint64_t v8 = [v6 indexOfObjectWithOptions:2 passingTest:v11];
  if (v8 != a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v8];
    [*(id *)(a1 + 32) removeObjectAtIndex:v9];
    [*(id *)(a1 + 32) insertObject:v10 atIndex:a3];
    [*(id *)(a1 + 40) moveSpecifierAtIndex:v9 toIndex:a3];
  }
}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3) {
    objc_msgSend(*(id *)(a1 + 40), "insertSpecifier:atIndex:", v3, objc_msgSend(v4, "unsignedIntegerValue"));
  }
}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];
  return [v2 reloadSpecifierAtIndex:v3];
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifierUpdates;
  id v4 = [(PSSpecifierUpdates *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ %lu updates, context: %@, updates: %@", v4, -[NSMutableArray count](self->_updates, "count"), self->_context, self->_updates];

  return v5;
}

- (id)stepByStepDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_originalSpecifiers];
  [v3 appendFormat:@"Initial specifiers: %@\n", v4];
  updates = self->_updates;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PSSpecifierUpdates_stepByStepDescription__block_invoke;
  v10[3] = &unk_1E5C5F7B0;
  id v11 = v4;
  id v12 = v3;
  unint64_t v13 = self;
  id v6 = v3;
  id v7 = v4;
  [(NSMutableArray *)updates enumerateObjectsUsingBlock:v10];
  [v6 appendFormat:@"Finished applying updates"];
  uint64_t v8 = (void *)[v6 copy];

  return v8;
}

uint64_t __43__PSSpecifierUpdates_stepByStepDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  [v6 applyToArray:v5];
  [*(id *)(a1 + 40) appendFormat:@"Applied operation %lu of %lu %@\n", a3 + 1, objc_msgSend(*(id *)(*(void *)(a1 + 48) + 16), "count"), v6];

  return [*(id *)(a1 + 40) appendFormat:@"Specifiers: %@\n", *(void *)(a1 + 32)];
}

- (id)specifiersAfterApplyingUpdatesToIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_updates count] - 1 <= a3)
  {
    id v8 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_currentSpecifiers];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_originalSpecifiers];
    id v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, a3 + 1);
    updates = self->_updates;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PSSpecifierUpdates_specifiersAfterApplyingUpdatesToIndex___block_invoke;
    v10[3] = &unk_1E5C5F5D0;
    id v8 = v5;
    id v11 = v8;
    [(NSMutableArray *)updates enumerateObjectsAtIndexes:v6 options:0 usingBlock:v10];
  }
  return v8;
}

uint64_t __60__PSSpecifierUpdates_specifiersAfterApplyingUpdatesToIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyToArray:*(void *)(a1 + 32)];
}

- (NSArray)originalSpecifiers
{
  return self->_originalSpecifiers;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_originalSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupIndex, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_currentSpecifiers, 0);
}

@end