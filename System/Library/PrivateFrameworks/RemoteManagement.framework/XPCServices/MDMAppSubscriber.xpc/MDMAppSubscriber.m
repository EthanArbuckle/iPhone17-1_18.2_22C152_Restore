int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t vars8;

  v3 = objc_opt_class();

  return +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:&__NSArray0__struct publisherClass:v3];
}

void sub_100002A8C(id a1)
{
  qword_1000086D8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "mDMAppStatus");

  _objc_release_x1();
}

void sub_100002D00(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = objc_alloc((Class)NSMutableArray);
    v7 = [v5 appsByBundleIdentifier];
    id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = objc_msgSend(v5, "appsByBundleIdentifier", 0);
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v13);
          v15 = [v5 appsByBundleIdentifier];
          v16 = [v15 objectForKeyedSubscript:v14];

          v17 = [v16 sourceIdentifier];

          if (!v17)
          {
            v18 = [(id)objc_opt_class() appStatusForApp:v16];
            v19 = [v18 serializeWithType:1];
            [v8 addObject:v19];
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(a1 + 40) count]);
    [v20 setObject:v8 forKeyedSubscript:RMModelStatusItemMDMApp];
    uint64_t v21 = *(void *)(a1 + 48);
    id v22 = [v20 copy];
    (*(void (**)(uint64_t, id, void))(v21 + 16))(v21, v22, 0);
  }
}

void sub_100003118(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Querying mdm app status for key paths: %{public}@", (uint8_t *)&v2, 0xCu);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_appsByBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appsByBundleIdentifier];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentUserConnection(void *a1, const char *a2, ...)
{
  return [a1 currentUserConnection];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_externalVersionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalVersionIdentifier];
}

id objc_msgSend_mDMAppStatus(void *a1, const char *a2, ...)
{
  return [a1 mDMAppStatus];
}

id objc_msgSend_managementInformation(void *a1, const char *a2, ...)
{
  return [a1 managementInformation];
}

id objc_msgSend_neededAppProperties(void *a1, const char *a2, ...)
{
  return [a1 neededAppProperties];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_shortVersion(void *a1, const char *a2, ...)
{
  return [a1 shortVersion];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemConnection(void *a1, const char *a2, ...)
{
  return [a1 systemConnection];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}