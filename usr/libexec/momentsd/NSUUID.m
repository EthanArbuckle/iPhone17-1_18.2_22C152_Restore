@interface NSUUID
+ (id)uuidFromString:(id)a3;
@end

@implementation NSUUID

+ (id)uuidFromString:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0xC)
  {
    v5 = +[NSString stringWithFormat:@"%@%@%@%@", v3, v3, v3, v3];
    v4 = [v5 dataUsingEncoding:4];
  }
  else
  {
    v4 = [v3 dataUsingEncoding:4];
  }
  if ((unint64_t)[v4 length] < 0xC)
  {
    id v6 = +[NSUUID UUID];
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v3;
      LOWORD(v11[0]) = 2112;
      *(void *)((char *)v11 + 2) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Input string is not valid, string, %@, UUID, %@", buf, 0x16u);
    }
  }
  else
  {
    [v4 getBytes:buf range:0, 12];
    v11[0] = [v3 hash];
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
  }

  return v6;
}

@end