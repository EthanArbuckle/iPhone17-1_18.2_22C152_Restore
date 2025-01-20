@interface BKLibraryImportStatusController
+ (id)sharedController;
- (BKLibraryImportStatusController)init;
- (BUCoalescingCallBlock)coalescedStatusChange;
- (BUCoalescingCallBlock)coalescedZeroing;
- (int64_t)actualCompletedImportOperations;
- (int64_t)actualFailedImportOperations;
- (int64_t)actualTotalImportOperations;
- (int64_t)completedImportOperations;
- (int64_t)failedImportOperations;
- (int64_t)totalImportOperations;
- (int64_t)totalImportOperationsProcessed;
- (void)completeImportOperation;
- (void)failImportOperation;
- (void)setActualCompletedImportOperations:(int64_t)a3;
- (void)setActualFailedImportOperations:(int64_t)a3;
- (void)setActualTotalImportOperations:(int64_t)a3;
- (void)setCoalescedStatusChange:(id)a3;
- (void)setCoalescedZeroing:(id)a3;
- (void)setCompletedImportOperations:(int64_t)a3;
- (void)setFailedImportOperations:(int64_t)a3;
- (void)setTotalImportOperations:(int64_t)a3;
- (void)setTotalImportOperationsProcessed:(int64_t)a3;
- (void)startImportOperation;
@end

@implementation BKLibraryImportStatusController

+ (id)sharedController
{
  if (qword_EE6B8 != -1) {
    dispatch_once(&qword_EE6B8, &stru_D3128);
  }
  v2 = (void *)qword_EE6C0;

  return v2;
}

- (BKLibraryImportStatusController)init
{
  v17.receiver = self;
  v17.super_class = (Class)BKLibraryImportStatusController;
  v2 = [(BKLibraryImportStatusController *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iBooks.BKLibraryImportStatusController", 0);
    iVarQueue = v2->_iVarQueue;
    v2->_iVarQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    id v5 = objc_alloc((Class)BUCoalescingCallBlock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_5D594;
    v14[3] = &unk_D16D8;
    objc_copyWeak(&v15, &location);
    v6 = (BUCoalescingCallBlock *)[v5 initWithNotifyBlock:v14 blockDescription:@"BKLibraryImportStatusController statusChange"];
    coalescedStatusChange = v2->_coalescedStatusChange;
    v2->_coalescedStatusChange = v6;

    [(BUCoalescingCallBlock *)v2->_coalescedStatusChange setCoalescingDelay:1.0];
    [(BUCoalescingCallBlock *)v2->_coalescedStatusChange setMaximumDelay:1.0];
    id v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_5D728;
    v12[3] = &unk_D16D8;
    objc_copyWeak(&v13, &location);
    v9 = (BUCoalescingCallBlock *)[v8 initWithNotifyBlock:v12 blockDescription:@"BKLibraryImportStatusController zeroing"];
    coalescedZeroing = v2->_coalescedZeroing;
    v2->_coalescedZeroing = v9;

    [(BUCoalescingCallBlock *)v2->_coalescedZeroing setCoalescingDelay:30.0];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)startImportOperation
{
  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5D980;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = [(BKLibraryImportStatusController *)self coalescedStatusChange];
  [v4 signalWithCompletion:&stru_D3168];
}

- (void)completeImportOperation
{
  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5DA60;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = [(BKLibraryImportStatusController *)self coalescedStatusChange];
  [v4 signalWithCompletion:&stru_D3188];
}

- (void)failImportOperation
{
  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5DB40;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = [(BKLibraryImportStatusController *)self coalescedStatusChange];
  [v4 signalWithCompletion:&stru_D31A8];
}

- (int64_t)totalImportOperationsProcessed
{
  return self->_totalImportOperationsProcessed;
}

- (void)setTotalImportOperationsProcessed:(int64_t)a3
{
  self->_totalImportOperationsProcessed = a3;
}

- (int64_t)totalImportOperations
{
  return self->_totalImportOperations;
}

- (void)setTotalImportOperations:(int64_t)a3
{
  self->_totalImportOperations = a3;
}

- (int64_t)completedImportOperations
{
  return self->_completedImportOperations;
}

- (void)setCompletedImportOperations:(int64_t)a3
{
  self->_completedImportOperations = a3;
}

- (int64_t)failedImportOperations
{
  return self->_failedImportOperations;
}

- (void)setFailedImportOperations:(int64_t)a3
{
  self->_failedImportOperations = a3;
}

- (int64_t)actualTotalImportOperations
{
  return self->_actualTotalImportOperations;
}

- (void)setActualTotalImportOperations:(int64_t)a3
{
  self->_actualTotalImportOperations = a3;
}

- (int64_t)actualCompletedImportOperations
{
  return self->_actualCompletedImportOperations;
}

- (void)setActualCompletedImportOperations:(int64_t)a3
{
  self->_actualCompletedImportOperations = a3;
}

- (int64_t)actualFailedImportOperations
{
  return self->_actualFailedImportOperations;
}

- (void)setActualFailedImportOperations:(int64_t)a3
{
  self->_actualFailedImportOperations = a3;
}

- (BUCoalescingCallBlock)coalescedStatusChange
{
  return self->_coalescedStatusChange;
}

- (void)setCoalescedStatusChange:(id)a3
{
}

- (BUCoalescingCallBlock)coalescedZeroing
{
  return self->_coalescedZeroing;
}

- (void)setCoalescedZeroing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedZeroing, 0);
  objc_storeStrong((id *)&self->_coalescedStatusChange, 0);

  objc_storeStrong((id *)&self->_iVarQueue, 0);
}

@end