@interface MBProgressModel
- (BOOL)verify;
- (MBProgressModel)init;
- (MBWatchdog)watchdog;
- (NSString)description;
- (double)progress;
- (id)block;
- (int64_t)bytesRemaining;
- (void)_addBytesRemaining:(unint64_t)a3;
- (void)_subBytesRemaining:(unint64_t)a3;
- (void)abortedTransferringItem:(id)a3;
- (void)abortedTransferringItemWithSize:(int64_t)a3;
- (void)beginStageWithMinProgress:(double)a3 maxProgress:(double)a4;
- (void)endStage;
- (void)ended;
- (void)failedToTransferItem:(id)a3;
- (void)finishedItem:(id)a3;
- (void)finishedItem:(id)a3 size:(unint64_t)a4;
- (void)finishedScanningDomain;
- (void)finishedTransferringItem:(id)a3 size:(int64_t)a4;
- (void)record:(id)a3 madeProgress:(double)a4 previousProgress:(double)a5 assetSize:(int64_t)a6 recordSize:(int64_t)a7;
- (void)retrying;
- (void)setBlock:(id)a3;
- (void)setVerify:(BOOL)a3;
- (void)updatingProgress:(double)a3 forItem:(id)a4;
- (void)updatingProgress:(double)a3 previousProgress:(double)a4 size:(int64_t)a5;
- (void)willScanDomains:(unint64_t)a3;
- (void)willTransferItemsWithSize:(int64_t)a3 count:(unint64_t)a4;
@end

@implementation MBProgressModel

- (MBProgressModel)init
{
  v16.receiver = self;
  v16.super_class = (Class)MBProgressModel;
  v2 = [(MBProgressModel *)&v16 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_minProgress = xmmword_1003B3510;
    v2->_maxBytesProgress = 0.95;
    objc_initWeak(&location, v2);
    v4 = [MBWatchdog alloc];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [(MBWatchdog *)v4 initWithName:v6];
    watchdog = v3->_watchdog;
    v3->_watchdog = v7;

    [(MBWatchdog *)v3->_watchdog setTimeout:30.0];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10010B350;
    v13 = &unk_100413770;
    objc_copyWeak(&v14, &location);
    [(MBWatchdog *)v3->_watchdog setTimeoutBlock:&v10];
    [(MBWatchdog *)v3->_watchdog resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_addBytesRemaining:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_bytesRemaining += a3;
  sub_10010B52C(obj);
  objc_sync_exit(obj);
}

- (void)_subBytesRemaining:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  v4 = obj;
  if (obj->_combinedProgress < 1.0)
  {
    uint64_t bytesRemaining = obj->_bytesRemaining;
    if (bytesRemaining < a3)
    {
      if (obj->_verify) {
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Bytes remaining underflow (%llu bytes)", a3 - obj->_bytesRemaining));
      }
      v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v7 = a3 - obj->_bytesRemaining;
        *(_DWORD *)buf = 134217984;
        unint64_t v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Progress model bytes remaining underflow (%{bytes}llu)", buf, 0xCu);
        unint64_t v15 = a3 - obj->_bytesRemaining;
        _MBLog();
      }

      v4 = obj;
      uint64_t bytesRemaining = obj->_bytesRemaining;
      a3 = bytesRemaining;
    }
    double maxBytesProgress = v4->_maxBytesProgress;
    if (bytesRemaining >= 1) {
      double maxBytesProgress = v4->_bytesProgress
    }
                       + (maxBytesProgress - v4->_bytesProgress) * ((double)a3 / (double)bytesRemaining);
    v4->_bytesProgress = maxBytesProgress;
    unint64_t itemCount = v4->_itemCount;
    if (itemCount)
    {
      double v10 = (double)v4->_itemsCompleted / (double)itemCount;
      v4->_itemProgress = v10;
      p_itemProgress = (MBProgressModel *)&v4->_itemProgress;
      if (v10 <= 1.0) {
        goto LABEL_17;
      }
    }
    else
    {
      p_itemProgress = (MBProgressModel *)&v4->_itemProgress;
    }
    p_itemProgress->super.isa = (Class)0x3FF0000000000000;
    double v10 = 1.0;
LABEL_17:
    obj->_combinedProgress = obj->_minProgress
                           + (maxBytesProgress + v10) * 0.5 * (obj->_maxProgress - obj->_minProgress);
    uint64_t v12 = [(MBProgressModel *)obj block];
    v13 = (void *)v12;
    if (v12) {
      (*(void (**)(uint64_t, double))(v12 + 16))(v12, obj->_combinedProgress);
    }
    obj->_bytesRemaining -= a3;
    sub_10010B52C(obj);
    id v14 = obj->_watchdog;

    objc_sync_exit(obj);
    [(MBWatchdog *)v14 resume];

    return;
  }
  objc_sync_exit(obj);
}

