@interface PLPersistentHistoryTransactionModifiers
+ (id)transactionAuthorFromChangeSource:(int)a3;
+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4;
+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5;
+ (id)transactionModifiersFromTransactionAuthor:(id)a3;
- (BOOL)isNonCoalescing;
- (BOOL)isSyncable;
- (BOOL)nonCoalescing;
- (BOOL)syncChangeMarker;
- (BOOL)updateFromTransactionAuthor:(id)a3;
- (PLPersistentHistoryTransactionModifiers)init;
- (PLPersistentHistoryTransactionModifiers)initWithChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5;
- (id)_descriptionWithBuilder:(id)a3;
- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3;
- (id)description;
- (id)encodeAsTransactionAuthor;
- (int)changeSource;
- (void)setChangeSource:(int)a3;
- (void)setNonCoalescing:(BOOL)a3;
- (void)setSyncChangeMarker:(BOOL)a3;
@end

@implementation PLPersistentHistoryTransactionModifiers

id __108__PLPersistentHistoryTransactionModifiers_transactionAuthorFromChangeSource_syncChangeMarker_nonCoalescing___block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 37);
  v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", v1, v3);
  v10[1] = v4;
  v5 = [NSNumber numberWithInt:v2];
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:0 error:0];
  v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];

  return v8;
}

+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5
{
  v5 = pl_result_with_autoreleasepool();
  return v5;
}

- (void)setNonCoalescing:(BOOL)a3
{
  self->_nonCoalescing = a3;
}

- (BOOL)nonCoalescing
{
  return self->_nonCoalescing;
}

- (void)setChangeSource:(int)a3
{
  self->_changeSource = a3;
}

- (int)changeSource
{
  return self->_changeSource;
}

- (void)setSyncChangeMarker:(BOOL)a3
{
  self->_syncChangeMarker = a3;
}

- (BOOL)syncChangeMarker
{
  return self->_syncChangeMarker;
}

- (id)_descriptionWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = PLStringFromXPCChangeSource();
  [v4 appendName:@"changeSource" object:v5];

  [v4 appendName:@"syncChangeMarker" typeCode:"B" value:&self->_syncChangeMarker];
  v6 = [v4 build];

  return v6;
}

- (id)_pl_prettyDescriptionWithIndent:(int64_t)a3
{
  v3 = pl_result_with_autoreleasepool();
  return v3;
}

id __75__PLPersistentHistoryTransactionModifiers__pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:*(void *)(a1 + 32) indent:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) _descriptionWithBuilder:v2];

  return v3;
}

- (id)description
{
  uint64_t v2 = pl_result_with_autoreleasepool();
  return v2;
}

id __54__PLPersistentHistoryTransactionModifiers_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PLDescriptionBuilder descriptionBuilderWithObject:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 32) _descriptionWithBuilder:v2];

  return v3;
}

- (BOOL)isNonCoalescing
{
  return self->_nonCoalescing;
}

- (BOOL)isSyncable
{
  return self->_syncChangeMarker && self->_changeSource != 1;
}

- (BOOL)updateFromTransactionAuthor:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  v10 = self;
  id v11 = v4;
  id v5 = v4;
  v6 = pl_result_with_autoreleasepool();
  char v7 = objc_msgSend(v6, "BOOLValue", v9, 3221225472, __71__PLPersistentHistoryTransactionModifiers_updateFromTransactionAuthor___block_invoke, &unk_1E5867628, v10);

  return v7;
}

