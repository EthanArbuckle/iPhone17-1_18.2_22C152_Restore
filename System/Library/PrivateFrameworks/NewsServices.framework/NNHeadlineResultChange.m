@interface NNHeadlineResultChange
- (NNHeadlineResultChange)init;
- (NNHeadlineResultChange)initWithHeadlineResult:(id)a3;
- (NNSyncableResult)result;
- (NSString)identifier;
- (NSString)sequencer;
- (int64_t)changeType;
@end

@implementation NNHeadlineResultChange

- (NNHeadlineResultChange)initWithHeadlineResult:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NNHeadlineResultChange;
  v6 = [(NNHeadlineResultChange *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    v8 = objc_msgSend(v5, "sync_sections");
    id v9 = [v8 count];

    if (v9)
    {
      v10 = +[NSMutableString string];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v11 = objc_msgSend(v5, "sync_sections", 0);
      id v12 = [v11 copy];

      id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        char v15 = 0;
        uint64_t v16 = *(void *)v24;
        do
        {
          v17 = 0;
          do
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v17);
            if (v15) {
              [v10 appendString:@","];
            }
            v19 = objc_msgSend(v18, "sync_identifier");
            [v10 appendString:v19];

            v17 = (char *)v17 + 1;
            char v15 = 1;
          }
          while (v14 != v17);
          id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v14);
      }

      v20 = (NSString *)[v10 copy];
      identifier = v7->_identifier;
      v7->_identifier = v20;
    }
    else
    {
      v10 = v7->_identifier;
      v7->_identifier = (NSString *)@"sync-zero-results";
    }
  }
  return v7;
}

- (NNHeadlineResultChange)init
{
  return [(NNHeadlineResultChange *)self initWithHeadlineResult:0];
}

- (NSString)sequencer
{
  v2 = [(NNHeadlineResultChange *)self result];
  v3 = objc_msgSend(v2, "sync_expirationDate");
  [v3 timeIntervalSinceReferenceDate];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (int64_t)changeType
{
  return 2;
}

- (NNSyncableResult)result
{
  return self->_result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

@end