@interface _STKMessagesObjCStoreFacade
- (BOOL)donateStickerToRecentsWithIdentifier:(id)a3 representations:(id)a4 stickerEffectEnum:(int64_t)a5 externalURI:(id)a6 name:(id)a7 accessibilityName:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 error:(id *)a11;
- (_STKMessagesObjCStoreFacade)init;
@end

@implementation _STKMessagesObjCStoreFacade

- (_STKMessagesObjCStoreFacade)init
{
  uint64_t v3 = type metadata accessor for StickerStore.PersistenceType();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E425390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 3, v6);
  uint64_t v7 = type metadata accessor for StickerStore();
  swift_allocObject();
  v8 = self;
  uint64_t v9 = StickerStore.init(persistence:)((uint64_t)v5);
  v10 = (uint64_t *)((char *)v8 + OBJC_IVAR____STKMessagesObjCStoreFacade_store);
  v10[3] = v7;
  v10[4] = (uint64_t)&protocol witness table for StickerStore;
  uint64_t *v10 = v9;

  v11 = (objc_class *)type metadata accessor for _STKMessagesObjCStoreFacade();
  v13.receiver = v8;
  v13.super_class = v11;
  return [(_STKMessagesObjCStoreFacade *)&v13 init];
}

- (BOOL)donateStickerToRecentsWithIdentifier:(id)a3 representations:(id)a4 stickerEffectEnum:(int64_t)a5 externalURI:(id)a6 name:(id)a7 accessibilityName:(id)a8 metadata:(id)a9 attributionInfo:(id)a10 error:(id *)a11
{
  uint64_t v35 = sub_25E4258F0();
  uint64_t v16 = v15;
  type metadata accessor for _STKStickerUIStickerRepresentation();
  unint64_t v17 = sub_25E425AC0();
  if (a6)
  {
    uint64_t v18 = sub_25E4258F0();
    uint64_t v38 = v19;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v38 = 0;
  }
  uint64_t v40 = v16;
  uint64_t v34 = v18;
  if (a7)
  {
    uint64_t v20 = sub_25E4258F0();
    uint64_t v36 = v21;
    id v22 = a9;
    id v23 = a10;
    if (a8)
    {
LABEL_6:
      uint64_t v24 = sub_25E4258F0();
      a8 = v25;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v36 = 0;
    id v22 = a9;
    id v23 = a10;
    if (a8) {
      goto LABEL_6;
    }
  }
  uint64_t v24 = 0;
LABEL_9:
  id v26 = v23;
  v27 = self;
  v39 = v26;
  if (v22)
  {
    uint64_t v28 = v20;
    id v29 = v22;
    uint64_t v30 = sub_25E4253D0();
    unint64_t v32 = v31;

    uint64_t v20 = v28;
  }
  else
  {
    uint64_t v30 = 0;
    unint64_t v32 = 0xF000000000000000;
  }
  sub_25E3EF60C(v35, v40, v17, a5, v34, v38, v20, v36, v24, (uint64_t)a8, v30, v32, (char *)v23);

  sub_25E3CEB1C(v30, v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (void).cxx_destruct
{
}

@end