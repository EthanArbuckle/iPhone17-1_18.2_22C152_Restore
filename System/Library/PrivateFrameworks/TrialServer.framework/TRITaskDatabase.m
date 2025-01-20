@interface TRITaskDatabase
- (BOOL)_checkTaskId:(id)a3 IsPresent:(BOOL *)a4 transaction:(id)a5;
- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4;
- (BOOL)removeTaskWithId:(id)a3 cleanupBlock:(id)a4;
- (BOOL)updateTaskWithTaskId:(id)a3 capabilities:(unint64_t)a4 task:(id)a5;
- (BOOL)updateTaskWithTaskId:(id)a3 startDate:(id)a4 task:(id)a5;
- (TRITaskDatabase)initWithDatabase:(id)a3 taskSetProvider:(id)a4;
- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3;
- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3;
- (id)_tasksForQuery:(id)a3 onPrep:(id)a4;
- (id)addTask:(id)a3 startTime:(id)a4 tags:(id)a5 dependencies:(id)a6 error:(id *)a7;
- (id)allTasks;
- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4;
- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4 taskType:(int)a5;
- (id)directDependenciesOfTaskWithId:(id)a3;
- (id)idForTask:(id)a3;
- (id)taskIdsWithTag:(id)a3;
- (id)tasksDependentOnTask:(id)a3;
- (unint64_t)count;
@end

@implementation TRITaskDatabase

- (TRITaskDatabase)initWithDatabase:(id)a3 taskSetProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 34, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 35, @"Invalid parameter not satisfying: %@", @"taskSetProvider" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRITaskDatabase;
  v11 = [(TRITaskDatabase *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_db, a3);
    objc_storeStrong((id *)&v12->_taskSetProvider, a4);
  }

  return v12;
}

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db readTransactionWithFailableBlock:a3];
}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  return (_PASDBTransactionCompletion_)[(TRIDatabase *)self->_db writeTransactionWithFailableBlock:a3];
}

- (id)addTask:(id)a3 startTime:(id)a4 tags:(id)a5 dependencies:(id)a6 error:(id *)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 56, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];
  }
  if (-[TRITaskSetProviding taskClassForTaskType:](self->_taskSetProvider, "taskClassForTaskType:", [v13 taskType]))
  {
    v17 = [v13 serialize];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__19;
    v45 = __Block_byref_object_dispose__19;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__19;
    v39 = __Block_byref_object_dispose__19;
    id v40 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke;
    v27[3] = &unk_1E6BBAFD8;
    v27[4] = self;
    id v28 = v13;
    v33 = &v41;
    v34 = &v35;
    id v29 = v16;
    id v18 = v17;
    id v30 = v18;
    id v31 = v14;
    id v32 = v15;
    [(TRITaskDatabase *)self writeTransactionWithFailableBlock:v27];
    if (a7)
    {
      v19 = (void *)v42[5];
      if (v19) {
        *a7 = v19;
      }
    }
    a7 = (id *)(id)v36[5];

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    if (!a7) {
      goto LABEL_11;
    }
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v21 = [NSString alloc];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v23 = (void *)[v21 initWithFormat:@"Can't add task of class %@ which is not registered", v18];
    v48[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a7 = (id)[v20 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v24];

    a7 = 0;
  }

LABEL_11:
  return a7;
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke(uint64_t a1, void *a2)
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) idForTask:*(void *)(a1 + 40)];

  if (v4)
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"Tried to add TRITask %@, which has a duplicate already present in the database", *(void *)(a1 + 40)];
    uint64_t v78 = *MEMORY[0x1E4F28568];
    v79[0] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    goto LABEL_5;
  }
  if ([*(id *)(a1 + 48) count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v76 = 0x2020000000;
    unint64_t v77 = 0x8000000000000000;
    uint64_t v4 = [v3 db];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_31;
    v69[3] = &unk_1E6BB7C50;
    id v70 = *(id *)(a1 + 48);
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2;
    v68[3] = &unk_1E6BBAFB0;
    v68[4] = &buf;
    id v15 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v16 + 40);
    v17 = [v15 generalErrorHandlerWithOutError:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    LOBYTE(v16) = objc_msgSend((id)v4, "prepAndRunQuery:onPrep:onRow:onError:", @" WITH depsTable (dep_rowid) AS(    SELECT * FROM _pas_nsarray(:dependencies)) SELECT dep_rowid FROM     depsTable WHERE     dep_rowid NOT IN (SELECT rowid FROM tasks) LIMIT 1;",
                    v69,
                    v68,
                    v17);

    if (v16)
    {
      if (*(void *)(*((void *)&buf + 1) + 24) == 0x8000000000000000)
      {
        char v18 = 1;
        goto LABEL_18;
      }
      id v21 = [NSString alloc];
      v22 = (void *)[v21 initWithFormat:@"Tried to add TRITask with dependent task %lld, which is not in the db", *(void *)(*((void *)&buf + 1) + 24)];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v74 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v23];
      uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
      v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v71 = 138543362;
        v72 = v22;
        _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "%{public}@", v71, 0xCu);
      }

      uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }
    else
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = 0;
    }
    char v18 = 0;
    uint64_t v4 = *MEMORY[0x1E4F93BF0];
