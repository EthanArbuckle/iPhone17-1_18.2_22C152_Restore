@interface ISDialogOperation
+ (id)operationWithDialog:(id)a3;
+ (id)operationWithError:(id)a3;
- (BOOL)performDefaultActions;
- (ISDialog)dialog;
- (ISDialogButton)selectedButton;
- (ISDialogOperation)init;
- (NSArray)textFieldValues;
- (id)userNotification;
- (void)_handleResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4;
- (void)_run;
- (void)_showUserNotification:(id)a3;
- (void)_waitForUserNotificationResponse:(__CFUserNotification *)a3;
- (void)cancel;
- (void)dealloc;
- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4;
- (void)run;
- (void)setDialog:(id)a3;
- (void)setPerformDefaultActions:(BOOL)a3;
- (void)setSelectedButton:(id)a3;
- (void)setUserNotification:(id)a3;
@end

@implementation ISDialogOperation

- (ISDialogOperation)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  result = [(ISOperation *)&v4 init];
  if (result) {
    result->_performDefaultActions = 1;
  }
  return result;
}

- (void)dealloc
{
  [(ISDialogOperation *)self setDialog:0];
  [(ISDialogOperation *)self setSelectedButton:0];
  v3 = [(ISDialogOperation *)self userNotification];
  if (v3) {
    CFUserNotificationCancel(v3);
  }
  [(ISDialogOperation *)self setUserNotification:0];

  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  [(ISDialogOperation *)&v4 dealloc];
}

+ (id)operationWithDialog:(id)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setDialog:a3];

  return v4;
}

+ (id)operationWithError:(id)a3
{
  id v4 = [[ISDialog alloc] initWithError:a3];
  v5 = (void *)[a1 operationWithDialog:v4];

  return v5;
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  v7 = [(ISOperation *)self delegate];
  v8 = [[(ISDialogOperation *)self dialog] buttons];
  if ([(NSArray *)v8 count] <= a3) {
    id v9 = 0;
  }
  else {
    id v9 = [(NSArray *)v8 objectAtIndex:a3];
  }
  if (objc_opt_respondsToSelector())
  {
    [(ISOperationDelegate *)v7 operation:self selectedButton:v9];
  }
  else if ([(ISDialogOperation *)self performDefaultActions])
  {
    objc_msgSend(v9, "performDefaultActionForDialog:", -[ISDialogOperation dialog](self, "dialog"));
  }
  [(ISDialogOperation *)self setSelectedButton:v9];
  [(ISOperation *)self lock];
  v10 = (void *)[a4 objectForKey:*MEMORY[0x263F00030]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v10, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = (NSArray *)[v10 copy];
    }
    else {
      v11 = 0;
    }
  }
  self->_textFieldValues = v11;
  [(ISOperation *)self unlock];

  [(ISOperation *)self setSuccess:1];
}

- (NSArray)textFieldValues
{
  [(ISOperation *)self lock];
  v3 = self->_textFieldValues;
  [(ISOperation *)self unlock];
  return v3;
}

- (void)cancel
{
  v3 = [(ISDialogOperation *)self userNotification];
  if (v3) {
    CFUserNotificationCancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  [(ISOperation *)&v4 cancel];
}

- (void)run
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(ISOperation *)self copySerializationLocks];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 makeObjectsPerformSelector:sel_lock];
    v5 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5) {
      v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v22 = 138412546;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2112;
      v25 = [(ISOperation *)self serializationLockIdentifiers];
      LODWORD(v21) = 22;
      v20 = &v22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        id v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v22, v21);
        free(v9);
        v20 = (int *)v10;
        SSFileLog();
      }
    }
    [(ISOperation *)self sendDidTakeSerializationLocks];
  }
  [(ISDialogOperation *)self _run];
  if (v4)
  {
    v11 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v11) {
      v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v12 = [v11 shouldLog];
    int v13 = [v11 shouldLogToDisk];
    v14 = [v11 OSLogObject];
    if (v13) {
      v12 |= 2u;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v15 = objc_opt_class();
      v16 = [(ISOperation *)self serializationLockIdentifiers];
      int v22 = 138412546;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      LODWORD(v21) = 22;
      v20 = &v22;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v22, v21);
        free(v18);
        v20 = (int *)v19;
        SSFileLog();
      }
    }
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_unlock, v20);
  }
}

