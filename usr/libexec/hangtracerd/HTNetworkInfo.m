@interface HTNetworkInfo
+ (id)networkStateForTailSpin;
@end

@implementation HTNetworkInfo

+ (id)networkStateForTailSpin
{
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  if (!evaluator_for_endpoint)
  {
    v4 = sub_100027DEC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No evaluator for network state", v12, 2u);
    }
    goto LABEL_8;
  }
  v3 = nw_path_evaluator_copy_path();
  v4 = v3;
  if (!v3)
  {
    v5 = sub_100027DEC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No path for network state", v12, 2u);
    }
    v7 = 0;
    goto LABEL_20;
  }
  if (nw_path_get_status(v3) != nw_path_status_satisfied)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_21;
  }
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (nw_path_uses_interface_type(v4, nw_interface_type_wifi))
  {
    CFStringRef v6 = @"Wi-Fi";
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_cellular))
  {
    CFStringRef v6 = @"Cell";
  }
  else if (nw_path_uses_interface_type(v4, nw_interface_type_wired))
  {
    CFStringRef v6 = @"Wired";
  }
  else
  {
    CFStringRef v6 = @"Other";
  }
  [v5 setObject:v6 forKeyedSubscript:@"Primary"];
  uint64_t interface_time_delta = nw_path_get_interface_time_delta();
  v9 = +[NSNumber numberWithUnsignedInt:interface_time_delta];
  [v5 setObject:v9 forKeyedSubscript:@"SecondsSincePrimary"];

  v10 = sub_100027DEC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10003189C(v5, interface_time_delta, v10);
  }

  CFStringRef v13 = @"NetworkState";
  v14 = v5;
  v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
LABEL_20:

LABEL_21:

  return v7;
}

@end