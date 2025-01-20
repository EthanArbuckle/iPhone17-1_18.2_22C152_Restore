@interface DOCColumnInfoViewController
- (_TtC5Files27DOCColumnInfoViewController)initWithCoder:(id)a3;
- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting;
- (id)actionContextFrom:(id)a3;
- (void)_doc_performLiveResizeSkipped_updateOverlay;
- (void)observeEditingStateChangedWithNotification:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCColumnInfoViewController

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100290248();

  swift_unknownObjectRelease();
}

- (_TtC5Files27DOCColumnInfoViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files27DOCColumnInfoViewController_itemInfoViewController) = 0;
  id v4 = a3;

  result = (_TtC5Files27DOCColumnInfoViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)observeEditingStateChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10028F864(v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10028FAAC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files27DOCColumnInfoViewController_itemInfoViewController);
}

- (void)_doc_performLiveResizeSkipped_updateOverlay
{
  v2 = self;
  sub_10028FDE0();
}

- (id)actionContextFrom:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  id v6 = sub_1003DBDDC();

  sub_1000CBBA4((uint64_t)v8, (uint64_t *)&unk_100705D60);

  return v6;
}

@end