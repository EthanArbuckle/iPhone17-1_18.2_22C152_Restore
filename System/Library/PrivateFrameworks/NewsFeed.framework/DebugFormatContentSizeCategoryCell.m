@interface DebugFormatContentSizeCategoryCell
- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)onValueChangeWithSlider:(id)a3;
- (void)prepareForReuse;
@end

@implementation DebugFormatContentSizeCategoryCell

- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell *)sub_1C1167D80(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed34DebugFormatContentSizeCategoryCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C11687D0();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DebugFormatContentSizeCategoryCell *)&v5 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  sub_1BFC3E5C0(v4);
}

- (void)onValueChangeWithSlider:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1C1168598(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_slider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_label));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed34DebugFormatContentSizeCategoryCell_onChangeBlock);
  sub_1BFC3E5C0(v3);
}

@end