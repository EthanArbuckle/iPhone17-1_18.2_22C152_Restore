int64_t sub_100003A8C(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  DEAttachmentItem *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a2;
  v5 = [(DEAttachmentItem *)a3 modificationDate];
  v6 = [(DEAttachmentItem *)v4 modificationDate];

  v7 = [v5 compare:v6];
  return (int64_t)v7;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_attachmentList(void *a1, const char *a2, ...)
{
  return [a1 attachmentList];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}