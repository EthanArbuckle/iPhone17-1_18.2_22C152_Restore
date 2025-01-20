@interface MicroPaymentQueueResponse
- (BOOL)_ntsLoadFromPropertyList:(id)a3;
- (BOOL)loadFromPropertyList:(id)a3;
- (BOOL)shouldTriggerQueueCheck;
- (MicroPaymentQueueResponse)initWithRequestType:(int64_t)a3;
- (NSArray)payments;
- (NSArray)rangesToLoad;
- (NSData)appReceipt;
- (NSNumber)userIdentifier;
- (id)_copyAppReceiptFromDictionary:(id)a3;
- (id)_copyPaymentsFromDictionary:(id)a3;
- (id)_dsidFromDictionary:(id)a3;
- (int64_t)requestType;
- (int64_t)serverPaymentCount;
- (void)appendResponse:(id)a3;
- (void)dealloc;
- (void)setPayments:(id)a3;
- (void)setRangesToLoad:(id)a3;
- (void)setServerPaymentCount:(int64_t)a3;
- (void)setShouldTriggerQueueCheck:(BOOL)a3;
- (void)setUserIdentifier:(id)a3;
@end

@implementation MicroPaymentQueueResponse

- (MicroPaymentQueueResponse)initWithRequestType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MicroPaymentQueueResponse;
  result = [(MicroPaymentQueueResponse *)&v5 init];
  if (result) {
    result->_requestType = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MicroPaymentQueueResponse;
  [(MicroPaymentQueueResponse *)&v3 dealloc];
}

- (void)appendResponse:(id)a3
{
  if (a3)
  {
    [*((id *)a3 + 2) lock];
    [(NSLock *)self->_lock lock];
    if ([*((id *)a3 + 3) count])
    {
      payments = self->_payments;
      if (payments) {
        [(NSMutableArray *)payments addObjectsFromArray:*((void *)a3 + 3)];
      }
      else {
        self->_payments = (NSMutableArray *)[*((id *)a3 + 3) mutableCopy];
      }
    }
    if ([*((id *)a3 + 4) count])
    {
      rangesToLoad = self->_rangesToLoad;
      if (rangesToLoad) {
        [(NSMutableArray *)rangesToLoad addObjectsFromArray:*((void *)a3 + 4)];
      }
      else {
        self->_rangesToLoad = (NSMutableArray *)[*((id *)a3 + 4) mutableCopy];
      }
    }
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      NSUInteger v11 = [(NSData *)self->_appReceipt length];
      int v19 = 138412802;
      uint64_t v20 = v10;
      __int16 v21 = 2048;
      NSUInteger v22 = v11;
      __int16 v23 = 2048;
      id v24 = objc_msgSend(objc_msgSend(a3, "appReceipt"), "length");
      LODWORD(v18) = 32;
      v17 = &v19;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v19, v18);
        free(v13);
        v17 = (int *)v14;
        SSFileLog();
      }
    }
    if (objc_msgSend(objc_msgSend(a3, "appReceipt", v17), "length"))
    {
      appReceipt = self->_appReceipt;
      if (appReceipt != [a3 appReceipt])
      {

        self->_appReceipt = (NSData *)[a3 appReceipt];
      }
    }
    self->_serverPaymentCount += *((void *)a3 + 6);
    BOOL v16 = self->_shouldTriggerQueueCheck || *((unsigned char *)a3 + 56) != 0;
    self->_shouldTriggerQueueCheck = v16;
    [(NSLock *)self->_lock unlock];
    [*((id *)a3 + 2) unlock];
  }
}

- (BOOL)loadFromPropertyList:(id)a3
{
  LOBYTE(a3) = [(MicroPaymentQueueResponse *)self _ntsLoadFromPropertyList:a3];
  [(NSLock *)self->_lock unlock];
  return (char)a3;
}

- (NSData)appReceipt
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_appReceipt;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (NSArray)payments
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_payments;
  [(NSLock *)self->_lock unlock];
  return &v3->super;
}

- (NSArray)rangesToLoad
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_rangesToLoad;
  [(NSLock *)self->_lock unlock];
  return &v3->super;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (int64_t)serverPaymentCount
{
  [(NSLock *)self->_lock lock];
  int64_t serverPaymentCount = self->_serverPaymentCount;
  [(NSLock *)self->_lock unlock];
  return serverPaymentCount;
}

- (void)setServerPaymentCount:(int64_t)a3
{
  [(NSLock *)self->_lock lock];
  self->_int64_t serverPaymentCount = a3;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setPayments:(id)a3
{
  [(NSLock *)self->_lock lock];
  payments = self->_payments;
  if (payments != a3)
  {

    self->_payments = (NSMutableArray *)[a3 mutableCopy];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setRangesToLoad:(id)a3
{
  [(NSLock *)self->_lock lock];
  rangesToLoad = self->_rangesToLoad;
  if (rangesToLoad != a3)
  {

    self->_rangesToLoad = (NSMutableArray *)[a3 mutableCopy];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setShouldTriggerQueueCheck:(BOOL)a3
{
  [(NSLock *)self->_lock lock];
  self->_shouldTriggerQueueCheck = a3;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)setUserIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  userIdentifier = self->_userIdentifier;
  if (userIdentifier != a3)
  {

    self->_userIdentifier = (NSNumber *)[a3 copy];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (BOOL)shouldTriggerQueueCheck
{
  [(NSLock *)self->_lock lock];
  BOOL shouldTriggerQueueCheck = self->_shouldTriggerQueueCheck;
  [(NSLock *)self->_lock unlock];
  return shouldTriggerQueueCheck;
}

- (NSNumber)userIdentifier
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_userIdentifier;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)_copyAppReceiptFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"receipt-data"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v4 = v3;
  return v3;
}

- (id)_copyPaymentsFromDictionary:(id)a3
{
  objc_super v5 = -[MicroPaymentQueueResponse _dsidFromDictionary:](self, "_dsidFromDictionary:");
  if (!v5) {
    objc_super v5 = [(MicroPaymentQueueResponse *)self userIdentifier];
  }
  id v6 = [a3 objectForKey:@"app-list"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (+[MicroPayment responseIsValid:v12])
        {
          if (v5)
          {
            id v13 = [v12 mutableCopy];
            [v13 setObject:v5 forKey:@"dsid"];
            [v7 addObject:v13];
          }
          else
          {
            [v7 addObject:v12];
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  return v7;
}

- (id)_dsidFromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"dsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v4 = strtoull((const char *)[v3 UTF8String], 0, 10);
  if (!v4) {
    return 0;
  }

  return +[NSNumber numberWithUnsignedLongLong:v4];
}

- (BOOL)_ntsLoadFromPropertyList:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(MicroPaymentQueueResponse *)self _copyPaymentsFromDictionary:a3];
    id v6 = [(MicroPaymentQueueResponse *)self _copyAppReceiptFromDictionary:a3];
    id v7 = [a3 objectForKey:kISTriggerDownloadQueueKey];
    if (objc_opt_respondsToSelector()) {
      self->_BOOL shouldTriggerQueueCheck = [v7 BOOLValue];
    }
    [a3 objectForKey:@"more"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      self->_rangesToLoad = (NSMutableArray *)ISCopyLoadMoreRangesFromArray();
    }
  }
  else
  {
    id v6 = 0;
    objc_super v5 = 0;
  }

  self->_payments = v5;
  self->_appReceipt = v6;
  return self->_payments != 0;
}

@end