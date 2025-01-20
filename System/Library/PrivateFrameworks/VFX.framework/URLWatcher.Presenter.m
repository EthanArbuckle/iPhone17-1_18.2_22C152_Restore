@interface URLWatcher.Presenter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter)init;
- (void)presentedItemDidChange;
@end

@implementation URLWatcher.Presenter

- (NSURL)presentedItemURL
{
  sub_1B6C17FCC(0, (unint64_t *)&qword_1EB9857F0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v3 - 8, v4);
  v6 = (char *)&v12 - v5;
  v7 = (char *)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_url;
  uint64_t v8 = sub_1B6E30F48();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1B6E30E78();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v10;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  id v2 = objc_msgSend(self, sel_mainQueue);

  return (NSOperationQueue *)v2;
}

- (void)presentedItemDidChange
{
  id v2 = self;
  sub_1B6C17224();
}

- (_TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter)init
{
  result = (_TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_url;
  uint64_t v4 = sub_1B6E30F48();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1B6C17EF4((uint64_t)self + OBJC_IVAR____TtCC3VFX10URLWatcherP33_98C17C331D2C865219A0B9EDA6B0BCC59Presenter_lastModificationDate, &qword_1E9DD7200, MEMORY[0x1E4F27928]);

  swift_weakDestroy();
}

@end