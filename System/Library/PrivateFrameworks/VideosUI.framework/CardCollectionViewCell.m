@interface CardCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI22CardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI22CardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
- (void)dealloc;
- (void)dragStateDidChange:(int64_t)a3;
- (void)imageViewHandler:(id)a3;
- (void)vui_cellDidEndDisplaying;
- (void)vui_cellDidSelect;
- (void)vui_cellWillBeDisplayed;
- (void)vui_prepareForReuse;
@end

@implementation CardCollectionViewCell

- (_TtC8VideosUI22CardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI22CardCollectionViewCell *)sub_1E3575168();
}

- (_TtC8VideosUI22CardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3575298();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3575360();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CardCollectionViewCell_cardView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)vui_prepareForReuse
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3575410();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v4 = self;
  sub_1E35754F8();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E35759FC();
}

- (void)vui_cellDidEndDisplaying
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3575C40();
}

- (void)vui_cellDidSelect
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3575DDC();
}

- (void)dragStateDidChange:(int64_t)a3
{
  v4 = self;
  sub_1E3575EFC(a3);
}

- (void)imageViewHandler:(id)a3
{
  id v4 = a3;
  double v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E357A3F0();
}

- (id)zoomSourceView
{
  v2 = self;
  id v3 = (void *)sub_1E357AD4C();

  return v3;
}

@end