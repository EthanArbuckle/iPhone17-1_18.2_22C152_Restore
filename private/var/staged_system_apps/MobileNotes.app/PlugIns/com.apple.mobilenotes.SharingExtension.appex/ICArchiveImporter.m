@interface ICArchiveImporter
- (BOOL)importArchiveAtURL:(id)a3 intoNoteContainerWithID:(id)a4 progress:(id)a5 error:(id *)a6;
- (NSDictionary)errors;
- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)init;
- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)initWithContext:(id)a3;
- (void)dealloc;
- (void)setErrors:(id)a3;
@end

@implementation ICArchiveImporter

- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)init
{
  result = (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *)[self sharedContext];
  if (result
    && (v4 = result,
        id v5 = [(ICArchiveImporter *)result snapshotManagedObjectContext],
        v4,
        v5))
  {
    v6 = [(ICArchiveImporter *)self initWithContext:v5];

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)initWithContext:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = self;
  id v6 = a3;
  id v7 = [v5 defaultManager];
  __int16 IsAlexandriaDemoModeEnabled = ICInternalSettingsIsAlexandriaDemoModeEnabled();
  int v9 = ICInternalSettingsIsAlexandriaDemoModeEnabled();
  v10 = objc_allocWithZone(ObjectType);
  if (v9) {
    __int16 v11 = 256;
  }
  else {
    __int16 v11 = 0;
  }
  v12 = (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *)sub_10004496C(v6, v11 | IsAlexandriaDemoModeEnabled, 0, 0, v7, v10, 0.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self
     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_didReceiveMemoryWarningObserver;
  swift_beginAccess();
  sub_100032FC8((uint64_t)v4, (uint64_t)v9, &qword_1001036F8);
  id v5 = self;
  id v6 = self;
  id v7 = [v5 defaultCenter];
  sub_100044C74((uint64_t)v9, v7);

  sub_100038E30((uint64_t)v9, &qword_1001036F8);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(ICArchiveImporter *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_context));

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_100038E30((uint64_t)self+ OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_didReceiveMemoryWarningObserver, &qword_1001036F8);
}

- (NSDictionary)errors
{
  swift_beginAccess();
  sub_1000B6F10();
  swift_bridgeObjectRetain();
  sub_100032E20(&qword_100103AB0);
  sub_100046C38(&qword_100103AB8, (void (*)(uint64_t))&type metadata accessor for URL);
  v2.super.isa = sub_1000B7500().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setErrors:(id)a3
{
  sub_1000B6F10();
  sub_100032E20(&qword_100103AB0);
  sub_100046C38(&qword_100103AB8, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v4 = sub_1000B7510();
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_errors);
  swift_beginAccess();
  *id v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)importArchiveAtURL:(id)a3 intoNoteContainerWithID:(id)a4 progress:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_1000B6F10();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000B6EE0();
  v18 = self;
  id v19 = a4;
  v20 = v12;
  id v21 = a5;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1000B7990();
  (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v12, v9);

  return 1;
}

@end