@interface ConversationNavigationBarItemsManager
+ (BOOL)canUseDesktopClassNavigationBar;
+ (NSString)customizationIdentifier;
- (BOOL)showNavigationArrows;
- (BOOL)showSupplementaryButtonItem;
- (BOOL)useArchiveButton;
- (BOOL)useDesktopClassNavigationBar;
- (ComposeButtonItem)composeButtonItem;
- (ComposeCapable)scene;
- (MFArrowControlsView)arrowControlsView;
- (MFArrowControlsViewDelegate)arrowDelegate;
- (NSArray)defaultDesktopClassCenterBarButtonItemGroups;
- (NSArray)desktopClassCenterBarButtonItems;
- (UIBarButtonItem)archiveButtonItem;
- (UIBarButtonItem)arrowControlsButtonItem;
- (UIBarButtonItem)cleanBackButtonItem;
- (UIBarButtonItem)contactLeftDoneButtonItem;
- (UIBarButtonItem)deleteButtonItem;
- (UIBarButtonItem)destructiveButtonItem;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)doneButtonItem;
- (UIBarButtonItem)flagButtonItem;
- (UIBarButtonItem)forwardButtonItem;
- (UIBarButtonItem)groupedSenderActionsButtonItem;
- (UIBarButtonItem)junkButtonItem;
- (UIBarButtonItem)laterButtonItem;
- (UIBarButtonItem)leftSpaceItem;
- (UIBarButtonItem)moveButtonItem;
- (UIBarButtonItem)muteButtonItem;
- (UIBarButtonItem)readButtonItem;
- (UIBarButtonItem)replyAllButtonItem;
- (UIBarButtonItem)replyButtonItem;
- (UIBarButtonItem)revealActionsButtonItem;
- (UIBarButtonItem)unreadButtonItem;
- (UIBarButtonItemGroup)destructiveButtonItemGroup;
- (UIBarButtonItemGroup)flagButtonItemGroup;
- (UIBarButtonItemGroup)forwardButtonItemGroup;
- (UIBarButtonItemGroup)junkButtonItemGroup;
- (UIBarButtonItemGroup)laterButtonItemGroup;
- (UIBarButtonItemGroup)moveButtonItemGroup;
- (UIBarButtonItemGroup)muteButtonItemGroup;
- (UIBarButtonItemGroup)readButtonItemGroup;
- (UIBarButtonItemGroup)replyAllButtonItemGroup;
- (UIBarButtonItemGroup)replyButtonItemGroup;
- (_TtC10MobileMail37ConversationNavigationBarItemsManager)init;
- (_TtC10MobileMail37ConversationNavigationBarItemsManager)initWithScene:(id)a3 delegate:(id)a4 actionHandler:(id)a5 arrowDelegate:(id)a6;
- (_TtP10MobileMail44ConversationNavigationBarItemsActionHandling_)actionHandler;
- (_TtP10MobileMail45ConversationNavigationBarItemsManagerDelegate_)delegate;
- (id)desktopClassCenterBarButtonItemGroupsWithIsShowingTitle:(BOOL)a3;
- (id)desktopClassLeftBarItemsWithIsPrimary:(BOOL)a3 isShowingTitle:(BOOL)a4;
- (id)desktopClassRightBarItemsWithIsShowingTitle:(BOOL)a3;
- (void)configureDesktopClassButtonsFor:(id)a3 isPrimary:(BOOL)a4 isShowingTitle:(BOOL)a5 animated:(BOOL)a6;
- (void)configureNavigationBar:(id)a3 navigationItem:(id)a4;
- (void)setActionHandler:(id)a3;
- (void)setArchiveButtonItem:(id)a3;
- (void)setArrowControlsButtonItem:(id)a3;
- (void)setArrowControlsView:(id)a3;
- (void)setArrowDelegate:(id)a3;
- (void)setCleanBackButtonItem:(id)a3;
- (void)setComposeButtonItem:(id)a3;
- (void)setContactLeftDoneButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButtonItem:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setFlagButtonItem:(id)a3;
- (void)setForwardButtonItem:(id)a3;
- (void)setGroupedSenderActionsButtonItem:(id)a3;
- (void)setJunkButtonItem:(id)a3;
- (void)setLaterButtonItem:(id)a3;
- (void)setLeftSpaceItem:(id)a3;
- (void)setMoveButtonItem:(id)a3;
- (void)setMuteButtonItem:(id)a3;
- (void)setReadButtonItem:(id)a3;
- (void)setReplyAllButtonItem:(id)a3;
- (void)setReplyButtonItem:(id)a3;
- (void)setRevealActionsButtonItem:(id)a3;
- (void)setScene:(id)a3;
- (void)setShowNavigationArrows:(BOOL)a3;
- (void)setShowSupplementaryButtonItem:(BOOL)a3;
- (void)setUnreadButtonItem:(id)a3;
- (void)setUseArchiveButton:(BOOL)a3;
- (void)setUseDesktopClassNavigationBar:(BOOL)a3;
- (void)updateEnabledStatesForMessage:(id)a3;
@end

