@interface SUDialogManager
+ (id)newDialogWithError:(id)a3;
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (BOOL)_isDisplayingEquivalentDialog:(id)a3;
- (BOOL)presentDialog:(id)a3;
- (BOOL)presentDialog:(id)a3 withCompletionBlock:(id)a4;
- (BOOL)presentDialogForError:(id)a3;
- (BOOL)presentDialogForError:(id)a3 withCompletionBlock:(id)a4;
- (int64_t)numberOfPendingDialogs;
- (void)_finishDialog:(id)a3 withButtonIndex:(int64_t)a4;
- (void)_performDefaultActionForDialog:(id)a3 buttonIndex:(int64_t)a4;
- (void)dealloc;
@end

@implementation SUDialogManager

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUDialogManager;
  [(SUDialogManager *)&v3 dealloc];
}

+ (void)setSharedInstance:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedInstance != a3)
  {

    __SharedInstance = (uint64_t)a3;
  }

  _os_nospin_lock_unlock();
}

+ (id)sharedInstance
{
  _os_nospin_lock_lock();
  id v2 = (id)__SharedInstance;
  if (!__SharedInstance)
  {
    id v2 = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance = (uint64_t)v2;
  }
  id v3 = v2;
  _os_nospin_lock_unlock();
  return v3;
}

+ (id)newDialogWithError:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = (void *)[a3 userInfo];
  id result = (id)[v4 objectForKey:*MEMORY[0x263F89400]];
  if (!result)
  {
    id v6 = objc_alloc(MEMORY[0x263F89488]);
    return (id)[v6 initWithError:a3];
  }
  return result;
}

- (int64_t)numberOfPendingDialogs
{
  return [(NSMutableArray *)self->_dialogs count];
}

- (BOOL)presentDialog:(id)a3
{
  uint64_t v5 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SUDialogManager_presentDialog___block_invoke;
  v7[3] = &unk_264812A88;
  v7[4] = v5;
  v7[5] = a3;
  return [(SUDialogManager *)self presentDialog:a3 withCompletionBlock:v7];
}

uint64_t __33__SUDialogManager_presentDialog___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)[*(id *)(a1 + 32) object];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _performDefaultActionForDialog:v5 buttonIndex:a2];
}

- (BOOL)presentDialog:(id)a3 withCompletionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v7 = [a3 isDisplayable];
  if (v7)
  {
    if (!self->_dialogs) {
      self->_dialogs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    if (![(SUDialogManager *)self _isDisplayingEquivalentDialog:a3])
    {
      v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v10 &= 2u;
      }
      if (v10)
      {
        int v21 = 138543362;
        uint64_t v22 = objc_opt_class();
        LODWORD(v19) = 12;
        v18 = &v21;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          v12 = (void *)v11;
          uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v21, v19);
          free(v12);
          v18 = (int *)v13;
          SSFileLog();
        }
      }
      uint64_t v14 = objc_msgSend(MEMORY[0x263F7B420], "weakReferenceWithObject:", self, v18);
      [(NSMutableArray *)self->_dialogs addObject:a3];
      v15 = (void *)[a3 copyXPCEncoding];
      v16 = (void *)[objc_alloc(MEMORY[0x263F7B3E0]) initWithEncodedDialog:v15];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke;
      v20[3] = &unk_264812AD8;
      v20[5] = a3;
      v20[6] = a4;
      v20[4] = v14;
      [v16 startWithDialogResponseBlock:v20];

      xpc_release(v15);
      [a3 incrementDisplayCount];
    }
  }
  return v7;
}

void __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke_2;
  v2[3] = &unk_264812AB0;
  v2[4] = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectedButtonIndex];
  long long v3 = (void *)[*(id *)(a1 + 40) object];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
  }
  uint64_t v5 = *(void *)(a1 + 48);

  return [v3 _finishDialog:v5 withButtonIndex:v2];
}

- (BOOL)presentDialogForError:(id)a3
{
  uint64_t v5 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SUDialogManager_presentDialogForError___block_invoke;
  v7[3] = &unk_264812B00;
  v7[4] = v5;
  return [(SUDialogManager *)self presentDialogForError:a3 withCompletionBlock:v7];
}

uint64_t __41__SUDialogManager_presentDialogForError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a1 + 32) object];

  return [v5 _performDefaultActionForDialog:a2 buttonIndex:a3];
}

- (BOOL)presentDialogForError:(id)a3 withCompletionBlock:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = (void *)[(id)objc_opt_class() newDialogWithError:a3];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SUDialogManager_presentDialogForError_withCompletionBlock___block_invoke;
  v9[3] = &unk_264812B28;
  v9[4] = v6;
  v9[5] = a4;
  BOOL v7 = [(SUDialogManager *)self presentDialog:v6 withCompletionBlock:v9];

  return v7;
}

uint64_t __61__SUDialogManager_presentDialogForError_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2);
  }
  return result;
}

- (void)_finishDialog:(id)a3 withButtonIndex:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v18 = 138543618;
    uint64_t v19 = objc_opt_class();
    __int16 v20 = 2048;
    int64_t v21 = a4;
    LODWORD(v17) = 22;
    v16 = &v18;
    uint64_t v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v18, v17);
      free(v11);
      v16 = (int *)v12;
      SSFileLog();
    }
  }
  id v13 = a3;
  [(NSMutableArray *)self->_dialogs removeObject:a3];
  if (a4 < 0)
  {
    v15 = 0;
  }
  else
  {
    id v14 = objc_alloc(NSDictionary);
    v15 = objc_msgSend(v14, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInteger:", a4), @"SUDialogSelectedButtonIndexKey", 0);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v16), "postNotificationName:object:userInfo:", @"SUDialogDidFinishNotification", a3, v15);
}

- (BOOL)_isDisplayingEquivalentDialog:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  dialogs = self->_dialogs;
  uint64_t v5 = [(NSMutableArray *)dialogs countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(dialogs);
        }
        if ([a3 isEqual:*(void *)(*((void *)&v10 + 1) + 8 * v8)])
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableArray *)dialogs countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)_performDefaultActionForDialog:(id)a3 buttonIndex:(int64_t)a4
{
  uint64_t v6 = (void *)[a3 buttons];
  if ((a4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = v6;
    if ([v6 count] > (unint64_t)a4)
    {
      uint64_t v8 = [v7 objectAtIndex:a4];
      +[SUClientDispatch sendActionForDialog:a3 button:v8];
    }
  }
}

@end