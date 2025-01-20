@interface NotesSiriSingleNoteHelper
- (_TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper)init;
- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4;
- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4;
@end

@implementation NotesSiriSingleNoteHelper

- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A05D428);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_257D94E30();
    a4 = v10;
  }
  id v11 = a3;
  v12 = self;
  sub_257D7D230((uint64_t)a4, (uint64_t)v9);

  swift_bridgeObjectRelease();
  uint64_t v13 = sub_257D94610();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) != 1)
  {
    v15 = (void *)sub_257D945E0();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  return v15;
}

- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4
{
  if (a4)
  {
    sub_257D94E30();
    id v6 = a3;
    uint64_t v7 = self;
    uint64_t v8 = (void *)sub_257D94E20();
    id v9 = sub_257D7D7EC((uint64_t)v8);

    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (_TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper)init
{
  uint64_t v3 = OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations;
  sub_257D7DFCC(0, &qword_26A05D458);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)MEMORY[0x25A2C2590](MEMORY[0x263F8EE78]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NotesSiriSingleNoteHelper();
  return [(NotesSiriSingleNoteHelper *)&v6 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations));
}

@end