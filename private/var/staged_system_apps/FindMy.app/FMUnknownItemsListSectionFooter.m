@interface FMUnknownItemsListSectionFooter
- (_TtC6FindMy31FMUnknownItemsListSectionFooter)init;
- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithCoder:(id)a3;
- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithFrame:(CGRect)a3;
@end

@implementation FMUnknownItemsListSectionFooter

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)init
{
  return (_TtC6FindMy31FMUnknownItemsListSectionFooter *)sub_1004224D4();
}

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_label;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_style;
  if (qword_1006AE300 != -1) {
    swift_once();
  }
  v9 = (char *)self + v8;
  v10 = (void *)qword_1006D2588;
  long long v11 = unk_1006D2590;
  long long v12 = unk_1006D25A0;
  *(void *)v9 = qword_1006D2588;
  *(_OWORD *)(v9 + 8) = v11;
  *(_OWORD *)(v9 + 24) = v12;
  id v13 = v10;

  result = (_TtC6FindMy31FMUnknownItemsListSectionFooter *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy31FMUnknownItemsListSectionFooter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_label));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_style);
}

@end