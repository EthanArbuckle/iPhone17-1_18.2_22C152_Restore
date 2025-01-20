@interface TCMessageContext
+ (BOOL)isFileStructuredStorage;
+ (id)currentObjectOrPlaceholder;
+ (id)getErrorArray;
+ (id)getWarningArray;
+ (unint64_t)getErrorCount;
+ (unint64_t)saveAffectedObjectStack;
+ (void)createContextForCurrentThread;
+ (void)initialize;
+ (void)popAffectedObject;
+ (void)popAffectedObjectPlaceholder:(id)a3;
+ (void)pushAffectedObject:(id)a3;
+ (void)pushAffectedObjectPlaceholder;
+ (void)removeContextForCurrentThread;
+ (void)reportError:(id)a3;
+ (void)reportErrorException:(id)a3;
+ (void)reportObject:(id)a3 withWarning:(id)a4;
+ (void)reportObjectOrPlaceholder:(id)a3 withWarning:(id)a4 parameters:(char *)a5;
+ (void)reportWarning:(id)a3;
+ (void)reportWarningException:(id)a3;
+ (void)reportWarningsToDelegate;
+ (void)restoreAffectedObjectStack:(unint64_t)a3;
+ (void)setIsFileStructuredStorage:(BOOL)a3;
- (TCMessageContext)init;
- (id)currentObjectOrPlaceholder;
- (unint64_t)saveAffectedObjectStack;
- (void)addErrorMessageEntry:(id)a3;
- (void)addWarningMessageEntry:(id)a3;
- (void)dealloc;
- (void)popAffectedObject;
- (void)popAffectedObjectPlaceholder:(id)a3;
- (void)pushAffectedObject:(id)a3;
- (void)pushAffectedObjectPlaceholder;
- (void)replacePlaceholdersWithObjects;
- (void)reportWarningForObject:(id)a3 warning:(id)a4 parameterList:(char *)a5;
- (void)resolveObjectOfCurrentAffectedObjectPlaceholder;
- (void)restoreAffectedObjectStack:(unint64_t)a3;
- (void)setAffectedObject:(id)a3 forPlaceholderWithKey:(id)a4;
@end

@implementation TCMessageContext

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (initAllMessages(void)::alreadyDone & 1) == 0)
  {
    initAllMessages(void)::alreadyDone = 1;
    objc_opt_class();
  }
}

- (TCMessageContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)TCMessageContext;
  v2 = [(TCMessageContext *)&v15 init];
  if (!v2) {
    goto LABEL_6;
  }
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  m_warnings = v2->m_warnings;
  v2->m_warnings = v3;

  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  m_errors = v2->m_errors;
  v2->m_errors = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  m_affectedObjectStack = v2->m_affectedObjectStack;
  v2->m_affectedObjectStack = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  m_placeholderToObjectMap = v2->m_placeholderToObjectMap;
  v2->m_placeholderToObjectMap = v9;

  m_importedFileIsSS = 1;
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.iWork.TCMessageContext", 0);
  mMessageSyncQueue = v2->mMessageSyncQueue;
  v2->mMessageSyncQueue = (OS_dispatch_queue *)v11;

  if (!v2->m_warnings) {
    goto LABEL_6;
  }
  if (v2->m_errors && v2->m_affectedObjectStack) {
    v13 = v2;
  }
  else {
LABEL_6:
  }
    v13 = 0;

  return v13;
}

- (void)dealloc
{
  mMessageSyncQueue = self->mMessageSyncQueue;
  if (mMessageSyncQueue)
  {
    self->mMessageSyncQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TCMessageContext;
  [(TCMessageContext *)&v4 dealloc];
}

+ (void)reportObjectOrPlaceholder:(id)a3 withWarning:(id)a4 parameters:(char *)a5
{
  id v11 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x263F08B88] currentThread];
    v9 = [v8 threadDictionary];
    v10 = [v9 objectForKey:@"TCMessageContext Instance"];

    if (v10) {
      [v10 reportWarningForObject:v11 warning:v7 parameterList:a5];
    }
  }
}

+ (id)currentObjectOrPlaceholder
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  objc_super v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  v5 = [v4 currentObjectOrPlaceholder];

  return v5;
}

+ (void)reportObject:(id)a3 withWarning:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    [a1 reportObjectOrPlaceholder:v6 withWarning:v7 parameters:&v8];
  }
}

+ (void)reportWarning:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 currentObjectOrPlaceholder];
    [a1 reportObjectOrPlaceholder:v5 withWarning:v4 parameters:&v6];
  }
}

