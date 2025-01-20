@interface TPTipsHelper_Swift
+ (void)didDisplayCallHistorySearchTip;
+ (void)donateEventCalledNonContact;
+ (void)donateEventCalledNonFavContact;
+ (void)donateEventCreatedFacetimeLink;
+ (void)donateEventKnownCallersDone;
+ (void)donateEventKnownStoryLaunched;
+ (void)donateEventOriginatedCallWithSiri;
+ (void)donateEventSavedNumber;
+ (void)donateEventSearchedCallHistory;
+ (void)donateEventSpeakerUsed;
+ (void)updateCanDisplayCallHistorySearchTip:(BOOL)a3;
- (TPTipsHelper_Swift)init;
- (UIViewController)popoverController;
- (void)setPopoverController:(id)a3;
@end

@implementation TPTipsHelper_Swift

- (UIViewController)popoverController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setPopoverController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

+ (void)donateEventKnownStoryLaunched
{
}

+ (void)donateEventKnownCallersDone
{
}

+ (void)donateEventSavedNumber
{
  RecentsSaveAsContactTip.init()();
  uint64_t v2 = sub_1C2F6E1C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F42298], v2);
  sub_1C2F578A4();
  sub_1C2F6E088();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v6 = sub_1C2F5A2F8();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
  sub_1C2F6E2C8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

+ (void)donateEventCalledNonFavContact
{
}

+ (void)donateEventCalledNonContact
{
}

+ (void)donateEventOriginatedCallWithSiri
{
}

+ (void)donateEventCreatedFacetimeLink
{
}

+ (void)donateEventSearchedCallHistory
{
  sub_1C2F5EA60(0);
  uint64_t v2 = sub_1C2F5E1DC();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, v3);
  sub_1C2F6E2C8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (void)updateCanDisplayCallHistorySearchTip:(BOOL)a3
{
}

+ (void)didDisplayCallHistorySearchTip
{
}

- (TPTipsHelper_Swift)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPTipsHelper_Swift_popoverController) = 0;
  uint64_t v3 = OBJC_IVAR___TPTipsHelper_Swift_entries;
  uint64_t v4 = MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1C2F57360(MEMORY[0x1E4FBC860]);
  uint64_t v5 = OBJC_IVAR___TPTipsHelper_Swift_currentTip;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1C2F57464(v4);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TPTipsHelper();
  return [(TPTipsHelper_Swift *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)donateEventSpeakerUsed
{
  if ((byte_1EA3448E8 & 1) == 0)
  {
    SpeakerphoneTip.init()();
    uint64_t v0 = sub_1C2F6E1C8();
    uint64_t v1 = *(void *)(v0 - 8);
    MEMORY[0x1F4188790](v0);
    uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F42298], v0);
    sub_1C2F58954();
    sub_1C2F6E088();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v4 = sub_1C2F59A98();
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3430B0);
    uint64_t v6 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v5);
    uint64_t v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4, v5);
    sub_1C2F6E2C8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    byte_1EA3448E8 = 1;
    objc_msgSend(self, sel_logAnalyticsEventSpeakerphone);
  }
}

@end