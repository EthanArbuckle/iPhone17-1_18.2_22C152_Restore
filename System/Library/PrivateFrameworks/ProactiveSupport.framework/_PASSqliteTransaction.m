@interface _PASSqliteTransaction
+ (_PASDBTransactionCompletion_)readTransactionWithHandle:(id)a3 failableBlock:(id)a4;
+ (_PASDBTransactionCompletion_)writeTransactionWithHandle:(id)a3 failableBlock:(id)a4;
+ (void)readTransactionWithHandle:(id)a3 block:(id)a4;
+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4;
@end

@implementation _PASSqliteTransaction

+ (_PASDBTransactionCompletion_)writeTransactionWithHandle:(id)a3 failableBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 88, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 89, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66___PASSqliteTransaction_writeTransactionWithHandle_failableBlock___block_invoke;
  v16[3] = &unk_1E5AEB1B0;
  id v17 = v7;
  id v18 = v9;
  id v10 = v7;
  id v11 = v9;
  v12.var0 = [v10 writeTransactionWithFailableBlock:v16];

  return v12;
}

+ (_PASDBTransactionCompletion_)readTransactionWithHandle:(id)a3 failableBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 77, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 78, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65___PASSqliteTransaction_readTransactionWithHandle_failableBlock___block_invoke;
  v16[3] = &unk_1E5AEB1B0;
  id v17 = v7;
  id v18 = v9;
  id v10 = v7;
  id v11 = v9;
  v12.var0 = [v10 readTransactionWithFailableBlock:v16];

  return v12;
}

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _PASDBTransactionCompletion_ v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 66, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 67, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58___PASSqliteTransaction_writeTransactionWithHandle_block___block_invoke;
  v14[3] = &unk_1E5AEB430;
  id v15 = v7;
  id v16 = v9;
  id v10 = v7;
  id v11 = v9;
  [v10 writeTransaction:v14];
}

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _PASDBTransactionCompletion_ v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 55, @"Invalid parameter not satisfying: %@", @"handle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_PASSqliteTransaction.m", 56, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57___PASSqliteTransaction_readTransactionWithHandle_block___block_invoke;
  v14[3] = &unk_1E5AEB430;
  id v15 = v7;
  id v16 = v9;
  id v10 = v7;
  id v11 = v9;
  [v10 readTransaction:v14];
}

@end