@interface SFTabSwitcherConfiguration
- (SFTabSwitcherConfiguration)init;
- (id)borrowedCapsuleViewProvider;
- (id)borrowedContentViewProvider;
- (id)canAddItemPredicate;
- (id)didScrollToPageObserver;
- (id)dismissHandler;
- (id)dragItemProvider;
- (id)dropDestinationProvider;
- (id)dropHandler;
- (id)dropOperationProvider;
- (id)itemAddHandler;
- (id)itemCloseHandler;
- (id)itemCopyHandler;
- (id)itemMoveHandler;
- (id)itemPinHandler;
- (id)itemSelectionHandler;
- (id)pageInsertionHandler;
- (id)pageRetitleHandler;
- (id)pageTitleMenuProvider;
- (id)profileMenuProvider;
- (id)recentlyClosedMenuProvider;
- (id)relinquishBorrowedCapsuleView;
- (id)relinquishBorrowedContentView;
- (id)showPagePickerSheet;
- (id)steadyStateObserver;
- (id)tabOverviewVisibilityObserver;
- (id)toggleSidebarHandler;
- (id)validateDismissal;
- (id)visibilityObserver;
- (id)willScrollToPageObserver;
- (void)setBorrowedCapsuleViewProvider:(id)a3;
- (void)setBorrowedContentViewProvider:(id)a3;
- (void)setCanAddItemPredicate:(id)a3;
- (void)setDidScrollToPageObserver:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDragItemProvider:(id)a3;
- (void)setDropDestinationProvider:(id)a3;
- (void)setDropHandler:(id)a3;
- (void)setDropOperationProvider:(id)a3;
- (void)setItemAddHandler:(id)a3;
- (void)setItemCloseHandler:(id)a3;
- (void)setItemCopyHandler:(id)a3;
- (void)setItemMoveHandler:(id)a3;
- (void)setItemPinHandler:(id)a3;
- (void)setItemSelectionHandler:(id)a3;
- (void)setPageInsertionHandler:(id)a3;
- (void)setPageRetitleHandler:(id)a3;
- (void)setPageTitleMenuProvider:(id)a3;
- (void)setProfileMenuProvider:(id)a3;
- (void)setRecentlyClosedMenuProvider:(id)a3;
- (void)setRelinquishBorrowedCapsuleView:(id)a3;
- (void)setRelinquishBorrowedContentView:(id)a3;
- (void)setShowPagePickerSheet:(id)a3;
- (void)setSteadyStateObserver:(id)a3;
- (void)setTabOverviewVisibilityObserver:(id)a3;
- (void)setToggleSidebarHandler:(id)a3;
- (void)setValidateDismissal:(id)a3;
- (void)setVisibilityObserver:(id)a3;
- (void)setWillScrollToPageObserver:(id)a3;
@end

@implementation SFTabSwitcherConfiguration

- (SFTabSwitcherConfiguration)init
{
  return (SFTabSwitcherConfiguration *)SFTabSwitcherConfiguration.init()();
}

- (void)setTabOverviewVisibilityObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self
                                     + OBJC_IVAR___SFTabSwitcherConfiguration_tabOverviewVisibilityObserver);
  *v6 = sub_18C5DED68;
  v6[1] = (uint64_t (*)(char))v5;

  swift_release();
}

- (id)tabOverviewVisibilityObserver
{
  return sub_18C3E2A94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_tabOverviewVisibilityObserver, (uint64_t)&block_descriptor_245);
}

- (void)setRelinquishBorrowedContentView:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedContentView);
  *v6 = sub_18C5DEB68;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setRelinquishBorrowedCapsuleView:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedCapsuleView);
  *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (id)relinquishBorrowedCapsuleView
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedCapsuleView];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedCapsuleView);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C3789DC;
  v5[3] = &block_descriptor_272_0;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setBorrowedContentViewProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedContentViewProvider);
  *v6 = sub_18C5DEC50;
  v6[1] = (id (*)())v5;

  swift_release();
}

- (void)setBorrowedCapsuleViewProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedCapsuleViewProvider);
  *v6 = sub_18C5DEF44;
  v6[1] = (id (*)())v5;

  swift_release();
}

- (void)setRecentlyClosedMenuProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_recentlyClosedMenuProvider);
  *v6 = sub_18C5DEF44;
  v6[1] = (id (*)())v5;

  swift_release();
}

- (void)setWillScrollToPageObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_willScrollToPageObserver);
  *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (id)willScrollToPageObserver
{
  return sub_18C3788B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_willScrollToPageObserver, (uint64_t)&block_descriptor_219);
}

- (void)setDropDestinationProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropDestinationProvider);
  *v6 = sub_18C57A0D4;
  v6[1] = (id (*)())v5;

  swift_release();
}

- (void)setDidScrollToPageObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_didScrollToPageObserver);
  *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (id)didScrollToPageObserver
{
  return sub_18C3788B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_didScrollToPageObserver, (uint64_t)&block_descriptor_378);
}

- (void)setPageTitleMenuProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self
                                                 + OBJC_IVAR___SFTabSwitcherConfiguration_pageTitleMenuProvider);
  *v6 = sub_18C5DEBB8;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;

  swift_release();
}

- (void)setDropOperationProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropOperationProvider);
  *v6 = sub_18C5DEB68;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setToggleSidebarHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_toggleSidebarHandler);
  void *v6 = sub_18C58C138;
  v6[1] = v5;

  swift_release();
}

- (id)toggleSidebarHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_toggleSidebarHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_toggleSidebarHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C3E9778;
  v5[3] = &block_descriptor_238;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setPageInsertionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_pageInsertionHandler);
  void *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setItemSelectionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemSelectionHandler);
  void *v6 = sub_18C3789C4;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setSteadyStateObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_steadyStateObserver);
  void *v6 = sub_18C5DED68;
  v6[1] = (uint64_t (*)(char))v5;

  swift_release();
}

