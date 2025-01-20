@interface PadRootSideBarProfileView
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC8VideosUI25PadRootSideBarProfileView)init;
- (_TtC8VideosUI25PadRootSideBarProfileView)initWithCoder:(id)a3;
- (_TtC8VideosUI25PadRootSideBarProfileView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PadRootSideBarProfileView

- (_TtC8VideosUI25PadRootSideBarProfileView)init
{
  return (_TtC8VideosUI25PadRootSideBarProfileView *)sub_1E31BEB74();
}

- (_TtC8VideosUI25PadRootSideBarProfileView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E31BEE74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E31BEF1C();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E31BEFCC(width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (_TtC8VideosUI25PadRootSideBarProfileView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25PadRootSideBarProfileView_profileView));
}

@end