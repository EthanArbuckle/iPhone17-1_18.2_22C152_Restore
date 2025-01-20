@interface BeaconSharingTrampoline
- (_TtC12searchpartyd23BeaconSharingTrampoline)init;
- (void)acceptShare:(id)a3 completion:(id)a4;
- (void)allSharesIncludingHiddenWithCompletion:(id)a3;
- (void)allSharesWithCompletion:(id)a3;
- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4;
- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4;
- (void)declineShare:(id)a3 completion:(id)a4;
- (void)delegatedShare:(id)a3 completion:(id)a4;
- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5;
- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4;
- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4;
- (void)forceDeclineShare:(id)a3 completion:(id)a4;
- (void)forceStopSharing:(id)a3 completion:(id)a4;
- (void)getDelegation:(id)a3 completion:(id)a4;
- (void)isBeaconDelegated:(id)a3 completion:(id)a4;
- (void)lookForOrphanedRecordsWithCompletion:(id)a3;
- (void)removeExpiredSharesWithCompletion:(id)a3;
- (void)removeShare:(id)a3 completion:(id)a4;
- (void)requestShare:(id)a3 completion:(id)a4;
- (void)revokeShare:(id)a3 completion:(id)a4;
- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6;
- (void)sharingLimitsWithCompletion:(id)a3;
- (void)startRefreshingSharesWithCompletion:(id)a3;
- (void)stopRefreshingSharesWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 completion:(id)a4;
- (void)stopTemporaryItemLocationShare:(id)a3 completion:(id)a4;
- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4;
- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5;
@end

@implementation BeaconSharingTrampoline

- (void)share:(id)a3 recipients:(id)a4 shareType:(unint64_t)a5 completion:(id)a6
{
  v31 = self;
  unint64_t v32 = a5;
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  v29 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v30 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v30);
  v12 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v27 - v13;
  v15 = _Block_copy(a6);
  v28 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10001D4B0(0, (unint64_t *)&qword_10163B900);
  sub_10012E2E4(&qword_10163C0A0, (unint64_t *)&qword_10163B900);
  uint64_t v27 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  uint64_t v17 = type metadata accessor for TaskPriority();
  uint64_t v18 = (uint64_t)v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v29, 1, 1, v17);
  v19 = v14;
  uint64_t v20 = v30;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v19, v30);
  unint64_t v21 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  v24 = v31;
  *((void *)v23 + 4) = v32;
  *((void *)v23 + 5) = v24;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v23[v21], v12, v20);
  *(void *)&v23[v22] = v27;
  v25 = (void (**)(char, uint64_t))&v23[(v22 + 15) & 0xFFFFFFFFFFFFFFF8];
  *v25 = sub_1001337A0;
  v25[1] = (void (*)(char, uint64_t))v16;
  v26 = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1008F5E44(v18, (uint64_t)&unk_10163C0B0, (uint64_t)v23);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v20);
}

- (void)removeShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163C098, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)revokeShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163C078, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)acceptShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163C058, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)declineShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163C040, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)stopSharing:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  uint64_t v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163C018, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)forceBreakAllSharesOfType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100134008;
  v13[7] = v11;
  uint64_t v14 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BFE8, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)forceBreakAllSharesWithUser:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100134008;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BFC8, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)forceDeclineShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - v14;
  id v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163BFA8, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)cleanupAllRecordsOfType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100134008;
  v13[7] = v11;
  uint64_t v14 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BF98, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)forceStopSharing:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - v14;
  id v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163BF70, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)allSharesWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = sub_1001340A0;
  v11[5] = v9;
  v11[6] = self;
  uint64_t v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_10163BF60, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)allSharesIncludingHiddenWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = sub_100132544;
  v11[5] = v9;
  v11[6] = self;
  uint64_t v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_10163BF50, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)startRefreshingSharesWithCompletion:(id)a3
{
}

- (void)stopRefreshingSharesWithCompletion:(id)a3
{
}

