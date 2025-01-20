@interface FindInteractionTextView
- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)copy:(id)a3;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
@end

@implementation FindInteractionTextView

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *)sub_385890();
  __break(1u);
  return result;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_FCCB8(v6, (uint64_t)v7);
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_navBarButtonUpdater), *(void *)&self->navBarButtonUpdater[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_navBarButtonUpdater+ 8]);
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_F2F78(0);
  [(FindInteractionTextView *)v10 becomeFirstResponder];
  v11.receiver = v10;
  v11.super_class = ObjectType;
  [(FindInteractionTextView *)&v11 findInteraction:v8 didEndFindSession:v9];
}

- (void)copy:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_385640();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_FCF24((uint64_t)v6);

  sub_E544((uint64_t)v6, &qword_472710);
}

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end