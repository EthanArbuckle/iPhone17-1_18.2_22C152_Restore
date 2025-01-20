int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  int v4;
  uint64_t v6;

  v6 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:v3 publisherClass:0];

  return v4;
}

void sub_100001A8C(id a1)
{
  qword_100008B18 = (uint64_t)os_log_create("com.apple.remotemanagementd", "watchEnrollmentAdapter");

  _objc_release_x1();
}

void sub_100001BFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[RMLog watchEnrollmentAdapter];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100002880();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5
      && [v5 count]
      && ([v5 anyObject],
          v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = +[RMStoreDeclarationKey newDeclarationKey:v8], v8, v9))
    {
      v10 = +[NSSet setWithObject:v9];
    }
    else
    {
      v10 = objc_opt_new();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100001EFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = +[RMLog watchEnrollmentAdapter];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000028E8();
    }

    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100002014;
    v10[3] = &unk_1000041E8;
    uint64_t v9 = *(void *)(a1 + 64);
    id v12 = *(id *)(a1 + 56);
    id v11 = v5;
    [v7 _removeDeclarationKeyIfNeeded:v8 scope:v9 completionHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) _applyConfiguration:*(void *)(a1 + 48) replaceKey:*(void *)(a1 + 40) scope:*(void *)(a1 + 64) anchorCertificates:a2 completionHandler:*(void *)(a1 + 56)];
  }
}

uint64_t sub_100002014(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_100002534(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[RMLog watchEnrollmentAdapter];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100002950();
    }

    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000264C;
    v8[3] = &unk_1000041E8;
    uint64_t v7 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    id v9 = v3;
    [v5 _removeDeclarationKeyIfNeeded:v6 scope:v7 completionHandler:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_10000264C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_10000272C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[RMLog watchEnrollmentAdapter];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000029B8();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000027AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002880()
{
  sub_1000027C8();
  sub_1000027AC((void *)&_mh_execute_header, v0, v1, "Unable to get enrollment declaration keys: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000028E8()
{
  sub_1000027C8();
  sub_1000027AC((void *)&_mh_execute_header, v0, v1, "Failed to resolve asset: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100002950()
{
  sub_1000027C8();
  sub_1000027AC((void *)&_mh_execute_header, v0, v1, "Unable to stage enrollment info: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000029B8()
{
  sub_1000027C8();
  sub_1000027AC((void *)&_mh_execute_header, v0, v1, "Unable to unstage enrollment info: %{public}@", v2, v3, v4, v5, v6);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_declaration(void *a1, const char *a2, ...)
{
  return [a1 declaration];
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 declarationIdentifier];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_payloadAnchorCertificateAssetReferences(void *a1, const char *a2, ...)
{
  return [a1 payloadAnchorCertificateAssetReferences];
}

id objc_msgSend_payloadEnrollmentProfileURL(void *a1, const char *a2, ...)
{
  return [a1 payloadEnrollmentProfileURL];
}

id objc_msgSend_registeredIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredIdentifier];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_watchEnrollmentAdapter(void *a1, const char *a2, ...)
{
  return [a1 watchEnrollmentAdapter];
}