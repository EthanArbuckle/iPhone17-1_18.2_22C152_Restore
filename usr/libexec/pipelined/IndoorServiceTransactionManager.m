@interface IndoorServiceTransactionManager
- (BOOL)closeTransactionWithDescription:(id)a3;
- (BOOL)hasAnyOpenTransaction;
- (BOOL)hasOpenTransactionWithDescription:(id)a3;
- (BOOL)isLastOpenTransactionWithDescription:(id)a3;
- (IndoorServiceTransactionManager)init;
- (unint64_t)numOpenTransactions;
- (void)dealloc;
- (void)openTransactionWithDescription:(id)a3;
@end

@implementation IndoorServiceTransactionManager

- (BOOL)hasOpenTransactionWithDescription:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_activeTransactions objectForKey:a3];
  v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 count] != 0;

    return v5;
  }
  else
  {

    return 0;
  }
}

- (void)openTransactionWithDescription:(id)a3
{
  id v4 = a3;
  if (qword_10047BED8 == -1)
  {
    BOOL v5 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_10046AD98);
  BOOL v5 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: opening a transaction w/ name %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_4:
  v6 = [(NSMutableDictionary *)self->_activeTransactions objectForKey:v4];
  if (v6)
  {
    [v4 UTF8String];
    v7 = (void *)os_transaction_create();
    [v6 addObject:v7];
  }
  else
  {
    activeTransactions = self->_activeTransactions;
    id v9 = v4;
    [v9 UTF8String];
    v7 = (void *)os_transaction_create();
    v10 = +[NSMutableArray arrayWithObject:v7];
    [(NSMutableDictionary *)activeTransactions setObject:v10 forKey:v9];
  }
  if (qword_10047BED8 != -1)
  {
    dispatch_once(&qword_10047BED8, &stru_10046AD98);
    v11 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v11 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: opened a transaction w/ name %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:
}

- (BOOL)hasAnyOpenTransaction
{
  return [(IndoorServiceTransactionManager *)self numOpenTransactions] != 0;
}

- (unint64_t)numOpenTransactions
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_activeTransactions;
  unint64_t v4 = 0;
  id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = -[NSMutableDictionary objectForKey:](self->_activeTransactions, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v7), (void)v11);
        id v9 = [v8 count];

        v4 += (unint64_t)v9;
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v4;
}

- (IndoorServiceTransactionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IndoorServiceTransactionManager;
  v2 = [(IndoorServiceTransactionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeTransactions = v2->_activeTransactions;
    v2->_activeTransactions = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_activeTransactions removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)IndoorServiceTransactionManager;
  [(IndoorServiceTransactionManager *)&v3 dealloc];
}

- (BOOL)isLastOpenTransactionWithDescription:(id)a3
{
  id v4 = a3;
  if ((id)[(IndoorServiceTransactionManager *)self numOpenTransactions] == (id)1)
  {
    BOOL v5 = [(IndoorServiceTransactionManager *)self hasOpenTransactionWithDescription:v4];

    return v5;
  }
  else
  {

    return 0;
  }
}

- (BOOL)closeTransactionWithDescription:(id)a3
{
  id v4 = a3;
  if (qword_10047BED8 == -1)
  {
    BOOL v5 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_10046AD98);
  BOOL v5 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_DWORD *)buf = 138412290;
    *(void *)v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: request to end transaction w/ name %@", buf, 0xCu);
  }
LABEL_4:
  unsigned __int8 v6 = [(IndoorServiceTransactionManager *)self hasOpenTransactionWithDescription:v4];
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_activeTransactions objectForKey:v4];
    v8 = v7;
    if (v7)
    {
      if ([v7 count])
      {
        id v9 = [v8 lastObject];
        [v8 removeLastObject];

        if (![v8 count]) {
          [(NSMutableDictionary *)self->_activeTransactions removeObjectForKey:v4];
        }
        if (qword_10047BED8 == -1)
        {
          v10 = qword_10047BEE0;
          if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO))
          {
LABEL_12:

            goto LABEL_13;
          }
LABEL_11:
          *(_DWORD *)buf = 138412290;
          *(void *)v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "IndoorServiceTransactionManager: successfully closed a transaction w/ name %@", buf, 0xCu);
          goto LABEL_12;
        }
LABEL_31:
        dispatch_once(&qword_10047BED8, &stru_10046AD98);
        v10 = qword_10047BEE0;
        if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      v17 = sub_10037E220();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        id v18 = [v4 UTF8String];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v22 = 0;
        *(_WORD *)&v22[4] = 2082;
        *(void *)&v22[6] = "";
        __int16 v23 = 2081;
        id v24 = v18;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "[transactionsOfType count] > 0";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: expected to have at least one transaction\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v19 = sub_10037E220();
      if (os_signpost_enabled(v19))
      {
        id v20 = [v4 UTF8String];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v22 = 0;
        *(_WORD *)&v22[4] = 2082;
        *(void *)&v22[6] = "";
        __int16 v23 = 2081;
        id v24 = v20;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "[transactionsOfType count] > 0";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IndoorServiceTransactionManager: expected to have at least one transaction", "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: expected to have at least one transaction\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v16 = sub_10037E220();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        sub_1003A7A08((uint64_t)[v4 UTF8String], (uint64_t)buf);
      }
      unsigned __int8 v6 = 89;
    }
    else
    {
      long long v12 = sub_10037E220();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v13 = [v4 UTF8String];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v22 = 0;
        *(_WORD *)&v22[4] = 2082;
        *(void *)&v22[6] = "";
        __int16 v23 = 2081;
        id v24 = v13;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "transactionsOfType";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: list of transactions for this type should exist!\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      long long v14 = sub_10037E220();
      if (os_signpost_enabled(v14))
      {
        id v15 = [v4 UTF8String];
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)v22 = 0;
        *(_WORD *)&v22[4] = 2082;
        *(void *)&v22[6] = "";
        __int16 v23 = 2081;
        id v24 = v15;
        __int16 v25 = 2082;
        v26 = "assert";
        __int16 v27 = 2081;
        v28 = "transactionsOfType";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IndoorServiceTransactionManager: list of transactions for this type should exist!", "{\"msg%{public}.0s\":\"IndoorServiceTransactionManager: list of transactions for this type should exist!\", \"type\":%{private, location:escape_only}s, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      }

      v16 = sub_10037E220();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        sub_1003A7A78((uint64_t)[v4 UTF8String], (uint64_t)buf);
      }
      unsigned __int8 v6 = 88;
    }

    abort_report_np();
    __break(1u);
    goto LABEL_31;
  }
LABEL_13:

  return v6;
}

- (void).cxx_destruct
{
}

@end