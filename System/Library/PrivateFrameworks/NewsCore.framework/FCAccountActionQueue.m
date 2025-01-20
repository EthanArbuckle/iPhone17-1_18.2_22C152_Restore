@interface FCAccountActionQueue
- (BOOL)enqueueActionWithType:(int64_t)a3;
- (BOOL)popActionTypesUpToCount:(unint64_t)a3 setLocalDataHintIfNeeded:(BOOL)a4;
- (BOOL)readLocalDataHint;
- (FCAccountActionQueue)init;
- (FCAccountActionQueue)initWithFileURL:(id)a3;
- (FCPersistentDictionary)persistentDictionary;
- (id)peekAtActionTypes;
- (void)setPersistentDictionary:(id)a3;
@end

@implementation FCAccountActionQueue

- (BOOL)popActionTypesUpToCount:(unint64_t)a3 setLocalDataHintIfNeeded:(BOOL)a4
{
  v6 = [(FCAccountActionQueue *)self persistentDictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__FCAccountActionQueue_popActionTypesUpToCount_setLocalDataHintIfNeeded___block_invoke;
  v9[3] = &__block_descriptor_41_e29_v16__0__NSMutableDictionary_8l;
  v9[4] = a3;
  BOOL v10 = a4;
  char v7 = [v6 writeWithAccessor:v9];

  return v7;
}

- (FCPersistentDictionary)persistentDictionary
{
  return self->_persistentDictionary;
}

- (id)peekAtActionTypes
{
  v2 = [(FCAccountActionQueue *)self persistentDictionary];
  v3 = [v2 read];
  v4 = objc_msgSend(v3, "fc_actionTypes");

  return v4;
}

void __73__FCAccountActionQueue_popActionTypesUpToCount_setLocalDataHintIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_popActionTypesUpToCount:", v3);
  objc_msgSend(v4, "fc_setLocalDataHintIfNeeded:", *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
}

- (FCAccountActionQueue)initWithFileURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCAccountActionQueue;
  v5 = [(FCAccountActionQueue *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    BOOL v10 = [[FCPersistentDictionary alloc] initWithFileURL:v4 allowedClasses:v9];
    persistentDictionary = v5->_persistentDictionary;
    v5->_persistentDictionary = v10;
  }
  return v5;
}

- (FCAccountActionQueue)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCAccountActionQueue init]";
    __int16 v9 = 2080;
    BOOL v10 = "FCAccountActionQueue.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCAccountActionQueue init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)readLocalDataHint
{
  v2 = [(FCAccountActionQueue *)self persistentDictionary];
  uint64_t v3 = [v2 read];
  char v4 = objc_msgSend(v3, "fc_localDataHint");

  return v4;
}

- (BOOL)enqueueActionWithType:(int64_t)a3
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  char v4 = [(FCAccountActionQueue *)self persistentDictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__FCAccountActionQueue_enqueueActionWithType___block_invoke;
  v7[3] = &unk_1E5B4F440;
  v7[4] = &v8;
  v7[5] = a3;
  char v5 = [v4 writeWithAccessor:v7];

  if (!*((unsigned char *)v9 + 24)) {
    char v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__FCAccountActionQueue_enqueueActionWithType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "fc_enqueueActionType:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setPersistentDictionary:(id)a3
{
}

@end