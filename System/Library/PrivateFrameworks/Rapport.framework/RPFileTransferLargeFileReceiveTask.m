@interface RPFileTransferLargeFileReceiveTask
- (OS_dispatch_queue)queue;
- (RPFileTransferItem)fileItem;
- (int)fileFD;
- (unint64_t)taskID;
- (void)setFileFD:(int)a3;
- (void)setFileItem:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskID:(unint64_t)a3;
@end

@implementation RPFileTransferLargeFileReceiveTask

- (int)fileFD
{
  return self->_fileFD;
}

- (void)setFileFD:(int)a3
{
  self->_fileFD = a3;
}

- (RPFileTransferItem)fileItem
{
  return self->_fileItem;
}

- (void)setFileItem:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)taskID
{
  return self->_taskID;
}

- (void)setTaskID:(unint64_t)a3
{
  self->_taskID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fileItem, 0);
}

@end