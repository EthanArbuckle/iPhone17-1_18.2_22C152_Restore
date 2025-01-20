@interface OfflineIssueAutoDownloader
- (_TtC7NewsUI226OfflineIssueAutoDownloader)init;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation OfflineIssueAutoDownloader

- (_TtC7NewsUI226OfflineIssueAutoDownloader)init
{
  result = (_TtC7NewsUI226OfflineIssueAutoDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226OfflineIssueAutoDownloader_offlineFeatures);
  swift_release();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    uint64_t v13 = sub_1DFDFE5D0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = 0;
  if (a5) {
LABEL_3:
  }
    sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    sub_1DFDFE5D0();
  }
  if (a7) {
    sub_1DFDFE5D0();
  }
  id v14 = a3;
  v15 = self;
  v16 = self;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  *(void *)(v17 + 24) = v15;
  v20[4] = sub_1DEDC483C;
  v20[5] = v17;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 1107296256;
  v20[2] = sub_1DE9744A8;
  v20[3] = &block_descriptor_44;
  v18 = _Block_copy(v20);
  swift_bridgeObjectRetain();
  v19 = v15;
  swift_release();
  objc_msgSend(v16, sel_scheduleLowPriorityBlock_, v18);
  _Block_release(v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end