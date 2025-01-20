@interface NCNotificationListHighlights
- (BOOL)forceExpanded;
- (BOOL)isExpanded;
- (BOOL)isOnScreen;
- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3;
- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3;
- (NCNotificationListHighlights)initWithTitle:(id)a3 sectionType:(unint64_t)a4;
- (double)availableHeight;
- (double)collapsedHeight;
- (double)expandedHeight;
- (double)expandedPercentage;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(int64_t)a4 withWidth:(double)a5;
- (id)headerViewForNotificationList:(id)a3;
- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5;
- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(int64_t)a4;
- (id)overlayViewForNotificationList:(id)a3;
- (int64_t)notificationListViewNumberOfItems:(id)a3;
- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)groupListDidLayout:(id)a3;
- (void)handleWake:(BOOL)a3;
- (void)insertNotificationRequest:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListComponent:(id)a3 dismissPresentLongLookForRequst:(id)a4 animator:(id)a5;
- (void)notificationListComponent:(id)a3 willPresentLongLookForRequst:(id)a4 animator:(id)a5;
- (void)notificationListComponent:(id)a3 willRemoveNotificationRequest:(id)a4;
- (void)notificationListDidLayoutSubviews;
- (void)notificationListPresentableGroup:(id)a3 didReceivedHorizontalTranslation:(double)a4 forCell:(id)a5;
- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4;
- (void)notificationListPresentableGroupDidChangeGroupedState:(id)a3;
- (void)prepareForUIAppear;
- (void)reloadNotificationRequest:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)setAvailableHeight:(double)a3;
- (void)setExpandedPercentage:(double)a3;
- (void)setForceExpanded:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsOnScreen:(BOOL)a3;
@end

@implementation NCNotificationListHighlights

- (double)availableHeight
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_availableHeight);
}

- (void)setAvailableHeight:(double)a3
{
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_availableHeight) = a3;
  v3 = self;
  sub_1D7D4D250();
}

- (double)expandedPercentage
{
  v2 = self;
  double v3 = 1.0;
  if (![(NCNotificationListHighlights *)v2 forceExpanded]) {
    double v3 = *(double *)((char *)&v2->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__mappedExpandedPercentage);
  }

  return v3;
}

- (void)setExpandedPercentage:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0 && ((v4 = 1.0, a3 > 1.0) || (double v3 = a3, v4 = a3, a3 >= 0.27))) {
    double v5 = v4 * 0.3699 + 0.6301;
  }
  else {
    double v5 = v3 * 2.7037;
  }
  *(double *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__mappedExpandedPercentage) = v5;
  v6 = self;
  sub_1D7D4D81C();
}

- (BOOL)isExpanded
{
  v2 = self;
  if ([(NCNotificationListHighlights *)v2 forceExpanded]) {
    char v3 = 1;
  }
  else {
    char v3 = *((unsigned char *)&v2->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__isExpanded);
  }

  return v3;
}

- (void)setIsExpanded:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights__isExpanded) = a3;
  char v3 = self;
  sub_1D7D4D81C();
}

- (BOOL)forceExpanded
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_forceExpanded);
}

- (void)setForceExpanded:(BOOL)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_forceExpanded) = a3;
  char v3 = self;
  sub_1D7D4D81C();
}

- (BOOL)isOnScreen
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_isOnScreen);
}

- (void)setIsOnScreen:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_isOnScreen);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___NCNotificationListHighlights_isOnScreen) = a3;
  if ((v3 & 1) == 0 && a3)
  {
    double v4 = self;
    double v5 = _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE11overlayView015forNotificationB0So6UIViewCSo0abH8Protocol_p_tF_0();
    sub_1D7D46CCC();
  }
}

- (double)expandedHeight
{
  v2 = self;
  NCNotificationListHighlights.expandedHeight.getter();
  double v4 = v3;

  return v4;
}

- (double)collapsedHeight
{
  v2 = self;
  double v3 = NCNotificationListHighlights.collapsedHeight.getter();

  return v3;
}

- (NCNotificationListHighlights)initWithTitle:(id)a3 sectionType:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D7D7F790();
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  return (NCNotificationListHighlights *)sub_1D7D52570(v5, v6, a4);
}

- (unint64_t)_groupingSettingForSectionIdentifier:(id)a3
{
  sub_1D7D7F790();
  double v4 = self;
  uint64_t v5 = self;
  id v6 = objc_msgSend(v4, sel_standardDefaults);
  unsigned int v7 = objc_msgSend(v6, sel_allowStackingInHighlights);

  if (v7)
  {
    v8 = (void *)sub_1D7D7F760();
    v11.receiver = v5;
    v11.super_class = (Class)NCNotificationListHighlights;
    id v9 = [(NCNotificationStructuredSectionList *)&v11 _groupingSettingForSectionIdentifier:v8];

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    return 2;
  }
  return (unint64_t)v9;
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = sub_1D7D45540;
  v8[3] = v7;
  v8[4] = self;
  aBlock[4] = sub_1D7D5AF74;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D7D2C66C;
  aBlock[3] = &block_descriptor_70;
  id v9 = _Block_copy(aBlock);
  v10 = self;
  id v11 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  v12.receiver = v10;
  v12.super_class = (Class)NCNotificationListHighlights;
  [(NCNotificationStructuredSectionList *)&v12 expandGroupForNotificationRequest:v11 withCompletion:v9];
  _Block_release(v9);

  swift_release();
  swift_release();
}

