@interface PGShareBackSource
- (BOOL)prepareSourceWithGraph:(id)a3;
- (OS_os_log)loggingConnection;
- (PGShareBackSource)initWithLoggingConnection:(id)a3;
- (id)prepareAndReturnSuggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4;
@end

@implementation PGShareBackSource

- (void).cxx_destruct
{
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (id)prepareAndReturnSuggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PGShareBackSource *)self prepareSourceWithGraph:v9])
  {
    v10 = +[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:v8 withTimeIntervalPadding:7200.0];
    v11 = [v9 momentNodesOverlappingLocalDateInterval:v10];
    v12 = [(PGShareBackSource *)self suggesterResultsForInputs:v8 momentNodes:v11 inGraph:v9 error:a5];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v13 = *MEMORY[0x1E4F1C3B8];
  v14 = NSString;
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = NSStringFromSelector(a2);
  v18 = [v14 stringWithFormat:@"%@ must implement %@", v16, v17];
  v19 = (void *)[v12 initWithName:v13 reason:v18 userInfo:0];

  objc_exception_throw(v19);
}

- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4
{
  return a3;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = NSStringFromSelector(a2);
  id v11 = [v7 stringWithFormat:@"%@ must implement %@", v9, v10];
  id v12 = (void *)[v5 initWithName:v6 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (PGShareBackSource)initWithLoggingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGShareBackSource;
  uint64_t v6 = [(PGShareBackSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_loggingConnection, a3);
  }

  return v7;
}

@end