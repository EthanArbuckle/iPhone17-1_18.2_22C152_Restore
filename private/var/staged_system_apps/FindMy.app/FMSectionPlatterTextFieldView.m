@interface FMSectionPlatterTextFieldView
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithCoder:(id)a3;
- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithFrame:(CGRect)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeWithSender:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMSectionPlatterTextFieldView

- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100422200();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100422364();
}

- (void)textFieldDidBeginEditing:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_isEditing) = 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_isEditing) = 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = (char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v13 = *((void *)v12 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v19 = *(uint64_t (**)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8);
    id v15 = a3;
    v16 = self;
    char v17 = v19(v15, location, length, v9, v11, ObjectType, v13);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v17 = 0;
  }
  return v17 & 1;
}

- (void)textFieldDidChangeWithSender:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 16);
    id v9 = a3;
    uint64_t v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy29FMSectionPlatterTextFieldView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy29FMSectionPlatterTextFieldView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_textField));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy29FMSectionPlatterTextFieldView_delegate;

  sub_100068760((uint64_t)v3);
}

@end