@interface EPRoutingSlip
+ (BOOL)supportsSecureCoding;
- (BOOL)decrementCurrentTransactionIndex;
- (BOOL)didFail;
- (BOOL)incrementCurrentTransactionIndex;
- (BOOL)notUnrollable;
- (BOOL)persistWhilePending;
- (BOOL)queuedCancel;
- (BOOL)resumeEnabled;
- (BOOL)submitted;
- (BOOL)updateCurrentTransactionIndex;
- (EPRoutingSlip)initWithCoder:(id)a3;
- (EPRoutingSlip)initWithIdentifier:(id)a3 routingSlipEntries:(id)a4;
- (EPRoutingSlip)initWithRoutingSlipEntries:(id)a3;
- (EPRoutingSlipDelegate)routingSlipDelegate;
- (EPRoutingSlipEntry)currentEntry;
- (EPServiceRegistry)serviceRegistry;
- (EPTransaction)transaction;
- (NROSTransaction)osTransaction;
- (NSArray)entries;
- (NSDictionary)entryMap;
- (NSMutableDictionary)transactionReferences;
- (NSString)identifier;
- (NSString)requestType;
- (double)startTime;
- (id)getLastFirstError;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)transactionIndex;
- (mach_timebase_info)timebaseInfo;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)state;
- (void)cancelWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)persist;
- (void)printDescription;
- (void)resume;
- (void)resumeWithServiceRegistry:(id)a3 rollback:(BOOL)a4;
- (void)setDidFail:(BOOL)a3;
- (void)setNotUnrollable:(BOOL)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPersistWhilePending:(BOOL)a3;
- (void)setQueuedCancel:(BOOL)a3;
- (void)setRequestType:(id)a3;
- (void)setResumeEnabled:(BOOL)a3;
- (void)setRoutingSlipDelegate:(id)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubmitted:(BOOL)a3;
- (void)setTimebaseInfo:(mach_timebase_info)a3;
- (void)setTransactionIndex:(int64_t)a3;
- (void)setTransactionReferences:(id)a3;
- (void)transactionDidComplete:(id)a3;
@end

@implementation EPRoutingSlip

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(EPRoutingSlip *)self entries];
  id v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return (unint64_t)v9;
}

- (EPRoutingSlip)initWithRoutingSlipEntries:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];
  v7 = [(EPRoutingSlip *)self initWithIdentifier:v6 routingSlipEntries:v4];

  return v7;
}

- (EPRoutingSlip)initWithIdentifier:(id)a3 routingSlipEntries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(EPRoutingSlip *)self init];
  v10 = v9;
  if (v9)
  {
    id v29 = v7;
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = +[NSMutableDictionary dictionary];
    transactionReferences = v10->_transactionReferences;
    v10->_transactionReferences = (NSMutableDictionary *)v11;

    v13 = +[NSMutableArray array];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v28 = v8;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v21 = [v20 transactionClasses:v28];
          unsigned int v22 = [v21 containsObject:[v20 transactionClass]];

          if (v22)
          {
            [v20 setRoutingSlip:v10];
            [v13 addObject:v20];
            v23 = [v20 name];
            [(NSDictionary *)v14 setObject:v20 forKeyedSubscript:v23];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    v24 = (NSArray *)[v13 copy];
    entries = v10->_entries;
    v10->_entries = v24;

    entryMap = v10->_entryMap;
    v10->_entryMap = v14;

    id v8 = v28;
    id v7 = v29;
  }

  return v10;
}

- (void)resumeWithServiceRegistry:(id)a3 rollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(EPRoutingSlip *)self notUnrollable] || [(EPRoutingSlip *)self resumeEnabled]) {
    BOOL v4 = 0;
  }
  if ([(EPRoutingSlip *)self queuedCancel]) {
    [(EPRoutingSlip *)self setState:3];
  }
  [(EPRoutingSlip *)self setQueuedCancel:0];
  [(EPRoutingSlip *)self setServiceRegistry:v6];

  [(EPRoutingSlip *)self setDidFail:v4 | [(EPRoutingSlip *)self didFail]];
  if (v4 && (id)[(EPRoutingSlip *)self state] == (id)2)
  {
    [(EPRoutingSlip *)self setState:0];
    id v7 = [(EPRoutingSlip *)self entries];
    -[EPRoutingSlip setTransactionIndex:](self, "setTransactionIndex:", (char *)[v7 count] - 1);
  }
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v12 = 138543618;
      v13 = identifier;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: resumeWithServiceRegistry rollback:%{BOOL}d", (uint8_t *)&v12, 0x12u);
    }
  }
  [(EPRoutingSlip *)self resume];
}

