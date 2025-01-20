@interface AdvertisementCacheTrampoline
- (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline)init;
- (void)advertisementCacheSimulation:(BOOL)a3 completion:(id)a4;
- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6;
- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4;
- (void)clearCacheWithCompletion:(id)a3;
- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4;
- (void)markFilesProcessed:(id)a3 completion:(id)a4;
- (void)saveAdvertisements:(id)a3 completion:(id)a4;
- (void)saveBeaconPayloads:(id)a3 completion:(id)a4;
@end

@implementation AdvertisementCacheTrampoline

- (void)saveBeaconPayloads:(id)a3 completion:(id)a4
{
}

- (void)markFilesProcessed:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = (char *)self
     + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess();
  uint64_t v9 = *((void *)v8 + 3);
  uint64_t ObjectType = swift_getObjectType();
  v11 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 32);
  v12 = self;
  swift_unknownObjectRetain();
  v11(v6, sub_1001E06E0, v7, ObjectType, v9);

  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)beaconPayloadsForSearchCriteria:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (char *)self
     + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess();
  uint64_t v9 = *((void *)v8 + 3);
  uint64_t ObjectType = swift_getObjectType();
  id v10 = a3;
  v19 = self;
  swift_unknownObjectRetain();
  uint64_t v11 = sub_100369154();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1001E06E4;
  *(void *)(v16 + 24) = v7;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, void (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v9 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  v17(v11, v13, v15, sub_1001E015C, v16, ObjectType, v9);

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)beaconAdvertisementAtFileURL:(id)a3 beaconIdentifier:(id)a4 scanDate:(id)a5 completion:(id)a6
{
  id v48 = a3;
  uint64_t v49 = (uint64_t)a4;
  v57 = self;
  uint64_t v7 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v58 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for Date();
  uint64_t v59 = *(void *)(v53 - 8);
  uint64_t v54 = *(void *)(v59 + 64);
  uint64_t v9 = __chkstk_darwin(v53);
  v60 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v43 - v11;
  uint64_t v51 = type metadata accessor for UUID();
  uint64_t v56 = *(void *)(v51 - 8);
  uint64_t v13 = *(void *)(v56 + 64);
  uint64_t v14 = __chkstk_darwin(v51);
  v55 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v43 - v15;
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v44 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v20 = __chkstk_darwin(v17);
  v45 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v22 = (char *)&v43 - v21;
  v23 = _Block_copy(a6);
  v52 = v22;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v50 = v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v47 = v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v49 = swift_allocObject();
  *(void *)(v49 + 16) = v23;
  v24 = (id *)((char *)&v57->super.isa
             + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation);
  swift_beginAccess();
  id v48 = *v24;
  uint64_t v25 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v58, 1, 1, v25);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))((char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v17);
  uint64_t v26 = v56;
  v27 = v16;
  uint64_t v28 = v51;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v55, v27, v51);
  uint64_t v29 = v59;
  uint64_t v30 = v53;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v60, v12, v53);
  uint64_t v31 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v32 = v18;
  uint64_t v46 = v18;
  uint64_t v33 = (v31 + 56) & ~v31;
  unint64_t v34 = (v19 + *(unsigned __int8 *)(v26 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  unint64_t v35 = (v13 + *(unsigned __int8 *)(v29 + 80) + v34) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v36 = (char *)swift_allocObject();
  *((void *)v36 + 2) = 0;
  *((void *)v36 + 3) = 0;
  uint64_t v37 = v49;
  *((void *)v36 + 4) = v48;
  *((void *)v36 + 5) = sub_1001DFD28;
  *((void *)v36 + 6) = v37;
  v38 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  uint64_t v39 = v44;
  v38(&v36[v33], v45, v44);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v36[v34], v55, v28);
  v40 = &v36[v35];
  uint64_t v41 = v59;
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v40, v60, v30);
  swift_unknownObjectRetain_n();
  v42 = v57;
  swift_retain();
  sub_1008F5E44(v58, (uint64_t)&unk_10163EB30, (uint64_t)v36);

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v30);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v50, v28);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v52, v39);
}

- (void)saveAdvertisements:(id)a3 completion:(id)a4
{
}

- (void)markAdvertisementsProcessed:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for UUID();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_1001DEFC8(v6, (uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)advertisementsForSearchCriteria:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1001DF81C((uint64_t)sub_100131888, v7);

  swift_release();
}

- (void)advertisementCacheSimulation:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = (char *)self
     + OBJC_IVAR____TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline_implementation;
  swift_beginAccess();
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *((void *)v7 + 1);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = self;
  swift_unknownObjectRetain();
  long long v12 = *((_OWORD *)v7 + 1);
  long long v13 = *((_OWORD *)v7 + 2);
  (*(void (**)(BOOL, uint64_t))(v12 + 16))(v4, ObjectType);
  *(void *)uint64_t v7 = v8;
  *((void *)v7 + 1) = v9;
  *((_OWORD *)v7 + 1) = v12;
  *((_OWORD *)v7 + 2) = v13;
  swift_endAccess();
  swift_unknownObjectRelease();
  v6[2](v6, 0);
  _Block_release(v6);
}

- (void)clearCacheWithCompletion:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1001DF9E4((uint64_t)sub_1001DF814, v5);

  swift_release();
}

- (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline)init
{
  result = (_TtC12searchpartydP33_EBCE4CC9FC18641636B173DB27D7BE0028AdvertisementCacheTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end