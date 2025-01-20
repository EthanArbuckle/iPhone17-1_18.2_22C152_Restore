@interface MTCoreDataKeyRequestStorage
- (BOOL)keyExistsInStorageFor:(int64_t)a3;
- (BOOL)saveKeyDataFor:(id)a3;
- (MTCoreDataKeyRequestStorage)init;
- (id)retrieveKeyDataFor:(id)a3;
- (void)markOfflineKeyFor:(int64_t)a3 pendingDeletion:(BOOL)a4;
- (void)removeAllKeyDataWithCompletion:(id)a3;
- (void)removeKeyDataFor:(id)a3;
- (void)removeKeyDataForStoreTrackID:(int64_t)a3;
- (void)saveKeyDataWithKeyIdentifier:(id)a3 storeTrackID:(int64_t)a4 keyData:(id)a5 renewalDate:(id)a6 dsid:(int64_t)a7 responseQueue:(id)a8 completion:(id)a9;
@end

@implementation MTCoreDataKeyRequestStorage

- (BOOL)saveKeyDataFor:(id)a3
{
  v3 = (char *)a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1ACCCB908(v3);

  return v3 & 1;
}

- (void)saveKeyDataWithKeyIdentifier:(id)a3 storeTrackID:(int64_t)a4 keyData:(id)a5 renewalDate:(id)a6 dsid:(int64_t)a7 responseQueue:(id)a8 completion:(id)a9
{
  uint64_t v28 = a4;
  uint64_t v29 = a7;
  uint64_t v13 = sub_1ACE750A8();
  uint64_t v30 = *(void *)(v13 - 8);
  uint64_t v31 = v13;
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a9);
  uint64_t v17 = sub_1ACE761B8();
  uint64_t v19 = v18;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  v23 = self;
  uint64_t v24 = sub_1ACE74F88();
  unint64_t v26 = v25;

  sub_1ACE75078();
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v16;
  sub_1ACCCC3C8(v17, v19, v28, v24, v26, (uint64_t)v15, v29, v22, (uint64_t)sub_1ACCD03B8, v27);
  swift_release();
  sub_1ACA50850(v24, v26);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v31);
}

- (void)removeKeyDataFor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ACCCCBD4((uint64_t)a3);
}

- (void)removeKeyDataForStoreTrackID:(int64_t)a3
{
  v4 = self;
  sub_1ACCCD058(a3);
}

- (void)removeAllKeyDataWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1ACCCFE94((uint64_t)sub_1ACCD0328, v5);

  swift_release();
}

- (id)retrieveKeyDataFor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ACCCD824(a3);
  v8 = v7;

  return v8;
}

- (BOOL)keyExistsInStorageFor:(int64_t)a3
{
  v4 = self;
  LOBYTE(a3) = sub_1ACCCE388(a3);

  return a3 & 1;
}

- (void)markOfflineKeyFor:(int64_t)a3 pendingDeletion:(BOOL)a4
{
  v6 = self;
  sub_1ACCCE578(a3, a4);
}

- (MTCoreDataKeyRequestStorage)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataKeyRequestStorage();
  return [(MTCoreDataKeyRequestStorage *)&v3 init];
}

@end