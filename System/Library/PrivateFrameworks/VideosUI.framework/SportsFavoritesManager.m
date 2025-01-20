@interface SportsFavoritesManager
- (void)handleSportsFavoriteSyncNotification:(id)a3;
@end

@implementation SportsFavoritesManager

- (void)handleSportsFavoriteSyncNotification:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  swift_retain();
  sub_1E3418048();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v4);
}

@end