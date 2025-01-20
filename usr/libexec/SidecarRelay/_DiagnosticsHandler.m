@interface _DiagnosticsHandler
+ (id)tmpDir;
- (_DiagnosticsHandler)initWithSubsystem:(const char *)a3 category:(const char *)a4 provider:(id)a5;
- (os_state_data_s)handler:(os_state_hints_s *)a3;
- (void)dealloc;
@end

@implementation _DiagnosticsHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signal, 0);

  objc_storeStrong(&self->_provider, 0);
}

- (os_state_data_s)handler:(os_state_hints_s *)a3
{
  if (a3->var2 != 3) {
    return 0;
  }
  v3 = (*((void (**)(void))self->_provider + 2))();
  uint64_t v4 = (uint64_t)[v3 length];
  v5 = 0;
  if (v3)
  {
    size_t v6 = v4;
    if (v4 <= 0x8000)
    {
      v5 = (os_state_data_s *)malloc_type_calloc(v4 + 200, 1uLL, 0xE624A9AFuLL);
      v5->var0 = 1;
      v5->var1.var1 = v6;
      __strlcpy_chk();
      memcpy(v5->var4, [v3 bytes], v6);
    }
  }

  return v5;
}

- (void)dealloc
{
  os_state_remove_handler();
  dispatch_source_cancel((dispatch_source_t)self->_signal);
  free(self->_title);
  v3.receiver = self;
  v3.super_class = (Class)_DiagnosticsHandler;
  [(_DiagnosticsHandler *)&v3 dealloc];
}

- (_DiagnosticsHandler)initWithSubsystem:(const char *)a3 category:(const char *)a4 provider:(id)a5
{
  id v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_DiagnosticsHandler;
  v9 = [(_DiagnosticsHandler *)&v29 init];
  asprintf(&v9->_path, "%s-%s", a3, a4);
  asprintf(&v9->_title, "%s:%s", a3, a4);
  id v10 = [v8 copy];
  id provider = v9->_provider;
  v9->_id provider = v10;

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_10007AD14;
  v27 = &unk_100099800;
  v12 = v9;
  v28 = v12;
  v12->_handle = os_state_add_handler();
  ::signal(30, (void (__cdecl *)(int))1);
  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  signal = v12->_signal;
  v12->_signal = (OS_dispatch_source *)v13;

  v15 = v12->_signal;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10007AD20;
  handler[3] = &unk_100099828;
  id v23 = v8;
  v16 = v12;
  v22 = v16;
  id v17 = v8;
  dispatch_source_set_event_handler(v15, handler);
  dispatch_activate((dispatch_object_t)v12->_signal);
  v18 = v22;
  v19 = v16;

  return v19;
}

+ (id)tmpDir
{
  unsigned __int8 v8 = 0;
  if (qword_1000AA220)
  {
    v2 = +[NSFileManager defaultManager];
    if ([v2 fileExistsAtPath:qword_1000AA220 isDirectory:&v8])
    {
      int v3 = v8;

      if (v3) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  uint64_t v4 = _dirhelper();
  if (v4)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:v9];
  }
  v5 = (void *)qword_1000AA220;
  qword_1000AA220 = v4;

LABEL_9:
  size_t v6 = +[NSURL fileURLWithPath:qword_1000AA220 isDirectory:1 relativeToURL:0];

  return v6;
}

@end