- (void)requestShare:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - v14;
  id v16 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v19 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v20 = (v11 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = 0;
  *((void *)v21 + 3) = 0;
  *((void *)v21 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v21[v19], v13, v9);
  unint64_t v22 = &v21[v20];
  *(void *)unint64_t v22 = sub_100134008;
  *((void *)v22 + 1) = v17;
  v23 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163BF00, (uint64_t)v21);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)updatedCircleIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = sub_100134008;
  v13[7] = v11;
  uint64_t v14 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1008F5E44((uint64_t)v8, (uint64_t)&unk_10163BEF0, (uint64_t)v13);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)uploadKeysWithCircleIdentifier:(id)a3 isInitialUpload:(BOOL)a4 completion:(id)a5
{
  BOOL v27 = a4;
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v9;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v16 = (char *)&v26 - v15;
  uint64_t v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = v20 + v12;
  unint64_t v22 = (v20 + v12) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  uint64_t v24 = &v23[v22];
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v20], v14, v10);
  v23[v21] = v27;
  *((void *)v24 + 1) = sub_100134008;
  *((void *)v24 + 2) = v18;
  v25 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v26, (uint64_t)&unk_10163BED8, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)downloadKeysWithCircleIdentifier:(id)a3 fromBookmark:(BOOL)a4 completion:(id)a5
{
  BOOL v27 = a4;
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v9;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v16 = (char *)&v26 - v15;
  uint64_t v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  uint64_t v19 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v9, 1, 1, v19);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = v20 + v12;
  unint64_t v22 = (v20 + v12) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  uint64_t v24 = &v23[v22];
  *((void *)v23 + 2) = 0;
  *((void *)v23 + 3) = 0;
  *((void *)v23 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v23[v20], v14, v10);
  v23[v21] = v27;
  *((void *)v24 + 1) = sub_100134008;
  *((void *)v24 + 2) = v18;
  v25 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v26, (uint64_t)&unk_10163BEC8, (uint64_t)v23);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)checkDataIntegrityWithShareIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000588C(&qword_101638CF0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10 - 8);
  uint64_t v14 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v16 = (char *)&v27 - v15;
  uint64_t v17 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  uint64_t v21 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 1, 1, v21);
  sub_10001D074((uint64_t)v16, (uint64_t)v14, &qword_101638CF0);
  unint64_t v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = self;
  sub_10001D608((uint64_t)v14, (uint64_t)v24 + v22, &qword_101638CF0);
  v25 = (void (**)(char, uint64_t, uint64_t))((char *)v24 + v23);
  _TtC12searchpartyd23BeaconSharingTrampoline *v25 = sub_100131A40;
  v25[1] = (void (*)(char, uint64_t, uint64_t))v20;
  v26 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BEB8, (uint64_t)v24);
  swift_release();
  swift_release();

  sub_10001DAB4((uint64_t)v16, &qword_101638CF0);
}

- (void)lookForOrphanedRecordsWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_100131A40;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_10163BEA8, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)removeExpiredSharesWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_100134008;
  v11[6] = v9;
  uint64_t v12 = self;
  swift_retain();
  sub_1008F5E44((uint64_t)v7, (uint64_t)&unk_10163BE98, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (void)sharingLimitsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10012CF50((uint64_t)sub_100131888, v5);

  swift_release();
}

- (void)delegatedShare:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100134004;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BE60, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)isBeaconDelegated:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_100131660;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BE48, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)getDelegation:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_10013156C;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BE30, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (void)stopTemporaryItemLocationShare:(id)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = sub_10013148C;
  v13[7] = v11;
  id v14 = a3;
  uint64_t v15 = self;
  id v16 = v14;
  swift_retain();
  sub_1008F5E44((uint64_t)v9, (uint64_t)&unk_10163BE10, (uint64_t)v13);
  swift_release();
  swift_release();
}

- (_TtC12searchpartyd23BeaconSharingTrampoline)init
{
  result = (_TtC12searchpartyd23BeaconSharingTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end