@interface ICCollaborationButtonsController
- (BOOL)accountHasKeychainEnabled;
- (BOOL)accountSupportsDeviceToDeviceEncryption;
- (BOOL)showsActivityStream;
- (BOOL)showsAttributionSidebar;
- (BOOL)showsCollaboratorCursors;
- (ICCloudSyncingObject)cloudObject;
- (ICCollaborationButtonsController)init;
- (ICCollaborationButtonsController)initWithCloudObject:(id)a3 coordinator:(id)a4;
- (NSArray)activeParticipants;
- (NSArray)activityDigestSummaryParticipants;
- (UIBarButtonItem)buttonItem;
- (id)didPressManageShareButton;
- (void)dealloc;
- (void)hideContactCard;
- (void)setAccountHasKeychainEnabled:(BOOL)a3;
- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3;
- (void)setActiveParticipants:(id)a3;
- (void)setActivityStreamWithVisible:(BOOL)a3;
- (void)setAttributionSidebarWithVisible:(BOOL)a3;
- (void)setButtonItem:(id)a3;
- (void)setCloudObject:(id)a3;
- (void)setDidPressManageShareButton:(id)a3;
- (void)setShowsActivityStream:(BOOL)a3;
- (void)setShowsAttributionSidebar:(BOOL)a3;
- (void)setShowsCollaboratorCursors:(BOOL)a3;
- (void)setShowsCollaboratorCursorsWithVisible:(BOOL)a3;
- (void)showAccountDeviceToDeviceEncryptionAlert;
- (void)showContactCardFor:(id)a3 from:(id)a4;
- (void)showEnableKeychainAlert;
- (void)showRecentUpdates;
- (void)showSelectionFor:(id)a3;
- (void)showShare;
- (void)updateState;
@end

@implementation ICCollaborationButtonsController

- (ICCollaborationButtonsController)initWithCloudObject:(id)a3 coordinator:(id)a4
{
  id v6 = a3;
  return (ICCollaborationButtonsController *)sub_100018550(a3, a4);
}

- (void)setDidPressManageShareButton:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_1001A36C4;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10002E70C(v8);
}

- (ICCloudSyncingObject)cloudObject
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();

  return (ICCloudSyncingObject *)v5;
}

- (void)setCloudObject:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  id v6 = self;
  id v7 = v5;
  static Published.subscript.setter();
  sub_100374F44();
}

- (BOOL)accountSupportsDeviceToDeviceEncryption
{
  return sub_1003752B4(self);
}

- (void)setAccountSupportsDeviceToDeviceEncryption:(BOOL)a3
{
}

- (BOOL)accountHasKeychainEnabled
{
  return sub_1003752B4(self);
}

- (void)setAccountHasKeychainEnabled:(BOOL)a3
{
}

- (BOOL)showsActivityStream
{
  return sub_1003752B4(self);
}

- (void)setShowsActivityStream:(BOOL)a3
{
}

- (BOOL)showsAttributionSidebar
{
  return sub_1003752B4(self);
}

- (void)setShowsAttributionSidebar:(BOOL)a3
{
}

- (BOOL)showsCollaboratorCursors
{
  return sub_1003752B4(self);
}

- (void)setShowsCollaboratorCursors:(BOOL)a3
{
}

- (NSArray)activeParticipants
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();

  swift_release();
  swift_release();
  sub_100031418(0, &qword_1006A4840);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setActiveParticipants:(id)a3
{
  sub_100031418(0, &qword_1006A4840);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  static Published.subscript.setter();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  NSArray v4 = self;
  sub_100375848();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___ICCollaborationButtonsController_collaboratorDataSourceObservation) = 0;
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(ICCollaborationButtonsController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__cloudObject;
  uint64_t v4 = sub_10002F214(&qword_1006A4858);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__accountSupportsDeviceToDeviceEncryption;
  uint64_t v6 = sub_10002F214(&qword_1006A4820);
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__accountHasKeychainEnabled, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsActivityStream, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsAttributionSidebar, v6);
  v7((char *)self + OBJC_IVAR___ICCollaborationButtonsController__showsCollaboratorCursors, v6);
  uint64_t v8 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__activeParticipants;
  uint64_t v9 = sub_10002F214(&qword_1006A47C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__participantDataSource;
  uint64_t v11 = sub_10002F214(&qword_1006A4850);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_unknownObjectUnownedDestroy();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v12 = (char *)self + OBJC_IVAR___ICCollaborationButtonsController__activityDigestSummary;
  uint64_t v13 = sub_10002F214(&qword_1006A4848);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem));
  uint64_t v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);

  sub_10002E70C(v14);
}

- (UIBarButtonItem)buttonItem
{
  v2 = self;
  id v3 = sub_100376810();

  return (UIBarButtonItem *)v3;
}

- (void)setButtonItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController____lazy_storage___buttonItem) = (Class)a3;
  id v3 = a3;
}

- (id)didPressManageShareButton
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton))
  {
    uint64_t v2 = *(void *)&self->coordinator[OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCollaborationButtonsController_didPressManageShareButton);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100262E2C;
    v5[3] = &unk_100638090;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (ICCollaborationButtonsController)init
{
  result = (ICCollaborationButtonsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateState
{
  uint64_t v2 = self;
  sub_100376C1C();
}

- (NSArray)activityDigestSummaryParticipants
{
  uint64_t v2 = self;
  sub_100377118();

  sub_100031418(0, &qword_1006A4840);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)showRecentUpdates
{
  uint64_t v2 = self;
  sub_100377378();
}

- (void)showAccountDeviceToDeviceEncryptionAlert
{
  uint64_t v2 = self;
  sub_100377A3C();
}

- (void)showEnableKeychainAlert
{
  uint64_t v2 = self;
  sub_100377E38();
}

- (void)showSelectionFor:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100378840(v4);
}

- (void)showContactCardFor:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100379920((uint64_t)v6);
}

- (void)hideContactCard
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  id v7 = self;
  id v4 = [Strong activeEditorController];

  objc_super v5 = (ICCollaborationButtonsController *)[v4 presentedViewController];
  if (v5)
  {
    [(ICCollaborationButtonsController *)v5 dismissViewControllerAnimated:1 completion:0];

    id v6 = v5;
  }
  else
  {
    id v6 = v7;
  }
}

- (void)setShowsCollaboratorCursorsWithVisible:(BOOL)a3
{
  id v4 = self;
  sub_100376608(a3);
}

- (void)setActivityStreamWithVisible:(BOOL)a3
{
  id v4 = self;
  sub_100378C5C(a3);
}

- (void)setAttributionSidebarWithVisible:(BOOL)a3
{
  id v4 = self;
  sub_100378ED0(a3);
}

- (void)showShare
{
  uint64_t v2 = self;
  sub_100379140();
}

@end