@interface TUIStatsLiveResize
- (id).cxx_construct;
- (void)_dump;
- (void)beginFrame;
- (void)beginLiveResize;
- (void)collectStatsFromLayoutController:(id)a3;
- (void)endFrame;
- (void)endLiveResize;
@end

@implementation TUIStatsLiveResize

- (void)beginLiveResize
{
  self->_summary._beginMachTime = mach_absolute_time();
}

- (void)endLiveResize
{
  self->_summary._endMachTime = mach_absolute_time();

  [(TUIStatsLiveResize *)self _dump];
}

- (void)_dump
{
  v3 = NSTemporaryDirectory();
  v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  v5 = [v4 URLByAppendingPathComponent:@"LiveResizeStats"];
  uint64_t v6 = [v5 URLByAppendingPathExtension:@"json"];
  v18 = self;

  v19 = +[NSFileManager defaultManager];
  uint64_t v7 = 1;
  for (i = (void *)v6; ; i = (void *)v15)
  {
    v9 = [i path];
    unsigned int v10 = [v19 fileExistsAtPath:v9];

    if (!v10) {
      break;
    }
    v11 = NSTemporaryDirectory();
    v12 = +[NSURL fileURLWithPath:v11 isDirectory:1];
    v13 = +[NSString stringWithFormat:@"%@-%lu", @"LiveResizeStats", v7];
    v14 = [v12 URLByAppendingPathComponent:v13];
    uint64_t v15 = [v14 URLByAppendingPathExtension:@"json"];

    ++v7;
  }
  v16 = sub_145F98(&v18->_summary._components.__table_.__bucket_list_.__ptr_.__value_);
  v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:1 error:0];
  [v17 writeToURL:i atomically:0];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = i;
    _os_log_impl(&def_141F14, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "live-resize-stats dumped to: %@", buf, 0xCu);
  }
}

- (void)beginFrame
{
}

- (void)endFrame
{
  *((void *)self->_summary._frames.__end_ - 1) = mach_absolute_time();
}

- (void)collectStatsFromLayoutController:(id)a3
{
  id v7 = a3;
  v4 = [v7 instantiateContext];
  v5 = [v4 _context];

  uint64_t v6 = v5[96];
  if (v6) {
    sub_1469B0(v6, &self->_summary._components.__table_.__bucket_list_.__ptr_.__value_);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  return self;
}

@end