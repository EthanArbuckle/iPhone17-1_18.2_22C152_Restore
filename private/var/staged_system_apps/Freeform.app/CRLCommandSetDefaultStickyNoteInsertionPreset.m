@interface CRLCommandSetDefaultStickyNoteInsertionPreset
- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)init;
- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)initWithStickyNoteItem:(id)a3;
@end

@implementation CRLCommandSetDefaultStickyNoteInsertionPreset

- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)initWithStickyNoteItem:(id)a3
{
  id v3 = a3;
  sub_100EC3284(v3, 0, (uint64_t)v15);
  v16 = &_swiftEmptyDictionarySingleton;
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v15, v4);
  v5 = (objc_class *)type metadata accessor for CRLCommandSetDefaultStickyNoteInsertionPreset();
  id v6 = objc_allocWithZone(v5);
  uint64_t v7 = OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_actionString;
  uint64_t v8 = qword_10166EB30;
  v9 = (char *)v6;
  if (v8 != -1) {
    swift_once();
  }
  v10 = &v9[v7];
  uint64_t v11 = *(void *)algn_101672328;
  *(void *)v10 = qword_101672320;
  *((void *)v10 + 1) = v11;
  sub_10051B3EC((uint64_t)v15, (uint64_t)&v9[OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_stickyStyle], &qword_101672448);
  swift_bridgeObjectRetain();

  v14.receiver = v9;
  v14.super_class = v5;
  v12 = [(CRLCommand *)&v14 init];

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)init
{
  result = (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10051B3EC((uint64_t)self + OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_stickyStyle, (uint64_t)v2, &qword_101672448);
  sub_10051ACC4(v2, sub_10051A794);
  swift_bridgeObjectRelease();
}

@end