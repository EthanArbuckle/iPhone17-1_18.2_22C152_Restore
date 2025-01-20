@interface JSHighlightsManager
- (_TtC8VideosUI19JSHighlightsManager)init;
- (_TtC8VideosUI19JSHighlightsManager)initWithAppContext:(id)a3;
- (void)dealloc;
- (void)handleHighlightsUpdatedNotification:(id)a3;
- (void)handleRestrictionsDidChange:(id)a3;
- (void)syndicationInfoUpdated:(id)a3;
@end

@implementation JSHighlightsManager

- (_TtC8VideosUI19JSHighlightsManager)initWithAppContext:(id)a3
{
  id v4 = a3;
  return (_TtC8VideosUI19JSHighlightsManager *)sub_1E2CF8518(a3);
}

- (void)syndicationInfoUpdated:(id)a3
{
  uint64_t v4 = sub_1E387C678();
  v5 = self;
  sub_1E34D1DF8(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1E34D25EC();
}

- (_TtC8VideosUI19JSHighlightsManager)init
{
}

- (void)handleHighlightsUpdatedNotification:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_35_3();
  v5 = self;
  sub_1E34D2748();

  uint64_t v6 = OUTLINED_FUNCTION_22_10();
  v7(v6);
}

- (void)handleRestrictionsDidChange:(id)a3
{
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_35_3();
  v5 = self;
  sub_1E34D29CC();

  uint64_t v6 = OUTLINED_FUNCTION_22_10();
  v7(v6);
}

@end