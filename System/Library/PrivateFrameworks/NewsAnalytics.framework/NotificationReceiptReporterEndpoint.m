@interface NotificationReceiptReporterEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
- (id)endpointURLWithContentType:(int64_t)a3;
@end

@implementation NotificationReceiptReporterEndpoint

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DE47FE60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSURL)url
{
  v2 = (void *)sub_1DE47E5B0();

  return (NSURL *)v2;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)0;
}

- (id)endpointURLWithContentType:(int64_t)a3
{
  sub_1DE06D0FC(0, (unint64_t *)&qword_1EBEC1C70, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v15 - v6;
  if ((unint64_t)a3 > 7)
  {
    uint64_t v13 = sub_1DE47E5E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
    v12 = 0;
  }
  else
  {
    if (a3 == 5) {
      uint64_t v8 = OBJC_IVAR____TtC13NewsAnalyticsP33_73410A717757B42F2A6F1BC37191285735NotificationReceiptReporterEndpoint_notificationReceiptURL;
    }
    else {
      uint64_t v8 = OBJC_IVAR____TtC13NewsAnalyticsP33_73410A717757B42F2A6F1BC37191285735NotificationReceiptReporterEndpoint_defaultURL;
    }
    v9 = (char *)self + v8;
    uint64_t v10 = sub_1DE47E5E0();
    uint64_t v11 = *(void *)(v10 - 8);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
    {
      v12 = (void *)sub_1DE47E5B0();
      sub_1DE47E5E0();
      (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
    }
  }

  return v12;
}

@end