+ (void)reportError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08B88] currentThread];
    v5 = [v4 threadDictionary];
    uint64_t v6 = [v5 objectForKey:@"TCMessageContext Instance"];

    if (v6)
    {
      id v7 = [TCMessageEntry alloc];
      uint64_t v8 = [v3 messageTag];
      v9 = [v3 messageText];
      v10 = [(TCMessageEntry *)v7 initWithTag:v8 affectedObject:0 text:v9 parameters:&v11];

      [v6 addErrorMessageEntry:v10];
    }
  }
}

+ (void)reportWarningException:(id)a3
{
  v9 = (NSException *)a3;
  id v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = [v4 threadDictionary];
  uint64_t v6 = [v5 objectForKey:@"TCMessageContext Instance"];

  if (v6)
  {
    id v7 = createEntryForException(v9);
    uint64_t v8 = [a1 currentObjectOrPlaceholder];
    [v7 addAffectedObject:v8];

    [v6 addWarningMessageEntry:v7];
  }
}

+ (void)reportErrorException:(id)a3
{
  id v7 = (NSException *)a3;
  id v3 = [MEMORY[0x263F08B88] currentThread];
  id v4 = [v3 threadDictionary];
  v5 = [v4 objectForKey:@"TCMessageContext Instance"];

  if (v5)
  {
    uint64_t v6 = createEntryForException(v7);
    [v5 addErrorMessageEntry:v6];
  }
}

+ (void)createContextForCurrentThread
{
  id v4 = objc_alloc_init(TCMessageContext);
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  [v3 setObject:v4 forKey:@"TCMessageContext Instance"];
}

+ (void)removeContextForCurrentThread
{
  id v3 = [MEMORY[0x263F08B88] currentThread];
  v2 = [v3 threadDictionary];
  [v2 removeObjectForKey:@"TCMessageContext Instance"];
}

+ (id)getWarningArray
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  if (v4)
  {
    v5 = [v4[1] allObjects];
    uint64_t v6 = [v5 sortedArrayUsingSelector:sel_timeStampCompare_];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)getErrorArray
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  if (v4)
  {
    v5 = [v4[2] allObjects];
    uint64_t v6 = [v5 sortedArrayUsingSelector:sel_timeStampCompare_];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (unint64_t)getErrorCount
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  if (v4) {
    unint64_t v5 = [v4[2] count];
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (void)setIsFileStructuredStorage:(BOOL)a3
{
  m_importedFileIsSS = a3;
}

+ (BOOL)isFileStructuredStorage
{
  return m_importedFileIsSS;
}

+ (void)pushAffectedObject:(id)a3
{
  id v6 = a3;
  id v3 = [MEMORY[0x263F08B88] currentThread];
  id v4 = [v3 threadDictionary];
  unint64_t v5 = [v4 objectForKey:@"TCMessageContext Instance"];

  [v5 pushAffectedObject:v6];
}

+ (void)popAffectedObject
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  [v4 popAffectedObject];
}

+ (void)pushAffectedObjectPlaceholder
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  [v4 pushAffectedObjectPlaceholder];
}

+ (void)popAffectedObjectPlaceholder:(id)a3
{
  id v6 = a3;
  id v3 = [MEMORY[0x263F08B88] currentThread];
  id v4 = [v3 threadDictionary];
  unint64_t v5 = [v4 objectForKey:@"TCMessageContext Instance"];

  [v5 popAffectedObjectPlaceholder:v6];
}

+ (unint64_t)saveAffectedObjectStack
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  unint64_t v5 = [v4 saveAffectedObjectStack];
  return v5;
}

+ (void)restoreAffectedObjectStack:(unint64_t)a3
{
  id v4 = [MEMORY[0x263F08B88] currentThread];
  unint64_t v5 = [v4 threadDictionary];
  id v6 = [v5 objectForKey:@"TCMessageContext Instance"];

  [v6 restoreAffectedObjectStack:a3];
}

+ (void)reportWarningsToDelegate
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  id v3 = [v2 threadDictionary];
  id v4 = [v3 objectForKey:@"TCMessageContext Instance"];

  [v4 reportWarningsToDelegate];
}

- (void)reportWarningForObject:(id)a3 warning:(id)a4 parameterList:(char *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v9)
  {
    mMessageSyncQueue = self->mMessageSyncQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__TCMessageContext_reportWarningForObject_warning_parameterList___block_invoke;
    v12[3] = &unk_264D62278;
    id v13 = v9;
    objc_super v15 = self;
    v16 = a5;
    id v14 = v8;
    dispatch_sync(mMessageSyncQueue, v12);
  }
}

