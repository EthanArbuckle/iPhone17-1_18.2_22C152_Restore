@interface TTMergeableStringUndoGroup
- (BOOL)addSeenRange:(TopoIDRange *)a3;
- (BOOL)addToGroup:(id)a3;
- (BOOL)hasTopoIDsThatCanChange;
- (NSMutableArray)commands;
- (NSMutableDictionary)seen;
- (NSString)description;
- (TTMergeableStringUndoGroup)init;
- (void)addCommand:(id)a3;
- (void)applyToString:(id)a3;
- (void)closeGroup;
- (void)setCommands:(id)a3;
- (void)setSeen:(id)a3;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation TTMergeableStringUndoGroup

- (TTMergeableStringUndoGroup)init
{
  v8.receiver = self;
  v8.super_class = (Class)TTMergeableStringUndoGroup;
  v2 = [(TTMergeableStringUndoGroup *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    seen = v2->_seen;
    v2->_seen = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    commands = v2->_commands;
    v2->_commands = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)closeGroup
{
}

- (void)addCommand:(id)a3
{
  id v5 = a3;
  if ([v5 addToGroup:self])
  {
    v4 = [(TTMergeableStringUndoGroup *)self commands];
    [v4 addObject:v5];
  }
}

- (BOOL)addSeenRange:(TopoIDRange *)a3
{
  id v5 = a3->var0.var0;
  uint64_t var1 = a3->var0.var1;
  uint64_t v7 = a3->var1;
  objc_super v8 = [(TTMergeableStringUndoGroup *)self seen];
  v9 = [v8 objectForKeyedSubscript:v5];

  if (v9)
  {
    if (objc_msgSend(v9, "containsIndexesInRange:", var1, v7))
    {
      BOOL v10 = 0;
    }
    else
    {
      objc_msgSend(v9, "addIndexesInRange:", var1, v7);
      BOOL v10 = 1;
    }
    v11 = v9;
  }
  else
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", var1, v7);
    v12 = [(TTMergeableStringUndoGroup *)self seen];
    [v12 setObject:v11 forKeyedSubscript:v5];

    BOOL v10 = 1;
  }

  return v10;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(TTMergeableStringUndoGroup *)self commands];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = a3->var0.var0;
        unsigned int var1 = a3->var1;
        unsigned int v17 = a3->var0.var1;
        unsigned int v18 = var1;
        id v13 = a4->var0.var0;
        unsigned int v12 = a4->var1;
        unsigned int v14 = a4->var0.var1;
        unsigned int v15 = v12;
        if (v10)
        {
          [v10 updateTopoIDRange:&v16 toNewRangeID:&v13];
        }
        else
        {
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (BOOL)hasTopoIDsThatCanChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(TTMergeableStringUndoGroup *)self commands];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasTopoIDsThatCanChange])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)applyToString:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TTMergeableStringUndoGroup *)self commands];
  v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) applyToString:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)addToGroup:(id)a3
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(TTMergeableStringUndoGroup *)self commands];
  id v5 = [v3 stringWithFormat:@"<TTMergeableStringUndoGroup %p %@>", self, v4];

  return (NSString *)v5;
}

- (NSMutableDictionary)seen
{
  return self->_seen;
}

- (void)setSeen:(id)a3
{
}

- (NSMutableArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);

  objc_storeStrong((id *)&self->_seen, 0);
}

@end