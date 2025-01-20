@interface FMDeviceEditableMessageViewController
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)completeActionWithSender:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
@end

@implementation FMDeviceEditableMessageViewController

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100088E04();
}

- (void)updateViewConstraints
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMDeviceEditableMessageViewController();
  v2 = (char *)v7.receiver;
  [(FMDeviceEditableMessageViewController *)&v7 updateViewConstraints];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_tableViewheightConstraint];
  if (v3)
  {
    id v4 = *(void **)&v2[OBJC_IVAR____TtC6FindMy31FMEditableMessageViewController_tableView];
    id v5 = v3;
    [v4 intrinsicContentSize];
    [v5 setConstant:v6];
  }
  else
  {
    __break(1u);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1000866CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)completeActionWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000890C0();
}

- (void).cxx_destruct
{
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_device, &qword_1006B2AF0);
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_primaryItemPart, (uint64_t *)&unk_1006AFE30);

  v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy37FMDeviceEditableMessageViewController_footerLabel];
}

@end