@interface ICPaperAttachmentCreationHelper
+ (BOOL)createPaperDocumentForAttachment:(id)a3 fromLegacyMediaAtURL:(id)a4 error:(id *)a5;
+ (id)createSystemPaperAttachmentWithPKDrawing:(id)a3 inNote:(id)a4;
+ (void)copyNewPaperBundleToAttachment:(ICAttachment *)a3 fromURL:(NSURL *)a4 completionHandler:(id)a5;
+ (void)createPaperDocumentForAttachment:(ICAttachment *)a3 fromLegacyMediaAtURL:(NSURL *)a4 completionHandler:(id)a5;
- (ICPaperAttachmentCreationHelper)init;
@end

@implementation ICPaperAttachmentCreationHelper

+ (void)copyNewPaperBundleToAttachment:(ICAttachment *)a3 fromURL:(NSURL *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FBAE0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_1C3DBA278();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA388228;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA388230;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1C3D53940((uint64_t)v11, (uint64_t)&unk_1EA388238, (uint64_t)v16);
  swift_release();
}

+ (void)createPaperDocumentForAttachment:(ICAttachment *)a3 fromLegacyMediaAtURL:(NSURL *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FBAE0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_1C3DBA278();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA388208;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA388210;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1C3D53940((uint64_t)v11, (uint64_t)&unk_1EA388218, (uint64_t)v16);
  swift_release();
}

+ (BOOL)createPaperDocumentForAttachment:(id)a3 fromLegacyMediaAtURL:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1C3DB88F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  swift_getObjCClassMetadata();
  id v10 = a3;
  static ICPaperAttachmentCreationHelper.createPaperDocument(for:fromLegacyMediaAt:)(v10, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return 1;
}

+ (id)createSystemPaperAttachmentWithPKDrawing:(id)a3 inNote:(id)a4
{
  uint64_t v6 = sub_1C3DB9A78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a4;
  sub_1C3DB9A68();

  swift_getObjCClassMetadata();
  id v12 = static ICPaperAttachmentCreationHelper.createSystemPaperAttachment(with:in:)(v9, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (ICPaperAttachmentCreationHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICPaperAttachmentCreationHelper;
  return [(ICPaperAttachmentCreationHelper *)&v3 init];
}

@end