LABEL_18:

    _Block_object_dispose(&buf, 8);
    if ((v18 & 1) == 0) {
      goto LABEL_7;
    }
  }
  id v30 = [v3 db];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_43;
  v63[3] = &unk_1E6BB7EF8;
  id v64 = *(id *)(a1 + 40);
  id v65 = *(id *)(a1 + 56);
  id v66 = *(id *)(a1 + 64);
  id v31 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v32 = *(void *)(*(void *)(a1 + 80) + 8);
  id v62 = *(id *)(v32 + 40);
  v33 = [v31 generalErrorHandlerWithOutError:&v62];
  objc_storeStrong((id *)(v32 + 40), v62);
  int v34 = objc_msgSend(v30, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT INTO tasks(    taskType,     serializedTask,     startSecondsFromEpoch,     hash,     capabilities) VALUES(    :task_type,     :serialized_task,     :start_seconds,     :hash,     :capabilities_mask);",
          v63,
          0,
          v33);

  if ((v34 & 1) == 0)
  {
    uint64_t v35 = *(void *)(*(void *)(a1 + 88) + 8);
    v36 = *(void **)(v35 + 40);
    *(void *)(v35 + 40) = 0;

    uint64_t v4 = *MEMORY[0x1E4F93BF0];
  }

  if (v34)
  {
    id v37 = [v3 db];
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)[v37 handle]);

    if ([*(id *)(a1 + 72) count])
    {
      v39 = [v3 db];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2_53;
      v59[3] = &unk_1E6BB7C78;
      sqlite3_int64 v61 = insert_rowid;
      id v60 = *(id *)(a1 + 72);
      id v40 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v41 = *(void *)(*(void *)(a1 + 80) + 8);
      id v58 = *(id *)(v41 + 40);
      v42 = [v40 generalErrorHandlerWithOutError:&v58];
      objc_storeStrong((id *)(v41 + 40), v58);
      LODWORD(v41) = objc_msgSend(v39, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO taskTags(    taskId,     tag) SELECT     :tasks_rowid,     * FROM     _pas_nsarray(:tags);",
                       v59,
                       0,
                       v42);

      if (!v41)
      {
        uint64_t v50 = *(void *)(*(void *)(a1 + 88) + 8);
        v51 = *(void **)(v50 + 40);
        *(void *)(v50 + 40) = 0;

        goto LABEL_5;
      }
    }
    if (![*(id *)(a1 + 48) count])
    {
LABEL_28:
      uint64_t v47 = [objc_alloc(NSNumber) initWithLongLong:insert_rowid];
      uint64_t v48 = *(void *)(*(void *)(a1 + 88) + 8);
      v49 = *(void **)(v48 + 40);
      *(void *)(v48 + 40) = v47;

      id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      goto LABEL_6;
    }
    uint64_t v43 = [v3 db];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_3;
    v55[3] = &unk_1E6BB7C78;
    sqlite3_int64 v57 = insert_rowid;
    id v56 = *(id *)(a1 + 48);
    v44 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8);
    id v54 = *(id *)(v45 + 40);
    id v46 = [v44 generalErrorHandlerWithOutError:&v54];
    objc_storeStrong((id *)(v45 + 40), v54);
    LODWORD(v45) = objc_msgSend(v43, "prepAndRunQuery:onPrep:onRow:onError:", @" INSERT OR IGNORE INTO taskDependencies(    taskId,     dependentTaskId) SELECT     :tasks_rowid,     * FROM     _pas_nsarray(:dependencies);",
                     v55,
                     0,
                     v46);

    if (v45)
    {

      goto LABEL_28;
    }
    uint64_t v52 = *(void *)(*(void *)(a1 + 88) + 8);
    v53 = *(void **)(v52 + 40);
    *(void *)(v52 + 40) = 0;

LABEL_5:
    id v13 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
LABEL_6:
    uint64_t v4 = *v13;
  }
LABEL_7:

  return v4;
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_31(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":dependencies" toNSArray:*(void *)(a1 + 32)];
}

uint64_t __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getInt64ForColumnName:"dep_rowid" table:"depsTable"];
  return *MEMORY[0x1E4F93C10];
}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_43(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":task_type", (int)objc_msgSend(*(id *)(a1 + 32), "taskType"));
  [v6 bindNamedParam:":serialized_task" toNSData:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = NSNumber;
    [v3 timeIntervalSince1970];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v6 bindNamedParam:":start_seconds" toDoubleAsNSNumber:v5];
  }
  else
  {
    [v6 bindNamedParam:":start_seconds" toDoubleAsNSNumber:0];
  }
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 32), "hash"));
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":capabilities_mask", objc_msgSend(*(id *)(a1 + 32), "requiredCapabilities"));
}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_2_53(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":tasks_rowid" toInt64:v3];
  [v4 bindNamedParam:":tags" toNSArray:*(void *)(a1 + 32)];
}

void __61__TRITaskDatabase_addTask_startTime_tags_dependencies_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 bindNamedParam:":tasks_rowid" toInt64:v3];
  [v4 bindNamedParam:":dependencies" toNSArray:*(void *)(a1 + 32)];
}

