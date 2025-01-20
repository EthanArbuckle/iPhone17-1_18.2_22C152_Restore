@interface NEKDriftResults
+ (id)driftResultsForCache:(id)a3 withDiagnosticTimestamp:(double)a4;
- (BOOL)hasDrift;
- (NEKDriftResults)initWithFirstFoundKey:(id)a3;
- (NSArray)phoneOnlyOccurrences;
- (NSArray)watchOnlyOccurrences;
- (id)_createPhoneSackForWatchCache:(id)a3;
- (id)_sortByDateAndUuidForArray:(id)a3;
- (id)syncReport;
- (int64_t)totalDrift;
- (void)setPhoneOnlyOccurrences:(id)a3;
- (void)setWatchOnlyOccurrences:(id)a3;
@end

@implementation NEKDriftResults

- (NEKDriftResults)initWithFirstFoundKey:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NEKDriftResults;
  v3 = [(NEKDiagnosticResult *)&v9 initWithFirstFoundKey:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    watchOnlyOccurrences = v3->_watchOnlyOccurrences;
    v3->_watchOnlyOccurrences = (NSArray *)v4;

    uint64_t v6 = objc_opt_new();
    phoneOnlyOccurrences = v3->_phoneOnlyOccurrences;
    v3->_phoneOnlyOccurrences = (NSArray *)v6;
  }
  return v3;
}

- (int64_t)totalDrift
{
  NSUInteger v3 = [(NSArray *)self->_phoneOnlyOccurrences count];
  return [(NSArray *)self->_watchOnlyOccurrences count] + v3;
}

- (BOOL)hasDrift
{
  return [(NEKDriftResults *)self totalDrift] > 0;
}

+ (id)driftResultsForCache:(id)a3 withDiagnosticTimestamp:(double)a4
{
  id v5 = a3;
  v31 = [[NEKDriftResults alloc] initWithFirstFoundKey:@"driftFirstFound"];
  uint64_t v6 = [(NEKDriftResults *)v31 _createPhoneSackForWatchCache:v5];
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  v8 = +[NSCalendar currentCalendar];
  [v7 setCalendar:v8];

  v33 = v7;
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZZZ"];
  v34 = objc_opt_new();
  v30 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v32 = v5;
  objc_super v9 = [v5 items];
  id v10 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (![v6 removeObject:v14])
        {
          [v14 date];
          v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          v16 = [v33 stringFromDate:v15];
          v17 = [v14 uuid];
          v18 = +[NSString stringWithFormat:@"%@ | %@", v16, v17];
          [v34 addObject:v18];

          v19 = *(NSObject **)(qword_1000C6CA8 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = [v14 uuid];
            [v14 date];
            *(_DWORD *)buf = 138543618;
            v43 = v21;
            __int16 v44 = 2048;
            uint64_t v45 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Analytics detected excess calendar item on watch, identifier: %{public}@, timestamp: %9.0f", buf, 0x16u);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v11);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10003BA3C;
  v35[3] = &unk_1000A9850;
  id v23 = v33;
  id v36 = v23;
  id v24 = v30;
  id v37 = v24;
  [v6 forEachUnique:v35];
  v25 = [(NEKDriftResults *)v31 _sortByDateAndUuidForArray:v34];
  [(NEKDriftResults *)v31 setWatchOnlyOccurrences:v25];

  v26 = [(NEKDriftResults *)v31 _sortByDateAndUuidForArray:v24];
  [(NEKDriftResults *)v31 setPhoneOnlyOccurrences:v26];

  v27 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_10006EC6C(v27, v31);
  }
  v28 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_10006EBD4(v28, v31);
  }
  [(NEKDiagnosticResult *)v31 setLastDiagnosticTimestamp:a4];
  [(NEKDiagnosticResult *)v31 updateFirstFoundToNotSetOrNewTimestamp:[(NEKDriftResults *)v31 hasDrift] ifConditionMet:a4];
  -[NEKDiagnosticResult setFirstFoundTimestamp:](v31, "setFirstFoundTimestamp:");

  return v31;
}

- (id)_createPhoneSackForWatchCache:(id)a3
{
  id v3 = a3;
  [v3 start];
  uint64_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v3 end];
  id v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v6 = objc_alloc_init(NEKOccurrenceCacheDumper);
  id v7 = [(NEKOccurrenceCacheDumper *)v6 runFrom:v4 to:v5];
  v8 = objc_alloc_init(NEKSack);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v9 = [v7 items];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NEKSack *)v8 addObject:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_sortByDateAndUuidForArray:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_1000A9890];
}

- (id)syncReport
{
  id v3 = [(NEKDiagnosticResult *)self formattedLastDiagnosticDate];
  uint64_t v4 = [(NEKDiagnosticResult *)self formattedFirstFoundDate];
  if ([(NEKDriftResults *)self hasDrift])
  {
    v14[0] = @"First Found";
    v14[1] = @"Last Checked";
    v14[2] = @"Results";
    watchOnlyOccurrences = self->_watchOnlyOccurrences;
    v12[0] = @"Watch Only";
    v12[1] = @"Phone Only";
    phoneOnlyOccurrences = self->_phoneOnlyOccurrences;
    v15[0] = v4;
    v15[1] = v3;
    v13[0] = watchOnlyOccurrences;
    v13[1] = phoneOnlyOccurrences;
    id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v15[2] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  }
  else
  {
    v10[0] = @"First Found";
    v10[1] = @"Last Checked";
    v11[0] = @"N/A";
    v11[1] = v3;
    v10[2] = @"Results";
    v11[2] = @"N/A";
    v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  }

  return v8;
}

- (NSArray)phoneOnlyOccurrences
{
  return self->_phoneOnlyOccurrences;
}

- (void)setPhoneOnlyOccurrences:(id)a3
{
}

- (NSArray)watchOnlyOccurrences
{
  return self->_watchOnlyOccurrences;
}

- (void)setWatchOnlyOccurrences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchOnlyOccurrences, 0);

  objc_storeStrong((id *)&self->_phoneOnlyOccurrences, 0);
}

@end