void __65__TCMessageContext_reportWarningForObject_warning_parameterList___block_invoke(uint64_t a1)
{
  v2 = [TCMessageEntry alloc];
  uint64_t v3 = [*(id *)(a1 + 32) messageTag];
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = [*(id *)(a1 + 32) messageText];
  id v6 = [(TCMessageEntry *)v2 initWithTag:v3 affectedObject:v4 text:v5 parameters:*(void *)(a1 + 56)];

  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "tc_addMessageEntry:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMessageSyncQueue, 0);
  objc_storeStrong((id *)&self->m_placeholderToObjectMap, 0);
  objc_storeStrong((id *)&self->m_affectedObjectStack, 0);
  objc_storeStrong((id *)&self->m_errors, 0);
  objc_storeStrong((id *)&self->m_warnings, 0);
}

- (id)currentObjectOrPlaceholder
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  id v11 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__TCMessageContext_Private__currentObjectOrPlaceholder__block_invoke;
  v5[3] = &unk_264D622A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__TCMessageContext_Private__currentObjectOrPlaceholder__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  unint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v5 == v6)
  {
    *(void *)(v7 + 40) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    id v12 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v12 setInUse:1];
    uint64_t v9 = [v12 key];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v8 = v12;
  }
}

- (void)addErrorMessageEntry:(id)a3
{
  id v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__TCMessageContext_Private__addErrorMessageEntry___block_invoke;
  v7[3] = &unk_264D622C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mMessageSyncQueue, v7);
}

uint64_t __50__TCMessageContext_Private__addErrorMessageEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "tc_addMessageEntry:", *(void *)(a1 + 40));
}

- (void)addWarningMessageEntry:(id)a3
{
  id v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TCMessageContext_Private__addWarningMessageEntry___block_invoke;
  v7[3] = &unk_264D622C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mMessageSyncQueue, v7);
}

uint64_t __52__TCMessageContext_Private__addWarningMessageEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "tc_addMessageEntry:", *(void *)(a1 + 40));
}

- (void)pushAffectedObject:(id)a3
{
  id v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__TCMessageContext_Private__pushAffectedObject___block_invoke;
  v7[3] = &unk_264D622C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(mMessageSyncQueue, v7);
}

void __48__TCMessageContext_Private__pushAffectedObject___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    id v4 = v2;
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];

    id v2 = (id)v3;
  }
  id v5 = v2;
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:v2];
}

- (void)popAffectedObject
{
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__TCMessageContext_Private__popAffectedObject__block_invoke;
  block[3] = &unk_264D622F0;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

void __46__TCMessageContext_Private__popAffectedObject__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) lastObject];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = TSUDynamicCast(v2, (uint64_t)v4);
  [*(id *)(*(void *)(a1 + 32) + 24) removeLastObject];
}

- (void)pushAffectedObjectPlaceholder
{
  mMessageSyncQueue = self->mMessageSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TCMessageContext_Private__pushAffectedObjectPlaceholder__block_invoke;
  block[3] = &unk_264D622F0;
  block[4] = self;
  dispatch_sync(mMessageSyncQueue, block);
}

void __58__TCMessageContext_Private__pushAffectedObjectPlaceholder__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(TCMessagePlaceholderInfo);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addObject:");
}

- (void)resolveObjectOfCurrentAffectedObjectPlaceholder
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->m_affectedObjectStack lastObject];
  uint64_t v4 = objc_opt_class();
  id v5 = TSUDynamicCast(v4, (uint64_t)v3);
  id v6 = v5;
  if (v5)
  {
    if ([v5 isInUse])
    {
      m_placeholderToObjectMap = self->m_placeholderToObjectMap;
      id v8 = [v6 key];
      uint64_t v9 = [(NSMutableDictionary *)m_placeholderToObjectMap objectForKeyedSubscript:v8];

      if (!v9)
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = [(NSMutableArray *)self->m_affectedObjectStack reverseObjectEnumerator];
        id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v10);
              }
              id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if (v14 != v6)
              {
                objc_super v15 = [MEMORY[0x263EFF9D0] null];
                BOOL v16 = v14 == v15;

                if (!v16)
                {
                  id v11 = v14;
                  goto LABEL_15;
                }
              }
            }
            id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_15:

        uint64_t v17 = objc_opt_class();
        v18 = TSUDynamicCast(v17, (uint64_t)v11);
        v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 key];

          id v11 = (id)v20;
          [v19 setInUse:1];
        }

        v21 = [v6 key];
        [(TCMessageContext *)self setAffectedObject:v11 forPlaceholderWithKey:v21];
      }
    }
  }
}