- (BOOL)removeTaskWithId:(id)a3 cleanupBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 226, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__63;
  v21[4] = __Block_byref_object_dispose__64;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke;
  v14[3] = &unk_1E6BBB028;
  id v9 = v8;
  id v17 = v9;
  id v10 = v7;
  uint64_t v19 = &v23;
  SEL v20 = a2;
  id v15 = v10;
  uint64_t v16 = self;
  char v18 = v21;
  [(TRITaskDatabase *)self writeTransactionWithFailableBlock:v14];
  char v11 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 48))
  {
    v5 = [v3 db];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2;
    v32[3] = &unk_1E6BB7C50;
    id v33 = *(id *)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3;
    v29[3] = &unk_1E6BBB000;
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 72);
    v29[4] = v6;
    long long v22 = *(_OWORD *)(a1 + 48);
    id v7 = (id)v22;
    long long v30 = v22;
    id v8 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
    objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT     taskType, serializedTask FROM     tasks WHERE     rowid = :task_id LIMIT 1;",
      v32,
      v29,
      v8);
  }
  id v9 = objc_msgSend(v4, "db", v22);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2_79;
  v27[3] = &unk_1E6BB7C50;
  id v28 = *(id *)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v11 = objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM         taskDependencies WHERE         taskId = :task_id    OR   dependentTaskId = :task_id;",
          v27,
          0,
          v10);

  if ((v11 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v19 = *MEMORY[0x1E4F93BF0];
    id v20 = v28;
LABEL_12:

    goto LABEL_13;
  }

  v12 = [v4 db];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3_83;
  v25[3] = &unk_1E6BB7C50;
  id v26 = *(id *)(a1 + 32);
  id v13 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v14 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     taskTags WHERE     taskId = :task_id;",
          v25,
          0,
          v13);

  if ((v14 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v19 = *MEMORY[0x1E4F93BF0];
    id v20 = v26;
    goto LABEL_12;
  }

  id v15 = [v4 db];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_4;
  v23[3] = &unk_1E6BB7C50;
  id v24 = *(id *)(a1 + 32);
  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
  char v17 = objc_msgSend(v15, "prepAndRunQuery:onPrep:onRow:onError:", @" DELETE FROM     tasks WHERE     rowid = :task_id;",
          v23,
          0,
          v16);

  if ((v17 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v19 = *MEMORY[0x1E4F93BF0];
    id v20 = v24;
    goto LABEL_12;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
  uint64_t v19 = *MEMORY[0x1E4F93BE8];
LABEL_13:

  return v19;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"taskType" table:0];
  v5 = [v3 getNSDataForColumnName:"serializedTask" table:0];

  if (!v5)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:250 description:@"read NULL serializedTask for NOT NULL column"];
  }
  uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) taskClassForTaskType:v4];
  if (v6)
  {
    id v7 = [v6 parseFromData:v5];
    if (v7)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_74;
      v15[3] = &unk_1E6BB82D0;
      id v17 = *(id *)(a1 + 40);
      id v16 = v7;
      uint64_t v8 = MEMORY[0x1E016EA80](v15);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *MEMORY[0x1E4F93C10];
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F93C10];
    }
  }
  else
  {
    v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v19 = v4;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", buf, 8u);
    }

    uint64_t v11 = *MEMORY[0x1E4F93C10];
  }

  return v11;
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_2_79(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_3_83(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __49__TRITaskDatabase_removeTaskWithId_cleanupBlock___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

- (id)allTasks
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__19;
  uint64_t v11 = __Block_byref_object_dispose__19;
  id v12 = (id)objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__TRITaskDatabase_allTasks__block_invoke;
  v6[3] = &unk_1E6BBB0C8;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke(uint64_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __27__TRITaskDatabase_allTasks__block_invoke_2;
  v59[3] = &unk_1E6BBB050;
  uint64_t v61 = a1[6];
  long long v60 = *((_OWORD *)a1 + 2);
  v5 = [*(id *)(v60 + 8) generalErrorHandlerWithOutError:0];
  char v6 = [v4 prepAndRunQuery:@" SELECT * FROM tasks;" onPrep:0 onRow:v59 onError:v5];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x3032000000;
    id v56 = __Block_byref_object_copy__19;
    sqlite3_int64 v57 = __Block_byref_object_dispose__19;
    id v58 = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __27__TRITaskDatabase_allTasks__block_invoke_103;
    v49[3] = &unk_1E6BBB078;
    uint64_t v8 = a1[5];
    v51 = &v53;
    uint64_t v52 = v8;
    id v9 = v7;
    id v50 = v9;
    id v10 = (void *)MEMORY[0x1E016EA80](v49);
    uint64_t v11 = [v3 db];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __27__TRITaskDatabase_allTasks__block_invoke_2_107;
    v44[3] = &unk_1E6BBB0A0;
    uint64_t v12 = a1[6];
    uint64_t v47 = &v53;
    uint64_t v48 = v12;
    v44[4] = a1[4];
    id v13 = v10;
    id v46 = v13;
    id v14 = v9;
    id v45 = v14;
    id v15 = [*(id *)(a1[4] + 8) generalErrorHandlerWithOutError:0];
    int v16 = objc_msgSend((id)v11, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM     taskTags ORDER BY     taskId ASC,     rowid ASC;",
            0,
            v44,
            v15);

    if (v16)
    {
      v13[2](v13);
    }
    else
    {
      uint64_t v19 = *(void *)(a1[5] + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = 0;

      uint64_t v11 = *MEMORY[0x1E4F93BF0];
    }

    _Block_object_dispose(&v53, 8);
    if (v16)
    {
      id v21 = objc_opt_new();
      uint64_t v53 = 0;
      id v54 = &v53;
      uint64_t v55 = 0x3032000000;
      id v56 = __Block_byref_object_copy__19;
      sqlite3_int64 v57 = __Block_byref_object_dispose__19;
      id v58 = 0;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __27__TRITaskDatabase_allTasks__block_invoke_3;
      v40[3] = &unk_1E6BBB078;
      uint64_t v22 = a1[5];
      v42 = &v53;
      uint64_t v43 = v22;
      id v23 = v21;
      id v41 = v23;
      id v24 = (void *)MEMORY[0x1E016EA80](v40);
      uint64_t v25 = [v3 db];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __27__TRITaskDatabase_allTasks__block_invoke_4;
      v34[3] = &unk_1E6BBB0A0;
      uint64_t v26 = a1[6];
      uint64_t v35 = a1[4];
      v38 = &v53;
      uint64_t v39 = v26;
      v27 = v24;
      id v37 = v27;
      id v28 = v23;
      id v36 = v28;
      id v29 = objc_msgSend(*(id *)(a1[4] + 8), "generalErrorHandlerWithOutError:", 0, v34[0], 3221225472, __27__TRITaskDatabase_allTasks__block_invoke_4, &unk_1E6BBB0A0, v35);
      int v30 = objc_msgSend(v25, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM     taskDependencies ORDER BY     taskId ASC,     dependentTaskId ASC;",
              0,
              v34,
              v29);

      if (v30)
      {
        v27[2](v27);
      }
      else
      {
        uint64_t v31 = *(void *)(a1[5] + 8);
        uint64_t v32 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = 0;

        LODWORD(v11) = *MEMORY[0x1E4F93BF0];
      }

      _Block_object_dispose(&v53, 8);
      if (v30) {
        uint64_t v11 = *MEMORY[0x1E4F93BE8];
      }
      else {
        uint64_t v11 = v11;
      }
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1[5] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    uint64_t v11 = *MEMORY[0x1E4F93BF0];
  }

  return v11;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_2(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getInt64AsNSNumberForColumnName:"rowid" table:0];
  if (!v4)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:349 description:@"read NULL rowid from PRIMARY KEY column"];
  }
  uint64_t v5 = [v3 getInt64ForColumnName:"taskType" table:0];
  char v6 = [v3 getDoubleAsNSNumberForColumnName:"startSecondsFromEpoch" table:0];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 doubleValue];
    uint64_t v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [v3 getNSDataForColumnName:"serializedTask" table:0];
  if (!v9)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:358 description:@"read NULL serializedTask from NOT NULL column"];
  }
  id v10 = (void *)[*(id *)(a1[4] + 16) taskClassForTaskType:v5];
  if (v10)
  {
    uint64_t v11 = [v10 parseFromData:v9];
    if (v11)
    {
      uint64_t v12 = [v3 getInt64ForColumnName:"capabilities" table:0];
      if (v12 == [v11 requiredCapabilities])
      {
        id v13 = [TRITaskRecord alloc];
        id v14 = [(TRITaskRecord *)v13 initWithTaskId:v4 task:v11 startDate:v8 dependencies:MEMORY[0x1E4F1CBF0] capabilities:v12 tags:MEMORY[0x1E4F1CBF0]];
        [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v14 forKeyedSubscript:v4];
        uint64_t v15 = *MEMORY[0x1E4F93C08];

LABEL_19:
        goto LABEL_20;
      }
      uint64_t v17 = TRILogCategory_Server();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        uint64_t v15 = *MEMORY[0x1E4F93C08];
        goto LABEL_19;
      }
      LOWORD(v24) = 0;
      uint64_t v18 = "task capabilities mismatch in tasks table";
      uint64_t v19 = v17;
      uint32_t v20 = 2;
    }
    else
    {
      uint64_t v17 = TRILogCategory_Server();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v24 = 67109120;
      int v25 = v5;
      uint64_t v18 = "Failure deserializing task of type %d";
      uint64_t v19 = v17;
      uint32_t v20 = 8;
    }
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);
    goto LABEL_18;
  }
  int v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v24 = 67109120;
    int v25 = v5;
    _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)&v24, 8u);
  }

  uint64_t v15 = *MEMORY[0x1E4F93C08];
