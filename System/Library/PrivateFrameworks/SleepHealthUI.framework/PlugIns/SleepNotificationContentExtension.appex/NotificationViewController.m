@interface NotificationViewController
- (NotificationViewController)initWithCoder:(id)a3;
- (NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)viewDidLoad;
@end

@implementation NotificationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100003234();
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000339C(v4);
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = v6;
  id v8 = a3;
  v9 = self;
  sub_100004060(v8, (void (*)(uint64_t))sub_100006960, v7);

  swift_release();
}

- (NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006BA0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (NotificationViewController *)sub_100005890(v5, v7, a4);
}

- (NotificationViewController)initWithCoder:(id)a3
{
  return (NotificationViewController *)sub_1000059F0(a3);
}

- (void).cxx_destruct
{
}

@end