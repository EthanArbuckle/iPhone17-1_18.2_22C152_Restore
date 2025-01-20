@interface AnnotationImagesView
- (BOOL)hasContent;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore20AnnotationImagesView)initWithCoder:(id)a3;
- (_TtC8AppStore20AnnotationImagesView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AnnotationImagesView

- (_TtC8AppStore20AnnotationImagesView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_100082C28(&qword_10099DDD8);
  __chkstk_darwin(v9);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews) = (Class)_swiftEmptyArrayStorage;
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v10 = self;
  ViewRecycler.init()();
  sub_10056C79C();
  ReusePool.init(recycler:limit:)();

  v13.receiver = v10;
  v13.super_class = ObjectType;
  v11 = -[AnnotationImagesView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  -[AnnotationImagesView setLayoutMargins:](v11, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v11;
}

- (_TtC8AppStore20AnnotationImagesView)initWithCoder:(id)a3
{
  return (_TtC8AppStore20AnnotationImagesView *)sub_10056BCA0(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_beginAccess();
  swift_unknownObjectRetain();
  v5 = self;
  unint64_t v6 = swift_bridgeObjectRetain();
  sub_100308ED4(v6);
  swift_bridgeObjectRelease();
  if (qword_10097FEA8 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for AnnotationImagesLayout.Metrics();
  sub_100087728(v7, (uint64_t)qword_1009E6320);
  static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (BOOL)hasContent
{
  swift_beginAccess();
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v3 = self;
  swift_bridgeObjectRetain();
  char v4 = Array.isNotEmpty.getter();

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10056C274();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViewReusePool;
  uint64_t v4 = sub_100082C28(&qword_10099DE10);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end