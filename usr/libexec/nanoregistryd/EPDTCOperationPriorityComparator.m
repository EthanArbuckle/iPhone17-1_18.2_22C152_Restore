@interface EPDTCOperationPriorityComparator
+ (BOOL)shouldAcceptNewTransaction:(id)a3 intoSet:(id)a4;
+ (BOOL)shouldCancelRunningTransaction:(id)a3 newTransaction:(id)a4 pairingID:(id)a5;
+ (id)rankTable;
+ (id)sortedTransactionsWithSet:(id)a3 pairingID:(id)a4;
+ (int64_t)compare:(id)a3 to:(id)a4 withActivePairingID:(id)a5;
+ (unint64_t)statusCodeForContainer:(id)a3;
@end

@implementation EPDTCOperationPriorityComparator

+ (id)rankTable
{
  if (qword_1001A1050 != -1) {
    dispatch_once(&qword_1001A1050, &stru_1001657C8);
  }
  v2 = (void *)qword_1001A1048;

  return v2;
}

+ (int64_t)compare:(id)a3 to:(id)a4 withActivePairingID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 operationType];
  if ([v12 isEqual:@"reunionSync"])
  {
    v5 = [v10 operationType];
    unsigned int v13 = [v5 isEqual:@"reunionSync"];

    if (!v13) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  v14 = [v9 operationType];
  if ([v14 isEqual:@"reunionSync"])
  {
  }
  else
  {
    v5 = [v10 operationType];
    unsigned __int8 v15 = [v5 isEqual:@"reunionSync"];

    if (v15)
    {
LABEL_24:
      int64_t v18 = 1;
      goto LABEL_31;
    }
  }
  v16 = [v9 operationType];
  if ([v16 isEqual:@"reunionSync"])
  {
    v5 = [v10 operationType];
    unsigned __int8 v17 = [v5 isEqual:@"reunionSync"];

    if (v17)
    {
      int64_t v18 = 0;
      goto LABEL_31;
    }
  }
  else
  {
  }
  v19 = [v9 targetPairingID];
  if (v19)
  {
    v5 = [v9 targetPairingID];
    if ([v5 isEqual:v11])
    {
      BOOL v20 = 1;
LABEL_16:

      goto LABEL_17;
    }
  }
  v21 = [v9 targetPairingID];
  BOOL v20 = v21 == 0;

  if (v19) {
    goto LABEL_16;
  }
LABEL_17:

  v22 = [v10 targetPairingID];
  if (v22
    && ([v10 targetPairingID],
        v5 = objc_claimAutoreleasedReturnValue(),
        ([v5 isEqual:v11] & 1) != 0))
  {
    BOOL v23 = 1;
  }
  else
  {
    v24 = [v10 targetPairingID];
    BOOL v23 = v24 == 0;

    if (!v22) {
      goto LABEL_22;
    }
  }

LABEL_22:
  if (v20 && !v23) {
    goto LABEL_24;
  }
  if (!v20 && v23)
  {
LABEL_30:
    int64_t v18 = -1;
    goto LABEL_31;
  }
  v25 = [a1 rankTable];
  v26 = [v9 operationType];
  v27 = [v25 objectForKeyedSubscript:v26];
  id v41 = [v27 integerValue];
  v28 = [a1 rankTable];
  v29 = [v10 operationType];
  [v28 objectForKeyedSubscript:v29];
  v30 = id v40 = a1;
  id v31 = [v30 integerValue];

  if ((uint64_t)v41 > (uint64_t)v31) {
    goto LABEL_24;
  }
  v32 = [v40 rankTable];
  v33 = [v9 operationType];
  v34 = [v32 objectForKeyedSubscript:v33];
  id v42 = [v34 integerValue];
  v35 = [v40 rankTable];
  v36 = [v10 operationType];
  v37 = [v35 objectForKeyedSubscript:v36];
  id v38 = [v37 integerValue];

  if ((uint64_t)v42 >= (uint64_t)v38) {
    int64_t v18 = 0;
  }
  else {
    int64_t v18 = -1;
  }
LABEL_31:

  return v18;
}

+ (unint64_t)statusCodeForContainer:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned int v13 = sub_10000906C;
  v14 = sub_10000907C;
  id v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009084;
  block[3] = &unk_1001657F0;
  block[4] = &v10;
  if (qword_1001A1058 != -1) {
    dispatch_once(&qword_1001A1058, block);
  }
  v4 = (void *)v11[5];
  v5 = [v3 operationType];
  v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v6 integerValue];

  _Block_object_dispose(&v10, 8);
  return (unint64_t)v7;
}

+ (BOOL)shouldAcceptNewTransaction:(id)a3 intoSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 operationType];
  unsigned int v8 = [v7 isEqualToString:@"migration"];

  id v9 = [v5 operationType];
  unsigned __int8 v10 = [v9 isEqualToString:@"pair"];

  if ((v10 & 1) != 0 || v8)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v6;
    id v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      id v23 = v6;
      char v14 = 0;
      char v15 = 0;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(obj);
          }
          int64_t v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v19 = [v18 operationType];
          unsigned __int8 v20 = [(id)v19 isEqualToString:@"migration"];

          v14 |= v20;
          v21 = [v18 operationType];
          LOBYTE(v19) = [v21 isEqualToString:@"pair"];

          v15 |= v19;
        }
        id v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
      char v11 = (v15 | v14) ^ 1;
      id v6 = v23;
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11 & 1;
}

+ (BOOL)shouldCancelRunningTransaction:(id)a3 newTransaction:(id)a4 pairingID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = [v8 operationType];
  if ([v10 isEqual:@"initialSync"]) {
    goto LABEL_6;
  }
  char v11 = [v8 operationType];
  if ([v11 isEqual:@"storeUnpair"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v12 = [v7 operationType];
  if ([v12 isEqual:@"unpair"])
  {

    goto LABEL_5;
  }
  char v15 = [v7 operationType];
  unsigned __int8 v16 = [v15 isEqual:@"externalSwitch"];

  if ((v16 & 1) == 0)
  {
    BOOL v13 = +[EPDTCOperationPriorityComparator compare:v7 to:v8 withActivePairingID:v9] == -1;
    goto LABEL_8;
  }
LABEL_7:
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

+ (id)sortedTransactionsWithSet:(id)a3 pairingID:(id)a4
{
  id v6 = a4;
  id v7 = [a3 allObjects];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009560;
  v11[3] = &unk_100165818;
  id v12 = v6;
  id v13 = a1;
  id v8 = v6;
  id v9 = [v7 sortedArrayUsingComparator:v11];

  return v9;
}

@end