- (void)willTransferItemsWithSize:(int64_t)a3 count:(unint64_t)a4
{
  unint64_t v5 = a3 + (a4 << 13);
  v6 = self;
  objc_sync_enter(v6);
  [(MBProgressModel *)v6 _addBytesRemaining:v5];
  v6->_itemCount += a4;
  unint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v9 = v5;
    __int16 v10 = 2048;
    unint64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "willTransfer: size:%llu, count:%ld", buf, 0x16u);
    _MBLog();
  }

  objc_sync_exit(v6);
}

- (void)willScanDomains:(unint64_t)a3
{
  unint64_t v4 = a3 << 13;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  [(MBProgressModel *)v5 _addBytesRemaining:v4];
  v5->_itemCount += a3;
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v8 = v4;
    __int16 v9 = 2048;
    unint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "willScanDomains: size:%llu domainsToScan:%llu", buf, 0x16u);
    _MBLog();
  }

  objc_sync_exit(v5);
}

- (void)finishedScanningDomain
{
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_itemsCompleted;
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int64_t bytesRemaining = v2->_bytesRemaining;
    unint64_t itemsCompleted = v2->_itemsCompleted;
    unint64_t itemCount = v2->_itemCount;
    *(_DWORD *)buf = 134218752;
    uint64_t v8 = 0x2000;
    __int16 v9 = 2048;
    int64_t v10 = bytesRemaining;
    __int16 v11 = 2048;
    unint64_t v12 = itemsCompleted;
    __int16 v13 = 2048;
    unint64_t v14 = itemCount;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "finishedScanningDomain, size:%llu, remaining:%lld, completed:%lld/%lld", buf, 0x2Au);
    _MBLog();
  }

  [(MBProgressModel *)v2 _subBytesRemaining:0x2000];
  objc_sync_exit(v2);
}

- (void)finishedTransferringItem:(id)a3 size:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int64_t v10 = [v6 itemID];
      int64_t bytesRemaining = v7->_bytesRemaining;
      unint64_t itemsCompleted = v7->_itemsCompleted;
      unint64_t itemCount = v7->_itemCount;
      *(_DWORD *)buf = 138413314;
      objc_super v16 = v10;
      __int16 v17 = 2048;
      int64_t v18 = a4;
      __int16 v19 = 2048;
      int64_t v20 = bytesRemaining;
      __int16 v21 = 2048;
      unint64_t v22 = itemsCompleted;
      __int16 v23 = 2048;
      unint64_t v24 = itemCount;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "finishedTransferringItem, fileID:%@, size:%llu, remaining:%lld, completed:%lld/%lld", buf, 0x34u);
    }
    unint64_t v14 = [v6 itemID];
    _MBLog();
  }
  [(MBProgressModel *)v7 _subBytesRemaining:a4];
  objc_sync_exit(v7);
}

- (void)finishedItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  objc_sync_enter(v5);
  ++v5->_itemsCompleted;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [v4 itemID];
      int64_t bytesRemaining = v5->_bytesRemaining;
      unint64_t itemsCompleted = v5->_itemsCompleted;
      unint64_t itemCount = v5->_itemCount;
      *(_DWORD *)buf = 138413314;
      unint64_t v14 = v8;
      __int16 v15 = 2048;
      uint64_t v16 = 0x2000;
      __int16 v17 = 2048;
      int64_t v18 = bytesRemaining;
      __int16 v19 = 2048;
      unint64_t v20 = itemsCompleted;
      __int16 v21 = 2048;
      unint64_t v22 = itemCount;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "finishedItem, itemID:%@, size:%llu, remaining:%lld, completed:%lld/%lld", buf, 0x34u);
    }
    unint64_t v12 = [v4 itemID];
    _MBLog();
  }
  [(MBProgressModel *)v5 _subBytesRemaining:0x2000];
  objc_sync_exit(v5);
}

