@interface ULTimerFactory(queueSetter)
@end

@implementation ULTimerFactory(queueSetter)

+ (void)setPrimaryQueue:()queueSetter .cold.1()
{
  v0 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_25631F000, v1, v2, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v21, v22, v23, v24, v25);
  }

  v7 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_25631F000, v8, v9, v10, "#ULTimerFactory, Trying to set a global queue while a different global queue is already set", "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v21, v22, v23, v24, v25);
  }

  v13 = _CLLogObjectForCategory_MicroLocation_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_25631F000, v14, v15, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to set a global queue while a different global queue is already set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v21, v22, v23, v24, v25);
  }

  v20 = (boost::exception_detail::clone_base *)abort_report_np();
  boost::exception_detail::clone_base::~clone_base(v20);
}

@end