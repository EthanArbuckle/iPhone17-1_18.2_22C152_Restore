@interface PPEventStreamHandler
+ (void)prepareToHandleNotificationWithName:(id)a3;
@end

@implementation PPEventStreamHandler

+ (void)prepareToHandleNotificationWithName:(id)a3
{
  if ([a3 isEqualToString:@"ABAddressBookMeCardChangeDistributedNotification"])
  {
    v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "instantiating contact store to deal with Me card change", v5, 2u);
    }

    id v4 = +[PPLocalContactStore defaultStore];
  }
}

@end