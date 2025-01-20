@interface HandoffFeedbackBannerPresenter
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)providesHostedContent;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (_TtC17proximitycontrold30HandoffFeedbackBannerPresenter)initWithCoder:(id)a3;
- (_TtC17proximitycontrold30HandoffFeedbackBannerPresenter)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bannerTap;
- (void)dealloc;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)thumbsDown;
- (void)thumbsUp;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLoad;
@end

@implementation HandoffFeedbackBannerPresenter

- (NSString)requesterIdentifier
{
  return (NSString *)sub_100017B84();
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_100017B84();
}

- (_TtC17proximitycontrold30HandoffFeedbackBannerPresenter)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001D7F4();
}

- (void)dealloc
{
  uint64_t v2 = qword_10035A4E0;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10001D758(v4, (uint64_t)qword_10035C450);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Deinit", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HandoffFeedbackBannerPresenter();
  [(HandoffFeedbackBannerPresenter *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17proximitycontrold30HandoffFeedbackBannerPresenter_bannerSource));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17proximitycontrold30HandoffFeedbackBannerPresenter_pillView));

  swift_release();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HandoffFeedbackBannerPresenter();
  uint64_t v2 = (char *)v5.receiver;
  [(HandoffFeedbackBannerPresenter *)&v5 viewDidLoad];
  id v3 = [v2 view:v5.receiver super_class:v5.super_class];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 addSubview:*(void *)&v2[OBJC_IVAR____TtC17proximitycontrold30HandoffFeedbackBannerPresenter_pillView]];
  }
  else
  {
    __break(1u);
  }
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17proximitycontrold30HandoffFeedbackBannerPresenter_pillView) systemLayoutSizeFittingSize:a3.width, a3.height, a4.width, a4.height];
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC17proximitycontrold30HandoffFeedbackBannerPresenter_pillView) shadowOutsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)bannerTap
{
}

- (void)thumbsDown
{
}

- (void)thumbsUp
{
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
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC17proximitycontrold30HandoffFeedbackBannerPresenter)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  UIEdgeInsets result = (_TtC17proximitycontrold30HandoffFeedbackBannerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end