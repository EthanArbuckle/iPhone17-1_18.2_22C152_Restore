@interface JourneyMetricsHelper
- (APMetricPrimitiveCreating)primitiveCreator;
- (APPCPromotableContent)promotedContent;
- (BOOL)didImpress;
- (BOOL)didUnload;
- (BOOL)hasBeenOnScreen;
- (BOOL)isCurrentlyOnScreen;
- (NSString)journeyIdentifier;
- (NSString)promotedContentIdentifier;
- (_TtC15PromotedContent20JourneyMetricsHelper)init;
- (_TtC15PromotedContent31JourneyMetricsHelperDiagnostics)diagnostics;
- (double)impressionThresholdDuration;
- (id)debugging;
- (id)registerForPCUsedEventWithAction:(id)a3;
- (void)adMarkerInteracted;
- (void)addUnfilledReason:(int64_t)a3;
- (void)contentLoadFailure;
- (void)createdWithAdType:(int64_t)a3;
- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4;
- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4 format:(int64_t)a5;
- (void)dealloc;
- (void)delivered;
- (void)discardedWithCode:(int64_t)a3;
- (void)exceededContainer;
- (void)getAppWithButtonState:(int64_t)a3 timeToPreviousInstall:(int64_t)a4;
- (void)interacted;
- (void)interactedAtXPos:(float)a3 yPos:(float)a4;
- (void)interactedWithElementID:(unsigned __int8)a3 atXPos:(float)a4 yPos:(float)a5;
- (void)interactedWithType:(int64_t)a3;
- (void)interstitialOnScreenWithCollapsed:(BOOL)a3;
- (void)loaded;
- (void)notConsumedWithCode:(int64_t)a3 placeholder:(BOOL)a4;
- (void)notifyListenersPCUsed;
- (void)offScreenWithCollapsed:(BOOL)a3;
- (void)onScreenWithCollapsed:(BOOL)a3;
- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4;
- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 position:(int64_t)a5;
- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 unfilledReason:(int64_t)a5;
- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 wasNativeSlot:(BOOL)a5;
- (void)ready;
- (void)registerHandlerForAllMetricsWithClosure:(id)a3;
- (void)removeHandler;
- (void)replacedWithHelper:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setDidImpress:(BOOL)a3;
- (void)setDidUnload:(BOOL)a3;
- (void)setHasBeenOnScreen:(BOOL)a3;
- (void)setImpressionThresholdDuration:(double)a3;
- (void)setIsCurrentlyOnScreen:(BOOL)a3;
- (void)setJourneyIdentifier:(id)a3;
- (void)setPrimitiveCreator:(id)a3;
- (void)setPromotedContent:(id)a3;
- (void)setPromotedContentIdentifier:(id)a3;
- (void)unloadedWithReason:(int64_t)a3;
- (void)unregisterForPCUsedEventWithListenerID:(id)a3;
- (void)updateElementsShownWithShown:(id)a3 partiallyShown:(id)a4;
- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3;
- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3 ignoreVisibilityState:(BOOL)a4;
- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 collapsed:(BOOL)a6;
- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 scrollVelocity:(float)a6 collapsed:(BOOL)a7;
- (void)webAdRemoved;
@end

@implementation JourneyMetricsHelper

- (void)setImpressionThresholdDuration:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_impressionThresholdDuration);
  swift_beginAccess();
  double *v4 = a3;
}

- (void)setPromotedContent:(id)a3
{
}

- (id)registerForPCUsedEventWithAction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  JourneyMetricsHelper.registerForPCUsedEvent(action:)((uint64_t)sub_1B5C70D7C, v5);

  swift_release();
  v7 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)notifyListenersPCUsed
{
  v2 = self;
  JourneyMetricsHelper.notifyListenersPCUsed()();
}

- (void)unregisterForPCUsedEventWithListenerID:(id)a3
{
  uint64_t v4 = sub_1B5CB33C0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  JourneyMetricsHelper.unregisterForPCUsedEvent(listenerID:)(v8);

  swift_bridgeObjectRelease();
}

