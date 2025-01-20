@interface UNNotificationResponse
- (int64_t)mt_actionType;
@end

@implementation UNNotificationResponse

- (int64_t)mt_actionType
{
  [(UNNotificationResponse *)self actionIdentifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001064C;
  v7[3] = &unk_10002CF10;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = v8;
  v3 = sub_1000102DC(v7);
  v4 = v3;
  if (v3) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0;
  }

  return (int64_t)v5;
}

@end