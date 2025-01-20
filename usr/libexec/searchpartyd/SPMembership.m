@interface SPMembership
+ (BOOL)isLocalAccountUUID:(id)a3;
+ (id)currentMachineUserUUID;
@end

@implementation SPMembership

+ (BOOL)isLocalAccountUUID:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SPMembership isLocalAccountUUID: %@", buf, 0xCu);
  }
  memset(uu, 0, sizeof(uu));
  id v4 = v3;
  uuid_parse((const char *)[v4 UTF8String], uu);
  if (mbr_check_membership_by_id())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_101339A00();
    }
    BOOL v5 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v8 = v4;
      __int16 v9 = 1024;
      int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SPMembership isLocalAccountUUID: %@, LocalGroup: staff(20), result: %i", buf, 0x12u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)currentMachineUserUUID
{
  uid_t v2 = getuid();
  memset(uu, 0, sizeof(uu));
  if (mbr_uid_to_uuid(v2, uu))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_101339A48();
    }
    exit(1);
  }
  memset(v5, 0, sizeof(v5));
  uuid_unparse_upper(uu, v5);
  id v3 = +[NSString stringWithCString:v5 encoding:1];

  return v3;
}

@end