- (EPRoutingSlipEntry)currentEntry
{
  if ([(EPRoutingSlip *)self transactionIndex] < 0
    || (unint64_t v3 = [(EPRoutingSlip *)self transactionIndex],
        [(EPRoutingSlip *)self entries],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v3 >= (unint64_t)v5))
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(EPRoutingSlip *)self entries];
    id v7 = [v6 objectAtIndexedSubscript:-[EPRoutingSlip transactionIndex](self, "transactionIndex")];
  }

  return (EPRoutingSlipEntry *)v7;
}

- (EPTransaction)transaction
{
  transaction = self->_transaction;
  if (!transaction)
  {
    BOOL v4 = +[NSNumber numberWithInteger:self->_transactionIndex];
    id v5 = [(NSMutableDictionary *)self->_transactionReferences objectForKeyedSubscript:v4];
    id v6 = self->_transaction;
    self->_transaction = v5;

    if (!self->_transaction)
    {
      id v7 = [(EPRoutingSlip *)self currentEntry];
      id v8 = (EPTransaction *)[v7 newTransaction];
      BOOL v9 = self->_transaction;
      self->_transaction = v8;

      [(EPTransaction *)self->_transaction setDelegate:self];
      [(NSMutableDictionary *)self->_transactionReferences setObject:self->_transaction forKeyedSubscript:v4];
    }

    transaction = self->_transaction;
  }

  return transaction;
}

- (void)setTransactionIndex:(int64_t)a3
{
  if (self->_transactionIndex != a3) {
    self->_transactionIndex = a3;
  }
}

- (BOOL)incrementCurrentTransactionIndex
{
  if ([(EPRoutingSlip *)self transactionIndex] < -1) {
    return 0;
  }
  unint64_t v3 = [(EPRoutingSlip *)self transactionIndex];
  BOOL v4 = [(EPRoutingSlip *)self entries];
  id v5 = (char *)[v4 count] - 1;

  if (v3 >= (unint64_t)v5) {
    return 0;
  }
  [(EPRoutingSlip *)self setTransactionIndex:(char *)[(EPRoutingSlip *)self transactionIndex] + 1];
  return 1;
}

- (BOOL)decrementCurrentTransactionIndex
{
  if ([(EPRoutingSlip *)self transactionIndex] < 1) {
    return 0;
  }
  unint64_t v3 = [(EPRoutingSlip *)self transactionIndex];
  BOOL v4 = [(EPRoutingSlip *)self entries];
  id v5 = [v4 count];

  if (v3 > (unint64_t)v5) {
    return 0;
  }
  [(EPRoutingSlip *)self setTransactionIndex:(char *)[(EPRoutingSlip *)self transactionIndex] - 1];
  return 1;
}

- (BOOL)updateCurrentTransactionIndex
{
  if ([(EPRoutingSlip *)self didFail] && ![(EPRoutingSlip *)self notUnrollable])
  {
    BOOL v3 = [(EPRoutingSlip *)self decrementCurrentTransactionIndex];
    if (!v3) {
      return v3;
    }
LABEL_6:
    [(EPRoutingSlip *)self persist];
    LOBYTE(v3) = 1;
    return v3;
  }
  if ([(EPRoutingSlip *)self incrementCurrentTransactionIndex]) {
    goto LABEL_6;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (void)persist
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipDelegate);
  [WeakRetained routingSlipRequestsArchiving:self];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3) {
    self->_state = a3;
  }
}

