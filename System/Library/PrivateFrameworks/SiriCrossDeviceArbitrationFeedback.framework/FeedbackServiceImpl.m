@interface FeedbackServiceImpl
+ (NSURL)receivedArbitrationsDirectoryURL;
+ (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)sharedService;
- (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)init;
- (_TtP34SiriCrossDeviceArbitrationFeedback23FeedbackServiceDelegate_)delegate;
- (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_)globals;
- (void)add:(id)a3;
- (void)addWithParticipation:(id)a3 directoryPath:(id)a4;
- (void)handleAssistantDismissed;
- (void)handleWithResponse:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGlobals:(id)a3;
@end

@implementation FeedbackServiceImpl

+ (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)sharedService
{
  id v2 = static FeedbackServiceImpl.sharedService.getter();

  return (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *)v2;
}

- (_TtP34SiriCrossDeviceArbitrationFeedback23FeedbackServiceDelegate_)delegate
{
  id v2 = (void *)sub_25C78CF30();

  return (_TtP34SiriCrossDeviceArbitrationFeedback23FeedbackServiceDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C78CFDC((uint64_t)a3);
}

- (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_)globals
{
  id v2 = self;
  id v3 = sub_25C78D2DC();

  return (_TtP34SiriCrossDeviceArbitrationFeedback7Globals_ *)v3;
}

- (void)setGlobals:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C78D3DC((uint64_t)a3);
}

+ (NSURL)receivedArbitrationsDirectoryURL
{
  uint64_t v2 = sub_25C7B48B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static FeedbackServiceImpl.receivedArbitrationsDirectoryURL.getter();
  v6 = (void *)sub_25C7B4870();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSURL *)v6;
}

- (void)add:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C78D4D0(v4);
}

- (void)addWithParticipation:(id)a3 directoryPath:(id)a4
{
  uint64_t v6 = sub_25C7B4D00();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_25C78D618(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)handleAssistantDismissed
{
  uint64_t v2 = self;
  sub_25C78F25C();
}

- (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl)init
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl *)FeedbackServiceImpl.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34SiriCrossDeviceArbitrationFeedback19FeedbackServiceImpl____lazy_storage___notificationService));

  swift_unknownObjectRelease();
}

- (void)handleWithResponse:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_25C78F564(v7, (uint64_t)v8, (void (**)(void))v6);
  _Block_release(v6);
}

@end