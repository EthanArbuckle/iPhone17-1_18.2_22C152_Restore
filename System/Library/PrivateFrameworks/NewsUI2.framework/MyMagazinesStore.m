@interface MyMagazinesStore
- (_TtC7NewsUI216MyMagazinesStore)init;
- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4;
- (void)offlineIssueList:(id)a3 didAddIssues:(id)a4 removeIssues:(id)a5;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
@end

@implementation MyMagazinesStore

- (_TtC7NewsUI216MyMagazinesStore)init
{
  result = (_TtC7NewsUI216MyMagazinesStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_issueService);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_paidBundleConfigManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216MyMagazinesStore_myMagazinesPersonalizationService);
  swift_release();

  swift_release();
  swift_release();
}

- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4
{
  uint64_t v6 = sub_1DFDFE220();
  id v7 = a3;
  v8 = self;
  sub_1DF7E70AC(v6);

  swift_bridgeObjectRelease();
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
    a7 = (id)sub_1DFDFE5D0();
  }
  id v14 = a3;
  v15 = self;
  sub_1DF7E7594(v13, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)offlineIssueList:(id)a3 didAddIssues:(id)a4 removeIssues:(id)a5
{
  uint64_t v7 = sub_1DF3C0F74((uint64_t)&unk_1F3A6AA20);
  id v8 = a3;
  v9 = self;
  sub_1DFDEE090();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v7;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1DF7E7CBC;
  *(void *)(v11 + 24) = v10;
  v12 = v9;
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDDF0();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end