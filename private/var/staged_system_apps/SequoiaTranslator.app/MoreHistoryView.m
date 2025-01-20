@interface MoreHistoryView
- (_TtC17SequoiaTranslator15MoreHistoryView)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator15MoreHistoryView)initWithFrame:(CGRect)a3;
@end

@implementation MoreHistoryView

- (_TtC17SequoiaTranslator15MoreHistoryView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator15MoreHistoryView *)sub_10016A5F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator15MoreHistoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_paddingDefault) = (Class)0x4028000000000000;
  uint64_t v4 = OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_moreHistoryLabel;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_10016A370();
  uint64_t v6 = OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_disclosureIndictor;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)sub_10016A4F4();

  result = (_TtC17SequoiaTranslator15MoreHistoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_moreHistoryLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator15MoreHistoryView_disclosureIndictor);
}

@end