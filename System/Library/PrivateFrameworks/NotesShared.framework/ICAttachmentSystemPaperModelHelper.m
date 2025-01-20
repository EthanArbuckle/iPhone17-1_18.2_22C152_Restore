@interface ICAttachmentSystemPaperModelHelper
+ (BOOL)canDisplayPaperAtURL:(id)a3;
+ (int64_t)minimumSupportedNotesVersionForPaperAtURL:(id)a3 greaterOrEqualToVersion:(int64_t)a4;
- (_TtC11NotesShared34ICAttachmentSystemPaperModelHelper)init;
@end

@implementation ICAttachmentSystemPaperModelHelper

+ (int64_t)minimumSupportedNotesVersionForPaperAtURL:(id)a3 greaterOrEqualToVersion:(int64_t)a4
{
  uint64_t v5 = sub_1C3DB88F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  int64_t v9 = _s11NotesShared34ICAttachmentSystemPaperModelHelperC016minimumSupporteda10VersionForE02at04baseJ0So07ICNotesJ0V10Foundation3URLV_AHtFZ_0((uint64_t)v8, a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (BOOL)canDisplayPaperAtURL:(id)a3
{
  uint64_t v3 = sub_1C3DB88F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FC300);
  char v7 = sub_1C3DB9868();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (_TtC11NotesShared34ICAttachmentSystemPaperModelHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICAttachmentSystemPaperModelHelper();
  return [(ICAttachmentSystemPaperModelHelper *)&v3 init];
}

@end