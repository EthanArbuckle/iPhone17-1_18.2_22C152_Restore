BOOL __PQLCacheKeyEqual(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

double timeInSeconds(unint64_t a1)
{
  if (timeInSeconds_once != -1) {
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  }
  return *(double *)&timeInSeconds_factor * (double)a1;
}

void sub_1DCCE7BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void pql_bind_object(sqlite3_stmt *a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (objc_opt_respondsToSelector())
    {
      [v9 sqliteBind:a1 index:a2];
    }
    else if ([v9 conformsToProtocol:&unk_1F38319B0])
    {
      v5 = (void *)MEMORY[0x1E01AB700]();
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      [v6 encodeObject:v9 forKey:*MEMORY[0x1E4F284E8]];
      id v7 = [v6 encodedData];
      sqlite3_bind_blob(a1, a2, (const void *)[v7 bytes], [v7 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v8 = [v9 description];
      sqlite3_bind_text(a1, a2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    sqlite3_bind_null(a1, a2);
  }
}

uint64_t _pql_log_init()
{
  pql_log = (uint64_t)os_log_create("com.apple.prequelite", "default");

  return MEMORY[0x1F41817F8]();
}

sqlite3_int64 pql_sqlite3_value_pointer(sqlite3_value *a1)
{
  if (sqlite3_value_type(a1) == 1) {
    return sqlite3_value_int64(a1);
  }
  else {
    return 0;
  }
}

id pql_sqlite3_value_object(sqlite3_value *a1)
{
  if (sqlite3_value_type(a1) == 1) {
    id v2 = (id)sqlite3_value_int64(a1);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void _bind_archived_object(sqlite3_stmt *a1, int a2, void *a3)
{
  id v8 = a3;
  v5 = (void *)MEMORY[0x1E01AB700]();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 encodeObject:v8 forKey:*MEMORY[0x1E4F284E8]];
  id v7 = [v6 encodedData];
  sqlite3_bind_blob(a1, a2, (const void *)[v7 bytes], [v7 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

double __timeInSeconds_block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if (info.denom)
  {
    LODWORD(result) = info.numer;
    double result = (double)*(unint64_t *)&result / (double)info.denom / 1000000000.0;
    timeInSeconds_factor = *(void *)&result;
  }
  return result;
}

void sub_1DCCEAF3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __PQLCacheKeyRetain(const void *a1, void *a2)
{
  CFTypeRef result = CFRetain(a1);
  *a2 = result;
  return result;
}

void __PQLCacheValueRelease(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *((id *)v3 + 14);
  id v5 = a1;
  if (([v3 isTraced] & 1) != 0 || objc_msgSend(v5, "isTraced"))
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    v6 = (void *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      id v7 = v6;
      int v11 = 138412546;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2048;
      id v14 = v5;
      id v8 = v12;
      _os_log_impl(&dword_1DCCE4000, v7, OS_LOG_TYPE_DEBUG, "uncaching: <%@:%p>", (uint8_t *)&v11, 0x16u);
    }
  }
  id v9 = v4;
  objc_sync_enter(v9);
  [v9 addObject:v5];
  CFRelease(v5);

  objc_sync_exit(v9);
  v10 = *((void *)v3 + 13);
  if (v10)
  {
    if (!v9) {
      __PQLCacheValueRelease_cold_1();
    }
    dispatch_source_merge_data(v10, 1uLL);
  }
}

void sub_1DCCEB27C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DCCEDA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCEDC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t db_trace(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    if (pql_pred != -1) {
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    }
    id v7 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = a4;
      _os_log_impl(&dword_1DCCE4000, v7, OS_LOG_TYPE_DEBUG, "connection:%@ sql:'%s'", (uint8_t *)&v9, 0x16u);
    }
  }

  return 0;
}

uint64_t __PQLBusyHandlerFunction(void *a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x1E01AB700]();
  id v5 = a1;
  id v6 = [v5 lockedHandler];
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:5 andMessage:@"busy handler called"];
    uint64_t v8 = ((uint64_t (**)(void, id, void, void *))v6)[2](v6, v5, 0, v7);
  }
  else
  {
    uint64_t v9 = [v5 busyHandler];
    id v7 = (void *)v9;
    if (!v9)
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v5, a2);
  }
  uint64_t v10 = v8;
LABEL_6:

  return v10;
}

uint64_t pql_invoke_xfunc(sqlite3_context *a1)
{
  v1 = (uint64_t (*)(void))*((void *)sqlite3_user_data(a1) + 2);

  return v1();
}

id __createObjectFromResultSetWithSel_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 40) || [*(id *)(a1 + 32) columns] != 1) {
    goto LABEL_10;
  }
  id v6 = (unsigned __int8 *)*(id *)(a1 + 32);
  id v7 = v6;
  if (!*((void *)v6 + 2))
  {
    if (objc_opt_respondsToSelector())
    {

      goto LABEL_9;
    }
    char v9 = objc_opt_respondsToSelector();

    if (v9) {
      goto LABEL_9;
    }
LABEL_10:
    if (*(void *)(a1 + 40)) {
      __int16 v11 = *(const char **)(a1 + 40);
    }
    else {
      __int16 v11 = sel_initFromPQLResultSet_error_;
    }
    IMP MethodImplementation = class_getMethodImplementation(*(Class *)(a1 + 48), v11);
    uint64_t v10 = ((uint64_t (*)(id, void, id, uint64_t))MethodImplementation)(objc_alloc(*(Class *)(a1 + 48)), *(void *)(a1 + 40), v5, a3);
    goto LABEL_14;
  }
  int v8 = v6[32];

  if (!v8) {
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v10 = [v5 objectOfClass:*(void *)(a1 + 48) atIndex:0];
LABEL_14:
  uint64_t v13 = (void *)v10;

  return v13;
}

uint64_t ___defaultAllowedClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  _defaultAllowedClasses_allowedClasses = [v0 initWithObjects:v1, v2, v3, v4, objc_opt_class(), 0];

  return MEMORY[0x1F41817F8]();
}

void __PQLCacheValueRelease_cold_1()
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_clone()
{
  return MEMORY[0x1F4181F28]();
}

void abort(void)
{
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1F40CA5A8](name, attrs, cache_out);
}

int cache_destroy(cache_t *cache)
{
  return MEMORY[0x1F40CA5B0](cache);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1F40CA5C0](cache, key, value_out);
}

uint64_t cache_get_name()
{
  return MEMORY[0x1F40CA5F0]();
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1F40CA610](cache, value);
}

int cache_remove_all(cache_t *cache)
{
  return MEMORY[0x1F40CA620](cache);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1F40CA630](cache, key, value, cost);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1F4182040](a1, a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

sqlite3_value *__cdecl sqlite3_column_value(sqlite3_stmt *a1, int iCol)
{
  return (sqlite3_value *)MEMORY[0x1F41820E0](a1, *(void *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1F4182120](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1F41821F0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1F4182208]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1F4182368](*(void *)&a1);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_status(int op, int *pCurrent, int *pHighwater, int resetFlag)
{
  return MEMORY[0x1F41823A8](*(void *)&op, pCurrent, pHighwater, *(void *)&resetFlag);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B8](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x1F41823C8](a1, *(void *)&op, *(void *)&resetFlg);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return MEMORY[0x1F41823F0](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1F41823F8](a1, *(void *)&uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x1F4182428](a1);
  return result;
}

sqlite3_value *__cdecl sqlite3_value_dup(const sqlite3_value *a1)
{
  return (sqlite3_value *)MEMORY[0x1F4182430](a1);
}

void sqlite3_value_free(sqlite3_value *a1)
{
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1F4182468](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}