LABEL_20:

  return v15;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_103(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    if (v2)
    {
      id v3 = (void *)[*(id *)(a1 + 32) copy];
      id v4 = (void *)[v2 copyWithReplacementTags:v3];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 removeAllObjects];
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_2_107(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getInt64AsNSNumberForColumnName:"taskId" table:0];
  if (!v4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:423 description:@"read NULL taskId from NOT NULL column"];
  }
  uint64_t v5 = [v3 getNSStringForColumnName:"tag" table:0];
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:426 description:@"read NULL tag from NOT NULL column"];
  }
  if (([v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 40) addObject:v5];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v8;
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_3(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    if (v2)
    {
      id v3 = (void *)[*(id *)(a1 + 32) copy];
      id v4 = (void *)[v2 copyWithReplacementDependencies:v3];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 removeAllObjects];
}

uint64_t __27__TRITaskDatabase_allTasks__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getInt64AsNSNumberForColumnName:"taskId" table:0];
  if (!v4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:472 description:@"read NULL taskId from NOT NULL column"];
  }
  uint64_t v5 = [v3 getInt64AsNSNumberForColumnName:"dependentTaskId" table:0];
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:475 description:@"read NULL dependentTaskId from NOT NULL column"];
  }
  if (([v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 40) addObject:v5];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  uint64_t v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v8;
}

- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4
{
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __80__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability___block_invoke;
  id v14 = &unk_1E6BB7C78;
  id v15 = v6;
  unint64_t v16 = a3;
  id v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x1E016EA80](&v11);
  -[TRITaskDatabase _tasksForQuery:onPrep:](self, "_tasksForQuery:onPrep:", @" SELECT * FROM tasks WHERE rowid NOT IN (SELECT taskId FROM taskDependencies)       AND (startSecondsFromEpoch IS NULL OR startSecondsFromEpoch <= :date_for_runnability)       AND (capabilities & :capabilities_mask) = capabilities;",
    v8,
    v11,
    v12,
    v13,
  id v9 = v14);

  return v9;
}

void __80__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date_for_runnability");
  [v4 bindNamedParam:":capabilities_mask" toInt64:*(void *)(a1 + 40)];
}

- (id)dependencyFreeTasksForAllowedCapabilities:(unint64_t)a3 dateForRunnability:(id)a4 taskType:(int)a5
{
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability_taskType___block_invoke;
  v13[3] = &unk_1E6BBB0F0;
  id v14 = v8;
  unint64_t v15 = a3;
  int v16 = a5;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x1E016EA80](v13);
  -[TRITaskDatabase _tasksForQuery:onPrep:](self, "_tasksForQuery:onPrep:", @" SELECT * FROM tasks WHERE rowid NOT IN (SELECT taskId FROM taskDependencies)       AND (startSecondsFromEpoch IS NULL OR startSecondsFromEpoch <= :date_for_runnability)       AND (capabilities & :capabilities_mask) = capabilities       AND (taskType = :task_type);",
  uint64_t v11 = v10);

  return v11;
}

void __89__TRITaskDatabase_dependencyFreeTasksForAllowedCapabilities_dateForRunnability_taskType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timeIntervalSince1970];
  objc_msgSend(v4, "bindNamedParam:toDouble:", ":date_for_runnability");
  [v4 bindNamedParam:":capabilities_mask" toInt64:*(void *)(a1 + 40)];
  [v4 bindNamedParam:":task_type" toInt64:*(int *)(a1 + 48)];
}

- (id)_tasksForQuery:(id)a3 onPrep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  uint32_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__19;
  id v23 = __Block_byref_object_dispose__19;
  id v24 = (id)objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke;
  v13[3] = &unk_1E6BBB118;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  unint64_t v15 = self;
  id v16 = v10;
  uint64_t v17 = &v19;
  SEL v18 = a2;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v13];
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  uint64_t v5 = *(void *)(a1 + 48);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2;
  v34[3] = &unk_1E6BBB050;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v35 = *(void *)(a1 + 40);
  long long v36 = *(_OWORD *)(a1 + 56);
  id v7 = [*(id *)(v35 + 8) generalErrorHandlerWithOutError:0];
  LOBYTE(v6) = [v4 prepAndRunQuery:v6 onPrep:v5 onRow:v34 onError:v7];

  if (v6)
  {
    id v8 = objc_opt_new();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__19;
    void v32[4] = __Block_byref_object_dispose__19;
    id v33 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_131;
    v28[3] = &unk_1E6BBB078;
    uint64_t v9 = *(void *)(a1 + 56);
    int v30 = v32;
    uint64_t v31 = v9;
    id v10 = v8;
    id v29 = v10;
    id v11 = (void *)MEMORY[0x1E016EA80](v28);
    uint64_t v12 = [v3 db];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2_132;
    v23[3] = &unk_1E6BBB0A0;
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v26 = v32;
    uint64_t v27 = v13;
    void v23[4] = *(void *)(a1 + 40);
    id v14 = v11;
    id v25 = v14;
    id v15 = v10;
    id v24 = v15;
    id v16 = [*(id *)(*(void *)(a1 + 40) + 8) generalErrorHandlerWithOutError:0];
    int v17 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM     taskTags ORDER BY     taskId ASC,     rowid ASC;",
            0,
            v23,
            v16);

    if (v17)
    {
      v14[2](v14);
    }
    else
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = 0;

      LODWORD(a1) = *MEMORY[0x1E4F93BF0];
    }

    _Block_object_dispose(v32, 8);
    if (v17) {
      a1 = *MEMORY[0x1E4F93BE8];
    }
    else {
      a1 = a1;
    }
  }
  else
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = 0;

    a1 = *MEMORY[0x1E4F93BF0];
  }

  return a1;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 getInt64AsNSNumberForColumnName:"rowid" table:0];
  if (!v4)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:538 description:@"read NULL rowid from PRIMARY KEY column"];
  }
  uint64_t v5 = [v3 getInt64ForColumnName:"taskType" table:0];
  uint64_t v6 = [v3 getDoubleAsNSNumberForColumnName:"startSecondsFromEpoch" table:0];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v6 doubleValue];
    id v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v3 getNSDataForColumnName:"serializedTask" table:0];
  if (!v9)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:547 description:@"read NULL serializedTask from NOT NULL column"];
  }
  id v10 = (void *)[*(id *)(a1[4] + 16) taskClassForTaskType:v5];
  if (v10)
  {
    id v11 = [v10 parseFromData:v9];
    if (v11)
    {
      uint64_t v12 = [v3 getInt64ForColumnName:"capabilities" table:0];
      if (v12 == [v11 requiredCapabilities])
      {
        uint64_t v13 = [TRITaskRecord alloc];
        id v14 = [(TRITaskRecord *)v13 initWithTaskId:v4 task:v11 startDate:v8 dependencies:MEMORY[0x1E4F1CBF0] capabilities:v12 tags:MEMORY[0x1E4F1CBF0]];
        [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v14 forKeyedSubscript:v4];
        uint64_t v15 = *MEMORY[0x1E4F93C08];

LABEL_19:
        goto LABEL_20;
      }
      int v17 = TRILogCategory_Server();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        uint64_t v15 = *MEMORY[0x1E4F93C08];
        goto LABEL_19;
      }
      LOWORD(v24) = 0;
      uint64_t v18 = "task capabilities mismatch in tasks table";
      uint64_t v19 = v17;
      uint32_t v20 = 2;
    }
    else
    {
      int v17 = TRILogCategory_Server();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      int v24 = 67109120;
      int v25 = v5;
      uint64_t v18 = "Failure deserializing task of type %d";
      uint64_t v19 = v17;
      uint32_t v20 = 8;
    }
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v24, v20);
    goto LABEL_18;
  }
  id v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v24 = 67109120;
    int v25 = v5;
    _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)&v24, 8u);
  }

  uint64_t v15 = *MEMORY[0x1E4F93C08];
