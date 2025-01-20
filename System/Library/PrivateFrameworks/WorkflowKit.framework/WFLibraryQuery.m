@interface WFLibraryQuery
+ (id)deletedFolders;
+ (id)sortedGroupings;
+ (id)sortedVisibleFolders;
+ (id)sortedWorkflowsWithQuery:(id)a3;
+ (id)sortedWorkflowsWithQuery:(id)a3 hasTombstonedConflicts:(BOOL)a4;
+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 associatedAppBundleIdentifier:(id)a5;
+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 limit:(int64_t)a5;
+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameContaining:(id)a5 limit:(int64_t)a6;
+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameEqualing:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (WFLibraryQuery)init;
- (id)copyWithZone:(void *)a3;
- (id)performReturningCollectionsIn:(id)a3 database:(id)a4 error:(id *)a5;
- (id)performReturningShortcutsIn:(id)a3 database:(id)a4 error:(id *)a5;
- (int64_t)hash;
- (int64_t)type;
@end

@implementation WFLibraryQuery

+ (id)sortedWorkflowsWithQuery:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v12 = static AnyLibraryQuery.sortedWorkflows(query:)(v4, v5, v6, v7, v8, v9, v10, v11);

  return v12;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 limit:(int64_t)a5
{
  BOOL v6 = a4;
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v14 = static AnyLibraryQuery.sortedWorkflows(query:sortByName:limit:)(v8, v6, a5, v9, v10, v11, v12, v13);

  return v14;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 associatedAppBundleIdentifier:(id)a5
{
  sub_1C8532658();
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = static AnyLibraryQuery.sortedWorkflows(query:sortByName:associatedAppBundleIdentifier:)(v6);

  swift_bridgeObjectRelease();
  return v7;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameContaining:(id)a5 limit:(int64_t)a6
{
  uint64_t v9 = sub_1C8532658();
  uint64_t v11 = v10;
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = static AnyLibraryQuery.sortedWorkflows(query:sortByName:nameContaining:limit:)(v12, a4, v9, v11, a6);

  swift_bridgeObjectRelease();
  return v13;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 sortByName:(BOOL)a4 nameEqualing:(id)a5
{
  sub_1C8532658();
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = static AnyLibraryQuery.sortedWorkflows(query:sortByName:nameEqualing:)(v6);

  swift_bridgeObjectRelease();
  return v7;
}

+ (id)sortedWorkflowsWithQuery:(id)a3 hasTombstonedConflicts:(BOOL)a4
{
  swift_getObjCClassMetadata();
  id v5 = a3;
  id v6 = static AnyLibraryQuery.sortedWorkflows(query:hasTombstonedConflicts:)(v5);

  return v6;
}

+ (id)sortedGroupings
{
  swift_getObjCClassMetadata();
  id v2 = static AnyLibraryQuery.sortedGroupings()();
  return v2;
}

+ (id)sortedVisibleFolders
{
  swift_getObjCClassMetadata();
  id v2 = static AnyLibraryQuery.sortedVisibleFolders()();
  return v2;
}

+ (id)deletedFolders
{
  swift_getObjCClassMetadata();
  id v2 = static AnyLibraryQuery.deletedFolders()();
  return v2;
}

- (int64_t)type
{
  return AnyLibraryQuery.type.getter();
}

- (id)performReturningCollectionsIn:(id)a3 database:(id)a4 error:(id *)a5
{
  return sub_1C824B004(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id))sub_1C824AE84, (unint64_t *)&qword_1EA5161F0);
}

- (id)performReturningShortcutsIn:(id)a3 database:(id)a4 error:(id *)a5
{
  return sub_1C824B004(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id))sub_1C824AF40, (unint64_t *)&unk_1EB6A2D40);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1C8533058();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  BOOL v6 = AnyLibraryQuery.isEqual(_:)((uint64_t)v8);

  sub_1C7F784B8((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = AnyLibraryQuery.hash.getter();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  AnyLibraryQuery.copy(with:)(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  int64_t v3 = (void *)sub_1C8533448();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (NSString)description
{
  id v2 = self;
  AnyLibraryQuery.description.getter();

  int64_t v3 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (WFLibraryQuery)init
{
}

- (void).cxx_destruct
{
  sub_1C824B718();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___WFLibraryQuery_identity);
  swift_bridgeObjectRelease();
}

@end