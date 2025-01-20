@interface TranslationBackdropVibrantBlurLayer
- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)init;
- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithCoder:(id)a3;
- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation TranslationBackdropVibrantBlurLayer

- (void)layoutSublayers
{
  v11 = self;
  [(TranslationBackdropVibrantBlurLayer *)v11 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = self;
  objc_msgSend(v10, sel_begin);
  objc_msgSend(v10, sel_setDisableActions_, 1);
  objc_msgSend(*(id *)((char *)&v11->super.super.isa+ OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer), sel_setFrame_, v3, v5, v7, v9);
  objc_msgSend(v10, sel_commit);
}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  id v5 = objc_allocWithZone(MEMORY[0x1E4F39B40]);
  double v6 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)objc_msgSend(v5, sel_init);

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(TranslationBackdropVibrantBlurLayer *)&v8 init];
}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1DB1F1990();
  swift_unknownObjectRelease();
  uint64_t v5 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39B40]);
  double v7 = self;
  *(Class *)((char *)&self->super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  uint64_t v8 = sub_1DB1F1DA0();
  v11.receiver = v7;
  v11.super_class = ObjectType;
  double v9 = [(TranslationBackdropVibrantBlurLayer *)&v11 initWithLayer:v8];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v9;
}

- (_TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer;
  id v7 = objc_allocWithZone(MEMORY[0x1E4F39B40]);
  id v8 = a3;
  double v9 = self;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = [(TranslationBackdropVibrantBlurLayer *)&v12 initWithCoder:v8];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13TranslationUIP33_CF4489C12E47B589A5779A16E606AB3135TranslationBackdropVibrantBlurLayer_backdropLayer));
}

@end