@implementation ConversationNavigationBarItemsManager

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)initWithScene:(id)a3 delegate:(id)a4 actionHandler:(id)a5 arrowDelegate:(id)a6
{
  return (_TtC10MobileMail37ConversationNavigationBarItemsManager *)ConversationNavigationBarItemsManager.init(scene:delegate:actionHandler:arrowDelegate:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
}

- (ComposeCapable)scene
{
  v2 = self;
  id v5 = (id)ConversationNavigationBarItemsManager.scene.getter();

  return (ComposeCapable *)v5;
}

- (void)setScene:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ConversationNavigationBarItemsManager.scene.setter();
}

- (_TtP10MobileMail45ConversationNavigationBarItemsManagerDelegate_)delegate
{
  v2 = self;
  id v5 = (id)ConversationNavigationBarItemsManager.delegate.getter();

  return (_TtP10MobileMail45ConversationNavigationBarItemsManagerDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ConversationNavigationBarItemsManager.delegate.setter();
}

- (_TtP10MobileMail44ConversationNavigationBarItemsActionHandling_)actionHandler
{
  v2 = self;
  id v5 = (id)ConversationNavigationBarItemsManager.actionHandler.getter();

  return (_TtP10MobileMail44ConversationNavigationBarItemsActionHandling_ *)v5;
}

- (void)setActionHandler:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ConversationNavigationBarItemsManager.actionHandler.setter();
}

- (MFArrowControlsViewDelegate)arrowDelegate
{
  v2 = self;
  id v5 = (id)ConversationNavigationBarItemsManager.arrowDelegate.getter();

  return (MFArrowControlsViewDelegate *)v5;
}

- (void)setArrowDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ConversationNavigationBarItemsManager.arrowDelegate.setter();
}

- (BOOL)useArchiveButton
{
  v2 = self;
  ConversationNavigationBarItemsManager.useArchiveButton.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setUseArchiveButton:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  ConversationNavigationBarItemsManager.useArchiveButton.setter(v4 & 1);
}

- (BOOL)showNavigationArrows
{
  v2 = self;
  ConversationNavigationBarItemsManager.showNavigationArrows.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setShowNavigationArrows:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  ConversationNavigationBarItemsManager.showNavigationArrows.setter(v4 & 1);
}

- (BOOL)showSupplementaryButtonItem
{
  v2 = self;
  ConversationNavigationBarItemsManager.showSupplementaryButtonItem.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setShowSupplementaryButtonItem:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  ConversationNavigationBarItemsManager.showSupplementaryButtonItem.setter(v4 & 1);
}

- (BOOL)useDesktopClassNavigationBar
{
  v2 = self;
  ConversationNavigationBarItemsManager.useDesktopClassNavigationBar.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)setUseDesktopClassNavigationBar:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  ConversationNavigationBarItemsManager.useDesktopClassNavigationBar.setter(v4 & 1);
}

- (UIBarButtonItem)doneButton
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.doneButton.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setDoneButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.doneButton.setter(a3);
}

- (UIBarButtonItem)doneButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.doneButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (UIBarButtonItem)revealActionsButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.revealActionsButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setRevealActionsButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.revealActionsButtonItem.setter(a3);
}

- (UIBarButtonItem)replyButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.replyButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReplyButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.replyButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)replyButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_100279D2C();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)replyAllButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.replyAllButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReplyAllButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.replyAllButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)replyAllButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027A498();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)forwardButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.forwardButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setForwardButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.forwardButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)forwardButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027AB9C();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)archiveButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.archiveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setArchiveButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.archiveButtonItem.setter(a3);
}

- (UIBarButtonItem)deleteButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.deleteButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setDeleteButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.deleteButtonItem.setter(a3);
}

- (UIBarButtonItem)destructiveButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.destructiveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (UIBarButtonItemGroup)destructiveButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027BFE8();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)moveButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.moveButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setMoveButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.moveButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)moveButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027C6EC();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)flagButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.flagButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setFlagButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.flagButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)flagButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027CD44();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)readButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.readButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setReadButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.readButtonItem.setter(a3);
}

- (UIBarButtonItem)unreadButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.unreadButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setUnreadButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.unreadButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)readButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027D970();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)junkButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.junkButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setJunkButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.junkButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)junkButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027E164();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)muteButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.muteButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setMuteButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.muteButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)muteButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027E880();

  return (UIBarButtonItemGroup *)v5;
}

- (UIBarButtonItem)laterButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.laterButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setLaterButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.laterButtonItem.setter(a3);
}

