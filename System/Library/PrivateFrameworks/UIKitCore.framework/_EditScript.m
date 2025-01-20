@interface _EditScript
- (NSArray)operationPrecedenceArray;
- (NSMutableArray)script;
- (_EditScript)initWithOperationPrecedence:(int64_t)a3 orderAtomsAscending:(BOOL)a4;
- (id)description;
- (id)operationPrecedenceArrayFromOperationPrecedence:(int64_t)a3;
- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6;
- (void)computeDistanceMatrix;
- (void)computeEditsFromMatrix;
- (void)finalizeCurrentScriptAtom;
- (void)initializeCurrentScriptAtom;
- (void)setOperationPrecedenceArray:(id)a3;
- (void)setScript:(id)a3;
@end

@implementation _EditScript

- (id)operationPrecedenceArrayFromOperationPrecedence:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return &unk_1ED3F0658;
  }
  else {
    return (id)qword_1E52FB7B8[a3 - 1];
  }
}

- (_EditScript)initWithOperationPrecedence:(int64_t)a3 orderAtomsAscending:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_EditScript;
  v6 = [(_EditScript *)&v13 init];
  v7 = v6;
  if (v6)
  {
    distanceMatrix = v6->_distanceMatrix;
    v6->_distanceMatrix = 0;

    v7->_orderAtomsAscending = a4;
    uint64_t v9 = [(_EditScript *)v7 operationPrecedenceArrayFromOperationPrecedence:a3];
    operationPrecedenceArray = v7->_operationPrecedenceArray;
    v7->_operationPrecedenceArray = (NSArray *)v9;

    v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    [(_EditScript *)v7 setScript:v11];
  }
  return v7;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:0];
  distanceMatrix = self->_distanceMatrix;
  if (distanceMatrix)
  {
    v5 = [(_IntArray2D *)distanceMatrix description];
    [v3 appendFormat:@"Distance Matrix:\n%@\n", v5];
  }
  operationPrecedenceArray = self->_operationPrecedenceArray;
  if (operationPrecedenceArray)
  {
    v7 = [(NSArray *)operationPrecedenceArray description];
    [v3 appendFormat:@"Order of Precedence:%@\n", v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_script;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v3 appendString:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (void)computeDistanceMatrix
{
  unint64_t v3 = [(_EditScriptData *)self->_itemAData length];
  unint64_t v4 = [(_EditScriptData *)self->_itemBData length];
  v5 = +[_IntArray2D arrayWithISize:v3 + 1 jSize:v4 + 1];
  [(_IntArray2D *)v5 setShouldBoundsCheck:1];
  if (v3)
  {
    for (unint64_t i = 1; i <= v3; ++i)
      [(_IntArray2D *)v5 :i :0 newValue:i];
  }
  if (v4)
  {
    for (unint64_t j = 1; j <= v4; ++j)
      [(_IntArray2D *)v5 :0 :j newValue:j];
    unint64_t v8 = 1;
    unint64_t v18 = v4;
    do
    {
      if (v3)
      {
        for (unint64_t k = 1; k <= v3; ++k)
        {
          uint64_t v10 = [(_EditScriptData *)self->_itemAData stringAtIndex:k - 1];
          uint64_t v11 = [(_EditScriptData *)self->_itemBData stringAtIndex:v8 - 1];
          int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
            uint64_t v13 = [(_IntArray2D *)v5 :k - 1 :v8 - 1];
          }
          else
          {
            uint64_t v14 = [(_IntArray2D *)v5 :k - 1 :v8] + 1;
            uint64_t v15 = [(_IntArray2D *)v5 :k :v8 - 1];
            if (v14 >= v15 + 1) {
              uint64_t v14 = v15 + 1;
            }
            uint64_t v16 = [(_IntArray2D *)v5 :k - 1 :v8 - 1];
            if (v14 >= v16 + 1) {
              uint64_t v13 = v16 + 1;
            }
            else {
              uint64_t v13 = v14;
            }
          }
          [(_IntArray2D *)v5 :k :v8 newValue:v13];
        }
      }
      ++v8;
    }
    while (v8 <= v18);
  }
  distanceMatrix = self->_distanceMatrix;
  self->_distanceMatrix = v5;
}

- (void)computeEditsFromMatrix
{
  [(_EditScript *)self initializeCurrentScriptAtom];
  self->_currentOperation = 0;
  v31 = self->_distanceMatrix;
  uint64_t v3 = [(_IntArray2D *)v31 iSize] - 1;
  uint64_t v4 = [(_IntArray2D *)v31 jSize] - 1;
  if (v3 <= 0 && v4 < 1) {
    goto LABEL_59;
  }
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = v3--;
    uint64_t v8 = -[_IntArray2D ::outOfBoundsReturnValue:](v31, "::outOfBoundsReturnValue:", v3, v4, 0x7FFFFFFFFFFFFFFFLL, v6);
    uint64_t v29 = v4;
    uint64_t v9 = v4 - 1;
    uint64_t v10 = [(_IntArray2D *)v31 :v7 :v4 - 1 outOfBoundsReturnValue:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v11 = [(_IntArray2D *)v31 :v3 :v4 - 1 outOfBoundsReturnValue:0x7FFFFFFFFFFFFFFFLL];
    uint64_t v12 = [(NSArray *)self->_operationPrecedenceArray count];
    uint64_t v13 = v12 - 1;
    if (v12 < 1)
    {
LABEL_39:
      uint64_t v3 = v7;
      uint64_t v6 = v28;
      if (v28 == 1)
      {
LABEL_40:
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v6 = 1;
        v25 = &stru_1ED0E84C0;
        uint64_t v4 = v29;
      }
      else
      {
        uint64_t v3 = v7;
        v25 = &stru_1ED0E84C0;
        uint64_t v4 = v29;
        uint64_t v9 = v29;
      }
      goto LABEL_57;
    }
    int v15 = v11 < v8 && v11 < v10;
    int v17 = v10 < v8 && v10 < v11;
    BOOL v19 = v8 < v10 && v8 < v11;
    while (1)
    {
      uint64_t v20 = [(NSArray *)self->_operationPrecedenceArray objectAtIndex:v13];
      uint64_t v21 = [v20 integerValue];

      if (v21 == 3) {
        break;
      }
      if (v21 == 2)
      {
        if (((v13 != 0) & ~v17) == 0)
        {
          if (v29 < 1)
          {
            v25 = 0;
          }
          else
          {
            v25 = [(_EditScriptData *)self->_itemBData stringAtIndex:v9];
          }
          uint64_t v6 = 2;
          uint64_t v3 = v7;
          goto LABEL_56;
        }
      }
      else if (v21 == 1)
      {
        if (v13) {
          char v22 = v19;
        }
        else {
          char v22 = 1;
        }
        if (v22) {
          goto LABEL_40;
        }
      }
      else
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"_EditScript.m", 184, @"The operation precedence array MUST NOT contain values other than eOperationSubstitute, eOperationInsert, and eOperationDelete, and MUST contain all 3." object file lineNumber description];
      }
LABEL_38:
      unint64_t v24 = v13-- + 1;
      if (v24 <= 1) {
        goto LABEL_39;
      }
    }
    if (((v13 != 0) & ~v15) != 0) {
      goto LABEL_38;
    }
    if (v7 < 1)
    {
      v26 = 0;
    }
    else
    {
      v26 = [(_EditScriptData *)self->_itemAData stringAtIndex:v3];
    }
    if (v29 < 1)
    {
      v27 = 0;
    }
    else
    {
      v27 = [(_EditScriptData *)self->_itemBData stringAtIndex:v9];
    }
    if ([v26 isEqualToString:v27])
    {
      uint64_t v6 = 0;
      v25 = &stru_1ED0E84C0;
    }
    else
    {
      v25 = v27;
      uint64_t v6 = 3;
    }

LABEL_56:
    uint64_t v4 = v9;
LABEL_57:
    [(_EditScript *)self addToCurrentScriptAtomEditOperation:v6 editIndex:v7 newText:v25 indexInArrayB:v9];
  }
  while (v3 > 0 || v4 > 0);
