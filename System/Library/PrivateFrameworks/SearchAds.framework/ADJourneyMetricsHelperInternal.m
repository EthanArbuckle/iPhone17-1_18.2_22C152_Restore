@interface ADJourneyMetricsHelperInternal
- (ADJourneyMetricsHelperInternal)init;
- (ADJourneyMetricsHelperInternal)initWithPromotedContentIdentifier:(id)a3;
- (void)adMarkerInteracted;
- (void)completed;
- (void)delivered;
- (void)discarded;
- (void)getAppWithButtonState:(int64_t)a3;
- (void)interacted;
- (void)offScreen;
- (void)onScreen;
- (void)placed;
- (void)receivedWithAdamId:(id)a3 impressionId:(id)a4 adMetadata:(id)a5;
- (void)visibleWithStarting:(id)a3 duration:(double)a4;
@end

@implementation ADJourneyMetricsHelperInternal

- (ADJourneyMetricsHelperInternal)initWithPromotedContentIdentifier:(id)a3
{
  uint64_t v3 = sub_236768190();
  return (ADJourneyMetricsHelperInternal *)ADJourneyMetricsHelper.init(promotedContentIdentifier:)(v3, v4);
}

- (void)placed
{
  v2 = self;
  sub_236768100();
}

- (void)onScreen
{
  v2 = self;
  sub_236768120();
}

- (void)offScreen
{
  v2 = self;
  sub_236768160();
}

- (void)visibleWithStarting:(id)a3 duration:(double)a4
{
  uint64_t v5 = sub_236768080();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236768070();
  v10 = self;
  sub_236768110();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)adMarkerInteracted
{
  v2 = self;
  sub_2367680E0();
}

- (void)getAppWithButtonState:(int64_t)a3
{
  uint64_t v3 = self;
  sub_2367680F0();
}

- (void)interacted
{
  v2 = self;
  sub_2367680D0();
}

- (void)delivered
{
  v2 = self;
  sub_236768150();
}

- (void)completed
{
  v2 = self;
  sub_236768140();
}

- (void)receivedWithAdamId:(id)a3 impressionId:(id)a4 adMetadata:(id)a5
{
  sub_236768190();
  if (a4)
  {
    sub_236768190();
    if (!a5) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_236768190();
LABEL_5:
  uint64_t v8 = self;
  sub_236768130();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)discarded
{
  v2 = self;
  sub_2367681B0();
  sub_236767BEC();
  id v3 = (id)sub_2367681C0();
  sub_236768180();
}

- (ADJourneyMetricsHelperInternal)init
{
  result = (ADJourneyMetricsHelperInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end