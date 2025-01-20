@interface GEOAPUploadLatencyBarView
- (_TtC4Maps25GEOAPUploadLatencyBarView)init;
- (_TtC4Maps25GEOAPUploadLatencyBarView)initWithCoder:(id)a3;
- (_TtC4Maps25GEOAPUploadLatencyBarView)initWithFrame:(CGRect)a3;
@end

@implementation GEOAPUploadLatencyBarView

- (_TtC4Maps25GEOAPUploadLatencyBarView)init
{
  return (_TtC4Maps25GEOAPUploadLatencyBarView *)sub_100335140();
}

- (_TtC4Maps25GEOAPUploadLatencyBarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_latency;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_latency) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_indicatorRects) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.super.super.isa + v7) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for GEOAPUploadLatencyBarView();
  v8 = -[GEOAPUploadLatencyBarView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  [(GEOAPUploadLatencyBarView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v8;
}

- (_TtC4Maps25GEOAPUploadLatencyBarView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_latency;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_latency) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps25GEOAPUploadLatencyBarView_indicatorRects) = (Class)_swiftEmptyArrayStorage;
  *(_DWORD *)((char *)&self->super.super.super.isa + v4) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GEOAPUploadLatencyBarView();
  return [(GEOAPUploadLatencyBarView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end