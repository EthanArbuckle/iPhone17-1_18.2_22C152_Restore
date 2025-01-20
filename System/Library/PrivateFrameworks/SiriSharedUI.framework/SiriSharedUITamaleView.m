@interface SiriSharedUITamaleView
- (NSString)bundleIdentifier;
- (NSString)sceneIdentifier;
- (SiriSharedUITamaleView)initWithCoder:(id)a3;
- (SiriSharedUITamaleView)initWithDelegate:(id)a3;
- (SiriSharedUITamaleView)initWithFrame:(CGRect)a3;
- (SiriSharedUITamaleViewDelegate)delegate;
- (void)clientIsReady;
- (void)setDelegate:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)siriDidDismissResults;
- (void)siriWillPresentResult;
- (void)siriWillProcessRequest;
@end

@implementation SiriSharedUITamaleView

- (NSString)sceneIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20CA82EF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setSceneIdentifier:(id)a3
{
  uint64_t v4 = sub_20CA82F08();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___SiriSharedUITamaleView_sceneIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)bundleIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_20CA82EF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (SiriSharedUITamaleViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___SiriSharedUITamaleView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x210553300](v2);
  return (SiriSharedUITamaleViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUITamaleView)initWithDelegate:(id)a3
{
  return (SiriSharedUITamaleView *)SiriSharedUITamaleView.init(delegate:)();
}

- (SiriSharedUITamaleView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (SiriSharedUITamaleView *)sub_20CA83348();
  __break(1u);
  return result;
}

- (SiriSharedUITamaleView)initWithFrame:(CGRect)a3
{
  result = (SiriSharedUITamaleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SiriSharedUITamaleView_delegate;
  sub_20CA202D4((uint64_t)v3);
}

- (void)siriWillPresentResult
{
  v2 = self;
  SiriSharedUITamaleView.siriWillPresentResult()();
}

- (void)siriWillProcessRequest
{
  v2 = self;
  SiriSharedUITamaleView.siriWillProcessRequest()();
}

- (void)siriDidDismissResults
{
  v2 = self;
  SiriSharedUITamaleView.siriDidDismissResults()();
}

- (void)clientIsReady
{
  uint64_t v2 = qword_2676EB730;
  uint64_t v6 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_20CA82288();
  __swift_project_value_buffer(v3, (uint64_t)qword_2676EC890);
  os_log_type_t v4 = sub_20CA830F8();
  sub_20CA368D4(v4, 0x100000000, 0x7349746E65696C63, 0xEF29287964616552, 0x6920746E65696C63, 0xEF79646165722073);
  id v5 = [(SiriSharedUITamaleView *)v6 delegate];
  if (v5)
  {
    [(SiriSharedUITamaleViewDelegate *)v5 tamaleViewDidLoad];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end