@interface MapAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal12MapAssetView)initWithCoder:(id)a3;
- (_TtC7Journal12MapAssetView)initWithFrame:(CGRect)a3;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4;
- (void)mapViewDidFinishLoadingMap:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)userInterfaceStyleChanged;
@end

@implementation MapAssetView

- (void)dealloc
{
  v2 = self;
  sub_1001138C0();
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal12MapAssetView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal12MapAssetView_mapThumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal12MapAssetView_platterBlurView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal12MapAssetView_placeholderView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal12MapAssetView_latestImageRequestID, &qword_100800950);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal12MapAssetView_fullScreenSnapshotView);
}

- (_TtC7Journal12MapAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal12MapAssetView *)sub_100113AB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal12MapAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal12MapAssetView *)sub_100113D5C(a3);
}

- (void)userInterfaceStyleChanged
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal12MapAssetView_mapThumbnailView);
  v3 = self;
  [v2 setImage:0];
  *((unsigned char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC7Journal12MapAssetView_needsMapLoad) = 1;
  [(MapAssetView *)v3 setNeedsLayout];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100118B90();
}

- (CGRect)frame
{
  sub_100118DD0(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MapAssetView();
  id v7 = v8.receiver;
  -[MapAssetView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_100118CE0();
}

- (CGRect)bounds
{
  sub_100118DD0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = self;
  sub_100118F7C(x, y, width, height);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  objc_super v8 = (void *)sub_100119670(v6, a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    sub_10034841C(v8);

    swift_unknownObjectRelease();
  }
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v7 = a3;
    id v8 = a4;
    v9 = self;
    sub_100348D68(v7);

    swift_unknownObjectRelease();
  }
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10011A604();
}

- (void)mapViewDidFailLoadingMap:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_10011AA04();
}

@end