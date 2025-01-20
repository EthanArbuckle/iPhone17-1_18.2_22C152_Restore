@interface SEMSQLCommandGenerator
+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3;
+ (id)_generateCommaSeparatedValuesString:(id)a3;
+ (id)_generateJoinClause:(id)a3;
+ (id)_generateOrderByClause:(id)a3;
+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4;
+ (id)_produceJoinCriterionClause:(id)a3;
+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5;
+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4;
+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5;
+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5;
+ (id)prefixColumnName:(id)a3 withTableName:(id)a4;
+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10;
+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7;
+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5;
+ (void)replaceOffset:(id)a3 forSelect:(id)a4;
- (SEMSQLCommandGenerator)init;
@end

@implementation SEMSQLCommandGenerator

+ (id)selectFromTableWithName:(id)a3 columns:(id)a4 count:(BOOL)a5 join:(id)a6 criterion:(id)a7 order:(id)a8 limit:(id)a9 offset:(id)a10
{
  BOOL v13 = a5;
  id v16 = a3;
  id v75 = a7;
  id v74 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a6;
  v21 = objc_msgSend__produceSelectClauseWithTableName_columnNames_count_(a1, v20, (uint64_t)v16, (uint64_t)a4, v13);
  v22 = objc_opt_new();
  v25 = objc_msgSend__generateJoinClause_(a1, v23, (uint64_t)v19, v24);

  if (v25)
  {
    v29 = objc_msgSend_clause(v25, v26, v27, v28);
    uint64_t v32 = objc_msgSend_stringByAppendingString_(v21, v30, (uint64_t)v29, v31);

    v36 = objc_msgSend_parameters(v25, v33, v34, v35);
    objc_msgSend_addObjectsFromArray_(v22, v37, (uint64_t)v36, v38);

    v21 = (void *)v32;
  }
  v39 = objc_msgSend__produceCriterionClause_tableName_(a1, v26, (uint64_t)v75, (uint64_t)v16);
  v43 = v39;
  if (v39)
  {
    v44 = objc_msgSend_clause(v39, v40, v41, v42);
    uint64_t v47 = objc_msgSend_stringByAppendingFormat_(v21, v45, @" WHERE %@", v46, v44);

    v51 = objc_msgSend_parameters(v43, v48, v49, v50);
    objc_msgSend_addObjectsFromArray_(v22, v52, (uint64_t)v51, v53);

    v21 = (void *)v47;
  }
  uint64_t v54 = objc_msgSend__generateOrderByClause_(a1, v40, (uint64_t)v74, v42);
  v57 = (void *)v54;
  if (v54)
  {
    uint64_t v58 = objc_msgSend_stringByAppendingFormat_(v21, v55, @" ORDER BY %@", v56, v54);

    v21 = (void *)v58;
  }
  if (v17)
  {
    uint64_t v59 = objc_msgSend_stringByAppendingFormat_(v21, v55, @" LIMIT %@", v56, @"?");

    objc_msgSend_addObject_(v22, v60, (uint64_t)v17, v61);
    v21 = (void *)v59;
  }
  if (v18)
  {
    uint64_t v62 = objc_msgSend_stringByAppendingFormat_(v21, v55, @" OFFSET %@", v56, @"?");

    objc_msgSend_addObject_(v22, v63, (uint64_t)v18, v64);
    v21 = (void *)v62;
  }
  v65 = objc_msgSend_stringByAppendingString_(v21, v55, @"", v56);;

  v66 = [SEMDatabaseSelect alloc];
  if (objc_msgSend_count(v22, v67, v68, v69)) {
    uint64_t v71 = objc_msgSend_initWithCommandString_parameters_(v66, v70, (uint64_t)v65, (uint64_t)v22);
  }
  else {
    uint64_t v71 = objc_msgSend_initWithCommandString_parameters_(v66, v70, (uint64_t)v65, 0);
  }
  v72 = (void *)v71;

  return v72;
}