- (void)finishedItem:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = self;
  objc_sync_enter(v7);
  ++v7->_itemsCompleted;
  uint64_t v8 = MBGetDefaultLog();
  unint64_t v9 = a4 + 0x2000;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int64_t v10 = v8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      __int16 v11 = [v6 itemID];
      int64_t bytesRemaining = v7->_bytesRemaining;
      unint64_t itemsCompleted = v7->_itemsCompleted;
      unint64_t itemCount = v7->_itemCount;
      *(_DWORD *)buf = 138413314;
      __int16 v17 = v11;
      __int16 v18 = 2048;
      unint64_t v19 = v9;
      __int16 v20 = 2048;
      int64_t v21 = bytesRemaining;
      __int16 v22 = 2048;
      unint64_t v23 = itemsCompleted;
      __int16 v24 = 2048;
      unint64_t v25 = itemCount;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "finishedItem, itemID:%@, size:%llu, remaining:%lld, completed:%lld/%lld", buf, 0x34u);
    }
    __int16 v15 = [v6 itemID];
    _MBLog();
  }
  [(MBProgressModel *)v7 _subBytesRemaining:v9];
  objc_sync_exit(v7);
}

- (void)updatingProgress:(double)a3 forItem:(id)a4
{
  id v6 = a4;
  id v7 = [v6 size];
  id v8 = [v6 resourcesSize];
  unint64_t v9 = self;
  objc_sync_enter(v9);
  [v6 progress];
  if (v10 != a3)
  {
    if (a3 >= 0.0)
    {
      if (a3 == 1.0) {
        ++v9->_itemsCompleted;
      }
      [v6 progress];
      [(MBProgressModel *)v9 _subBytesRemaining:(unint64_t)((a3 - v12) * (double)((unint64_t)v8 + (void)v7 + 0x2000))];
    }
    else
    {
      if (v9->_verify) {
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Negative progress update (%0.3f)", *(void *)&a3));
      }
      __int16 v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v15 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Negative progress update (%0.3f)", buf, 0xCu);
        double v13 = a3;
        _MBLog();
      }
    }
    objc_msgSend(v6, "setProgress:", a3, *(void *)&v13);
  }
  objc_sync_exit(v9);
}

- (void)updatingProgress:(double)a3 previousProgress:(double)a4 size:(int64_t)a5
{
  id v8 = self;
  objc_sync_enter(v8);
  if (a3 != a4)
  {
    if (a3 >= 0.0)
    {
      if (a3 == 1.0) {
        ++v8->_itemsCompleted;
      }
      [(MBProgressModel *)v8 _subBytesRemaining:(unint64_t)((a3 - a4) * (double)(a5 + 0x2000))];
    }
    else
    {
      if (v8->_verify) {
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Negative progress update (%0.3f)", *(void *)&a3));
      }
      unint64_t v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v11 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Negative progress update (%0.3f)", buf, 0xCu);
        _MBLog();
      }
    }
  }
  objc_sync_exit(v8);
}

- (void)failedToTransferItem:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [v6 progress];
  -[MBProgressModel _addBytesRemaining:](v4, "_addBytesRemaining:", (unint64_t)(v5 * (double)(unint64_t)[v6 size]));
  objc_sync_exit(v4);
}

- (void)abortedTransferringItem:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[MBProgressModel abortedTransferringItemWithSize:](v4, "abortedTransferringItemWithSize:", [v5 size]);
  objc_sync_exit(v4);
}

- (void)abortedTransferringItemWithSize:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(MBProgressModel *)obj _subBytesRemaining:a3 + 0x2000];
  objc_sync_exit(obj);
}

- (void)retrying
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_int64_t bytesRemaining = 0;
  v2->_double maxBytesProgress = v2->_bytesProgress + (1.0 - v2->_bytesProgress) * 0.5;
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    double bytesProgress = v2->_bytesProgress;
    double maxBytesProgress = v2->_maxBytesProgress;
    *(_DWORD *)buf = 134218240;
    double v7 = bytesProgress;
    __int16 v8 = 2048;
    double v9 = maxBytesProgress;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Bytes Progress is %lf. Max Bytes Progress is now %lf", buf, 0x16u);
    _MBLog();
  }

  sub_10010B52C(v2);
  objc_sync_exit(v2);
}