- (void)resume
{
  BOOL v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      transaction = self->_transaction;
      *(_DWORD *)v45 = 138412290;
      *(void *)&v45[4] = transaction;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resume called for _transaction %@", v45, 0xCu);
    }
  }
  switch([(EPRoutingSlip *)self state])
  {
    case 0uLL:
      id v7 = sub_1000A3CF0();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        BOOL v9 = sub_1000A3CF0();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          identifier = self->_identifier;
          *(_DWORD *)v45 = 138543362;
          *(void *)&v45[4] = identifier;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: Not started", v45, 0xCu);
        }
      }
      uint64_t v11 = +[NROSTransaction transactionWithName:@"saga"];
      osTransaction = self->_osTransaction;
      self->_osTransaction = v11;

      [(EPRoutingSlip *)self setState:1];
      v13 = [(EPRoutingSlip *)self currentEntry];
      __int16 v14 = [(EPRoutingSlip *)self transaction];
      if (![(EPRoutingSlip *)self didFail] || [(EPRoutingSlip *)self notUnrollable])
      {
        BOOL v15 = sub_1000A3CF0();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (!v16) {
          goto LABEL_22;
        }
        id v17 = sub_1000A3CF0();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      char v31 = objc_opt_respondsToSelector();
      long long v32 = sub_1000A3CF0();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        if (!v33) {
          goto LABEL_46;
        }
        v34 = sub_1000A3CF0();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }
      if (!v33) {
        goto LABEL_51;
      }
      v35 = sub_1000A3CF0();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_50;
      }
      goto LABEL_49;
    case 1uLL:
      uint64_t v18 = [(EPTransaction *)self->_transaction delegate];

      if (v18) {
        goto LABEL_33;
      }
      v13 = [(EPRoutingSlip *)self currentEntry];
      __int16 v14 = [(EPRoutingSlip *)self transaction];
      if ([(EPRoutingSlip *)self didFail] && ![(EPRoutingSlip *)self notUnrollable])
      {
        char v36 = objc_opt_respondsToSelector();
        v37 = sub_1000A3CF0();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);

        if (v36)
        {
          if (v38)
          {
            v34 = sub_1000A3CF0();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
LABEL_44:
              v39 = self->_identifier;
              int64_t transactionIndex = self->_transactionIndex;
              v41 = [v13 shortDescription];
              *(_DWORD *)v45 = 138543874;
              *(void *)&v45[4] = v39;
              *(_WORD *)&v45[12] = 2048;
              *(void *)&v45[14] = transactionIndex;
              *(_WORD *)&v45[22] = 2114;
              v46 = v41;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: Rolling back saga entry %ld:%{public}@", v45, 0x20u);
            }
LABEL_45:
          }
LABEL_46:
          [v14 beginRollbackWithRoutingSlipEntry:v13 serviceRegistry:self->_serviceRegistry *(void *)v45 *(_OWORD *)&v45[8] v46];
        }
        else
        {
          if (v38)
          {
            v35 = sub_1000A3CF0();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
LABEL_49:
              v42 = self->_identifier;
              int64_t v43 = self->_transactionIndex;
              v44 = [v13 shortDescription];
              *(_DWORD *)v45 = 138543874;
              *(void *)&v45[4] = v42;
              *(_WORD *)&v45[12] = 2048;
              *(void *)&v45[14] = v43;
              *(_WORD *)&v45[22] = 2114;
              v46 = v44;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: Rollback not implement for saga entry %ld:%{public}@", v45, 0x20u);
            }
LABEL_50:
          }
LABEL_51:
          -[EPRoutingSlip transactionDidComplete:](self, "transactionDidComplete:", v14, *(void *)v45, *(_OWORD *)&v45[8], v46);
        }
      }
      else
      {
        v19 = sub_1000A3CF0();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          id v17 = sub_1000A3CF0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
LABEL_20:
            v21 = self->_identifier;
            int64_t v22 = self->_transactionIndex;
            v23 = [v13 shortDescription];
            *(_DWORD *)v45 = 138543874;
            *(void *)&v45[4] = v21;
            *(_WORD *)&v45[12] = 2048;
            *(void *)&v45[14] = v22;
            *(_WORD *)&v45[22] = 2114;
            v46 = v23;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: Starting saga entry %ld:%{public}@", v45, 0x20u);
          }
LABEL_21:
        }
