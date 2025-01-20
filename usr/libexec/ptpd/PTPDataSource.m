@interface PTPDataSource
- (BOOL)toggleHeaderOffset;
- (NSString)dataSourcePath;
- (NSString)queueName;
- (OS_dispatch_queue)plAssetQueue;
- (OS_dispatch_source)plAssetTimer;
- (PHPTPAssetHandle)plAssetHandle;
- (PHPTPAssetReader)plAssetReader;
- (PTPDataSource)initWithAssetHandle:(id)a3 assetSize:(unint64_t)a4 andQueueName:(id)a5;
- (id)dataSourcePathForDataRange:(_NSRange)a3;
- (int)fd;
- (int64_t)read:(void *)a3 length:(unint64_t)a4 offset:(int64_t)a5;
- (unint64_t)plAssetSize;
- (void)boostAssetReaderLifespan;
- (void)dealloc;
- (void)setDataSourcePath:(id)a3;
- (void)setFd:(int)a3;
- (void)setPlAssetHandle:(id)a3;
- (void)setPlAssetQueue:(id)a3;
- (void)setPlAssetReader:(id)a3;
- (void)setPlAssetSize:(unint64_t)a3;
- (void)setPlAssetTimer:(id)a3;
- (void)setQueueName:(id)a3;
- (void)setToggleHeaderOffset:(BOOL)a3;
@end

@implementation PTPDataSource

- (PTPDataSource)initWithAssetHandle:(id)a3 assetSize:(unint64_t)a4 andQueueName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PTPDataSource;
  v10 = [(PTPDataSource *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(PTPDataSource *)v10 setPlAssetHandle:v8];
    [(PTPDataSource *)v11 setPlAssetSize:a4];
    v12 = dispatch_get_global_queue(33, 0);
    [(PTPDataSource *)v11 setPlAssetQueue:v12];

    [(PTPDataSource *)v11 setPlAssetReader:0];
    [(PTPDataSource *)v11 setPlAssetTimer:0];
    [(PTPDataSource *)v11 setQueueName:v9];
    [(PTPDataSource *)v11 setFd:0xFFFFFFFFLL];
  }

  return v11;
}

- (void)dealloc
{
  p_plAssetQueue = &self->_plAssetQueue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_plAssetQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B444;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_sync(WeakRetained, block);

  objc_storeWeak((id *)p_plAssetQueue, 0);
  [(PTPDataSource *)self setPlAssetReader:0];
  [(PTPDataSource *)self setPlAssetHandle:0];
  [(PTPDataSource *)self setQueueName:0];
  if ([(PTPDataSource *)self fd] != -1)
  {
    close([(PTPDataSource *)self fd]);
    [(PTPDataSource *)self setFd:0xFFFFFFFFLL];
  }
  [(PTPDataSource *)self setDataSourcePath:0];
  v5.receiver = self;
  v5.super_class = (Class)PTPDataSource;
  [(PTPDataSource *)&v5 dealloc];
}

