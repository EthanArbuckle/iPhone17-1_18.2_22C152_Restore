uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t _MBLog()
{
  return __MBLog();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}
oolAnswer())
  {
    v3 = NSTemporaryDirectory();
    v4 = [v3 stringByAppendingPathComponent:@"ttr-MobileBackup.logs.tar.gz"];

    v5 = [objc_alloc((Class)MBManager) initWithDelegate:0];
    v11 = 0;
    v6 = [v5 archiveLogsTo:v4 error:&v11];
    v7 = v11;
    if (v6)
    {
      v8 = +[DEAttachmentItem attachmentWithPath:v4];
      [v8 setDeleteOnAttach:&__kCFBooleanTrue];
      v12 = v8;
      v9 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Archiving logs failed: %@", buf, 0xCu);
        _MBLog();
      }
      v9 = &__NSArray0__struct;
    }
  }
  else
  {
    v9 = &__NSArray0__struct;
  }
  return v9;
}

@end