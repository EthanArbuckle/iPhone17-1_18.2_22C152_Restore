@interface MFServerMessagesIndexer
- (MFServerMessagesIndexer)init;
- (MFServerMessagesIndexer)initWithAccountsProvider:(id)a3;
- (void)excludeIndexedUIDsInMailbox:(id)a3 ofAccount:(id)a4 fromUIDs:(id)a5 completion:(id)a6;
- (void)getIndexingStatisticsWithCompletion:(id)a3;
- (void)performSearchQuery:(id)a3 completion:(id)a4;
- (void)registerSystemTask;
@end

@implementation MFServerMessagesIndexer

- (void).cxx_destruct
{
  sub_1A809F8B0();
  sub_1A809F8B0();
}

- (MFServerMessagesIndexer)initWithAccountsProvider:(id)a3
{
  return (MFServerMessagesIndexer *)sub_1A8365838((uint64_t)a3);
}

- (void)registerSystemTask
{
  swift_getObjectType();
  v3 = self;
  sub_1A8365E34();
}

- (void)performSearchQuery:(id)a3 completion:(id)a4
{
  swift_getObjectType();
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_1A83677CC(a3, (void (*)(void))sub_1A8370DA8, v9);
  swift_release();
}

- (void)getIndexingStatisticsWithCompletion:(id)a3
{
  swift_getObjectType();
  v6 = _Block_copy(a3);
  v4 = self;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  sub_1A8369804((void (*)(uint64_t, void))sub_1A83716D4, v7);
  swift_release();
}

- (void)excludeIndexedUIDsInMailbox:(id)a3 ofAccount:(id)a4 fromUIDs:(id)a5 completion:(id)a6
{
  v34 = self;
  id v33 = a3;
  id v28 = a4;
  id v35 = a5;
  id v22 = a6;
  uint64_t v20 = 0;
  v25 = sub_1A8371B04;
  swift_getObjectType();
  uint64_t v32 = sub_1A8A74998();
  uint64_t v29 = *(void *)(v32 - 8);
  uint64_t v30 = v32 - 8;
  unint64_t v21 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v33);
  v31 = (char *)&v20 - v21;
  id v8 = v7;
  id v9 = v28;
  id v10 = v35;
  v23 = _Block_copy(v22);
  v11 = self;
  sub_1A8A74928();
  uint64_t v24 = sub_1A8A76558();
  v27 = v12;
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v24;
  v15 = (void (*)(id))v25;
  v16 = v27;
  id v17 = v35;
  uint64_t v18 = v13;
  uint64_t v19 = (uint64_t)v31;
  uint64_t v26 = v18;
  *(void *)(v18 + 16) = v23;
  sub_1A836B240(v19, v14, v16, v17, v15, (void (*)(id))v18);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v32);
}

- (MFServerMessagesIndexer)init
{
  return (MFServerMessagesIndexer *)MFServerMessagesIndexer.init()();
}

@end