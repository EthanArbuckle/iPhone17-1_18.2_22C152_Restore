void sub_10000322C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void v7[5];
  id v8;

  v3 = [a2 asDictionary];
  v4 = [*(id *)(a1 + 32) results];
  [v4 setObject:v3 forKeyedSubscript:@"download"];

  v5 = [*(id *)(a1 + 32) pass];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003310;
  v7[3] = &unk_100004120;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  v8 = v6;
  [v5 startUploadWithCompletion:v7];
}

intptr_t sub_100003310(uint64_t a1, void *a2)
{
  v3 = [a2 asDictionary];
  v4 = [*(id *)(a1 + 32) results];
  [v4 setObject:v3 forKeyedSubscript:@"upload"];

  [*(id *)(a1 + 32) saveResults];
  v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_asDictionary(void *a1, const char *a2, ...)
{
  return [a1 asDictionary];
}

id objc_msgSend_defaultConfigurationCellular(void *a1, const char *a2, ...)
{
  return [a1 defaultConfigurationCellular];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_finalPath(void *a1, const char *a2, ...)
{
  return [a1 finalPath];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_pass(void *a1, const char *a2, ...)
{
  return [a1 pass];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_saveResults(void *a1, const char *a2, ...)
{
  return [a1 saveResults];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}
rDiagnosticsExtension *)self setFinalPath:v5];

  v6 = +[NSFileManager defaultManager];
  v7 = [(NPTCellularDiagnosticsExtension *)self finalPath];
  [v6 removeItemAtPath:v7 error:0];

  v8 = [(NPTCellularDiagnosticsExtension *)self results];
  v9 = +[NSJSONSerialization dataWithJSONObject:v8 options:3 error:0];

  v10 = +[NSFileManager defaultManager];
  v11 = [(NPTCellularDiagnosticsExtension *)self finalPath];
  v12 = +[NSURL URLWithString:v11];
  v13 = [v12 path];
  [v10 createFileAtPath:v13 contents:v9 attributes:0];
}

- (NPTPerformanceTest)pass
{
  return (NPTPerformanceTest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPass:(id)a3
{
}

- (NSString)finalPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFinalPath:(id)a3
{
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_finalPath, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end