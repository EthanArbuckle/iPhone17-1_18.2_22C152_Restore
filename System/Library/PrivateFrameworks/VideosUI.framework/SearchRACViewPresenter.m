@interface SearchRACViewPresenter
+ (void)launchIOSSheet:(id)a3;
+ (void)launchRACSheetWithAdditionalParameters:(id)a3;
- (_TtC8VideosUI22SearchRACViewPresenter)init;
@end

@implementation SearchRACViewPresenter

+ (void)launchRACSheetWithAdditionalParameters:(id)a3
{
  sub_1E387C678();
  static SearchRACViewPresenter.launchRACSheet(additionalParameters:)();
  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI22SearchRACViewPresenter)init
{
  return (_TtC8VideosUI22SearchRACViewPresenter *)SearchRACViewPresenter.init()();
}

+ (void)launchIOSSheet:(id)a3
{
  uint64_t v3 = sub_1E387C678();
  sub_1E379020C(v3);
  swift_bridgeObjectRelease();
}

@end