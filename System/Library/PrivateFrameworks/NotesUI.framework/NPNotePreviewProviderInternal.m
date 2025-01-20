@interface NPNotePreviewProviderInternal
+ (NPNotePreviewProviderInternal)shared;
- (NPNotePreviewProviderInternal)init;
- (id)previewForUserActivity:(id)a3 error:(id *)a4;
@end

@implementation NPNotePreviewProviderInternal

+ (NPNotePreviewProviderInternal)shared
{
  if (qword_1E9B4A2F8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9B4C198;
  return (NPNotePreviewProviderInternal *)v2;
}

- (id)previewForUserActivity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  NotePreviewProvider.preview(for:)(v5, &v11);
  v7 = v12;
  v8 = v13;
  sub_1B0ACC624();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1B0B8232C();
  swift_bridgeObjectRelease();
  return v9;
}

- (NPNotePreviewProviderInternal)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___NPNotePreviewProviderInternal_cache;
  id v5 = self;
  v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultManager);
  type metadata accessor for PersistedThumbnailCache();
  v8 = (objc_class *)swift_allocObject();
  *((void *)v8 + 2) = v7;
  *(Class *)((char *)&self->super.isa + v4) = v8;

  v10.receiver = v6;
  v10.super_class = ObjectType;
  return [(NPNotePreviewProviderInternal *)&v10 init];
}

- (void).cxx_destruct
{
}

@end