@interface CSDRelayIDSService
+ (id)sharedInstance;
- (void)_handlePairedDeviceChangedFrom:(id)a3 to:(id)a4;
- (void)handleActiveAccountsChanged:(id)a3;
@end

@implementation CSDRelayIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E768;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C278 != -1) {
    dispatch_once(&qword_10058C278, block);
  }
  v2 = (void *)qword_10058C270;

  return v2;
}

- (void)handleActiveAccountsChanged:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSDRelayIDSService;
  [(CSDIDSService *)&v5 handleActiveAccountsChanged:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"CSDRelayIDSActiveAccountsChanged" object:self];
}

- (void)_handlePairedDeviceChangedFrom:(id)a3 to:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v10 && v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = v7;
    CFStringRef v9 = @"CSDRelayPairedDeviceConnectedNotification";
LABEL_7:
    [v7 postNotificationName:v9 object:self];

    goto LABEL_8;
  }
  if (v10 && !v6)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    v8 = v7;
    CFStringRef v9 = @"CSDRelayPairedDeviceDisconnectedNotification";
    goto LABEL_7;
  }
LABEL_8:
}

@end