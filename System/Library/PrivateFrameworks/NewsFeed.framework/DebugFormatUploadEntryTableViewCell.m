@interface DebugFormatUploadEntryTableViewCell
- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation DebugFormatUploadEntryTableViewCell

- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1C151E62C();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell *)sub_1C09352EC(v4, v5);
}

- (_TtC8NewsFeed35DebugFormatUploadEntryTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0935678();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DebugFormatUploadEntryTableViewCell *)&v4 prepareForReuse];
  id v3 = (void *)sub_1C151C84C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadEntryTableViewCell_onDiffTap));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed35DebugFormatUploadEntryTableViewCell_diffButton);
}

@end