- (void)ended
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t bytesRemaining = v2->_bytesRemaining;
  if (bytesRemaining)
  {
    if (v2->_verify) {
      objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, @"Progress model ended with %llu bytes remaining", v2->_bytesRemaining));
    }
    if (bytesRemaining < 1025)
    {
      id v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int64_t v6 = v2->_bytesRemaining;
        *(_DWORD *)buf = 134217984;
        int64_t v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Progress model ended with %{bytes}llu remaining", buf, 0xCu);
        int64_t v10 = v2->_bytesRemaining;
        _MBLog();
      }
    }
    else
    {
      id v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v5 = v2->_bytesRemaining;
        *(_DWORD *)buf = 134217984;
        int64_t v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Progress model ended with %{bytes}llu remaining", buf, 0xCu);
        int64_t v10 = v2->_bytesRemaining;
        _MBLog();
      }
    }
  }
  v2->_double bytesProgress = 1.0;
  v2->_uint64_t bytesRemaining = 0;
  v2->_itemProgress = 1.0;
  v2->_combinedProgress = 1.0;
  double v7 = [(MBProgressModel *)v2 block];
  [(MBProgressModel *)v2 setBlock:0];
  if (v7) {
    v7[2](v7, v2->_combinedProgress);
  }
  watchdog = v2->_watchdog;
  v2->_watchdog = 0;
  double v9 = watchdog;

  objc_sync_exit(v2);
  [(MBWatchdog *)v9 suspend];
}

- (void)beginStageWithMinProgress:(double)a3 maxProgress:(double)a4
{
  obj = self;
  objc_sync_enter(obj);
  obj->_minProgress = a3;
  obj->_maxProgress = a4;
  obj->_uint64_t bytesRemaining = 0;
  obj->_double maxBytesProgress = 0.95;
  obj->_unint64_t itemsCompleted = 0;
  obj->_unint64_t itemCount = 0;
  obj->_double bytesProgress = a3;
  obj->_itemProgress = a3;
  obj->_combinedProgress = a3;
  uint64_t v6 = [(MBProgressModel *)obj block];
  double v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, double))(v6 + 16))(v6, obj->_combinedProgress);
  }

  objc_sync_exit(obj);
}

- (void)endStage
{
  obj = self;
  objc_sync_enter(obj);
  obj->_uint64_t bytesRemaining = 0;
  double maxProgress = obj->_maxProgress;
  obj->_double bytesProgress = maxProgress;
  obj->_itemProgress = maxProgress;
  obj->_combinedProgress = maxProgress;
  uint64_t v3 = [(MBProgressModel *)obj block];
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, double))(v3 + 16))(v3, obj->_combinedProgress);
  }

  objc_sync_exit(obj);
}

- (NSString)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"<%@: combinedProgress=%0.3f, byteProgress=%0.3f, itemProgress=%0.2f, bytesRemaining=%llu, completed:%lld/%lld>", objc_opt_class(), *(void *)&self->_combinedProgress, *(void *)&self->_bytesProgress, *(void *)&self->_itemProgress, self->_bytesRemaining, self->_itemsCompleted, self->_itemCount];
  return (NSString *)v2;
}

- (double)progress
{
  return self->_combinedProgress;
}

- (id)block
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setBlock:(id)a3
{
}

- (BOOL)verify
{
  return self->_verify;
}

- (void)setVerify:(BOOL)a3
{
  self->_verify = a3;
}

- (int64_t)bytesRemaining
{
  return self->_bytesRemaining;
}

- (MBWatchdog)watchdog
{
  return self->_watchdog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)record:(id)a3 madeProgress:(double)a4 previousProgress:(double)a5 assetSize:(int64_t)a6 recordSize:(int64_t)a7
{
  id v12 = a3;
  if (a6 >= 20000001)
  {
    double v13 = +[NSByteCountFormatter stringFromByteCount:a6 countStyle:0];
    unint64_t v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = [v12 recordID];
      uint64_t v16 = [v15 recordName];
      *(_DWORD *)buf = 134219010;
      double v24 = a5;
      __int16 v25 = 2048;
      double v26 = a4;
      __int16 v27 = 2112;
      v28 = v16;
      __int16 v29 = 2112;
      v30 = v13;
      __int16 v31 = 2048;
      int64_t v32 = a7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "=upload assets= Received progress update from %.2f to %.2f for %@ with assetSize %@ recordSize %llu", buf, 0x34u);

      __int16 v17 = [v12 recordID];
      [v17 recordName];
      int64_t v21 = v13;
      __int16 v20 = v22 = a7;
      double v18 = a5;
      double v19 = a4;
      _MBLog();
    }
  }
  -[MBProgressModel updatingProgress:previousProgress:size:](self, "updatingProgress:previousProgress:size:", a6, a4, a5, *(void *)&v18, *(void *)&v19, v20, v21, v22);
}

@end