+ (void)addLimit:(id)a3 offset:(id)a4 forSelect:(id)a5
{
  id v52 = a5;
  id v7 = a4;
  id v8 = a3;
  v12 = objc_msgSend_commandString(v52, v9, v10, v11);
  id v16 = objc_msgSend_mutableCopy(v12, v13, v14, v15);

  v20 = objc_msgSend_parameters(v52, v17, v18, v19);
  uint64_t v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);

  if (!v24)
  {
    id v27 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v24 = objc_msgSend_initWithCapacity_(v27, v28, 2, v29);
  }
  v30 = objc_msgSend_stringWithFormat_(NSString, v25, @" LIMIT %@", v26, @"?");
  uint64_t v34 = objc_msgSend_length(v16, v31, v32, v33);
  objc_msgSend_insertString_atIndex_(v16, v35, (uint64_t)v30, v34 - 1);
  objc_msgSend_addObject_(v24, v36, (uint64_t)v8, v37);

  v40 = objc_msgSend_stringWithFormat_(NSString, v38, @" OFFSET %@", v39, @"?");
  uint64_t v44 = objc_msgSend_length(v16, v41, v42, v43);
  objc_msgSend_insertString_atIndex_(v16, v45, (uint64_t)v40, v44 - 1);
  objc_msgSend_addObject_(v24, v46, (uint64_t)v7, v47);

  objc_msgSend_replaceParameters_(v52, v48, (uint64_t)v24, v49);
  objc_msgSend_updateCommandString_(v52, v50, (uint64_t)v16, v51);
}

+ (void)replaceOffset:(id)a3 forSelect:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_parameters(v5, v7, v8, v9);
  id v21 = (id)objc_msgSend_mutableCopy(v10, v11, v12, v13);

  uint64_t v17 = objc_msgSend_count(v21, v14, v15, v16);
  objc_msgSend_replaceObjectAtIndex_withObject_(v21, v18, v17 - 1, (uint64_t)v6);

  objc_msgSend_updateParameters_(v5, v19, (uint64_t)v21, v20);
}

+ (id)deleteFromTableWithName:(id)a3 criterion:(id)a4 returningColumns:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 alloc];
  uint64_t v15 = objc_msgSend_initWithFormat_(v12, v13, @"DELETE FROM %@", v14, v11);
  uint64_t v17 = objc_msgSend__produceCriterionClause_tableName_(a1, v16, (uint64_t)v10, (uint64_t)v11);

  if (v17)
  {
    id v21 = objc_msgSend_clause(v17, v18, v19, v20);
    uint64_t v24 = objc_msgSend_stringByAppendingFormat_(v15, v22, @" WHERE %@", v23, v21);

    uint64_t v15 = (void *)v24;
  }
  if (objc_msgSend_count(v8, v18, v19, v20))
  {
    id v27 = objc_msgSend_componentsJoinedByString_(v8, v25, @", ", v26);
    uint64_t v30 = objc_msgSend_stringByAppendingFormat_(v15, v28, @" RETURNING %@", v29, v27);

    uint64_t v15 = (void *)v30;
  }
  uint64_t v31 = objc_msgSend_stringByAppendingString_(v15, v25, @"", v26);;

  uint64_t v32 = [SEMDatabaseDelete alloc];
  v36 = objc_msgSend_parameters(v17, v33, v34, v35);
  uint64_t v38 = objc_msgSend_initWithCommandString_parameters_(v32, v37, (uint64_t)v31, (uint64_t)v36);

  return v38;
}

