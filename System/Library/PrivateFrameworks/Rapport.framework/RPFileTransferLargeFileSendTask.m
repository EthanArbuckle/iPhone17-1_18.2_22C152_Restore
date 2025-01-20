@interface RPFileTransferLargeFileSendTask
- (BOOL)needsRetry;
- (OS_dispatch_queue)queue;
- (RPFileTransferItem)fileItem;
- (int)fileFD;
- (int)outstandingSends;
- (unint64_t)fileOffset;
- (unint64_t)remainingSize;
- (unint64_t)taskID;
- (void)setFileFD:(int)a3;
- (void)setFileItem:(id)a3;
- (void)setFileOffset:(unint64_t)a3;
- (void)setNeedsRetry:(BOOL)a3;
- (void)setOutstandingSends:(int)a3;
- (void)setQueue:(id)a3;
- (void)setRemainingSize:(unint64_t)a3;
- (void)setTaskID:(unint64_t)a3;
@end

@implementation RPFileTransferLargeFileSendTask

- (int)fileFD
{
  return self->_fileFD;
}

- (void)setFileFD:(int)a3
{
  self->_fileFD = a3;
}

- (unint64_t)fileOffset
{
  return self->_fileOffset;
}

- (void)setFileOffset:(unint64_t)a3
{
  self->_fileOffset = a3;
}

- (RPFileTransferItem)fileItem
{
  return self->_fileItem;
}

- (void)setFileItem:(id)a3
{
}

- (BOOL)needsRetry
{
  return self->_needsRetry;
}

- (void)setNeedsRetry:(BOOL)a3
{
  self->_needsRetry = a3;
}

- (int)outstandingSends
{
  return self->_outstandingSends;
}

- (void)setOutstandingSends:(int)a3
{
  self->_outstandingSends = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)remainingSize
{
  return self->_remainingSize;
}

- (void)setRemainingSize:(unint64_t)a3
{
  self->_remainingSize = a3;
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