- (id)steadyStateObserver
{
  return sub_18C3E2A94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_steadyStateObserver, (uint64_t)&block_descriptor_252);
}

- (void)setShowPagePickerSheet:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_showPagePickerSheet);
  void *v6 = sub_18C5DED64;
  v6[1] = v5;

  swift_release();
}

- (id)showPagePickerSheet
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_showPagePickerSheet];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_showPagePickerSheet);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D3C68;
  v5[3] = &block_descriptor_259;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (void)setProfileMenuProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_profileMenuProvider);
  void *v6 = sub_18C5DEB80;
  v6[1] = (id (*)())v5;

  swift_release();
}

- (void)setCanAddItemPredicate:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_canAddItemPredicate);
  void *v6 = sub_18C44488C;
  v6[1] = v5;

  swift_release();
}

- (id)canAddItemPredicate
{
  return sub_18C442C5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_canAddItemPredicate, (uint64_t)&block_descriptor_385_0);
}

- (id)visibilityObserver
{
  return sub_18C3E2A94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_visibilityObserver, (uint64_t)&block_descriptor_225);
}

- (void)setPageRetitleHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_pageRetitleHandler);
  void *v6 = sub_18C5DEBC0;
  v6[1] = (void (*)(uint64_t))v5;

  swift_release();
}

- (void)setValidateDismissal:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_validateDismissal);
  void *v6 = sub_18C444890;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setItemCloseHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemCloseHandler);
  void *v6 = sub_18C5DEC40;
  v6[1] = (void (*)(uint64_t))v5;

  swift_release();
}

- (void)setDragItemProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dragItemProvider);
  void *v6 = sub_18C5DEC48;
  v6[1] = (uint64_t (*)(uint64_t))v5;

  swift_release();
}

- (void)setItemMoveHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemMoveHandler);
  void *v6 = sub_18C5DEC30;
  v6[1] = (void (*)(uint64_t, uint64_t))v5;

  swift_release();
}

- (void)setItemCopyHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemCopyHandler);
  void *v6 = sub_18C5DEC38;
  v6[1] = (void (*)(uint64_t))v5;

  swift_release();
}

- (void)setItemPinHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemPinHandler);
  void *v6 = sub_18C5DEC28;
  v6[1] = (void (*)(uint64_t, char))v5;

  swift_release();
}

- (void)setItemAddHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemAddHandler);
  void *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setDismissHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dismissHandler);
  void *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (void)setDropHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropHandler);
  void *v6 = sub_18C3789D8;
  v6[1] = (uint64_t (*)())v5;

  swift_release();
}

- (id)borrowedCapsuleViewProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_borrowedCapsuleViewProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedCapsuleViewProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D27E0;
  v5[3] = &block_descriptor_397;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)borrowedContentViewProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_borrowedContentViewProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedContentViewProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D27E0;
  v5[3] = &block_descriptor_391_0;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)dismissHandler
{
  return sub_18C3788B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dismissHandler, (uint64_t)&block_descriptor_371_0);
}

- (id)dragItemProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_dragItemProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_dragItemProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D2968;
  v5[3] = &block_descriptor_364;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)dropDestinationProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_dropDestinationProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_dropDestinationProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D2B2C;
  v5[3] = &block_descriptor_358;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)dropHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_dropHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_dropHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C3789DC;
  v5[3] = &block_descriptor_352;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)dropOperationProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_dropOperationProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_dropOperationProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D2D20;
  v5[3] = &block_descriptor_346;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)itemAddHandler
{
  return sub_18C3788B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemAddHandler, (uint64_t)&block_descriptor_340);
}

- (id)itemCloseHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_itemCloseHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_itemCloseHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D2E6C;
  v5[3] = &block_descriptor_333;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)itemCopyHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_itemCopyHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_itemCopyHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D307C;
  v5[3] = &block_descriptor_327;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)itemMoveHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_itemMoveHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_itemMoveHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D320C;
  v5[3] = &block_descriptor_321;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)itemPinHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_itemPinHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_itemPinHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D33D8;
  v5[3] = &block_descriptor_315;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)itemSelectionHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_itemSelectionHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_itemSelectionHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C3789DC;
  v5[3] = &block_descriptor_309;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)pageInsertionHandler
{
  return sub_18C3788B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_pageInsertionHandler, (uint64_t)&block_descriptor_303);
}

- (id)pageRetitleHandler
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_pageRetitleHandler];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_pageRetitleHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D3658;
  v5[3] = &block_descriptor_296_0;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)pageTitleMenuProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_pageTitleMenuProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_pageTitleMenuProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D37A0;
  v5[3] = &block_descriptor_290_0;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)profileMenuProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_profileMenuProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_profileMenuProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D39BC;
  v5[3] = &block_descriptor_284;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)recentlyClosedMenuProvider
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_recentlyClosedMenuProvider];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_recentlyClosedMenuProvider);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D27E0;
  v5[3] = &block_descriptor_278;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)relinquishBorrowedContentView
{
  uint64_t v2 = *(void *)&self->borrowedCapsuleViewProvider[OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedContentView];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedContentView);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = sub_18C5D3BE4;
  v5[3] = &block_descriptor_265;
  v3 = _Block_copy(v5);
  sub_18C6F7B98();
  swift_release();

  return v3;
}

- (id)validateDismissal
{
  return sub_18C442C5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_validateDismissal, (uint64_t)&block_descriptor_231);
}

- (void)setVisibilityObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_visibilityObserver);
  void *v6 = sub_18C5DEB50;
  v6[1] = (uint64_t (*)(char))v5;

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end