@interface JSAFamilySharing
+ (void)launchFamilySharingSettings;
@end

@implementation JSAFamilySharing

+ (void)launchFamilySharingSettings
{
  BOOL v2 = +[NSThread isMainThread];
  if (v2)
  {
    sub_18CD8((id)v2);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_18D60;
    block[3] = &unk_B2028;
    v4 = &stru_B2C08;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

@end