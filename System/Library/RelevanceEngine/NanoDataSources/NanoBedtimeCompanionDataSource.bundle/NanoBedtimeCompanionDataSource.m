void sub_2C20(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void v14[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = (id)objc_opt_class();
      v17 = 2114;
      v18 = v6;
      v13 = v16;
      _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch upcoming events with error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v7 = [(id)objc_opt_class() _filterEvents:v5 forSection:a1[5]];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2E64;
    v14[3] = &unk_41B0;
    v14[4] = a1[4];
    v8 = objc_msgSend(v7, "na_map:", v14);
    v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v8;
      v11 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] elements: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();

    v5 = v7;
  }
}

id sub_2E64(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() _elementForEvent:v2];

  return v3;
}

id sub_2FAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:REDefaultSectionIdentifier]
    && (v4 = *(void **)(a1 + 40),
        [v3 dueDate],
        v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 isDateInToday:v5],
        v5,
        (v4 & 1) != 0))
  {
    id v6 = &dword_0 + 1;
  }
  else if ([*(id *)(a1 + 32) isEqualToString:RETomorrowSectionIdentifier])
  {
    v7 = *(void **)(a1 + 40);
    v8 = [v3 dueDate];
    id v6 = [v7 isDateInTomorrow:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t HKSPLogForCategory()
{
  return _HKSPLogForCategory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dueDate(void *a1, const char *a2, ...)
{
  return [a1 dueDate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_supportedSections(void *a1, const char *a2, ...)
{
  return [a1 supportedSections];
}

id objc_msgSend_upcomingEvents(void *a1, const char *a2, ...)
{
  return [a1 upcomingEvents];
}