@interface SeriesListModeManager
- (_TtC5Books21SeriesListModeManager)init;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
@end

@implementation SeriesListModeManager

- (_TtC5Books21SeriesListModeManager)init
{
  return (_TtC5Books21SeriesListModeManager *)SeriesListModeManager.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100455EA4(v7);
}

@end