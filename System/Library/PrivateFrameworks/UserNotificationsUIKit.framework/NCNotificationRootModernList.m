@interface NCNotificationRootModernList
- (BOOL)deviceAuthenticated;
- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3;
- (BOOL)isNotificationHistoryRevealed;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3;
- (NCNotificationRootModernList)initWithListView:(id)a3;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(int64_t)a4 withWidth:(double)a5;
- (double)scrollViewVisibleContentLayoutOffsetY;
- (double)targetContentHeightForNotificationList:(id)a3;
- (id)initForTesting;
- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4;
- (int64_t)_indexForReveal;
- (int64_t)incomingCount;
- (void)_backlightChangedToBacklightLuminance:(int64_t)a3;
- (void)_notificationListDidChangeContent;
- (void)_notificationSectionsDidAdd:(id)a3;
- (void)_setRevealed:(BOOL)a3 forSection:(id)a4;
- (void)_updateIndexForReveal;
- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
- (void)assertion:(id)a3 didCancelWithError:(id)a4;
- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4;
- (void)assertionWasAcquired:(id)a3;
- (void)didTapCountIndicator;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)insertNotificationRequest:(id)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponent:(id)a3 didSetGrouped:(BOOL)a4;
- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5;
- (void)notificationListComponent:(id)a3 didRemoveView:(id)a4;
- (void)notificationListComponent:(id)a3 willRemoveView:(id)a4 bottomSpacing:(double)a5;
- (void)notificationListComponentChangedContent:(id)a3;
- (void)notificationListDidLayoutSubviews;
- (void)notificationListWillLayoutSubviews;
- (void)performWithoutAnimation:(id)a3;
- (void)removeNotificationRequest:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setNotificationHistoryRevealed:(BOOL)a3;
- (void)supplementaryViewSectionDidChangeContent:(id)a3;
- (void)supplementaryViewSectionDidChangeHeight:(id)a3;
- (void)toggleMissedSectionActive:(BOOL)a3 forDNDMode:(id)a4 hideVisibleNotifications:(BOOL)a5;
- (void)updateListViewVisibleRectForSize:(CGSize)a3;
@end

@implementation NCNotificationRootModernList

- (NCNotificationRootModernList)initWithListView:(id)a3
{
  sub_1D7D2D09C(a3);
  return result;
}

- (int64_t)incomingCount
{
  v2 = self;
  NCNotificationRootModernList.incomingCount.getter();
  int64_t v4 = v3;

  return v4;
}

- (id)initForTesting
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NCNotificationRootModernList_contentOffsetAnimatableProperty));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1D7D445F8(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._currentListDisplayStyleSetting+ OBJC_IVAR___NCNotificationRootModernList__scrollState), *(void *)(&self->super._deviceAuthenticated + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(void *)(&self->super._deferCurrentDigestPresentationForPersistedDataLoad+ OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._logDescription + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._delegate + OBJC_IVAR___NCNotificationRootModernList__scrollState), *(uint64_t *)((char *)&self->super._rootListView + OBJC_IVAR___NCNotificationRootModernList__scrollState), (uint64_t (*)(uint64_t, uint64_t))sub_1D7D26378);

  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_supplementaryCache);
}

- (void)_updateIndexForReveal
{
  v2 = self;
  NCNotificationRootModernList._updateIndexForReveal()();
}

- (int64_t)_indexForReveal
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_revealIndex);
}

- (void)_setRevealed:(BOOL)a3 forSection:(id)a4
{
  if (a4)
  {
    v5 = self;
    id v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_listView);
    objc_msgSend(v6, sel_setRevealed_, 1);

    id v7 = objc_msgSend(a4, sel_listView);
    objc_msgSend(v7, sel_setRevealPercentage_, 1.0);
    swift_unknownObjectRelease();
  }
}

