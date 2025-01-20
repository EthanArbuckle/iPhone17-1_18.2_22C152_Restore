@interface HeroCarouselScrollView
- (CGRect)frame;
- (_TtC8AppStore22HeroCarouselScrollView)initWithCoder:(id)a3;
- (_TtC8AppStore22HeroCarouselScrollView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation HeroCarouselScrollView

- (_TtC8AppStore22HeroCarouselScrollView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22HeroCarouselScrollView *)sub_1005EDAA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22HeroCarouselScrollView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005F1420();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeroCarouselScrollView();
  [(HeroCarouselScrollView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for HeroCarouselScrollView();
  v19.receiver = self;
  v19.super_class = v8;
  v9 = self;
  [(HeroCarouselScrollView *)&v19 frame];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[HeroCarouselScrollView setFrame:](&v18, "setFrame:", x, y, width, height);
  [(HeroCarouselScrollView *)v9 frame];
  v21.origin.double x = v11;
  v21.origin.double y = v13;
  v21.size.double width = v15;
  v21.size.double height = v17;
  if (!CGRectEqualToRect(v20, v21)) {
    *((unsigned char *)&v9->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore22HeroCarouselScrollView_needsPageViewLayout) = 1;
  }
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1005EE800();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005F1540();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005F1694();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    v7 = self;
    sub_1005F0920(1);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005F0920(1);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005F07EC(v4);
}

- (void).cxx_destruct
{
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore22HeroCarouselScrollView_pagingDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end