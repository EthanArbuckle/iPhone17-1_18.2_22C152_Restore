@interface RootSideBarController.RootSideBarCollectionView
- (CGSize)contentSize;
- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithCoder:(id)a3;
- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation RootSideBarController.RootSideBarCollectionView

- (CGSize)contentSize
{
  v2 = self;
  sub_1E325FBA8();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_1E325FC40(width, height);
}

- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  OUTLINED_FUNCTION_3();
  return (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *)sub_1E325FD84();
}

- (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView *)sub_1E325FE50(a3);
}

- (void).cxx_destruct
{
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCC8VideosUI21RootSideBarController25RootSideBarCollectionView_contentSizeDidChangeHandler));
}

@end