LABEL_20:

  return v15;
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_131(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "objectForKeyedSubscript:");
    if (v2)
    {
      id v3 = (void *)[*(id *)(a1 + 32) copy];
      id v4 = (void *)[v2 copyWithReplacementTags:v3];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 removeAllObjects];
}

uint64_t __41__TRITaskDatabase__tasksForQuery_onPrep___block_invoke_2_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getInt64AsNSNumberForColumnName:"taskId" table:0];
  if (!v4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:611 description:@"read NULL taskId from NOT NULL column"];
  }
  uint64_t v5 = [v3 getNSStringForColumnName:"tag" table:0];
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:614 description:@"read NULL tag from NOT NULL column"];
  }
  if (([v4 isEqual:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 40) addObject:v5];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v8;
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__TRITaskDatabase_count__block_invoke;
  v4[3] = &unk_1E6BBB140;
  v4[4] = &v5;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__TRITaskDatabase_count__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__TRITaskDatabase_count__block_invoke_2;
  v5[3] = &unk_1E6BBAFB0;
  v5[4] = *(void *)(a1 + 32);
  [v3 prepAndRunQuery:@"SELECT count(*) FROM tasks" onPrep:0 onRow:v5 onError:0];

  return *MEMORY[0x1E4F93BE8];
}

uint64_t __24__TRITaskDatabase_count__block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)updateTaskWithTaskId:(id)a3 startDate:(id)a4 task:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 656, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 657, @"Invalid parameter not satisfying: %@", @"task != nil" object file lineNumber description];

    goto LABEL_4;
  }
  int v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 655, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];

  if (!v10) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v11) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke;
  v20[3] = &unk_1E6BB7F20;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  id v14 = v11;
  id v23 = v14;
  int v24 = self;
  int v25 = &v26;
  [(TRITaskDatabase *)self writeTransactionWithFailableBlock:v20];
  char v15 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v15;
}

uint64_t __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke_2;
  v14[3] = &unk_1E6BB7EF8;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 56) + 8) generalErrorHandlerWithOutError:0];
  int v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE tasks SET     startSecondsFromEpoch = :start_seconds_from_epoch,     serializedTask = :serialized_task,     hash = :hash WHERE     rowid = :task_id;",
         v14,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    if (v8)
    {
      id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      char v10 = 1;
    }
    else
    {
      id v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "updateStartDateForTaskId: called with invalid id", v13, 2u);
      }

      char v10 = 0;
      id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
  }
  else
  {
    char v10 = 0;
    id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;

  return *v9;
}

void __55__TRITaskDatabase_updateTaskWithTaskId_startDate_task___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":task_id" toInt64AsNSNumber:v3];
  [*(id *)(a1 + 40) timeIntervalSince1970];
  objc_msgSend(v5, "bindNamedParam:toDouble:", ":start_seconds_from_epoch");
  id v4 = [*(id *)(a1 + 48) serialize];
  [v5 bindNamedParam:":serialized_task" toNSData:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 48), "hash"));
}

- (BOOL)updateTaskWithTaskId:(id)a3 capabilities:(unint64_t)a4 task:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v10 = v9;
  if (!v8)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 698, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 699, @"Invalid parameter not satisfying: %@", @"task != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke;
  v17[3] = &unk_1E6BB7CA0;
  id v11 = v8;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  uint32_t v20 = self;
  id v21 = &v22;
  [(TRITaskDatabase *)self writeTransactionWithFailableBlock:v17];
  char v13 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v13;
}

