@interface MultiGroupHorizontalCollectionController.MultiGroupContainerView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithCoder:(id)a3;
- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithFrame:(CGRect)a3;
@end

@implementation MultiGroupHorizontalCollectionController.MultiGroupContainerView

- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E36E69CC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  double v6 = OUTLINED_FUNCTION_11_2();
  sub_1E36E6A68(a4, v6);

  double v7 = OUTLINED_FUNCTION_28_4();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_decorationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI40MultiGroupHorizontalCollectionControllerP33_7CC52912EA9693611D051B05CABBAE5523MultiGroupContainerView_shelfLayout));
  swift_release();
}

@end