- (void)insertNotificationRequest:(id)a3
{
  id v5 = a3;
  id v6 = self;
  NCNotificationListHighlights.insert(_:)((uint64_t)a3);
}

- (void)removeNotificationRequest:(id)a3
{
}

- (void)notificationListComponent:(id)a3 willRemoveNotificationRequest:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  NCNotificationListHighlights.notificationListComponent(_:willRemove:)((unint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)notificationListComponent:(id)a3 willPresentLongLookForRequst:(id)a4 animator:(id)a5
{
}

- (void)notificationListComponent:(id)a3 dismissPresentLongLookForRequst:(id)a4 animator:(id)a5
{
}

- (void)modifyNotificationRequest:(id)a3
{
}

- (void)reloadNotificationRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NCNotificationListHighlights____lazy_storage___springBehavior));
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NCNotificationListHighlights____lazy_storage___backgroundView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = sub_1D7D5BC8C((char *)a4);
  swift_unknownObjectRelease();

  return v7;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return sub_1D7D555C4(self, (uint64_t)a2, (uint64_t)a3, sub_1D7D1FF38);
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(int64_t)a4 withWidth:(double)a5
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1D7D5BDDC(a4);
  double v9 = v8;
  swift_unknownObjectRelease();

  return v9;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(int64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)NCNotificationListHighlights;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = [(NCNotificationStructuredSectionList *)&v14 allNotificationGroups];
  sub_1D7D2649C(0, (unint64_t *)&unk_1EBA39118);
  uint64_t v8 = sub_1D7D7F800();

  if ((v8 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x1D9480720](a4, v8);
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v10 = *(id *)(v8 + 8 * a4 + 32);
LABEL_5:
  id v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v11, sel_listView, v14.receiver, v14.super_class);
  swift_unknownObjectRelease();

  self;
  v13 = (void *)swift_dynamicCastObjCClassUnconditional();

  return v13;
}

- (id)headerViewForNotificationList:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                 + OBJC_IVAR___NCNotificationListHighlights_headerLabel));
}

- (double)headerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return sub_1D7D555C4(self, (uint64_t)a2, (uint64_t)a3, sub_1D7D1FC88);
}

- (int64_t)notificationListViewNumberOfItems:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationListHighlights;
  swift_unknownObjectRetain();
  double v4 = self;
  id v5 = [(NCNotificationStructuredSectionList *)&v9 allNotificationGroups];
  sub_1D7D2649C(0, (unint64_t *)&unk_1EBA39118);
  unint64_t v6 = sub_1D7D7F800();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    int64_t v7 = sub_1D7D7FBF0();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v7;
}

- (void)notificationListDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListHighlights;
  v2 = self;
  [(NCNotificationListHighlights *)&v3 notificationListDidLayoutSubviews];
  _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE05groupB9DidLayoutyySo0a5GroupB0CF_0();
}

- (void)handleWake:(BOOL)a3
{
  if (a3)
  {
    double v4 = self;
    if ((uint64_t)[(NCNotificationStructuredSectionList *)v4 count] < 1)
    {
    }
    else
    {
      v5.receiver = v4;
      v5.super_class = (Class)NCNotificationListHighlights;
      [(NCNotificationStructuredSectionList *)&v5 handleWake:1];
      objc_super v3 = _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE11overlayView015forNotificationB0So6UIViewCSo0abH8Protocol_p_tF_0();
      sub_1D7D47210();
    }
  }
}

- (id)overlayViewForNotificationList:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  objc_super v5 = _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE11overlayView015forNotificationB0So6UIViewCSo0abH8Protocol_p_tF_0();
  swift_unknownObjectRelease();

  return v5;
}

- (void)prepareForUIAppear
{
  v2 = self;
  objc_super v3 = _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE11overlayView015forNotificationB0So6UIViewCSo0abH8Protocol_p_tF_0();
  sub_1D7D46CCC();
}

- (void)notificationListPresentableGroup:(id)a3 didReceivedHorizontalTranslation:(double)a4 forCell:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = self;
  sub_1D7D5BE94(v9, a4);
}

- (id)notificationGroupList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  return 0;
}

- (void)groupListDidLayout:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  _sSo28NCNotificationListHighlightsC22UserNotificationsUIKitE05groupB9DidLayoutyySo0a5GroupB0CF_0();
}

- (void)notificationListPresentableGroup:(id)a3 requestsScrollToTopOfCollectionWithCompletion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_1D7D5BF90(v7, v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)shouldAllowRestackingForNotificationListPresentableGroup:(id)a3
{
  return 0;
}

- (BOOL)shouldNotificationGroupListPanHorizontally:(id)a3
{
  return 1;
}

- (void)notificationListPresentableGroupDidChangeGroupedState:(id)a3
{
  id v4 = a3;
  id v11 = self;
  objc_super v5 = [(NCNotificationStructuredSectionList *)v11 delegate];
  if (v5)
  {
    unint64_t v6 = v5;
    swift_getObjectType();
    uint64_t v7 = swift_conformsToProtocol2();
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    if (v9)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(NCNotificationListHighlights *, id, uint64_t, uint64_t))(v8 + 8))(v11, v4, ObjectType, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end