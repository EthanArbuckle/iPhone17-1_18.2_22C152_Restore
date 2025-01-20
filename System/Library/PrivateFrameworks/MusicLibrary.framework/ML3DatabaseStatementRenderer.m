@interface ML3DatabaseStatementRenderer
+ (id)defaultRenderer;
- (id)beginTransactionStatementWithBehaviorType:(unint64_t)a3;
- (id)commitTransactionStatement;
- (id)insertStatementForTableName:(id)a3 columnNames:(id)a4;
- (id)insertStatementUsingDefaultValuesForTableName:(id)a3;
- (id)insertStatementWithOptions:(id)a3;
- (id)rollbackTranscationStatement;
- (id)rollbackTranscationStatementToSavepointName:(id)a3;
- (id)savepointReleaseStatementWithName:(id)a3;
- (id)savepointStatementWithName:(id)a3;
- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4;
- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4 valueCount:(unint64_t)a5;
@end

@implementation ML3DatabaseStatementRenderer

- (id)beginTransactionStatementWithBehaviorType:(unint64_t)a3
{
  if (a3 > 2)
  {
    v4 = @"BEGIN TRANSACTION";
  }
  else
  {
    v4 = [NSString stringWithFormat:@"BEGIN %@ TRANSACTION", off_1E5FB7920[a3]];
  }
  return v4;
}

+ (id)defaultRenderer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__ML3DatabaseStatementRenderer_defaultRenderer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRenderer___once != -1) {
    dispatch_once(&defaultRenderer___once, block);
  }
  v2 = (void *)defaultRenderer_defaultRenderer;

  return v2;
}

- (id)commitTransactionStatement
{
  return @"COMMIT TRANSACTION";
}

uint64_t __47__ML3DatabaseStatementRenderer_defaultRenderer__block_invoke()
{
  defaultRenderer_defaultRenderer = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4 valueCount:(unint64_t)a5
{
  unint64_t v6 = 2 * a4 - 1;
  id v7 = a3;
  v8 = [&stru_1F08D4D70 stringByPaddingToLength:v6 withString:@",?" startingAtIndex:1];
  v9 = [NSString stringWithFormat:@", (%@)", v8];

  unint64_t v10 = [v9 length] * a5 - 2;
  v11 = [NSString stringWithFormat:@"%@", v9];
  v12 = [&stru_1F08D4D70 stringByPaddingToLength:v10 withString:v11 startingAtIndex:2];

  v13 = [NSString stringWithFormat:@"%@ %@", v7, v12];

  return v13;
}

- (id)statementWithPrefix:(id)a3 inParameterCount:(unint64_t)a4
{
  unint64_t v4 = 2 * a4 - 1;
  id v5 = a3;
  unint64_t v6 = [&stru_1F08D4D70 stringByPaddingToLength:v4 withString:@",?" startingAtIndex:1];
  id v7 = [NSString stringWithFormat:@"%@ IN (%@)", v5, v6];

  return v7;
}

- (id)insertStatementWithOptions:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionTableNameKey"];
  if (!v6)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"ML3DatabaseStatementRenderer+Insertions.m" lineNumber:46 description:@"Must specify a table name to render insertion statement."];
  }
  id v7 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionFailureOptionKey"];

  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionFailureOptionKey"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if ((unint64_t)(v9 - 1) > 4) {
      unint64_t v10 = @"FAIL";
    }
    else {
      unint64_t v10 = off_1E5FB78F8[v9 - 1];
    }
    v11 = [NSString stringWithFormat:@"INSERT OR %@", v10];
  }
  else
  {
    v11 = @"INSERT";
  }
  v12 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionDatabaseNameKey"];

  v13 = NSString;
  if (v12)
  {
    v14 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionDatabaseNameKey"];
    v15 = [v13 stringWithFormat:@"INTO %@.%@", v14, v6];
  }
  else
  {
    v15 = [NSString stringWithFormat:@"INTO %@", v6];
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionColumnNamesKey"];
  uint64_t v17 = [v5 objectForKeyedSubscript:@"ML3DatabaseInsertStatementOptionValuesKey"];
  v44 = (void *)v17;
  if (v16 | v17)
  {
    v18 = (void *)v17;
    if (v16)
    {
      v19 = [(id)v16 componentsJoinedByString:@","];
      v43 = [NSString stringWithFormat:@"(%@)", v19];

      if (v18)
      {
        uint64_t v20 = [(id)v16 count];
        if (v20 != [v18 count])
        {
          v21 = [MEMORY[0x1E4F28B00] currentHandler];
          [v21 handleFailureInMethod:a2 object:self file:@"ML3DatabaseStatementRenderer+Insertions.m" lineNumber:108 description:@"Number of column names provided doesn't match the number of values provided."];
        }
        goto LABEL_19;
      }
    }
    else
    {
      v43 = 0;
      if (v17)
      {
LABEL_19:
        uint64_t v39 = v16;
        v40 = v15;
        v41 = v11;
        v42 = v6;
        v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v24 = v18;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (!v25) {
          goto LABEL_31;
        }
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v46;
        while (1)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v46 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              v30 = [v29 stringValue];
            }
            else
            {
              objc_opt_class();
              v31 = @"NULL";
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_29;
              }
              v30 = v29;
            }
            v31 = v30;
LABEL_29:
            [v23 addObject:v31];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (!v26)
          {
LABEL_31:

            v32 = [v23 componentsJoinedByString:@","];

            unint64_t v6 = v42;
            v15 = v40;
            v11 = v41;
            uint64_t v16 = v39;
            goto LABEL_33;
          }
        }
      }
    }
    v32 = objc_msgSend(&stru_1F08D4D70, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend((id)v16, "count") - 1, @",?", 1);
