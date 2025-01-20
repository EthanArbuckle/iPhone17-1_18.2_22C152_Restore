@interface MZKeyValueStoreDeserializer
+ (BOOL)validateDataFromSuccessfulSetTransaction:(id)a3 forKey:(id)a4;
+ (unint64_t)responseTypeForTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 mismatch:(BOOL)a6;
- (BOOL)authenticationError;
- (BOOL)genericError;
- (BOOL)hasBackoff;
- (BOOL)isDirty;
- (BOOL)success;
- (BOOL)unsupportedClient;
- (BOOL)validationError;
- (BOOL)versionMismatch;
- (MZKeyValueStoreController)keyValueStoreController;
- (MZKeyValueStoreDeserializeOperationDelegate)delegate;
- (MZKeyValueStoreDeserializer)initWithTransaction:(id)a3 response:(id)a4;
- (MZKeyValueStoreTransaction)transaction;
- (NSDictionary)serverResponse;
- (NSError)requestError;
- (NSMutableArray)pendingDeserializations;
- (int64_t)status;
- (unint64_t)retrySeconds;
- (void)_delegateOperationDidFinish;
- (void)deserialize;
- (void)finishedDeserializationForKey:(id)a3;
- (void)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 finishedBlock:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setKeyValueStoreController:(id)a3;
- (void)setPendingDeserializations:(id)a3;
- (void)setServerResponse:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MZKeyValueStoreDeserializer

- (MZKeyValueStoreDeserializer)initWithTransaction:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MZKeyValueStoreDeserializer;
  v9 = [(MZKeyValueStoreDeserializer *)&v17 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingDeserializations = v9->_pendingDeserializations;
    v9->_pendingDeserializations = v10;

    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v9->_serverResponse, a4);
    v12 = [v8 valueForKey:@"status"];
    v13 = v12;
    if (v12)
    {
      id v14 = [v12 integerValue];
      v9->_status = (int64_t)v14;
      if (v14 == (id)1197)
      {
        v15 = [v8 objectForKey:@"retry-seconds"];
        v9->_retrySeconds = (unint64_t)[v15 unsignedIntegerValue];
      }
    }
    else
    {
      v9->_status = -1;
    }
  }
  return v9;
}

- (void)deserialize
{
  self->_isDirty = 0;
  v3 = [(MZKeyValueStoreDeserializer *)self serverResponse];
  v4 = [v3 valueForKey:@"values"];

  v5 = [(MZKeyValueStoreDeserializer *)self serverResponse];
  v6 = [v5 valueForKey:@"domain-version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 stringValue];

    v6 = (void *)v7;
  }

  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v45 + 1) + 8 * i) valueForKey:@"key"];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v11);
  }

  [(MZKeyValueStoreDeserializer *)self setPendingDeserializations:v8];
  v15 = [(MZKeyValueStoreDeserializer *)self transaction];
  v16 = [v15 processor];
  objc_super v17 = [(MZKeyValueStoreDeserializer *)self transaction];
  [v16 transaction:v17 willProcessResponseWithDomainVersion:v6];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v9;
  id v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v19)
  {
    id v37 = v8;
    uint64_t v20 = *(void *)v42;
    id v21 = v19;
    id obj = v18;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
        v24 = [v23 valueForKey:@"key"];
        v25 = [v23 valueForKey:@"version"];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
        {
          uint64_t v26 = [v25 stringValue];

          v25 = (void *)v26;
        }
        v27 = [v23 valueForKey:@"value"];
        v28 = [v27 MZDataByInflatingWithGZip];
        BOOL v29 = [(MZKeyValueStoreDeserializer *)self versionMismatch];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1000AABB4;
        v39[3] = &unk_10054FDE8;
        v39[4] = self;
        id v40 = v24;
        id v30 = v24;
        [(MZKeyValueStoreDeserializer *)self mergeData:v28 forKey:v30 version:v25 mismatch:v29 finishedBlock:v39];
      }
      id v18 = obj;
      id v21 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v21);

    v31 = [(MZKeyValueStoreDeserializer *)self transaction];
    v32 = [v31 processor];
    v33 = [(MZKeyValueStoreDeserializer *)self transaction];
    [v32 transaction:v33 didProcessResponseWithDomainVersion:v6];

    id v8 = v37;
  }
  else
  {

    v34 = [(MZKeyValueStoreDeserializer *)self transaction];
    v35 = [v34 processor];
    v36 = [(MZKeyValueStoreDeserializer *)self transaction];
    [v35 transaction:v36 didProcessResponseWithDomainVersion:v6];

    [(MZKeyValueStoreDeserializer *)self _delegateOperationDidFinish];
  }
}

