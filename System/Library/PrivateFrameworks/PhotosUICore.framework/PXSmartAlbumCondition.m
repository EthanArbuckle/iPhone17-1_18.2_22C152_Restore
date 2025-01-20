@interface PXSmartAlbumCondition
+ (id)_conditionWithSingleQuery:(id)a3 editingContext:(id)a4;
+ (id)conditionWithConditionType:(int64_t)a3 editingContext:(id)a4;
+ (id)conditionsForQuery:(id)a3 editingContext:(id)a4 error:(id *)a5;
+ (id)defaultSingleQueryForEditingContext:(id)a3;
- (NSArray)comparatorValues;
- (PLSingleQuery)singleQuery;
- (PXLabeledValue)comparatorValue;
- (PXSmartAlbumCondition)init;
- (PXSmartAlbumConditionDelegate)delegate;
- (PXSmartAlbumEditingContext)editingContext;
- (id)_initWithConditionType:(int64_t)a3 singleQuery:(id)a4 editingContext:(id)a5;
- (int)_comparatorType;
- (int64_t)comparatorMode;
- (int64_t)comparatorParameterType;
- (int64_t)conditionType;
- (void)setComparatorValue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXSmartAlbumCondition

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleQuery, 0);
  objc_storeStrong((id *)&self->_editingContext, 0);
  objc_storeStrong((id *)&self->_comparatorValues, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXSmartAlbumConditionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSmartAlbumConditionDelegate *)WeakRetained;
}

- (PLSingleQuery)singleQuery
{
  return self->_singleQuery;
}

- (PXSmartAlbumEditingContext)editingContext
{
  return self->_editingContext;
}

- (int64_t)conditionType
{
  return self->_conditionType;
}

- (int)_comparatorType
{
  v2 = [(PXSmartAlbumCondition *)self singleQuery];
  int v3 = [v2 migratedComparator];

  return v3;
}

- (int64_t)comparatorMode
{
  return 1;
}

- (int64_t)comparatorParameterType
{
  int v2 = [(PXSmartAlbumCondition *)self _comparatorType];
  if ((v2 - 50) < 2) {
    return 2;
  }
  if (v2 == 30) {
    return 1;
  }
  if (!v2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"PXSmartAlbumComparatorParameterType _PXSmartAlbumComparatorParameterTypeForComparator(PLQueryComparatorType)"];
    [v4 handleFailureInFunction:v5 file:@"PXSmartAlbumCondition.m" lineNumber:235 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (void)setComparatorValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSmartAlbumCondition.m", 122, @"Invalid parameter not satisfying: %@", @"comparatorValue" object file lineNumber description];
  }
  v6 = [(PXSmartAlbumCondition *)self comparatorValues];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXSmartAlbumCondition.m", 123, @"Invalid parameter not satisfying: %@", @"[self.comparatorValues containsObject:comparatorValue]" object file lineNumber description];
  }
  v8 = [v5 value];
  uint64_t v9 = [v8 integerValue];
  v10 = [(PXSmartAlbumCondition *)self singleQuery];
  [v10 setComparator:v9];
  v11 = PLUIGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = PLStringFromPLQueryComparatorType();
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "PXSmartAlbums: comparator set to: \"%@\"", buf, 0xCu);
  }
  v13 = [(PXSmartAlbumCondition *)self delegate];
  [v13 conditionDidChange:self];
}

- (PXLabeledValue)comparatorValue
{
  uint64_t v3 = [(PXSmartAlbumCondition *)self _comparatorType];
  v4 = PXSmartAlbumLocalizedStringForComparator(v3, [(PXSmartAlbumCondition *)self comparatorMode]);
  id v5 = [PXLabeledValue alloc];
  v6 = [NSNumber numberWithInt:v3];
  char v7 = [(PXLabeledValue *)v5 initWithValue:v6 localizedLabel:v4];

  return v7;
}

- (NSArray)comparatorValues
{
  comparatorValues = self->_comparatorValues;
  if (!comparatorValues)
  {
    id v5 = [(PXSmartAlbumCondition *)self singleQuery];
    uint64_t v6 = [v5 key];
    uint64_t v7 = [(PXSmartAlbumCondition *)self comparatorMode];
    v8 = [MEMORY[0x1E4F8B9A8] validComparatorsForQueryKey:v6];
    uint64_t v9 = PXSmartAlbumLocalizedStringsForComparatorValues(v8, v7);
    PXLabeledValuesWithValuesAndLocalizedLabels(v8, v9);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

    v11 = self->_comparatorValues;
    self->_comparatorValues = v10;

    if (![(NSArray *)self->_comparatorValues count])
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PXSmartAlbumCondition.m", 109, @"Invalid parameter not satisfying: %@", @"_comparatorValues.count" object file lineNumber description];
    }
    comparatorValues = self->_comparatorValues;
  }
  return comparatorValues;
}

