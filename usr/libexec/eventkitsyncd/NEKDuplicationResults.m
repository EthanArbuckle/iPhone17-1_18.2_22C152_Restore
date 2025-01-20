@interface NEKDuplicationResults
+ (id)duplicateResultsFromCheck:(id)a3 withDiagnosticTimestamp:(double)a4;
- (BOOL)hasDuplicates;
- (NEKDuplicationResults)initWithDuplicatedSources:(id)a3 duplicatedCalendars:(id)a4 firstFoundKey:(id)a5;
- (NSArray)duplicatedCalendars;
- (NSArray)duplicatedSources;
- (id)syncReport;
- (void)setDuplicatedCalendars:(id)a3;
- (void)setDuplicatedSources:(id)a3;
@end

@implementation NEKDuplicationResults

- (NEKDuplicationResults)initWithDuplicatedSources:(id)a3 duplicatedCalendars:(id)a4 firstFoundKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NEKDuplicationResults;
  v11 = [(NEKDiagnosticResult *)&v14 initWithFirstFoundKey:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_duplicatedSources, a3);
    objc_storeStrong((id *)&v12->_duplicatedCalendars, a4);
  }

  return v12;
}

- (BOOL)hasDuplicates
{
  return [(NSArray *)self->_duplicatedSources count]
      || [(NSArray *)self->_duplicatedCalendars count] != 0;
}

+ (id)duplicateResultsFromCheck:(id)a3 withDiagnosticTimestamp:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSMutableArray);
  v7 = [v5 sources];
  id v8 = [v6 initWithCapacity:[v7 count]];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v5 sources];
  id v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) externalId];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc((Class)NSMutableArray);
  v16 = [v5 calendars];
  id v17 = [v15 initWithCapacity:[v16 count]];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v18 = [v5 calendars];
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) externalId];
        [v17 addObject:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  v24 = [[NEKDuplicationResults alloc] initWithDuplicatedSources:v8 duplicatedCalendars:v17 firstFoundKey:@"duplicatesFirstFound"];
  [(NEKDiagnosticResult *)v24 setLastDiagnosticTimestamp:a4];
  [(NEKDiagnosticResult *)v24 updateFirstFoundToNotSetOrNewTimestamp:[(NEKDuplicationResults *)v24 hasDuplicates] ifConditionMet:a4];
  -[NEKDiagnosticResult setFirstFoundTimestamp:](v24, "setFirstFoundTimestamp:");

  return v24;
}

- (id)syncReport
{
  v3 = [(NEKDiagnosticResult *)self formattedLastDiagnosticDate];
  v4 = [(NEKDiagnosticResult *)self formattedFirstFoundDate];
  if ([(NEKDuplicationResults *)self hasDuplicates])
  {
    v14[0] = @"First Found";
    v14[1] = @"Last Checked";
    v14[2] = @"Results";
    duplicatedCalendars = self->_duplicatedCalendars;
    v12[0] = @"Calendars";
    v12[1] = @"Sources";
    duplicatedSources = self->_duplicatedSources;
    v15[0] = v4;
    v15[1] = v3;
    v13[0] = duplicatedCalendars;
    v13[1] = duplicatedSources;
    v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v15[2] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  }
  else
  {
    v10[0] = @"First Found";
    v10[1] = @"Last Checked";
    v11[0] = @"N/A";
    v11[1] = v3;
    v10[2] = @"Results";
    v11[2] = @"N/A";
    id v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  }

  return v8;
}

- (NSArray)duplicatedSources
{
  return self->_duplicatedSources;
}

- (void)setDuplicatedSources:(id)a3
{
}

- (NSArray)duplicatedCalendars
{
  return self->_duplicatedCalendars;
}

- (void)setDuplicatedCalendars:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicatedCalendars, 0);

  objc_storeStrong((id *)&self->_duplicatedSources, 0);
}

@end