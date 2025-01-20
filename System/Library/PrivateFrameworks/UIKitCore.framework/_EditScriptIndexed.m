@interface _EditScriptIndexed
+ (id)editScriptFromArray:(id)a3 toArray:(id)a4;
+ (id)editScriptFromArray:(id)a3 toArray:(id)a4 orderAtomsAscending:(BOOL)a5 operationPrecedence:(int64_t)a6;
- (_EditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7;
- (id)applyToArray:(id)a3;
- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (void)finalizeCurrentScriptAtom;
- (void)initializeCurrentScriptAtom;
@end

@implementation _EditScriptIndexed

- (_EditScriptIndexed)initWithOperationPrecedence:(int64_t)a3 dataClass:(Class)a4 fromArray:(id)a5 toArray:(id)a6 orderAtomsAscending:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_EditScriptIndexed;
  v14 = [(_EditScript *)&v20 initWithOperationPrecedence:a3 orderAtomsAscending:v7];
  if (v14)
  {
    uint64_t v15 = [(objc_class *)a4 EditScriptDataWithArray:v12];
    itemAData = v14->super._itemAData;
    v14->super._itemAData = (_EditScriptData *)v15;

    uint64_t v17 = [(objc_class *)a4 EditScriptDataWithArray:v13];
    itemBData = v14->super._itemBData;
    v14->super._itemBData = (_EditScriptData *)v17;
  }
  return v14;
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4
{
  return (id)[a1 editScriptFromArray:a3 toArray:a4 orderAtomsAscending:0 operationPrecedence:-1];
}

+ (id)editScriptFromArray:(id)a3 toArray:(id)a4 orderAtomsAscending:(BOOL)a5 operationPrecedence:(int64_t)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[_EditScriptIndexed alloc] initWithOperationPrecedence:a6 dataClass:objc_opt_class() fromArray:v10 toArray:v9 orderAtomsAscending:v7];

  [(_EditScript *)v11 computeDistanceMatrix];
  [(_EditScript *)v11 computeEditsFromMatrix];
  return v11;
}

- (id)applyToArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v17 = v5;
  v6 = (void *)[v5 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v7 = [(_EditScript *)self script];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 editOperation];
        switch(v13)
        {
          case 1:
            objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v12, "indexToEdit"));
            break;
          case 2:
            v14 = [v12 replacementText];
            objc_msgSend(v6, "insertObject:atIndex:", v14, objc_msgSend(v12, "indexToEdit"));
            goto LABEL_13;
          case 3:
            v14 = [v12 replacementText];
            objc_msgSend(v6, "setObject:atIndexedSubscript:", v14, objc_msgSend(v12, "indexToEdit"));
LABEL_13:

            continue;
          default:
            uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
            [v15 handleFailureInMethod:a2 object:self file:@"_EditScriptIndexed.m" lineNumber:57 description:@"Invalid operation used in _EditScriptIndexed"];

            break;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)initializeCurrentScriptAtom
{
  currentScriptAtom = self->_currentScriptAtom;
  self->_currentScriptAtom = 0;
}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  id v11 = a5;
  id v12 = v11;
  if (a3)
  {
    id v16 = v11;
    if (a3 != 2)
    {
      if (!a4)
      {
        uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"_EditScriptIndexed.m" lineNumber:78 description:@"Deletions and Substitutions should never start with an index of 0"];
      }
      --a4;
    }
    uint64_t v13 = +[_EditScriptIndexedAtom atomWithEditOperation:a3 indexToEdit:a4 newText:v16 indexInArrayB:a6];
    currentScriptAtom = self->_currentScriptAtom;
    self->_currentScriptAtom = v13;

    [(_EditScriptIndexed *)self finalizeCurrentScriptAtom];
    id v12 = v16;
  }
}

- (void)finalizeCurrentScriptAtom
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  currentScriptAtom = self->_currentScriptAtom;
  if (currentScriptAtom)
  {
    if (self->super._orderAtomsAscending)
    {
      if ([(_EditScriptIndexedAtom *)currentScriptAtom editOperation] == 2)
      {
        uint64_t v4 = 1;
      }
      else if ([(_EditScriptIndexedAtom *)self->_currentScriptAtom editOperation] == 1)
      {
        uint64_t v4 = -1;
      }
      else
      {
        uint64_t v4 = 0;
      }
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v6 = [(_EditScript *)self script];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setIndexToEdit:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "indexToEdit") + v4);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      id v5 = [(_EditScript *)self script];
      [v5 insertObject:self->_currentScriptAtom atIndex:0];
    }
    else
    {
      id v5 = [(_EditScript *)self script];
      [v5 addObject:self->_currentScriptAtom];
    }

    id v11 = self->_currentScriptAtom;
    self->_currentScriptAtom = 0;
  }
}

- (void).cxx_destruct
{
}

@end