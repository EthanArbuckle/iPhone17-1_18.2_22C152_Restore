@interface ICArchiveImportNoteFileParser
- (BOOL)canHandleFileURL:(id)a3;
- (NSArray)allowedContentTypes;
- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)init;
- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)initWithArchiveImporter:(id)a3;
- (void)cancelParsing;
- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7;
- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4;
@end

@implementation ICArchiveImportNoteFileParser

- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)init
{
  return (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *)sub_10005FB80();
}

- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)initWithArchiveImporter:(id)a3
{
  id v3 = a3;
  v4 = (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *)sub_100066740(v3);

  return v4;
}

- (NSArray)allowedContentTypes
{
  sub_1000B73B0();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1000B76D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (BOOL)canHandleFileURL:(id)a3
{
  uint64_t v4 = sub_1000B6F10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B6EE0();
  v8 = self;
  char v9 = sub_1000600D0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v6 = sub_1000B6F10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1000B6EE0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_1000602DC((uint64_t)v9, (uint64_t)sub_100065D2C, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  uint64_t v12 = sub_1000B6F10();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a4);
  v17 = _Block_copy(a5);
  v18 = _Block_copy(a6);
  v19 = _Block_copy(a7);
  sub_1000B6EE0();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v16;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v17;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v18;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v19;
  v24 = self;
  sub_10006118C((uint64_t)v15, (uint64_t)sub_100065CF4, v20, (uint64_t)sub_100065D2C, v21, (void (*)(uint64_t))sub_100065D40, v22, (void (*)(void))sub_100065D98, (void (*)(void))v23);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)cancelParsing
{
  NSArray v2 = self;
  sub_100062300();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_archiveImporter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_userDefaults));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end