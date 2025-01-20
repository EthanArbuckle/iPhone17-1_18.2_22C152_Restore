@interface BAContentRequestTelemetry
- (BAContentRequestTelemetry)initWithContentRequest:(int64_t)a3 applicationIdentifier:(id)a4 installSource:(int64_t)a5 downloads:(id)a6;
- (BOOL)allDownloadsCompleted;
- (NSDictionary)eventPayload;
- (NSMutableArray)fileSizes;
- (NSMutableDictionary)uniqueErrorCounts;
- (NSMutableSet)remainingDownloadUniqueIdentifiers;
- (NSString)applicationIdentifier;
- (id)_average:(id)a3;
- (id)_formatMostFrequentError;
- (id)_median:(id)a3;
- (id)description;
- (id)eventName;
- (id)formatError:(id)a3 withCount:(unint64_t)a4;
- (id)payload;
- (void)recordDownloadCompletion:(id)a3 error:(id)a4;
- (void)setApplicationIdentifier:(id)a3;
- (void)setEventPayload:(id)a3;
- (void)setFileSizes:(id)a3;
- (void)setRemainingDownloadUniqueIdentifiers:(id)a3;
- (void)setUniqueErrorCounts:(id)a3;
@end

@implementation BAContentRequestTelemetry

- (BAContentRequestTelemetry)initWithContentRequest:(int64_t)a3 applicationIdentifier:(id)a4 installSource:(int64_t)a5 downloads:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)BAContentRequestTelemetry;
  v13 = [(BAContentRequestTelemetry *)&v33 init];
  v14 = v13;
  if (v13)
  {
    v13->_contentRequest = a3;
    v13->_installSource = a5;
    objc_storeStrong((id *)&v13->_applicationIdentifier, a4);
    v14->_invalid = 0;
    uint64_t v15 = +[NSMutableArray array];
    fileSizes = v14->_fileSizes;
    v14->_fileSizes = (NSMutableArray *)v15;

    uint64_t v17 = +[NSMutableDictionary dictionary];
    uniqueErrorCounts = v14->_uniqueErrorCounts;
    v14->_uniqueErrorCounts = (NSMutableDictionary *)v17;

    uint64_t v19 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v12 count]);
    remainingDownloadUniqueIdentifiers = v14->_remainingDownloadUniqueIdentifiers;
    v14->_remainingDownloadUniqueIdentifiers = (NSMutableSet *)v19;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v21 = v12;
    id v22 = [v21 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = v14->_remainingDownloadUniqueIdentifiers;
          v27 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v25) uniqueIdentifier:v29];
          [(NSMutableSet *)v26 addObject:v27];

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        id v23 = [v21 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
  }
  return v14;
}

- (void)recordDownloadCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (unint64_t)a4;
  v8 = [(BAContentRequestTelemetry *)self remainingDownloadUniqueIdentifiers];
  v9 = [v6 uniqueIdentifier];
  unsigned __int8 v10 = [v8 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = sub_100013ABC();
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v20 = [v6 uniqueIdentifier];
    int v22 = 138543362;
    id v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "BAContentRequestTelemetry informed about unknown download with identifier %{public}@", (uint8_t *)&v22, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  id v11 = [(BAContentRequestTelemetry *)self remainingDownloadUniqueIdentifiers];
  id v12 = [v6 uniqueIdentifier];
  [v11 removeObject:v12];

  os_unfair_lock_lock((os_unfair_lock_t)[v6 downloadLock]);
  id v13 = [v6 necessity];
  uint64_t v14 = [v6 downloadedFileSize];
  os_unfair_lock_unlock((os_unfair_lock_t)[v6 downloadLock]);
  if (self->_invalid || !(v7 | v14))
  {
    self->_invalid = 1;
    v20 = sub_100013ABC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000386E4((uint64_t)v6, v20);
    }
    goto LABEL_11;
  }
  if (v7)
  {
    ++self->_failureCount;
    uint64_t v15 = [(id)v7 domain];
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, [(id)v7 code], 0);

    uint64_t v17 = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
    v18 = [v17 objectForKey:v16];

    if (v18)
    {
      +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 intValue] + 1);
      uint64_t v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v19 = &off_10005FED8;
    }
    id v21 = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
    [v21 setObject:v19 forKeyedSubscript:v16];
  }
  else
  {
    ++self->_successCount;
    v16 = [(BAContentRequestTelemetry *)self fileSizes];
    [v16 addObject:v14];
  }

  if (v13 == (id)1) {
    ++self->_essentialAssetsCount;
  }
  else {
    ++self->_optionalAssetsCount;
  }
LABEL_12:
}

- (BOOL)allDownloadsCompleted
{
  v2 = [(BAContentRequestTelemetry *)self remainingDownloadUniqueIdentifiers];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)eventName
{
  return @"com.apple.BackgroundAssets.ContentRequestV2";
}

