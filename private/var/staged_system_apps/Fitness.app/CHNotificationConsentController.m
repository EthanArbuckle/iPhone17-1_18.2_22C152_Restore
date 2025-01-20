@interface CHNotificationConsentController
+ (id)makeNotificationConsentViewController:(BOOL)a3 buttonHandler:(id)a4;
+ (void)updateAuthorization;
- (CHNotificationConsentController)init;
@end

@implementation CHNotificationConsentController

+ (void)updateAuthorization
{
  if (([self isRunningInStoreDemoMode] & 1) == 0)
  {
    id v2 = [self currentNotificationCenter];
    v4[4] = sub_10002A9BC;
    v4[5] = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_10000D15C;
    v4[3] = &unk_1008CD8C8;
    v3 = _Block_copy(v4);
    [v2 requestAuthorizationWithOptions:39 completionHandler:v3];

    _Block_release(v3);
  }
}

+ (id)makeNotificationConsentViewController:(BOOL)a3 buttonHandler:(id)a4
{
  BOOL v5 = a3;
  uint64_t v6 = type metadata accessor for ContentAvailability();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v19 - v11;
  v13 = _Block_copy(a4);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    v13 = sub_1001A7D48;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = (unsigned int *)&enum case for ContentAvailability.available(_:);
  if (!v5) {
    v15 = (unsigned int *)&enum case for ContentAvailability.unavailableStoreFront(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v12, *v15, v6);
  type metadata accessor for NotificationConsentViewController();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v16 = (void *)NotificationConsentViewController.__allocating_init(contentAvailability:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  *(void *)(v17 + 24) = v14;
  sub_10008A670((uint64_t)v13);
  NotificationConsentViewController.continueButtonHandler.setter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  sub_10005E5F8((uint64_t)v13);

  return v16;
}

- (CHNotificationConsentController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationConsentController();
  return [(CHNotificationConsentController *)&v3 init];
}

@end