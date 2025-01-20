id sub_221C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v14;
  id v15;
  uint64_t vars8;

  v9 = a1;
  v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  v14 = NSLocalizedDescriptionKey;
  v15 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v12 = +[NSError errorWithDomain:@"LoggingProvider" code:1 userInfo:v11];

  return v12;
}

void sub_2818(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_283C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_284C(uint64_t a1)
{
}

void sub_2854(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 localizedDescription];

    if (v8)
    {
      v9 = [v7 localizedDescription];
      v10 = +[NSString stringWithFormat:@"Failed to prepare log source: %@", v9];

      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:v10];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:@"Failed to prepare log source for unknown reason"];
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

id sub_294C(uint64_t a1, id a2)
{
  id v3 = a2;
  [v3 bytes];
  [v3 length];

  id result = (id)ktrace_file_append_chunk();
  if (!result)
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 8);
    return [v5 failWithReason:@"failed to append log data"];
  }
  return result;
}

void sub_2A0C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = a3 - 1;
  id v8 = v5;
  if (unint64_t)(a3 - 1) <= 8 && ((0x1EFu >> v6))
  {
    [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:*(&off_4280 + v6)];
    id v5 = v8;
  }
  if (v5)
  {
    id v7 = v8;
    [v7 bytes];
    [v7 length];
    if (!ktrace_file_append_chunk()) {
      [*(id *)(*(void *)(a1 + 32) + 8) failWithReason:@"failed to append log metadata"];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_2B04(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 decomposedMessage];
  id v5 = 0;
  if ([v4 placeholderCount])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v4 argumentAtIndex:v6];
      if ([v7 category] == (char *)&dword_0 + 3
        || [v7 category] == (char *)&dword_0 + 2
        && ([v7 objectRepresentation], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0)
        && (v9 = (void *)v8,
            unsigned __int8 v10 = [*(id *)(a1 + 32) containsObject:v8],
            v9,
            (v10 & 1) == 0))
      {
        if (v5)
        {
          [v5 addIndex:v6];
        }
        else
        {
          id v5 = +[NSMutableIndexSet indexSetWithIndex:v6];
        }
      }

      ++v6;
    }
    while (v6 < (unint64_t)[v4 placeholderCount]);
  }

  return v5;
}

uint64_t SignpostSupportAllowlistedStringSetForCurrentDevice()
{
  return _SignpostSupportAllowlistedStringSetForCurrentDevice();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t ktrace_chunk_tag()
{
  return _ktrace_chunk_tag();
}

uint64_t ktrace_file_append_chunk()
{
  return _ktrace_file_append_chunk();
}

uint64_t ktrace_file_earliest_walltime()
{
  return _ktrace_file_earliest_walltime();
}

uint64_t ktrace_file_latest_walltime()
{
  return _ktrace_file_latest_walltime();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_decomposedMessage(void *a1, const char *a2, ...)
{
  return [a1 decomposedMessage];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_objectRepresentation(void *a1, const char *a2, ...)
{
  return [a1 objectRepresentation];
}

id objc_msgSend_placeholderCount(void *a1, const char *a2, ...)
{
  return [a1 placeholderCount];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}