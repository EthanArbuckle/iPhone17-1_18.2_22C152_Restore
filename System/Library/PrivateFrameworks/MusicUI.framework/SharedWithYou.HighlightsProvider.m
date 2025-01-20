@interface SharedWithYou.HighlightsProvider
- (_TtCO7MusicUI13SharedWithYou18HighlightsProvider)init;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
- (void)highlightCenterSettingsEnablementHasChanged:(id)a3;
@end

@implementation SharedWithYou.HighlightsProvider

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  sub_229CE5E7C();
  sub_22A170AB0();
  id v7 = a3;
  v6 = self;
  sub_229CE4908();
  swift_bridgeObjectRelease();
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_229CE4AC8();
}

- (void)highlightCenterSettingsEnablementHasChanged:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_229CE4B34();
}

- (_TtCO7MusicUI13SharedWithYou18HighlightsProvider)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCO7MusicUI13SharedWithYou18HighlightsProvider__onHighlightsChanged;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD911D8);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO7MusicUI13SharedWithYou18HighlightsProvider____lazy_storage___highlightCenter));
  swift_release();
  id v5 = (char *)self + OBJC_IVAR____TtCO7MusicUI13SharedWithYou18HighlightsProvider_bag;
  sub_22A170300();
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *))(v6 + 8))(v5);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end