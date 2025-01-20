@interface ObservationStoreBackendServiceTrampoline
- (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline)init;
- (void)anonymousObservationCountWithCompletion:(id)a3;
- (void)attachedEventsWithIdentifierData:(id)a3 attachedDevice:(id)a4 completion:(id)a5;
- (void)decimateLowValueObservationsWithCompletion:(id)a3;
- (void)deleteAllAnonymousObservedAdvertisementsWithCompletion:(id)a3;
- (void)deleteMetadataWithBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)deleteObservedAdvertisementsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)insertWithAdvertisementData:(id)a3 completion:(id)a4;
- (void)latestAnonymousObservationsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)latestDeviceEventWithIdentifierData:(id)a3 source:(id)a4 attachedDevice:(id)a5 completion:(id)a6;
- (void)latestObservedAdvertisementWithIdentifierData:(id)a3 completion:(id)a4;
- (void)latestStatusWithIdentifierData:(id)a3 completion:(id)a4;
- (void)locationsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)markObservedAdvertisementsPublishedWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)metadataWithBeaconIdentifier:(id)a3 completion:(id)a4;
- (void)metadataWithBeaconIdentifier:(id)a3 typesData:(id)a4 completion:(id)a5;
- (void)nearbyBeaconsWithSeconds:(double)a3 completion:(id)a4;
- (void)observationsWithAdvertisementsData:(id)a3 completion:(id)a4;
- (void)removeOrphanedKeySyncMetaDataWithCompletion:(id)a3;
- (void)reverseChronologicalObservationsWithIdentifierData:(id)a3 limit:(int64_t)a4 isPublished:(BOOL)a5 completion:(id)a6;
- (void)storeDeviceEventWithDeviceEvent:(id)a3 completion:(id)a4;
- (void)storeWithKeySyncMetadataData:(id)a3 completion:(id)a4;
@end

@implementation ObservationStoreBackendServiceTrampoline

- (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline)init
{
  result = (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)insertWithAdvertisementData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_1001E06E0;
  v13[6] = v12;
  v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)deleteObservedAdvertisementsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)markObservedAdvertisementsPublishedWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)deleteAllAnonymousObservedAdvertisementsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction();
  v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_100FCFD5C;
  v6[4] = v5;
  id v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)reverseChronologicalObservationsWithIdentifierData:(id)a3 limit:(int64_t)a4 isPublished:(BOOL)a5 completion:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  type metadata accessor for Transaction();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  *(void *)(v17 + 24) = v15;
  *(void *)(v17 + 32) = v12;
  *(void *)(v17 + 40) = a4;
  *(unsigned char *)(v17 + 48) = a5;
  *(void *)(v17 + 56) = sub_100FCFD5C;
  *(void *)(v17 + 64) = v16;
  v18 = v12;
  sub_1000361E0(v13, v15);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v13, v15);
}

- (void)observationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)nearbyBeaconsWithSeconds:(double)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(double *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_100FCFD5C;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)locationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)latestStatusWithIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)latestObservedAdvertisementWithIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCFD5C;
  v13[6] = v12;
  unint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)latestAnonymousObservationsWithLimit:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_100FCFD5C;
  v8[5] = v7;
  uint64_t v9 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)latestDeviceEventWithIdentifierData:(id)a3 source:(id)a4 attachedDevice:(id)a5 completion:(id)a6
{
  uint64_t v11 = sub_10000588C(&qword_101638CF0);
  uint64_t v37 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v37 + 64);
  uint64_t v13 = __chkstk_darwin(v11 - 8);
  unint64_t v14 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v35 - v15;
  uint64_t v17 = _Block_copy(a6);
  id v18 = a3;
  v36 = self;
  id v19 = a4;
  id v20 = a5;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  if (v20)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v24 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v16, 0, 1, v24);
  }
  else
  {
    uint64_t v25 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v16, 1, 1, v25);
  }
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v17;
  v35[1] = type metadata accessor for Transaction();
  sub_1003C5E38((uint64_t)v16, (uint64_t)v14);
  unint64_t v27 = (*(unsigned __int8 *)(v37 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  unint64_t v28 = (v12 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  v29 = (void *)swift_allocObject();
  v29[2] = v21;
  v29[3] = v23;
  v29[4] = v19;
  v30 = v19;
  v31 = v36;
  v29[5] = v36;
  sub_1002729C8((uint64_t)v14, (uint64_t)v29 + v27);
  v32 = (void *)((char *)v29 + v28);
  void *v32 = sub_100FCFD5C;
  v32[1] = v26;
  v33 = v31;
  id v34 = v30;
  sub_1000361E0(v21, v23);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v21, v23);

  sub_10001DAB4((uint64_t)v16, &qword_101638CF0);
}

- (void)attachedEventsWithIdentifierData:(id)a3 attachedDevice:(id)a4 completion:(id)a5
{
  uint64_t v9 = sub_10000588C(&qword_101638CF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9 - 8);
  uint64_t v13 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v31 - v14;
  uint64_t v16 = _Block_copy(a5);
  id v17 = a3;
  id v18 = self;
  id v19 = a4;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  if (v19)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v23 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 0, 1, v23);
  }
  else
  {
    uint64_t v24 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v15, 1, 1, v24);
  }
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v16;
  type metadata accessor for Transaction();
  sub_1003C5E38((uint64_t)v15, (uint64_t)v13);
  unint64_t v26 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v27 = (v11 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (void *)swift_allocObject();
  v28[2] = v20;
  v28[3] = v22;
  v28[4] = v18;
  sub_1002729C8((uint64_t)v13, (uint64_t)v28 + v26);
  v29 = (void *)((char *)v28 + v27);
  void *v29 = sub_100FCFD5C;
  v29[1] = v25;
  v30 = v18;
  sub_1000361E0(v20, v22);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v20, v22);

  sub_10001DAB4((uint64_t)v15, &qword_101638CF0);
}

- (void)storeDeviceEventWithDeviceEvent:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_1001E06E0;
  v13[6] = v12;
  uint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)anonymousObservationCountWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction();
  v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1001DFD28;
  v6[4] = v5;
  id v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)decimateLowValueObservationsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction();
  v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_100FCFD5C;
  v6[4] = v5;
  id v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)storeWithKeySyncMetadataData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_1001E06E0;
  v13[6] = v12;
  uint64_t v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

- (void)metadataWithBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  id v18 = (void *)(v17 + v16);
  void *v18 = sub_100FCFD5C;
  v18[1] = v14;
  id v19 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)metadataWithBeaconIdentifier:(id)a3 typesData:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - v13;
  unint64_t v15 = _Block_copy(a5);
  unint64_t v28 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a4;
  uint64_t v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v15;
  uint64_t v27 = type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v22 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v23 = (v10 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v18;
  *((void *)v24 + 3) = v20;
  *((void *)v24 + 4) = v17;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v24[v22], v12, v8);
  uint64_t v25 = (void (**)(uint64_t, unint64_t, uint64_t))&v24[v23];
  *uint64_t v25 = sub_100FCF478;
  v25[1] = (void (*)(uint64_t, unint64_t, uint64_t))v21;
  unint64_t v26 = v17;
  sub_1000361E0(v18, v20);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v18, v20);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v8);
}

- (void)deleteMetadataWithBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = self;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  uint64_t v18 = (void *)(v17 + v16);
  void *v18 = sub_1001E06E0;
  v18[1] = v14;
  unint64_t v19 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)removeOrphanedKeySyncMetaDataWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1001DF814;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

@end