- (void)_handleResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSUInteger v7 = [(NSArray *)[[(ISDialogOperation *)self dialog] buttons] count];
  if (v7 == 3)
  {
    uint64_t v8 = +[ISDialog buttonTitleKeyForCFUserNotificationButtonTag:a4 & 3];
    if (v8)
    {
      uint64_t v9 = objc_msgSend(-[ISDialog orderedButtonTitleKeysForCFUserNotification](-[ISDialogOperation dialog](self, "dialog"), "orderedButtonTitleKeysForCFUserNotification"), "indexOfObject:", v8);
      goto LABEL_14;
    }
  }
  else if (a4 != 3)
  {
    NSUInteger v10 = v7;
    if (a4 == 2)
    {
      if ([MEMORY[0x263F7B148] deviceIsAppleTV]
        || ![(ISDialog *)self->_dialog noDefaultButton])
      {
        uint64_t v9 = v10 - 2;
      }
      else
      {
        uint64_t v9 = v10 - 1;
      }
    }
    else if (a4)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = v7 - 1;
    }
    goto LABEL_14;
  }
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
  CFDictionaryRef ResponseDictionary = CFUserNotificationGetResponseDictionary(a3);

  [(ISDialogOperation *)self handleButtonSelected:v9 withResponseDictionary:ResponseDictionary];
}

- (void)_run
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = [(ISDialogOperation *)self dialog];
  if (v3 && (objc_super v4 = v3, [(ISDialog *)v3 isDisplayable]))
  {
    Class v5 = NSClassFromString(&cfstr_Dialogmanager.isa);
    id v6 = [(ISDialog *)v4 copyUserNotification];
    if (v6)
    {
      if (!v5
        || ([(objc_class *)v5 checkInDialog:v4] & 1) != 0
        || [(ISDialog *)v4 allowDuplicates])
      {
        NSUInteger v7 = +[ISDevice sharedInstance];
        id v8 = [(ISOperation *)self copyActivePowerAssertionIdentifiers];
        uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v9) {
          uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v10 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          int v11 = v10 | 2;
        }
        else {
          int v11 = v10;
        }
        if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEBUG)) {
          v11 &= 2u;
        }
        if (v11)
        {
          int v46 = 138412546;
          uint64_t v47 = objc_opt_class();
          __int16 v48 = 2048;
          uint64_t v49 = [v8 count];
          LODWORD(v35) = 22;
          v34 = &v46;
          uint64_t v12 = _os_log_send_and_compose_impl();
          if (v12)
          {
            int v13 = (void *)v12;
            uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v46, v35);
            free(v13);
            v34 = (int *)v14;
            SSFileLog();
          }
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, v34);
        if (v15)
        {
          uint64_t v16 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v41 != v16) {
                objc_enumerationMutation(v8);
              }
              [(ISDevice *)v7 releasePowerAssertion:*(void *)(*((void *)&v40 + 1) + 8 * i)];
            }
            uint64_t v15 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
          }
          while (v15);
        }
        v18 = (void *)[NSClassFromString(&cfstr_Daemon.isa) daemon];
        [v18 beginShowingDialog];
        [(ISDialogOperation *)self _showUserNotification:v6];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v19 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(v8);
              }
              [(ISDevice *)v7 takePowerAssertion:*(void *)(*((void *)&v36 + 1) + 8 * j)];
            }
            uint64_t v19 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v19);
        }
        [(objc_class *)v5 checkOutDialog:v4];
        [v18 endShowingDialog];
      }
      else
      {
        v28 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v28) {
          v28 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v29 = [v28 shouldLog];
        if ([v28 shouldLogToDisk]) {
          int v30 = v29 | 2;
        }
        else {
          int v30 = v29;
        }
        if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_INFO)) {
          v30 &= 2u;
        }
        if (v30)
        {
          int v46 = 138412290;
          uint64_t v47 = objc_opt_class();
          LODWORD(v35) = 12;
          v34 = &v46;
          uint64_t v31 = _os_log_send_and_compose_impl();
          if (v31)
          {
            v32 = (void *)v31;
            uint64_t v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v46, v35);
            free(v32);
            v34 = (int *)v33;
            SSFileLog();
          }
        }
        -[ISOperation setSuccess:](self, "setSuccess:", 1, v34);
      }
    }
    else
    {
      [(ISOperation *)self setError:ISError(2, 0, 0)];
    }
  }
  else
  {
    int v22 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v22) {
      int v22 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    if (!os_log_type_enabled((os_log_t)[v22 OSLogObject], OS_LOG_TYPE_INFO)) {
      v24 &= 2u;
    }
    if (v24)
    {
      int v46 = 138412290;
      uint64_t v47 = objc_opt_class();
      LODWORD(v35) = 12;
      v34 = &v46;
      uint64_t v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
        uint64_t v26 = (void *)v25;
        uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v46, v35);
        free(v26);
        v34 = (int *)v27;
        SSFileLog();
      }
    }
    -[ISOperation setSuccess:](self, "setSuccess:", 1, v34);
  }
}