LABEL_22:
        [v14 beginTransactionWithRoutingSlipEntry:v13 serviceRegistry:self->_serviceRegistry *(_OWORD *)v45 *(void *)&v45[16] v46];
      }

      break;
    case 2uLL:
      v24 = sub_1000A3CF0();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (!v25) {
        goto LABEL_33;
      }
      v13 = sub_1000A3CF0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_identifier;
        *(_DWORD *)v45 = 138543362;
        *(void *)&v45[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: Completed", v45, 0xCu);
      }
      break;
    case 3uLL:
      v27 = sub_1000A3CF0();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (v28)
      {
        id v29 = sub_1000A3CF0();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          long long v30 = self->_identifier;
          *(_DWORD *)v45 = 138543362;
          *(void *)&v45[4] = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: cancelling transaction queued for cancellation", v45, 0xCu);
        }
      }
      v13 = [(EPRoutingSlip *)self transaction];
      [v13 cancelWithError:0];
      break;
    default:
      goto LABEL_33;
  }

LABEL_33:
  [(EPRoutingSlip *)self persist];
}

- (void)invalidate
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = self->_transactionReferences;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_transactionReferences, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v8 invalidate];
        }
        [v8 setDelegate:0];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_transactionReferences removeAllObjects];
  [(EPRoutingSlip *)self setRoutingSlipDelegate:0];
}

- (void)transactionDidComplete:(id)a3
{
  id v4 = [(EPServiceRegistry *)self->_serviceRegistry queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4F28;
  block[3] = &unk_1001655F8;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)printDescription
{
  BOOL v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138543362;
      __int16 v14 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin dumping EPRoutingSlipEntries of EPRoutingSlip[%{public}@]", buf, 0xCu);
    }
  }
  id v7 = [(EPRoutingSlip *)self entries];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F53A8;
  v12[3] = &unk_100169EA8;
  v12[4] = self;
  [v7 enumerateObjectsUsingBlock:v12];

  BOOL v8 = sub_1000A3CF0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    long long v10 = sub_1000A3CF0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = self->_identifier;
      *(_DWORD *)buf = 138543362;
      __int16 v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "End dumping EPRoutingSlipEntries of EPRoutingSlip[%{public}@]", buf, 0xCu);
    }
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(EPRoutingSlip *)self entryMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPRoutingSlip)initWithCoder:(id)a3
{
  id v4 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:v12 count:2];
  uint64_t v6 = +[NSSet setWithArray:v5];
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"entries"];

  BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (!v8)
  {
    BOOL v9 = +[NSUUID UUID];
    BOOL v8 = [v9 UUIDString];
  }
  long long v10 = [(EPRoutingSlip *)self initWithIdentifier:v8 routingSlipEntries:v7];
  if (v10)
  {
    v10->_int64_t transactionIndex = (int64_t)[v4 decodeIntegerForKey:@"transactionIndex"];
    v10->_didFail = [v4 decodeBoolForKey:@"didFail"];
    v10->_state = (unint64_t)[v4 decodeIntegerForKey:@"state"];
    v10->_persistWhilePending = [v4 decodeBoolForKey:@"persistWhilePending"];
    v10->_notUnrollable = [v4 decodeBoolForKey:@"notUnrollable"];
    v10->_resumeEnabled = [v4 decodeBoolForKey:@"resumeEnabled"];
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_entries forKey:@"entries"];
  [v5 encodeInteger:self->_transactionIndex forKey:@"transactionIndex"];
  [v5 encodeBool:self->_didFail forKey:@"didFail"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeBool:self->_persistWhilePending forKey:@"persistWhilePending"];
  [v5 encodeBool:self->_notUnrollable forKey:@"notUnrollable"];
  [v5 encodeBool:self->_resumeEnabled forKey:@"resumeEnabled"];
}

