@interface PLBackgroundJobWorkerCriteriaTuple
- (BOOL)isEqual:(id)a3;
- (PLBackgroundJobCriteria)criteria;
- (PLBackgroundJobWorker)worker;
- (PLBackgroundJobWorkerCriteriaTuple)initWithWorker:(id)a3 withCriteria:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation PLBackgroundJobWorkerCriteriaTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_worker, 0);
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (PLBackgroundJobWorker)worker
{
  return self->_worker;
}

- (unint64_t)hash
{
  v3 = [(PLBackgroundJobWorkerCriteriaTuple *)self worker];
  v4 = [v3 workerDetailedName];
  uint64_t v5 = [v4 hash];
  v6 = [(PLBackgroundJobWorkerCriteriaTuple *)self criteria];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PLBackgroundJobWorkerCriteriaTuple *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLBackgroundJobWorkerCriteriaTuple;
    if ([(PLBackgroundJobWorkerCriteriaTuple *)&v13 isEqual:v4])
    {
      uint64_t v5 = [(PLBackgroundJobWorkerCriteriaTuple *)self worker];
      v6 = [v5 workerDetailedName];
      unint64_t v7 = [(PLBackgroundJobWorkerCriteriaTuple *)v4 worker];
      v8 = [v7 workerDetailedName];
      if ([v6 isEqualToString:v8])
      {
        v9 = [(PLBackgroundJobWorkerCriteriaTuple *)self criteria];
        v10 = [(PLBackgroundJobWorkerCriteriaTuple *)v4 criteria];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLBackgroundJobCriteria *)self->_criteria shortCode];
  uint64_t v5 = [(PLBackgroundJobWorker *)self->_worker workerDetailedName];
  v6 = [v3 stringWithFormat:@"[%@] - %@", v4, v5];

  return v6;
}

- (PLBackgroundJobWorkerCriteriaTuple)initWithWorker:(id)a3 withCriteria:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLBackgroundJobWorkerCriteriaTuple;
  v9 = [(PLBackgroundJobWorkerCriteriaTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_worker, a3);
    objc_storeStrong((id *)&v10->_criteria, a4);
  }

  return v10;
}

@end