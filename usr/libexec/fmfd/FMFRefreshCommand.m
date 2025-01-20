@interface FMFRefreshCommand
- (BOOL)isShallowLocate;
- (NSArray)coalescedAppContexts;
- (NSArray)selectedHandles;
- (NSArray)tapMessages;
- (NSCountedSet)skippedReasons;
- (NSString)type;
- (id)clientContext;
- (id)pathSuffix;
- (id)tapContext;
- (int64_t)reason;
- (void)setCoalescedAppContexts:(id)a3;
- (void)setIsShallowLocate:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setSelectedHandles:(id)a3;
- (void)setSkippedReasons:(id)a3;
- (void)setTapMessages:(id)a3;
- (void)setType:(id)a3;
@end

@implementation FMFRefreshCommand

- (id)pathSuffix
{
  v3 = [(FMFRefreshCommand *)self selectedHandles];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [@"selFriend/" stringByAppendingString:@"refreshClient"];
    unsigned int v6 = [(FMFRefreshCommand *)self isShallowLocate];
    CFStringRef v7 = @"deep";
    if (v6) {
      CFStringRef v7 = @"shallow";
    }
    v8 = +[NSString stringWithFormat:@"%@/", v7];
    v9 = [v8 stringByAppendingString:v5];
  }
  else
  {
    v9 = @"refreshClient";
  }
  v10 = +[FMFCommandManager sharedInstance];
  v11 = [v10 stringForReasonCode:-[FMFRefreshCommand reason](self, "reason")];
  v12 = +[NSString stringWithFormat:@"%@/", v11];
  v13 = [v12 stringByAppendingString:v9];

  return v13;
}

- (id)clientContext
{
  v2 = self;
  v57.receiver = self;
  v57.super_class = (Class)FMFRefreshCommand;
  v47 = [(FMFBaseCmd *)&v57 clientContext];
  id v3 = [v47 mutableCopy];
  id v4 = [(FMFRefreshCommand *)v2 selectedHandles];
  id v5 = [v4 count];

  v48 = v2;
  if (v5)
  {
    unsigned int v6 = +[NSNumber numberWithBool:[(FMFRefreshCommand *)v2 isShallowLocate]];
    CFStringRef v7 = v3;
    [v3 setObject:v6 forKey:@"shallowLocatesOnly"];

    v8 = +[NSMutableDictionary dictionary];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v9 = [(FMFRefreshCommand *)v2 selectedHandles];
    id v10 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v54;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v15 = [v14 trackingTimestamp];
          if (v15)
          {
            v16 = (void *)v15;
            v17 = [v14 identifier];

            if (v17)
            {
              v18 = [v14 trackingTimestamp];
              v19 = [v14 identifier];
              [v8 setObject:v18 forKey:v19];
            }
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v11);
    }

    id v3 = v7;
    [v7 setObject:v8 forKey:@"selectedHandlesMap"];

    v2 = v48;
  }
  v20 = +[NSNumber numberWithInteger:[(FMFRefreshCommand *)v2 reason]];
  v21 = +[FMFCommandManager sharedInstance];
  v22 = [v21 stringForReasonCode:-[FMFRefreshCommand reason](v2, "reason")];
  v23 = +[NSString stringWithFormat:@"%@ - %@", v20, v22];
  [v3 setObject:v23 forKey:@"reason"];

  v24 = [(FMFRefreshCommand *)v2 skippedReasons];
  id v25 = [v24 count];

  if (v25)
  {
    v46 = v3;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v26 = [(FMFRefreshCommand *)v2 skippedReasons];
    id v27 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v50;
      v31 = &stru_1000A3938;
      do
      {
        v32 = 0;
        v33 = v31;
        do
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * (void)v32);
          v35 = [(FMFRefreshCommand *)v2 skippedReasons];
          id v36 = [v35 countForObject:v34];

          v29 += (uint64_t)v36;
          v37 = +[NSString stringWithFormat:@"%@ (%lu) ", v34, v36];
          v31 = [(__CFString *)v33 stringByAppendingString:v37];

          v2 = v48;
          v32 = (char *)v32 + 1;
          v33 = v31;
        }
        while (v28 != v32);
        id v28 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v28);
    }
    else
    {
      uint64_t v29 = 0;
      v31 = &stru_1000A3938;
    }

    v38 = +[NSString stringWithFormat:@"(Total: %lu), {%@}", v29, v31];
    id v3 = v46;
    [v46 setObject:v38 forKey:@"skippedRefreshes"];
  }
  v39 = [(FMFRefreshCommand *)v2 type];

  if (v39)
  {
    v40 = [(FMFRefreshCommand *)v2 type];
    [v3 setObject:v40 forKey:@"type"];
  }
  v41 = [(FMFRefreshCommand *)v2 coalescedAppContexts];
  id v42 = [v41 count];

  if (v42)
  {
    v43 = [(FMFRefreshCommand *)v2 coalescedAppContexts];
    v44 = [v43 componentsJoinedByString:@","];

    [v3 setObject:v44 forKey:@"contextApp"];
  }

  return v3;
}

- (id)tapContext
{
  v2 = +[FMFDataManager sharedInstance];
  id v3 = [v2 cachedTapMessages];

  return v3;
}

- (NSArray)selectedHandles
{
  return self->_selectedHandles;
}

- (void)setSelectedHandles:(id)a3
{
}

- (BOOL)isShallowLocate
{
  return self->_isShallowLocate;
}

- (void)setIsShallowLocate:(BOOL)a3
{
  self->_isShallowLocate = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSCountedSet)skippedReasons
{
  return self->_skippedReasons;
}

- (void)setSkippedReasons:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSArray)tapMessages
{
  return self->_tapMessages;
}

- (void)setTapMessages:(id)a3
{
}

- (NSArray)coalescedAppContexts
{
  return self->_coalescedAppContexts;
}

- (void)setCoalescedAppContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedAppContexts, 0);
  objc_storeStrong((id *)&self->_tapMessages, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_skippedReasons, 0);

  objc_storeStrong((id *)&self->_selectedHandles, 0);
}

@end