+ (id)updateWithTableName:(id)a3 columnNames:(id)a4 columnValues:(id)a5 criterion:(id)a6 returningColumns:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (objc_class *)NSString;
  id v16 = a5;
  id v17 = a4;
  id v18 = [v15 alloc];
  id v21 = objc_msgSend_initWithFormat_(v18, v19, @"UPDATE %@", v20, v12);
  uint64_t v23 = objc_msgSend__produceSetValuesClauseForColumnNames_columnValues_(a1, v22, (uint64_t)v17, (uint64_t)v16);

  if (v23)
  {
    id v27 = objc_msgSend_clause(v23, v24, v25, v26);
    uint64_t v30 = objc_msgSend_stringByAppendingFormat_(v21, v28, @" SET %@", v29, v27);

    id v21 = (void *)v30;
  }
  uint64_t v31 = objc_msgSend__produceCriterionClause_tableName_(a1, v24, (uint64_t)v13, (uint64_t)v12);
  uint64_t v35 = v31;
  if (v31)
  {
    v36 = objc_msgSend_clause(v31, v32, v33, v34);
    uint64_t v39 = objc_msgSend_stringByAppendingFormat_(v21, v37, @" WHERE %@", v38, v36);

    id v21 = (void *)v39;
  }
  if (objc_msgSend_count(v14, v32, v33, v34))
  {
    uint64_t v42 = objc_msgSend_componentsJoinedByString_(v14, v40, @", ", v41);
    uint64_t v45 = objc_msgSend_stringByAppendingFormat_(v21, v43, @" RETURNING %@", v44, v42);

    id v21 = (void *)v45;
  }
  uint64_t v46 = objc_msgSend_stringByAppendingString_(v21, v40, @"", v41);;

  uint64_t v50 = objc_msgSend_parameters(v23, v47, v48, v49);
  uint64_t v54 = objc_msgSend_count(v50, v51, v52, v53);
  uint64_t v58 = objc_msgSend_parameters(v35, v55, v56, v57);
  uint64_t v62 = objc_msgSend_count(v58, v59, v60, v61) + v54;

  v65 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v63, v62, v64);
  uint64_t v69 = objc_msgSend_parameters(v23, v66, v67, v68);
  objc_msgSend_addObjectsFromArray_(v65, v70, (uint64_t)v69, v71);

  id v75 = objc_msgSend_parameters(v35, v72, v73, v74);
  objc_msgSend_addObjectsFromArray_(v65, v76, (uint64_t)v75, v77);

  v78 = [SEMDatabaseUpdate alloc];
  v80 = objc_msgSend_initWithCommandString_parameters_(v78, v79, (uint64_t)v46, (uint64_t)v65);

  return v80;
}

+ (id)insertCommandStringWithTableName:(id)a3 columnNames:(id)a4 returningColumns:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 alloc];
  uint64_t v15 = objc_msgSend_componentsJoinedByString_(v10, v13, @", ", v14);
  uint64_t v19 = objc_msgSend_count(v10, v16, v17, v18);

  uint64_t v22 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v20, v19, v21);
  uint64_t v25 = objc_msgSend_initWithFormat_(v12, v23, @"INSERT INTO %@ (%@) VALUES (%@)", v24, v11, v15, v22);

  if (objc_msgSend_count(v8, v26, v27, v28))
  {
    uint64_t v31 = objc_msgSend_componentsJoinedByString_(v8, v29, @", ", v30);
    uint64_t v34 = objc_msgSend_stringByAppendingFormat_(v25, v32, @" RETURNING %@", v33, v31);

    uint64_t v25 = (void *)v34;
  }
  uint64_t v35 = objc_msgSend_stringByAppendingString_(v25, v29, @"", v30);;

  return v35;
}

+ (id)_produceSetValuesClauseForColumnNames:(id)a3 columnValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
  if (v11 && (uint64_t v15 = v11, objc_msgSend_count(v7, v12, v13, v14) == v11))
  {
    id v16 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v19 = objc_msgSend_initWithCapacity_(v16, v17, v15, v18);
    uint64_t v20 = objc_opt_new();
    if (objc_msgSend_count(v6, v21, v22, v23))
    {
      unint64_t v27 = 0;
      do
      {
        id v28 = [NSString alloc];
        uint64_t v31 = objc_msgSend_objectAtIndex_(v6, v29, v27, v30);
        uint64_t v34 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v32, 1, v33);
        uint64_t v37 = objc_msgSend_initWithFormat_(v28, v35, @"%@ = %@", v36, v31, v34);
        objc_msgSend_addObject_(v19, v38, (uint64_t)v37, v39);

        uint64_t v42 = objc_msgSend_objectAtIndex_(v7, v40, v27, v41);
        objc_msgSend_addObject_(v20, v43, (uint64_t)v42, v44);

        ++v27;
      }
      while (v27 < objc_msgSend_count(v6, v45, v46, v47));
    }
    if ((unint64_t)objc_msgSend_count(v19, v24, v25, v26) <= 1)
    {
      uint64_t v54 = [SEMSQLCommandClause alloc];
      uint64_t v50 = objc_msgSend_objectAtIndex_(v19, v55, 0, v56);
      uint64_t v51 = v54;
    }
    else
    {
      uint64_t v50 = objc_msgSend_componentsJoinedByString_(v19, v48, @", ", v49);
      uint64_t v51 = [SEMSQLCommandClause alloc];
    }
    uint64_t v53 = objc_msgSend_initWithClause_parameters_(v51, v52, (uint64_t)v50, (uint64_t)v20);
  }
  else
  {
    uint64_t v53 = 0;
  }

  return v53;
}

