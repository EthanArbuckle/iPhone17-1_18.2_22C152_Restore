uint64_t sub_100003834()
{
  if (qword_100008008 != -1) {
    dispatch_once(&qword_100008008, &stru_100004048);
  }
  return qword_100008000;
}

void sub_100003878(id a1)
{
  qword_100008000 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Database");

  _objc_release_x1();
}

uint64_t sub_1000038BC()
{
  if (qword_100008018 != -1) {
    dispatch_once(&qword_100008018, &stru_100004068);
  }
  return qword_100008010;
}

void sub_100003900(id a1)
{
  qword_100008010 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Download");

  _objc_release_x1();
}

uint64_t sub_100003944()
{
  if (qword_100008028 != -1) {
    dispatch_once(&qword_100008028, &stru_100004088);
  }
  return qword_100008020;
}

void sub_100003988(id a1)
{
  qword_100008020 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "EnabledState");

  _objc_release_x1();
}

uint64_t sub_1000039CC()
{
  if (qword_100008038 != -1) {
    dispatch_once(&qword_100008038, &stru_1000040A8);
  }
  return qword_100008030;
}

void sub_100003A10(id a1)
{
  qword_100008030 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "FullHash");

  _objc_release_x1();
}

uint64_t sub_100003A54()
{
  if (qword_100008048 != -1) {
    dispatch_once(&qword_100008048, &stru_1000040C8);
  }
  return qword_100008040;
}

void sub_100003A98(id a1)
{
  qword_100008040 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Lookup");

  _objc_release_x1();
}

uint64_t sub_100003ADC()
{
  if (qword_100008058 != -1) {
    dispatch_once(&qword_100008058, &stru_1000040E8);
  }
  return qword_100008050;
}

void sub_100003B20(id a1)
{
  qword_100008050 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Parser");

  _objc_release_x1();
}

uint64_t sub_100003B64()
{
  if (qword_100008068 != -1) {
    dispatch_once(&qword_100008068, &stru_100004108);
  }
  return qword_100008060;
}

void sub_100003BA8(id a1)
{
  qword_100008060 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Platform");

  _objc_release_x1();
}

uint64_t sub_100003BEC()
{
  if (qword_100008078 != -1) {
    dispatch_once(&qword_100008078, &stru_100004128);
  }
  return qword_100008070;
}

void sub_100003C30(id a1)
{
  qword_100008070 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "RemoteConfiguration");

  _objc_release_x1();
}

uint64_t sub_100003C74()
{
  if (qword_100008088 != -1) {
    dispatch_once(&qword_100008088, &stru_100004148);
  }
  return qword_100008080;
}

void sub_100003CB8(id a1)
{
  qword_100008080 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Sandbox");

  _objc_release_x1();
}

uint64_t sub_100003CFC()
{
  if (qword_100008098 != -1) {
    dispatch_once(&qword_100008098, &stru_100004168);
  }
  return qword_100008090;
}

void sub_100003D40(id a1)
{
  qword_100008090 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "Service");

  _objc_release_x1();
}

uint64_t sub_100003D84()
{
  if (qword_1000080A8 != -1) {
    dispatch_once(&qword_1000080A8, &stru_100004188);
  }
  return qword_1000080A0;
}

void sub_100003DC8(id a1)
{
  qword_1000080A0 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "XPC");

  _objc_release_x1();
}

uint64_t sub_100003E0C()
{
  if (qword_1000080B8 != -1) {
    dispatch_once(&qword_1000080B8, &stru_1000041A8);
  }
  return qword_1000080B0;
}

void sub_100003E50(id a1)
{
  qword_1000080B0 = (uint64_t)os_log_create("com.apple.Safari.SafeBrowsing", "DeviceIdentificationToken");

  _objc_release_x1();
}

void start()
{
  v0 = (SafeBrowsing::Service *)_set_user_dir_suffix();
  v1 = (SafeBrowsing::Service *)SafeBrowsing::Service::main(v0);
  SafeBrowsing::Service::main(v1);
}

uint64_t SafeBrowsing::Service::main(SafeBrowsing::Service *this)
{
  return SafeBrowsing::Service::main(this);
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}