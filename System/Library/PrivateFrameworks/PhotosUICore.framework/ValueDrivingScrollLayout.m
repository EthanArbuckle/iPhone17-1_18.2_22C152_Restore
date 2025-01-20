@interface ValueDrivingScrollLayout
- (_TtC12PhotosUICore24ValueDrivingScrollLayout)init;
- (_TtC12PhotosUICore24ValueDrivingScrollLayout)initWithContentLayout:(id)a3;
- (void)isScrollingDidChange;
- (void)scrollLayoutDidScroll:(id)a3;
- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
@end

@implementation ValueDrivingScrollLayout

- (void)scrollLayoutDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA36AF50();
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  id v8 = a3;
  v19 = self;
  [(PXGLayout *)v19 referenceSize];
  double v10 = v9;
  uint64_t v11 = sub_1A9BBE5A0();
  static ScrollBehavior.paging(axis:pagingOrigin:pageOffset:decelerationRate:allowFlickAcrossMultiplePages:)(2, v11, 0, (uint64_t)&v20, 0.0, v10);
  uint64_t v12 = v21;
  uint64_t v13 = v22;
  char v14 = v23;
  ScrollBehavior.adjustedScrollTargetContentOffset(for:velocity:currentContentOffset:decelerationRate:)();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  sub_1A9F936C4(v12, v13, v14);
  a5->x = v16;
  a5->y = v18;
}

- (void)isScrollingDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PXGScrollLayout *)&v3 isScrollingDidChange];
  sub_1AA36A5B4();
}

- (_TtC12PhotosUICore24ValueDrivingScrollLayout)initWithContentLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC12PhotosUICore24ValueDrivingScrollLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore24ValueDrivingScrollLayout)init
{
  result = (_TtC12PhotosUICore24ValueDrivingScrollLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore24ValueDrivingScrollLayout_scrollContentLayout);
}

@end