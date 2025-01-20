@interface CRLCollaboratorAvatarRenderer
- (CGSize)size;
- (CNContact)contact;
- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)init;
- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)initWithContact:(id)a3 size:(CGSize)a4;
- (id)renderAvatarImageWithContentsScale:(double)a3;
- (id)renderPlaceholderAvatarImageWithContentsScale:(double)a3;
- (void)setContact:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation CRLCollaboratorAvatarRenderer

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact));
}

- (void)setContact:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact) = (Class)a3;
  id v3 = a3;
}

- (CGSize)size
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size);
  double v3 = *(double *)&self->contact[OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size) = a3;
}

- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)initWithContact:(id)a3 size:(CGSize)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_contact) = (Class)a3;
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform29CRLCollaboratorAvatarRenderer_size) = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCollaboratorAvatarRenderer();
  id v5 = a3;
  v6 = [(CRLCollaboratorAvatarRenderer *)&v8 init];

  return v6;
}

- (id)renderAvatarImageWithContentsScale:(double)a3
{
  id v4 = self;
  id v5 = sub_1009F6CCC(a3);

  return v5;
}

- (id)renderPlaceholderAvatarImageWithContentsScale:(double)a3
{
  id v4 = self;
  id v5 = sub_1009F6F80(a3);

  return v5;
}

- (_TtC8Freeform29CRLCollaboratorAvatarRenderer)init
{
  CGSize result = (_TtC8Freeform29CRLCollaboratorAvatarRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end