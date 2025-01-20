@interface CKKSNotifyPostNotifier
+ (void)post:(id)a3;
@end

@implementation CKKSNotifyPostNotifier

+ (void)post:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "posting notification %@", (uint8_t *)&v5, 0xCu);
    }

    notify_post((const char *)[v3 UTF8String]);
  }
}

@end