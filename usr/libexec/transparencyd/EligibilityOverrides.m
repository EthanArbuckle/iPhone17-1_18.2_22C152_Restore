@interface EligibilityOverrides
- (_TtC13transparencyd20EligibilityOverrides)init;
- (void)clearEligibilityOverrides;
- (void)setHasDoneOSUpdateWithValue:(BOOL)a3;
- (void)setLastIDSRecWithRecommendation:(BOOL)a3;
@end

@implementation EligibilityOverrides

- (_TtC13transparencyd20EligibilityOverrides)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd20EligibilityOverrides_lastIDSRec) = 2;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd20EligibilityOverrides_hasDoneOSUpdate) = 2;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd20EligibilityOverrides_overrideReportStatus) = 2;
  v2 = (char *)self + OBJC_IVAR____TtC13transparencyd20EligibilityOverrides_overrideTimeBetweenReports;
  *(void *)v2 = 0;
  v2[8] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EligibilityOverrides();
  return [(EligibilityOverrides *)&v4 init];
}

- (void)clearEligibilityOverrides
{
  v2 = *(void (**)(uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x78);
  v3 = self;
  v2(2);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0x90))(2);
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0xA8))(2);
  (*(void (**)(void, uint64_t))((swift_isaMask & (uint64_t)v3->super.isa) + 0xC0))(0, 1);
}

- (void)setLastIDSRecWithRecommendation:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x78);
  v5 = self;
  v4(v3);
}

- (void)setHasDoneOSUpdateWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x90);
  v5 = self;
  v4(v3);
}

@end