+ (id)_produceSelectClauseWithTableName:(id)a3 columnNames:(id)a4 count:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v12 = v9;
  if (v5)
  {
    objc_msgSend_stringWithFormat_(NSString, v10, @"SELECT COUNT(*) FROM %@", v11, v8);
  }
  else
  {
    uint64_t v13 = NSString;
    if (v9)
    {
      uint64_t v14 = objc_msgSend__generateCommaSeparatedValuesString_(a1, v10, (uint64_t)v9, v11);
      uint64_t v17 = objc_msgSend_stringWithFormat_(v13, v15, @"SELECT %@ FROM %@", v16, v14, v8);

      goto LABEL_7;
    }
    objc_msgSend_stringWithFormat_(NSString, v10, @"SELECT * FROM %@", v11, v8);
  uint64_t v17 = };
LABEL_7:

  return v17;
}

+ (id)_generateJoinClause:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v8 = objc_msgSend_joinCriterion(v4, v5, v6, v7);
    uint64_t v11 = objc_msgSend__produceJoinCriterionClause_(a1, v9, (uint64_t)v8, v10);

    id v12 = [NSString alloc];
    uint64_t v16 = objc_msgSend_table(v4, v13, v14, v15);

    uint64_t v20 = objc_msgSend_clause(v11, v17, v18, v19);
    uint64_t v23 = objc_msgSend_initWithFormat_(v12, v21, @" JOIN %@ ON (%@)", v22, v16, v20);

    uint64_t v24 = [SEMSQLCommandClause alloc];
    uint64_t v26 = objc_msgSend_initWithClause_parameters_(v24, v25, (uint64_t)v23, 0);
  }
  else
  {
    uint64_t v26 = 0;
  }
  return v26;
}

+ (id)prefixColumnName:(id)a3 withTableName:(id)a4
{
  id v5 = a3;
  id v8 = v5;
  if (a4)
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"%@.%@", v7, a4, v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  uint64_t v10 = v9;

  return v10;
}

+ (id)_produceJoinCriterionClause:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v8 = objc_msgSend_subCriteria(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_sqlOperator(v4, v9, v10, v11);
  if (v12 == 10)
  {
    id v79 = v4;
    uint64_t v40 = objc_msgSend_count(v8, v13, v14, v15);
    id v41 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v44 = objc_msgSend_initWithCapacity_(v41, v42, v40, v43);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v78 = v8;
    id v45 = v8;
    uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v80, (uint64_t)v88, 16);
    if (v47)
    {
      uint64_t v50 = v47;
      uint64_t v51 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v81 != v51) {
            objc_enumerationMutation(v45);
          }
          uint64_t v53 = objc_msgSend__produceJoinCriterionClause_(a1, v48, *(void *)(*((void *)&v80 + 1) + 8 * i), v49);
          if (v53)
          {
            id v54 = [NSString alloc];
            uint64_t v58 = objc_msgSend_clause(v53, v55, v56, v57);
            uint64_t v61 = objc_msgSend_initWithFormat_(v54, v59, @"(%@)", v60, v58);
            objc_msgSend_addObject_(v44, v62, (uint64_t)v61, v63);
          }
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v80, (uint64_t)v88, 16);
      }
      while (v50);
    }

    if (objc_msgSend_count(v44, v64, v65, v66))
    {
      uint64_t v39 = objc_msgSend_componentsJoinedByString_(v44, v67, @" AND ", v68);
    }
    else
    {
      uint64_t v39 = 0;
    }
    id v4 = v79;

    id v8 = v78;
  }
  else if (v12 == 1)
  {
    id v16 = [NSString alloc];
    uint64_t v20 = objc_msgSend_columnName(v4, v17, v18, v19);
    uint64_t v24 = objc_msgSend_tableName(v4, v21, v22, v23);
    uint64_t v26 = objc_msgSend_prefixColumnName_withTableName_(a1, v25, (uint64_t)v20, (uint64_t)v24);
    uint64_t v30 = objc_msgSend_comparingColumnName(v4, v27, v28, v29);
    uint64_t v34 = objc_msgSend_comparingTableName(v4, v31, v32, v33);
    uint64_t v36 = objc_msgSend_prefixColumnName_withTableName_(a1, v35, (uint64_t)v30, (uint64_t)v34);
    uint64_t v39 = objc_msgSend_initWithFormat_(v16, v37, @"%@ = %@", v38, v26, v36);
  }
  else
  {
    uint64_t v69 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v74 = v69;
      *(_DWORD *)buf = 136315394;
      v85 = "+[SEMSQLCommandGenerator _produceJoinCriterionClause:]";
      __int16 v86 = 2048;
      uint64_t v87 = objc_msgSend_sqlOperator(v4, v75, v76, v77);
      _os_log_error_impl(&dword_25C7CA000, v74, OS_LOG_TYPE_ERROR, "%s Inavlid join criterion, sql operator not supported for join %ld", buf, 0x16u);
    }
    uint64_t v39 = 0;
  }
  v70 = [SEMSQLCommandClause alloc];
  v72 = objc_msgSend_initWithClause_parameters_(v70, v71, (uint64_t)v39, 0);

  return v72;
}