uint64_t __71__PLPersistentHistoryTransactionModifiers_updateFromTransactionAuthor___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 0;
  id v2 = *(id *)(a1 + 40);
  if (v2)
  {
    v3 = v2;
    char v4 = [v2 isEqualToString:&stru_1EEB2EB80];

    if ((v4 & 1) == 0 && ([*(id *)(a1 + 40) hasPrefix:@"com.apple.coredata"] & 1) == 0)
    {
      char v7 = [*(id *)(a1 + 40) dataUsingEncoding:4];
      id v24 = 0;
      v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v24];
      uint64_t v9 = v24;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = v8;
          if ((unint64_t)[v10 count] < 2
            || (unint64_t)[v10 count] >= 4)
          {
            id v11 = PLPersistentHistoryGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v10;
              _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Transaction author: Array count out of range: %@", buf, 0xCu);
            }
            uint64_t v5 = MEMORY[0x1E4F1CC28];
            goto LABEL_41;
          }
          id v11 = [v10 objectAtIndexedSubscript:0];
          v16 = [v10 objectAtIndexedSubscript:1];
          v17 = 0;
          if ((unint64_t)[v10 count] >= 3)
          {
            v17 = [v10 objectAtIndexedSubscript:2];
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v18 = PLPersistentHistoryGetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v11;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Transaction author: First object is not a number: %@", buf, 0xCu);
            }
            uint64_t v5 = MEMORY[0x1E4F1CC28];
            goto LABEL_40;
          }
          v18 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v22 = PLPersistentHistoryGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v16;
              _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Transaction author: Second object is not a number: %@", buf, 0xCu);
            }
            uint64_t v5 = MEMORY[0x1E4F1CC28];
            goto LABEL_39;
          }
          v23 = v16;
          if (v17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v21 = PLPersistentHistoryGetLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v17;
                _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Transaction author: Third object is not a number: %@", buf, 0xCu);
              }
              uint64_t v5 = MEMORY[0x1E4F1CC28];
              goto LABEL_38;
            }
            v19 = v17;
          }
          v20 = PLPersistentHistoryGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v18;
            __int16 v27 = 2112;
            v28 = v23;
            _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Transaction author: JSON change source: %@, JSON sync change marker: %@", buf, 0x16u);
          }

          *(_DWORD *)(*(void *)(a1 + 32) + 12) = [v18 intValue];
          *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v23 intValue] != 0;
          *(unsigned char *)(*(void *)(a1 + 32) + 9) = [v17 BOOLValue];
          uint64_t v5 = MEMORY[0x1E4F1CC38];
          v21 = v17;
LABEL_38:

          v22 = v23;
LABEL_39:

LABEL_40:
LABEL_41:

          goto LABEL_42;
        }
        v10 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v8;
          v13 = "Transaction author: JSON object is not an array: %@";
          v14 = v10;
          uint32_t v15 = 12;
          goto LABEL_17;
        }
      }
      else
      {
        v10 = PLPersistentHistoryGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v12 = *(NSObject **)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v26 = v9;
          __int16 v27 = 2112;
          v28 = v12;
          v13 = "Transaction author: Unable to decode transaction author as JSON: %@: %@";
          v14 = v10;
          uint32_t v15 = 22;
LABEL_17:
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
        }
      }
      uint64_t v5 = MEMORY[0x1E4F1CC28];
LABEL_42:

      return v5;
    }
  }
  return MEMORY[0x1E4F1CC38];
}

- (id)encodeAsTransactionAuthor
{
  v3 = objc_opt_class();
  uint64_t changeSource = self->_changeSource;
  BOOL syncChangeMarker = self->_syncChangeMarker;
  return (id)[v3 transactionAuthorFromChangeSource:changeSource syncChangeMarker:syncChangeMarker];
}

- (PLPersistentHistoryTransactionModifiers)initWithChangeSource:(int)a3 syncChangeMarker:(BOOL)a4 nonCoalescing:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)PLPersistentHistoryTransactionModifiers;
  v8 = [(PLPersistentHistoryTransactionModifiers *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_uint64_t changeSource = a3;
    v8->_BOOL syncChangeMarker = a4;
    v8->_nonCoalescing = a5;
    v10 = v8;
  }

  return v9;
}

- (PLPersistentHistoryTransactionModifiers)init
{
  return [(PLPersistentHistoryTransactionModifiers *)self initWithChangeSource:0 syncChangeMarker:0 nonCoalescing:0];
}

+ (id)transactionAuthorFromChangeSource:(int)a3
{
  return (id)[a1 transactionAuthorFromChangeSource:*(void *)&a3 syncChangeMarker:0];
}

+ (id)transactionAuthorFromChangeSource:(int)a3 syncChangeMarker:(BOOL)a4
{
  return (id)[a1 transactionAuthorFromChangeSource:*(void *)&a3 syncChangeMarker:0 nonCoalescing:0];
}

+ (id)transactionModifiersFromTransactionAuthor:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  char v4 = pl_result_with_autoreleasepool();

  return v4;
}

id __85__PLPersistentHistoryTransactionModifiers_transactionModifiersFromTransactionAuthor___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  [v2 updateFromTransactionAuthor:*(void *)(a1 + 32)];
  return v2;
}

@end