@interface PLSearchIndexingNormalizedWorkItem
+ (id)coalesceWorkItemA:(id)a3 itemB:(id)a4;
- (BOOL)isInsert;
- (BOOL)isRemoval;
- (NSDate)timestamp;
- (NSString)identifier;
- (PLSearchIndexingNormalizedWorkItem)initWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 entityToIndex:(unint64_t)a6 timestamp:(id)a7;
- (int64_t)jobFlags;
- (signed)jobType;
- (unint64_t)entityToIndex;
@end

@implementation PLSearchIndexingNormalizedWorkItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)entityToIndex
{
  return self->_entityToIndex;
}

- (int64_t)jobFlags
{
  return self->_jobFlags;
}

- (signed)jobType
{
  return self->_jobType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isRemoval
{
  return self->_jobFlags & 1;
}

- (BOOL)isInsert
{
  return (LOBYTE(self->_jobFlags) >> 1) & 1;
}

- (PLSearchIndexingNormalizedWorkItem)initWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 entityToIndex:(unint64_t)a6 timestamp:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PLSearchIndexingNormalizedWorkItem;
  v14 = [(PLSearchIndexingNormalizedWorkItem *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v14->_jobType = a4;
    v14->_jobFlags = a5;
    v14->_entityToIndex = a6;
    uint64_t v17 = [v13 copy];
    timestamp = v14->_timestamp;
    v14->_timestamp = (NSDate *)v17;
  }
  return v14;
}

+ (id)coalesceWorkItemA:(id)a3 itemB:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  id v9 = [v7 identifier];
  if ([v8 isEqualToString:v9])
  {
    uint64_t v10 = [v6 entityToIndex];
    uint64_t v11 = [v7 entityToIndex];

    if (v10 != v11)
    {
      v29 = 0;
      goto LABEL_18;
    }
    id v12 = [v6 timestamp];
    id v13 = [v7 timestamp];
    uint64_t v14 = [v12 compare:v13];

    if (v14 == -1) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = v7;
    }
    if (v14 == -1) {
      v16 = v7;
    }
    else {
      v16 = v6;
    }
    id v8 = v15;
    id v9 = v16;
    if (([v9 isRemoval] & 1) != 0
      || [v8 isRemoval] && (objc_msgSend(v9, "isInsert") & 1) == 0)
    {
      id v30 = objc_alloc((Class)a1);
      v18 = [v8 identifier];
      uint64_t v31 = [v6 jobType];
      uint64_t v32 = [v8 entityToIndex];
      v23 = [v8 timestamp];
      v24 = v30;
      v25 = v18;
      uint64_t v26 = v31;
      uint64_t v27 = 1;
      uint64_t v28 = v32;
    }
    else
    {
      id v17 = objc_alloc((Class)a1);
      v18 = [v8 identifier];
      uint64_t v19 = [v6 jobType];
      uint64_t v20 = [v9 jobFlags];
      uint64_t v21 = [v8 jobFlags] | v20;
      uint64_t v22 = [v8 entityToIndex];
      v23 = [v8 timestamp];
      v24 = v17;
      v25 = v18;
      uint64_t v26 = v19;
      uint64_t v27 = v21;
      uint64_t v28 = v22;
    }
    v29 = (void *)[v24 initWithIdentifier:v25 jobType:v26 jobFlags:v27 entityToIndex:v28 timestamp:v23];
  }
  else
  {
    v29 = 0;
  }

LABEL_18:
  return v29;
}

@end