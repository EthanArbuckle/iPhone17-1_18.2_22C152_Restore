@interface MFSwiftIMAPTaskManager
- (BOOL)createMailbox:(id)a3;
- (BOOL)deleteMailbox:(id)a3;
- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4;
- (MFSwiftIMAPTaskManager)init;
- (MFSwiftIMAPTaskManager)initWithAccount:(id)a3;
- (id)fetchSeparatorChar;
- (void)accountDidChange:(id)a3;
- (void)addLocalAction:(id)a3;
- (void)checkForNewLocalActions;
- (void)closeAllConnections;
- (void)dealloc;
- (void)fetchNow:(int)a3;
- (void)fetchNow:(int)a3 withMailboxes:(id)a4 completion:(id)a5;
- (void)localMailboxesDidChange;
- (void)startBackFillingMessageBodyDownloadWithRequest:(id)a3;
- (void)stopBackFillingMessageBodyDownload;
- (void)test_tearDown;
@end

@implementation MFSwiftIMAPTaskManager

- (MFSwiftIMAPTaskManager)initWithAccount:(id)a3
{
  id v3 = a3;
  return (MFSwiftIMAPTaskManager *)sub_1A84CCABC(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1A84CF8BC();
}

- (void).cxx_destruct
{
  swift_release();

  uint64_t v3 = OBJC_IVAR___MFSwiftIMAPTaskManager_logger;
  uint64_t v2 = sub_1A8A754D8();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  sub_1A809F920();
  swift_release();
  sub_1A84E1F2C((uint64_t)self + OBJC_IVAR___MFSwiftIMAPTaskManager__engineAndAdaptor);
}

- (void)test_tearDown
{
  uint64_t v2 = self;
  sub_1A84CFDBC();
}

- (MFSwiftIMAPTaskManager)init
{
  return (MFSwiftIMAPTaskManager *)sub_1A84D0360();
}

- (void)accountDidChange:(id)a3
{
  v14 = self;
  id v13 = a3;
  uint64_t v12 = sub_1A8A744F8();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13);
  uint64_t v11 = (uint64_t)&v7 - v8;
  id v5 = v4;
  v6 = self;
  sub_1A8A744D8();
  sub_1A84D201C(v11);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v12);
}

- (void)fetchNow:(int)a3
{
  uint64_t v3 = self;
  sub_1A84D5AFC(a3);
}

- (void)fetchNow:(int)a3 withMailboxes:(id)a4 completion:(id)a5
{
  id v5 = a4;
  id v13 = _Block_copy(a5);
  v6 = self;
  if (a4)
  {
    sub_1A81DC0F0();
    uint64_t v8 = sub_1A8A76C68();

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v13;
  sub_1A84D5B4C(a3, v9, (uint64_t)sub_1A84E2848, v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)startBackFillingMessageBodyDownloadWithRequest:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1A84D6F34((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)stopBackFillingMessageBodyDownload
{
  uint64_t v2 = self;
  sub_1A84D709C();
}

- (void)closeAllConnections
{
  uint64_t v2 = self;
  sub_1A84D9390();
}

- (BOOL)createMailbox:(id)a3
{
  id v3 = a3;
  id v4 = self;
  if (a3)
  {
    uint64_t v7 = sub_1A8A76558();
    uint64_t v8 = v5;

    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  sub_1A84DE04C(v9, v10);
  swift_bridgeObjectRelease();

  return sub_1A8A74E98() & 1;
}

- (BOOL)deleteMailbox:(id)a3
{
  id v3 = a3;
  id v4 = self;
  if (a3)
  {
    uint64_t v7 = sub_1A8A76558();
    uint64_t v8 = v5;

    uint64_t v9 = v7;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  sub_1A84DE7A8(v9, v10);
  swift_bridgeObjectRelease();

  return sub_1A8A74E98() & 1;
}

- (BOOL)renameMailbox:(id)a3 toMailbox:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  v6 = self;
  if (a3)
  {
    uint64_t v14 = sub_1A8A76558();
    uint64_t v15 = v7;

    uint64_t v16 = v14;
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  if (a4)
  {
    uint64_t v10 = sub_1A8A76558();
    uint64_t v11 = v8;

    uint64_t v12 = v10;
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  sub_1A84DEF04(v16, v17, v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_1A8A74E98() & 1;
}

- (void)localMailboxesDidChange
{
  uint64_t v2 = self;
  sub_1A84DF728();
}

- (id)fetchSeparatorChar
{
  uint64_t v2 = self;
  sub_1A84DF81C();
  uint64_t v8 = v3;

  if (v8)
  {
    uint64_t v5 = sub_1A8A76538();
    swift_bridgeObjectRelease();
    id v6 = (id)v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)addLocalAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A84E017C((uint64_t)a3);
}

- (void)checkForNewLocalActions
{
  uint64_t v2 = self;
  sub_1A84CC3B0();
}

@end