- (APPCPromotableContent)promotedContent
{
  v2 = (char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_promotedContent;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1BA9A9CB0](v2);
  return (APPCPromotableContent *)v3;
}

- (NSString)promotedContentIdentifier
{
  return (NSString *)sub_1B5C8F4B0();
}

- (void)setPromotedContentIdentifier:(id)a3
{
}

- (NSString)journeyIdentifier
{
  return (NSString *)sub_1B5C8F4B0();
}

- (void)setJourneyIdentifier:(id)a3
{
}

- (APMetricPrimitiveCreating)primitiveCreator
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (APMetricPrimitiveCreating *)v2;
}

- (void)setPrimitiveCreator:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_primitiveCreator);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)hasBeenOnScreen
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_hasBeenOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setHasBeenOnScreen:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_hasBeenOnScreen;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isCurrentlyOnScreen
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_isCurrentlyOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurrentlyOnScreen:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_isCurrentlyOnScreen;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)didUnload
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didUnload;
  swift_beginAccess();
  return *v2;
}

- (void)setDidUnload:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didUnload;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)didImpress
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didImpress;
  swift_beginAccess();
  return *v2;
}

- (void)setDidImpress:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_didImpress;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (_TtC15PromotedContent31JourneyMetricsHelperDiagnostics)diagnostics
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_diagnostics);
  swift_beginAccess();
  return (_TtC15PromotedContent31JourneyMetricsHelperDiagnostics *)*v2;
}

- (void)setDiagnostics:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_diagnostics);
  swift_beginAccess();
  uint64_t v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (double)impressionThresholdDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_impressionThresholdDuration);
  swift_beginAccess();
  return *v2;
}

- (void)dealloc
{
  v2 = self;
  sub_1B5C9BC04();
  sub_1B5C9D714(9102);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for JourneyMetricsHelper();
  [(JourneyMetricsHelper *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_1B5C16D70((uint64_t)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_promotedContent);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_newsSupplementalContext));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1B5C9C598((uint64_t)sub_1B5C20DEC, v5);

  swift_release();
}

- (void)removeHandler
{
  v2 = self;
  sub_1B5C9C78C();
}

- (void)delivered
{
  v2 = self;
  sub_1B5C9C8E0();
}

- (void)discardedWithCode:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C9C9E4(a3);
}

- (void)notConsumedWithCode:(int64_t)a3 placeholder:(BOOL)a4
{
  uint64_t v5 = self;
  sub_1B5CA47A8(a3);
}

- (void)createdWithAdType:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C9CBC8(a3);
}

- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4
{
  id v6 = self;
  sub_1B5C9CD18(a3, a4);
}

- (void)createdWithAdType:(int64_t)a3 container:(int64_t)a4 format:(int64_t)a5
{
  v7 = self;
  sub_1B5C9CD18(a3, a4);
}

- (void)replacedWithHelper:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1B5C9CED4(a3);
  swift_unknownObjectRelease();
}

- (void)loaded
{
  v2 = self;
  sub_1B5C9D588();
}

- (void)webAdRemoved
{
  v2 = (char *)self + OBJC_IVAR____TtC15PromotedContent20JourneyMetricsHelper_unloadReason;
  *(void *)v2 = 9101;
  v2[8] = 0;
}

- (void)unloadedWithReason:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C9D714(a3);
}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 wasNativeSlot:(BOOL)a5
{
  v7 = self;
  sub_1B5CA4B0C(a3, a4, 0, 1, 200, 0);
}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4
{
  id v6 = self;
  sub_1B5CA4B0C(a3, a4, 0, 0, 200, 0);
}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 unfilledReason:(int64_t)a5
{
  Swift::String v8 = self;
  sub_1B5CA4B0C(a3, a4, 0, 0, a5, 0);
}