- (id)_initWithConditionType:(int64_t)a3 singleQuery:(id)a4 editingContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSmartAlbumCondition;
  v10 = [(PXSmartAlbumCondition *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_conditionType = a3;
    objc_storeStrong((id *)&v10->_editingContext, a5);
    if (v8)
    {
      v12 = (PLSingleQuery *)v8;
    }
    else
    {
      v12 = [(id)objc_opt_class() defaultSingleQueryForEditingContext:v9];
    }
    singleQuery = v11->_singleQuery;
    v11->_singleQuery = v12;
  }
  return v11;
}

- (PXSmartAlbumCondition)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSmartAlbumCondition.m", 40, @"%s is not available as initializer", "-[PXSmartAlbumCondition init]");

  abort();
}

+ (id)defaultSingleQueryForEditingContext:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 144, @"Method %s is a responsibility of subclass %@", "+[PXSmartAlbumCondition defaultSingleQueryForEditingContext:]", v8 object file lineNumber description];

  abort();
}

+ (id)conditionsForQuery:(id)a3 editingContext:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 77, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 78, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__191237;
  v37 = __Block_byref_object_dispose__191238;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__191237;
  v31 = __Block_byref_object_dispose__191238;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [v9 singleQueries];
  if ([v11 count])
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65__PXSmartAlbumCondition_conditionsForQuery_editingContext_error___block_invoke;
    v23[3] = &unk_1E5DC3690;
    id v24 = v10;
    v25 = &v27;
    v26 = &v33;
    [v11 enumerateObjectsUsingBlock:v23];
    v12 = v24;
  }
  else
  {
    v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v9 logDescription];
      *(_DWORD *)buf = 138412290;
      v40 = v14;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "PXSmartAlbums: Failed to create conditions for query with no single queries: %@", buf, 0xCu);
    }
    objc_super v15 = (void *)MEMORY[0x1E4F28C58];
    v12 = [v9 logDescription];
    uint64_t v16 = objc_msgSend(v15, "px_errorWithDomain:code:debugDescription:", @"PXSmartAlbumErrorDomain", -1001, @"Failed to create conditions for query with no single queries: \"%@\"", v12);
    v17 = (void *)v34[5];
    v34[5] = v16;
  }
  if (v34[5])
  {
    uint64_t v18 = (void *)v28[5];
    v28[5] = 0;

    *a5 = (id) v34[5];
  }
  id v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

void __65__PXSmartAlbumCondition_conditionsForQuery_editingContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v6 = +[PXSmartAlbumCondition _conditionWithSingleQuery:editingContext:](PXSmartAlbumCondition, "_conditionWithSingleQuery:editingContext:");
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    id v8 = [v12 logDescription];
    uint64_t v9 = objc_msgSend(v7, "px_errorWithDomain:code:debugDescription:", @"PXSmartAlbumErrorDomain", -1001, @"Failed to create condition for single query: \"%@\"", v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

+ (id)_conditionWithSingleQuery:(id)a3 editingContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 64, @"Invalid parameter not satisfying: %@", @"singleQuery" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 65, @"Invalid parameter not satisfying: %@", @"editingContext" object file lineNumber description];

LABEL_3:
  uint64_t v10 = PXSmartAlbumConditionTypeForSingleQuery(v7);
  v11 = (void *)v10;
  if (v10) {
    v11 = (void *)[objc_alloc((Class)_PXSmartAlbumConditionClassForConditionType(v10)) _initWithConditionType:v10 singleQuery:v7 editingContext:v9];
  }

  return v11;
}

+ (id)conditionWithConditionType:(int64_t)a3 editingContext:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (a3)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 55, @"Invalid parameter not satisfying: %@", @"conditionType != PXSmartAlbumConditionTypeInvalid" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, a1, @"PXSmartAlbumCondition.m", 56, @"Invalid parameter not satisfying: %@", @"editingContext" object file lineNumber description];

LABEL_3:
  uint64_t v9 = (void *)[objc_alloc((Class)_PXSmartAlbumConditionClassForConditionType(a3)) _initWithConditionType:a3 singleQuery:0 editingContext:v8];

  return v9;
}

@end