uint64_t __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 db];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke_2;
  v14[3] = &unk_1E6BB8628;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 48) + 8) generalErrorHandlerWithOutError:0];
  int v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" UPDATE tasks SET     capabilities = :capabilities_mask,     serializedTask = :serialized_task,     hash = :hash WHERE     rowid = :task_id;",
         v14,
         0,
         v5);

  if (v6)
  {
    id v7 = [v3 db];
    int v8 = sqlite3_changes((sqlite3 *)[v7 handle]);

    if (v8)
    {
      id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      char v10 = 1;
    }
    else
    {
      id v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v13 = 0;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "updateCapabilitiesForTaskId: called with invalid id", v13, 2u);
      }

      char v10 = 0;
      id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
  }
  else
  {
    char v10 = 0;
    id v9 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;

  return *v9;
}

void __58__TRITaskDatabase_updateTaskWithTaskId_capabilities_task___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 bindNamedParam:":task_id" toInt64AsNSNumber:v3];
  objc_msgSend(v5, "bindNamedParam:toInt64:", ":capabilities_mask", objc_msgSend(*(id *)(a1 + 40), "requiredCapabilities"));
  id v4 = [*(id *)(a1 + 40) serialize];
  [v5 bindNamedParam:":serialized_task" toNSData:v4];

  objc_msgSend(v5, "bindNamedParam:toInt64:", ":hash", objc_msgSend(*(id *)(a1 + 40), "hash"));
}

- (BOOL)enumerateTasksWithTagsIntersectingTagSet:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 741, @"Invalid parameter not satisfying: %@", @"tagSet" object file lineNumber description];
  }
  if (![v7 count])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 742, @"Invalid parameter not satisfying: %@", @"tagSet.count > 0" object file lineNumber description];
  }
  id v9 = [(TRITaskDatabase *)self allTasks];
  if (v9)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__TRITaskDatabase_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke;
    v13[3] = &unk_1E6BBB168;
    id v14 = v7;
    id v15 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
  }
  return v9 != 0;
}

void __66__TRITaskDatabase_enumerateTasksWithTagsIntersectingTagSet_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  int v6 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [v5 tags];
  char v10 = [v8 setWithArray:v9];
  LODWORD(v7) = [v7 intersectsSet:v10];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)taskIdsWithTag:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 764, @"Invalid parameter not satisfying: %@", @"tag" object file lineNumber description];
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__19;
  id v19 = __Block_byref_object_dispose__19;
  id v20 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__TRITaskDatabase_taskIdsWithTag___block_invoke;
  v10[3] = &unk_1E6BBB190;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  char v13 = &v15;
  SEL v14 = a2;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v10];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2;
  v11[3] = &unk_1E6BB7C50;
  id v12 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "generalErrorHandlerWithOutError:", 0, MEMORY[0x1E4F143A8], 3221225472, __34__TRITaskDatabase_taskIdsWithTag___block_invoke_3, &unk_1E6BBB050, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v11[0], 3221225472, __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2, &unk_1E6BB7C50);
  char v5 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT taskId FROM     taskTags WHERE     tag = :tag ORDER BY taskId ASC;",
         v11,
         &v10,
         v4);

  if (v5)
  {
    id v6 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    id v6 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v6;
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":tag" toNSString:*(void *)(a1 + 32)];
}

uint64_t __34__TRITaskDatabase_taskIdsWithTag___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = [a2 getInt64AsNSNumberForColumnName:"taskId" table:0];
  if (!v3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:780 description:@"read NULL taskId from NOT NULL column"];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (BOOL)_checkTaskId:(id)a3 IsPresent:(BOOL *)a4 transaction:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 801, @"Invalid parameter not satisfying: %@", @"isPresent" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
LABEL_7:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 802, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 800, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v10) {
    goto LABEL_7;
  }
LABEL_4:
  *a4 = 0;
  id v11 = [v10 db];
  void v20[4] = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke;
  v21[3] = &unk_1E6BB7C50;
  id v22 = v9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke_2;
  v20[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
  db = self->_db;
  id v13 = v9;
  SEL v14 = [(TRIDatabase *)db generalErrorHandlerWithOutError:0];
  char v15 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT 1 FROM     tasks WHERE     rowid = :task_id LIMIT 1;",
          v21,
          v20,
          v14);

  return v15;
}

uint64_t __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __54__TRITaskDatabase__checkTaskId_IsPresent_transaction___block_invoke_2(uint64_t a1)
{
  **(unsigned char **)(a1 + 32) = 1;
  return *MEMORY[0x1E4F93C10];
}

- (id)directDependenciesOfTaskWithId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 826, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];
  }
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  id v18 = __Block_byref_object_dispose__19;
  id v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke;
  v10[3] = &unk_1E6BBB190;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  id v12 = &v14;
  SEL v13 = a2;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v10];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v18 = 0;
  if (![*(id *)(a1 + 32) _checkTaskId:*(void *)(a1 + 40) IsPresent:&v18 transaction:v3])
  {
LABEL_11:
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    uint64_t v9 = *MEMORY[0x1E4F93BF0];
    goto LABEL_12;
  }
  if (!v18)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "directDependenciesOfTaskWithId invoked with missing taskId", buf, 2u);
    }

    goto LABEL_11;
  }
  id v4 = [v3 db];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_176;
  v15[3] = &unk_1E6BB7C50;
  id v16 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, MEMORY[0x1E4F143A8], 3221225472, __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_2, &unk_1E6BBB050, *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), v15[0], 3221225472, __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_176, &unk_1E6BB7C50);
  int v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT dependentTaskId FROM     taskDependencies WHERE     taskId = :task_id ORDER BY dependentTaskId ASC;",
         v15,
         &v14,
         v5);

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    LODWORD(v4) = *MEMORY[0x1E4F93BF0];
  }

  if (v6) {
    uint64_t v9 = *MEMORY[0x1E4F93BE8];
  }
  else {
    uint64_t v9 = v4;
  }
