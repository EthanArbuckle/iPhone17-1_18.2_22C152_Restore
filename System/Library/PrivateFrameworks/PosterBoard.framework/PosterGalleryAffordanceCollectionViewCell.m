@interface PosterGalleryAffordanceCollectionViewCell
- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PosterGalleryAffordanceCollectionViewCell

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32EED90();
}

- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v8 = (char *)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_displayDate;
  uint64_t v9 = sub_1D3371ED8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_prominentDisplayController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_addButton) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PosterGalleryAffordanceCollectionViewCell();
  return -[PosterCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell *)sub_1D32EF09C(a3);
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_delegate);
  sub_1D32EF3F8((uint64_t)self + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_displayDate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_prominentDisplayController));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard41PosterGalleryAffordanceCollectionViewCell_addButton);
}

@end