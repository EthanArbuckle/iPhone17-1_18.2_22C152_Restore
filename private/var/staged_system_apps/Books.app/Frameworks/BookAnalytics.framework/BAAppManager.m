@interface BAAppManager
+ (BAAppManager)sharedManager;
- (BAAppManager)init;
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
- (void)appSessionDidTerminate;
- (void)privacyAcknowledgementNotification:(id)a3;
- (void)startAppSessionWithApplicationGroupIdentifier:(id)a3 enableUploads:(BOOL)a4;
@end

@implementation BAAppManager

+ (BAAppManager)sharedManager
{
  if (qword_3159E8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_31FB10;

  return (BAAppManager *)v2;
}

- (BAAppManager)init
{
  return (BAAppManager *)sub_16B274();
}

- (void)startAppSessionWithApplicationGroupIdentifier:(id)a3 enableUploads:(BOOL)a4
{
  uint64_t v6 = sub_27DDB0();
  uint64_t v8 = v7;
  v9 = self;
  sub_16B504(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)appSessionDidTerminate
{
  v2 = self;
  sub_27D1B0(1.0);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___BAAppManager_targetURL;

  sub_16E300((uint64_t)v3);
}

- (void)privacyAcknowledgementNotification:(id)a3
{
  uint64_t v3 = sub_27CF20();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_27CF10();
  sub_16E800();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (NSURL)url
{
  uint64_t v3 = sub_27CFF0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  AppManager.url.getter((uint64_t)v6);

  sub_27CFC0(v8);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSURL *)v10;
}

- (NSString)name
{
  v2 = self;
  sub_16D930();

  NSString v3 = sub_27DDA0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)sharedContainerIdentifier
{
  v2 = (char *)self + OBJC_IVAR___BAAppManager_applicationGroupIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_27DDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

@end