@interface CRLiOSFolderGridViewController.Item.ViewController.FavoriteButton
- (CGSize)intrinsicContentSize;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)init;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithCoder:(id)a3;
- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithFrame:(CGRect)a3;
- (int64_t)buttonType;
@end

@implementation CRLiOSFolderGridViewController.Item.ViewController.FavoriteButton

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)init
{
  return (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton *)sub_100D23548();
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100D27F7C();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)buttonType
{
  return 0;
}

- (_TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_favoriteIconFillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_favoriteIconOuterGlowImageView));
  double v3 = (char *)self
     + OBJC_IVAR____TtCCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController14FavoriteButton_accessibilityDelegate;

  sub_100523398((uint64_t)v3);
}

@end