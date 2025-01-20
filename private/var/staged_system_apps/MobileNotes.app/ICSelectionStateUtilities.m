@interface ICSelectionStateUtilities
+ (id)selectedNoteObjectIDFromArchive:(id)a3 modernManagedObjectContext:(id)a4 legacyManagedObjectContext:(id)a5;
+ (void)updateArchive:(id)a3 forNewViewMode:(int64_t)a4 requiresContainerSelection:(BOOL)a5 requiresObjectSelection:(BOOL)a6 validateContainerSelection:(BOOL)a7 defaultObjectID:(id)a8 modernManagedObjectContext:(id)a9 legacyManagedObjectContext:(id)a10;
- (_TtC11MobileNotes25ICSelectionStateUtilities)init;
@end

@implementation ICSelectionStateUtilities

+ (id)selectedNoteObjectIDFromArchive:(id)a3 modernManagedObjectContext:(id)a4 legacyManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)sub_1001D9534(a3, a4, a5);

  return v11;
}

+ (void)updateArchive:(id)a3 forNewViewMode:(int64_t)a4 requiresContainerSelection:(BOOL)a5 requiresObjectSelection:(BOOL)a6 validateContainerSelection:(BOOL)a7 defaultObjectID:(id)a8 modernManagedObjectContext:(id)a9 legacyManagedObjectContext:(id)a10
{
  BOOL v18 = a6;
  swift_getObjCClassMetadata();
  id v14 = a3;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  sub_1001D439C(a3, (uint64_t (*)())a4, a5, v18, a7, a8, a9, a10);
}

- (_TtC11MobileNotes25ICSelectionStateUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICSelectionStateUtilities *)&v3 init];
}

@end