LABEL_59:
  [(_EditScript *)self finalizeCurrentScriptAtom];
}

- (void)initializeCurrentScriptAtom
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_EditScript.m" lineNumber:204 description:@"Subclasses of _EditScript need to implement initailizeCurrentScriptAtom"];
}

- (void)addToCurrentScriptAtomEditOperation:(int64_t)a3 editIndex:(unint64_t)a4 newText:(id)a5 indexInArrayB:(unint64_t)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"_EditScript.m" lineNumber:210 description:@"Subclasses of _EditScript need to implement appendToScriptAtomIndex:string:operation:"];
}

- (void)finalizeCurrentScriptAtom
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_EditScript.m" lineNumber:216 description:@"Subclasses of _EditScript need to implement finalizeCurrentScriptAtom"];
}

- (NSArray)operationPrecedenceArray
{
  return self->_operationPrecedenceArray;
}

- (void)setOperationPrecedenceArray:(id)a3
{
}

- (NSMutableArray)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_script, 0);
  objc_storeStrong((id *)&self->_operationPrecedenceArray, 0);
  objc_storeStrong((id *)&self->_itemBData, 0);
  objc_storeStrong((id *)&self->_itemAData, 0);
  objc_storeStrong((id *)&self->_distanceMatrix, 0);
}

@end