LABEL_33:
    v33 = [NSString stringWithFormat:@"VALUES (%@)", v32];
    v34 = v33;
    if (v43)
    {
      v35 = [NSString stringWithFormat:@"%@ %@", v43, v33];
    }
    else
    {
      v35 = v33;
    }
    v22 = v35;
  }
  else
  {
    v22 = @"DEFAULT VALUES";
  }
  v36 = [NSString stringWithFormat:@"%@ %@ %@", v11, v15, v22];

  return v36;
}

- (id)insertStatementUsingDefaultValuesForTableName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"ML3DatabaseInsertStatementOptionTableNameKey";
  v10[0] = a3;
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  unint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [(ML3DatabaseStatementRenderer *)self insertStatementWithOptions:v6];

  return v7;
}

- (id)insertStatementForTableName:(id)a3 columnNames:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [NSString stringWithFormat:@":%@", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  v22[0] = @"ML3DatabaseInsertStatementOptionTableNameKey";
  v22[1] = @"ML3DatabaseInsertStatementOptionColumnNamesKey";
  v23[0] = v6;
  v23[1] = v9;
  v22[2] = @"ML3DatabaseInsertStatementOptionValuesKey";
  v23[2] = v8;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  uint64_t v16 = [(ML3DatabaseStatementRenderer *)self insertStatementWithOptions:v15];

  return v16;
}

- (id)savepointReleaseStatementWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ML3DatabaseStatementRenderer+Transactions.m" lineNumber:71 description:@"Must specify a savepoint name."];
  }
  id v6 = [NSString stringWithFormat:@"RELEASE SAVEPOINT %@", v5];

  return v6;
}

- (id)savepointStatementWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ML3DatabaseStatementRenderer+Transactions.m" lineNumber:64 description:@"Must specify a savepoint name."];
  }
  id v6 = [NSString stringWithFormat:@"SAVEPOINT %@", v5];

  return v6;
}

- (id)rollbackTranscationStatementToSavepointName:(id)a3
{
  if (a3)
  {
    unint64_t v4 = [NSString stringWithFormat:@"ROLLBACK TRANSACTION TO SAVEPOINT %@", a3];
  }
  else
  {
    unint64_t v4 = @"ROLLBACK TRANSACTION";
  }
  return v4;
}

- (id)rollbackTranscationStatement
{
  return [(ML3DatabaseStatementRenderer *)self rollbackTranscationStatementToSavepointName:0];
}

@end