@interface PKContactlessInterfaceSessionDefaultBehavior
+ (void)attachDefaultBehaviorToSession:(id)a3;
- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4;
- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4;
@end

@implementation PKContactlessInterfaceSessionDefaultBehavior

+ (void)attachDefaultBehaviorToSession:(id)a3
{
  id object = a3;
  v3 = objc_getAssociatedObject(object, &SessionBehaviorKey);

  if (!v3)
  {
    v4 = objc_alloc_init(PKContactlessInterfaceSessionDefaultBehavior);
    objc_setAssociatedObject(object, &SessionBehaviorKey, v4, (void *)0x301);
    [object setDelegate:v4];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = self;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSessionDefaultBehavior (%p): ignoring transaction end....", buf, 0xCu);
  }

  if (v7)
  {
    id v10 = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [(PKContactlessInterfaceSessionDefaultBehavior *)self _processContexts:v9 didFinishTransaction:1];
  }
  else
  {
    [(PKContactlessInterfaceSessionDefaultBehavior *)self _processContexts:0 didFinishTransaction:1];
  }
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContexts:(id)a4
{
}

- (void)_processContexts:(id)a3 didFinishTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 firstObject];
  v8 = [v7 paymentPass];

  if (!v8)
  {
LABEL_16:
    v23 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = self;
      _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "PKContactlessInterfaceSessionDefaultBehavior (%p): dropping transaction.", buf, 0xCu);
    }

    goto LABEL_19;
  }
  v24 = self;
  v9 = objc_alloc_init(PKPaymentService);
  int v10 = [v8 isStoredValuePass];
  v25 = v8;
  v11 = [v8 uniqueID];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v26 = v6;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v12)
  {
    char v14 = 0;
    goto LABEL_15;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v30;
  int v27 = v10 | v4;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      v18 = [v17 paymentApplication];
      if (v10)
      {
        v19 = [v17 transitHistory];
        v20 = [v17 date];
        v21 = [v17 expressState];
        [(PKPaymentService *)v9 processTransitTransactionEventWithHistory:v19 transactionDate:v20 forPaymentApplication:v18 withPassUniqueIdentifier:v11 expressTransactionState:v21];

        char v14 = 1;
      }
      else if (!v27)
      {
        goto LABEL_11;
      }
      v22 = [v18 applicationIdentifier];
      [(PKPaymentService *)v9 recordPaymentApplicationUsageForPassUniqueIdentifier:v11 paymentApplicationIdentifier:v22];

LABEL_11:
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v13);
LABEL_15:

  v8 = v25;
  id v6 = v26;
  self = v24;
  if ((v14 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_19:
}

@end