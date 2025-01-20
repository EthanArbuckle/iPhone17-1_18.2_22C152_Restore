@interface TRITaskRunResult
+ (id)resultWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (BOOL)reportResultToServer;
- (NSArray)nextTasks;
- (NSDate)earliestRetryDate;
- (TRITaskRunResult)initWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6;
- (id)copyWithReplacementEarliestRetryDate:(id)a3;
- (id)copyWithReplacementNextTasks:(id)a3;
- (id)copyWithReplacementReportResultToServer:(BOOL)a3;
- (id)copyWithReplacementRunStatus:(int)a3;
- (id)description;
- (int)runStatus;
- (unint64_t)hash;
@end

@implementation TRITaskRunResult

- (TRITaskRunResult)initWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6
{
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 693, @"Invalid parameter not satisfying: %@", @"nextTasks != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)TRITaskRunResult;
  v14 = [(TRITaskRunResult *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_runStatus = a3;
    v14->_reportResultToServer = a4;
    objc_storeStrong((id *)&v14->_nextTasks, a5);
    objc_storeStrong((id *)&v15->_earliestRetryDate, a6);
  }

  return v15;
}

+ (id)resultWithRunStatus:(int)a3 reportResultToServer:(BOOL)a4 nextTasks:(id)a5 earliestRetryDate:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = (void *)[objc_alloc((Class)a1) initWithRunStatus:v8 reportResultToServer:v7 nextTasks:v11 earliestRetryDate:v10];

  return v12;
}

- (id)copyWithReplacementRunStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL reportResultToServer = self->_reportResultToServer;
  nextTasks = self->_nextTasks;
  earliestRetryDate = self->_earliestRetryDate;
  return (id)[v5 initWithRunStatus:v3 reportResultToServer:reportResultToServer nextTasks:nextTasks earliestRetryDate:earliestRetryDate];
}

- (id)copyWithReplacementReportResultToServer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t runStatus = self->_runStatus;
  nextTasks = self->_nextTasks;
  earliestRetryDate = self->_earliestRetryDate;
  return (id)[v5 initWithRunStatus:runStatus reportResultToServer:v3 nextTasks:nextTasks earliestRetryDate:earliestRetryDate];
}

- (id)copyWithReplacementNextTasks:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRunStatus:self->_runStatus reportResultToServer:self->_reportResultToServer nextTasks:v4 earliestRetryDate:self->_earliestRetryDate];

  return v5;
}

- (id)copyWithReplacementEarliestRetryDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRunStatus:self->_runStatus reportResultToServer:self->_reportResultToServer nextTasks:self->_nextTasks earliestRetryDate:v4];

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  int runStatus = self->_runStatus;
  if (runStatus != [v4 runStatus]) {
    goto LABEL_10;
  }
  int reportResultToServer = self->_reportResultToServer;
  if (reportResultToServer != [v5 reportResultToServer]) {
    goto LABEL_10;
  }
  int v8 = self->_nextTasks != 0;
  v9 = [v5 nextTasks];
  int v10 = v9 == 0;

  if (v8 == v10) {
    goto LABEL_10;
  }
  nextTasks = self->_nextTasks;
  if (nextTasks)
  {
    id v12 = [v5 nextTasks];
    int v13 = [(NSArray *)nextTasks isEqual:v12];

    if (!v13) {
      goto LABEL_10;
    }
  }
  int v14 = self->_earliestRetryDate != 0;
  v15 = [v5 earliestRetryDate];
  int v16 = v15 == 0;

  if (v14 != v16)
  {
    earliestRetryDate = self->_earliestRetryDate;
    if (earliestRetryDate)
    {
      objc_super v18 = [v5 earliestRetryDate];
      char v19 = [(NSDate *)earliestRetryDate isEqual:v18];
    }
    else
    {
      char v19 = 1;
    }
  }
  else
  {
LABEL_10:
    char v19 = 0;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITaskRunResult *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITaskRunResult *)self isEqualToResult:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_reportResultToServer - (uint64_t)self->_runStatus + 32 * self->_runStatus;
  uint64_t v4 = [(NSArray *)self->_nextTasks hash] - v3 + 32 * v3;
  return [(NSDate *)self->_earliestRetryDate hash] - v4 + 32 * v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [NSNumber numberWithInt:self->_runStatus];
  id v5 = [NSNumber numberWithBool:self->_reportResultToServer];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRITaskRunResult | runStatus:%@ reportResultToServer:%@ nextTasks:%@ earliestRetryDate:%@>", v4, v5, self->_nextTasks, self->_earliestRetryDate];

  return v6;
}

- (int)runStatus
{
  return self->_runStatus;
}

- (BOOL)reportResultToServer
{
  return self->_reportResultToServer;
}

- (NSArray)nextTasks
{
  return self->_nextTasks;
}

- (NSDate)earliestRetryDate
{
  return self->_earliestRetryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestRetryDate, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end