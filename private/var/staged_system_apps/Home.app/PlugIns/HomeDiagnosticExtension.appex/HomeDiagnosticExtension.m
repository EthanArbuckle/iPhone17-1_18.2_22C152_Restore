void sub_1000035FC(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find directory: %@.", (uint8_t *)&v1, 0xCu);
}

void sub_100003678(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to find contents in directory: %@.", (uint8_t *)&v2, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void objc_enumerationMutation(id obj)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__notifyHomeApps(void *a1, const char *a2, ...)
{
  return [a1 _notifyHomeApps];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}
  if (*(void *)v40 != v12) {
                objc_enumerationMutation(v8);
  }
              v14 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v13) path];
              if ([v14 containsString:v11])
              {
                v15 = [v14 lastPathComponent];
                v16 = [v15 stringByReplacingOccurrencesOfString:@".plist" withString:&stru_100004178];

                v38 = v16;
                v17 = [v16 componentsSeparatedByString:@"_"];
                v18 = [v17 objectAtIndexedSubscript:[v17 count] - 2];
                v19 = [v17 lastObject];
                v37 = (void *)v18;
                v20 = +[NSString stringWithFormat:@"%@_%@", v18, v19];
                v21 = objc_alloc_init((Class)NSDateFormatter);
                [v21 setDateFormat:@"MM-dd-yyyy_HH:mm:ss"];
                v22 = [v21 dateFromString:v20];
                [v22 timeIntervalSinceNow];
                if (v23 > -18000.0)
                {
                  +[DEAttachmentItem attachmentWithPath:v14];
                  v24 = v11;
                  v26 = v25 = v8;
                  [v34 addObject:v26];

                  v8 = v25;
                  v11 = v24;
                }

                v12 = v35;
                v10 = v36;
              }

              v13 = (char *)v13 + 1;
            }
            while (v10 != v13);
            v10 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v10);
        }

        v27 = [v34 copy];
        v4 = v32;
        uint64_t v3 = v33;
        v6 = v30;
        v7 = v31;
        goto LABEL_24;
      }
    }
    else
    {
      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_100003678((uint64_t)v7, v28);
      }
    }
    v27 = &__NSArray0__struct;
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000035FC(log);
  }
  v7 = 0;
  v27 = &__NSArray0__struct;
LABEL_25:

  return v27;
}

- (void)_notifyHomeApps
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Posting kHomeDiagnosticExtensionAttachmentRequestNotification", v4, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"HomeDiagnosticExtensionAttachmentRequestNotification", 0, 0, 1u);
}

- (void).cxx_destruct
{
}

@end