- (id)getLastFirstError
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self;
  id v3 = [(EPRoutingSlip *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v9 = [v8 errors:v14];
        long long v10 = [v9 firstObject];

        if (v10)
        {
          long long v11 = [v8 errors];
          uint64_t v12 = [v11 firstObject];

          id v5 = (void *)v12;
        }
      }
      id v4 = [(EPRoutingSlip *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      transaction = self->_transaction;
      int v28 = 136315394;
      id v29 = "-[EPRoutingSlip cancelWithError:]";
      __int16 v30 = 2112;
      char v31 = transaction;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s - _transaction %@", (uint8_t *)&v28, 0x16u);
    }
  }
  if ((id)[(EPRoutingSlip *)self state] != (id)1)
  {
    long long v15 = nr_daemon_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (!v16) {
      goto LABEL_31;
    }
    long long v17 = nr_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      int v28 = 138543362;
      id v29 = (const char *)identifier;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: cancelWithError on dead routing slip does nothing", (uint8_t *)&v28, 0xCu);
    }
LABEL_17:

    goto LABEL_31;
  }
  if (![(EPRoutingSlip *)self notUnrollable]) {
    [(EPRoutingSlip *)self setDidFail:1];
  }
  BOOL v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    long long v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = self->_identifier;
      v13 = [(EPRoutingSlip *)self currentEntry];
      long long v14 = [v13 shortDescription];
      int v28 = 138543874;
      id v29 = (const char *)v12;
      __int16 v30 = 2114;
      char v31 = v14;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: canceling running transaction %{public}@ with error:%{public}@", (uint8_t *)&v28, 0x20u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [(EPTransaction *)self->_transaction cancelWithError:v4];
    goto LABEL_31;
  }
  if (objc_opt_respondsToSelector())
  {
    if (v4)
    {
      v19 = [(EPRoutingSlip *)self currentEntry];
      BOOL v20 = [v19 errors];
      [v20 addObject:v4];
    }
    [(EPTransaction *)self->_transaction cancel];
    goto LABEL_31;
  }
  v21 = self->_transaction;
  int64_t v22 = nr_daemon_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v21)
  {
    if (!v23) {
      goto LABEL_31;
    }
    long long v17 = nr_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_identifier;
      BOOL v25 = [(EPRoutingSlip *)self currentEntry];
      v26 = [v25 shortDescription];
      int v28 = 138543618;
      id v29 = (const char *)v24;
      __int16 v30 = 2114;
      char v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPRoutingSlip[%{public}@]: canceling running transaction %{public}@ failed, transaction does not respond to the cancel selector!", (uint8_t *)&v28, 0x16u);
    }
    goto LABEL_17;
  }
  if (v23)
  {
    v27 = nr_daemon_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Transaction is nil, flagging for cancellation once the routingSlip is setup", (uint8_t *)&v28, 2u);
    }
  }
  [(EPRoutingSlip *)self setQueuedCancel:1];
LABEL_31:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (EPRoutingSlipDelegate)routingSlipDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlipDelegate);

  return (EPRoutingSlipDelegate *)WeakRetained;
}

- (void)setRoutingSlipDelegate:(id)a3
{
}

- (int64_t)transactionIndex
{
  return self->_transactionIndex;
}

- (BOOL)didFail
{
  return self->_didFail;
}

- (void)setDidFail:(BOOL)a3
{
  self->_didFail = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSArray)entries
{
  return self->_entries;
}

- (BOOL)persistWhilePending
{
  return self->_persistWhilePending;
}

- (void)setPersistWhilePending:(BOOL)a3
{
  self->_persistWhilePending = a3;
}

- (BOOL)notUnrollable
{
  return self->_notUnrollable;
}

- (void)setNotUnrollable:(BOOL)a3
{
  self->_notUnrollable = a3;
}

- (BOOL)resumeEnabled
{
  return self->_resumeEnabled;
}

- (void)setResumeEnabled:(BOOL)a3
{
  self->_resumeEnabled = a3;
}

- (NSDictionary)entryMap
{
  return self->_entryMap;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
}

- (mach_timebase_info)timebaseInfo
{
  return self->_timebaseInfo;
}

- (void)setTimebaseInfo:(mach_timebase_info)a3
{
  self->_timebaseInfo = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)submitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (BOOL)queuedCancel
{
  return self->_queuedCancel;
}

- (void)setQueuedCancel:(BOOL)a3
{
  self->_queuedCancel = a3;
}

- (NROSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (NSMutableDictionary)transactionReferences
{
  return self->_transactionReferences;
}

- (void)setTransactionReferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionReferences, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_entryMap, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_destroyWeak((id *)&self->_routingSlipDelegate);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end