- (void)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 finishedBlock:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, void))a7;
  v16 = objc_opt_class();
  objc_super v17 = [(MZKeyValueStoreDeserializer *)self transaction];
  id v18 = [v16 responseTypeForTransaction:v17 withData:v12 forKey:v13 mismatch:v8];

  switch((unint64_t)v18)
  {
    case 0uLL:
      id v19 = [(MZKeyValueStoreDeserializer *)self transaction];
      uint64_t v20 = [v19 processor];
      id v21 = [(MZKeyValueStoreDeserializer *)self transaction];
      [v20 successfulGetTransaction:v21 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
      goto LABEL_5;
    case 1uLL:
      id v19 = [(MZKeyValueStoreDeserializer *)self transaction];
      uint64_t v20 = [v19 processor];
      id v21 = [(MZKeyValueStoreDeserializer *)self transaction];
      [v20 successfulSetTransaction:v21 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
      id v19 = [(MZKeyValueStoreDeserializer *)self transaction];
      uint64_t v20 = [v19 processor];
      id v21 = [(MZKeyValueStoreDeserializer *)self transaction];
      [v20 conflictForSetTransaction:v21 withData:v12 forKey:v13 version:v14 finishedBlock:v15];
LABEL_5:

      break;
    case 4uLL:
      v22 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = [(MZKeyValueStoreDeserializer *)self transaction];
        v24[0] = 67109376;
        v24[1] = [v23 type];
        __int16 v25 = 1024;
        BOOL v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Unacceptable combination of transaction type (%d) and mismatch (%d). Shouldn't reach this branch.", (uint8_t *)v24, 0xEu);
      }
      v15[2](v15, 0);
      break;
    default:
      break;
  }
}

+ (unint64_t)responseTypeForTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 mismatch:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  unsigned int v12 = [v11 type];
  unsigned int v13 = [v11 type];
  unsigned int v14 = [v11 type];

  if (v13 != 2 || v6)
  {
    uint64_t v16 = 4;
    if (v14 == 2 && v6) {
      uint64_t v16 = 2;
    }
  }
  else
  {
    unsigned int v15 = [(id)objc_opt_class() validateDataFromSuccessfulSetTransaction:v9 forKey:v10];
    uint64_t v16 = 3;
    if (v15) {
      uint64_t v16 = 1;
    }
  }
  if (v12 != 1 || v6) {
    unint64_t v18 = v16;
  }
  else {
    unint64_t v18 = 0;
  }

  return v18;
}

+ (BOOL)validateDataFromSuccessfulSetTransaction:(id)a3 forKey:(id)a4
{
  id v4 = [a3 length];
  if (v4)
  {
    v5 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Responses to successful SET transactions with mismatch=NO shouldn't return any data", v7, 2u);
    }
  }
  return v4 == 0;
}

- (void)finishedDeserializationForKey:(id)a3
{
  id v8 = a3;
  id v4 = self->_pendingDeserializations;
  objc_sync_enter(v4);
  v5 = [(MZKeyValueStoreDeserializer *)self pendingDeserializations];
  [v5 removeObjectIdenticalTo:v8];

  BOOL v6 = [(MZKeyValueStoreDeserializer *)self pendingDeserializations];
  id v7 = [v6 count];

  if (!v7) {
    [(MZKeyValueStoreDeserializer *)self _delegateOperationDidFinish];
  }
  objc_sync_exit(v4);
}

- (void)_delegateOperationDidFinish
{
  id v7 = self;
  if ([(MZKeyValueStoreDeserializer *)v7 versionMismatch])
  {
    v2 = v7;
    if (!v7->_isDirty)
    {
      BOOL v5 = 0;
      goto LABEL_10;
    }
    v3 = [(MZKeyValueStoreDeserializer *)v7 transaction];
    if ([v3 type] == 2)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v4 = [(MZKeyValueStoreDeserializer *)v7 transaction];
      BOOL v5 = [v4 type] == 3;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  v2 = v7;
LABEL_10:
  BOOL v6 = [(MZKeyValueStoreDeserializer *)v2 delegate];
  [v6 deserializeOperationDidFinish:v7 shouldReschedule:v5];
}

- (BOOL)unsupportedClient
{
  return self->_status == 1101;
}

- (BOOL)authenticationError
{
  return self->_status == -4;
}

- (BOOL)validationError
{
  return self->_status == -2;
}

- (BOOL)genericError
{
  return self->_status == -3;
}

- (BOOL)success
{
  return self->_status == 0;
}

- (BOOL)versionMismatch
{
  return self->_status == 1198;
}

- (NSError)requestError
{
  if ([(MZKeyValueStoreDeserializer *)self success])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = &qword_10054FC28;
    do
    {
      uint64_t v6 = *v4;
      v4 += 4;
      uint64_t v5 = v6;
    }
    while (v6 != -9999 && v5 != self->_status);
    uint64_t v8 = *(v4 - 2);
    if (*((unsigned char *)v4 - 8)) {
      CFStringRef v9 = @" Please enable logging and file a bug.";
    }
    else {
      CFStringRef v9 = &stru_10056A8A0;
    }
    id v10 = +[NSString stringWithFormat:@"%@ (status = %d)%@", v8, self->_status, v9];
    id v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, NSLocalizedDescriptionKey, 0);
    id v3 = [objc_alloc((Class)NSError) initWithDomain:@"MZBookkeeperRequestErrorDomain" code:self->_status userInfo:v11];
  }

  return (NSError *)v3;
}

- (BOOL)hasBackoff
{
  return [(MZKeyValueStoreDeserializer *)self retrySeconds] != 0;
}

- (MZKeyValueStoreTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (MZKeyValueStoreController)keyValueStoreController
{
  return self->_keyValueStoreController;
}

- (void)setKeyValueStoreController:(id)a3
{
}

- (NSDictionary)serverResponse
{
  return self->_serverResponse;
}

- (void)setServerResponse:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)retrySeconds
{
  return self->_retrySeconds;
}

- (MZKeyValueStoreDeserializeOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MZKeyValueStoreDeserializeOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)pendingDeserializations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingDeserializations:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeserializations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyValueStoreController, 0);
  objc_storeStrong((id *)&self->_serverResponse, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end