- (void)popAffectedObjectPlaceholder:(id)a3
{
  id v4 = a3;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TCMessageContext_Private__popAffectedObjectPlaceholder___block_invoke;
  v7[3] = &unk_264D622C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mMessageSyncQueue, v7);
}

void __58__TCMessageContext_Private__popAffectedObjectPlaceholder___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 24) lastObject];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = TSUDynamicCast(v2, (uint64_t)v10);
  id v4 = v3;
  if (v3 && [v3 isInUse])
  {
    id v5 = *(void **)(a1 + 40);
    if (!v5
      || ([MEMORY[0x263EFF9D0] null],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5 == v6))
    {
      [*(id *)(a1 + 32) resolveObjectOfCurrentAffectedObjectPlaceholder];
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = [v4 key];
      [v7 setAffectedObject:v8 forPlaceholderWithKey:v9];
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeLastObject];
}

- (unint64_t)saveAffectedObjectStack
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  mMessageSyncQueue = self->mMessageSyncQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TCMessageContext_Private__saveAffectedObjectStack__block_invoke;
  v5[3] = &unk_264D622A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mMessageSyncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__TCMessageContext_Private__saveAffectedObjectStack__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)restoreAffectedObjectStack:(unint64_t)a3
{
  mMessageSyncQueue = self->mMessageSyncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__TCMessageContext_Private__restoreAffectedObjectStack___block_invoke;
  v4[3] = &unk_264D62318;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mMessageSyncQueue, v4);
}

unint64_t __56__TCMessageContext_Private__restoreAffectedObjectStack___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) count];
  for (unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
        result > *(void *)(a1 + 40);
        unint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) resolveObjectOfCurrentAffectedObjectPlaceholder];
    }
    [*(id *)(*(void *)(a1 + 32) + 24) removeLastObject];
  }
  return result;
}

- (void)setAffectedObject:(id)a3 forPlaceholderWithKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9D0] null];
  }
  [(NSMutableDictionary *)self->m_placeholderToObjectMap setObject:v8 forKey:v7];
}

- (void)replacePlaceholdersWithObjects
{
  if ([(NSMutableDictionary *)self->m_placeholderToObjectMap count])
  {
    id v14 = (id)[(NSMutableSet *)self->m_warnings copy];
    objc_super v15 = [v14 objectEnumerator];
    while (1)
    {
      unint64_t v3 = [v15 nextObject];
      id v4 = v3;
      if (!v3) {
        break;
      }
      id v5 = [v3 affectedObjects];
      uint64_t v6 = [v5 count];
      uint64_t v7 = v6;
      if (v6)
      {
        char v8 = 0;
        uint64_t v9 = v6;
        do
        {
          id v10 = [v5 objectAtIndex:--v9];
          if (v10 == @"kTCMessageContext_NullObjectThatMakesWarningUnremovable")
          {
            [v5 removeObjectAtIndex:v9];
            char v8 = 1;
          }
          else
          {
            for (i = [(NSMutableDictionary *)self->m_placeholderToObjectMap objectForKey:v10];
            {
              uint64_t v12 = [(NSMutableDictionary *)self->m_placeholderToObjectMap objectForKey:i];
              if (!v12) {
                break;
              }
            }
            if (i)
            {
              id v13 = [MEMORY[0x263EFF9D0] null];

              if (i == v13)
              {
                [v5 removeObjectAtIndex:v9];
              }
              else if (i == @"kTCMessageContext_NullObjectThatMakesWarningUnremovable")
              {
                [v5 removeObjectAtIndex:v9];
                char v8 = 1;
              }
              else
              {
                [v5 replaceObjectAtIndex:v9 withObject:i];
              }
              [(NSMutableDictionary *)self->m_placeholderToObjectMap setObject:i forKey:v10];
            }
          }
        }
        while (v9);
        if (v7)
        {
          if (!(([v5 count] != 0) | v8 & 1)) {
            [(NSMutableSet *)self->m_warnings removeObject:v4];
          }
        }
      }
    }
    [(NSMutableDictionary *)self->m_placeholderToObjectMap removeAllObjects];
  }
}

@end