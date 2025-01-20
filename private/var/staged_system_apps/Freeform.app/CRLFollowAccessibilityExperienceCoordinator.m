@interface CRLFollowAccessibilityExperienceCoordinator
+ (NSString)magicTapInstruction;
- (BOOL)requestPauseFollow;
- (BOOL)requestRefollowLastFollowedParticipant;
- (NSString)crlaxInstructions;
- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator;
- (_TtC8Freeform27CRLCollaborationParticipant)lastFollowedParticipant;
- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)init;
- (id)initFor:(id)a3;
- (id)makeAccessibilityHistoryActionsFor:(id)a3;
- (void)accessibilityStatusDidChange;
- (void)dealloc;
- (void)prepareForViewportChange;
- (void)registerHost:(id)a3 andFocus:(BOOL)a4;
- (void)setFollowCoordinator:(id)a3;
- (void)setLastFollowedParticipant:(id)a3;
- (void)submitEventForEditOf:(id)a3;
- (void)submitEventForSelectionOf:(id)a3;
@end

@implementation CRLFollowAccessibilityExperienceCoordinator

- (id)initFor:(id)a3
{
  return sub_100B25958(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_100B25BD8();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_mostRecentViewportState, &qword_101681D50);
  sub_100522F00((uint64_t)self+ OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_mostRecentAnnouncedViewportState, &qword_101681D50);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_hosts));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_viewportChangeDebounceTimer));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator_voiceOverRepRefocusTimer);
}

- (_TtC8Freeform20CRLFollowCoordinator)followCoordinator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform20CRLFollowCoordinator *)Strong;
}

- (void)setFollowCoordinator:(id)a3
{
}

- (_TtC8Freeform27CRLCollaborationParticipant)lastFollowedParticipant
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform27CRLCollaborationParticipant *)Strong;
}

- (void)setLastFollowedParticipant:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100B25E88(a3);
}

- (void)registerHost:(id)a3 andFocus:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100B25FB8(v6, a4);
}

- (void)submitEventForSelectionOf:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100B26C8C(v4);
}

- (void)submitEventForEditOf:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100B26F84(v4);
}

- (BOOL)requestPauseFollow
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = self;
    sub_1007ECB48(1);
  }
  return Strong != 0;
}

- (BOOL)requestRefollowLastFollowedParticipant
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  id v4 = (void *)Strong;
  uint64_t v5 = swift_unknownObjectWeakLoadStrong();
  BOOL v6 = v5 != 0;
  if (v5)
  {
    v7 = (void *)v5;
    v8 = self;
    sub_1007EDEA4(v7, 0);
  }
  return v6;
}

- (id)makeAccessibilityHistoryActionsFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100B27438(v4);

  sub_10050BF48(0, &qword_10167AE48);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

+ (NSString)magicTapInstruction
{
  if (qword_10166F918 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)crlaxInstructions
{
  NSString v2 = self;
  sub_100B28A10();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)prepareForViewportChange
{
  NSString v2 = self;
  sub_100B28DF8();
}

- (void)accessibilityStatusDidChange
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  if ([v3 isVoiceOverOrSwitchControlEnabled]) {
    sub_100B265C0();
  }
  else {
    sub_100B26A94();
  }
}

- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)init
{
  result = (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end