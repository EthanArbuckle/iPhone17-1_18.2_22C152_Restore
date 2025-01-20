@interface FRArticleNotificationPostProcessingCoordinator
- (FRArticleNotificationPostProcessingCoordinator)init;
- (void)notificationArrived:(UNNotificationContent *)a3 completionHandler:(id)a4;
@end

@implementation FRArticleNotificationPostProcessingCoordinator

- (FRArticleNotificationPostProcessingCoordinator)init
{
  return (FRArticleNotificationPostProcessingCoordinator *)sub_100009A20();
}

- (void)notificationArrived:(UNNotificationContent *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000099DC(&qword_10002DDD0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_10001F2B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10002DE48;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10002DE58;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000C32C((uint64_t)v9, (uint64_t)&unk_10002DE68, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
}

@end