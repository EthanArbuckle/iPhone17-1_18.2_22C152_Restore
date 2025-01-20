@interface DebugFormatCreatePackageTableViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)onTextChange;
- (void)prepareForReuse;
@end

@implementation DebugFormatCreatePackageTableViewCell

- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C151E62C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *)sub_1C03757E0(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_onChange);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_textField;
  id v7 = objc_allocWithZone(MEMORY[0x1E4FB1D70]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = (char *)self + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_disallowedCharacterSet;
  uint64_t v10 = sub_1C15154CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC8NewsFeed37DebugFormatCreatePackageTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1C0375E80();
}

- (void)onTextChange
{
  v2 = self;
  sub_1C0376000();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = sub_1C151E62C();
  unint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1C037646C(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void).cxx_destruct
{
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_onChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_textField));
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed37DebugFormatCreatePackageTableViewCell_disallowedCharacterSet;
  sub_1C03766D8((uint64_t)v3);
}

@end