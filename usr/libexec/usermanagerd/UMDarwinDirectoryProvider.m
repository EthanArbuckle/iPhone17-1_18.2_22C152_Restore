@interface UMDarwinDirectoryProvider
- (BOOL)updateLocalUsersAndGroupsWithError:(id *)a3 updater:(id)a4;
- (void)initializeLocalUsersAndGroups:(id)a3;
@end

@implementation UMDarwinDirectoryProvider

- (void)initializeLocalUsersAndGroups:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  DDIInitializeLocalUsersAndGroups();
}

- (BOOL)updateLocalUsersAndGroupsWithError:(id *)a3 updater:(id)a4
{
  id v5 = a4;
  if (a3) {
    *a3 = 0;
  }
  id v6 = v5;
  char v7 = DDIUpdateLocalUsersAndGroups();
  id v8 = 0;
  if ((v7 & 1) == 0)
  {
    if (qword_1000E4230 != -1) {
      dispatch_once(&qword_1000E4230, &stru_1000D5DB0);
    }
    v9 = (id)qword_1000E4228;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = sub_100055404(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        v12 = (const char *)_os_log_send_and_compose_impl();
        v13 = (char *)v12;
        if (v12) {
          sub_100055434(v12);
        }
      }
      else
      {
        v13 = 0;
      }
      free(v13);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

@end