- (void)toggleMissedSectionActive:(BOOL)a3 forDNDMode:(id)a4 hideVisibleNotifications:(BOOL)a5
{
  id v9 = a4;
  v10 = self;
  NCNotificationRootModernList.toggleMissedSectionActive(_:for:hideVisibleNotifications:)(a3, a4, a5);
}

- (void)_backlightChangedToBacklightLuminance:(int64_t)a3
{
  int64_t v4 = self;
  NCNotificationRootModernList._backlightChanged(toBacklightLuminance:)(a3);
}

- (void)_notificationListDidChangeContent
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRootModernList;
  v2 = self;
  [(NCNotificationRootList *)&v3 _notificationListDidChangeContent];
  sub_1D7D318E0();
}

- (void)notificationListComponentChangedContent:(id)a3
{
  id v6 = self;
  swift_unknownObjectRetain();
  sub_1D7D318E0();
  int64_t v4 = [(NCNotificationRootList *)v6 delegate];
  if (v4)
  {
    v5 = v4;
    if ([(NCNotificationRootListDelegate *)v4 respondsToSelector:sel_notificationListComponentChangedContent_])[(NCNotificationRootListDelegate *)v5 notificationListComponentChangedContent:a3]; {
    swift_unknownObjectRelease();
    }

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

- (void)notificationListComponent:(id)a3 willRemoveView:(id)a4 bottomSpacing:(double)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_1D7D43C74(a4);
  swift_unknownObjectRelease();
}

- (void)notificationListComponent:(id)a3 didRemoveView:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_1D7D323F0();
  swift_unknownObjectRelease();
}

- (void)assertionWasAcquired:(id)a3
{
  id v4 = a3;
  v5 = self;
  NCNotificationRootModernList.assertionWasAcquired(_:)(v4);
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  NCNotificationRootModernList.assertion(_:didCancelWithError:)(v6, a4);
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  NCNotificationRootModernList.assertion(_:didFailToAcquireWithError:)(v6, v8);
}

- (double)scrollViewVisibleContentLayoutOffsetY
{
  double result = *(double *)((char *)&self->super._suggestionManager + OBJC_IVAR___NCNotificationRootModernList_layout);
  double v3 = *(double *)((char *)&self->super._activeDNDModeConfiguration + OBJC_IVAR___NCNotificationRootModernList_layout);
  if (*((unsigned char *)&self->super._notificationListCache + OBJC_IVAR___NCNotificationRootModernList_layout)) {
    double v3 = 0.0;
  }
  double v4 = *(double *)((char *)&self->super._supplementaryCache + OBJC_IVAR___NCNotificationRootModernList_layout) - v3;
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  if (v4 >= result) {
    double v4 = *(double *)((char *)&self->super._suggestionManager + OBJC_IVAR___NCNotificationRootModernList_layout);
  }
  if (result >= v4) {
    return v4;
  }
  return result;
}

- (void)updateListViewVisibleRectForSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super._notificationSummaryCache + OBJC_IVAR___NCNotificationRootModernList_layout) = a3;
  uint64_t v3 = *(void *)&a3.width;
  uint64_t v4 = *(void *)&a3.height;
  v5 = self;
  sub_1D7D3347C(v3, v4, 0);
}

- (void)_notificationSectionsDidAdd:(id)a3
{
  id v5 = a3;
  id v6 = self;
  NCNotificationRootModernList._notificationSectionsDidAdd(_:)((NCNotificationStructuredSectionList_optional *)a3);
}

- (void)insertNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = self;
  NCNotificationRootModernList.insert(_:)(v4);
}

- (void)removeNotificationRequest:(id)a3
{
  id v5 = a3;
  id v6 = self;
  NCNotificationRootModernList.remove(_:)(a3);
}

- (void)modifyNotificationRequest:(id)a3
{
  id v5 = a3;
  id v6 = self;
  NCNotificationRootModernList.modifyNotificationRequest(_:)(a3);
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  NCNotificationRootModernList.expandGroup(for:withCompletion:)(v8, (uint64_t)sub_1D7D45540, v7);

  swift_release();
}

