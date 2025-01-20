@interface BannerViewControllerBase
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isDraggingDismissalEnabled;
- (NSString)description;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC17proximitycontrold24BannerViewControllerBase)initWithCoder:(id)a3;
- (_TtC17proximitycontrold24BannerViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
@end

@implementation BannerViewControllerBase

- (_TtC17proximitycontrold24BannerViewControllerBase)initWithCoder:(id)a3
{
  *(void *)&self->requestID[OBJC_IVAR____TtC17proximitycontrold24BannerViewControllerBase_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC17proximitycontrold24BannerViewControllerBase *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1001F6710();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for BannerViewControllerBase();
  [(BannerViewControllerBase *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC17proximitycontrold24BannerViewControllerBase_delegate;

  sub_100024144((uint64_t)v3);
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (NSString)requesterIdentifier
{
  static String._fromUTF8Repairing(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)requestIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableWillAppearAsBanner:(id)a3
{
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  swift_unknownObjectRetain();
  NSString v4 = self;
  id v5 = sub_1001F6710();
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 ulog:40 message:v6];
  swift_unknownObjectRelease();
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  swift_unknownObjectRetain();
  NSString v4 = self;
  id v5 = sub_1001F6710();
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 ulog:40 message:v6];
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (NSString)description
{
  NSString v2 = self;
  sub_1000B436C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC17proximitycontrold24BannerViewControllerBase)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17proximitycontrold24BannerViewControllerBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end