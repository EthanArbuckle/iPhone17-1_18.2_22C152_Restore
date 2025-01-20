@interface ICQueryObjC
+ (id)objc_queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3;
+ (id)objc_queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3;
+ (id)objc_queryForNonDeletedNotes;
+ (id)objc_queryForNotesMatchingFilterSelection:(id)a3;
+ (id)objc_queryForNotesMatchingTagSelection:(id)a3;
+ (id)objc_queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4;
+ (id)objc_queryForRecentlyDeletedMathNotes;
+ (id)objc_queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4;
+ (id)objc_queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3;
- (BOOL)canBeEdited;
- (BOOL)isEqual:(id)a3;
- (ICQueryObjC)init;
- (NSPredicate)predicate;
- (NSString)debugDescription;
- (NSString)entityName;
- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4;
- (id)removingTagIdentifier:(id)a3;
- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4;
- (id)tagSelectionWithManagedObjectContext:(id)a3;
- (int64_t)minimumSupportedVersion;
@end

@implementation ICQueryObjC

- (id)filterSelectionWithManagedObjectContext:(id)a3 account:(id)a4
{
  swift_beginAccess();
  swift_retain();
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  ICQueryType.filterSelection(managedObjectContext:accountObjectID:)(v10, (NSManagedObjectContext)v7, (NSManagedObjectID)v8);
  v12 = v11;

  swift_release();
  return v12;
}

- (id)tagSelectionWithManagedObjectContext:(id)a3
{
  swift_beginAccess();
  swift_retain();
  id v5 = a3;
  v6 = self;
  v12.value.super.isa = (Class)a3;
  ICQueryType.tagSelection(managedObjectContext:)(v7, v12);
  v9 = v8;

  swift_release();
  return v9;
}

- (int64_t)minimumSupportedVersion
{
  uint64_t v2 = swift_beginAccess();
  return ICQueryType.minimumSupportedVersion.getter(v2);
}

- (BOOL)canBeEdited
{
  uint64_t v2 = swift_beginAccess();
  return ICQueryType.canBeEdited.getter(v2) & 1;
}

- (NSString)entityName
{
  uint64_t v2 = (void *)sub_1C3DB9BF8();
  return (NSString *)v2;
}

- (NSPredicate)predicate
{
  swift_beginAccess();
  uint64_t v2 = (void *)ICQueryType.predicate.getter();
  return (NSPredicate *)v2;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  sub_1C3D0CE88();

  v3 = (void *)sub_1C3DB9BF8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C3DBAA68();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = sub_1C3D0CFD4((uint64_t)v8);

  sub_1C3C2A448((uint64_t)v8, qword_1EB6FB1D8);
  return v6 & 1;
}

- (ICQueryObjC)init
{
  result = (ICQueryObjC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (id)objc_queryForNotesMatchingFilterSelection:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ICQuery.makeQueryForNotesMatching(_:)(v4);

  return v5;
}

+ (id)objc_queryForNotesMatchingTagSelection:(id)a3
{
  id v3 = a3;
  id v4 = _s11NotesShared7ICQueryC012makeQueryForA8MatchingyACSo14ICTagSelectionCFZ_0(v3);

  return v4;
}

+ (id)objc_queryForSystemPaperNotesAllowsRecentlyDeleted:(BOOL)a3
{
  id v3 = _s11NotesShared7ICQueryC023makeQueryForSystemPaperA021allowsRecentlyDeletedACSb_tFZ_0(a3);
  return v3;
}

+ (id)objc_queryForMathNotesAllowsRecentlyDeleted:(BOOL)a3
{
  id v3 = _s11NotesShared7ICQueryC016makeQueryForMathA021allowsRecentlyDeletedACSb_tFZ_0(a3);
  return v3;
}

+ (id)objc_queryForCallNotesAllowsRecentlyDeleted:(BOOL)a3
{
  id v3 = _s11NotesShared7ICQueryC016makeQueryForCallA021allowsRecentlyDeletedACSb_tFZ_0(a3);
  return v3;
}

+ (id)objc_queryForRecentlyDeletedMathNotes
{
  id v2 = _s11NotesShared7ICQueryC031makeQueryForRecentlyDeletedMathA0ACyFZ_0();
  return v2;
}

+ (id)objc_queryForNonDeletedNotes
{
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 0;
  uint64_t v3 = v2 | 0x5000000000000000;
  id v4 = (objc_class *)type metadata accessor for ICQuery();
  id v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___ICQueryObjC_type] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  return v6;
}

+ (id)objc_queryForPinnedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  id v4 = _s11NotesShared7ICQueryC018makeQueryForPinnedA0_21allowsRecentlyDeletedACSb_SbtFZ_0(a3, a4);
  return v4;
}

+ (id)objc_queryForSharedNotes:(BOOL)a3 allowsRecentlyDeleted:(BOOL)a4
{
  id ForbA0_21allowsRecentlyDeletedACSb_SbtFZ_0 = _s11NotesShared7ICQueryC012makeQueryForbA0_21allowsRecentlyDeletedACSb_SbtFZ_0(a3, a4);
  return ForbA0_21allowsRecentlyDeletedACSb_SbtFZ_0;
}

- (id)replacingTagIdentifier:(id)a3 withNewTagIdentifier:(id)a4
{
  uint64_t v5 = sub_1C3DB9C38();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1C3DB9C38();
  uint64_t v10 = v9;
  v11 = self;
  id v12 = ICQuery.replacing(tagIdentifier:withNewTagIdentifier:)(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)removingTagIdentifier:(id)a3
{
  uint64_t v4 = sub_1C3DB9C38();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = ICQuery.removing(tagIdentifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

@end