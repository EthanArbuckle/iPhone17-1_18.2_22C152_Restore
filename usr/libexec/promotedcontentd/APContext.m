@interface APContext
- (id)contextJSONForRequest:(id)a3 andPlacementType:(int64_t)a4;
- (unint64_t)adPosition;
@end

@implementation APContext

- (id)contextJSONForRequest:(id)a3 andPlacementType:(int64_t)a4
{
  id v6 = a3;
  v7 = [[APContextTransformer alloc] initWithContext:self contentIdentifier:v6 placementType:a4];

  v8 = [(APContextTransformer *)v7 transformedContext];
  v9 = (void *)APLegacyNewsContextKey;
  v10 = [v8 jsonStringWithOptions:0];
  v11 = [v9 stringByAppendingString:v10];

  return v11;
}

- (unint64_t)adPosition
{
  v3 = [(APContext *)self supplementalContext];

  if (!v3)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Missing supplemental context.", (uint8_t *)&v12, 2u);
    }
    goto LABEL_11;
  }
  v4 = [(APContext *)self supplementalContext];
  v5 = [v4 objectForKey:APSupplementalContextPlacementKey];

  if (![v5 length])
  {
    v7 = APLogForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

LABEL_11:
      unint64_t v6 = 0;
      goto LABEL_12;
    }
    LOWORD(v12) = 0;
    v8 = "Can't find 'header.placement' in supplemental context.";
    v9 = v7;
    uint32_t v10 = 2;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    goto LABEL_10;
  }
  if (([v5 isEqualToString:APSupplementalContextInFeedKey] & 1) == 0)
  {
    if ([v5 isEqualToString:APSupplementalContextBetweenArticleKey])
    {
      unint64_t v6 = 3;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:APSupplementalContextInArticleKey])
    {
      unint64_t v6 = 2;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:APSupplementalContextVideoInArticleKey])
    {
      unint64_t v6 = 4;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:APSupplementalContextNativeInFeedKey])
    {
      unint64_t v6 = 5;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:APSupplementalContextNativeInArticleKey])
    {
      unint64_t v6 = 6;
      goto LABEL_12;
    }
    if ([v5 isEqualToString:APSupplementalContextVideoInFeedKey])
    {
      unint64_t v6 = 7;
      goto LABEL_12;
    }
    v7 = APLogForCategory();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v12 = 138543362;
    v13 = v5;
    v8 = "Unknown 'header.placement' value: %{public}@";
    v9 = v7;
    uint32_t v10 = 12;
    goto LABEL_9;
  }
  unint64_t v6 = 1;
LABEL_12:

  return v6;
}

@end