- (id)dataSourcePathForDataRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002B638;
  v21 = sub_10002B648;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  objc_super v14 = sub_10002B638;
  v15 = sub_10002B648;
  id v16 = 0;
  v6 = [(PTPDataSource *)self plAssetQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B650;
  block[3] = &unk_100048D68;
  block[4] = self;
  void block[5] = &v11;
  block[7] = location;
  block[8] = length;
  block[6] = &v17;
  dispatch_sync(v6, block);

  if (v18[5]) {
    v7 = 0;
  }
  else {
    v7 = (void *)v12[5];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (int64_t)read:(void *)a3 length:(unint64_t)a4 offset:(int64_t)a5
{
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = dword_10005E438;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  id v9 = [(PTPDataSource *)self dataSourcePathForDataRange:a5];
  v10 = [(PTPDataSource *)self dataSourcePath];
  unsigned __int8 v11 = [v10 isEqualToString:v9];

  if ((v11 & 1) == 0)
  {
    if ([(PTPDataSource *)self fd] != -1)
    {
      close([(PTPDataSource *)self fd]);
      [(PTPDataSource *)self setFd:0xFFFFFFFFLL];
    }
    [(PTPDataSource *)self setDataSourcePath:v9];
    __ICOSLogCreate();
    if ((unint64_t)[@"PTPDataSource" length] < 0x15)
    {
      uint64_t v13 = @"PTPDataSource";
    }
    else
    {
      v12 = [@"PTPDataSource" substringWithRange:0, 18];
      uint64_t v13 = [v12 stringByAppendingString:@".."];
    }
    id v14 = [(PTPDataSource *)self dataSourcePath];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  >>> Setting[%s]:[%10lu]", [v14 UTF8String], -[PTPDataSource plAssetSize](self, "plAssetSize"));

    id v16 = (id)_gICOSLog;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v58 = v17;
      __int16 v59 = 2114;
      v60 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  v18 = [(PTPDataSource *)self dataSourcePath];

  if (v18)
  {
    uint64_t v19 = [(PTPDataSource *)self plAssetQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002BF20;
    block[3] = &unk_100048DB8;
    block[4] = self;
    void block[5] = &v53;
    block[8] = a3;
    void block[9] = a4;
    block[10] = a5;
    block[6] = &v45;
    block[7] = &v49;
    dispatch_sync(v19, block);
  }
  __ICOSLogCreate();
  if ((unint64_t)[&stru_100048E60 length] < 0x15)
  {
    v21 = &stru_100048E60;
  }
  else
  {
    v20 = [&stru_100048E60 substringWithRange:0, 18];
    v21 = [v20 stringByAppendingString:@".."];
  }
  id v22 = +[NSString stringWithFormat:@"  *** Request:[%10lu] @ Offset:[%10llu] >> Read:[%10llu]", a4, a5, v54[3]];
  v23 = (id)_gICOSLog;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(__CFString *)v21 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v58 = v24;
    __int16 v59 = 2114;
    v60 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  if (v50[3])
  {
    __ICOSLogCreate();
    if ((unint64_t)[&stru_100048E60 length] < 0x15)
    {
      v26 = &stru_100048E60;
    }
    else
    {
      v25 = [&stru_100048E60 substringWithRange:0, 18];
      v26 = [v25 stringByAppendingString:@".."];
    }
    v27 = +[NSString stringWithFormat:@"   "];
    v28 = (id)_gICOSLog;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [(__CFString *)v26 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v58 = v29;
      __int16 v59 = 2114;
      v60 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    __ICOSLogCreate();
    if ((unint64_t)[&stru_100048E60 length] < 0x15)
    {
      v31 = &stru_100048E60;
    }
    else
    {
      v30 = [&stru_100048E60 substringWithRange:0, 18];
      v31 = [v30 stringByAppendingString:@".."];
    }
    v32 = +[NSString stringWithFormat:@"  >>> Advised:[%10llu] @ Offset:[%10llu]", v50[3], v46[3]];
    v33 = (id)_gICOSLog;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = [(__CFString *)v31 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v58 = v34;
      __int16 v59 = 2114;
      v60 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  uint64_t v35 = v54[3];
  if (v35 + a5 == [(PTPDataSource *)self plAssetSize] && [(PTPDataSource *)self fd] != -1)
  {
    __ICOSLogCreate();
    if ((unint64_t)[&stru_100048E60 length] < 0x15)
    {
      v37 = &stru_100048E60;
    }
    else
    {
      v36 = [&stru_100048E60 substringWithRange:0, 18];
      v37 = [v36 stringByAppendingString:@".."];
    }
    id v38 = [(PTPDataSource *)self dataSourcePath];
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"  --- Closing[%s]:[%10lu]", [v38 UTF8String], -[PTPDataSource plAssetSize](self, "plAssetSize"));

    v40 = (id)_gICOSLog;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = [(__CFString *)v37 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v58 = v41;
      __int16 v59 = 2114;
      v60 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    close([(PTPDataSource *)self fd]);
    [(PTPDataSource *)self setFd:0xFFFFFFFFLL];
  }
  int64_t v42 = v54[3];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  return v42;
}

- (void)boostAssetReaderLifespan
{
  v3 = [(PTPDataSource *)self plAssetTimer];

  __ICOSLogCreate();
  uint64_t v4 = __ICLogTypeEnabled(4);
  if (v3)
  {
    if (v4)
    {
      objc_super v5 = @"PTPDataSource";
      if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
      {
        v6 = [@"PTPDataSource" substringWithRange:0, 18];
        objc_super v5 = [v6 stringByAppendingString:@".."];
      }
      id v7 = [(PTPDataSource *)self queueName];
      id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Boosted [%s]", [v7 UTF8String]);

      id v9 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v5;
        unsigned __int8 v11 = v9;
        *(_DWORD *)buf = 136446466;
        id v31 = [(__CFString *)v10 UTF8String];
        __int16 v32 = 2114;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    v12 = [(PTPDataSource *)self plAssetTimer];
    dispatch_time_t v13 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  }
  else
  {
    if (v4)
    {
      id v14 = @"PTPDataSource";
      if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
      {
        v15 = [@"PTPDataSource" substringWithRange:0, 18];
        id v14 = [v15 stringByAppendingString:@".."];
      }
      id v16 = [(PTPDataSource *)self queueName];
      id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Created [%s]", [v16 UTF8String]);

      v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v14;
        v20 = v18;
        *(_DWORD *)buf = 136446466;
        id v31 = [(__CFString *)v19 UTF8String];
        __int16 v32 = 2114;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    v21 = [(PTPDataSource *)self plAssetQueue];
    id v22 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v21);
    plAssetTimer = self->_plAssetTimer;
    self->_plAssetTimer = v22;

    id v24 = [(PTPDataSource *)self plAssetTimer];
    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    objc_initWeak((id *)buf, self);
    v26 = [(PTPDataSource *)self plAssetTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002C950;
    handler[3] = &unk_100048DE0;
    objc_copyWeak(&v29, (id *)buf);
    handler[4] = self;
    dispatch_source_set_event_handler(v26, handler);

    v27 = [(PTPDataSource *)self plAssetTimer];
    dispatch_resume(v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

- (PHPTPAssetHandle)plAssetHandle
{
  return self->_plAssetHandle;
}

- (void)setPlAssetHandle:(id)a3
{
}

- (PHPTPAssetReader)plAssetReader
{
  return self->_plAssetReader;
}

- (void)setPlAssetReader:(id)a3
{
}

- (OS_dispatch_source)plAssetTimer
{
  return self->_plAssetTimer;
}

- (void)setPlAssetTimer:(id)a3
{
}

- (OS_dispatch_queue)plAssetQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plAssetQueue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setPlAssetQueue:(id)a3
{
}

- (unint64_t)plAssetSize
{
  return self->_plAssetSize;
}

- (void)setPlAssetSize:(unint64_t)a3
{
  self->_plAssetSize = a3;
}

- (NSString)queueName
{
  return self->_queueName;
}

- (void)setQueueName:(id)a3
{
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (NSString)dataSourcePath
{
  return self->_dataSourcePath;
}

- (void)setDataSourcePath:(id)a3
{
}

- (BOOL)toggleHeaderOffset
{
  return self->_toggleHeaderOffset;
}

- (void)setToggleHeaderOffset:(BOOL)a3
{
  self->_toggleHeaderOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourcePath, 0);
  objc_storeStrong((id *)&self->_queueName, 0);
  objc_destroyWeak((id *)&self->_plAssetQueue);
  objc_storeStrong((id *)&self->_plAssetTimer, 0);
  objc_storeStrong((id *)&self->_plAssetReader, 0);

  objc_storeStrong((id *)&self->_plAssetHandle, 0);
}

@end