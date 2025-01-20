@interface MBChunkStoreProgressModel
- (BOOL)verify;
- (MBChunkStoreProgressModel)init;
- (double)maxProgress;
- (double)progress;
- (id)block;
- (void)_addBytesRemaining:(unint64_t)a3;
- (void)_subBytesRemaining:(unint64_t)a3;
- (void)abortedTransferringItem:(id)a3;
- (void)abortedTransferringItemWithSize:(unint64_t)a3;
- (void)dealloc;
- (void)ended;
- (void)failedToTransferItem:(id)a3;
- (void)retrying;
- (void)setBlock:(id)a3;
- (void)setMaxProgress:(double)a3;
- (void)setVerify:(BOOL)a3;
- (void)updatingProgress:(double)a3 forItem:(id)a4;
- (void)willTransferItemWithSize:(unint64_t)a3;
- (void)willTransferItemsWithSize:(unint64_t)a3 count:(unsigned int)a4;
@end

@implementation MBChunkStoreProgressModel

- (MBChunkStoreProgressModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)MBChunkStoreProgressModel;
  result = [(MBChunkStoreProgressModel *)&v3 init];
  if (result) {
    result->_maxProgress = 0.8;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBChunkStoreProgressModel;
  [(MBChunkStoreProgressModel *)&v3 dealloc];
}

- (void)_addBytesRemaining:(unint64_t)a3
{
  self->_bytesRemaining += a3;
  sub_1002424A4((uint64_t)self);
}

- (void)_subBytesRemaining:(unint64_t)a3
{
  unint64_t v3 = a3;
  unint64_t bytesRemaining = self->_bytesRemaining;
  if (bytesRemaining < a3)
  {
    if (self->_verify) {
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Bytes remaining underflow (%{bytes}llu)", a3 - self->_bytesRemaining));
    }
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v7 = v3 - self->_bytesRemaining;
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Chunk store progress model bytes remaining underflow (%{bytes}llu)", buf, 0xCu);
      _MBLog();
    }
    unint64_t bytesRemaining = self->_bytesRemaining;
    unint64_t v3 = bytesRemaining;
  }
  double maxProgress = self->_maxProgress;
  if (bytesRemaining) {
    double maxProgress = self->_progress + (maxProgress - self->_progress) * ((double)v3 / (double)bytesRemaining);
  }
  self->_progress = maxProgress;
  block = (void (**)(id))self->_block;
  if (block)
  {
    block[2](block);
    unint64_t bytesRemaining = self->_bytesRemaining;
  }
  self->_unint64_t bytesRemaining = bytesRemaining - v3;
  sub_1002424A4((uint64_t)self);
}

- (void)willTransferItemWithSize:(unint64_t)a3
{
}

- (void)willTransferItemsWithSize:(unint64_t)a3 count:(unsigned int)a4
{
}

- (void)updatingProgress:(double)a3 forItem:(id)a4
{
  [a4 progress];
  if (v7 != a3)
  {
    if (a3 >= 0.0)
    {
      if (a3 == 1.0) {
        [(MBChunkStoreProgressModel *)self _subBytesRemaining:0x2000];
      }
      [a4 progress];
      unint64_t v10 = (unint64_t)((a3 - v9) * (double)(unint64_t)[a4 size]);
      [(MBChunkStoreProgressModel *)self _subBytesRemaining:v10];
    }
    else
    {
      if (self->_verify) {
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Negative progress update (%0.3f)", *(void *)&a3));
      }
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v12 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Negative progress update (%0.3f)", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (void)failedToTransferItem:(id)a3
{
  [a3 progress];
  unint64_t v6 = (unint64_t)(v5 * (double)(unint64_t)[a3 size]);
  [(MBChunkStoreProgressModel *)self _addBytesRemaining:v6];
}

- (void)abortedTransferringItem:(id)a3
{
  id v4 = [a3 size];
  [(MBChunkStoreProgressModel *)self abortedTransferringItemWithSize:v4];
}

- (void)abortedTransferringItemWithSize:(unint64_t)a3
{
}

- (void)retrying
{
  self->_unint64_t bytesRemaining = 0;
  self->_double maxProgress = self->_progress + (1.0 - self->_progress) * 0.5;
  unint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double progress = self->_progress;
    double maxProgress = self->_maxProgress;
    *(_DWORD *)buf = 134218240;
    double v7 = progress;
    __int16 v8 = 2048;
    double v9 = maxProgress;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Progress is %lf. Max Progress is now %lf", buf, 0x16u);
    _MBLog();
  }
  sub_1002424A4((uint64_t)self);
}

- (void)ended
{
  unint64_t bytesRemaining = self->_bytesRemaining;
  if (bytesRemaining)
  {
    if (self->_verify) {
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Chunk store progress model ended with %llu bytes remaining", self->_bytesRemaining));
    }
    id v4 = MBGetDefaultLog();
    double v5 = v4;
    if (bytesRemaining < 0x401)
    {
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      unint64_t v7 = self->_bytesRemaining;
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Chunk store progress model ended with %{bytes}llu remaining", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      unint64_t v6 = self->_bytesRemaining;
      *(_DWORD *)buf = 134217984;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Chunk store progress model ended with %{bytes}llu remaining", buf, 0xCu);
    }
    _MBLog();
LABEL_9:
    self->_unint64_t bytesRemaining = 0;
    self->_double progress = 1.0;
    block = (void (**)(double))self->_block;
    if (block) {
      block[2](1.0);
    }
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (double)progress
{
  return self->_progress;
}

- (double)maxProgress
{
  return self->_maxProgress;
}

- (void)setMaxProgress:(double)a3
{
  self->_double maxProgress = a3;
}

- (BOOL)verify
{
  return self->_verify;
}

- (void)setVerify:(BOOL)a3
{
  self->_verify = a3;
}

@end