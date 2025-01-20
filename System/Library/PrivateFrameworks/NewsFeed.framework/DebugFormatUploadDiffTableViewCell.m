@interface DebugFormatUploadDiffTableViewCell
- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DebugFormatUploadDiffTableViewCell

- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell *)sub_1C0C4ED68(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed34DebugFormatUploadDiffTableViewCell_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed34DebugFormatUploadDiffTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatUploadDiffTableViewCell_label));
}

@end