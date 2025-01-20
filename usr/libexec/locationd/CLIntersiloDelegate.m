@interface CLIntersiloDelegate
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation CLIntersiloDelegate

- (BOOL)valid
{
  return 1;
}

- (void)setValid:(BOOL)a3
{
  if (qword_102419530 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234CA50);
      }
    }
    v4 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "This delegate cannot be invalidated", "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234CA50);
      }
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      __int16 v10 = 2082;
      v11 = "assert";
      __int16 v12 = 2081;
      v13 = "false";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"This delegate cannot be invalidated\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_102419530, &stru_10234CA50);
  }
}

@end