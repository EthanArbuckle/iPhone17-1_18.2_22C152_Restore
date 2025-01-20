@interface ICSystemPaperDocumentHelper
+ (id)drawingForPaperAttachment:(id)a3;
- (ICAttachment)attachment;
- (ICSystemPaperDocumentHelper)init;
- (ICSystemPaperDocumentHelper)initWithPaperAttachment:(id)a3 textView:(id)a4;
- (UITextView)textView;
- (void)addWithItemProviders:(id)a3 itemsAnchor:(int64_t)a4;
- (void)setTextView:(id)a3;
@end

@implementation ICSystemPaperDocumentHelper

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___ICSystemPaperDocumentHelper_attachment));
}

- (UITextView)textView
{
  v2 = (void *)MEMORY[0x210546B30]((char *)self + OBJC_IVAR___ICSystemPaperDocumentHelper_textView, a2);

  return (UITextView *)v2;
}

- (void)setTextView:(id)a3
{
}

+ (id)drawingForPaperAttachment:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676BFAE8);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  static ICSystemPaperDocumentHelper.drawing(for:)(v7, (uint64_t)v6);

  uint64_t v8 = sub_20C1629A0();
  uint64_t v9 = *(void *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_20C162980();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return v10;
}

- (ICSystemPaperDocumentHelper)initWithPaperAttachment:(id)a3 textView:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperDocumentHelper_attachment) = (Class)a3;
  swift_unknownObjectWeakAssign();
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(ICSystemPaperDocumentHelper *)&v9 init];
}

- (void)addWithItemProviders:(id)a3 itemsAnchor:(int64_t)a4
{
  sub_20BFCEE58(0, (unint64_t *)&unk_2676BBC50);
  uint64_t v6 = sub_20C162CF0();
  id v7 = self;
  ICSystemPaperDocumentHelper.add(itemProviders:itemsAnchor:)((Swift::OpaquePointer)v6, (UIViewContentMode)a4);

  swift_bridgeObjectRelease();
}

- (ICSystemPaperDocumentHelper)init
{
  result = (ICSystemPaperDocumentHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end