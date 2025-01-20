@interface ICSharedListeningConnectionReport
- (ICSharedListeningConnectionReport)init;
- (NSMapTable)allEvents;
- (NSMutableArray)topLevelEvents;
- (NSString)formattedReport;
- (NSString)groupSessionIdentifier;
- (NSString)sharedListeningSessionIdentifier;
- (id)analyticsPayload;
- (void)_addEvents:(id)a3 toReportString:(id)a4 eventLevel:(int64_t)a5;
- (void)endEvent:(id)a3;
- (void)endEvent:(id)a3 withError:(id)a4;
- (void)setAllEvents:(id)a3;
- (void)setGroupSessionIdentifier:(id)a3;
- (void)setSharedListeningSessionIdentifier:(id)a3;
- (void)setTopLevelEvents:(id)a3;
- (void)startEvent:(id)a3;
- (void)startEvent:(id)a3 withParentEvent:(id)a4;
@end

@implementation ICSharedListeningConnectionReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEvents, 0);
  objc_storeStrong((id *)&self->_topLevelEvents, 0);
  objc_storeStrong((id *)&self->_groupSessionIdentifier, 0);

  objc_storeStrong((id *)&self->_sharedListeningSessionIdentifier, 0);
}

- (void)setAllEvents:(id)a3
{
}

- (NSMapTable)allEvents
{
  return self->_allEvents;
}

- (void)setTopLevelEvents:(id)a3
{
}

- (NSMutableArray)topLevelEvents
{
  return self->_topLevelEvents;
}

- (void)setGroupSessionIdentifier:(id)a3
{
}

- (NSString)groupSessionIdentifier
{
  return self->_groupSessionIdentifier;
}

- (void)setSharedListeningSessionIdentifier:(id)a3
{
}

- (NSString)sharedListeningSessionIdentifier
{
  return self->_sharedListeningSessionIdentifier;
}

- (id)analyticsPayload
{
  return @"NO";
}

- (void)_addEvents:(id)a3 toReportString:(id)a4 eventLevel:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int64_t v12 = 4 * a5;
    int64_t v13 = a5 + 1;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        v17 = [&stru_1EF5F5C40 stringByPaddingToLength:v12 withString:@" " startingAtIndex:0];
        [v9 appendString:v17];

        v18 = [v16 name];
        [v16 duration];
        [v9 appendFormat:@"%@: %.3fs.", v18, v19];

        v20 = [v16 error];

        if (v20)
        {
          v21 = [v16 error];
          [v9 appendFormat:@" Error: %@.", v21];
        }
        [v9 appendString:@"\n"];
        v22 = [v16 subEvents];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          v24 = [v16 subEvents];
          [(ICSharedListeningConnectionReport *)self _addEvents:v24 toReportString:v9 eventLevel:v13];
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }
}

- (NSString)formattedReport
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 appendString:@"\n"];
  v4 = [&stru_1EF5F5C40 stringByPaddingToLength:30 withString:@"-" startingAtIndex:0];
  [v3 appendString:v4];

  [v3 appendString:@"\nShared Listening Report\n"];
  v5 = [&stru_1EF5F5C40 stringByPaddingToLength:30 withString:@"-" startingAtIndex:0];
  [v3 appendString:v5];

  [v3 appendString:@"\n"];
  v6 = [(ICSharedListeningConnectionReport *)self sharedListeningSessionIdentifier];
  [v3 appendFormat:@"Shared listening session ID: %@\n", v6];

  v7 = [(ICSharedListeningConnectionReport *)self groupSessionIdentifier];
  [v3 appendFormat:@"Group session ID: %@\n\n", v7];

  id v8 = [(ICSharedListeningConnectionReport *)self topLevelEvents];
  [(ICSharedListeningConnectionReport *)self _addEvents:v8 toReportString:v3 eventLevel:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [(ICSharedListeningConnectionReport *)self topLevelEvents];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) duration];
        double v13 = v13 + v15;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  objc_msgSend(v3, "appendFormat:", @"\nTotal time: %.3f seconds.\n", *(void *)&v13);
  v16 = [&stru_1EF5F5C40 stringByPaddingToLength:30 withString:@"-" startingAtIndex:0];
  [v3 appendString:v16];

  [v3 appendString:@"\n"];

  return (NSString *)v3;
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v6 date];
  id v9 = [(ICSharedListeningConnectionReport *)self allEvents];
  uint64_t v10 = [v9 objectForKey:v8];

  [v10 setEndDate:v11];
  [v10 setError:v7];
}

- (void)endEvent:(id)a3
{
}

- (void)startEvent:(id)a3 withParentEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [[ICSharedListeningConnectionReportEvent alloc] initWithName:v11];
  if (v6)
  {
    id v8 = [(ICSharedListeningConnectionReport *)self allEvents];
    id v9 = [v8 objectForKey:v6];
    [v9 addSubEvent:v7];
  }
  else
  {
    id v8 = [(ICSharedListeningConnectionReport *)self topLevelEvents];
    [v8 addObject:v7];
  }

  uint64_t v10 = [(ICSharedListeningConnectionReport *)self allEvents];
  [v10 setObject:v7 forKey:v11];
}

- (void)startEvent:(id)a3
{
}

- (ICSharedListeningConnectionReport)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICSharedListeningConnectionReport;
  v2 = [(ICSharedListeningConnectionReport *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    allEvents = v2->_allEvents;
    v2->_allEvents = (NSMapTable *)v3;

    uint64_t v5 = objc_opt_new();
    topLevelEvents = v2->_topLevelEvents;
    v2->_topLevelEvents = (NSMutableArray *)v5;
  }
  return v2;
}

@end