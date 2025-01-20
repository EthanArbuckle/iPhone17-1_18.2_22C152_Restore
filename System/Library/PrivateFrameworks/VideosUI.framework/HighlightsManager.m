@interface HighlightsManager
- (_TtC8VideosUI17HighlightsManager)init;
- (void)dealloc;
- (void)handleAccountStoreDidChange:(id)a3;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
- (void)highlightCenterSettingsEnablementHasChanged:(id)a3;
@end

@implementation HighlightsManager

- (_TtC8VideosUI17HighlightsManager)init
{
  return (_TtC8VideosUI17HighlightsManager *)sub_1E2CFB8B8();
}

- (void)dealloc
{
  v2 = self;
  sub_1E36238CC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1E36239E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate), *(void *)&self->highlightCenter[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate], *(void *)&self->$__lazy_storage_$_syndicationIdToHighlightMap[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate], *(void *)&self->pendingHighlightsUpdate[OBJC_IVAR____TtC8VideosUI17HighlightsManager_pendingHighlightsUpdate]);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8VideosUI17HighlightsManager_cachedDSID);
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3625304();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  sub_1E2BE915C(0, (unint64_t *)&unk_1EBF97F80);
  uint64_t v6 = sub_1E387CC98();
  id v7 = a3;
  v8 = self;
  sub_1E36253FC((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E362552C();
}

- (void)handleAccountStoreDidChange:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_31();
  uint64_t v10 = v9 - v8;
  sub_1E3875BE8();
  v11 = self;
  sub_1E3625824();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
}

@end