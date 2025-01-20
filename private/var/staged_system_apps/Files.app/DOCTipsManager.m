@interface DOCTipsManager
- (_TtC5Files14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC5Files14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_1000CBE70((uint64_t *)&unk_1007076D0);
    Task.cancel()();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10009B1B8((uint64_t)self + OBJC_IVAR____TtC5Files14DOCTipsManager_familyFetcher);

  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files14DOCTipsManager_familyFolderFilePath, &qword_1007076B0);
  swift_release();

  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_1001434A0(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_100147744();
}

- (_TtC5Files14DOCTipsManager)init
{
  result = (_TtC5Files14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end