- (BOOL)deviceAuthenticated
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRootModernList;
  return [(NCNotificationRootList *)&v3 deviceAuthenticated];
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationRootModernList;
  id v4 = self;
  char v5 = [(NCNotificationRootList *)&v7 deviceAuthenticated];
  v6.receiver = v4;
  v6.super_class = (Class)NCNotificationRootModernList;
  [(NCNotificationRootList *)&v6 setDeviceAuthenticated:v3];
  sub_1D7D36C60(v5);
}

- (id)notificationListView:(id)a3 topSpacingForItemAtIndex:(int64_t)a4
{
  swift_unknownObjectRetain();
  objc_super v6 = self;
  id v7 = sub_1D7D44060(a4);
  swift_unknownObjectRelease();

  return v7;
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(int64_t)a4 withWidth:(double)a5
{
  swift_unknownObjectRetain();
  id v9 = self;
  NCNotificationRootModernList.notificationListView(_:heightForItemAt:withWidth:)((uint64_t)a3, a4, a5);
  double v11 = v10;
  swift_unknownObjectRelease();

  return v11;
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 0.0;
}

- (double)targetContentHeightForNotificationList:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _sSo28NCNotificationRootModernListC22UserNotificationsUIKitE19targetContentHeight015forNotificationD012CoreGraphics7CGFloatVSo0aD12ViewProtocol_p_tF_0();
  double v6 = v5;
  swift_unknownObjectRelease();

  return v6;
}

- (void)notificationListWillLayoutSubviews
{
  v2 = self;
  NCNotificationRootModernList.notificationListWillLayoutSubviews()();
}

- (void)notificationListDidLayoutSubviews
{
  v2 = self;
  NCNotificationRootModernList.notificationListDidLayoutSubviews()();
}

- (void)didTapCountIndicator
{
  v2 = self;
  NCNotificationRootModernList.didTapCountIndicator()();
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v4 = qword_1EBA38BB8;
  id v5 = a3;
  double v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_1D7D7F260();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EBA39A30);
  id v8 = sub_1D7D7F240();
  os_log_type_t v9 = sub_1D7D7F900();
  if (os_log_type_enabled(v8, v9))
  {
    double v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1D7C04000, v8, v9, "ScrollView requesting scrollToTop", v10, 2u);
    MEMORY[0x1D9481BF0](v10, -1, -1);
  }

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = (UIScrollView *)a3;
  id v5 = self;
  NCNotificationRootModernList.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  uint64_t v4 = (UIScrollView *)a3;
  id v5 = self;
  NCNotificationRootModernList.scrollViewWillBeginDragging(_:)(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  double v10 = self;
  NCNotificationRootModernList.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v9, (uint64_t)a5, x, y);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  uint64_t v4 = (UIScrollView *)a3;
  id v5 = self;
  NCNotificationRootModernList.scrollViewDidEndScrollingAnimation(_:)(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v4 = (UIScrollView *)a3;
  id v5 = self;
  NCNotificationRootModernList.scrollViewDidEndDecelerating(_:)(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  double v6 = (UIScrollView *)a3;
  uint64_t v7 = self;
  NCNotificationRootModernList.scrollViewDidEndDragging(_:willDecelerate:)(v6, a4);
}

- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationRootModernList;
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  id v5 = [(NCNotificationRootList *)&v20 rootListView];
  [(NCNotificationListViewProtocol *)v5 contentSize];
  double v7 = v6;

  v19.receiver = v4;
  v19.super_class = (Class)NCNotificationRootModernList;
  id v8 = [(NCNotificationRootList *)&v19 rootListView];
  [(NCNotificationListViewProtocol *)v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v21.origin.double x = v10;
  v21.origin.double y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  double Height = CGRectGetHeight(v21);
  swift_unknownObjectRelease();

  return v7 < Height;
}

- (void)notificationListBaseComponent:(id)a3 requestsScrollingToContentOffset:(double)a4 withCompletion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  CGFloat v10 = self;
  NCNotificationRootModernList.notificationListBaseComponent(_:requestsScrollingToContentOffset:withCompletion:)(a3, (uint64_t)sub_1D7D45540, v9, a4);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)supplementaryViewSectionDidChangeContent:(id)a3
{
  uint64_t v4 = (NCNotificationListSupplementaryViewsSection *)a3;
  id v5 = self;
  NCNotificationRootModernList.supplementaryViewSectionDidChangeContent(_:)(v4);
}

