@interface ImageCollectionViewCell
- (_TtC17PromotedContentUI23ImageCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI23ImageCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ImageCollectionViewCell

- (_TtC17PromotedContentUI23ImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17PromotedContentUI23ImageCollectionViewCell *)sub_1B5D73114(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17PromotedContentUI23ImageCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC17PromotedContentUI23ImageCollectionViewCell *)sub_1B5DBB2C8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView));
}

@end