@interface ActionViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (_TtC20TranslationUIService20ActionViewController)initWithCoder:(id)a3;
- (_TtC20TranslationUIService20ActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActionViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)_willAppearInRemoteViewController
{
  v2 = self;
  sub_100006764();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100006F04();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionViewController();
  id v4 = v6.receiver;
  [(ActionViewController *)&v6 viewWillAppear:v3];
  v5 = (void *)sub_100007E84();
  if (v5)
  {
    objc_msgSend(v5, "remoteIsReady", v6.receiver, v6.super_class);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActionViewController();
  id v4 = v5.receiver;
  [(ActionViewController *)&v5 viewWillDisappear:v3];
  sub_100005ED8();
  sub_1000256A8();

  swift_release();
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  BOOL v3 = self;
  sub_100005E3C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_100049288();
}

+ (id)_exportedInterface
{
  return sub_100007F60((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef___LTUI_viewServiceExtensionInterface);
}

+ (id)_remoteViewControllerInterface
{
  return sub_100007F60((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef___LTUI_viewServiceExtensionHostInterface);
}

- (_TtC20TranslationUIService20ActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100049EA8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20TranslationUIService20ActionViewController *)sub_100007FAC(v5, v7, a4);
}

- (_TtC20TranslationUIService20ActionViewController)initWithCoder:(id)a3
{
  return (_TtC20TranslationUIService20ActionViewController *)sub_1000080BC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20TranslationUIService20ActionViewController____lazy_storage___hostNavigationController);
}

@end