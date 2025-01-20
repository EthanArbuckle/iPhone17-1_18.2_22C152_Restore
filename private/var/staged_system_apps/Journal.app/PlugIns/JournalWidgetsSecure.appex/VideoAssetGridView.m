@interface VideoAssetGridView
- (_TtC20JournalWidgetsSecure18VideoAssetGridView)initWithCoder:(id)a3;
- (_TtC20JournalWidgetsSecure18VideoAssetGridView)initWithFrame:(CGRect)a3;
- (void)handleAllowedVideosNotification:(id)a3;
@end

@implementation VideoAssetGridView

- (void)handleAllowedVideosNotification:(id)a3
{
  uint64_t v4 = sub_100103498();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100103468();
  v8 = self;
  sub_100039CD4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC20JournalWidgetsSecure18VideoAssetGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC20JournalWidgetsSecure18VideoAssetGridView_durationLabel;
  id v9 = objc_allocWithZone((Class)UILabel);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)[v9 init];

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for VideoAssetGridView();
  return -[VideoAssetView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC20JournalWidgetsSecure18VideoAssetGridView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20JournalWidgetsSecure18VideoAssetGridView_durationLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for VideoAssetGridView();
  id v9 = [(VideoAssetView *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure18VideoAssetGridView_durationLabel));
}

@end