- (UIBarButtonItemGroup)laterButtonItemGroup
{
  v2 = self;
  id v5 = (id)sub_10027EF9C();

  return (UIBarButtonItemGroup *)v5;
}

- (ComposeButtonItem)composeButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.composeButtonItem.getter();

  return (ComposeButtonItem *)v5;
}

- (void)setComposeButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.composeButtonItem.setter(a3);
}

- (UIBarButtonItem)contactLeftDoneButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.contactLeftDoneButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setContactLeftDoneButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.contactLeftDoneButtonItem.setter(a3);
}

- (UIBarButtonItem)leftSpaceItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.leftSpaceItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setLeftSpaceItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.leftSpaceItem.setter(a3);
}

- (UIBarButtonItem)arrowControlsButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.arrowControlsButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setArrowControlsButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.arrowControlsButtonItem.setter(a3);
}

- (UIBarButtonItem)groupedSenderActionsButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.groupedSenderActionsButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setGroupedSenderActionsButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.groupedSenderActionsButtonItem.setter(a3);
}

- (UIBarButtonItem)cleanBackButtonItem
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.cleanBackButtonItem.getter();

  return (UIBarButtonItem *)v5;
}

- (void)setCleanBackButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.cleanBackButtonItem.setter(a3);
}

- (MFArrowControlsView)arrowControlsView
{
  v2 = self;
  id v5 = ConversationNavigationBarItemsManager.arrowControlsView.getter();

  return (MFArrowControlsView *)v5;
}

- (void)setArrowControlsView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationNavigationBarItemsManager.arrowControlsView.setter(a3);
}

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)init
{
  return (_TtC10MobileMail37ConversationNavigationBarItemsManager *)ConversationNavigationBarItemsManager.init()();
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager_doneButton));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___revealActionsButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___replyButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___replyAllButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___forwardButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___archiveButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___deleteButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___moveButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___flagButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___readButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___unreadButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___junkButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___muteButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___laterButtonItem));
  sub_10028795C((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___composeButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___contactLeftDoneButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___leftSpaceItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___arrowControlsButtonItem));
  sub_10028795C((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___groupedSenderActionsButtonItem));
  sub_10028795C((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___cleanBackButtonItem));
  sub_10024C328((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail37ConversationNavigationBarItemsManager____lazy_storage___arrowControlsView));
  sub_10001B0B0();
}

- (void)updateEnabledStatesForMessage:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  ConversationNavigationBarItemsManager.updateEnabledStatesForMessage(_:)(a3);

  swift_unknownObjectRelease();
}

+ (BOOL)canUseDesktopClassNavigationBar
{
  return _convertBoolToObjCBool(_:)() & 1;
}

- (void)configureNavigationBar:(id)a3 navigationItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  ConversationNavigationBarItemsManager.configureNavigationBar(_:navigationItem:)((UINavigationBar)a3, (UINavigationItem)a4);
}

- (void)configureDesktopClassButtonsFor:(id)a3 isPrimary:(BOOL)a4 isShowingTitle:(BOOL)a5 animated:(BOOL)a6
{
  id v7 = a3;
  v8 = self;
  char v10 = _convertObjCBoolToBool(_:)();
  char v11 = _convertObjCBoolToBool(_:)();
  char v9 = _convertObjCBoolToBool(_:)();
  ConversationNavigationBarItemsManager.configureDesktopClassButtons(for:isPrimary:isShowingTitle:animated:)((UINavigationItem)a3, v10 & 1, v11 & 1, v9 & 1);
}

- (id)desktopClassLeftBarItemsWithIsPrimary:(BOOL)a3 isShowingTitle:(BOOL)a4
{
  id v4 = self;
  char v9 = _convertObjCBoolToBool(_:)();
  char v5 = _convertObjCBoolToBool(_:)();
  uint64_t v11 = sub_100285234(v9 & 1, v5 & 1);

  if (v11)
  {
    sub_100279048();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }

  return v8;
}

- (id)desktopClassCenterBarButtonItemGroupsWithIsShowingTitle:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_100285708(v4 & 1);

  sub_100279E18();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return isa;
}

- (NSArray)desktopClassCenterBarButtonItems
{
  v2 = self;
  sub_100285EC0();

  sub_100279048();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)isa;
}

- (id)desktopClassRightBarItemsWithIsShowingTitle:(BOOL)a3
{
  v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  uint64_t v9 = sub_1002859EC(v4 & 1);

  if (v9)
  {
    sub_100279048();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v7 = isa;
  }
  else
  {
    Class v7 = 0;
  }

  return v7;
}

+ (NSString)customizationIdentifier
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  sub_100286048();
  if (v2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)defaultDesktopClassCenterBarButtonItemGroups
{
  uint64_t v2 = self;
  sub_100285C90();

  sub_100279E18();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)isa;
}

@end