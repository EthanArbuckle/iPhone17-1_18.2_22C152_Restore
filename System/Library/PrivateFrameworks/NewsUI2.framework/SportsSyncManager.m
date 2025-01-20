@interface SportsSyncManager
- (_TtC7NewsUI217SportsSyncManager)init;
- (void)appleAccountChanged;
- (void)handleSyncCompletionNotification;
- (void)handleSyncSettingChangedNotification;
- (void)handleiTunesAccountChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
- (void)subscriptionControllerDidStopSyncingRemoteChanges:(id)a3;
- (void)subscriptionControllerWillStartSyncingRemoteChanges:(id)a3;
- (void)userInfoDidChangeSportsSyncState:(id)a3;
@end

@implementation SportsSyncManager

- (_TtC7NewsUI217SportsSyncManager)init
{
  result = (_TtC7NewsUI217SportsSyncManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI217SportsSyncManager_syncService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI217SportsSyncManager_tagService);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI217SportsSyncManager____lazy_storage___operationQueue));
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)handleSyncCompletionNotification
{
  v2 = self;
  sub_1DEE3B8FC("Sports sync manager received sync completion notification from watchlist", (uint64_t)sub_1DEE4A6C8, (uint64_t)&block_descriptor_150);
}

- (void)handleSyncSettingChangedNotification
{
  v2 = self;
  sub_1DEE3B8FC("Sports sync manager received sync setting notification from watchlist", (uint64_t)sub_1DEE4A670, (uint64_t)&block_descriptor_145);
}

- (void)handleiTunesAccountChanged
{
  v2 = self;
  sub_1DEE3B8FC("Sports sync manager detected apple account changed", (uint64_t)sub_1DEE4A5E4, (uint64_t)&block_descriptor_141);
}

- (void)subscriptionControllerWillStartSyncingRemoteChanges:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DEE48874();
}

- (void)subscriptionControllerDidStopSyncingRemoteChanges:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DEE48984();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    uint64_t v14 = sub_1DFDFE5D0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  if (a5) {
LABEL_3:
  }
    sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    sub_1DFDFE5D0();
  }
  if (a7) {
    a7 = (id)sub_1DFDFE5D0();
  }
  id v15 = a3;
  v16 = self;
  sub_1DEE48A90(v14, (uint64_t)a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)userInfoDidChangeSportsSyncState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DEE3C6C8(v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_1DFDFDD20();
    uint64_t v11 = v10;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v12 = a5;
      v13 = self;
      sub_1DFDFF780();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  memset(v18, 0, sizeof(v18));
  id v14 = a5;
  id v15 = self;
LABEL_6:
  uint64_t v16 = MEMORY[0x1E4FBC840];
  if (a5)
  {
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1DEA54AA4(&qword_1EAC1FA20, type metadata accessor for NSKeyValueChangeKey);
    uint64_t v17 = sub_1DFDFDAF0();
  }
  else
  {
    uint64_t v17 = 0;
  }
  sub_1DEE49208(v9, v11, (uint64_t)v18, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEA2C93C((uint64_t)v18, (uint64_t)&qword_1EBABB7F0, v16 + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1DEAE8B40);
}

- (void)appleAccountChanged
{
  v2 = self;
  sub_1DEE3CEF0();
}

@end