LABEL_12:

  return v9;
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_176(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __50__TRITaskDatabase_directDependenciesOfTaskWithId___block_invoke_2(void *a1, void *a2)
{
  id v3 = [a2 getInt64AsNSNumberForColumnName:"dependentTaskId" table:0];
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:863 description:@"read NULL dependentTaskId from NOT NULL column"];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)tasksDependentOnTask:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 882, @"Invalid parameter not satisfying: %@", @"taskId != nil" object file lineNumber description];
  }
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__19;
  char v18 = __Block_byref_object_dispose__19;
  id v19 = (id)objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__TRITaskDatabase_tasksDependentOnTask___block_invoke;
  v10[3] = &unk_1E6BBB190;
  void v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  id v12 = &v14;
  SEL v13 = a2;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v10];
  id v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v19 = 0;
  if (![*(id *)(a1 + 32) _checkTaskId:*(void *)(a1 + 40) IsPresent:&v19 transaction:v3])
  {
LABEL_8:
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    uint64_t v11 = *MEMORY[0x1E4F93BF0];
    goto LABEL_11;
  }
  if (!v19)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "tasksDependentOnTask invoked with missing taskId", buf, 2u);
    }

    goto LABEL_8;
  }
  id v4 = [v3 db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_180;
  v16[3] = &unk_1E6BB7C50;
  id v17 = *(id *)(a1 + 40);
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "generalErrorHandlerWithOutError:", 0, MEMORY[0x1E4F143A8], 3221225472, __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_2, &unk_1E6BBB050, *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), v16[0], 3221225472, __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_180, &unk_1E6BB7C50);
  char v6 = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT taskId FROM     taskDependencies WHERE     dependentTaskId = :task_id ORDER BY taskId ASC;",
         v16,
         &v15,
         v5);

  if (v6)
  {
    id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    SEL v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    id v7 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }
  uint64_t v11 = *v7;

LABEL_11:
  return v11;
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_180(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":task_id" toInt64AsNSNumber:*(void *)(a1 + 32)];
}

uint64_t __40__TRITaskDatabase_tasksDependentOnTask___block_invoke_2(void *a1, void *a2)
{
  id v3 = [a2 getInt64AsNSNumberForColumnName:"taskId" table:0];
  if (!v3)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"TRITaskDatabase.m" lineNumber:918 description:@"read NULL taskId from NOT NULL column"];
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

- (id)idForTask:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRITaskDatabase.m", 935, @"Invalid parameter not satisfying: %@", @"task" object file lineNumber description];
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__19;
  char v19 = __Block_byref_object_dispose__19;
  id v20 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__TRITaskDatabase_idForTask___block_invoke;
  v10[3] = &unk_1E6BBB190;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = self;
  SEL v13 = &v15;
  SEL v14 = a2;
  [(TRITaskDatabase *)self readTransactionWithFailableBlock:v10];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __29__TRITaskDatabase_idForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 db];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __29__TRITaskDatabase_idForTask___block_invoke_2;
  v17[3] = &unk_1E6BB7C50;
  id v18 = *(id *)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__TRITaskDatabase_idForTask___block_invoke_3;
  v13[3] = &unk_1E6BBB1D8;
  uint64_t v16 = *(void *)(a1 + 56);
  int8x16_t v12 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v12.i64[0];
  int8x16_t v14 = vextq_s8(v12, v12, 8uLL);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v6 = [*(id *)(v5 + 8) generalErrorHandlerWithOutError:0];
  char v7 = objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", @" SELECT * FROM     tasks WHERE     hash = :hash;",
         v17,
         v13,
         v6);

  if (v7)
  {
    id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    id v8 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
  }

  return *v8;
}

void __29__TRITaskDatabase_idForTask___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":hash", objc_msgSend(v2, "hash"));
}

uint64_t __29__TRITaskDatabase_idForTask___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 getInt64ForColumnName:"taskType" table:0];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) taskClassForTaskType:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = [v3 getNSDataForColumnName:"serializedTask" table:0];
    if (!v7)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:962 description:@"read NULL serializedTask from NOT NULL column"];
    }
    id v8 = [v6 parseFromData:v7];
    if (v8 && [*(id *)(a1 + 40) isEqual:v8])
    {
      uint64_t v9 = [v3 getInt64AsNSNumberForColumnName:"rowid" table:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"TRITaskDatabase.m" lineNumber:971 description:@"read NULL rowid from PRIMARY KEY column"];
      }
      int8x16_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
    }
    else
    {
      int8x16_t v12 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
    }
    uint64_t v13 = *v12;
  }
  else
  {
    int8x16_t v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 67109120;
      v18[1] = v4;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)v18, 8u);
    }

    uint64_t v13 = *MEMORY[0x1E4F93C08];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskSetProvider, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end