+ (id)_produceCriterionClause:(id)a3 tableName:(id)a4
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v211 = a4;
  if (v6)
  {
    uint64_t v10 = objc_msgSend_columnName(v6, v7, v8, v9);
    uint64_t v14 = objc_msgSend_tableName(v6, v11, v12, v13);
    id v16 = objc_msgSend_prefixColumnName_withTableName_(a1, v15, (uint64_t)v10, (uint64_t)v14);

    uint64_t v20 = objc_msgSend_columnValues(v6, v17, v18, v19);
    uint64_t v24 = objc_msgSend_subCriteria(v6, v21, v22, v23);
    uint64_t v25 = objc_opt_new();
    switch(objc_msgSend_sqlOperator(v6, v26, v27, v28))
    {
      case 1:
        id v32 = [NSString alloc];
        uint64_t v35 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v33, 1, v34);
        uint64_t v38 = objc_msgSend_initWithFormat_(v32, v36, @"%@ = %@", v37, v16, v35);
        goto LABEL_15;
      case 2:
        id v40 = [NSString alloc];
        uint64_t v43 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v41, 1, v42);
        uint64_t v46 = objc_msgSend_initWithFormat_(v40, v44, @"%@ < %@", v45, v16, v43);
        goto LABEL_8;
      case 3:
        id v47 = [NSString alloc];
        uint64_t v43 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v48, 1, v49);
        uint64_t v46 = objc_msgSend_initWithFormat_(v47, v50, @"%@ <= %@", v51, v16, v43);
        goto LABEL_8;
      case 4:
        id v52 = [NSString alloc];
        uint64_t v43 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v53, 1, v54);
        uint64_t v46 = objc_msgSend_initWithFormat_(v52, v55, @"%@ >= %@", v56, v16, v43);
LABEL_8:
        uint64_t v57 = (void *)v46;

        uint64_t v61 = objc_msgSend_firstObject(v20, v58, v59, v60);
        objc_msgSend_addObject_(v25, v62, (uint64_t)v61, v63);

        if (!v57) {
          goto LABEL_48;
        }
        goto LABEL_45;
      case 5:
        id v64 = [NSString alloc];
        uint64_t v67 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v65, 1, v66);
        uint64_t v57 = objc_msgSend_initWithFormat_(v64, v68, @"%@ MATCH %@", v69, v211, v67);

        v70 = NSString;
        uint64_t v74 = objc_msgSend_firstObject(v20, v71, v72, v73);
        uint64_t v77 = objc_msgSend_stringWithFormat_(v70, v75, @"%@ : %@", v76, v16, v74);

        goto LABEL_16;
      case 6:
        id v80 = [NSString alloc];
        uint64_t v35 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v81, 1, v82);
        uint64_t v38 = objc_msgSend_initWithFormat_(v80, v83, @"%@ != %@", v84, v16, v35);
        goto LABEL_15;
      case 7:
        id v85 = [NSString alloc];
        v88 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v86, 1, v87);
        objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v89, 1, v90);
        v92 = v91 = v25;
        uint64_t v57 = objc_msgSend_initWithFormat_(v85, v93, @"%@ BETWEEN (%@) AND (%@)", v94, v16, v88, v92);

        uint64_t v25 = v91;
        objc_msgSend_addObjectsFromArray_(v91, v95, (uint64_t)v20, v96);
        goto LABEL_44;
      case 8:
        id v97 = [NSString alloc];
        uint64_t v101 = objc_msgSend_count(v20, v98, v99, v100);
        v104 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v102, v101, v103);
        uint64_t v107 = objc_msgSend_initWithFormat_(v97, v105, @"%@ IN (%@)", v106, v16, v104);
        goto LABEL_43;
      case 9:
        id v108 = [NSString alloc];
        uint64_t v35 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v109, 1, v110);
        uint64_t v38 = objc_msgSend_initWithFormat_(v108, v111, @"%@ LIKE %@", v112, v16, v35);
