@interface TransparencyRPCRequestBuilder
+ (id)buildBatchQueryRequest:(id)a3 application:(id)a4 error:(id *)a5;
+ (id)buildBatchQueryRequests:(id)a3 application:(id)a4 maxURIsPerBatch:(unint64_t)a5 error:(id *)a6;
+ (id)buildConsistencyProofRequest:(id)a3 revisions:(id)a4 error:(id *)a5;
+ (id)buildPublicKeysRequest:(id)a3 error:(id *)a4;
+ (id)buildQueryRequest:(id)a3 application:(id)a4 error:(id *)a5;
+ (id)buildRevisionLogInclusionProofRequest:(id)a3 logType:(int)a4 revisions:(id)a5 error:(id *)a6;
@end

@implementation TransparencyRPCRequestBuilder

+ (id)buildPublicKeysRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(PublicKeysRequest);
  [(PublicKeysRequest *)v6 setVersion:kTransparencyProtocolVersion];
  v7 = +[TransparencyApplication applicationValueForIdentifier:v5];
  v8 = v7;
  if (v7)
  {
    -[PublicKeysRequest setApplication:](v6, "setApplication:", [v7 intValue]);
    v9 = v6;
  }
  else
  {
    if (a4)
    {
      *a4 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface, -42, @"Unknown application %@", v5 code description];
    }
    if (qword_10032F418 != -1) {
      dispatch_once(&qword_10032F418, &stru_1002CA7D8);
    }
    v10 = qword_10032F420;
    if (os_log_type_enabled((os_log_t)qword_10032F420, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unknown application %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)buildQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(QueryRequest);
  [(QueryRequest *)v8 setVersion:kTransparencyProtocolVersion];
  v9 = +[TransparencyApplication applicationValueForIdentifier:v6];

  -[QueryRequest setApplication:](v8, "setApplication:", [v9 intValue]);
  [(QueryRequest *)v8 setUri:v7];

  return v8;
}

+ (id)buildBatchQueryRequest:(id)a3 application:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(BatchQueryRequest);
  [(BatchQueryRequest *)v8 setVersion:kTransparencyProtocolVersion];
  v9 = +[TransparencyApplication applicationValueForIdentifier:v7];
  -[BatchQueryRequest setApplication:](v8, "setApplication:", [v9 intValue]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v16 = [(BatchQueryRequest *)v8 uriArray];
        [v16 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  return v8;
}

+ (id)buildBatchQueryRequests:(id)a3 application:(id)a4 maxURIsPerBatch:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = +[NSMutableArray array];
  id v12 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        [v12 addObject:*(void *)(*((void *)&v22 + 1) + 8 * i) (void)v22];
        if ((unint64_t)[v12 count] >= a5)
        {
          uint64_t v18 = +[TransparencyRPCRequestBuilder buildBatchQueryRequest:v12 application:v10 error:a6];
          if (!v18)
          {

            id v20 = 0;
            goto LABEL_16;
          }
          long long v19 = (void *)v18;
          [v11 addObject:v18];
          [v12 removeAllObjects];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if ([v12 count])
  {
    id v20 = +[TransparencyRPCRequestBuilder buildBatchQueryRequest:v12 application:v10 error:a6];
    if (!v20) {
      goto LABEL_16;
    }
    [v11 addObject:v20];
  }
  id v20 = v11;
LABEL_16:

  return v20;
}

+ (id)buildConsistencyProofRequest:(id)a3 revisions:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 count] >= 2)
  {
    v8 = objc_alloc_init(ConsistencyProofRequest);
    [(ConsistencyProofRequest *)v8 setVersion:kTransparencyProtocolVersion];
    id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:(char *)[v7 count] - 1];
    [(ConsistencyProofRequest *)v8 setRequestsArray:v9];

    if ([v6 isEqualToString:kKTApplicationIdentifierTLT]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 2;
    }
    id v11 = +[TransparencyApplication applicationValueForIdentifier:v6];
    id v12 = [v11 intValue];

    [(ConsistencyProofRequest *)v8 setLogType:v10];
    if (v12) {
      [(ConsistencyProofRequest *)v8 setApplication:v12];
    }
    id v13 = [v7 objectAtIndexedSubscript:0];
    id v14 = [v13 unsignedLongLongValue];

    if ([v7 count] != (id)1)
    {
      id v15 = 0;
      do
      {
        uint64_t v16 = objc_alloc_init(ConsistencyProofRequest_LogConsistencyRequest);
        [(ConsistencyProofRequest_LogConsistencyRequest *)v16 setStartRevision:v14];
        v17 = [v7 objectAtIndexedSubscript:++v15];
        -[ConsistencyProofRequest_LogConsistencyRequest setEndRevision:](v16, "setEndRevision:", [v17 unsignedLongLongValue]);

        uint64_t v18 = [v7 objectAtIndexedSubscript:v15];
        id v14 = [v18 unsignedLongLongValue];

        long long v19 = [(ConsistencyProofRequest *)v8 requestsArray];
        [v19 addObject:v16];
      }
      while (v15 < (char *)[v7 count] - 1);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildRevisionLogInclusionProofRequest:(id)a3 logType:(int)a4 revisions:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(RevisionLogInclusionProofRequest);
  [(RevisionLogInclusionProofRequest *)v10 setVersion:kTransparencyProtocolVersion];
  id v11 = +[TransparencyApplication applicationValueForIdentifier:v8];
  -[RevisionLogInclusionProofRequest setApplication:](v10, "setApplication:", [v11 intValue]);

  [(RevisionLogInclusionProofRequest *)v10 setLogType:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = [(RevisionLogInclusionProofRequest *)v10 revisionArray];
        [v18 addValue:[v17 unsignedLongLongValue]];
      }
      id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  return v10;
}

@end