- (id)payload
{
  if (self->_invalid)
  {
    v2 = &__NSDictionary0__struct;
  }
  else
  {
    v4 = [(BAContentRequestTelemetry *)self eventPayload];

    if (!v4)
    {
      v5 = [(BAContentRequestTelemetry *)self _formatMostFrequentError];
      id v6 = [(BAContentRequestTelemetry *)self fileSizes];
      [v6 sortUsingSelector:"compare:"];

      unint64_t v7 = [(BAContentRequestTelemetry *)self fileSizes];
      v8 = [(BAContentRequestTelemetry *)self _median:v7];

      v9 = [(BAContentRequestTelemetry *)self fileSizes];
      unsigned __int8 v10 = [(BAContentRequestTelemetry *)self _average:v9];

      id v23 = sub_10000D158(self->_installSource);
      v24[0] = @"AssetCount";
      int v22 = +[NSNumber numberWithInt:(self->_optionalAssetsCount + self->_essentialAssetsCount)];
      v25[0] = v22;
      v24[1] = @"SuccessCount";
      id v21 = +[NSNumber numberWithInt:self->_successCount];
      v25[1] = v21;
      v24[2] = @"FailureCount";
      v20 = +[NSNumber numberWithInt:self->_failureCount];
      v25[2] = v20;
      v24[3] = @"EssentialAssetsCount";
      uint64_t v19 = +[NSNumber numberWithInt:self->_essentialAssetsCount];
      v25[3] = v19;
      v24[4] = @"OptionalAssetsCount";
      id v11 = +[NSNumber numberWithInt:self->_optionalAssetsCount];
      v25[4] = v11;
      v24[5] = @"MedFileSize";
      id v12 = v8;
      if (!v8)
      {
        id v12 = +[NSNull null];
      }
      v25[5] = v12;
      v24[6] = @"AvgFileSize";
      id v13 = v10;
      if (!v10)
      {
        id v13 = +[NSNull null];
      }
      v25[6] = v13;
      v24[7] = @"Type";
      uint64_t v14 = sub_10002CEBC(self->_contentRequest);
      v25[7] = v14;
      v24[8] = @"MostFrequentError";
      uint64_t v15 = v5;
      if (!v5)
      {
        uint64_t v15 = +[NSNull null];
      }
      applicationIdentifier = self->_applicationIdentifier;
      v25[8] = v15;
      v25[9] = applicationIdentifier;
      v24[9] = @"BundleIdentifier";
      v24[10] = @"InstallSource";
      v25[10] = v23;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:11];
      [(BAContentRequestTelemetry *)self setEventPayload:v17];

      if (!v5) {
      if (!v10)
      }

      if (!v8) {
    }
      }
    v2 = [(BAContentRequestTelemetry *)self eventPayload];
  }

  return v2;
}

- (id)formatError:(id)a3 withCount:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 domain];
  id v7 = [v5 code];

  v8 = +[NSString stringWithFormat:@"[%@:%ld:%lu]", v6, v7, a4];

  return v8;
}

- (id)description
{
  uint64_t failureCount = self->_failureCount;
  uint64_t successCount = self->_successCount;
  uint64_t essentialAssetsCount = self->_essentialAssetsCount;
  uint64_t optionalAssetsCount = self->_optionalAssetsCount;
  id v7 = [(BAContentRequestTelemetry *)self fileSizes];
  v8 = [v7 componentsJoinedByString:@","];
  v9 = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
  unsigned __int8 v10 = +[NSString stringWithFormat:@"Successes=%d, failures=%d, essentials=%d, optionals=%d, sizes=%@, errors=%@", successCount, failureCount, essentialAssetsCount, optionalAssetsCount, v8, v9];

  return v10;
}

- (id)_median:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 count];
  if (v4)
  {
    unint64_t v5 = v4 >> 1;
    if (v4)
    {
      id v12 = [v3 objectAtIndex:v5];
      id v10 = [v12 unsignedLongLongValue];
    }
    else
    {
      id v6 = [v3 objectAtIndex:v5 - 1];
      id v7 = [v6 unsignedLongLongValue];

      v8 = [v3 objectAtIndex:v5];
      id v9 = [v8 unsignedLongLongValue];

      id v10 = (id)(((unint64_t)v7 + (unint64_t)v9) >> 1);
    }
    id v11 = +[NSNumber numberWithUnsignedInteger:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_average:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      unint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += (unint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedLongLongValue:v12];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
    }

    id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7 / (unint64_t)[v4 count]);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_formatMostFrequentError
{
  id v3 = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
  id v4 = [v3 count];

  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
    id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      id v6 = v5;
      unint64_t v7 = 0;
      id v8 = 0;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v12 = [(BAContentRequestTelemetry *)self uniqueErrorCounts];
          long long v13 = [v12 objectForKeyedSubscript:v11];
          id v14 = [v13 unsignedLongLongValue];

          if (v14 > v8)
          {
            id v15 = v11;

            unint64_t v7 = v15;
            id v8 = v14;
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v7 = 0;
      id v8 = 0;
    }

    v16 = [(BAContentRequestTelemetry *)self formatError:v7 withCount:v8];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSMutableArray)fileSizes
{
  return self->_fileSizes;
}

- (void)setFileSizes:(id)a3
{
}

- (NSMutableDictionary)uniqueErrorCounts
{
  return self->_uniqueErrorCounts;
}

- (void)setUniqueErrorCounts:(id)a3
{
}

- (NSMutableSet)remainingDownloadUniqueIdentifiers
{
  return self->_remainingDownloadUniqueIdentifiers;
}

- (void)setRemainingDownloadUniqueIdentifiers:(id)a3
{
}

- (NSDictionary)eventPayload
{
  return self->_eventPayload;
}

- (void)setEventPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_remainingDownloadUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_uniqueErrorCounts, 0);
  objc_storeStrong((id *)&self->_fileSizes, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end