LABEL_15:
        uint64_t v57 = (void *)v38;

        uint64_t v77 = objc_msgSend_firstObject(v20, v113, v114, v115);
LABEL_16:
        objc_msgSend_addObject_(v25, v78, (uint64_t)v77, v79);

        if (!v57) {
          goto LABEL_48;
        }
        goto LABEL_45;
      case 10:
        v116 = v25;
        v208 = v20;
        v209 = v16;
        id v210 = v6;
        uint64_t v117 = objc_msgSend_count(v24, v29, v30, v31);
        id v118 = objc_alloc(MEMORY[0x263EFF980]);
        v121 = objc_msgSend_initWithCapacity_(v118, v119, v117, v120);
        long long v216 = 0u;
        long long v217 = 0u;
        long long v218 = 0u;
        long long v219 = 0u;
        v207 = v24;
        id v122 = v24;
        uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v216, (uint64_t)v221, 16);
        if (v124)
        {
          uint64_t v126 = v124;
          uint64_t v127 = *(void *)v217;
          do
          {
            for (uint64_t i = 0; i != v126; ++i)
            {
              if (*(void *)v217 != v127) {
                objc_enumerationMutation(v122);
              }
              v129 = objc_msgSend__produceCriterionClause_tableName_(a1, v125, *(void *)(*((void *)&v216 + 1) + 8 * i), (uint64_t)v211);
              if (v129)
              {
                id v130 = [NSString alloc];
                v134 = objc_msgSend_clause(v129, v131, v132, v133);
                v137 = objc_msgSend_initWithFormat_(v130, v135, @"(%@)", v136, v134);
                objc_msgSend_addObject_(v121, v138, (uint64_t)v137, v139);

                v143 = objc_msgSend_parameters(v129, v140, v141, v142);
                objc_msgSend_addObjectsFromArray_(v116, v144, (uint64_t)v143, v145);
              }
            }
            uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v125, (uint64_t)&v216, (uint64_t)v221, 16);
          }
          while (v126);
        }

        if (!objc_msgSend_count(v121, v146, v147, v148)) {
          goto LABEL_46;
        }
        objc_msgSend_componentsJoinedByString_(v121, v149, @" AND ", v150);
        goto LABEL_40;
      case 11:
        v116 = v25;
        v208 = v20;
        v209 = v16;
        id v210 = v6;
        uint64_t v151 = objc_msgSend_count(v24, v29, v30, v31);
        id v152 = objc_alloc(MEMORY[0x263EFF980]);
        v121 = objc_msgSend_initWithCapacity_(v152, v153, v151, v154);
        long long v212 = 0u;
        long long v213 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        v207 = v24;
        id v155 = v24;
        uint64_t v157 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v156, (uint64_t)&v212, (uint64_t)v220, 16);
        if (v157)
        {
          uint64_t v159 = v157;
          uint64_t v160 = *(void *)v213;
          do
          {
            for (uint64_t j = 0; j != v159; ++j)
            {
              if (*(void *)v213 != v160) {
                objc_enumerationMutation(v155);
              }
              v162 = objc_msgSend__produceCriterionClause_tableName_(a1, v158, *(void *)(*((void *)&v212 + 1) + 8 * j), (uint64_t)v211);
              if (v162)
              {
                id v163 = [NSString alloc];
                v167 = objc_msgSend_clause(v162, v164, v165, v166);
                v170 = objc_msgSend_initWithFormat_(v163, v168, @"(%@)", v169, v167);
                objc_msgSend_addObject_(v121, v171, (uint64_t)v170, v172);

                v176 = objc_msgSend_parameters(v162, v173, v174, v175);
                objc_msgSend_addObjectsFromArray_(v116, v177, (uint64_t)v176, v178);
              }
            }
            uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v158, (uint64_t)&v212, (uint64_t)v220, 16);
          }
          while (v159);
        }

        if (objc_msgSend_count(v121, v179, v180, v181))
        {
          objc_msgSend_componentsJoinedByString_(v121, v182, @" OR ", v183);
          uint64_t v57 = LABEL_40:;
        }
        else
        {
LABEL_46:
          uint64_t v57 = 0;
        }
        uint64_t v20 = v208;
        id v16 = v209;
        uint64_t v24 = v207;

        id v6 = v210;
        uint64_t v25 = v116;
        if (!v57) {
          goto LABEL_48;
        }
        goto LABEL_45;
      case 12:
        id v184 = [NSString alloc];
        uint64_t v188 = objc_msgSend_count(v20, v185, v186, v187);
        v104 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v189, v188, v190);
        uint64_t v107 = objc_msgSend_initWithFormat_(v184, v191, @"%@ IS %@", v192, v16, v104);
        goto LABEL_43;
      case 13:
        id v193 = [NSString alloc];
        uint64_t v197 = objc_msgSend_count(v20, v194, v195, v196);
        v104 = objc_msgSend__generateCommaSeparatedPlaceholdersString_(a1, v198, v197, v199);
        uint64_t v107 = objc_msgSend_initWithFormat_(v193, v200, @"%@ IS NOT %@", v201, v16, v104);
