@interface PLBackgroundJobWorkerPendingWorkItems
- (NSArray)workItemsNeedingProcessing;
- (PLBackgroundJobCriteria)criteria;
- (PLBackgroundJobWorkerPendingWorkItems)initWithCriteria:(id)a3 workItemsNeedingProcessing:(id)a4;
- (PLBackgroundJobWorkerPendingWorkItems)initWithZeroWorkItems;
@end

@implementation PLBackgroundJobWorkerPendingWorkItems

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_workItemsNeedingProcessing, 0);
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (NSArray)workItemsNeedingProcessing
{
  return self->_workItemsNeedingProcessing;
}

- (PLBackgroundJobWorkerPendingWorkItems)initWithZeroWorkItems
{
  return [(PLBackgroundJobWorkerPendingWorkItems *)self initWithCriteria:0 workItemsNeedingProcessing:0];
}

- (PLBackgroundJobWorkerPendingWorkItems)initWithCriteria:(id)a3 workItemsNeedingProcessing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobWorkerPendingWorkItems;
  v8 = [(PLBackgroundJobWorkerPendingWorkItems *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    criteria = v8->_criteria;
    v8->_criteria = (PLBackgroundJobCriteria *)v9;

    uint64_t v11 = [v7 copy];
    workItemsNeedingProcessing = v8->_workItemsNeedingProcessing;
    v8->_workItemsNeedingProcessing = (NSArray *)v11;
  }
  return v8;
}

@end