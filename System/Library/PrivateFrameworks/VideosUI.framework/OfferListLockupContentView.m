@interface OfferListLockupContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView)initWithCoder:(id)a3;
- (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView)initWithFrame:(CGRect)a3;
@end

@implementation OfferListLockupContentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  char v6 = OUTLINED_FUNCTION_23_13();
  sub_1E3303D94(v6, v7, v8);

  double v9 = OUTLINED_FUNCTION_28_4();
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView *)sub_1E3305170();
}

- (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView)initWithCoder:(id)a3
{
  return (_TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView *)sub_1E330523C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_subBodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_decorationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView_mediaTagsView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUIP33_05025CE0F751E3317949A6D2044F0E5E26OfferListLockupContentView____lazy_storage___separatorView);
}

@end