LABEL_43:
        uint64_t v57 = (void *)v107;

        objc_msgSend_addObjectsFromArray_(v25, v202, (uint64_t)v20, v203);
LABEL_44:
        if (!v57) {
          goto LABEL_48;
        }
LABEL_45:
        v204 = [SEMSQLCommandClause alloc];
        uint64_t v39 = objc_msgSend_initWithClause_parameters_(v204, v205, (uint64_t)v57, (uint64_t)v25);

        break;
      default:
LABEL_48:
        uint64_t v39 = 0;
        break;
    }
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

+ (id)_generateOrderByClause:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = objc_msgSend_orderMode(v4, v5, v6, v7);
  switch(v9)
  {
    case 3:
      id v11 = [NSString alloc];
      uint64_t v15 = objc_msgSend_columnNames(v8, v12, v13, v14);
      uint64_t v18 = objc_msgSend__generateCommaSeparatedValuesString_(a1, v16, (uint64_t)v15, v17);
      uint64_t v21 = objc_msgSend_initWithFormat_(v11, v19, @"%@ DESC", v20, v18);
LABEL_10:
      uint64_t v10 = (__CFString *)v21;

      break;
    case 2:
      id v22 = [NSString alloc];
      uint64_t v15 = objc_msgSend_columnNames(v8, v23, v24, v25);
      uint64_t v18 = objc_msgSend__generateCommaSeparatedValuesString_(a1, v26, (uint64_t)v15, v27);
      uint64_t v21 = objc_msgSend_initWithFormat_(v22, v28, @"%@ ASC", v29, v18);
      goto LABEL_10;
    case 1:
      uint64_t v10 = @"rank";
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
LABEL_11:

  return v10;
}

+ (id)_generateCommaSeparatedPlaceholdersString:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    if (a3 == 1)
    {
      id v4 = @"?";
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v10 = objc_msgSend_initWithCapacity_(v5, v6, v3, v7);
      do
      {
        objc_msgSend_addObject_(v10, v8, @"?", v9);
        --v3;
      }
      while (v3);
      objc_msgSend_componentsJoinedByString_(v10, v8, @", ", v9);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = &stru_2709E04D0;
  }
  return v4;
}

+ (id)_generateCommaSeparatedValuesString:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_count(v3, v4, v5, v6);
  if (v7)
  {
    if (v7 == 1) {
      objc_msgSend_objectAtIndex_(v3, v8, 0, v9);
    }
    else {
      objc_msgSend_componentsJoinedByString_(v3, v8, @", ", v9);
    }
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = &stru_2709E04D0;
  }

  return v10;
}

- (SEMSQLCommandGenerator)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must call class methods", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end