- (void)supplementaryViewSectionDidChangeHeight:(id)a3
{
  uint64_t v4 = (NCNotificationListSupplementaryViewsSection *)a3;
  id v5 = self;
  NCNotificationRootModernList.supplementaryViewSectionDidChangeHeight(_:)(v4);
}

- (void)notificationListBaseComponent:(id)a3 didSetGrouped:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectRetain();
  double v7 = self;
  NCNotificationRootModernList.notificationListBaseComponent(_:didSetGrouped:)((uint64_t)a3, v4);
  swift_unknownObjectRelease();
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  char v6 = NCNotificationRootModernList.handleTap(on:)(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (BOOL)isNotificationHistoryRevealed
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRootModernList;
  return [(NCNotificationRootList *)&v3 isNotificationHistoryRevealed];
}

- (void)setNotificationHistoryRevealed:(BOOL)a3
{
  BOOL v4 = self;
  NCNotificationRootModernList.isNotificationHistoryRevealed.setter(a3);
}

- (void)performWithoutAnimation:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  char v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NCNotificationRootModernList_defaultAnimator);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1D7D45540;
  *(void *)(v7 + 24) = v5;
  v10[4] = sub_1D7D455A0;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1D7D2C66C;
  v10[3] = &block_descriptor_72;
  id v8 = _Block_copy(v10);
  uint64_t v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performWithoutAnimation_, v8);
  _Block_release(v8);

  swift_release();
}

- (void)animateByRetargetingType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a4);
  uint64_t v9 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  if (v9)
  {
    double v11 = (void *)swift_allocObject();
    v11[2] = v9;
    uint64_t v9 = sub_1D7D45468;
  }
  else
  {
    double v11 = 0;
  }
  CGFloat v12 = self;
  NCNotificationRootModernList.animate(byRetargetingType:animations:completion:)(a3, (uint64_t)sub_1D7D45540, v10, v9, v11);
  sub_1D7D26378((uint64_t)v9);

  swift_release();
}

- (void)animateUsingSpringBehavior:(id)a3 tracking:(BOOL)a4 type:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  CGFloat v12 = _Block_copy(a6);
  double v13 = (uint64_t (*)())_Block_copy(a7);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  if (v13)
  {
    double v15 = (void *)swift_allocObject();
    v15[2] = v13;
    double v13 = sub_1D7D45468;
  }
  else
  {
    double v15 = 0;
  }
  swift_unknownObjectRetain();
  CGFloat v16 = self;
  NCNotificationRootModernList.animate(usingSpringBehavior:tracking:type:animations:completion:)((uint64_t)a3, a4, a5, (uint64_t)sub_1D7D45540, v14, v13, v15);
  sub_1D7D26378((uint64_t)v13);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)animateUsingSpringWithTension:(double)a3 friction:(double)a4 interactive:(BOOL)a5 type:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  uint64_t v14 = _Block_copy(a7);
  double v15 = (uint64_t (*)())_Block_copy(a8);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  if (v15)
  {
    v17 = (void *)swift_allocObject();
    v17[2] = v15;
    double v15 = (uint64_t (*)())sub_1D7D442C0;
  }
  else
  {
    v17 = 0;
  }
  v18 = self;
  NCNotificationRootModernList.animateUsingSpring(withTension:friction:interactive:type:animations:completion:)(a5, a6, (uint64_t)sub_1D7D442B8, v16, v15, v17, a3, a4);
  sub_1D7D26378((uint64_t)v15);

  swift_release();
}

@end