- (void)placedWithPlacementType:(int64_t)a3 placement:(int64_t)a4 position:(int64_t)a5
{
  Swift::String v8 = self;
  sub_1B5CA4B0C(a3, a4, a5, 0, 200, 0);
}

- (void)ready
{
  v2 = self;
  sub_1B5C9DB5C();
}

- (void)onScreenWithCollapsed:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5C9DCC8(a3);
}

- (void)interstitialOnScreenWithCollapsed:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5C9DFB0(a3);
}

- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 collapsed:(BOOL)a6
{
  uint64_t v10 = sub_1B5CB3090();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v13 = &v15[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B5CB3060();
  v14 = self;
  v15[12] = 1;
  sub_1B5C9E684(a3, a5, (uint64_t)v13, 0x100000000, a6);

  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)visibleWithPercent:(int64_t)a3 starting:(id)a4 duration:(double)a5 scrollVelocity:(float)a6 collapsed:(BOOL)a7
{
  uint64_t v12 = sub_1B5CB3090();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  v15 = &v17[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1B5CB3060();
  v16 = self;
  v17[12] = 0;
  sub_1B5C9E684(a3, a5, (uint64_t)v15, LODWORD(a6), a7);

  (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)offScreenWithCollapsed:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5C9F270(a3);
}

- (void)interacted
{
  v2 = self;
  sub_1B5C9F7CC(256, 0x100000000, 0x100000000, 7300, 0);
}

- (void)interactedAtXPos:(float)a3 yPos:(float)a4
{
  uint64_t v4 = LODWORD(a3);
  uint64_t v5 = LODWORD(a4);
  id v6 = self;
  sub_1B5C9F7CC(256, v4, v5, 7300, 0);
}

- (void)interactedWithElementID:(unsigned __int8)a3 atXPos:(float)a4 yPos:(float)a5
{
  __int16 v5 = a3;
  uint64_t v6 = LODWORD(a4);
  uint64_t v7 = LODWORD(a5);
  Swift::String v8 = self;
  sub_1B5C9F7CC(v5, v6, v7, 7300, 0);
}

- (void)interactedWithType:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5C9F7CC(256, 0x100000000, 0x100000000, a3, 0);
}

- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5C9FE94(a3, 0);
}

- (void)userReturnedFromInteractionWithIsVoiceOverEnabled:(BOOL)a3 ignoreVisibilityState:(BOOL)a4
{
  uint64_t v6 = self;
  sub_1B5C9FE94(a3, a4);
}

- (void)adMarkerInteracted
{
  v2 = self;
  sub_1B5C9F7CC(256, 0x100000000, 0x100000000, 7302, 0);
}

- (void)getAppWithButtonState:(int64_t)a3 timeToPreviousInstall:(int64_t)a4
{
  __int16 v5 = self;
  sub_1B5CA5444(a3);
}

- (void)exceededContainer
{
  v2 = self;
  unint64_t v3 = sub_1B5C9B1F8();
  sub_1B5C9C2B4(77004, -1, 0, v3);

  swift_bridgeObjectRelease();
}

- (void)contentLoadFailure
{
  v2 = self;
  sub_1B5CA06EC();
}

- (void)addUnfilledReason:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1B5CA0BDC(a3);
}

- (_TtC15PromotedContent20JourneyMetricsHelper)init
{
  result = (_TtC15PromotedContent20JourneyMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateElementsShownWithShown:(id)a3 partiallyShown:(id)a4
{
  uint64_t v5 = sub_1B5CB34C0();
  uint64_t v6 = sub_1B5CB34C0();
  uint64_t v7 = self;
  JourneyMetricsHelper.updateElementsShown(shown:partiallyShown:)((Swift::OpaquePointer)v5, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)debugging
{
  v2 = self;
  id v3 = [(JourneyMetricsHelper *)v2 debugDescription];
  sub_1B5CB33C0();

  uint64_t v4 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return v4;
}

@end