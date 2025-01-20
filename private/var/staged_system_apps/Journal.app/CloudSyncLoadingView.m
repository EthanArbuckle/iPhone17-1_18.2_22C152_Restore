@interface CloudSyncLoadingView
- (_TtC7Journal20CloudSyncLoadingView)initWithCoder:(id)a3;
- (_TtC7Journal20CloudSyncLoadingView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)syncEngineSyncEnd:(id)a3;
- (void)syncEngineSyncStart:(id)a3;
@end

@implementation CloudSyncLoadingView

- (_TtC7Journal20CloudSyncLoadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal20CloudSyncLoadingView_minimumSyncTimeBeforeShowing) = (Class)0x4000000000000000;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CloudSyncLoadingView_hasStoppedSyncing) = 0;
  uint64_t v8 = OBJC_IVAR____TtC7Journal20CloudSyncLoadingView_loadingIndicator;
  id v9 = objc_allocWithZone((Class)UIActivityIndicatorView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 initWithActivityIndicatorStyle:100];

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CloudSyncLoadingView();
  v11 = -[CloudSyncLoadingView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_1000ADE80();

  return v11;
}

- (_TtC7Journal20CloudSyncLoadingView)initWithCoder:(id)a3
{
  return (_TtC7Journal20CloudSyncLoadingView *)sub_1000ADD8C(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1000ADFF0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CloudSyncLoadingView_loadingIndicator));
}

- (void)syncEngineSyncStart:(id)a3
{
}

- (void)syncEngineSyncEnd:(id)a3
{
}

@end