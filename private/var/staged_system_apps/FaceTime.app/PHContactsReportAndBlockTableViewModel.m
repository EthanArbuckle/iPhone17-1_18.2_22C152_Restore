@interface PHContactsReportAndBlockTableViewModel
- (BOOL)shouldShowBlockAll;
- (BOOL)shouldShowBlockUnknown;
- (BOOL)shouldShowReportInitiator;
- (CHRecentCall)recentCall;
- (NSString)formattedInitiatorValue;
- (PHContactsReportAndBlockTableViewModel)init;
- (PHContactsReportAndBlockTableViewModel)initWithShouldShowBlockAll:(BOOL)a3 shouldShowReportInitiator:(BOOL)a4 shouldShowBlockUnknown:(BOOL)a5 recentCall:(id)a6 reportSpammer:(id)a7;
- (_TtP8FaceTime18ReportSpamManaging_)reportSpammer;
- (int64_t)numberOfSections;
- (void)blockContacts:(id)a3;
- (void)reportWithRecentCall:(id)a3;
- (void)setRecentCall:(id)a3;
- (void)setReportSpammer:(id)a3;
- (void)setShouldShowBlockAll:(BOOL)a3;
- (void)setShouldShowBlockUnknown:(BOOL)a3;
- (void)setShouldShowReportInitiator:(BOOL)a3;
- (void)unblockWithContacts:(id)a3;
@end

@implementation PHContactsReportAndBlockTableViewModel

- (BOOL)shouldShowBlockAll
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll);
}

- (void)setShouldShowBlockAll:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll) = a3;
}

- (BOOL)shouldShowReportInitiator
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator);
}

- (void)setShouldShowReportInitiator:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator) = a3;
}

- (BOOL)shouldShowBlockUnknown
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown);
}

- (void)setShouldShowBlockUnknown:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown) = a3;
}

- (CHRecentCall)recentCall
{
  return (CHRecentCall *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall));
}

- (void)setRecentCall:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall) = (Class)a3;
  id v3 = a3;
}

- (_TtP8FaceTime18ReportSpamManaging_)reportSpammer
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP8FaceTime18ReportSpamManaging_ *)v2;
}

- (void)setReportSpammer:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_reportSpammer) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (PHContactsReportAndBlockTableViewModel)initWithShouldShowBlockAll:(BOOL)a3 shouldShowReportInitiator:(BOOL)a4 shouldShowBlockUnknown:(BOOL)a5 recentCall:(id)a6 reportSpammer:(id)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown) = a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_recentCall) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_reportSpammer) = (Class)a7;
  v16.receiver = self;
  v16.super_class = ObjectType;
  id v14 = a6;
  swift_unknownObjectRetain();
  return [(PHContactsReportAndBlockTableViewModel *)&v16 init];
}

- (int64_t)numberOfSections
{
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockAll) & 1) != 0
    || *((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowBlockUnknown) == 1)
  {
    return 2;
  }
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___PHContactsReportAndBlockTableViewModel_shouldShowReportInitiator)) {
    return 2;
  }
  return 1;
}

- (void)blockContacts:(id)a3
{
}

- (void)unblockWithContacts:(id)a3
{
}

- (void)reportWithRecentCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004B0C8(v4);
}

- (NSString)formattedInitiatorValue
{
  return (NSString *)sub_10004C268(self, (uint64_t)a2, (void (*)(void))sub_10004B2D8);
}

- (PHContactsReportAndBlockTableViewModel)init
{
  result = (PHContactsReportAndBlockTableViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end