@interface ICNotesSharedIndexedViewHelper
+ (id)makeNoteSearchResultViewWithNote:(id)a3 attachmentURL:(id)a4;
- (ICNotesSharedIndexedViewHelper)init;
@end

@implementation ICNotesSharedIndexedViewHelper

+ (id)makeNoteSearchResultViewWithNote:(id)a3 attachmentURL:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B2E0678);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_257DAF988();
    uint64_t v8 = sub_257DAF998();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_257DAF998();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (void *)swift_unknownObjectRetain();
  id v11 = _sSo30ICNotesSharedIndexedViewHelperC15NotesUIServicesE020makeNoteSearchResultD04with13attachmentURLSo28CSSearchableItemAttributeSetCSgSo017ICSearchIndexableI0_p_10Foundation0N0VSgtFZ_0(v10, (uint64_t)v7);
  swift_unknownObjectRelease();
  sub_257D9FE10((uint64_t)v7, qword_26B2E0678);

  return v11;
}

- (ICNotesSharedIndexedViewHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICNotesSharedIndexedViewHelper;
  return [(ICNotesSharedIndexedViewHelper *)&v3 init];
}

@end