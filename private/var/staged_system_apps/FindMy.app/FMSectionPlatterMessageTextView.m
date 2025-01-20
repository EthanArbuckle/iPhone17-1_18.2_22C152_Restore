@interface FMSectionPlatterMessageTextView
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithCoder:(id)a3;
- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithFrame:(CGRect)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMSectionPlatterMessageTextView

- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100245D58();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002458C4((uint64_t)a3);
}

- (void)textViewDidBeginEditing:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_isEditing) = 1;
}

- (void)textViewDidEndEditing:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_isEditing) = 0;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(uint64_t (**)(id, uint64_t, uint64_t))(v6 + 8);
    id v9 = a3;
    v10 = self;
    char v11 = v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v8 = *(void (**)(id, uint64_t, uint64_t))(v6 + 16);
    id v9 = a3;
    v10 = self;
    v8(v9, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy31FMSectionPlatterMessageTextView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy31FMSectionPlatterMessageTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_messageTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_messageTextViewHeightConstraint));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy31FMSectionPlatterMessageTextView_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end