- (void)_showUserNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 copyUserNotification];
  if (v5)
  {
    id v6 = (const void *)v5;
    [(ISDialogOperation *)self setUserNotification:v5];
    [(ISDialogOperation *)self _waitForUserNotificationResponse:v6];
    [(ISDialogOperation *)self setUserNotification:0];
    CFRelease(v6);
  }
  else
  {
    uint64_t v7 = [a3 currentRetryCount];
    uint64_t v8 = [a3 allowedRetryCount];
    uint64_t v9 = [MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    int v10 = (void *)v9;
    if (v7 >= v8)
    {
      if (!v9) {
        int v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v16 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v17 = v16 | 2;
      }
      else {
        int v17 = v16;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v17 &= 2u;
      }
      if (v17)
      {
        int v22 = 138412290;
        uint64_t v23 = objc_opt_class();
        LODWORD(v21) = 12;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v22, v21);
          free(v19);
          SSFileLog();
        }
      }
      [(ISOperation *)self setError:ISError(2, 0, 0)];
    }
    else
    {
      if (!v9) {
        int v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v11 = [v10 shouldLog];
      if ([v10 shouldLogToDisk]) {
        int v12 = v11 | 2;
      }
      else {
        int v12 = v11;
      }
      if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v12 &= 2u;
      }
      if (v12)
      {
        int v22 = 138412290;
        uint64_t v23 = objc_opt_class();
        LODWORD(v21) = 12;
        uint64_t v20 = &v22;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
          free(v14);
          uint64_t v20 = (int *)v15;
          SSFileLog();
        }
      }
      objc_msgSend(a3, "setCurrentRetryCount:", objc_msgSend(a3, "currentRetryCount", v20) + 1);
      [MEMORY[0x263F08B88] sleepForTimeInterval:3.0];
      [(ISDialogOperation *)self _showUserNotification:a3];
    }
  }
}

- (void)_waitForUserNotificationResponse:(__CFUserNotification *)a3
{
  CFOptionFlags responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
    [(ISDialogOperation *)self _handleResponseForNotification:a3 responseFlags:responseFlags];
    [[(ISDialogOperation *)self dialog] incrementDisplayCount];
    [(ISOperation *)self setSuccess:1];
  }
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDialog:(id)a3
{
}

- (BOOL)performDefaultActions
{
  return self->_performDefaultActions;
}

- (void)setPerformDefaultActions:(BOOL)a3
{
  self->_performDefaultActions = a3;
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSelectedButton:(id)a3
{
}

- (id)userNotification
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setUserNotification:(id)a3
{
}

@end