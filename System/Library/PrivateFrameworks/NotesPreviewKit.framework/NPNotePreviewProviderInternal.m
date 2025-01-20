@interface NPNotePreviewProviderInternal
+ (NPNotePreviewProviderInternal)shared;
- (NPNotePreviewProviderInternal)init;
- (id)previewForUserActivity:(id)a3 error:(id *)a4;
@end

@implementation NPNotePreviewProviderInternal

+ (NPNotePreviewProviderInternal)shared
{
  if (qword_26AD558D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD558D0;

  return (NPNotePreviewProviderInternal *)v2;
}

- (id)previewForUserActivity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  NotePreviewProvider.preview(for:)(v5, v11);
  v7 = (void *)v11[4];
  v8 = (void *)v11[5];
  sub_224D80940();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for __NPNotePreviewKey(0);
  sub_224D7FCA0(&qword_26809FBE8, type metadata accessor for __NPNotePreviewKey);
  v9 = (void *)sub_224D81388();
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