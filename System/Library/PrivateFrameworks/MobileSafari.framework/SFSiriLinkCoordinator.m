@interface SFSiriLinkCoordinator
+ (void)setApplicationProxy:(id)a3;
- (SFSiriLinkActionPerformer)actionPerformer;
- (SFSiriLinkCoordinator)init;
- (id)changeReaderModeInteraction;
- (id)closeTabInteraction;
- (id)closeViewInteraction;
- (id)createNewBookmarkInteraction;
- (id)createNewPrivateTabInteraction;
- (id)createNewTabGroupInteraction;
- (id)createNewTabInteraction;
- (id)createNewTabInteractionForAssistantIntent;
- (id)createReadingListItemInteraction;
- (id)findOnPageInteraction;
- (id)listenToPageSiriReaderInteraction;
- (id)loadURLInTabInteraction;
- (id)navigateContinuousReadingListInteraction;
- (id)openBookmarkInTabInteraction;
- (id)openBookmarkInteraction;
- (id)openClearHistoryInteraction;
- (id)openReadingListItemInteraction;
- (id)openTabGroupInteraction;
- (id)openTabInteraction;
- (id)openViewInteraction;
- (id)searchTabsInteraction;
- (id)searchWebAssistantIntentInteraction;
- (id)webSearchInteraction;
- (void)setActionPerformer:(id)a3;
@end

@implementation SFSiriLinkCoordinator

- (SFSiriLinkCoordinator)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)SFSiriLinkCoordinator;
  return [(SFSiriLinkCoordinator *)&v4 init];
}

- (id)createNewTabInteractionForAssistantIntent
{
  return sub_18C3E1CA8(self, (uint64_t)a2, (void (*)(void))sub_18C3600B0);
}

- (id)navigateContinuousReadingListInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E9179C78;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C361BA4();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)searchWebAssistantIntentInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E91776D8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C362B64();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)listenToPageSiriReaderInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E9176A30;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C362F1C();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)createReadingListItemInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917B690;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C35EB44();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openReadingListItemInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917B680;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C3601D0();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)createNewPrivateTabInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917AEE8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C360260();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openBookmarkInTabInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A618;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C35EAB4();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)createNewTabGroupInteraction
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v3 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C3602F0();
  uint64_t v4 = self;
  id v5 = (void *)sub_18C6F8628();

  return v5;
}

- (id)createNewBookmarkInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A638;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C35EBD4();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openClearHistoryInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E9178890;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C362CC0();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)changeReaderModeInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E91766F8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C360140();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openTabGroupInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A538;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C360380();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openBookmarkInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A628;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C35ED3C();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)loadURLInTabInteraction
{
  return sub_18C3E1CA8(self, (uint64_t)a2, (void (*)(void))sub_18C362E8C);
}

- (id)createNewTabInteraction
{
  return sub_18C3E1CA8(self, (uint64_t)a2, (void (*)(void))sub_18C360410);
}

- (id)searchTabsInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E91768D0;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C363018();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)findOnPageInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A0A8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C3630A8();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)webSearchInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917C0F8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C361978();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)closeViewInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E9176B40;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C361A08();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

+ (void)setApplicationProxy:(id)a3
{
  swift_unknownObjectRetain();
  _sSo21SFSiriLinkCoordinatorC12MobileSafariE19setApplicationProxyyySo09SFBrowsergH0_pFZ_0();

  swift_unknownObjectRelease();
}

- (id)openViewInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E9176B50;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C361A98();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)closeTabInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A2A0;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C35FF90();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (id)openTabInteraction
{
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &unk_1E917A2B0;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_allocWithZone((Class)sub_18C6F8638());
  sub_18C360020();
  v6 = self;
  v7 = (void *)sub_18C6F8628();

  return v7;
}

- (void)setActionPerformer:(id)a3
{
}

- (SFSiriLinkActionPerformer)actionPerformer
{
  v2 = (char *)self + OBJC_IVAR___SFSiriLinkCoordinator_actionPerformer;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x192F967B0](v2);

  return (SFSiriLinkActionPerformer *)v3;
}

- (void).cxx_destruct
{
}

@end